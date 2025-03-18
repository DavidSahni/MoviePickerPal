export function CheckIfWhitespace(input : string) : boolean {
  if (!input){
    return true; //if input is null return true
  }
  if (input && !input.trim()){
    return true;
  }
  return false;
}