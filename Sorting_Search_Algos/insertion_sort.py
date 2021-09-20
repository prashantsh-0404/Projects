
n = int(input("Enter the number of elements in list : "))
seq = []

for i in range(0,n):
    print("Enter the element ", i+1, " : ")
    a = input()
    seq.append(a)

print("Unsorted list : ", seq)

def insertion_sort(seq):

    sub_sorted_part = []

    for i in range(0, len(seq)-1):

        if seq[i] > seq[i+1]:

            seq[i], seq[i+1] = seq[i+1], seq[i]
            sub_sorted_part.append(seq[i])
        else:
            sub_sorted_part.append(seq[i])

        l = len(sub_sorted_part) -1
        for j in reversed(sub_sorted_part):
            if j < sub_sorted_part[l-1]:
                sub_sorted_part[l-1], j = j, sub_sorted_part[l-1]

    return sub_sorted_part

print("Sorted list : ", insertion_sort(seq))
