const cors = require('cors')
const express = require('express')
const morgan = require('morgan')
const dotenv = require('dotenv')
dotenv.config({ path: 'server.env'})
const homeRoute = require('./routes/home-routes')
const signUpRoute = require('./routes/sign-up-routes')
const signInRoute = require('./routes/sign-in-routes')
const app = express()

//middleware
app.use(express.json())
app.use(cors())
app.use(morgan('dev'))

//routes
app.use('/api', homeRoute)
app.use('/api', signUpRoute)
app.use('/api', signInRoute)

const port = process.env.PORT || 8080
app.listen(port, () => {
    console.log(`server at http://localhost:${port}/`)
})