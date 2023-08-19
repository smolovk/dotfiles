const net = require('net')

const server = net.createServer(s => {
    s.write("connected to PICONET server")
    s.on("data", data => {
        let dataObj = JSON.parse(data)
        console.log(dataObj.clientID)
        if(dataObj.bytes) {
            console.log("writing")
            dataObj.clientID = 1
            dataObj.bytes[0] = 0

            s.write(JSON.stringify(dataObj))
        } else {
            console.log(dataObj)
        }
    })
})
server.listen(2000)
