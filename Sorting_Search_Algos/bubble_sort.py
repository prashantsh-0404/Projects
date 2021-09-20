
n = int(input("Enter the number of elements : "))
unsorted = []

for i in range(0, n):
	a = int(input("Enter the elements : "))
	unsorted.append(a)

print("Unsorted list : ", unsorted)

def bubble_sort(unsorted):

	indexing_length = len(unsorted) - 1
	sorted = False

	while not sorted:
		sorted = True
		for i in range(0, indexing_length):
			if unsorted[i] > unsorted[i+1]:
				sorted = False
				unsorted[i], unsorted[i+1] = unsorted[i+1], unsorted[i]

	return unsorted

print("Sorted list : ", bubble_sort(unsorted))
















