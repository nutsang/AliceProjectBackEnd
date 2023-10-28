const express = require('express')
const router = express.Router()
const { ValidationAccount, SignUpAccount} = require('../controllers/sign-up-controller')

router.post('/sign-up', SignUpAccount)
router.post('/sign-up-validation', ValidationAccount)

module.exports = router