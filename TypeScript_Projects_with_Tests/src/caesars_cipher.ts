export default function rot13(str: string): string {
    let translated = '';
    const A_code = 'A'.charCodeAt(0);
    const number_of_letters = 26;
    let shifted_code: number;
  
    for (let i=0; i<str.length; i++){
      if (str[i].match(/\w/)!=null)
      {
        shifted_code = str.charCodeAt(i) - 13;
        if (shifted_code < A_code)
          shifted_code += number_of_letters;
        translated += String.fromCharCode(shifted_code)
      } 
      else 
      {
        translated += str[i];
      }
    }
    return translated;
  }