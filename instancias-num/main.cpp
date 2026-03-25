#include <iostream>
#include <vector>
#include <chrono>
#include <string>

using namespace std;

// Implementação do Selection Sort
void selectionSort(vector<long long>& arr) {
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
void insertionSort(vector<long long>& arr) {
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

int main(int argc, char* argv[]) {
    if (argc < 2) {
        cerr << "Uso: " << argv[0] << " <algoritmo: selection|insertion>" << endl;
        return 1;
    }

    string algo = argv[1];
    int n;
    if (!(cin >> n)) return 0;

    vector<long long> arr(n);
    for (int i = 0; i < n; i++) {
        cin >> arr[i];
    }

    auto start = chrono::high_resolution_clock::now();

    if (algo == "selection") {
        selectionSort(arr);
    } else if (algo == "insertion") {
        insertionSort(arr);
    }

    auto end = chrono::high_resolution_clock::now();
    chrono::duration<double> diff = end - start;

// Saída: um número por linha conforme solicitado
    for (int i = 0; i < n; i++) {
        cout << arr[i] << "\n";
    }
    cout << endl;

    // Log de tempo para erro padrão (opcional para análise)
    cerr << "Tempo (" << algo << "): " << diff.count() << "s" << endl;

    return 0;
}