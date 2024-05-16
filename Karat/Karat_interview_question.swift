import UIKit

/*
We are building a word processor and we would like to implement a "reflow" functionality that also applies full justification to the text.

Given an array containing lines of text and a new maximum width, re-flow the text to fit the new width. Each line should have the exact specified width. If any line is too short, insert '-' (as stand-ins for spaces) between words as equally as possible until it fits.

Note: we are using '-' instead of spaces between words to make testing and visual verification of the results easier.


lines = [ "The day began as still as the",
          "night abruptly lighted with",
          "brilliant flame" ]

reflowAndJustify(lines, 24) "reflow lines and justify to length 24" =>

        [ "The--day--began-as-still",
          "as--the--night--abruptly",
          "lighted--with--brilliant",
          "flame" ] // <--- a single word on a line is not padded with spaces

reflowAndJustify(lines, 25) "reflow lines and justify to length 25" =>

        [ "The-day-began-as-still-as"
          "the-----night----abruptly"
          "lighted---with--brilliant"
          "flame" ]

reflowAndJustify(lines, 26) "reflow lines and justify to length 26" =>

        [ "The--day-began-as-still-as",
          "the-night-abruptly-lighted",
          "with----brilliant----flame" ]

reflowAndJustify(lines, 40) "reflow lines and justify to length 40" =>

        [ "The--day--began--as--still--as-the-night",
          "abruptly--lighted--with--brilliant-flame" ]

reflowAndJustify(lines, 14) "reflow lines and justify to length 14" =>

        ['The--day-began',
         'as---still--as',
         'the------night',
         'abruptly',
         'lighted---with',
         'brilliant',
         'flame']

reflowAndJustify(lines, 15) "reflow lines and justify to length 15" =>

        ['The--day--began',
         'as-still-as-the',
         'night--abruptly',
         'lighted----with',
         'brilliant-flame']

lines2 = [ "a b", "c d" ]

reflowAndJustify(lines2, 20) "reflow lines2 and justify to length 20" =>

        ['a------b-----c-----d']

reflowAndJustify(lines2, 4) "reflow lines2 and justify to length 4" =>

        ['a--b',
         'c--d']

reflowAndJustify(lines2, 2) "reflow lines2 and justify to length 2" =>

        ['a',
         'b',
         'c',
         'd']

All Test Cases:
                 lines, reflow width
reflowAndJustify(lines, 24)
reflowAndJustify(lines, 25)
reflowAndJustify(lines, 26)
reflowAndJustify(lines, 40)
reflowAndJustify(lines, 14)
reflowAndJustify(lines, 15)
reflowAndJustify(lines2, 20)
reflowAndJustify(lines2, 4)
reflowAndJustify(lines2, 2)

n = number of words OR total characters

*/


import Foundation;

// lines = [ "The day began as still as the",
//           "night abruptly lighted with",
//           "brilliant flame" ]

// reflowAndJustify(lines, 24) "reflow lines and justify to length 24" =>

//         [ "The--day--began-as-still",
//           "as--the--night--abruptly",
//           "lighted--with--brilliant",
//           "flame" ]
func wrapLines(_ wordList: [String], _ maxLength: Int) -> [String] {
  
  var strCollection = [String]()
  
  var concatWord: String = ""
  
  for word in wordList {
    if concatWord.count == 0 {
      concatWord = word
      continue
    }
    
    let formattedWord = "\(concatWord)-\(word)"
    if formattedWord.count <= maxLength {
      concatWord = "\(concatWord)-\(word)"
    } else {
      strCollection.append(concatWord)
      concatWord = word
      continue
    }
  }
  strCollection.append(concatWord)
  return strCollection
}

func reflowAndJustify(_ lineList: [String], _ maxLength: Int) -> [String] {
  let strCollection = [String]()
  
  for line in lineList {
    
    let lineArr = line.components(separatedBy: " ")
    var tempStr = ""
    print(lineArr)
    for word in lineArr {
      if tempStr.count == 0 {
        tempStr = word
        continue
      }
      
      let formattedWord = "\(tempStr)-\(word)"
      if formattedWord.count <= maxLength {
        tempStr = "\(tempStr)-\(word)"
        print(tempStr)
      }
    }
  }
  
  
  return strCollection
}

// print(wrapLines(words1, 13))
// print(wrapLines(words1, 12))
// print(wrapLines(words1, 20))
// print(wrapLines(words2, 5))
// print(wrapLines(words2, 30))
// print(wrapLines(words3, 5))
// print(wrapLines(words4, 5))
// print(wrapLines(words5, 20))
// print(wrapLines(words6, 20))
// print(wrapLines(words6, 4))
// print(wrapLines(words6, 1))

let lines = ["The day began as still as the","night abruptly lighted with","brilliant flame"]
print(reflowAndJustify(lines, 24))
let lines2 = ["a b","c d"]
