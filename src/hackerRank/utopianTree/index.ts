function utopianTree(cycles: number): number {
  let height = 1; // Starting height of the tree
  for (let cycle = 1; cycle <= cycles; cycle++) {
    if (cycle % 2 > 0) {
      // Spring cycle: Tree doubles its height
      height *= 2;
    } else {
      // Summer cycle: Tree grows by 1
      height += 1;
    }
  }
  return height;
}
