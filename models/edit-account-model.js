const connection = require('./connection')
const jsonwebtoken = require('jsonwebtoken')
const SECRET = process.env.SECRET

module.exports.getAccount = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        const email = decoded.email
        connection.query('SELECT id, username FROM account WHERE email = ? LIMIT 1',[email], (error, result) => {
            try{
                if(error || result.length !== 1) throw response.status(400)
                response.status(200).json(result)
            }catch{
                response.json({status: false})
            }
        })
    } catch(error){
        throw response.status(404).json({message: error.message})
    }
}

module.exports.updateUsernameAccount = (request, response) => {
    const email = request.body.email
    const username = request.body.username
    connection.query('UPDATE account SET username = ? WHERE email = ? LIMIT 1',[username, email], (error) => {
        try{
            if(error) throw response.status(400)
            response.status(200).json({status: true})
        }catch{
            response.json({status: false})
        }
    })
}