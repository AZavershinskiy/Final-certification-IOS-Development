//
//  main.m
//  QuadraticEquation
//
//  Created by Andrey Zavershinskiy on 29.01.2024.
//

#import <Foundation/Foundation.h>

// MARK: - Task
//
// Необходиморешатьквадратноеуравнение типа ax^2+bx+c=0.
// Коэффициенты вводит пользователь.
// В результате выполнения должны выводиться корни уравнения
//
//
// MARK: - Method
//
void quadraticEquation(double a, double b, double c) {
	double discriminant = b * b  - 4 * a * c;
	if (discriminant > 0) {
		double x1 = (-b + sqrt(discriminant)) / (2 * a);
		double x2 = (-b - sqrt(discriminant)) / (2 * a);
		NSLog(@"First root: %.2f, second root %.2f", x1, x2);
	} else if (discriminant == 0) {
		double x = -b / (2 * a);
		NSLog(@"One root: %.2f", x);
	} else {
		NSLog(@"No roots");
	}
}

// MARK: - main
//
int main(int argc, const char * argv[]) {
	@autoreleasepool {

		double a, b, c;

		NSLog(@"The equation: ax^2+bx+c=0");

		NSLog(@"Input coefficient 'a':");
		scanf("%lf", &a);
		NSLog(@"Input coefficient 'b':");
		scanf("%lf", &b);
		NSLog(@"Input coefficient 'c':");
		scanf("%lf", &c);

		quadraticEquation(a, b, c);

		NSLog(@"----------");

	}
	return 0;
}
