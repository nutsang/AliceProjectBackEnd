const connection = require('./connection')
const jsonwebtoken = require('jsonwebtoken')
const SECRET = process.env.SECRET

module.exports.getFriend = (request, response) => {
    try{
        console.log(request.body)
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const friend_id = request.body.friend_id
        connection.query('SELECT username FROM account WHERE id = ? LIMIT 1',[friend_id], (error, result) => {
            try{
                if(error || result.length !== 1) throw response.status(400).json({status: false})
                response.status(200).json({status: true, result})
            }catch{
                response.status(400).json({status: false})
            }
        })
    } catch(error){
        response.status(400).json({message: error.message})
    }
}

module.exports.getOther = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const email = decoded.email
        connection.query('SELECT id FROM account WHERE email = ?',[email], (error, result) => {
            try{
                if(error || result.length !== 1) throw response.status(400).json({status: false})
                const account_id = result[0].id
                connection.query('SELECT friend_id FROM friends WHERE friends.account_id = ? UNION SELECT friend_id FROM request WHERE request.account_id = ?',[account_id, account_id], (error, result) => {
                    try{
                        if(error) throw response.status(400).json({status: false})
                        const friend_id = result.map(friend => friend.friend_id)
                        if(result.length < 1){
                            connection.query('SELECT * FROM account WHERE id != ?',[account_id], (error, result) => {
                                try{
                                    if(error) throw response.status(400).json({status: false})
                                    response.status(200).json(result)
                                }catch{
                                    response.status(400).json({status: false})
                                }
                            })
                        }else{
                            connection.query('SELECT * FROM account WHERE id != ? AND id NOT IN (?)',[account_id, friend_id], (error, result) => {
                                try{
                                    if(error) throw response.status(400).json({status: false})
                                    response.status(200).json(result)
                                }catch{
                                    response.status(400).json({status: false})
                                }
                            })
                        }
                    }catch{
                        response.status(400).json({status: false})
                    }
                })
            }catch{
                response.status(400).json({status: false})
            }
        })
    } catch(error){
        response.status(400).json({message: error.message})
    }
}

module.exports.getListFriends = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const email = decoded.email
        connection.query('SELECT id FROM account WHERE email = ? LIMIT 1',[email], (error, result) => {
            try{
                if(error || result.length !== 1) response.status(400)
                const account_id = result[0].id
                connection.query('SELECT friends.friend_id, account.username FROM friends LEFT JOIN account ON account.id = friends.friend_id WHERE friends.account_id = ?',[account_id], (error, result) => {
                    try{
                        if(error || result.length < 1) response.status(400)
                        response.status(200).json(result)
                    }catch{
                        response.json({status: false})
                    }
                })
            }catch{
                response.json({status: false})
            }
        })
    } catch(error){
        response.status(400).json({message: false})
    }
}

module.exports.getRequest = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const email = decoded.email
        connection.query('SELECT id FROM account WHERE email = ? LIMIT 1',[email], (error, result) => {
            try{
                if(error || result.length !== 1) response.status(400)
                const account_id = result[0].id
                connection.query('SELECT request.account_id as friend_id, account.username FROM request LEFT JOIN account ON account.id = request.account_id WHERE request.friend_id = ? ',[account_id], (error, result) => {
                    try{
                        if(error || result.length < 1) response.status(400)
                        response.status(200).json(result)
                    }catch{
                        response.json({status: false})
                    }
                })
                
            }catch{
                response.json({status: false})
            }
        })
    } catch(error){
        response.status(400).json({message: false})
    }
}

