var mongoose = require('mongoose')
//mongoose.connect('mongodb://localhost:27017/stores')
// var db = mongoose.connection
// db.on('error', console.error.bind(console, 'connection error:'))
// db.once('open', function callback () {
//   console.log("Database Connected.")
// })
exports.store = mongoose.model('store', require('./store'), 'store')
exports.lists = mongoose.model('lists', require('./lists'), 'order')
exports.users = mongoose.model('users', require('./users'), 'users')
