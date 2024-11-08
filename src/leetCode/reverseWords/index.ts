function reverseWords(s: string): string {
  const wordArray = s
    .split(" ")
    .filter((s) => s.length > 0)
    .reverse();
  return wordArray.join(" ");
}
