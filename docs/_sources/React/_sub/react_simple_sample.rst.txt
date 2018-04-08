============================================================
簡単な例で学ぶReact
============================================================

Hello worldだけを表示する
========================================
1. srcディレクトリ内のApp.jsを編集していく.

.. code-block:: bash

  ├── README.md
  ├── node_modules
  ├── package-lock.json
  ├── package.json
  ├── public
  └── src
      ├── App.css
      ├── App.js
      ├── App.test.js
      ├── index.css
      ├── index.js
      ├── logo.svg
      └── registerServiceWorker.js


2. App.jsを以下のように変更する.

.. code-block:: jsx

  import React, { Component } from 'react';

  class App extends Component {
    render() {
      return (
        <div>
          Hello world!
        </div>
      );
    }
  }

  export default App;

* ReactのComponentクラスを継承してAppクラスを宣言している.
* renderメソッドの中のreturnでhtml(っぽいもの)を返している.
  
  * ここに色々な要素を追加していける.
* Appクラスはエクスポートして他のファイルで読み込めるようにしている.

3. index.jsも最低限のものにしてみる. (そのままでもよい)

.. code-block:: jsx

  import React from 'react';
  import ReactDOM from 'react-dom';
  import App from './App';
  import registerServiceWorker from './registerServiceWorker';

  ReactDOM.render(<App />, document.getElementById('root'));
  registerServiceWorker();

* Appクラスを読み込み.
* ReactDOM.renderでAppをレンダリング.

4. 不要なファイルを削除

* App.css
* App.test.js
* index.css
* logo.svg

5. npm start

.. code-block:: bash

  npm start

6. http://localhost:3000 を開いて'Hello world!'だけ表示されることを確認.

.. image:: ./../../_static/hello_world.png
    :scale: 50%


関数化
========================================

.. code-block:: jsx

  import React, { Component } from 'react';

  function Hello(){
    return(
      'Hello world'
    );
  }

  class App extends Component {
    render() {
      return (
        <div>
          <Hello/>
        </div>
      );
    }
  }

  export default App;


変数の受け渡し
========================================

.. code-block:: jsx

  import React, { Component } from 'react';

  function Hello(props){
    return(
      <div>
        Hello {props.name}!
      </div>
    );
  }

  class App extends Component {
    render() {
      return (
        <Hello name='world'/>
      );
    }
  }

  export default App;
