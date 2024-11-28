/**
 * Calculates the maximum depth of a binary tree.
 *
 * The depth of a binary tree is the number of nodes along the longest path
 * from the root node down to the farthest leaf node. A leaf node is a node
 * that has no children.
 *
 * @param root - The root node of the binary tree.
 * @returns The maximum depth of the tree.
 */
function maxDepth(root: TreeNode | null): number {
  // Base case: If the tree is empty (root is null), the depth is 0.
  if (!root) {
    return 0;
  }

  // If the node is a leaf node (both left and right are null), the depth is 1.
  if (!root.left && !root.right) {
    return 1;
  }

  // Recursively calculate the maximum depth of the left and right subtrees.
  const leftDepth = root.left ? maxDepth(root.left) : 0; // If left child exists, get its depth, else 0.
  const rightDepth = root.right ? maxDepth(root.right) : 0; // If right child exists, get its depth, else 0.

  // Return the maximum depth of both subtrees plus the current node (1).
  return 1 + Math.max(leftDepth, rightDepth);
}
