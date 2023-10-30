const express = require('express')
const router = express.Router()
const { GetPreference, AddPreference, DeletePreference, PublicPreference, PrivatePreference} = require('../controllers/preference-controller')

router.get('/preference', GetPreference)
router.post('/preference', AddPreference)
router.delete('/preference', DeletePreference)
router.patch('/preference-public', PublicPreference)
router.patch('/preference-private', PrivatePreference)

module.exports = router