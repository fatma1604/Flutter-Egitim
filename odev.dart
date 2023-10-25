void main() {
  int N = 5;
  int sonuc = faktoriyelHesapla(N);
  print("$N faktoriyeli: $sonuc");
}

int faktoriyelHesapla(int N) {
  if (N == 0) {
    return 1;
  }

  int faktoriyel = 1;
  for (int i = 1; i <= N; i++) {
    faktoriyel *= i;
  }
  return faktoriyel;
}
