# Sort_Algorithms
For DDIM Project

## 1. Bubble Sort
```v
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
```
## 2. Selection Sort
```v
import rand
import arrays

fn main() {
	mut num := 0
	mut arr := [
		rand.int_in_range(1, 10)!, 
		rand.int_in_range(1, 10)!, 
		rand.int_in_range(1, 10)!, 
		rand.int_in_range(1, 10)!, 
		rand.int_in_range(1, 10)!, 
		rand.int_in_range(1, 10)!, 
		rand.int_in_range(1, 10)!, 
		rand.int_in_range(1, 10)!, 
		rand.int_in_range(1, 10)!
	]
	println(arr)
	for i in 0..arr.len - 1 { 
		for _ in i..arr.len - 1 {
			mut q := arrays.idx_min(arr[i..])! + i
			println("Min Value index: ${q},(Value:${arr[q]})\n")

			arr[q] , arr[i] = arr[i], arr[q]
			println("Sorting...:${arr}")
		}
		num += 1
	}
	println("\nSort Result: ${arr}, ${num}")
}
```
## 3. Insertion Sort
```v
import rand

fn main() {
    mut arr := [
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!, 
        rand.int_in_range(1, 10)!,
    ]
    println('Before sort: $arr')
    insertion_sort(mut arr)
    println('After sort: $arr')
}

fn insertion_sort(mut arr []int) {
    for i in 0 .. arr.len {
        mut key := arr[i]
        mut j := i - 1

        for j >= 0 && arr[j] > key {
            arr[j + 1] = arr[j]
            j -= 1
        }
        arr[j + 1] = key
    }
}
```
## 4. Heap Sort
```v
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
    
  println('Before sort: $arr')
  heap_sort(mut arr)
  println('After sort: $arr')
}

fn heap_sort(mut data []int) {
  len := data.len
  make_heap(mut data, len)
  
  for end := len - 1; end > 0; end-- {
    data[0], data[end] = data[end], data[0]
    sift_down(mut data, 0, end)
	}
}

fn make_heap(mut data []int, len int) {
  mut start := (len - 2) / 2
  
  for start >= 0 {
    sift_down(mut data, start, len)
    start--
  }
}

fn sift_down(mut data []int, start, end int) {
  mut root := start

  for root * 2 + 1 < end {

    mut child := root * 2 + 1

    if child + 1 < end && data[child] < data[child + 1] {
      child ++
    }
		
    if data[root] < data[child] {
      data[root], data[child] = data[child], data[root]
      	root = child
      } else {
        return
      }
  }
}
```
## 5. Quick Sort
```v
import rand

fn main() {
  mut arr := [
    rand.int_in_range(1, 10)!, 
    rand.int_in_range(1, 10)!, 
    rand.int_in_range(1, 10)!, 
    rand.int_in_range(1, 10)!, 
    rand.int_in_range(1, 10)!, 
    rand.int_in_range(1, 10)!, 
    rand.int_in_range(1, 10)!, 
    rand.int_in_range(1, 10)!, 
    rand.int_in_range(1, 10)!,
  ]
  println('Before sort: $arr')
    
  arr = quick_sort(mut arr)
  println('After sort: $arr')
}

fn quick_sort(mut arr []int) []int {
  if arr.len <= 1 {
    return arr
  }

  pivot := arr[arr.len / 2]
  mut left := []int{}
  mut middle := []int{}
  mut right := []int{}

  for _, item in arr {
    if item < pivot {
      left << item
    } else if item > pivot {
      right << item
    } else {
      middle << item
    }
  }

  mut sorted := quick_sort(mut left)
	sorted << middle
  sorted << quick_sort(mut right)

	println("Left, Middle, Right")
	print(left)
	print(middle)
	println(right)
	println(arr)
	println(sorted)
	println("\n======\n")
  return sorted
}
```
## F. Hybrid(Quick + Selction) Sort
```v
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
  println('Before sort: $arr')
  hybrid_sort(mut arr, 0, arr.len - 1)
  println('After sort: $arr')
}

fn hybrid_sort(mut arr []int, low int, high int) {
  if high - low < 10 {
    println('Selection sort on: $arr')
    selection_sort(mut arr, low, high)
    println('After selection sort: $arr')
  } else {
    pivot_index := partition(mut arr, low, high)
    println('Quick sort on: $arr')
    if low < pivot_index - 1 { hybrid_sort(mut arr, low, pivot_index - 1) }
    if pivot_index < high { hybrid_sort(mut arr, pivot_index, high) }
  }
}

fn selection_sort(mut arr []int, low int, high int) {
  for i := low; i <= high; i++ {
    mut min_index := i
    for j := i+1; j <= high; j++ {
      if arr[j] < arr[min_index] {
        min_index = j
        }
      }
    arr[i], arr[min_index] = arr[min_index], arr[i]
    println("Sorting...:${arr}")
  }
}

fn partition(mut arr []int, low int, high int) int {
  pivot := arr[(low + high) / 2]
  mut i := low
  mut j := high
  for {
    for arr[i] < pivot { i++ }
    for arr[j] > pivot { j-- }
    if i <= j {
      arr[i], arr[j] = arr[j], arr[i]
      println("Sorting...:${arr}")
      i++
      j--
    } else {
      return i
    }
  }
  return i
}
```