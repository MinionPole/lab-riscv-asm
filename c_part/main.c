int main() {
  int n = 5;
  int m = 4;
  int ans = 0;
  int data[5][4] = {
    {1, -2, 3, 4},
    {5, 6, -7, 8},
    {9, 10, 11, 12},
    {-13, 14, 15, 16},
    {17, 18, 19, -20}
  };
  for(int i = 0; i < n;i++)
    for(int j = 0; j < m;j++)
      if(data[i][j] < 0)
        ans++;
}