const express = require('express')
const router = express.Router()
const { getMedia } = require('../controllers/home-controller')

router.get('/', getMedia)

module.exports = router