# Efficient Python: F-Strings

Python string formatting is a great tool to have in your toolbox. Python f-strings are updates on python string formatting. Its faster at runtime and its easier to write. Once you start using it, there is no going back.

This is how `str.format()` code works:

```python
brother = "John"
sister = "Jane"

print("Hello, {0} and {1}".format(brother, sister))
```

Prints:

```shell-session
Hello, John and Jane
```

And concatenation code:

```python
folder = "/home/user/john/movies"
filename = "Big Buck Bunny.mp4"

print("The folder name is '" + folder + "' and the filename is '" + filename + "' ")
```

```shell-session
The folder name is '/home/user/john/movies' and the filename is 'Big Buck Bunny.mp4'
```

## Using the improved f-strings

Lets replace `str.format` in the examples above and see how easy **f-strings** are

**1st example**

```python
brother = "John"
sister = "Jane"

print(f"Hello, {brother} and {sister}")
```

```shell-session
Hello, John and Jane
```

**2nd example**

```python
folder = "/home/user/john/movies"
filename = "Big Buck Bunny.mp4"

print(f"The folder name is '{folder}' and the filename is '{filename}' ")
```

```shell-session
The folder name is '/home/user/john/movies' and the filename is 'Big Buck Bunny.mp4'
```

You can even write expressions in the curly brackets

```python
import os


fullpath = "/home/user/john/movies/Big Buck Bunny.mp4"

print(f'{os.path.dirname(fullpath)}')
```

And if you would like to show the curly brackets, you have to escape the curly bracket you want to show with another curly bracket.

```python
radius = 7
center = 0.0

print(f"center: {{{center}}}, radius: {{{{{radius}}}}}")
```

```shell-session
center: {0.0}, radius: {{7}}
```

## Focus: Showing a variable name and Value

F-strings can be really useful in showing both a variables name and value at the same time.

Instead of this:

```python
this_is_a_long_name = "sometext"

print('this_is_a_long_name =', this_is_a_long_name)
```

```shell-session
this_is_a_long_name = sometext
```

You can use f-strings and write:

```python
this_is_a_long_name = "sometext"

print(f'{this_is_a_long_name = :}')
```

```shell-session
this_is_a_long_name = sometext
```

### Integration of str.format() specifiers

All string formatting specifiers for the `str.format()` works with f-strings

#### Printing Money figures

```python
total = 1000000

print(f"Your new balance is: ${total:,}")
```

```shell-session
Your new balance is: $1,000,000
```

#### Decimal precision

```python
i = 3.142857142857143
short_pi = f"{pi:.2f}"

print(f"Take PI to be: {short_pi}")
```

```shell-session
Take PI to be: 3.14
```

#### Filling voids

```python
print(f"{'start':*^50}")

print(f"{'Next':=<50}")

print(f"{'Previous':_>50}")

print(f"{'End':^50}")
```

```shell-session
**********************start***********************
Next==============================================
__________________________________________Previous
                       End
```
