export default function palindrome(str: string): boolean {
    const forward = str.split(/[ _\W]/).join('').toLowerCase();
    const backwards = forward.split('').reverse().join('');
    
    return forward === backwards;
  }