/*
 * Complete the 'designerPdfViewer' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts the following parameters:
 *  1. INTEGER_ARRAY letterHeights
 *  2. STRING inputWord
 */

function designerPdfViewer(letterHeights: number[], inputWord: string): number {
  let maxHeight = 0;
  for (const char of inputWord) {
    const letterIndex = char.charCodeAt(0) - "a".charCodeAt(0);
    const currentHeight = letterHeights[letterIndex];
    maxHeight = Math.max(currentHeight, maxHeight);
  }

  return maxHeight * inputWord.length;
}
