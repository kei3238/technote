============================================================
React-Reduxによる時計アプリ作成
============================================================

下記実装におけるjsファイル依存関係
=============================================

.. blockdiag::

    blockdiag {
      group {
        state;
      }
      state -- reducer.js;
      reducer.js -> index.js [label = "export"];
      components.js -> containers.js  [label = "export"];
      action.js -> containers.js [label = "export"];
      containers.js -> index.js [label = "export"];
    }

下記実装における処理フロー
=============================================

.. seqdiag::

    seqdiag {
      edge_length = 150;
      span_height = 20;

      === Initialization ===
      index.js -> reducer.js [label = "createStore"];
      index.js <- reducer.js [label = "Return initial state"];
      === Update state ===
      index.js -> containers.js [label = "An operation"];
      containers.js -> components.js [label = "Call dispatch func"];
      components.js -> action.js [label = "Dispath(action)"];
      index.js <- containers.js <- components.js <- action.js;
      index.js -> reducer.js [label = "Update state"];
      index.js <- reducer.js [label = "Update view"];
    }


react-reduxによる実装例
===========================

1. パッケージのインストール

.. code-block:: bash

  npm install --save redux react-redux

2. ディレクトリ・ファイル構成を変更

.. code-block:: bash

  .
  ├── README.md
  ├── node_modules
  ├── package-lock.json
  ├── package.json
  ├── public
  └── src
        ├── index.js
        ├── registerServiceWorker.js
        ├── actions
        │   └── clock.js
        ├── reducers
        │   └── clock.js
        ├── containers
        │   └── clockApp.js
        ├── components
        │   └── clockApp.js
        └── utils
            └── common.js

3. src/utils/common.js を以下のように変更する.

.. code-block:: python

  export function parseTime(datetime=new Date()){
    return {
      hour: datetime.getHours(),
      minute: datetime.getMinutes(),
      second: datetime.getSeconds()
    };
  }

  export function zeroPadding(number, length = 2) {
    return (Array(length).join("0") + number).slice(-length);
  }

* parseTime(): 関数を呼び出した時刻をオブジェクトで返す.
* zeroPadding(): hour/minute/secondが1桁の場合に10の位を0でうめる.

4. src/reducers/clock.js を以下のように変更する.

.. code-block:: python

  import {parseTime} from "../utils/common"

  // define initial state
  const initialState = {
    current_time: parseTime()
  };

  // define how reducer updates the state.
  export default function clockReducer(state = initialState, action) {
    switch (action.type) {
      case 'SYNC_TIME':
        return {
          ...state,
          current_time: action.payload.current_time
        };
      default:
        return state;
    }
  }

* initialState(初期状態)として初期化時点での現在時刻を
* action.typeに基づいてstateを更新するreducerを定義している.

5. src/components/clockApp.js を以下のように変更する.

.. code-block:: python

  import React, {Component} from "react"
  import {zeroPadding} from "../utils/common"

  export default class Clock extends Component {

    componentDidMount() {
      this.timer = setInterval(this.props.syncTime, 1000);
    }

    componentWillUnmount() {
      clearInterval(this.timer);
    }

    render() {
      // recieve variables and functions exported in containers
      const {
        //variables
        current_time,

        //functions
      } = this.props;

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

* stateに基づいて現在時刻を表示するcomponent.
* componentDidMount()で1秒おきに時刻を更新するタイマーを設定.
* componentWillUnmount()でタイマーを解除.

6. src/actions/clock.js を以下のように変更する.

.. code-block:: python

  import {parseTime} from "../utils/common"

  // define actions
  export const syncTime = () => ({
    type: 'SYNC_TIME',
    payload: {
      current_time: parseTime()
    }
  });

* typeにアクションの種類、payloadにデータを定義したオブジェクトを返す.
* 上の実装ではSYNC_TIMEアクションでcurrent_timeデータ(現在時刻)を返している.

7. src/containers/clockApp.js を以下のように変更する.

.. code-block:: python

  import { connect } from 'react-redux';
  import ClockApp from '../components/clockApp';
  import { syncTime } from '../actions/clock';

  // pass variables defined in state to component props.
  function mapStateToProps(state) {
    return {
      current_time: state.current_time
    };
  }

  // pass dispath(action) to component props.
  function mapDispatchToProps(dispatch) {
    return {
      syncTime() {
        dispatch(syncTime())
      }
    };
  }

  export default connect(mapStateToProps, mapDispatchToProps)(ClockApp);

* stateで管理している変数をpropsに渡してcomponentで利用できるようにしている.
* componentでactionを発行できる関数をcomponentで利用できるようにしている.
* 上の実装では、syncTime()をcomponentで呼ぶとdispatch(syncTime())が実行される.

8. scr/index.js を以下のように変更する.

.. code-block:: python

  import React from 'react';
  import ReactDOM from 'react-dom';
  import {createStore} from 'redux';
  import {Provider} from 'react-redux';
  import clockReducer from './reducers/clock';
  import ClockApp from './containers/clockApp';
  import registerServiceWorker from './registerServiceWorker';

  const store = createStore(clockReducer);

  ReactDOM.render(
    <Provider store={store}>
      <ClockApp />
    </Provider>,
    document.getElementById('root'));
  registerServiceWorker();


combineReducersとloggerの導入
====================================

* combineReducersを導入することで、reducerを複数ファイルに分割できるようになる.
* loggerを導入することで、stateの変更履歴をコンソールに出力できるようになる.

1. 必要なパッケージをインストール.

.. code-block:: bash

  npm install --save history
  npm install --save react-router-redux
  npm install --save redux-logger


2. store/store.jsを作成する.

.. code-block:: jsx

  import {
    createStore as reduxCreateStore,
    combineReducers,
    applyMiddleware
  } from 'redux';
  import { routerMiddleware } from 'react-router-redux';
  import logger from 'redux-logger';
  import clockReducer from '../reducers/clock';

  export default function createStore(history) {
    return reduxCreateStore(
      combineReducers({
        clockReducer,
      }),
      applyMiddleware(
        logger,
        routerMiddleware(history)
      )
    );
  }

3. containers/clockApp.jsを以下のように変更する.

.. code-block:: jsx

  import { connect } from 'react-redux';
  import ClockApp from '../components/clockApp';
  import { syncTime } from '../actions/clock';

  function mapStateToProps(state) {
    return {
      current_time: state.clockReducer.current_time
    };
  }

  function mapDispatchToProps(dispatch) {
    return {
      syncTime() {
        dispatch(syncTime())
      }
    };
  }

  export default connect(mapStateToProps, mapDispatchToProps)(ClockApp);


4. index.jsを以下のように変更する.

.. code-block:: jsx

  import React from 'react';
  import ReactDOM from 'react-dom';
  import {Provider} from 'react-redux';
  import ClockApp from './containers/clockApp';
  import createBrowserHistory from 'history/createBrowserHistory';
  import createStore from './store/store';
  import registerServiceWorker from './registerServiceWorker';

  const history = createBrowserHistory();
  const store = createStore(history);

  ReactDOM.render(
    <Provider store={store}>
      <ClockApp />
    </Provider>,
    document.getElementById('root'));
  registerServiceWorker();
