var DataTypes = require("sequelize").DataTypes;
var _login_attempts = require("./login_attempts");
var _order = require("./order");
var _order_item = require("./order_item");
var _product = require("./product");
var _shopping_cart_item = require("./shopping_cart_item");
var _user = require("./user");

function initModels(sequelize) {
  var login_attempts = _login_attempts(sequelize, DataTypes);
  var order = _order(sequelize, DataTypes);
  var order_item = _order_item(sequelize, DataTypes);
  var product = _product(sequelize, DataTypes);
  var shopping_cart_item = _shopping_cart_item(sequelize, DataTypes);
  var user = _user(sequelize, DataTypes);

  shopping_cart_item.belongsTo(login_attempts, { as: "login_attempt", foreignKey: "login_attempts_id"});
  login_attempts.hasMany(shopping_cart_item, { as: "shopping_cart_items", foreignKey: "login_attempts_id"});
  order_item.belongsTo(order, { as: "order", foreignKey: "order_id"});
  order.hasMany(order_item, { as: "order_items", foreignKey: "order_id"});
  order_item.belongsTo(product, { as: "product", foreignKey: "product_id"});
  product.hasMany(order_item, { as: "order_items", foreignKey: "product_id"});
  shopping_cart_item.belongsTo(product, { as: "product", foreignKey: "product_id"});
  product.hasMany(shopping_cart_item, { as: "shopping_cart_items", foreignKey: "product_id"});
  login_attempts.belongsTo(user, { as: "user", foreignKey: "user_id"});
  user.hasMany(login_attempts, { as: "login_attempts", foreignKey: "user_id"});
  order.belongsTo(user, { as: "user", foreignKey: "user_id"});
  user.hasMany(order, { as: "orders", foreignKey: "user_id"});

  return {
    login_attempts,
    order,
    order_item,
    product,
    shopping_cart_item,
    user,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
