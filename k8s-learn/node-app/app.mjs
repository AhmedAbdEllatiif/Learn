import os from  'os'
import express from  'express'


const app = express()


app.get('/', (req, res) => {
  const message = `Hello World: I'm pod ${os.hostname} `
  res.send(message)
})

app.listen(4000, () => {
  console.log('listening for requests on port 4000')
})