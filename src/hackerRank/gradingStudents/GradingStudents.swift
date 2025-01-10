func gradingStudents(grades: [Int]) -> [Int] {
    return grades.map { grade in
        // If grade is less than 38, no rounding is needed
        if grade < 38 {
            return grade
        }
        
        // Calculate the difference to the next multiple of 5
        let nextMultipleOfFive = (grade / 5 + 1) * 5
        let roundedGrade = nextMultipleOfFive - grade
        
        // Round up if the difference is 3 or more, otherwise return the original grade
        return roundedGrade < 3 ? nextMultipleOfFive : grade
    }
}
