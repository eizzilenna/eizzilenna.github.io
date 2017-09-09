const template = (content) => `
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Elizabeth Anne Wright</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
      ga('create', 'UA-102663058-1', 'auto');
      ga('send', 'pageview');
    </script>
  </body>
</html>
`;

exports = module.exports = template;
