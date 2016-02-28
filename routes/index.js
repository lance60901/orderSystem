/* jsHint node: true */

var db = require('../model');
var ObjectID = require('mongodb').ObjectID;

/* GET home page. */
module.exports = function (app) {
  /* 顯示所有店家在側邊欄位*/
  app.get('/', checkLogin);
  app.get('/', function(req, res, next) {
    db.store.find({}, function (err, rows) {
      var area = req.session.area ? req.session.area : '';
      res.render('index', { store: rows, menu: null , username: req.session.user, area: area });
    }).sort( { area: 1 } );
  });
  app.get('/login', checkNotLogin);
  app.get('/login', function(req, res, next) {
    res.render('login', {
      success: '' ,
      error: ''
    });
  });
  app.get('/haveEnd', checkLogin);
  app.get('/haveEnd', function (req, res, next) {
    var time = new Date();
    time = (time.getFullYear()+'/'+(time.getMonth()+1)+'/'+time.getDate()).toString();
    db.lists.findOneAndUpdate({date: time, tag: 'on'}, {$set: { tag: 'off'}}, {upsert:true}, function (err, rows) {
      req.session.area = '';
      res.send(rows);
    });
  });
  app.post('/login', function (req, res, next) {
		req.session.user = req.body.username;
		res.redirect('/order');
	});

  app.get('/logout', checkLogin);
	app.get('/logout', function (req, res, next) {
		req.session.user = null;
		res.redirect('/login');
	});
  /* 顯示所選取的店家以及其菜單*/
  app.get('/store', checkLogin);
  app.get('/store', function (req, res, next) {
    var store = req.query.q,
        area = req.session.area ? req.session.area : '';
    db.store.find({}, function (err, rows) {
      db.store.find({"storeName" : store}, function (err, row) {
        res.render('index', { store: rows, menu: row, username: req.session.user, area: area });
      });
    }).sort( { area: 1 } );
  });
  /* 店家管理頁面*/
  app.get('/management', checkLogin);
  app.get('/management', function (req, res, next) {
    var store = req.query.q;
      db.store.find({}, function (err, rows) {
          res.render('management', { store: rows, menu: null, username: req.session.user });
      }).sort( { area: 1 } );
  });
  /* 新增店家*/
  app.get('/addStore', checkLogin);
  app.get('/addStore', function (req, res, next) {
    db.store.find({}, function (err, rows) {
      res.render('addStore', {store: rows, username: req.session.user});
    }).sort( { area: 1 } );
  });
  /* 新增店家請求*/
  app.post('/addStore', checkLogin);
  app.post('/addStore', function (req, res, next) {
      if (req.body.storeName !== '') {
        var data = new db.store ({
          storeName: req.body.storeName,
          officeTime: {
            officialHoliday: req.body.officialHoliday,
            onTime:req.body.onTime,
            offTime:req.body.offTime
          },
          area: req.body.area,
          tel: req.body.tel,
          address: req.body.address,
          ps: req.body.ps
        });
        data.save();
        res.redirect('/addStore');
      } else {}
  });
  app.post('/deleteStore', checkLogin);
  app.post('/deleteStore', function (req, res, next) {
    if (req.body.objectId) {
      var _id = new ObjectID(req.body.objectId);
      db.store.remove({ _id: _id}, function (err, result) {
        res.send(result);
      });
    }
  });
  /* 進到編輯菜單頁面，如果沒有收到商店ＩＤ轉回management*/
  app.get('/editMenu', checkLogin);
  app.get('/editMenu', function (req, res, next) {
    var store = req.query.q;
    if (store !== undefined) {
      db.store.find({}, function (err, rows) {
        db.store.find({"_id" : store}, function (err, row) {
          res.render('editMenu', { store: rows, menu: row, username: req.session.user });
        });
      }).sort( { area: 1 } );
    } else {
      res.redirect('/management');
    }
  });
  /* 送出編輯店家資訊請求*/
  app.post('/editMenu', function (req, res, next) {
    if (req.body.storeName !== '') {
      var data = {
        storeName: req.body.storeName,
        officeTime: {
          officialHoliday: req.body.officialHoliday,
          onTime: req.body.onTime,
          offTime: req.body.offTime
        },
        tel: req.body.tel,
        area: req.body.area,
        address: req.body.address,
        ps: req.body.ps
      };
      db.store.findOneAndUpdate({ "_id": req.body.objectId}, {$set: data}, { upsert: true}, function () {
        res.redirect('/editMenu?q='+req.body.objectId);
      });
    } else {}
  });
  /* 送出新增菜單*/
  app.get('/addMenu', function (req, res, next) {
    var name = req.query.name;
    var price = req.query.price;
    var objectId = req.query.objectId;
    var id = objectId+'_'+req.query.menuId;
    db.store.findOneAndUpdate({ "_id": objectId}, {$push: { menu: { "id": id, "name": name, "price": price }}}, { upsert: true}, function (err) {
      res.redirect('/editMenu?q='+objectId);
    });
  });
  /* 送出刪除菜單*/
  app.get('/deleteMenu', function (req, res, next) {
    var objectId = req.query.objectId;
    var key = req.query.key;
    db.store.findOneAndUpdate({ "_id": objectId}, {$pull: { menu: { id: key}}}, function (err) {
      res.send(objectId);
    });
  });
  //歷史訂單
  app.get('/history', checkLogin);
  app.get('/history', function (req, res, next) {
    var time = new Date();
    time = (time.getFullYear()+'/'+(time.getMonth()+1)+'/'+time.getDate()).toString();
    db.lists.find({}, function (err, rows) {
      rows = rows.reverse();
      res.render('history', { username: req.session.user, data: rows });
    });
  });
  /* 叫出今日訂單*/
  app.get('/order', checkLogin);
  app.get('/order', function (req, res, next) {
    var time = new Date(),
        data = {},
        area = '';
    time = (time.getFullYear()+'/'+(time.getMonth()+1)+'/'+time.getDate()).toString();
    data = {
        date: time,
        tag: 'on'
    };
    db.lists.findOneAndUpdate({ 'date': time, 'tag': 'on'}, {$set: data}, { upsert: true, new: true}, function (err, rows) {
      if( rows.lists.length <= 0) {
        req.session.area = '';
      }
      if ( rows.area !== 'E' && rows.area !== undefined) {
        req.session.area = rows.area;
      }
      area = req.session.area;
      res.render('order', { data: rows, username: req.session.user, area: area });
    });
  });
  app.get('/print', checkLogin);
  app.get('/print', function (req, res, next) {
    var time = new Date();
    time = (time.getFullYear()+'/'+(time.getMonth()+1)+'/'+time.getDate()).toString();
    db.lists.findOne({ 'date': time, 'tag': 'on'}, function (err, rows) {
      res.render('print', { data: rows, username: req.session.user});
    });
  });
  app.post('/orderListDelete', checkLogin);
  app.post('/orderListDelete', function (req, res, next) {
    var time = new Date(),
        _id = new ObjectID(req.body.menuId);
    time = (time.getFullYear()+'/'+(time.getMonth()+1)+'/'+time.getDate()).toString();
    db.lists.findOneAndUpdate({date: time, tag: 'on', "lists": { "$elemMatch": {"person": req.session.user}}}, {$pull:{"lists.$.meals": {_id: _id}}}, {}, function (err, rows) {
      res.send(rows);
    });
  });
  /* 增加訂單*/
  /* 再進行此動作之前，需要先成立表格 這邊預設登入的時候會先經過/order來成立當日新表格*/
  app.get('/orderList', checkLogin);
  app.post('/orderList', function (req, res, next) {
    var time = new Date();
    time = (time.getFullYear()+'/'+(time.getMonth()+1)+'/'+time.getDate()).toString();
    var data = JSON.parse(req.body.data),
        area = (req.body.area === 'E' || req.body.area === undefined) ? req.session.area : req.body.area;
    db.lists.find({ date: time, tag: 'on', "lists": { $elemMatch: { "person": req.session.user }}}, function (err, rows) {
      if (rows.length <= 0) {
        db.lists.update({ date: time, tag: 'on'}, { $push : { "lists": { "person": req.session.user}}}, function (err, rows) {
          console.log(err);
        });
      }
      db.lists.findOneAndUpdate({ date: time, tag: 'on', "lists": { $elemMatch: { "person": req.session.user }}}, { $set: { area: area},$pushAll: { "lists.$.meals": data }}, { upsert: true, new: true}, function (err, rows) {
        if ( rows.area !== 'E' && rows.area !== undefined) {
          req.session.area = rows.area;
        }
        res.send('success');
      });
    });
  });
  /* 後台管理頁面*/
  app.get('/BackStageManagement', function (req, res, next) {
    res.render('BackStageManagement', {username: req.session.user});
  });

};

function checkLogin(req, res, next) {
	if(!req.session.user) {
		//req.flash('error', '請先登入!');
		res.redirect('/login');
	}
	next();
}

function checkNotLogin(req, res, next) {
	if(req.session.user) {
		//req.flash('error', '已登入!');
		res.redirect('back');
	}
	next();
}
