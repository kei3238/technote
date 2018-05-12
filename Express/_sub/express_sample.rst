============================================================
Express quick start
============================================================

Expressの導入
============================================================

1. Project initialization

以下でプロジェクトを作成. とりあえず試すだけなら全てデフォルト回答でOK.

.. code-block:: bash

  $ npm init

  This utility will walk you through creating a package.json file.
  It only covers the most common items, and tries to guess sensible defaults.

  See `npm help json` for definitive documentation on these fields
  and exactly what they do.

  Use `npm install <pkg>` afterwards to install a package and
  save it as a dependency in the package.json file.

  Press ^C at any time to quit.
  package name: (sample)
  version: (1.0.0)
  description:
  entry point: (index.js)
  test command:
  git repository:
  keywords:
  author:
  license: (ISC)
  About to write to /path/to/wd/sample/package.json:

  {
    "name": "02_simplesample02",
    "version": "1.0.0",
    "description": "",
    "main": "index.js",
    "scripts": {
      "test": "echo \"Error: no test specified\" && exit 1"
    },
    "author": "",
    "license": "ISC"
  }


  Is this ok? (yes)

2. expressのインストール

.. code-block:: bash

  npm install --save express


Express quick start
============================================================

2. エントリーポイントになるjsファイルを作成

.. code-block:: bash

  touch index.js

3. index.jsを以下のように編集

.. code-block:: js

  var http = require('http');
  var express = require('express');

  var app = express();

  app.use(function(req, res, next) {
    return res.send('Hello express!');
  });

  var server = http.createServer(app);
  server.listen('3000');

4. Expressを起動

.. code-block:: bash

  node index.js

5. 適当なブラウザで http://localhost:3000 にアクセスして"Hello express!"と表示されることを確認.
