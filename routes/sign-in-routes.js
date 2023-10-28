const express = require('express')
const router = express.Router()
const { SignInAccount, SignInAuthenticationAccount } = require('../controllers/sign-in-controller')

router.post('/sign-in', SignInAccount)
router.post('/sign-in-authentication', SignInAuthenticationAccount)

module.exports = router