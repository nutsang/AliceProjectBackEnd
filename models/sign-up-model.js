const connection = require('./connection')

module.exports.signUpAccount = (request, response) => {
    const { uid, userName, email } = request.body
    connection.query('INSERT INTO account (uid, username, email) VALUES (?, ?, ?)', [uid, userName, email], (error, result) => {
        if (error) throw response.status(409).json({message: 'การสร้างบัญชีล้มเหลว'})
        response.status(201).json({message: 'การสร้างบัญชีสำเร็จ'})
    })
}