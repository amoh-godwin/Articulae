# Decorators

Decorators is a python meta programming concept where a function/class is used to wrap another funcion/class and by this controls it execution at runtime and to some extent modify its state.

In python, a function or class can be passed as a parameter to another function or class in the same way as variable or a string can. Languages like Java and C++ does not allow this kind of functionality. So in python everything is a first-class object.

Consider the code below

```python
from time import time

def timer(func):

    start_t = time()
    func()
    end_t = time()
    print(f"It took {end_t - start_t} secs. to run {func.__name__}")
    return lambda: print(f"Ha ha ha! You were expecting {func.__name__}")


@timer
def do_something():
    print('I am doing something')
```

You can see that we have two functions `timer` and `do_something`.

 `do_something` has been decorated with `timer` using the `@` symbol.

**With this `timer` becomes the *decorator* and `do_something`, the *decorated*.**

When  a function is decorated, what python translate it to is:

```python
decorated = decorator(decorated)
```

So when you run the code you will notice that `timer` will run, because it has been used to decorate `do_something`. And calling `do_something` you will notice it has changed, it has now become the lambda function on line 9.

```python
from time import time

def timer(func):

    start_t = time()
    func()
    end_t = time()
    print(f"It took {end_t - start_t} secs. to run {func.__name__}")
    return lambda: print(f"Ha ha ha! You were expecting {func.__name__}")


@timer
def do_something():
    print('I am doing something')


do_something()'
```

Although we run it inside  `timer` on line 6, we expect it to run, when we call it, not before and not some lambda function.

With this we utilize inner functions.

```python
from time import time

def timer(func):

    def inner():
        start_t = time()
        func()
        end_t = time()
        print(f"It took {end_t - start_t} secs. to run {func.__name__}")

    return inner


@timer
def do_something():
    print('I am doing something')


do_something()
```

Now when we call `do_something` our inner function runs. And from within it we call the actual `do_something` function.

If `do_something` has parameters it should be handled inside `inner` and passed on to `func`.

```python
from time import time

def timer(func):

    def inner(x, y):
        start_t = time()
        func(x, y)
        end_t = time()
        print(f"It took {end_t - start_t} secs. to run {func.__name__}")

    return inner


@timer
def do_something(x, y):
    print(f'Total of x and y: {x+y}')


do_something(4, 8)
```

To make decorators more reusable, its best if parameters are handled using `*args` and `**kwargs`.

`*args` and `**kwargs` can handle any type and any number of parameters.

```python
from time import time

def timer(func):

    def inner(*args, **kwargs):
        start_t = time()
        func(*args, **kwargs)
        end_t = time()
        print(f"It took {end_t - start_t} secs. to run {func.__name__}")

    return inner


@timer
def do_something(x, y, z=''):
    print(f"{z=:}")
    print(f'Total of x and y: {x+y}')


do_something(4, 8, z='Add')
```

If `do_something` returns a value too, you can return it from the inner function.

```python
from time import time

def timer(func):

    def inner(*args, **kwargs):
        start_t = time()
        ret_val = func(*args, **kwargs)
        end_t = time()
        print(f"It took {end_t - start_t} secs. to run {func.__name__}")
        return ret_val

    return inner


@timer
def do_something(x, y, z=''):
    return x + y


total = do_something(4, 8, z='Add')

print(f"{total=:}")
```

## Passing arguments to Decorators themselves

The syntax of decorators allows you to call them as if they were functions and its return value will function as a decorator, as:

```python
@decorator_wrapper()
def decorated():
    pass
```

will be translated as

```python
returned_decorator = decorator_wrapper()
decorated = returned_decorator(decorated)
```

With this you concept, no decorator is available yet, so no function gets passed into the `decorator_wrapper`, you are free to provide your own parameters as:

```python
def decorator_wrapper(a, b):


    def decorator(func):
        print("I am for decoration")
        print(f"I have received {func.__name__} as a parameter")

        def inner_function(x, y):
            print(f"inner functions have access to: {a, b}")
            func(x, y)
            print('I am done with all I want to do')

        return inner_function


    return decorator


@decorator_wrapper('Masculine', 'Feminine')
def decorated(name, sister):
    print(f"Masculine name is: {name}, Feminine name is: {sister}")


decorated('John', 'Jane')
```

