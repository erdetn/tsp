// Erdet Nasufi erdet.nasufi@gmail.com Copyrights 2022 (C) //

module signal

import math

pub fn new[T](time []int, signal_function fn (int) T) []T {
	mut y := []T{}

	for t in time {
		y << signal_function(t)
	}

	return y
}

pub fn vector[T](args ...int) []T {
	mut min := T(0)
	mut max := T(0)
	mut step := T(1)

	if args.len == 0 {
		return [T(0)]
	}

	if args.len == 1 {
		max = args[0]
		return []T{len: max, cap: max, init: T(it * step)}
	}

	if args.len == 2 {
		min = args[0]
		max = args[1]
		return []T{len: min + max, cap: min + max, init: T(min + T(it * step))}
	}

	if args.len > 2 {
		min = args[0]
		step = args[1]
		max = args[2]
	}

	return []T{len: min + max, cap: min + max, init: T(min + T(it * step))}
}

pub fn operation[T](x1 []T, x2 []T, op fn (T, T) T) []T {
	mut y := []T{}

	if x1.len == x2.len {
		for i := 0; i < x1.len; i++ {
			y << op(x1[i], x2[i])
		}
		return y
	} else if x1.len > x2.len {
		for i := 0; i < x2.len; i++ {
			y << op(x1[i], x2[i])
		}
		for j := x2.len; j < x1.len; j++ {
			y << op(0, x1[j])
		}
		return y
	} else if x2.len > x1.len {
		for i := 0; i < x1.len; i++ {
			y << op(x1[i], x2[i])
		}
		for j := x1.len; j < x2.len; j++ {
			y << op(0, x2[j])
		}
		return y
	}
	return y
}

pub fn scale[T](samples []T, a T) []T {
	mut y := []T{}
	for x in samples {
		y << T(a * x)
	}
	return y
}

pub fn shift[T](samples []T, k int) []T {
	mut y := []T{}

	if k > 0 {
		y << []T{len: k}
		y << samples
		return y
	} else if k < 0 {
		if k < samples.len {
			k1 := (-1) * k
			y = samples[k1..]
		} else {
			y = [T(0)]
		}
		return y
	}
	y << samples
	return y
}

pub fn mirror[T](samples []T) []T {
	mut y := []T{len: samples.len, cap: samples.cap}

	for i := 0; i < samples.len; i++ {
		y[i] = samples[samples.len - i - 1]
	}
	return y
}

pub fn sum[T](samples []T) T {
	mut sum := T(0)
	for sample in samples {
		sum += sample
	}
	return sum
}

pub fn product<T, P>(samples []T) P {
	mut prod := P(1)
	for sample in samples {
		prod *= P(sample)
	}
	return prod
}

pub fn energy[T](samples []T) f64 {
	mut se := f64(0)
	for sample in samples {
		se += math.pow(f64(sample), math.abs<f64>(sample))
	}
	return se
}

pub fn power[T](samples []T, period int) f64 {
	mut pe := f64(0)
	mut x := f64(0)

	n := if samples.len > period { period } else { samples.len }

	for i := 0; i < n; i++ {
		x = samples[i]
		pe += math.pow(f64(x), math.abs<f64>(x))
	}

	pe = pe / n

	return pe
}
