var path = require('path'),
    fs = require('fs-path'),
    template = require('./template'),
    builder = require('./elm').Build.worker(),
    request = builder.ports.request,
    response = builder.ports.response;

const render = ([key, value]) => {
  key = (key === '/') ? '/index.html' : key + '.html';
  const filePath = path.join(__dirname, '..', 'static', key);
  fs.writeFileSync(filePath, template(value));
  console.log(`Successfully generated ${filePath}`);
};

response.subscribe((pages) => {
  Object.entries(pages).map(render);
});

request.send(null);
