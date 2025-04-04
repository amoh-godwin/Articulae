# Controlling Properties like a Python Core Developer - When, How and When not.

Python `property` is one you would know as an intermediate programmer, or you would go after if you were an intermediate developer and/or a big fan of Object Oriented Programming (OOP).

## When would you want to use it

When,

* You want a property to be readonly

* Prevent the deletion of certain items

* Ensure all element are homogenous

* You don't want your code to break because:

* 1. A property doesn't exist
  
  2. A list is empty.

## How would you do these

By,

Using the `property`  decorator.

With it you can,

### Turn a method into a property

```python
class ProgressReport:

    def __init__(self) -> None:
        self._progress = 19

    @property
    def progress(self):
        return self._progress


reporter = ProgressReport()
print(reporter.progress)
```

With the code above, progress will become the property. When you call it, it returns the  self._progress property. The self._progress has been utilised as a private property. *The underscore that begins it mostly deters people from setting it directly*.

Printing doesn't show any trace that this is a method or some kind of a special property.

```python
print(type(reporter.progress))
```

But the property classs offer much more. There is a setter, which gets called whenever you want to set a value to the property.

With this we can control the values, and how we set them to the property

```python
class ProgressReport:

    def __init__(self) -> None:
        self._progress = 19

    @property
    def progress(self):
        return self._progress

    @progress.setter
    def progress(self, value):
        if value in range(0, 101):
            self._progress = value
        else:
            raise Exception("progress accepts a value from 0 to 100")

reporter = ProgressReport()
reporter.progress = 500
print(reporter.progress)
```

In the code above, we make sure the property will only be set if the value is from 1 to 100.

### Make a property readonly

You can make a property readonly, you can prevent its value from being changed. *However you can still set it privately*.

Here we create a method update_progress, that we use to update the value of the property.

```python
class ProgressReport:

    def __init__(self) -> None:
        self._progress = 19

    @property
    def progress(self):
        return self._progress

    @progress.setter
    def progress(self, value):
        raise Exception("progress is readonly")

    def update_progress(self, value):
        self._progress = value

reporter = ProgressReport()
reporter.update_progress(96)
print(reporter.progress)
reporter.progress = 99
```

If you do not intend to set it privately, you can choose to not to have a method that sets it. So, for instance in our code above, the `update_progress` method will not have been written.

### You can control its deletion

You can successfully prevent the deletion of a property entirely.

```python
class ProgressReport:

    def __init__(self) -> None:
        self._progress = 19

    @property
    def progress(self):
        return self._progress

    @progress.setter
    def progress(self, value):
        raise Exception("progress is readonly")

    def update_progress(self, value):
        self._progress = value

    @progress.deleter
    def progress(self):
        print('Performing housekeeping before deletion')
        del self._progress


reporter = ProgressReport()
del reporter.progress
print(reporter.progress)
```

## When not to use the property to achieve your needs

In instances where you want to control a list or a dict, you can't achieve that with the property decorator. But that does not mean you can't control the property. You can still control the property by subclassing it.

### Lists

Normally trying to create a list, is as simple as:

```python
list1 = [1, 2, 3]
print(list1[5])
```

But now, you subclass it and use your class to create your list.

This way, you can prevent a break and return a None.

```python
class MyList(list):

    def __init__(self, items=[]):
        super().__init__(items)

    def __getitem__(self, index):
        length = super().__len__()
        if length == 0 or index > (length - 1):
            return None
        else:
            super().__getitem__(index)


list2 = MyList([1, 2, 3])
print(list2[5])
```

You can control its append method

```python
class MyList(list):

    def __init__(self, items=[]):
        super().__init__(items)

    def __getitem__(self, index):
        length = super().__len__()
        if length == 0 or index > (length - 1):
            return None
        else:
            super().__getitem__(index)

    def append(self, value):
        type_ = type(value)
        if type_ != type(0):
            print('This list only accepts integers')
        else:
            super().append(value)

list2 = MyList([1, 2, 3])
list2.append('4')
list2.append(4)
print(list2)
```

and all its other functions.

### Dicts

You can do the same for dicts

```python
class MyDict(dict):

    def __init__(self, items={}):
        super().__init__(items)

    def __setitem__(self, _key, _value) -> None:
        print(f"Inserting {_key}")
        return super().__setitem__(_key, _value)

    def __getitem__(self, _key):
        length = super().__len__()
        if length < 0 or _key not in super().items():
            print(f"Key: {_key} doesn't exits")
            return None
        return super().__getitem__(_key)

    def __delitem__(self, _key) -> None:
        if _key == 'admin':
            print("You can't delete admin entry")
            return
        return super().__delitem__(_key)


dict1 = MyDict({'admin': 'active'})
print(dict1['johndoe'])
dict1['janemaxwell'] = 'inactive'
print(dict1)
del dict1['admin']
```
