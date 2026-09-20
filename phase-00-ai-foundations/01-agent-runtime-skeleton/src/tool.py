"""The calculator tool.

Takes a math expression as a string and returns the result as a string.
Only handles four operations: + - * /  -- everything else is refused.

This is a whitelist-based calculator. It never uses Python's built-in
eval(), because eval would run ANY Python code, not just math.
"""
import ast
import operator

# The only math operations we allow. Nothing else.
ALLOWED = {
    ast.Add:  operator.add,      # +
    ast.Sub:  operator.sub,      # -
    ast.Mult: operator.mul,      # *
    ast.Div:  operator.truediv,  # /
}


def calculator(expression):
    """Take '2 + 3 * 4' and return '14'."""
    tree = ast.parse(expression, mode="eval")
    result = walk(tree.body)
    return str(result)


def walk(node):
    """Look at one piece of the tree and figure out its value."""

    # Rule 1: it's a number → that's its value
    if isinstance(node, ast.Constant):
        return node.value

    # Rule 2: it's "X op Y" → look up the op, compute both sides, combine
    if isinstance(node, ast.BinOp):
        op = type(node.op)
        if op not in ALLOWED:
            raise ValueError(f"I don't do '{op.__name__}'")
        left = walk(node.left)
        right = walk(node.right)
        return ALLOWED[op](left, right)

    # Rule 3: anything else → refuse
    raise ValueError(f"I can't handle '{type(node).__name__}'")


TOOLS = {
    "calculator": calculator,
}
