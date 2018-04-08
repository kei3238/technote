============================================================
Quick Start
============================================================

Nodeのインストール
===========================
1. `node.jsからダウンロード <https://nodejs.org/ja/>`_
2. ターミナルでバージョンを確認できればOK

.. code-block:: bash

  $ node -v
  v9.7.1

3. npmのバージョンも確認

.. code-block:: bash

  $ npm -v
  5.6.0


create-react-appでプロジェクト作成
=======================================
1. npmでcreate-react-appをインストール

.. code-block:: bash

  npm install -g create-react-app

2. create-react-appを実行

.. code-block:: bash

  create-react-app sample-app

3. sample-app内に以下のようなファイル&ディレクトリが作成される

.. code-block:: bash

  .
  ├── README.md
  ├── node_modules
  ├── package-lock.json
  ├── package.json
  ├── public
  └── src

4. sample-appディレクトリに移動してnpm start

.. code-block:: bash

  cd sample-app
  npm start

5. http://localhost:3000 でsample-appが実行される(自動でブラウザが開く)
