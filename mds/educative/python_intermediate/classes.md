# Classes

Classes are the embodiment of Object oriented programming. Classes combine data and functionalilty in one scope. Classses combine variable declarations and function declarations.  It is easy to implement.



A simple class implementation is:

```python
class BigClass():
    x = 1
    y = 2

    def say_hello(self):
        print('hello')
```



Class instances are objects. obj1 and obj2 are both instances of class BigClass

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



As you can see in the code above obj1 is an object of the class BigClass, but it is different from obj2 of the same BigClass. This makes classes reusable and interesting as you can change the data stored in one object without affecting other objects. This behaviour can be obstructed though, as we will see later.




