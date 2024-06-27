type FractalTree:
  Node { val, ~left, ~right }
  Leaf

def generate_tree(depth):
  bend val = 0:
    when val < depth:
      x = FractalTree/Node { val: val, left: fork(val + 1), right: fork(val + 1) }
    else:
      x = FractalTree/Leaf
  return x

def sum_tree(tree):
  fold tree:
    case FractalTree/Node:
      return tree.val + tree.left + tree.right
    case FractalTree/Leaf:
      return 0

def max(a, b):
  if a > b:
    return a
  else:
    return b

def depth_tree(tree):
  fold tree:
    case FractalTree/Node:
      return 1 + max(tree.left, tree.right)
    case FractalTree/Leaf:
      return 0

def count_leaves(tree):
  fold tree:
    case FractalTree/Node:
      return tree.left + tree.right
    case FractalTree/Leaf:
      return 1

def min(a, b):
  if a < b:
    return a
  else:
    return b

def min_depth_tree(tree):
  fold tree:
    case FractalTree/Node:
      return 1 + min(tree.left, tree.right)
    case FractalTree/Leaf:
      return 0

def main:
  tree = generate_tree(6)
  sum = sum_tree(tree)
  depth = depth_tree(tree)
  leaf_count = count_leaves(tree)
  min_depth = min_depth_tree(tree)
  return (sum, depth, leaf_count, min_depth)
