#include <iostream>
#include <stdexcept>

unsigned long long fibonacci(int n) {
    if (n < 0) {
        throw std::invalid_argument("n должно быть неотрицательным числом.");
    }
    if (n > 99) { 
        throw std::out_of_range("n слишком велико, максимальное значение 99.");
    }

    if (n == 0) return 0;
    if (n == 1) return 1;

    unsigned long long a = 0, b = 1, c;
    for (int i = 2; i <= n; ++i) {
        c = a + b;
        a = b;
        b = c;
    }
    return b;
}

int main() {
    int n;

    std::cout << "Введите номер n (неотрицательное число, не больше 99): ";
    std::cin >> n;

    try {
        unsigned long long result = fibonacci(n);
        std::cout << "n-ное число Фибоначчи: " << result << std::endl;
    } catch (const std::exception &e) {
        std::cerr << "Ошибка: " << e.what() << std::endl;
    }

    return 0;
}
