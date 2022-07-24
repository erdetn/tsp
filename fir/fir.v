// Erdet Nasufi erdet.nasufi@gmail.com Copyrights 2022 (C) //

module fir

pub struct FirFilter {
mut:
	buffer []f32
	coefficients []f32
	length int
}

pub fn new(coefficients []f32) FirFilter {
	new_buffer := []f32 {
		len: coefficients.len,
		cap: coefficients.len,
		init: f32(0)
	}
	return FirFilter {
		buffer: new_buffer
		coefficients: coefficients
		length: coefficients.len
	}
}

// ---------------------------------------------------------------- //
//                                                                  //
//         x[0]         x[1]         x[2]           x[N]            //
//           |            |            |              |             //
//  input ---+--->[z-1]---+--->[z-2]---+--->[z-N]-----+             //
//           |            |            |              |             //
//         c[0]         c[1]         c[2]           c[N]            //
//           |            |            |              |             //
//           |            |            |              +-->+         //
//           |            |            |                  |         //
//           |            |            +----------------->+         //
//           |            |                               |         //
//           |            +------------------------------>+         //
//           |                                            |         //
//           +------------------------------------------->+         //
//                                                        |         //
//                                                        +---> y   //
//                                                                  //
// ---------------------------------------------------------------- //

pub fn (mut this FirFilter)filter(input f32) f32 {
	n := this.coefficients.len
	mut y := f32(0)

	for i in 1..n {
		y += (this.buffer[n-i])*(this.coefficients[n-i])
		this.buffer[n-i] = this.buffer[n-i-1]
	}
	y += input * (this.coefficients[0])
	this.buffer[1] = input

	return y
}

pub fn (mut this FirFilter)filter_array(mut samples []f32) {
    for mut sample in samples {
        this.filter(sample) 
    }
}

pub fn (this FirFilter)coefficients() []f32 {
	return this.coefficients
}

pub fn (this FirFilter)history() []f32 {
	return this.buffer
}

pub fn (this FirFilter)length() int {
	return this.length
}
