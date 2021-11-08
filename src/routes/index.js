const credentials = require('./credentials');
const products = require('./products');
const orders = require('./order')
const modules = [
    credentials,
    products,
    orders
]

module.exports = modules;