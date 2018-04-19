============================================================
Reduxについて
============================================================


Reduxとは
===============================================
* Fluxというアーキテクチャの一種. Fluxでは、

  1. ユーザの入力からActionを作成し、
  2. そのActionをDispatch (発行) し、
  3. Storeに保存しているStateを変更し、
  4. Stateの変更をView (UI) に反映させる、という流れをとる.
  
* Viewを変更するために必ずActionを発行することになり、データフローが一方向になることで複雑なアプリケーションでも保守がしやすくなる.

Reduxの特徴
===============
* Reactと組み合わせることが多いが、Angularとも組み合わせて使える.
* 上述のFlux構成要素に、Storeに保存しているStateを変更するための関数Reducerが加わる.

.. blockdiag::

    blockdiag {
      default_fontsize = 16;
      span_width = 100;

      View -> Action;
      Action -> Store [label = "Dispatch", fontsize=10];
      Store -> View;
      group {
        orientation = portrait

        Store <-> State [label = "Reducer", fontsize=10];
      }
    }
