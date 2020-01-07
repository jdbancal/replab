# -*- coding: utf-8 -*-
#
# Configuration file for the Sphinx documentation builder.
#
# This file does only contain a selection of the most common options. For a
# full list see the documentation:
# http://www.sphinx-doc.org/en/stable/config

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))


# -- Project information -----------------------------------------------------

project = 'RepLAB'
copyright = '2018-2019, Denis Rosset, Jean-Daniel Bancal and collaborators'
author = 'Denis Rosset, Jean-Daniel Bancal and collaborators'

# The short X.Y version
version = '0.6'
# The full version, including alpha/beta/rc tags
release = '0.6.0-SNAPSHOT'


# -- General configuration ---------------------------------------------------

# If your documentation needs a minimal Sphinx version, state it here.
#
# needs_sphinx = '1.0'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = ['sphinx.ext.autodoc',   # for enumeration of objects stuff
              'sphinx.ext.autosummary',
              'sphinx_collapse_admonitions',
              'sphinxcontrib.fulltoc', # for sidebar TOC
              'sphinxcontrib.matlab', # support for Matlab
              'sphinx.ext.napoleon',  # support for shorthand syntax
              'sphinx.ext.mathjax',   # LaTeX support
              'texext.math_dollar']   # lightweight LaTeX filter

html_sidebars = {
    '**': ['logo-text.html', 'globaltoc.html', 'searchbox.html']
}

autodoc_default_options = {'members': True, 'show-inheritance': True}
autosummary_generate = True

matlab_keep_package_prefix = False

matlab_src_dir = os.path.dirname(os.path.abspath(__file__ + "/"))+"/_src"
primary_domain = 'mat'
default_role = 'obj'

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The suffix(es) of source filenames.
# You can specify multiple suffix as a list of string:
#
# source_suffix = ['.rst', '.md']
source_suffix = '.rst'

# The master toctree document.
master_doc = 'index'

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
language = None

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path .
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'


# -- Options for HTML output -------------------------------------------------

import guzzle_sphinx_theme

html_theme_path = guzzle_sphinx_theme.html_theme_path()
html_theme = 'guzzle_sphinx_theme'

# Register the theme as an extension to generate a sitemap.xml
extensions.append("guzzle_sphinx_theme")

html_static_path = ['_static']

# Guzzle theme options (see theme.conf for more information)
html_theme_options = {
    # Set the name of the project to appear in the sidebar
    "project_nav_name": "RepLAB",
    # Visible levels of the global TOC; -1 means unlimited
    "globaltoc_depth": 4,
}

html_js_files = [
    'js/collapse_helper.js',
]
