// solution for as cii art

use std::io;

macro_rules! parse_input {
    ($x:expr, $t:ident) => ($x.trim().parse::<$t>().unwrap())
}

/**
 * Auto-generated code below aims at helping you parse
 * the standard input according to the problem statement.
 **/
fn main() {
    //let mut input_line = String::new();
    //io::stdin().read_line(&mut input_line).unwrap();
    let mut input_line = get_line_as_string();
    let asc_len = parse_input!(input_line, i32);

    input_line = get_line_as_string();
    let asc_hei = parse_input!(input_line, i32);
    
    input_line = get_line_as_string();
    let t: Vec<char> = input_line.trim_right().to_uppercase().chars().collect();
    
    let mut char_lines: Vec<String> = vec![];
    for i in 0..asc_hei as usize {
        let mut input_line = get_line_as_string();
        let row = input_line.to_string();
        char_lines.push(row);
    }

    for (row_index, chr_row) in char_lines.iter().enumerate() {
        let mut res_str = String::new();
        for chr in &t {
            let apos = 'A' as i32;
            let mut cn = *chr as i32 - apos;        
            if (cn < 0 || cn > 25) {
                cn = 26;
            }
            let start = (cn * asc_len) as usize;
            let end = start + asc_len as usize;
            res_str.push_str( &chr_row[start..end] );
         }
        println!("{}", res_str);
    }
}

fn get_line_as_string() -> String {
    let mut stln = String::new();
    io::stdin().read_line(&mut stln).unwrap();
    return stln;
}
