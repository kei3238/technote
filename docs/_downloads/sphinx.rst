================
Sphinx
================

Quick start
===========
.. code-block:: shell

   # Install Sphinx.
   pip install Sphinx

   # Initialization.
   # Accepting most of the defaults, but select 'YES' for a question about autodoc.
   sphinx-quickstart

   # Check current directory.
   # Makefile _build _static _templates conf.py index.rst
   ls

   # Make html.
   make html

   # Now you can find the generated html files in ./_build/html (e.g., index.html).
   
Toctree
=======
Add toctree directive to index.rst as follows.

::

    .. toctree::
       doc1
       doc2

Then put doc1.rst and doc2.rst in the directory where the index.rst exists.

reStructuredText Syntax
=======================

Reference
---------
* `Sphinx and RST syntax guide (0.9.3) <https://thomas-cokelaer.info/tutorials/sphinx/rest_syntax.html>`_
* `How to write document with Sphinx (reStructuredText) (Japanese) <http://planset-study-sphinx.readthedocs.io/ja/latest/04.html#top>`_
* `blockdiag in Sphinx (Japanese) <https://qiita.com/yamionp/items/8f8d52d6b41bf9d4d16d>`_


.. _TOP:

Section
-------

You can use following symols for seperating sections.

::

    = - ` : . ' " ~ ^ _ * + #

::

    =====================
    Level 1
    =====================

    Level 2
    ========

    Level 3
    --------

    Level 4
    ^^^^^^^^

    Level 5
    ~~~~~~~

Emphasis
--------

=============== =========== ================= ===================
Type            Usage       Syntax            HTML tag
=============== =========== ================= ===================
Emphasis        *String*    Enclose with \*   <em>
Strong emphasis **String**  Enclose with \*\* <strong>
code            ``String``  Enclose with\`\`  <span class="pre">
=============== =========== ================= ===================

Quotation
---------

   

Line break
----------

Put | to keep line break. 

.. code-block:: rst

    | Line 1
    | Line 2
    | Line 3


| Line 1
| Line 2
| Line 3
|

List
----

::

    * Item 1
    * Item 2
    * Item 3

    + Item 1
    + Item 2
    - Item 3


**Output examples**

* Item 1
* Item 2
* Item 3

+ Item 1
+ Item 2

- Item 1
- Item 2



Numbered list
-------------

.. code-block:: rst

    1. Item 1
    2. Item 2
    3. Item 3

    #. Item 1
    #. Item 2
    #. Item 3


1. Item 1
2. Item 2
3. Item 3

#. Item 1
#. Item 2
#. Item 3


Code block
----------
Putting \:\: and an indentresults in a code block.

.. code-block:: rst

    ::

        code block

    Normal text


::

    code block

Normal text


Or, you can also use code-block directive.

.. code-block:: rst

    .. code-block:: python

        import sys
        print sys.path

.. code-block:: python

    import sys
    print sys.path

You can specify type of syntax highlight in the code-block directive.



Label and refer
---------------

.. code-block:: rst

    .. _label:

    Title
    ^^^^^
    Text

    :ref:`label`

.. _label:

Title
^^^^^
Text

Refer :ref:`label`


Label for other document
------------------------

.. code-block:: rst

    :doc:`profile`


This results in a link like :doc:`./../../Profile/Profile`.


Link
----

::

    * http://sphinx-doc.org/
    * `github <https://github.com>`_
    * Sphinx-users.jp_

    .. _Sphinx-users.jp: http://sphinx-users.jp/

* http://sphinx-doc.org/
* `github <https://github.com>`_
* Sphinx-users.jp_

.. _Sphinx-users.jp: http://sphinx-users.jp/


Download link
-------------

::

    :download:`This file <sphinx.rst>`


This results in :download:`This file <./sphinx.rst>`.



Image
-----

.. code-block:: rst

    .. image:: ./../_static/sphinx.png
        :scale: 70%

.. image:: ./../_static/sphinx.png
    :scale: 70%

.. code-block:: rst

    .. figure:: ./../_static/sphinx.png
        :scale: 70%

        This is caption.

.. figure:: ./../_static/sphinx.png
    :scale: 70%

    This is caption.

Table
-----

Table 1
^^^^^^^

.. code-block:: rst

    ======= ====== ======
    col1    col2   col3
    ======= ====== ======
    row1    a      b
    row2    a      b
    row3    a      b
    ======= ====== ======


======= ====== ======
col1    col2   col3
======= ====== ======
row1    a      b
row2    a      b
row3    a      b
======= ====== ======


Table 2
^^^^^^^

