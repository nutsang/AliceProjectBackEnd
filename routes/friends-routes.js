const express = require('express')
const router = express.Router()
const { getOther, getRequest, getListFriends, addFriend, ignoreFriend, acceptFriend, unFriend } = require('../controllers/friends-controller')

router.get('/search-friends', getOther)
router.get('/request-friends', getRequest)
router.get('/list-friends', getListFriends)
router.post('/add-friends', addFriend)
router.delete('/ignore-friends', ignoreFriend)
router.delete('/accept-friends', acceptFriend)
router.delete('/un-friends', unFriend)

module.exports = router