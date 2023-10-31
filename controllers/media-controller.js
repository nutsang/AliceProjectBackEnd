const mediaModel = require('../models/media-model')

exports.getMedia = (request, response) => {
    mediaModel.getMedia(request, response)
}

exports.getEpisode = (request, response) => {
    mediaModel.getEpisode(request, response)
}

exports.getGenre = (request, response) => {
    mediaModel.getGenre(request, response)
}

exports.getPopularity = (request, response) => {
    mediaModel.getPopularity(request, response)
}

exports.setPopularity = (request, response) => {
    mediaModel.setPopularity(request, response)
}