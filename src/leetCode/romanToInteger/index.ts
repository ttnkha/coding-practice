function romanToInt(romanString: string): number {
  const romanNumeralValues = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000,
  };
  const subtractiveRomanPairs = { I: ["V", "X"], X: ["L", "C"], C: ["D", "M"] };

  let currentIndex = 0;
  let integerValue = 0;

  while (currentIndex < romanString.length) {
    const currentRomanChar = romanString[currentIndex];
    const nextRomanChar = romanString[currentIndex + 1];

    if (subtractiveRomanPairs[currentRomanChar]?.includes(nextRomanChar)) {
      integerValue += romanNumeralValues[nextRomanChar] - romanNumeralValues[currentRomanChar];
      currentIndex += 2;
    } else {
      integerValue += romanNumeralValues[currentRomanChar];
      currentIndex++;
    }
  }

  return integerValue;
}
