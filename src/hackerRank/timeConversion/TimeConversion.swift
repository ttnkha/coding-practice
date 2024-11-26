/**
 * Converts a 12-hour AM/PM time format to a 24-hour format.
 *
 * @param s - The input time string in 12-hour AM/PM format (e.g., "07:45:54PM").
 * @returns The time string in 24-hour format (e.g., "19:45:54").
 */
func timeConversion(s: String) -> String {
    // Extract the AM/PM part and the time portion (HH:MM:SS)
    let amPm = s.suffix(2)
    let time = s.prefix(8)
    
    // Split the time into hours, minutes, and seconds
    let timeComponents = time.split(separator: ":")
    let hour = Int(timeComponents[0])!
    
    // Convert the hour based on AM/PM
    var hour24 = hour
    if hour == 12 {
        // Special case for 12 AM and 12 PM
        hour24 = amPm == "PM" ? 12 : 0
    } else {
        hour24 += amPm == "PM" ? 12 : 0
    }
    
    // Format the hour to ensure it's two digits (e.g., 9 -> "09")
    let formattedHour = String(format: "%02d", hour24)
    
    // Return the converted time in 24-hour format
    return "\(formattedHour):\(timeComponents[1]):\(timeComponents[2])"
}
