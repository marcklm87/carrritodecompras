var jwt = require('jsonwebtoken');
require('dotenv').config()

function verifyToken(req, res, next){
    const bearerHeader =  req.headers['authorization'];

    if(typeof bearerHeader !== 'undefined'){
        const bearerToken = bearerHeader.split(" ")[1];
        req.token  = bearerToken;
        jwt.verify(bearerToken, process.env.PRIVATE_KEY_JWT, (error, authData) => {
        if(error){
            // res.sendStatus(403);
            res.status(403).send( {
                message: 'Invalid token',
                sessionExpired: false
            });
        }
        });
        next();
    }else{
        res.status(403).send( {
            message: 'Unauthorized',
            sessionExpired: false
        });
    }
}

function sessionData (req) {
    let sessionId = null
    let userId = null
    try {
        const bearerHeader =  req.headers['authorization'];
        if(typeof bearerHeader !== 'undefined'){
            const bearerToken = bearerHeader.split(" ")[1];
            const data = jwt.verify(bearerToken, process.env.PRIVATE_KEY_JWT)
            sessionId = data.sessionId
            userId = data.userId
        }
    } catch (error) {
        console.log('error=>', error)
    }
   return { sessionId, userId }
}

module.exports = {
    verifyToken,
    sessionData
}