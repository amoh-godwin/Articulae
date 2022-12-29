# Python Decorators: How to Create and Use with Examples

## Introduction

Everything in the python programming language is an object. First-class objects are objects that can be dynamically created, destroyed, passed as a parameter to a procedure/function, returned as a value from a procedure/function. In languages like c++ and Java everythig is not a first-class object but in python everything is. Which means that functions and classes themselves can be passed as parameters.

```python
def day_based_greeting():
    print("Good Afternoon")

def greeting(func):
    print("Hello, John")
    func()

greeting(day_based_greeting)
```

*Listing 1.0*

Notice how that `day_based_greeting` has been passed into `greeting` without the brackets. The brackets indicate that it is being called.

The output will be:

```shellsession
Hello, John
Good Afternoon
```

### Inner functions

Functions can also be declared inside other functions.

```python
from datetime import datetime

def say_hello(name):
    hour = datetime.now().hour

    print(f"Hello, {name}")

    def day_based_greeting():
        greeting = ''
        if hour > 18:
            greeting = "Good Evening"
        elif hour < 12:
            greeting = "Good Morning"
        else:
            greeting = "Good Afternoon"

        print(greeting)

    day_based_greeting()


say_hello('Guido')
```

*Listing 1.1*

Outputs:

```shellsession
Hello, Guido
Good Morning
```

In Listing 1.1, we have an inner function `day_based_greeting` inside the function `say_hello`. The variable `hour` is accessible to `day_based_greeting` but `greeting` isn't accessible to the `say_hello` function. In essence all variables, including parameters passed to the outer function are accessible to the inner function without being explicitedly passed to it.

## Introduction to Decorators

What if we wanted this kind of greeting whenever we want to say hello and whenever we want to bid farewell. We could just move our function out and call it from another function say `bid_farewell()`.What if we wanted to be sure, whoever we wanted to say hello to was a registered user, we would need some functions to run before, we run our `say_hello` before we run our `day_based_greeting`.

```python
from datetime import datetime


def day_based_greeting():
    hour = datetime.now().hour
    greeting = ''
    if hour > 18:
        greeting = "Good Evening"
    elif hour < 12:
        greeting = "Good Morning"
    else:
        greeting = "Good Afternoon"

    print(greeting)


def is_user_registered(username: str) -> bool:
    registered_users = ('Guildo', 'Guru99', 'Ampofo')
    print(f'is user registered: {username in registered_users}')


def say_hello(name):
    print(f"Hello, {name}")


user = 'Ruby'
is_user_registered(user)
say_hello(user)
day_based_greeting()
```

```shellsession
is user registered: False
Hello, Ruby
Good Afternoon
```

Python offers a new syntax known as decorators where we decorate a function/class with another function/class using the `@` symbol. Using this syntax we can handle processes before and after a function/class is called and even its inputs and what happens to its outputs.

It is used extensively in web programming and Gui programming in python.

With it python calls the decorator function and passes in the decorated and then assigns the return value to the decorated function as:

```python
def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")
    return lambda : print('What I return is the decorated function')

@decorator
def decorated():
    print("I have been well decorated")
```

Listing 2.1

Just runing the code in Listing 2.1, without calling the decorated function, you will see that python has called the decorator function, so it will output

```shellsession
I am for decoration
I have received decorated as a prameter
```

Because, under the hood, python is calling the decorator and assigning its return value to the decorated as:

```python
decorated = decorator(decorated)
```

So now when we run the decorated, we can see that it run our lambda function which was return by the decorator:

```python
...


@decorator
def decorated():
    print("I have been well decorated")


decorated()
```

This will print

```shellsession
I am for decoration
I have received decorated as a prameter
What I return is the decorated function
```

If we want to run the decorated function we can return that rather, since the decorator received it as a parameter.

```python
def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")
    return func

@decorator
def decorated():
    print("I have been well decorated")


decorated()
```

Now when we run we would see

```shellsession
I am for decoration
I have received decorated as a prameter
I have been well decorated
```

With this you can see that we can control when a function runs just by decorating it.

But now a problem arises. What if we want to control what happens after the function runs. We can, if we utilize the concept of inner functions. 

With inner functions we return our inner function to the decorated, when it gets called we call the decorated and then handle other processes after its done executing.

```python
def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")

    def inner_function():
        func()
        print('we are still here after running the decorated')

    return inner_function

...
```

this outputs

```shellsession
I am for decoration
I have received decorated as a prameter
I have been well decorated
we are still here after running the decorated
```

But now another problem arises. What happens to parameters that will be passed to the decorated function.

---



---

## How to add arguments to decorators in Python

You see, once you are returning a function as the decorated, when the decorated gets called all the parameters it is called with will be passed to the function you are returning, it is the decorated now.

```python
def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")

    return func # this will receive the parameters, when called


@decorator
def decorated(name, sister):
    print(f"Name is: {name}, My sister is: {sister}")


decorated('John', 'Jane')
```

This will print

```python
I am for decoration
I have received decorated as a prameter
Name is: John, My sister is: Jane
```

