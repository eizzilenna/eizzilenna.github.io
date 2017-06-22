const template = (content) => `
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Elizabeth Anne Wright</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="stylesheet" href="/style.min.css">
  </head>
  <body class="w-100 avenir dark-gray bg-light-gray">
    <div id="app">
      ${content}
    </div>
    <script src="index.min.js"></script>
    <script>
      Elm.Main.embed(document.getElementById('app'));
    </script>
  </body>
</html>
`;

exports = module.exports = template;
