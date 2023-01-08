# Threading

Threading is indespensible in modern GUI programming. If a GUI application isn't multi-threading the GUI will show "Not responding" most of the time.

An application's user interface becomes unresponsive when the UI and a background process are all running on the same thread. So the UI will  have to wait for the background process to finish before it continues. This cause the UI to freeze and becomes unresponsive.

Qt framework has threading classes we can use. Python also has threading classes in its standard library. Per programming best practices, if there exist classes in the standard library it should be used instead of those provided by a third-party library or framework. So we will be using the threading classes in the standard library.



```python
import threading

def print_tens():
    x = 0
    while x < 100:
        x += 1
        print(x)

def print_hundreds():
    x = 99
    while x < 200:
        x += 1
        print(x)


tens_thread = threading.Thread(target=print_tens)
tens_thread.start()

hundred_thred = threading.Thread(target=print_hundreds)
hundred_thred.start()

print(f"Total no. of Threads: {threading.active_count()}")

```

It will intrest you to know that the main thread ended when the last statement ended which is the `print` statement on line 23. But if you check the output you can see that our two threads continued to run. In fact if it was a GUI, they would have continued running even after the window has been closed. This behaviour can be changed by setting the `daemon` property.



```python
import threading

def print_tens():
    x = 0
    while x < 100:
        x += 1
        print(x)

def print_hundreds():
    x = 99
    while x < 200:
        x += 1
        print(x)


tens_thread = threading.Thread(target=print_tens)
tens_thread.daemon = True
tens_thread.start()

hundred_thred = threading.Thread(target=print_hundreds)
hundred_thred.daemon = True
hundred_thred.start()

print(f"Total no. of Threads: {threading.active_count()}")

```

This time all functions end abruptly after the last statement. We might get some error, this is because the process was ended mid-way.

If the functions you want to run accpet parameters, you can pass them in the Thread class. `args` for arguments, `kwargs` for keyword arguments

```python
import threading

def print_tens(y):
    for x in range(y):
        x += 1
        print(x)

def print_hundreds(y=100):
    for x in range(99, y):
        x += 1
        print(x)


tens_thread = threading.Thread(target=print_tens, args=[100])
tens_thread.start()

hundred_thred = threading.Thread(target=print_hundreds, kwargs={"y":200})
hundred_thred.start()

print(f"Total no. of Threads: {threading.active_count()}")

```


