// Full Documentation - https://docs.turbo360.co
const express = require('express')
const router = express.Router()



/*  This is the home route. It renders the index.mustache page from the views directory.
  Data is rendered using the Mustache templating engine. For more
  information, view here: https://mustache.github.io/#demo */
router.get('/tietgen', (req, res) => {
  const kkik = req.app.get('kkik');
  console.log(kkik)
  res.render('tietgen')
})

router.get('/', (req, res) => {
  res.render('index')
})

/*  This route render json data */
router.get('/json', (req, res) => {
  res.json({
    confirmation: 'success',
    app: process.env.TURBO_APP_ID,
    data: 'this is a sample json route.'
  })
})



module.exports = router
