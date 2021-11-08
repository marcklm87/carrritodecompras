const  { Router } = require('express');
var jwt = require('jsonwebtoken');
const router = Router();
const db =  require('../../db')
const catalog_message = require('../../constant/catalog_message')
require('dotenv').config()
const {verifyToken, sessionData} = require('../main')


router.post('/create-order', verifyToken, async(req, res) => {
    let transaction =await db.sequelize.transaction();
    try {
        
        const session = sessionData(req)
        console.log(req.body, session)
        let statusCode = 200
        let message = catalog_message.SUCCESS
        let id = null
        const dataCarShopping = await await db.sequelize.query(`
        select 
            sci.product_id, 
            sci.quantity, 
            sci.price 
        from shopping_cart_item sci where sci.login_attempts_id =${session.sessionId}`, 
        { type: db.sequelize.QueryTypes.SELECT});

        if(dataCarShopping.length > 0){
            const shoppingData = (await db.order.create({
                finish: true, 
                user_id: session.userId,
                shipping_address: req.body.DireccionEnvio
            }, 
            {
                transaction
            })).get({ plain: true });
            id = shoppingData.id
            for(let i=0; i<dataCarShopping.length; i++){
                await db.order_item.create({
                    quantity: dataCarShopping[i].quantity, 
                    price: dataCarShopping[i].price,
                    order_id: id,
                    product_id:dataCarShopping[i].product_id
                }, 
                {
                    transaction
                }
                )
            }
            await db.shopping_cart_item.destroy({ where: { login_attempts_id: session.sessionId}, transaction})
            await transaction.commit();
            res.status(statusCode).send({
                message,
                id
            });

        }else{
            res.status(statusCode).send({
                "message":"No existen productos en el carrito."
            });
        }
        
    } catch (error) {
        if (transaction) await transaction.rollback();
        message = catalog_message.ERROR
        statusCode= 500
        res.status(statusCode).send({
            error,
            message
        });
    }
});

router.get('/order', verifyToken, async(req, res) => {
    const result = sessionData(req)
    let error =""
    let message = catalog_message.SUCCESS
    let statusCode = 200
    let data = []
    try {

        data = await db.sequelize.query('select o.id, o.created_at, o.shipping_address, if(o.finish, "Finalizado","Pendiente") as status from `order` o where o.user_id ='+result.userId, { type: db.sequelize.QueryTypes.SELECT});

        res.status(statusCode).send({
            message,
            error,
            data
        });
    } catch (error) {
        message = catalog_message.ERROR
        statusCode= 500
        res.status(statusCode).send({
            error,
            message
        });
    }
});


module.exports = router;
