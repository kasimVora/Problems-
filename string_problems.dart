void main() {
  String test = "kasim vora";

  print(vowelCount(test));
}

int vowelCount(String inp) {
  int res = 0;

  List v = ["a", "e", "i", "o", "u"];

  List inpList = inp.split("");

  for (int i = 0; i < inpList.length; i++) {
    if (v.contains(inpList[i])) {
      res = res + 1;
    }
  }

  return res;
}

String reverseString(String inp) {
  List a = inp.split("");
  String reverse = "";

  for (int i = a.length - 1; i >= 0; i--) {
    reverse = reverse + a[i];
  }

  return reverse;
}

bool isPalindrome(String inp) {
  bool res = false;

  // replace spaces and lowercase
  inp = inp.replaceAll(RegExp(r'\s+'), "").toLowerCase();

  print(inp);

  if (inp == reverseString(inp)) {
    res = true;
  }

  return res;
}
