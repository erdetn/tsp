module main

import tsp
import tsp.fir

fn main() {
	println(tsp.version())

	c := [f32(0.1), 0.2, 0.3, 0.2, 0.1, -0.1, -0.2, 0.2]
	mut signal := [f32(1), 2.0, 3.0, 4.0, 5.0, 6.0, 7.0,
		  8.0, 9.0, 8.0, 7.0, 6.0, 5.0, 4.0,
		  0.3, 2.0, 1.0, 0.5, 2.0, 8.0, 2.0]

	mut filter := fir.new(c)

    filter.filter_array(mut signal)
    println(signal)
}
