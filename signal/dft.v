// Erdet Nasufi erdet.nasufi@gmail.com Copyrights 2022 (C) //

module signal

import math
import math.complex

pub fn dft<T>(x []T) []complex.Complex {
	mut z := []complex.Complex{len: x.len}
	mut x_re, mut x_im, mut alpha := f64(0), f64(0), f64(0)
	m := x.len 
	for k := 0; k < m; k++ {
		x_re, x_im = f64(0), f64(0)
		for n := 0; n < m; n++ {
			alpha = f64(f64(n)*f64(k)*(2*math.pi/f64(m)))
			x_re += f64(x[n])*math.cos(alpha)
			x_im += f64(-1)*f64(x[n])*math.sin(alpha)
		}
		z[k] = complex.Complex {
			re: x_re,
			im: x_im
		}
	}
	return z 
}

pub fn dft_power(z []complex.Complex) []f64 {
	mut pz := []f64{len: z.len}

	for k := 0; k < z.len; k++ {
		pz[k] = math.pow(z[k].re, 2) + math.pow(z[k].im, 2)
	}

	return pz
}