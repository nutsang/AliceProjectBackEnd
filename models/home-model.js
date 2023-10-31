const connection = require('./connection')

module.exports.getMedia = (request, response) => {
    connection.query('SELECT COUNT(id) as media_amount FROM media', (error, result) => {
        if (error) response.status(400).json({message: 'แสดงข้อมูลล้มเหลว'})
        if (result[0].amount <= 0) response.status(400).json({message: 'แสดงข้อมูลล้มเหลว'})/*
        connection.query('SELECT genre FROM media_genre WHERE media_id = ?',[1], (error, result) => {
            response.status(200).json(result)
        })*/
        connection.query('SELECT media.*, GROUP_CONCAT(DISTINCT media_genre.genre ORDER BY media_genre.genre ASC) AS genres, COUNT(episode.id) AS episode_amount FROM media LEFT JOIN media_genre ON media.id = media_genre.media_id LEFT JOIN episode ON media.id = episode.media_id GROUP BY media.id, media.title ORDER BY media.popularity DESC', (error, result) => {
            response.status(200).json(result)
        })
        /*
        connection.query('SELECT media.*, COUNT(episode.id) as episode_amount FROM media LEFT JOIN episode ON media.id = episode.media_id GROUP BY media.id ORDER BY media.popularity DESC', (error, result) => {
            response.status(200).json(result)
        })*/
        
    })
}