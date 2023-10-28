const connection = require('./connection')
const jsonwebtoken = require('jsonwebtoken')
const SECRET = 'ALICEPROJECT2023'

module.exports.signInAccount = (request, response) => {
    const { email } = request.body
    const token = jsonwebtoken.sign({email: email}, SECRET)
    response.status(200).json({token})
}

module.exports.AuthenticationAccount = (request, response) => {
    try{
        const token = request.headers.authorization.split(' ')[1]
        const decoded = jsonwebtoken.verify(token, SECRET)
        response.status(200).json({decoded})
    } catch(error){
        throw response.status(400).json({message: error.message})
    }
}