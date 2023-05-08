#!/usr/bin/env python3
print("Importing distutils...")
from distutils.core import setup
print("Importing Cython builder...")
from Cython.Build import cythonize
print("Started setup process.")
setup(ext_modules = cythonize("cbuild.pyx"))