.. code-block:: rst

    +------------------------+------------+----------+----------+
    | Header row, column 1   | Header 2   | Header 3 | Header 4 |
    | (header rows optional) |            |          |          |
    +========================+============+==========+==========+
    | body row 1, column 1   | column 2   | column 3 | column 4 |
    +------------------------+------------+----------+----------+
    | body row 2             | ...        | ...      |          |
    +------------------------+------------+----------+----------+


+------------------------+------------+----------+----------+
| Header row, column 1   | Header 2   | Header 3 | Header 4 |
| (header rows optional) |            |          |          |
+========================+============+==========+==========+
| body row 1, column 1   | column 2   | column 3 | column 4 |
+------------------------+------------+----------+----------+
| body row 2             | ...        | ...      |          |
+------------------------+------------+----------+----------+


csv-table
----------

.. code-block:: rst

    .. csv-table:: Frozen Delights!
        :header: "Treat", "Quantity", "Description"
        :widths: 15, 10, 30

        "Albatross", 2.99, "On a stick!"
        "Crunchy Frog", 1.49, "If we took the bones out, it wouldn't be
        crunchy, now would it?"
        "Gannet Ripple", 1.99, "On a stick!"


.. csv-table:: Frozen Delights!
   :header: "Treat", "Quantity", "Description"
   :widths: 15, 10, 30

   "Albatross", 2.99, "On a stick!"
   "Crunchy Frog", 1.49, "If we took the bones out, it wouldn't be
   crunchy, now would it?"
   "Gannet Ripple", 1.99, "On a stick!"


list-table
------------

.. code-block:: rst

    .. list-table:: Frozen Delights!
        :widths: 15 10 30
        :header-rows: 1

        * - Treat
            - Quantity
            - Description
        * - Albatross
            - 2.99
            - On a stick!
        * - Crunchy Frog
            - 1.49
            - If we took the bones out, it wouldn't be
            crunchy, now would it?
        * - Gannet Ripple
            - 1.99
            - On a stick!

.. list-table:: Frozen Delights!
   :widths: 15 10 30
   :header-rows: 1

   * - Treat
     - Quantity
     - Description
   * - Albatross
     - 2.99
     - On a stick!
   * - Crunchy Frog
     - 1.49
     - If we took the bones out, it wouldn't be
       crunchy, now would it?
   * - Gannet Ripple
     - 1.99
     - On a stick!

     
Comment
-------

.. code-block:: rst

    .. note::

        This is note!

.. note::
    
    This is note!

.. code-block:: rst

    .. warning::
        
        This is warning!

.. warning::
    
    This is warning!


Flowchart
---------

.. code-block:: bash

    # install packages
    pip install sphinxcontrib-actdiag sphinxcontrib-blockdiag sphinxcontrib-nwdiag sphinxcontrib-seqdiag


.. code-block:: python

    # conf.py
    # Add followings.

    extensions = [
        'sphinxcontrib.blockdiag',
        'sphinxcontrib.seqdiag',
        'sphinxcontrib.actdiag',
        'sphinxcontrib.nwdiag',
        'sphinxcontrib.rackdiag',
        'sphinxcontrib.packetdiag',
    ]

    blockdiag_html_image_format = 'SVG'
    seqdiag_html_image_format = 'SVG'
    actdiag_html_image_format = 'SVG'
    nwdiag_html_image_format = 'SVG'
    rackiag_html_image_format = 'SVG'
    packetdiag_html_image_format = 'SVG'


.. code-block:: rst

    .. blockdiag::

        blockdiag {
        A -> B -> C;
        A -> E -> F;
        }

.. blockdiag::

    blockdiag {
       A -> B -> C;
       A -> E -> F;
    }

.. code-block:: rst

    .. seqdiag::

        seqdiag {
            browser  -> webserver [label = "GET /index.html"];
            browser <-- webserver;
            browser  -> webserver [label = "POST /blog/comment"];
                        webserver  -> database [label = "INSERT comment"];
                        webserver <-- database;
            browser <-- webserver;
        }


.. seqdiag::

    seqdiag {
        browser  -> webserver [label = "GET /index.html"];
        browser <-- webserver;
        browser  -> webserver [label = "POST /blog/comment"];
                    webserver  -> database [label = "INSERT comment"];
                    webserver <-- database;
        browser <-- webserver;
    }


Mathematical notation
---------------------

.. code-block:: rst

    # conf.py
    # Add followings.

    extensions = [
        'sphinx.ext.mathjax',
    ]

.. code-block:: rst

    .. math::

        X_k = \sum_{n=0}^{2N-1} x_n \cos \left[\frac{\pi}{N}
              \left(n+\frac{1}{2}+\frac{N}{2}\right) \left(k+\frac{1}{2}\right) \right]

.. math::

    X_k = \sum_{n=0}^{2N-1} x_n \cos \left[\frac{\pi}{N}
          \left(n+\frac{1}{2}+\frac{N}{2}\right) \left(k+\frac{1}{2}\right) \right]