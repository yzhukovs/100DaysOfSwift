import UIKit
 /*
 
 Write a function that calculates the total % of a video watched by a single user.
 
 You are given the following parameters:
 1) Unordered list of tuples, in which the first element is the start time and the second one is the end time. These represent different segments of the video that have been watched.
 2) Total duration of the video.
 
 */
typealias Segment = (startTime: Double, endTime: Double)
func percentWatched(segments: [Segment], totalDuration: Double) -> Double {
    
    // Segment = [starttime , endtime]
    // duration = Total time of the Video
    // return Return the percentage of video. -> Double
    
    // [Segment] is an array... iterate
    // watch the same 10 mins over again at any point of the video
    
    // [[5, 10],[25, 45]] // 5 + 20 -> 25.  25 / 100. = .25 -> 25%
    
    // [(5, 10), (25, 45), (7, 30)]
    
   // var watchedTime:Double = 0
    var sorted = segments.sorted {$0 < $1}
    for i in sorted {
    
    }
    
    print(sorted)
    var total = 0.0
    for i in segments {
        total += i.endTime - i.startTime
    }
    var percentageWatched = (total / totalDuration) * 100
     return percentageWatched
//    var total = sortegSeg[0][1] - sortegSeg[0][0]
//    var percent = (watchedTime / totalDuration) * 100 // get the percentage.
//
//    var currentSegmentStart:Double = 0
//    var currentSegmentEnd = totalDuration
//
//    for segment in segments {
//        let start = segment.startTime
//        let stop = segment.endTime
//
//        watchedTime += currentSegmentStart - currentSegmentEnd
        
   // }
    
}

percentWatched(segments: [(5, 10), (25, 45), (7, 30)], totalDuration: 45)
