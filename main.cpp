#include <iostream>
#include <stdexcept>
#include "fibonacci.h" 

int main() {
    for (int n = 0; n <= 10; ++n) {
        try {
            unsigned long long result = fibonacci(n);  
            std::cout << "n-ное число Фибоначчи для n = " << n << ": " << result << std::endl;
        } catch (const std::exception &e) {
            std::cerr << "Ошибка: " << e.what() << std::endl;
        }
    }

    return 0;
}