## Multiple decorator

Multiple decorators on a single function

You can also stack up decorators on a single function.

```python
def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")

    def inner_function(*args, **kwargs):
        return_val = func(*args, **kwargs)
        print('I am done with all I want to do')

    return inner_function


def decorator2(func):

    print(f"{func.__name__} is received")

    def inner_function(*args, **kwargs):
        func(*args, **kwargs)
        print('Post processing done')

    return inner_function


@decorator2
@decorator
def decorated(name, sister):
    print(f"Name is: {name}, My sister is: {sister}")


decorated('Joseph', 'Josephine')
```

The underlying translation is as:

```python
decorated = decorator2(decorator(decorated))
```

Since python translates code from left to right, `decorator` will first run and then return its inner function to `decorator2`, which will run and return its `inner_function` to `decorated`. So when `decorated` is called, it will call the `inner_function` of `decorator2` which will call `inner_function` of `decorator` which will call the `func`.

Decorating a class

In decorating classes, if you decorate the class as a whole, only the instantiating of the class into an object is affected, all other methods are not affected.

```python
def decorator(func):

    def inner_function(*args, **kwargs):
        ret = func(*args, **kwargs)
        print('Decorator ends here')
        return ret

    return inner_function


@decorator
class FileSystem():

    def __init__(self):
        print('Creating Class')
        self.current_folder = "."
        self.total_size = 0

    def copy_files(self, source: str):
        print('copying files')


fs = FileSystem()
fs.copy_files('.')
```

outputs

```shellsession
Creating Class
Decorator ends here
copying files
```

You can see that the decorator wasn't called for `fs.copy_files`

Decorating each method with a function is the way to go

```python
...

class FileSystem():

    @decorator
    def __init__(self):
        print('Creating Class')
        self.current_folder = "."
        self.total_size = 0

    @decorator
    def copy_files(self, source: str):
        print('copying files')


fs = FileSystem()
fs.copy_files('.')
```

outputs

```shellsession
Creating Class
Decorator ends here
copying files
Decorator ends here
```

## Classes as decorators

For classes, the `__init__` is called whenever a class is being initialised into an object, but the `__call__` method is fired whenever that object is called.

```python
class FileSystem():

    def __init__(self):
        print('Creating Class')
        self.current_folder = "."
        self.total_size = 0

    def __call__(self):
        print('I have been called')

    def copy_files(self, source: str):
        print('copying files')


fs = FileSystem()
print("checkpoint")
fs()
fs.copy_files('.')
```

this will output

```shellsession
Creating Class
checkpoint
I have been called
copying files
```

You can see that the `__call__` method rather than the `__init__` method should be used to wrap the decorated function/class.

```python
class Decorator:

    def __init__(self, func):
        self.func = func

    def __call__(self, *args, **kwargs):
        print(f'preprocesses for {self.func.__name__}')
        return self.func(*args, **kwargs)

@Decorator
class FileSystem():

    def __init__(self):
        print('Creating Class')
        self.current_folder = "."
        self.total_size = 0

    def copy_files(self, source: str):
        print('copying files')


fs = FileSystem()
fs.copy_files('.')
```

If classes are used as decorators on methods, the `self` will be the first argument passed to the `__call__`

```python
class Decorator:

    def __init__(self, func):
        self.func = func

    def __call__(*args, **kwargs):
        self = args[0]
        print(f'preprocesses for {self.func.__name__}')
        self.func(*args, **kwargs)


class FileSystem():

    @Decorator
    def __init__(self):
        print('Creating Class')
        self.current_folder = "."
        self.total_size = 0

    @Decorator
    def copy_files(self, source: str):
        print('copying files')


fs = FileSystem()
fs.copy_files('.')
```

will output

```shellsession
preprocesses for __init__
Creating Class
preprocesses for copy_files
copying files
```

The same goes for when a class has been used to decorate a function.
