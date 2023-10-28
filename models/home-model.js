const connection = require('./connection')

module.exports.getMedia = (request, response) => {
    connection.query('SELECT COUNT(id) as media_amount FROM media', (error, result) => {
        if (error) throw response.status(400).json({message: 'แสดงข้อมูลล้มเหลว'})
        if (result[0].amount <= 0) throw response.status(400).json({message: 'แสดงข้อมูลล้มเหลว'})
        connection.query('SELECT media.*, COUNT(episode.id) as episode_amount FROM media LEFT JOIN episode ON media.id = episode.media_id GROUP BY media.id ORDER BY media.popularity DESC', (error, result) => {
            response.status(200).json(result)
        })
    })
}