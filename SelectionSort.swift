import Foundation

// Author: Tamer Zreg
// Description: Implementation of Selection Sort algorithm with file I/O operations

// Function to read numbers from file and return as an array of Integers
func readNumbersFromFile(_ fileName: String) -> [Int]? {
    do {
        // Read the contents of the file
        let content = try String(contentsOfFile: fileName, encoding: .utf8)
        // Split the content by newline character to get numbers
        let numbers = content.components(separatedBy: "\n").compactMap { Int($0) }
        return numbers
    } catch {
        // Print error if any
        print("Error reading file: \(error)")
        return nil
    }
}

// Function to write numbers to file
func writeNumbersToFile(_ fileName: String, numbers: [Int]) {
    let content = numbers.map { String($0) }.joined(separator: "\n")
    do {
        // Write the content to file
        try content.write(toFile: fileName, atomically: true, encoding: .utf8)
        print("Numbers written to file successfully.")
    } catch {
        // Print error if any
        print("Error writing to file: \(error)")
    }
}

// Selection sort function
func selectionSort(_ array: inout [Int]) {
    let n = array.count
    for i in 0..<n-1 {
        var minIndex = i
        for j in i+1..<n {
            if array[j] < array[minIndex] {
                minIndex = j
            }
        }
        if minIndex != i {
            array.swapAt(i, minIndex)
        }
    }
}

// Read numbers from file
if let numbers = readNumbersFromFile("numbers.txt") {
    var numbersToSort = numbers
    // Sort numbers using Selection Sort
    selectionSort(&numbersToSort)
    // Write sorted numbers to file
    writeNumbersToFile("sorted_numbers_selection.txt", numbers: numbersToSort)
} else {
    print("Failed to read numbers from file.")
}
