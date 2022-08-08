// Erdet Nasufi erdet.nasufi@gmail.com Copyrights 2022 (C) //

module signal

pub fn new<T>(time []int, signal_function fn(int)T) []T {
	mut y := []T{}

	for t in time {
		y << signal_function(t)
	}

	return y 
}

pub fn vector<T>(args ...int) []T {
	mut min := T(0)
	mut max := T(0)
	mut step := T(1)

	if args.len == 0 {
		return [T(0)]
	}

	if args.len == 1 {
		max = args[0]
		return []T{
			len: max,
			cap: max,
			init: T(it*step)
		}
	}

	if args.len == 2 {
		min = args[0]
		max = args[1]
		return  []T{
			len: min + max,
			cap: min + max,
			init: (min + T(it*step))
		}
	}

	if args.len > 2 {
		min = args[0]
		step = args[1]
		max = args[2]
	}

	return []T{
		len: min + max,
		cap: min + max,
		init: (min + T(it*step))
	}
}