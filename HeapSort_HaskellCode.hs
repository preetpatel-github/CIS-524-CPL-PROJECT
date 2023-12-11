--Author: Preet Anand Patel; CSU ID# 2887151; 
-- Last modified on: 12/13/2023;

-- Define a student record as a tuple containing name and score
type StudentRecord = (String, Int)

-- Function to heapify the subtree rooted at index i in the list of student records
-- heapify: Is a concept of converting binary tree into heap data structure.
hipo :: [StudentRecord] -> Int -> Int -> [StudentRecord]
hipo records n i =
  let left = 2 * i + 1
      right = 2 * i + 2
      largest = if left < n && snd (records !! left) > snd (records !! i)
                  then left
                  else i
      largest' = if right < n && snd (records !! right) > snd (records !! largest)
                    then right
                    else largest
  in if largest' /= i
       then let records' = swap records i largest'
            in hipo records' n largest'
       else records

-- Function to swap elements in a list at given indices
swap :: [a] -> Int -> Int -> [a]
swap xs i j = let ith = xs !! i
                  jth = xs !! j
              in take i xs ++ [jth] ++ drop (i + 1) (take j xs) ++ [ith] ++ drop (j + 1) xs

-- Function to build a max heap
buildMaxHeap :: [StudentRecord] -> [StudentRecord]
buildMaxHeap records =
  let n = length records
      start = n `div` 2 - 1
      heapified = foldl (\acc i -> hipo acc n i) records [start, start - 1 .. 0]
  in heapified

-- Function to perform Heap Sort on a list of student records based on their scores
heapSort :: [StudentRecord] -> [StudentRecord]
heapSort records =
  let n = length records
      heapified = buildMaxHeap records
      sortIteration i acc =
        if i > 0
          then let heapified' = hipo acc i 0
                   sorted = swap heapified' 0 i
               in sortIteration (i - 1) sorted
          else acc
  in sortIteration (n - 1) heapified

-- Sample student records sorted by scores
studentRecords :: [StudentRecord]
studentRecords = [("Preet", 95), ("Dev", 72), ("Harsh", 90), ("Jaishil", 68), ("Kathan", 78), ("Vijay", 95)]

-- Sort student records based on scores using Heap Sort
sortedRecords = heapSort studentRecords

-- Display sorted student records
-- Main fuction begins from here.
main :: IO ()
main = do
  putStrLn "Sorted Student Records:"
  putStrLn "-----------------------"
  mapM_ (\(name, score) -> putStrLn $ "Name: " ++ name ++ ", Score: " ++ show score) sortedRecords

--Concept:1--> Haskell is statically typed, requiring explicit type declarations for variables and functions. The type system in Haskell is strong and inferred at compile time, ensuring type safety and preventing many runtime errors.
--Concept:2--> Haskell employs lazy evaluation by default, where expressions are evaluated only when their results are required. This can lead to more efficient memory usage and the ability to work with infinite data structures.
--Concept:3--> Haskell is primarily a functional programming language. It emphasizes immutability, pure functions without side effects, and a declarative style of programming. This approach promotes clearer, more concise code and better reasoning about programs.