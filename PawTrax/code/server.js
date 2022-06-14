var express = require('express'); //Ensure our express framework has been added
var app = express();
var bodyParser = require('body-parser'); //Ensure our body-parser tool has been added
app.use(bodyParser.json());              // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies


app.get('/home', function(req, res) {
	//endpoint for home page
	var get_variable = req.query.parameter_name;
	res.render('pages/home',{
	});
	
});


app.get('/activity', function(req, res) {
	//endpoint for activity page
	var get_variable = req.query.parameter_name;
	res.render('pages/activity',{
	});
});

app.get('/exercise', function(req, res) {
	//endpoint for exercise page
	var get_variable = req.query.parameter_name;
	res.render('pages/exercise',{
	});
});
app.get('/exercise/pick_type', function(req, res) {
	//endpoint for selecting exercise based off of dog size(small, medium, large) page
	var get_variable = req.query.parameter_name;
	res.render('pages/exercise',{
	});
});

app.get('/training', function(req, res) {
	//endpoint for training page
	var get_variable = req.query.parameter_name;
	res.render('pages/training',{
	});
});

app.get('/explore', function(req, res) {
	//endpoint for explore page
	var get_variable = req.query.parameter_name;
	res.render('pages/explore',{
	});
});

app.get('/explore/add_friends', function(req, res) {
	//endpoint for explore page's add friends feature
	var get_variable = req.query.parameter_name;
	res.render('pages/explore',{
	});
});

app.get('/explore/chat', function(req, res) {
	//endpoint for explore pages's chat feature
	var get_variable = req.query.parameter_name;
	res.render('pages/explore',{
	});
});

app.get('/progress', function(req, res) {
	//endpoint for progress tracking page
	var get_variable = req.query.parameter_name;
	res.render('pages/progress',{
	});
});

app.get('/progress/dog_info', function(req, res) {
	//endpoint for adding dog information to keep track of progress feature
	var get_variable = req.query.parameter_name;
	res.render('pages/home',{
	});
});