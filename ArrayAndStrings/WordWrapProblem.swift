/*
Connecting words with '-' as blank spaces, no exceeds maxLength                                                          i

 input: ["1p3acres", "is", "a", "good", "place", "to", "communicate"], 12
 output: {"1p3acres-is", "a-good-place", "to", "communicate"}
*/

/* -- Algorithm --

string_builder = "1p3acres"
arr = []

- Iterate over the words
- If we don't have any words, add it to our builder
- Otherwise, if (string_builder.count + 1 + word.count <= maxLength), we add
the new word with a dash.
- Else, in the case we cannot add the new word, we save the current builder
in our result
and add the word to the new builder
- When we reach the last word, we might have a string builder left, so
we have to remember to add what is left in the result in case its length
is not zero

Time Complexity: O(n)
Space Complexity: O(n)
"""
 */

func wrapLines(strArr: [String], maxLength: Int) -> [String] {
    var arr: [String] = []
    var stringBuilder = ""
    
    for word in strArr {
        if stringBuilder.isEmpty {
            stringBuilder = word
        } else if (stringBuilder.count + 1 + word.count) <= maxLength {
            stringBuilder = stringBuilder + "_" + word
        } else {
            arr.append(stringBuilder)
            stringBuilder = word
        }
    }
    
    if !stringBuilder.isEmpty {
        arr.append(stringBuilder)
    }
    
    return arr
}

wrapLines(strArr: ["1p3acres", "is", "a", "good", "place", "to", "communicate"], maxLength: 12)
