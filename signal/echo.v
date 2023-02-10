// Erdet Nasufi erdet.nasufi@gmail.com Copyrights 2022 (C) //

module signal

pub struct EchoParameters{
pub mut:
	delay u32
	attenuation f32
}

pub fn echo[X, T](x []X, params []EchoParameters) []T {
	mut y := []T{}
	mut y0 := T(0)

	for i := u32(0); i < x.len; i++ {
		y0 = x[i]
		for p := 0; p < params.len; p++ {
			if i >= params[p].delay {
				y0 += T(params[p].attenuation * (x[i-params[p].delay]))
			}
		}
		y << y0
	}
	return y 
}
