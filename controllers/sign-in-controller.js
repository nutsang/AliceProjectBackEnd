const signInModel = require('../models/sign-in-model')

exports.SignInAccount = (request, response) => {
    signInModel.signInAccount(request, response)
}

exports.SignInAuthenticationAccount = (request, response) => {
    signInModel.AuthenticationAccount(request, response)
}