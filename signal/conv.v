// Erdet Nasufi erdet.nasufi@gmail.com Copyrights 2022 (C) //

module signal

[inline]
pub fn min(a int, b int) int {
	return if a < b {a} else {b} 
}

[inline]
pub fn max(a int, b int) int {
	return if a > b {a} else {b} 
}

pub fn conv<T>(x []T, h []T) []T {
	len_y := x.len + h.len - 1
	mut y := []T{}

	mut x0, mut x1, mut h0, mut yn := 0, 0, 0, T(0)

	for i := 0; i < len_y; i++ {
		x0 = max(0, i - h.len +1)
		x1 = min(i + 1, x.len)
		h0 = min(i, h.len - 1)
		yn = T(0)

		for j := x0; j < x1; j++ {
			yn += h[h0]*x[j]
			h0--
		}
		y << yn
	}
	return y 
}
