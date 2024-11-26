/**
 * Simplifies an absolute file path in Unix-like systems.
 * This function processes a given path string by resolving all `.` (current directory)
 * and `..` (parent directory) references and returns the simplified canonical path.
 *
 * @param filePath - The input string representing the absolute file path to be simplified.
 * @returns A simplified absolute path.
 */
function simplifyPath(filePath: string): string {
  // Split the path by '/' and remove empty strings resulting from consecutive slashes.
  const pathComponents = filePath.split("/").filter((component) => component.length > 0);

  // Stack to track the valid path components.
  const stack: string[] = [];

  // Iterate through each component in the path.
  for (const component of pathComponents) {
    if (component === "..") {
      // Move up one level by popping the last directory from the stack (if any).
      stack.pop();
    } else if (component !== ".") {
      // Push valid directory names (excluding '.') onto the stack.
      stack.push(component);
    }
  }

  // Join the stack into a path, ensuring it starts with '/'.
  return `/${stack.join("/")}`;
}
