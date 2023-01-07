# Inner Functions

Functions can be defined inside other functions. Those functions are called inner functions. Inner functions have access to variables declared in the outer functions. The outer function on the other hand doesn't have access to variables declared inside the inner functions. They are mainly used in the implementation of python decorators.

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
