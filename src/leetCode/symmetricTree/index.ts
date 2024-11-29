/**
 * Helper function to check if two trees are mirror images of each other.
 * A tree is considered a mirror of another tree if their root nodes' values are equal,
 * and the left subtree of one tree is a mirror of the right subtree of the other tree,
 * and vice versa.
 *
 * @param p The root node of the first tree.
 * @param q The root node of the second tree.
 * @returns True if the trees are mirror images, false otherwise.
 */
function isMirrorTree(p: TreeNode | null, q: TreeNode | null): boolean {
  // If both nodes are null, they are considered mirrors of each other (both empty)
  if (!p && !q) {
    return true;
  }

  // If one of the nodes is null and the other isn't, they can't be mirrors
  if (!p || !q) {
    return false;
  }

  // If the values of the nodes are different, they can't be mirrors
  if (p.val !== q.val) {
    return false;
  }

  // Recursively check if the left subtree of the first tree is a mirror of
  // the right subtree of the second tree, and vice versa.
  return isMirrorTree(p.left, q.right) && isMirrorTree(p.right, q.left);
}

/**
 * Checks if a binary tree is symmetric around its center.
 * A tree is symmetric if it is a mirror of itself.
 * This is achieved by checking if the left and right subtrees are mirrors of each other.
 *
 * @param root The root node of the tree.
 * @returns True if the tree is symmetric, false otherwise.
 */
function isSymmetric(root: TreeNode | null): boolean {
  // A symmetric tree is one where the left and right subtrees are mirrors of each other
  return isMirrorTree(root?.left, root?.right);
}
