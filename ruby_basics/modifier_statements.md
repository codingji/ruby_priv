# Modifier Statements

Ruby's grammar differentiates between statements and expressions. All expressions are statements (an expression is a type of statement), but not all statements are expressions. Some parts of the grammar accept expressions and not other types of statements, which causes code that looks similar to be parsed differently.

For example, when not used as a modifier, `if`, `else`, `while`, `until`, and `begin` are expressions (and also statements). However, when used as a modifier, `if`, `else`, `while`, `until` and `rescue` are statements but not expressions.
```
if true; 1 end # expression (and therefore statement)
1 if true      # statement (not expression)
```
Statements that are not expressions cannot be used in contexts where an expression is expected, such as method arguments.
```
puts( 1 if true )      #=> SyntaxError
```
You can wrap a statement in parentheses to create an expression.
```
puts((1 if true))      #=> 1
```
If you put a space between the method name and opening parenthesis, you do not need two sets of parentheses.
```
puts (1 if true)       #=> 1, because of optional parentheses for method
```
This is because this is parsed similar to a method call without parentheses. It is equivalent to the following code, without the creation of a local variable:
```
x = (1 if true)
p x
```
In a modifier statement, the left-hand side must be a statement and the right-hand side must be an expression.

So in `a if b rescue c`, because `b rescue c` is a statement that is not an expression, and therefore is not allowed as the right-hand side of the `if` modifier statement, the code is necessarily parsed as `(a if b) rescue c`.

This interacts with operator precedence in such a way that:
```
stmt if v = expr rescue x
stmt if v = expr unless x
```
are parsed as:
```
stmt if v = (expr rescue x)
(stmt if v = expr) unless x
```
This is because modifier `rescue` has higher precedence than `=`, and modifier `if` has lower precedence than `=`.
