import UIKit
 /*
 
 Write a function that calculates the total % of a video watched by a single user.
 
 You are given the following parameters:
 1) Unordered list of tuples, in which the first element is the start time and the second one is the end time. These represent different segments of the video that have been watched.
 2) Total duration of the video.
 
 */

typealias Segment  = (startTime: Double, endTime: Double)
func percentWatched(segments: [Segment], totalDuration: Double) -> Double {
    
    
    
   let sortedSegment = segments.sorted(by:{$0.startTime < $1.startTime})
   
    print(sortedSegment)
    
    var start: Double = 0
    var end: Double = 0
    var total: Double = 0
    
    var watchedTime:[Double] = []
   // let range: ClosedRange<Double> = 0...totalDuration
    for i in 0..<(sortedSegment.count ) {
        for j in 1..<(sortedSegment.count - 1) {
        let range: ClosedRange<Double> = sortedSegment[i].startTime...sortedSegment[i].endTime
            let anotherRange: ClosedRange<Double> = sortedSegment[j].startTime...sortedSegment[j].endTime
            if range.overlaps(anotherRange) {
                print(range.overlaps(anotherRange))
                watchedTime.append(Double(j))
            }
        }
    }
//    for segment in sortedSegment {
//        if segment.startTime >= end {
//
//            //total += end - start
//            start = segment.startTime
//            end = segment.endTime
//            watchedTime.append(segment.endTime -  segment.startTime)
//            //watchedTime.append(total)
//            total = watchedTime.reduce(0,+)
//
//        } else {
//            start = min(segment.startTime, start)
//            end = max(segment.endTime, end)
//            watchedTime = [end - start]
//            total = watchedTime[0]
//       // print(total)
//        }
//    }
//print(total)
   
     return (total / totalDuration) * 100
    
}
                         //22      //18
print(percentWatched(segments: [(1, 3),(22, 44), (4, 25)], totalDuration: 100))
                          //6
//print(percentWatched(segments: [ (25, 45), (7, 30), (6, 9), (50, 60), (4, 10),(1, 3) ], totalDuration: 100))
//print(percentWatched(segments: [(5, 10), (25, 45), (7, 30)], totalDuration: 45))
