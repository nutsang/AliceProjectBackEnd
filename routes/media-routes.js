const express = require('express')
const router = express.Router()
const { getMedia, getEpisode } = require('../controllers/media-controller')

router.get('/media/:id/:linked_to', getMedia)
router.get('/episode/:id', getEpisode)

module.exports = router