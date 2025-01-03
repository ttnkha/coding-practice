function strStr(haystack: string, needle: string): number {
  let i = 0;
  while (i <= haystack.length - needle.length) {
    if (haystack[i] === needle[0] && haystack.substring(i, i + needle.length) === needle) {
      return i;
    }
    i++;
  }
  return -1;
}
