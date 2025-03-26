# Basic build with minimum parameters

[text]

`first_package/first_module1.txt`

`setup1.txt`

### What the parameters mean

pass

### Make the basic build

`python setup.py sdist bdist_wheel`

## What could go wrong

inner packages

`first_package\subpackage\another_subpackage\another_module.py`

`setup2.txt`

Using find packages

What we have is namespace package, so we have to use find_namespace_packages.

`setup3.txt`

And if we add all those `__init__.py` files we can do find_packages.

`setup4.txt`

Now we have a basic functioning build.
