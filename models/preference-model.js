const jsonwebtoken = require('jsonwebtoken')
const SECRET = process.env.SECRET
const connection = require('./connection')

module.exports.GetPreference = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        connection.query('SELECT uid FROM account WHERE email = ? LIMIT 1',[decoded.email], (error, result) => {
            try{
                if (error) response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'})
                const account_uid = result[0].uid
                connection.query('SELECT media_id FROM preference WHERE account_uid = ? ',[account_uid], (error, result) => {
                    if (error) response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'})
                    const media_id = result.map(preference => preference.media_id)
                    connection.query('SELECT media.*, COUNT(episode.id) as episode_amount, preference.public FROM media LEFT JOIN episode ON media.id = episode.media_id LEFT JOIN preference ON media.id = preference.media_id AND preference.account_uid = ? WHERE media.id IN (?) GROUP BY media.id, media.title, preference.public',[account_uid, media_id], (error, result) => {
                        if (error) response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'})
                        console.log(result)
                        response.status(200).json(result)
                    })
                })
            } catch(error) { response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'}) }
        })
    } catch(error){ response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'}) }
}

module.exports.GetPreferenceFriend = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const friend_id = request.params.friend_id
        connection.query('SELECT uid FROM account WHERE id = ? LIMIT 1',[friend_id], (error, result) => {
            
            if (error) response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'})
            const account_uid = result[0].uid
            connection.query('SELECT media_id FROM preference WHERE account_uid = ? AND public = 1',[account_uid], (error, result) => {
                if (error) response.status(400).json({message: 'การแสดงรายการโปรดล้มเหลว'})
                const media_id = result.map(preference => preference.media_id)
                connection.query('SELECT media.*, COUNT(episode.id) as episode_amount, preference.public FROM media LEFT JOIN episode ON media.id = episode.media_id LEFT JOIN preference ON media.id = preference.media_id AND preference.account_uid = ? WHERE media.id IN (?) GROUP BY media.id, media.title, preference.public',[account_uid, media_id], (error, result) => {
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
                connection.query('UPDATE media SET preference = preference + 1, updated_at = CURRENT_TIMESTAMP WHERE id = ?',[media_id], (error, result) => {
                    if (error) response.status(400).json({message: 'การเพิ่มรายการโปรดล้มเหลว'})
                    response.status(201).json({message: 'การเพิ่มรายการโปรดสำเร็จ'})
                })
            })
        })

    } catch(error){ response.status(400).json({message: 'การเพิ่มรายการโปรดล้มเหลว'}) }
}

module.exports.DeletePreference = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        connection.query('SELECT uid FROM account WHERE email = ? LIMIT 1',[decoded.email], (error, result) => {
            if (error) response.status(400).json({message: 'ลบรายการโปรดล้มเหลว'})
            const account_uid = result[0].uid
            const media_id = request.body.id
            connection.query('DELETE FROM preference WHERE account_uid = ? AND media_id = ?',[account_uid, media_id], (error) => {
                if (error) response.status(400).json({message: 'ลบรายการโปรดล้มเหลว'})
                connection.query('UPDATE media SET preference = preference - 1, updated_at = CURRENT_TIMESTAMP WHERE id = ?',[media_id], (error, result) => {
                    if (error) response.status(400).json({message: 'ลบรายการโปรดล้มเหลว'})
                    response.status(200).json({message: 'ลบเพิ่มรายการโปรดสำเร็จ'})
                })
            })
        })
    } catch(error){ response.status(404).json({message: error.message}) }
}

module.exports.PublicPreference = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        connection.query('SELECT uid FROM account WHERE email = ? LIMIT 1',[decoded.email], (error, result) => {
            if (error) response.status(400).json({message: 'เปิดให้เป็นสาธารณะล้มเหลว'})
            const account_uid = result[0].uid
            const media_id = request.body.id
            connection.query('UPDATE preference SET public = 1 WHERE account_uid = ? AND media_id = ?',[account_uid, media_id], (error) => {
                if (error) response.status(400).json({message: 'เปิดให้เป็นสาธารณะล้มเหลว'})
                response.status(201).json({message: 'เปิดให้เป็นสาธารณะสำเร็จ'})
            })
        })
    } catch(error){ response.status(404).json({message: error.message}) }
}

module.exports.PrivatePreference = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        connection.query('SELECT uid FROM account WHERE email = ? LIMIT 1',[decoded.email], (error, result) => {
            if (error) response.status(400).json({message: 'เปิดให้เป็นส่วนตัวล้มเหลว'})
            const account_uid = result[0].uid
            const media_id = request.body.id
            connection.query('UPDATE preference SET public = 0 WHERE account_uid = ? AND media_id = ?',[account_uid, media_id], (error) => {
                if (error) response.status(400).json({message: 'เปิดให้เป็นส่วนตัวล้มเหลว'})
                response.status(201).json({message: 'เปิดให้เป็นส่วนตัวสำเร็จ'})
            })
        })
    } catch(error){ response.status(404).json({message: error.message}) }
}