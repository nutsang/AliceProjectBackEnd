const { request, response } = require('express')
const connection = require('./connection')

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