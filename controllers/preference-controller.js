const preferenceModel = require('../models/preference-model')

exports.GetPreference = (request, response) => {
    preferenceModel.GetPreference(request, response)
}

exports.GetPreferenceFriend = (request, response) => {
    preferenceModel.GetPreferenceFriend(request, response)
}

exports.AddPreference = (request, response) => {
    preferenceModel.AddPreference(request, response)
}

exports.DeletePreference = (request, response) => {
    preferenceModel.DeletePreference(request, response)
}

exports.PublicPreference = (request, response) => {
    preferenceModel.PublicPreference(request, response)
}

exports.PrivatePreference = (request, response) => {
    preferenceModel.PrivatePreference(request, response)
}