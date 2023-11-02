const express = require('express')
const router = express.Router()
const { GetPreference, GetPreferenceFriend, AddPreference, DeletePreference, PublicPreference, PrivatePreference} = require('../controllers/preference-controller')

router.get('/preference', GetPreference)
router.get('/preference-friend/:friend_id', GetPreferenceFriend)
router.post('/preference', AddPreference)
router.delete('/preference', DeletePreference)
router.patch('/preference-public', PublicPreference)
router.patch('/preference-private', PrivatePreference)

module.exports = router