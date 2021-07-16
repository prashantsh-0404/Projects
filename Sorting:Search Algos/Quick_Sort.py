
n = int(input("Enter number of elements : "))
seq = []
for i in range(0, n):
	a = int(input("Enter the elements of input list : "))
	seq.append(a)

input_list = seq

def quick_sort(sequence):
	
	if len(sequence) <= 1:
		return sequence
	else:
		pivot = sequence.pop()

	first_sol = []
	second_sol = []

	for item in sequence:
		if item >= pivot:
			second_sol.append(item)
		else:
			first_sol.append(item)

	return quick_sort(first_sol) + list([pivot]) + quick_sort(second_sol)

print("Input List : " , input_list)
print("Sorted List : " , quick_sort(input_list))

