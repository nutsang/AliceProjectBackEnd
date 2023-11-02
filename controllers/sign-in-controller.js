const signInModel = require('../models/sign-in-model')

exports.SignInAccount = (request, response) => {
    signInModel.signInAccount(request, response)
}

exports.SignInCountAccount = (request, response) => {
    signInModel.signInCountAccount(request, response)
}

exports.ResetPasswordAccount = (request, response) => {
    signInModel.resetPasswordAccount(request, response)
}

exports.SignInAuthenticationAccount = (request, response) => {
    signInModel.AuthenticationAccount(request, response)
}