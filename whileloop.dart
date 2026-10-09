import 'dart:io';

void main() {
  String? again = 'yes';

  while (again?.toLowerCase() == 'yes') {
    // Pizza Price
    print("Pizza Price: Small: 5 USD, Medium: 7 USD, Large: 10 USD");

    // Ask for pizza size
    print("Please enter your pizza size (small, medium, or large): ");
    String? size = stdin.readLineSync();

    // Ask for quantity
    print("How many pizzas do you want of $size?");
    int quantity = int.parse(stdin.readLineSync()!);

    // Switch Case for price
    int price = 0;
    switch (size?.toLowerCase()) {
      case 'small':
        price = 5;
        break;
      case 'medium':
        price = 7;
        break;
      case 'large':
        price = 10;
        break;
      default:
        print("Invalid size entered");
        return;
    }

    // Calculate total
    int total = price * quantity;
    print("Your Total Payment is: \$${total}");

    // Ask if user wants to order again
    print("Do you want to order again? (yes/no): ");
    again = stdin.readLineSync();
  }
}
