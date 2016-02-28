var mongoose = require('mongoose')
var Schema = mongoose.Schema
var users = new Schema({
	username: String,
	password: String,
	name: String,
	tel: String
})

module.exports = users