module.exports.addFriend = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const email = decoded.email
        connection.query('SELECT id FROM account WHERE email = ? LIMIT 1',[email], (error, result) => {
            try{
                if(error || result.length !== 1) response.status(400).json({status: false})
                const account_id = result[0].id
                if(account_id === request.body.id) response.status(400).json({status: false})
                connection.query('SELECT id, username FROM account WHERE id = ? LIMIT 1',[request.body.id], (error, result) => {
                    if(error || result.length !== 1) response.status(400).json({status: false})
                    const friend_id = result[0].id
                    const username = result[0].username
                    connection.query('INSERT INTO request (friend_id, account_id) VALUES (?, ?)',[friend_id, account_id], (error, result) => {
                        response.status(201).json({status: true, account:[friend_id, username]})
                    })
                })
            }catch{
                response.status(400).json({status: false})
            }
        })
    } catch(error){
        response.status(400).json({message: error.message})
    }
}

module.exports.ignoreFriend = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const email = decoded.email
        connection.query('SELECT id FROM account WHERE email = ? LIMIT 1',[email], (error, result) => {
            try{
                if(error || result.length !== 1) response.status(400).json({status: false})
                const account_id = result[0].id
                connection.query('SELECT id, username FROM account WHERE id = ? LIMIT 1',[request.body.id], (error, result) => {
                    if(error || result.length !== 1) response.status(400).json({status: false})
                    const friend_id = result[0].id
                    const username = result[0].username
                    connection.query('DELETE FROM request WHERE account_id = ? AND friend_id = ?',[friend_id, account_id], (error) => {
                        if(error) response.status(400).json({status: false})
                        response.status(201).json({status: true, account:[friend_id, username]})
                    })
                })
            }catch{
                response.status(400).json({status: false})
            }
        })
    } catch(error){
        response.status(400).json({message: error.message})
    }
}

module.exports.acceptFriend = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const email = decoded.email
        connection.query('SELECT id FROM account WHERE email = ? LIMIT 1',[email], (error, result) => {
            try{
                if(error || result.length !== 1) response.status(400).json({status: false})
                const account_id = result[0].id
                connection.query('SELECT id, username FROM account WHERE id = ? LIMIT 1',[request.body.id], (error, result) => {
                    if(error || result.length !== 1) response.status(400).json({status: false})
                    const friend_id = result[0].id
                    const username = result[0].username
                    connection.query('INSERT INTO friends (account_id, friend_id) VALUES (?, ?)',[account_id, friend_id], (error) => {
                        if(error) response.status(400).json({status: false})
                        connection.query('INSERT INTO friends (account_id, friend_id) VALUES (?, ?)',[friend_id, account_id], (error) => {
                            if(error) response.status(400).json({status: false})
                            connection.query('DELETE FROM request WHERE account_id = ? AND friend_id = ? OR friend_id = ? AND account_id = ?',[account_id, friend_id, account_id, friend_id], (error) => {
                                if(error) response.status(400).json({status: false})
                                response.status(201).json({status: true, account:[friend_id, username]})
                            })
                        })
                    })
                })
            }catch{
                response.status(400).json({status: false})
            }
        })
    } catch(error){
        response.status(400).json({message: error.message})
    }
}

module.exports.unFriend = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const email = decoded.email
        connection.query('SELECT id FROM account WHERE email = ? LIMIT 1',[email], (error, result) => {
            try{
                if(error || result.length !== 1) response.status(400).json({status: false})
                const account_id = result[0].id
                connection.query('SELECT id, username FROM account WHERE id = ? LIMIT 1',[request.body.id], (error, result) => {
                    if(error || result.length !== 1) response.status(400).json({status: false})
                    const friend_id = result[0].id
                    const username = result[0].username
                    connection.query('DELETE FROM friends WHERE account_id = ? AND friend_id = ? OR account_id = ? AND friend_id = ?',[account_id, friend_id , friend_id, account_id], (error) => {
                        if(error) response.status(400).json({status: false})
                        response.status(201).json({status: true, account:[friend_id, username]})
                    })
                })
            }catch{
                response.status(400).json({status: false})
            }
        })
    } catch(error){
        response.status(400).json({message: error.message})
    }
}