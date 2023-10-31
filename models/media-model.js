const connection = require('./connection')
const jsonwebtoken = require('jsonwebtoken')
const SECRET = process.env.SECRET

module.exports.getMedia = (request, response) => {
    const id = request.params.id
    connection.query('SELECT * FROM media WHERE id = ? LIMIT 1',[id], (error, result) => {
        try{
            if(error || result.length !== 1) throw response.status(400)
            response.status(200).json(result)
        }catch{
            response.json({status: false})
        }
    })
}

module.exports.getEpisode = (request, response) => {
    const id = request.params.id
    connection.query('SELECT * FROM episode WHERE media_id = ? ORDER BY episode_at ASC',[id], (error, result) => {
        try{
            if(error || result.length < 1) throw response.status(400)
            response.status(200).json({status: true, episode: result})
        }catch (error){
            response.json({status: false})
        }
    })
}

module.exports.getGenre = (request, response) => {
    const id = request.params.id
    connection.query('SELECT * FROM media_genre WHERE media_id = ? ORDER BY genre ASC',[id], (error, result) => {
        try{
            if(error || result.length < 1) throw response.status(400)
            response.status(200).json({status: true, genre: result})
        }catch (error){
            response.json({status: false})
        }
    })
}

module.exports.getPopularity = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const email = decoded.email
        const id = request.params.id
        connection.query('SELECT point FROM popularity WHERE account_email = ? AND media_id = ?',[email, id], (error, result) => {
            try{
                if(error || result.length < 1) throw response.status(400)
                response.status(200).json({status: true, result})
            }catch (error){
                response.json({status: false})
            }
        })
    } catch(error){
        throw response.status(404).json({message: error.message})
    }
}

module.exports.setPopularity = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const email = decoded.email
        const id = request.params.id
        const point = request.body.point
        connection.query('SELECT point FROM popularity WHERE account_email = ? AND media_id = ? LIMIT 1',[email, id], (error, result) => {
            if(error) response.status(400).json({message: error.message})
            if(result.length < 1){
                connection.query('INSERT INTO popularity (account_email, media_id, point) VALUES (?, ?, ?)', [email, id, point], (error) => {
                    if (error) response.status(400).json({message: 'เพิ่มคะแนนความนิยมล้มเหลว'})
                    connection.query('UPDATE media SET popularity = popularity + ? WHERE id = ?', [point, id], (error) => {
                        if (error) response.status(400).json({message: error})
                        response.status(201).json({message: 'เพิ่มคะแนนความนิยมสำเร็จ'})
                    })
                })
            }else{
                const old_point = point + result[0].point
                connection.query('UPDATE popularity SET point = ? WHERE account_email = ? AND media_id = ?', [point, email, id], (error) => {
                    connection.query('SELECT point FROM popularity WHERE account_email = ? AND media_id = ? LIMIT 1',[email, id], (error, result) => {
                        const new_point = point + result[0].point
                        if (error) response.status(400).json({message: 'เพิ่มคะแนนความนิยมล้มเหลว'})
                        connection.query('UPDATE media SET popularity = (popularity - ?) + ? WHERE id = ?', [old_point, new_point, id], (error) => {
                            if (error) response.status(400).json({message: error})
                            response.status(200).json({message: 'เพิ่มคะแนนความนิยมสำเร็จ'})
                        })
                    })
                }) 
            }
        })
    } catch(error){
        throw response.status(404).json({message: error.message})
    }
}