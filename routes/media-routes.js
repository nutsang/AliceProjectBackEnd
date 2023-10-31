const express = require('express')
const router = express.Router()
const { getMedia, getEpisode, getGenre, getPopularity, setPopularity } = require('../controllers/media-controller')

router.get('/media/:id/:linked_to', getMedia)
router.get('/genre/:id', getGenre)
router.get('/episode/:id', getEpisode)
router.get('/popularity/:id', getPopularity)
router.post('/popularity/:id', setPopularity)

module.exports = router