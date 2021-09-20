
n = int(input("Enter the number of elements : "))
seq = []

for i in range(0, n):
	a = int(input("Enter the elements : "))
	seq.append(a)

print("Unsorted list : ", seq)

def bubble_sort(sequence):

	indexing_length = len(sequence) - 1
	sorted = False

	while not sorted:
		sorted = True
		for i in range(0, indexing_length):
			if sequence[i] > sequence[i+1]:
				sorted = False
				sequence[i], sequence[i+1] = sequence[i+1], sequence[i]

	return sequence

print("Sorted list : ", bubble_sort(seq))
















