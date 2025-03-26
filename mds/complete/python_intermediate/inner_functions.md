# Inner Functions

## Introduction

Functions can be defined inside other functions. Those functions are called inner functions. Inner functions have access to variables declared in the outer functions. The outer function on the other hand doesn't have access to variables declared inside the inner functions.

```python
def outer_function():

    print("This is the main function")
    first_name = "Jane"

    def inner_function(last_name):

        print("This is the inner function")

        print(f"It has access to {first_name}")

        print(f"And of course you can pass in vars like: {last_name}")

    inner_function('Doe')


outer_function()
```

## Function attributes

Even though `first_name` can be accessed in `inner_function`, it cannot be set to a new value in `inner_function`, since it doesn't belong to it. The code below will not work.

```python

def outer_function():

    print("This is the main function")
    first_name = "Jane"
    counts = 0

    def inner_function(last_name):

        print("This is the inner function")

        counts += 1

        print(f"It has access to {first_name}")

        print(f"And of course you can pass in vars like: {last_name}")

    inner_function('Doe')


outer_function()

```

Everything in python is an object. That means functions are objects. Objects have attributes, which means that functions have attributes.

```python
def outer_function():

    print("This is the main function")
    first_name = "Jane"
    outer_function.counts = 0

    def inner_function(last_name):

        print("This is the inner function")

        outer_function.counts += 1
        print(outer_function.counts)

        print(f"It has access to {first_name}")

        print(f"And of course you can pass in vars like: {last_name}")

    inner_function('Doe')


outer_function()

```

Remember, it has to be the function name, you can't use a name you choose. For example the code below will give an error.

```python
def outer_function():

    print("This is the main function")
    first_name = "Jane"
    some_function.counts = 0

    def inner_function(last_name):

        print("This is the inner function")

        some_function.counts += 1
        print(some_function.counts)

        print(f"It has access to {first_name}")

        print(f"And of course you can pass in vars like: {last_name}")

    inner_function('Doe')


outer_function()

```

The concept of inner functions are mainly used in the implementation of python decorators.
