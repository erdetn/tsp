// Erdet Nasufi erdet.nasufi@gmail.com Copyrights 2022 (C) //

module iir

pub struct IirFilter {
mut:
	buffer []f32
	coefficients []f32
	length int
	sections int
}

pub fn new(coefficients []f32) ?IirFilter {
	if coefficients.len % 2 == 0 {
		return error('Wrong number of coefficients')
	}

	len := int(((coefficients.len)-1)/2)
	sections := int(len/2)

	new_buffer := []f32 {
		len: coefficients.len,
		cap: coefficients.len,
		init: f32(0)
	}
	return IirFilter {
		buffer: new_buffer
		coefficients: coefficients
		length: len
		sections: sections
	}
}

// Implements cascaded direct form II second order sections.
pub fn (mut this IirFilter)filter(input f32) f32 {
	n := this.sections
	mut y := f32(0)

	mut h1, mut h2 := f32(0), f32(0)

	y = input * (this.coefficients[0])
	for i in 0..n {
		h1 = this.buffer[2*i]
		h2 = this.buffer[2*i+1]

		y = y - h1*(this.coefficients[4*i+1])
		h3 := f32(y - h2*(this.coefficients[4*i+2]))

		y = h3 + h1*(this.coefficients[4*i+3])
		y += h2 * (this.coefficients[4*i+4])

		this.buffer[2*i+1] = this.buffer[2*i]
		this.buffer[2*i] = h3
	}

	return y
}

pub fn (mut this IirFilter)filter_array(mut samples []f32) {
    for mut sample in samples {
        sample = this.filter(sample) 
    }
}

pub fn (this IirFilter)coefficients() []f32 {
	return this.coefficients
}

pub fn (this IirFilter)history() []f32 {
	return this.buffer
}

pub fn (this IirFilter)length() int {
	return this.length
}

pub fn (this IirFilter)sections() int {
	return this.sections
}
