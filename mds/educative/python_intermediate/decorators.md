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



Decorators can be given parameters

```python
from time import time


def timer_wrapper(x):
    print(f"We have the value that was passed in: {x}")

    def timer(func):

        def inner(*args, **kwargs):
            start_t = time()
            ret_val = func(*args, **kwargs)
            end_t = time()
            print(f"It took {end_t - start_t} secs. to run {func.__name__}")
            return ret_val

        return inner

    return timer


@timer_wrapper(7)
def do_something(x, y, z=''):
    return x + y


total = do_something(4, 8, z='Add')

print(f"{total=:}")
```

This way `timer_wrapper` is returning a decorator. So there are two inner functions with this syntax.
