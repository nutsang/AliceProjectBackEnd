const editAccountModel = require('../models/edit-account-model')

exports.getAccount = (request, response) => {
    editAccountModel.getAccount(request, response)
}

exports.updateUsernameAccount = (request, response) => {
    editAccountModel.updateUsernameAccount(request, response)
}