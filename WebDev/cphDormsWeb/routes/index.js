// Full Documentation - https://docs.turbo360.co
const express = require('express')
const router = express.Router()



/*  This is the home route. It renders the index.mustache page from the views directory.
  Data is rendered using the Mustache templating engine. For more
  information, view here: https://mustache.github.io/#demo */
router.get('/tietgen', (req, res) => {
  res.render('tietgen')
})

/*  This route render json data */
router.get('/json', (req, res) => {
  res.json({
    confirmation: 'success',
    app: process.env.TURBO_APP_ID,
    data: 'this is a sample json route.'
  })
})

router.get('/dorm/:dormUUID', (req, res) => {
  const uuid = req.params.dormUUID
  console.log('UUID: '+uuid)
  const dorm = getDormByUuid(req.app.get('kkik'),uuid)
  res.render('dorm_template', dorm)
})


router.get('/', (req, res) => {
  const kkik = req.app.get('kkik');
  console.log(kkik.length)
  const xvar = ['Dorm1', 'Dorm2']
  res.render('index', {dorms: kkik})
})


module.exports = router


function getDormByUuid(dorms, uuid) {
  for (dorm of dorms) {
    if (dorm.uuid == uuid) {
      return dorm
    }
  }
  return 0
}