var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var store = new Schema({
	storeName: String,
	menu: [{ id: String, name: String, price: Number}],
	officeTime: { officialHoliday: String, onTime: String, offTime: String},
	tel: String,
	address: String,
	ps: String,
	area: String
});

module.exports = store;
