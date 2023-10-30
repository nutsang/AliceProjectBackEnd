const preferenceModel = require('../models/preference-model')

exports.GetPreference = (request, response) => {
    preferenceModel.GetPreference(request, response)
}

exports.AddPreference = (request, response) => {
    preferenceModel.AddPreference(request, response)
}

exports.DeletePreference = (request, response) => {
    preferenceModel.DeletePreference(request, response)
}