const friendsModel = require('../models/friends-model')

exports.getOther = (request, response) => {
    friendsModel.getOther(request, response)
}

exports.getRequest = (request, response) => {
    friendsModel.getRequest(request, response)
}

exports.getListFriends = (request, response) => {
    friendsModel.getListFriends(request, response)
}

exports.getFriend = (request, response) => {
    friendsModel.getFriend(request, response)
}

exports.addFriend = (request, response) => {
    friendsModel.addFriend(request, response)
}

exports.ignoreFriend = (request, response) => {
    friendsModel.ignoreFriend(request, response)
}

exports.acceptFriend = (request, response) => {
    friendsModel.acceptFriend(request, response)
}

exports.unFriend = (request, response) => {
    friendsModel.unFriend(request, response)
}