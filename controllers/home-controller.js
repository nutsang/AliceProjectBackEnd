const homeModel = require('../models/home-model')

exports.getMedia = (request, response) => {
    homeModel.getMedia(request, response)
}