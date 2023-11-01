const express = require('express')
const router = express.Router()
const { getAccount, updateUsernameAccount } = require('../controllers/edit-account-controller')

router.get('/edit-account', getAccount)
router.patch('/edit-account-username', updateUsernameAccount)

module.exports = router