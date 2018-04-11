============================================================
Reactによる時計アプリ作成
============================================================

プログラムがスタートした時間を表示する
========================================
1. srcディレクトリ内のApp.jsを編集していく.

.. code-block:: bash

  ├── README.md
  ├── node_modules
  ├── package-lock.json
  ├── package.json
  ├── public
  └── src
      ├── App.js
      ├── index.js
      └── registerServiceWorker.js


2. App.jsを以下のように変更する.

.. code-block:: jsx

  import React, { Component } from 'react';

  function parseTime(datetime=new Date()){
    return {
      hour: datetime.getHours(),
      minute: datetime.getMinutes(),
      second: datetime.getSeconds()
    };
  }

  function zeroPadding(number, length=2) {
    return (Array(length).join("0") + number).slice(-length);
  }

  class App extends Component {
    render() {

      const current_time = parseTime();
      const hour = zeroPadding(current_time.hour);
      const minute = zeroPadding(current_time.minute);
      const second = zeroPadding(current_time.second);

      return (
        <div>
          {hour}:{minute}:{second}
        </div>
      );
    }
  }

  export default App;

3. npm start

.. code-block:: bash

  npm start

4. http://localhost:3000 を開いてnpm startした時間が表示されることを確認.

.. image:: ./../../_static/start_time.png
    :scale: 50%

ボタンを押したタイミングで時刻を更新する
=============================================
1. srcディレクトリ内のApp.jsを編集していく.

2. App.jsを以下のように変更する.

.. code-block:: jsx

  import React, { Component } from 'react';

  function parseTime(datetime=new Date()){
    return {
      hour: datetime.getHours(),
      minute: datetime.getMinutes(),
      second: datetime.getSeconds()
    };
  }

  function zeroPadding(number, length=2) {
    return (Array(length).join("0") + number).slice(-length);
  }

  class App extends Component {

    constructor(props){
      super(props);
      
      // initial state
      const datetime = parseTime();
      this.state = {
        // '...' expands the specified object 
        ...datetime
      };
      
      // bind event handler
      this.handleClick = this.handleClick.bind(this);
    }

    // update state when clicked
    handleClick(){
      const datetime = parseTime();
      this.setState({
        ...datetime
      });
    }

    render() {

      const hour = zeroPadding(this.state.hour);
      const minute = zeroPadding(this.state.minute);
      const second = zeroPadding(this.state.second);

      return (
        <div>
          {hour}:{minute}:{second}
          <button onClick={this.handleClick}>Update</button>
        </div>
      );
    }
  }

  export default App;

**< constructor >**

* constructor()が初回レンダリング時に呼ばれる.
* super()で親クラス(Component)のプロトタイプ関数やプロパティを呼ぶ.
* constructor()内で初期状態(state)を宣言している.
* イベントハンドラでthisがundefinedになるので明示的にbindする.

**< stateの更新 >**

* stateの更新はsetState(object)で行う. (stateに直接値を入れないようにする)
* <button>のonClickにボタンがクリックされた時のcallback関数を定義.

3. npm start

.. code-block:: bash

  npm start

4. http://localhost:3000 を開いてnpm startした時間が表示され、ボタンを押すと時刻が更新されることを確認.

.. image:: ./../../_static/time_update_button.png
    :scale: 50%

普通の (毎秒更新される) 時計を表示する
=============================================
1. srcディレクトリ内のApp.jsを編集していく.

2. App.jsを以下のように変更する.

.. code-block:: jsx

  import React, { Component } from 'react';

  function parseTime(datetime=new Date()){
    return {
      hour: datetime.getHours(),
      minute: datetime.getMinutes(),
      second: datetime.getSeconds()
    };
  }

  function zeroPadding(number, length=2) {
    return (Array(length).join("0") + number).slice(-length);
  }

  class App extends Component {

    constructor(props){
      super(props);
      
      // initial state
      const datetime = parseTime();
      this.state = {
        // '...' expands the specified object 
        ...datetime
      };
      
      // bind event handler
      this.handleTime = this.handleTime.bind(this);
    }

    componentDidMount() {
      this.timer = setInterval(this.handleTime, 1000);
    }

    componentWillUnmount() {
      clearInterval(this.timer);
    }

    // update state when clicked
    handleTime(){
      const datetime = parseTime();
      this.setState({
        ...datetime
      });
    }

    render() {

      const hour = zeroPadding(this.state.hour);
      const minute = zeroPadding(this.state.minute);
      const second = zeroPadding(this.state.second);

      return (
        <div>
          {hour}:{minute}:{second}
        </div>
      );
    }
  }

  export default App;

**< componentのライフサイクルを追加する >**

* componentDidMount()がcomponentが描画された直後に呼ばれる.
* setIntervalでthis.handleTimeを1秒おきに実行するよう設定.
* componentが削除される前にcomponentWillUnmount()が呼ばれる.

3. npm start

.. code-block:: bash

  npm start

4. http://localhost:3000 を開いて時計が毎秒更新されることを確認.

.. image:: ./../../_static/clock.png
    :scale: 50%