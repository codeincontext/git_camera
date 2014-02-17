var page = require('webpage').create();

var url = phantom.args[0]
  , destination = phantom.args[1]
  , resolution = phantom.args[2].split('x');

// console.log(JSON.stringify(phantom.args)); 

page.viewportSize = { width: resolution[0], height: resolution[1] };

page.open(url, function () {
    page.render(destination);
    phantom.exit();
});
