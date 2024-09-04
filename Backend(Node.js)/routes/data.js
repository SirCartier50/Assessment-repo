const express = require('express')
const router = express.Router()
router.use(express.json())

let names ={1:"Sam"}

//GET route
router.get('/', (req, res) => {
    res.status(200).json({method:"GET", status:"200", content_type:"json", body: names})
})

//POST route
router.post('/', (req, res) => {
    if(Object.values(names).includes(req.body.name)){
        res.status(200).json({method:"POST", status:"200", content_type:"json", body: "already existed"})
    }else if (!req.body){
        res.status(400).json({method:"POST", status:"400", content_type:"json", body: "no body"})
    }else{
        names[Object.keys(names).length+1] = req.body.name
        res.status(201).json({method:"POST", status:"201", content_type:"json", body: "Created user " + req.body.name})
    }
})

//DELETE route
router.delete('/', (req, res) => {
    if(Object.values(names).includes(req.body.name)){
        const index = Object.keys(names).find(key => names[key] === req.body.name)
        delete names[index]
        res.status(200).json({method:"DELETE", status:"200", content_type:"json", body: "deleted user " + req.body.name})
    }else if (!req.body){
        res.status(400).json({method:"DELETE", status:"400", content_type:"json", body: "no body"})
    }else{
        res.status(404).json({method:"DELETE", status:"404", content_type:"json", body: "User doesn't exist"})
    }
})

module.exports = router