So when you are returning an inner function, you must also receive the parameters in the inner function and also pass it in when you call the decorated in the inner function as:

```python
def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")

    def inner_function(x, y):
        func(x, y)
        print('I am done with all I want to do')

    return inner_function # this will receive the parameters, when called
```

This will return

```shellsession
I am for decoration
I have received decorated as a prameter
Name is: John, My sister is: Jane
I am done with all I want to do
```

### Passing arguments to Decorators themselves

The syntax of decorators allows you to call them as if they were functions and its return statement will function as the decorator:

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

With this you concept, no decorator is available yet, so nothing gets passed into the `decorator_wrapper`, you are free to provide your own parameters as:

```python
def decorator_wrapper(x, y):

    print(f"we have our decorator params: {x, y}")

    def decorator(func):
        print("I am for decoration")
        print(f"I have received {func.__name__} as a prameter")

        def inner_function(x, y):
            func(x, y)
            print('I am done with all I want to do')

        return inner_function


    return decorator


@decorator_wrapper('Joseph', 'Josephine')
def decorated(name, sister):
    print(f"Name is: {name}, My sister is: {sister}")


decorated('John', 'Jane')
```

Run this and you will have

```python
we have our decorator params: ('Joseph', 'Josephine')
I am for decoration
I have received decorated as a prameter
Name is: John, My sister is: Jane
I am done with all I want to do
```

## Returning values from decorated functions

When you are running the decorated inside the inner function, you have access to the return value, you can do whatever you want with it or since the inner function is actually the function that will be run as decorated, you can return the return value of the decorated function as the return value of the inner function, as:

```python
def decorator_wrapper(x, y):

    ...

    def decorator(func):
        ...

        def inner_function(x, y):
            return_val = func(x, y)
            print('I am done with all I want to do')
            return return_val

        return inner_function
    return decorator


@decorator_wrapper('Joseph', 'Josephine')
def decorated(name, sister):
    return f"Name is: {name}, My sister is: {sister}"


print(decorated('John', 'Jane'))
```

You will get the return value as:

```shellsession
we have our decorator params: ('Joseph', 'Josephine')
I am for decoration
I have received decorated as a prameter
I am done with all I want to do
Name is: John, My sister is: Jane
```

## Reusing a decorator on multiple functions

Reusability is one of the reasons why decorators are important. But there arises a problem, how do you handle different number of parameters for different decorated functions. For that we use the good old python concept of `*args` and `**kwargs`.

`*args` and `**kwargs` are pragmatics, you can call them whatever you want, but strictly write them with the stars.

`*args` will pack all supplied arguments as a tuple:

```python
def delete_files(*my_args):
    print(f"we are deleting: {my_args}") 


delete_files('NewTextDocument.txt', "New Folder", "Video(2).mp4")
```

This will output

```shellsession
we are deleting: ('NewTextDocument.txt', 'New Folder', 'Video(2).mp4')
```

Where as `**kwargs` will pack all the parameters as a dictionary

```python
def move_files(**my_kwargs):
    print(f"Settings for move are: {my_kwargs}") 


move_files(destination="C:/Users/Downloads", replace_existing=False)
```

This will also output

```
Settings for move are: {'destination': 'C:/Users/Downloads', 'replace_existing': False}
```

### Using them for decorators

```python
def decorator(func):
    print("I am for decoration")
    print(f"I have received {func.__name__} as a prameter")

    def inner_function(*args, **kwargs):
        return_val = func(*args, **kwargs)
        print('I am done with all I want to do')
        return return_val

    return inner_function



@decorator
def decorated(name, sister):
    return f"Name is: {name}, My sister is: {sister}"


@decorator
def another_decorated(source='', destination=""):
    print(f'We are moving files from {source} to {destination}')


@decorator
def third_decorated(**kgs):
    print(f"source: {kgs['source']}, destination: {kgs['destination']}")


print(decorated('Joseph', 'Josephine'))
another_decorated(source='C:/Users/Downloads', destination='G:/')
third_decorated(source='C:/Users/Downloads', destination='G:/')
```

will output

```shellsession
I am for decoration
I have received decorated as a prameter
I am for decoration
I have received another_decorated as a prameter
I am for decoration
I have received third_decorated as a prameter
I am done with all I want to do
Name is: Joseph, My sister is: Josephine
We are moving files from C:/Users/Downloads to G:/
I am done with all I want to do
source: C:/Users/Downloads, destination: G:/
I am done with all I want to do
```

You can see that the decorator run for each time it was used

## Multiple decorators on a single function

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

You will see an output as:

```shellsession
I am for decoration
I have received decorated as a prameter
inner_function is received
Name is: Joseph, My sister is: Josephine
I am done with all I want to do
Post processing done
```

## A decorator within a function

A decorator can be applied on inner functions as well if need be.

```python

...

def decorated(name, sister):

    @decorator
    def decorated2():
        print(f"Name is: {name}, My sister is: {sister}")
    
    decorated2()


decorated('Joseph', 'Josephine')
```



## Preserving function metadata

Printing a function's metadata before it has been reassigned gives the original function's metadata but after it has been decorated, it gives the metadata of the inner function.

