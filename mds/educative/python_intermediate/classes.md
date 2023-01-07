# Classes

Classes are the embodiment of Object oriented programming. Classes combine data and functionalilty in one scope. Classses combine variable declarations and function declarations. Functions declared inside a class in called a method. And both variables and methods are called attributes of a class. It is pragmatic to start a class name with a capital letter just to differentiate it from a function, and not a requirement.



A simple class implementation is:

```python
class BigClass():
    x = 1
    y = 2

    def say_hello(self):
        print('hello')
```



Class instances are objects. `obj1` and `obj2` are both instances of class `BigClass`

```python

class BigClass():
    x = 1
    y = 2

    def say_hello(self):
        print('hello')


obj1 = BigClass()
obj2 = BigClass()

print("Is obj1, same as obj2?", obj1 == obj2)

```



`obj1` is an object of the class `BigClass`, but it is different from `obj2` of the same `BigClass`. This makes classes reusable and interesting as you can change the data stored in one object without affecting other objects. This behaviour can be obstructed though, if we so wish.



An `__init__` method is called whenever an object is instantiated. You can overide this to control what happens when an instance is created.

```python

class BigClass():
    x = 1
    y = 2

    def __init__(self):
        print('An instance has been created')

    def say_hello(self):
        print('hello')


obj1 = BigClass()
obj2 = BigClass()

```

The `self` parameter refers to the instance of the class, you can call it whatever you want. But it is pragmatics to call it `self`. Actually `self`, is passed on to every method declared inside the class. That is how they modify data and access other methods in the same instance of a class.

```python

class BigClass():
    x = 1
    y = 2

    def __init__(self):
        print('An instance has been created')
        self.say_hello()

    def say_hello(self):
        print(f'hello: {self.x}, {self.y}')


obj1 = BigClass()

```

Variables too can be declared inside the methods. But you must assign them using the instance of the object, `self`. Otherwise the varible will become a local variable to the method.

```python

class BigClass():
    x = 1
    y = 2

    def __init__(self):
        self.z = 30
        self.say_hello()

    def say_hello(self):
        print(f'hello: {self.z}')


obj1 = BigClass()

```

Classes can inherit other classes

```python

class BigClass():
    x = 1
    y = 2

    def __init__(self):
        self.say_hello()

    def say_hello(self):
        print(f'hello')


class SmallClass(BigClass):
    
    def __init__(self):
        self.say_hello()


small_obj = SmallClass()

```

In this case `SmallClass` has inherited `BigClass`. So we say `BigClass` is the parent of `SmallClass` and `SmallClass` is a child. Sake of the inheritance, `SmallClass` can access all the methods and variables of `BigClass` as if it was his. Incase they both use the same name for a method or a variable, the child class' variable is said to override the parents. But the parent's is still there and can be called using a new class name `super`.

```python

class BigClass():
    x = 1
    y = 2

    def __init__(self):
        self.name = "World!"
        self.say_hello()

    def say_hello(self):
        print(f'hello, {self.name}')


class SmallClass(BigClass):

    def __init__(self):
        super().__init__()
        self.say_hello()


small_obj = SmallClass()
all_obj = SmallClass()

```

This is mostly the norm that you have to call the parent class' `__init__` method and not the exception. It is probable that there are some variable declarations in there and/or some methods were called from there.



It is also possible to call the parent `__init__` method using the class name and then pass in the child instance `self`

```python
...

class SmallClass(BigClass):

    def __init__(self):
        BigClass.__init__(self)
        self.say_hello()


...
```


