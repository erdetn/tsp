module main

import math
import tsp
import tsp.signal

fn sin2a(x int) f64 {
	return 2*math.sin(3.2*math.pi*f64(x))
}

fn main() {
	t := signal.vector<int>(1,1,200)

	y := signal.new<f64>(t, sin2a)

	dump(t)
	dump(y)
}