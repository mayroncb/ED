#include <iostream>
#include <vector>
#include <chrono>
#include <string>
#include <iomanip>

using namespace std;

// Implementação do Selection Sort
void selectionSort(vector<long long> &arr) {
  int n = arr.size();
  for (int i = 0; i < n - 1; i++) {
    int min_idx = i;
    for (int j = i + 1; j < n; j++) {
      if (arr[j] < arr[min_idx])
        min_idx = j;
    }
    swap(arr[min_idx], arr[i]);
  }
}

// Implementação do Insertion Sort
void insertionSort(vector<long long> &arr) {
  int n = arr.size();
  for (int i = 1; i < n; i++) {
    long long key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j = j - 1;
    }
    arr[j + 1] = key;
  }
}

// Implementação do MergeSort
void merge(vector<long long>& arr, int left, int mid, int right) {
    int n1 = mid - left + 1;
    int n2 = right - mid;
    vector<long long> L(n1), R(n2);

    for (int i = 0; i < n1; i++) L[i] = arr[left + i];
    for (int j = 0; j < n2; j++) R[j] = arr[mid + 1 + j];

    int i = 0, j = 0, k = left;
    while (i < n1 && j < n2) {
        if (L[i] <= R[j]) arr[k++] = L[i++];
        else arr[k++] = R[j++];
    }
    while (i < n1) arr[k++] = L[i++];
    while (j < n2) arr[k++] = R[j++];
}

void mergeSort(vector<long long>& arr, int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;
        mergeSort(arr, left, mid);
        mergeSort(arr, mid + 1, right);
        merge(arr, left, mid, right);
    }
}

// Implementação do QuickSort
int partition(vector<long long>& arr, int low, int high) {
    long long pivot = arr[high];
    int i = (low - 1);
    for (int j = low; j <= high - 1; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[high]);
    return (i + 1);
}

void quickSort(vector<long long>& arr, int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

int main(int argc, char *argv[]) {
  if (argc < 2) {
    cerr << "Uso: " << argv[0] << " <algoritmo: selection|insertion>" << endl;
    return 1;
  }

  string algo = argv[1];
  int n;
  if (!(cin >> n))
    return 0;

  vector<long long> arr(n);
  for (int i = 0; i < n; i++) {
    cin >> arr[i];
  }

  auto start = chrono::high_resolution_clock::now();

  if (algo == "selection") {
    selectionSort(arr);
  } else if (algo == "insertion") {
    insertionSort(arr);
  } else if (algo == "merge") {
    mergeSort(arr, 0, n - 1);
  } else if (algo == "quick") {
    quickSort(arr, 0, n - 1);
  }

  auto end = chrono::high_resolution_clock::now();
  chrono::duration<double> diff = end - start;

  // Saída: números ordenados
  for (int i = 0; i < n; i++) {
    cout << arr[i] << (i == n - 1 ? "" : " ");
  }
  cout << endl;
// ... (após o loop de ordenação)

    // 1. Imprime os números ordenados
    for (int i = 0; i < n; i++) {
        cout << arr[i] << "\n";
    }

    // 2. Imprime uma tag identificadora e o tempo no FINAL do arquivo
    // Isso garante que o tempo seja salvo no .txt da pasta /saidas
    cout << "TEMPO_TOTAL " << fixed << setprecision(6) << diff.count() << endl;

    // Mantém o cerr apenas para você ver no terminal enquanto roda
    cerr << fixed << setprecision(6) << diff.count() << endl;

    return 0;
  // Log de tempo para erro padrão
 // cerr << "Tempo (" << algo << "): " << diff.count() << "s" << endl;
 //cerr << fixed << setprecision(6) << diff.count();
//  return 0;
}
