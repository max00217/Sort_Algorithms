import rand

fn main() {
	mut arr := [
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
    rand.int_in_range(1, 20)!, 
    rand.int_in_range(1, 20)!,
	]
	println(arr)
	for i in 1..arr.len - 1 { 
		for j in 0..arr.len - i {
			if arr[j] > arr[j+1] {
				arr[j], arr[j+1] = arr[j+1], arr[j]
				println("Sorting...:${arr}")
			}
		}
	}
	println("Sort Result: ${arr}")
}	
