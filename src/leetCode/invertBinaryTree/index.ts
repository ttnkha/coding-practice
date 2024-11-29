function invertBinaryTree(root: TreeNode | null): TreeNode | null {
  // Base case: if the node is null, there's nothing to invert
  if (!root) {
    return null;
  }

  // Recursively invert the left subtree
  invertBinaryTree(root.left);

  // Recursively invert the right subtree
  invertBinaryTree(root.right);

  // Swap the left and right child nodes of the current node
  const tmp = root.left;
  root.left = root.right;
  root.right = tmp;

  // Return the root node after inversion
  return root;
}
