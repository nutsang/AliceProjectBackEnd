const connection = require('./connection')
const jsonwebtoken = require('jsonwebtoken')
const SECRET = process.env.SECRET

module.exports.signInAccount = (request, response) => {
    const { email } = request.body
    connection.query('SELECT lock_account, ban_account FROM account WHERE email = ? LIMIT 1',[email], (error, result) => {
        try{
            if(error) throw response.status(400)
            const lock_account = result[0].lock_account
            const ban_account = result[0].ban_account
            if(lock_account === 0){
                connection.query('UPDATE account SET login_count = 0, lock_account = 0 WHERE email = ? LIMIT 1',[email], (error) => {
                    try{
                        if(error) throw response.status(400)
                        const token = jsonwebtoken.sign({email: email}, SECRET)
                        response.status(200).json({token})
                    }catch{
                        response.json({status: false})
                    }
                })
            }else{
                if(Date.now() > ban_account){
                    connection.query('UPDATE account SET login_count = 0, lock_account = 0 WHERE email = ? LIMIT 1',[email], (error) => {
                        try{
                            if(error) throw response.status(400)
                            const token = jsonwebtoken.sign({email: email}, SECRET)
                            response.status(200).json({token})
                        }catch{
                            response.json({status: false})
                        }
                    })
                }else{
                    response.json({status: false})
                }
            }
        }catch{
            response.json({status: false})
        }
    })
}

module.exports.signInCountAccount = (request, response) => {
    const { email } = request.body
    connection.query('SELECT login_count, lock_account FROM account WHERE email = ? LIMIT 1',[email], (error, result) => {
        try{
            if(error) throw response.status(400)
            const login_count = result[0].login_count
            const lock_account = result[0].lock_account
            if(lock_account === 1){
                response.status(200).json({status: true})
            }else if(login_count === 2){
                connection.query('UPDATE account SET login_count = 0, lock_account = 1 , ban_account = (now() + INTERVAL 5 MINUTE) WHERE email = ? LIMIT 1',[email], (error) => {
                    try{
                        if(error) throw response.status(400)
                        response.status(200).json({status: true})
                    }catch{
                        response.json({status: false})
                    }
                })
            }else{
                connection.query('UPDATE account SET login_count = login_count + 1 WHERE email = ? LIMIT 1',[email], (error) => {
                    try{
                        if(error) throw response.status(400)
                        response.status(200).json({status: true})
                    }catch{
                        response.json({status: false})
                    }
                })
            }
        }catch{
            response.json({status: false})
        }
    })
}

module.exports.resetPasswordAccount = (request, response) => {
    const { email } = request.body
    connection.query('UPDATE account SET login_count = 0, lock_account = 0 WHERE email = ? LIMIT 1',[email], (error) => {
        try{
            if(error) throw response.status(400)
            response.status(200).json({status: true})
        }catch{
            response.status(200).json({status: false})
        }
    })
}

module.exports.AuthenticationAccount = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        response.status(200).json({decoded})
    } catch(error){
        throw response.status(404).json({message: error.message})
    }
}