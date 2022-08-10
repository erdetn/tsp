module main

import tsp
import tsp.signal

fn add(a int, b int) int {
	return a + b
}

fn multi(a int, b int) int {
	return a * b
}

fn main() {
	x1 := [1, 2, 3, 4]
	x2 := [9, 8, 7, 6, 5, 4, 3]
	x3 := [4, 3, 2, 1]

	y1 := signal.operation<int>(x1, x2, add)
	y2 := signal.operation<int>(x2, x1, add)
	y3 := signal.operation<int>(x1, x3, add)

	dump(y1)
	dump(y2)
	dump(y3)
	y1m := signal.operation<int>(x1, x2, multi)
	y2m := signal.operation<int>(x2, x1, multi)
	y3m := signal.operation<int>(x1, x3, multi)

	dump(y1m)
	dump(y2m)
	dump(y3m)
	z := signal.scale<int>(x1, 10)
	dump(z)
	x4 := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
	z4a := signal.shift<int>(x4, 3)
	z4b := signal.shift<int>(x4, -3)
	dump(x4)
	dump(z4a)
	dump(z4b)
	z4m := signal.mirror<int>(x4)
	dump(z4m)
	x1sum := signal.sum<int>(x1)
	dump(x1sum)
	x1prod := signal.product<int, i64>(x1)
	dump(x1prod)
	xe1 := [1, -2, 3, -4]
	xe2 := [1, 2, 3, 4]
	se1 := signal.energy<int>(xe1)
	se2 := signal.energy<int>(xe2)
	dump(se1)
	dump(se2)
	xp1 := [5, 4, 3, 2, 1, 5, 4, 3, 2, 1, 5, 4, 3, 2, 1]
	pe1 := signal.power<int>(xp1, 5)
	dump(pe1)
}
