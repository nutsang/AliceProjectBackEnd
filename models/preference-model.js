const jsonwebtoken = require('jsonwebtoken')
const SECRET = process.env.SECRET
const connection = require('./connection')

module.exports.GetPreference = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        connection.query('SELECT uid FROM account WHERE email = ? LIMIT 1',[decoded.email], (error, result) => {
            if (error) response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'})
            const account_uid = result[0].uid
            connection.query('SELECT media_id FROM preference WHERE account_uid = ? ',[account_uid], (error, result) => {
                if (error) response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'})
                const media_id = result.map(preference => preference.media_id)
                connection.query('SELECT media.*, COUNT(episode.id) as episode_amount, preference.public FROM media LEFT JOIN episode ON media.id = episode.media_id LEFT JOIN preference ON media.id = preference.media_id WHERE media.id IN (?) GROUP BY media.id, media.title, preference.public',[media_id], (error, result) => {
                    if (error) response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'})
                    response.status(200).json(result)
                })
            })
        })

    } catch(error){ response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'}) }
}

module.exports.AddPreference = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        connection.query('SELECT uid FROM account WHERE email = ? LIMIT 1',[decoded.email], (error, result) => {
            if (error) response.status(400).json({message: 'การเพิ่มรายการโปรดล้มเหลว'})
            const account_uid = result[0].uid
            const media_id = request.body.id
            connection.query('INSERT INTO preference (account_uid, media_id) VALUES (?, ?)',[account_uid, media_id], (error, result) => {
                if (error) response.status(400).json({message: 'การเพิ่มรายการโปรดล้มเหลว'})
                response.status(201).json({message: 'การเพิ่มรายการโปรดสำเร็จ'})
            })
        })

    } catch(error){ response.status(400).json({message: 'การเพิ่มรายการโปรดล้มเหลว'}) }
}

module.exports.DeletePreference = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        response.status(200).json({decoded})
    } catch(error){ response.status(404).json({message: error.message}) }
}