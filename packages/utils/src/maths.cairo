use core::num::traits::{Zero, One};

// Fast exponentiation using the square-and-multiply algorithm
pub fn fast_power<
    T,
    U,
    +Zero<T>,
    +Zero<U>,
    +One<T>,
    +One<U>,
    +Add<U>,
    +Mul<T>,
    +Rem<U>,
    +Div<U>,
    +Copy<T>,
    +Copy<U>,
    +Drop<T>,
    +Drop<U>,
    +PartialEq<U>,
>(
    base: T, exp: U
) -> T {
    if exp == Zero::zero() {
        return One::one();
    }

    let mut res: T = One::one();
    let mut base: T = base;
    let mut exp: U = exp;

    let two: U = One::one() + One::one();

    loop {
        if exp % two == One::one() {
            res = res * base;
        }
        exp = exp / two;
        if exp == Zero::zero() {
            break res;
        }
        base = base * base;
    }
}


// Compare Bytes lexico-graphically
pub fn compare_bytes(left: @ByteArray, right: @ByteArray) -> i32 {
    let mut i = 0;
    let mut j = 0;
    let mut left_len = left.len();
    let mut right_len= right.len();
    let mut result: i32 = 0;
    while i < left_len && j < right_len {
        let left_byte: u8 = left[i];
        let right_byte: u8 = right[j];

        if left_byte < right_byte {
            result = -1;
        } else if left_byte > right_byte {
            result = 1;
        }

        i += 1;
        j += 1;
    };
    if result != 0 {
        return result;
    }

    if left_len < right_len {
        return -1;
    } else if left_len > right_len {
        return 1;
    }

    return result;
}