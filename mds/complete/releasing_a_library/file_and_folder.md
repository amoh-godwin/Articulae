# Releasing A Library

* A python file can be a module and can be imported.

* But it needs a setup.py to make it worthy for PyPI.org. You can release it with a setup.py right next to the module. But it will most of the time be a module that contains more than one file. It will be in a folder and to avoid multiple conflicts with the setup.py files you should create a separate folder for the package and the setup.py file.

A python file that ends with `.py` is a module. It can be imported simply by placing it next to the file that wants to import it and then you import it by using the python import statement. Lets say you have a file named `main.py` and `functions.py`. You can import `functions.py` in `main.py` by simply writing `import functions` in `main.py`. But in the real world if you want to share your module with the world it won't be right next to the file they are working on. It will rather be installed by python package installer (PIP) that installs python modules built by other developers and it will be available on the python import path. This is where you would need a `setup.py` file. A `setup.py` file is a normal python file that instructs PIP how to install a module or a package.



## Difference between a module and a package

A module is a single file, a package is a folder of modules.

list of modules

![](E:\GitHub\Articulae\mds\educative\releasing_a_library\Screenshot%202023-07-05%20103652.png)

A package

![](E:\GitHub\Articulae\mds\educative\releasing_a_library\Screenshot%202023-07-05%20103722.png)

A package can be imported as

```python
from smart_functions import functions, directory_functions
```

pass

### Regular packages and namespace packages

During the days of Python 2 and before PEP 400, you couldn't create a package as we have done above. A package had to contain an `__init__.py` file. If it looks funny, it is intentionally so. Python wanted a unique file that will differentiate a python package from all other folders, so they settled on this filename. This file had to be there before. But now since PEP 400, you don't have to. But Python maintains the two so we now have a package that contains an `__init__.py` file which  is known as a **regular package** and a package that doesn't contain an `__init__.py` file which is known as a **namespace package**. Keep this two differences in mind it will be useful when building your package.

But an `__init__.py` file can be useful.

Lets say `deep_folder/deeper_folder/deep_module.py`

```shell
from .deep_folder.deeper_folder import deep_module

```

Then the user can just do:

`main.py`

```python
from smart_functions import deep_module

deep_module.amazing_func()
```



## Structuring a folder

If it was a single module



![](E:\GitHub\Articulae\mds\educative\releasing_a_library\Screenshot%202023-07-05%20095438.png)



If it was a package

![](E:\GitHub\Articulae\mds\educative\releasing_a_library\Screenshot%202023-07-05%20102053.png)

Because the `setup.py` should be next to the package, if there were multiple packages in a single folder, there would also be multiple `setup.py` files so it is best to also put the package and the `setup.py` file in a seperate folder.

```shell
- smart_functions
  - smart_functions
    - functions.py
  - setup.py
```

This would fit perfectly in a git repository like:

![](E:\GitHub\Articulae\mds\educative\releasing_a_library\Screenshot%202023-07-05%20140158.png)
