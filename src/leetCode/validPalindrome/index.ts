// Helper function to check if a character is alphanumeric (letter or digit)
function isAlphanumericCharacter(c: string): boolean {
  // If the character is a space, it is not alphanumeric
  if (c === " ") {
    return false;
  }

  // If the character is a number (digits 0-9), it's alphanumeric
  if (!isNaN(Number(c))) {
    return true;
  }

  // Check if the character is a lowercase letter ('a' to 'z')
  const charCode = c.charCodeAt(0);
  const lowerCaseCharCode = "a".charCodeAt(0);
  const upperCaseCharCode = "A".charCodeAt(0);

  // If character is between 'a' and 'z' (inclusive) or 'A' and 'Z' (inclusive)
  return (
    (charCode >= lowerCaseCharCode && charCode <= "z".charCodeAt(0)) ||
    (charCode >= upperCaseCharCode && charCode <= "Z".charCodeAt(0))
  );
}

// Function to check if a string is a palindrome (ignores non-alphanumeric characters and case)
function isPalindrome(s: string): boolean {
  // Convert the string to lowercase to make the comparison case-insensitive
  const lowercasedStr = s.toLowerCase();

  let left = 0;
  let right = s.length - 1;

  // Iterate from both ends of the string toward the center
  while (left < right) {
    // Skip non-alphanumeric characters on the left side
    if (!isAlphanumericCharacter(lowercasedStr[left])) {
      left++;
      continue;
    }

    // Skip non-alphanumeric characters on the right side
    if (!isAlphanumericCharacter(lowercasedStr[right])) {
      right--;
      continue;
    }

    // If characters at both ends don't match, it's not a palindrome
    if (lowercasedStr[left] !== lowercasedStr[right]) {
      return false;
    }

    // Move both pointers inward
    left++;
    right--;
  }

  // If we reach here, the string is a palindrome
  return true;
}
