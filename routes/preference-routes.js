const express = require('express')
const router = express.Router()
const { GetPreference, AddPreference, DeletePreference} = require('../controllers/preference-controller')

router.get('/preference', GetPreference)
router.post('/preference', AddPreference)
router.delete('/preference', DeletePreference)

module.exports = router