// Erdet Nasufi erdet.nasufi@gmail.com Copyrights 2022 (C) //

module signal

import math
import math.complex

pub fn dft<T>(x []T) []complex.Complex {
	mut z := []complex.Complex{len: x.len}
	mut x_re, mut x_im, mut theta := f64(0), f64(0), f64(0)
	m := x.len 
	for k := 0; k < m; k++ {
		x_re, x_im = f64(0), f64(0)
		for n := 0; n < m; n++ {
			theta = f64(f64(n)*f64(k)*(2.0*math.pi/f64(m)))
			x_re += f64(x[n])*math.cos(theta)
			x_im += -1.0*f64(x[n])*math.sin(theta)
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

pub fn idft(z []complex.Complex) []f64 {
	mut x, mut xk, mut theta := []f64{len: z.len}, 0.0, 0.0
	nn := z.len

	for k := 0; k < z.len; k++ {
		xk = 0.0
		for n := 0; n < z.len; n++ {
			theta = (2.0 * math.pi * f64(k) * f64(n))/nn
			xk += f64(z[n].re)*math.cos(theta) + f64(z[n].im) * math.sin(theta)
		}
		xk = f64(xk / f64(nn))
		x[k] = xk 
	}
	return x 
}