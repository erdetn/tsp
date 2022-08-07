module main

import tsp
import tsp.signal

fn main() {
	x := [int(3), 11, 7, 0, -1, 4, 2]
	h := [2, 3, 0, -5, 2, 1]

	y := signal.conv<int>(x, h)


	for i := 0; i < y.len; i++ {
		println('y[${i}] = ${y[i]}')
	}
}