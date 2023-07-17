# More Setup parameters

If we have a file in path: `unique_numbers/__init__.py`

```python
import numpy as np

def get_unique_number():
    return np.randnum() + 2
```

we can have a setup file as

```python
from setuptools import setup, find_packages

setup(
    name="unique_numbers",
    version="0.0.1",
    packages=find_packages(),
    install_requires=['numpy'],
    author="Educative Student",
    author_email="student@educative.io",
    description="A library for getting super unique numbers",
    long_description="""
    A wonder library for getting super unique numbers""",
    keywords="numbers, math, calculations, unique, random",
    url="https://github.com/username/reponame",
    project_urls={
        "Bug Tracker": "https://github.com/username/reponame/issues",
        "Documentation": "https://github.com/username/reponame/wiki",
        "Source Code": "https://github.com/username/reponame",
    },
    classifiers = [
        "Programming Language :: Python",
        "Programming Language :: Python :: 3",
        "Development Status :: 4 - Beta",
        "Environment :: Other Environment",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)",
        "Operating System :: OS Independent",
        "Topic :: Software Development :: Libraries :: Python Modules"
    ]
)
```

## Explanation

pass

## Using markdown as long description

```python

```
