
n = int(input("Enter the number of elements : "))
seq = []

for i in range(0, n):
	a = int(input("Enter the elements : "))
	seq.append(a)

print(seq)

def selection_sort(seq):

	for i in range(0, len(seq)-1):
		min_position = i

		for j in range(i+1, len(seq)-1):

			if seq[min_position] > seq[j]:
				min_position = j

		if min_position != i:
			seq[min_position], seq[i] = seq[i], seq[min_position]

	return seq

print("Sorted list : ", selection_sort(seq))









