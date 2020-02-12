Sphinx tips and tricks
======================

We write here miscellaneous tips and tricks.

Sphinx and Jupyter required packages
------------------------------------

In order to compile the, a Python 3 virtualenv with adequate packages should be present in the folder "replab/sphinxdocs/sphinx2". In Ubuntu 18.04, this can be prepared as follows:

Run from the "replab" folder

::

    mkdir sphinxdocs
    cd sphinxdocs
    python3 -m venv sphinx2

Then enter the environment

::

    source sphinx2/bin/activate

Install the following python packages:

- sphinx
- sphinxcontrib-matlabdomain
- texext
- guzzle_sphinx_theme
- sphinx-collapse-admonitions
- sphinxcontrib-fulltoc
- ablog

This can be done with the command

::

   pip install sphinx sphinxcontrib-matlabdomain texext guzzle_sphinx_theme sphinx-collapse-admonitions sphinxcontrib-fulltoc ablog

(add the option "--user" if not installing inside a virtual environment)

For the Jupyter notebooks, further install the following packages (see also `<https://nbsphinx.readthedocs.io/en/latest/installation.html>`_):

- jupyter-core
- jupyter-client
- nbconvert
- nbsphinx
- octave-kernel

This can be done with the command

::

    pip install jupyter-core jupyter-client nbconvert nbsphinx octave-kernel

Also, make sure the pandoc package is available. On Ubuntu, this can be installed with with command

::

    sudo apt install pandoc


Later on?

Proof environment? `<https://framagit.org/spalax/sphinxcontrib-proof/>`_

Resources: `<https://github.com/yoloseem/awesome-sphinxdoc>`_

References to root-level scripts
--------------------------------

Scripts such as `~root.replab_init`, `~root.replab_generate` live in the fake ``root`` package, so these references look actually like `root.replab_init` and `root.replab_generate`.

The ``root`` prefix is stripped when displayed on the console. In the Sphinx documentation, one should use the ``~`` prefix.

To convert Matlab Live Scripts to Jupyter notebooks
---------------------------------------------------

`Jupytext <https://github.com/mwouts/jupytext>`_ works fantastically well.

Generation of Jupyter notebooks
-------------------------------

Running the Matlab kernel from within a Matlab session does not work. We sidestep this problem by using the Octave kernel in all Jupyter notebooks.
