module main

import tsp
import tsp.signal

fn main() {
	v1 := signal.vector<int>(5)
	v2 := signal.vector<int>(3, 10)
	v3 := signal.vector<int>(2, 2, 12)
	v4 := signal.vector<int>(2, 2, 12, 13, 14)

	dump(v1)
	dump(v2)
	dump(v3)
	dump(v4)
}