function encryption(s: string): string {
  const noSpace = s.replace(/ /g, "");
  const l = noSpace.length;
  const square = Math.sqrt(l);
  let row = Math.floor(square);
  let col = Math.ceil(square);
  while (row * col < l) {
    row += row < col ? 1 : 0;
    col += col < row ? 1 : 0;
  }

  let str = "";
  for (let i = 0; i < col; i++) {
    for (let j = 0; j < row; j++) {
      str += noSpace[j * col + i] ?? "";
    }
    str += " ";
  }

  return str.trim();
}
