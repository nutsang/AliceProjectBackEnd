const mediaModel = require('../models/media-model')

exports.getMedia = (request, response) => {
    mediaModel.getMedia(request, response)
}

exports.getEpisode = (request, response) => {
    mediaModel.getEpisode(request, response)
}