const express = require('express')
const router = express.Router()
const { SignInAccount, SignInCountAccount, ResetPasswordAccount, SignInAuthenticationAccount } = require('../controllers/sign-in-controller')

router.post('/sign-in', SignInAccount)
router.patch('/sign-in', SignInCountAccount)
router.patch('/resetpassword', ResetPasswordAccount)
router.post('/sign-in-authentication', SignInAuthenticationAccount)

module.exports = router