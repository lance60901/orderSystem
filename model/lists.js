var mongoose = require('mongoose');
var Schema = mongoose.Schema;
var lists = new Schema({
	date: String,
	tag: String,
	area: String,
	lists: [
		{ person: String, meals: [
			{ store: String, name: String, price: Number, ps: String, time: String}
				]
			}
	]
});

module.exports = lists;
