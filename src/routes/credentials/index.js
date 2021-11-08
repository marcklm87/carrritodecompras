const  { Router } = require('express');
var jwt = require('jsonwebtoken');
const router = Router();
const db =  require('../../db')
require('dotenv').config()
const {verifyToken} = require('../main')


router.post('/login', async (req, res) => {
    try {
        const privateKey = process.env.PRIVATE_KEY_JWT
        const data = await db.sequelize.query(`SELECT 
                                u.id 
                            FROM 
                                user u 
                            WHERE 
                                u.email ='${req.body.email}' 
                                and u.password ='${req.body.contrasena}'`, 
                            { type: db.sequelize.QueryTypes.SELECT});

        if(data.length > 0){
            const dataLogin = (await db.login_attempts.create({ user_id : data[0].id })).get({ plain: true });
            const user = {
                id:1,
                name:'Test',
                lastname: 'Test',
                email: req.body.email,
                userId: data[0].id,
                sessionId: dataLogin.id
        
            }
            console.log('user',user)
            jwt.sign( user, privateKey, function(err, token) {
                console.log(token)
                res.json({
                    token
                })
            });
        }else{
            res.status(403).send( {
                message: 'Usuario incorrecto.'
            });
        }
    } catch (error) {
        res.status(403).send( {
            message: 'Error en el servidor.'
        });
    }
    
});


router.get('/', async (req, res) => {
    res.status(200).send({
        message: 'Bienvenido'
    });
});


module.exports = router;