```python
def decorator(func):
    print(f"function name before reassignment is: {func.__name__}")

    def inner_function(*args, **kwargs):
        """Returns the decorated function"""
        return_val = func(*args, **kwargs)

    return inner_function


@decorator
def male_and_female(name, sister):
    """Juxtapose Male and female names"""
    print(f"Name is: {name}, My sister is: {sister}")


male_and_female('Joseph', 'Josephine')

print(f"function name after reassignment: {male_and_female.__name__}")
print(f"function docstring: {male_and_female.__doc__}")
```

will output

```shellsession
function name before reassignment is: male_and_female
Name is: Joseph, My sister is: Josephine
function name after reassignment: inner_function
function docstring: Returns the decorated function
```

This is rightly so, since it has been set `male_and_female` has been set to `inner_function`. But there is a way you can preserve the original function's metadata even after its been decorated.

With this we use python's built-in `functools.wraps` decorator.

```python
from functools import wraps

def decorator(func):
    print(f"function name before reassignment is: {func.__name__}")

    @wraps(func)
    def inner_function(*args, **kwargs):
        """Returns the decorated function"""
        return_val = func(*args, **kwargs)

    return inner_function


...


male_and_female('Joseph', 'Josephine')

print(f"function name after reassignment: {male_and_female.__name__}")
print(f"function docstring: {male_and_female.__doc__}")


```

will output

```shellsession
function name before reassignment is: male_and_female
Name is: Joseph, My sister is: Josephine
function name after reassignment: male_and_female
function docstring: Juxtapose Male and female names
```

## Decorating a class

In decorating classes if you decorate the class as a whole, only the instantiating of the class into an object is affected, not when you call individual methods.

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

Decorating each method with a function would have been much better

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

For classes, the `__init__`  is called whenever a class is being initialised into an object, but the `__call__` method is fired whenever that object is called.

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
blue
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

If classes are used as decorators on methods, the self will be the first argument passed to the `__call__`

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



## Built-in Fancy Decorators

You have already seen the built-in `@wraps` decorator there are other decorators, some of which I am sure you will meet sooner or later or you have even met them, namely `@staticmethod`, `@classmethod` and `@dataclass`



### @staticmethod

`@staticmehod` is ued to decorate methods that do not modify the class instance and hence do not expect `self` as a parameter it.

```python
import os

class Filesystem:

    @staticmethod
    def fix_splashes(old_path):
        fixed_path = old_path.replace(os.devnull, '/')
        return fixed_path

fs = Filesystem()
fixed = fs.fix_splashes('C:\\Users\\John')
print(fixed)
```

will output

```shellsession
C:\Users\John
```

Accessing it without the `@staticmethod` decorator will get the class instance passed to it and will cause an error.



### @classmethod

`@classmethod` is very much like `@staticmethod`, the only difference is `@classmethod` receives a reference to the class instance as the first parameter.

```python
...

    @classmethod
    def fix_splashes(cls, old_path):
        print(f'class is called {cls.__name__}')
        ...

...
```

will output

```shellsession
class is called Filesystem
C:\Users\John
```

### @dataclass

`@dataclass` converts a class into a datatype wth its fields accessed using the dot (`.`) syntax

```python
from dataclasses import dataclass, asdict


@dataclass
class Folder:
    name: str
    files: list[str]

drive_c = Folder('C', ['a.txt', 'b.txt'])
users = Folder('Users', ['c.txt', 'd.txt'])

print(drive_c)
print(drive_c.name)
print(users.files)

```

will output

```shellsession
Folder(name='C', files=['a.txt', 'b.txt'])
C
['c.txt', 'd.txt']
```

You can also convert them to dictionary

```python

...
print(users.files)
user_folder = asdict(users)
print(user_folder['files'])
```



## Stateful Decorators

Since a decorated function has been set to the inner function of a decorator. The decorator can be used to keep track of the decorated.

```python

def limit_retries(func):
    limit = 3
    limit_retries.retries = 0

    def wrapper(*args, **kwargs):
        limit_retries.retries += 1
        
        if limit_retries.retries <= limit:
            func(*args, **kwargs)
        else:
            print("You have reached the maximum allowed. Bye!")

    return wrapper

@limit_retries
def answer(passcode):

    if passcode == 'Guildo':
        print('Welcome')
    else:
        print("Incorrect")


print("Enter founder of Python's firstname to enter: ")

answer("John")
answer("Rahul")
answer("Jin")
answer("Tim")
```

will output

```python
Enter founder of Python's firstname to enter:
Incorrect
Incorrect
Incorrect
You have reached the maximum allowed. Bye!
```



## Example use cases of decorators

### Record history

We can time a function using the timeit module as;

```python
from timeit import timeit

def record_history(func):

    def inner_caller():
        diff = timeit(func, number=1)
        print(f"function: {func.__name__} was called. It ran for {diff} secs")
    return inner_caller

@record_history
def delete():
    print('Deleting a file')

delete()
```

will output

```shellsession
Deleting a file
function: delete was called. It ran for 0.0 secs
```



## Where you don't need decorators

## Summary
