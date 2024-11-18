/**
 * Counts the number of special problems in a workbook.
 * A special problem is defined as a problem that is on the same page
 * as its problem number.
 *
 * @param totalChapters - The total number of chapters in the workbook.
 * @param problemsPerPage - The maximum number of problems that can fit on a single page.
 * @param problemsInChapters - An array with the number of problems in each chapter.
 * @returns The count of special problems.
 */
function workbook(
  totalChapters: number,
  problemsPerPage: number,
  problemsInChapters: number[]
): number {
  let count = 0; // Counter for special problems
  let chapter = 1; // Current chapter being processed
  let page = 1; // Current page number
  let problemsInPage = 0; // Number of problems added to the current page

  // Iterate through all chapters
  while (chapter <= problemsInChapters.length) {
    // Calculate the number of current problems on the page, respecting limits
    const curProblems =
      problemsInPage + Math.min(problemsPerPage, problemsInChapters[chapter - 1] - problemsInPage);

    // Check if the current page contains a special problem
    if (problemsInPage < page && curProblems >= page) {
      count++; // Increment count if a special problem is found
    }

    // Update the number of problems in the current chapter
    problemsInPage = curProblems;

    // Move to the next chapter if all problems are in the current page
    if (problemsInChapters[chapter - 1] === problemsInPage) {
      chapter++;
      problemsInPage = 0; // Reset the problems for the next chapter
    }

    page++; // Proceed to next page
  }

  return count; // Return the final count of special problems
}
