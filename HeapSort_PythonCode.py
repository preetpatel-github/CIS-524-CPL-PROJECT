#Author: Preet Anand Patel; CSU ID# 2887151; 
#Last modified on: 12/13/2023;

def hipo(arr, n, i):
    largest = i
    left = 2 * i + 1
    right = 2 * i + 2

    if left < n and arr[left]["score"] > arr[largest]["score"]:
        largest = left

    if right < n and arr[right]["score"] > arr[largest]["score"]:
        largest = right

    if largest != i:
        arr[i], arr[largest] = arr[largest], arr[i]
        hipo(arr, n, largest)

def heapSort(arr):
    n = len(arr)

    # Build a max heap
    for i in range(n // 2 - 1, -1, -1):
        hipo(arr, n, i)

    # Extract elements one by one
    for i in range(n - 1, 0, -1):
        arr[i], arr[0] = arr[0], arr[i]  # Swap max element with last unsorted element
        hipo(arr, i, 0)

# Example student records sorted by scores
student_records = [{"name": "Preet", "score": 95}, {"name": "Dev", "score": 72}, {"name": "Harsh", "score": 90}, {"name": "Jaishil", "score": 68}, {"name": "Kathan", "score": 78}, {"name": "Vijay", "score": 95},]

# Sort student records based on scores using Heap Sort
heapSort(student_records)

# Display sorted student records
print("Sorted Student Records:")
print("-----------------------")
for student in student_records:
    print(f"Name: {student['name']}, Score: {student['score']}")
    
# Concept:1--> Python is dynamically typed, meaning variable types are inferred at runtime. There's no need to declare variable types explicitly, allowing flexibility but potentially leading to runtime errors.
# Concept:2--> Python uses eager evaluation, where expressions are evaluated as soon as they're encountered. This can lead to inefficiencies when dealing with large data structures or complex computations.
# Conpect:3--> Python supports multiple paradigms, including imperative, object-oriented, and functional programming. It allows for mutable data structures and encourages imperative-style coding.
