const connection = require('./connection')

module.exports.getMedia = (request, response) => {
    connection.query('SELECT COUNT(id) as media_amount FROM media', (error, result) => {
        if (error) response.status(400).json({message: 'แสดงข้อมูลล้มเหลว'})
        if (result[0].amount <= 0) response.status(400).json({message: 'แสดงข้อมูลล้มเหลว'})
        
        connection.query('SELECT media.id, GROUP_CONCAT(DISTINCT media_genre.genre) AS genres FROM media LEFT JOIN media_genre ON media.id = media_genre.media_id GROUP BY media.id', (error, result) => {
            const genres = result
            connection.query('SELECT media.*, COUNT(episode.id) AS episode_amount FROM media LEFT JOIN episode ON media.id = episode.media_id GROUP BY media.id', (error, result) => {
                result.forEach(mediaItem => {
                    const matchingGenre = genres.find((genreItem) => {
                        return genreItem.id === mediaItem.id
                    })
                    if (matchingGenre && matchingGenre !== undefined) {
                        return mediaItem.genres = matchingGenre.genres
                    }else{
                        return mediaItem.genres = null
                    }
                })
                response.status(200).json(result)
            })
        })
    })
}