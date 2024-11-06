function intToRoman(num: number): string {
  const integerToRomanMap = {
    1: "I",
    5: "V",
    10: "X",
    50: "L",
    100: "C",
    500: "D",
    1000: "M",
  };

  const romanSymbols = Object.keys(integerToRomanMap);
  const romanNumerals = Object.values(integerToRomanMap);

  let symbolIndex = romanSymbols.length - 1;
  let romanString = "";

  while (symbolIndex >= 0) {
    const currentSymbolValue = parseInt(romanSymbols[symbolIndex]);
    const currentSymbol = romanNumerals[symbolIndex];
    const repetitionCount = Math.floor(num / currentSymbolValue);

    if (repetitionCount === 4) {
      if (romanString[romanString.length - 1] === romanNumerals[symbolIndex + 1]) {
        romanString =
          romanString.substring(0, romanString.length - 1) +
          currentSymbol +
          romanNumerals[symbolIndex + 2];
      } else {
        romanString += currentSymbol + romanNumerals[symbolIndex + 1];
      }
    } else if (repetitionCount > 0) {
      romanString += new Array(repetitionCount).fill(currentSymbol).join("");
    }

    num = num % currentSymbolValue;
    symbolIndex--;
  }

  return romanString;
}
