import 'package:flutter_test/flutter_test.dart';

import 'package:mint_ui/mint_ui.dart';


void main() {
  group('PriceFormatters', () {
    test('formatPrice formats price with fixed decimal places', () {
      expect(PriceFormatters.formatPrice(1234.567), '₹1234.57');
      expect(PriceFormatters.formatPrice(99.9), '₹99.90');
      expect(PriceFormatters.formatPrice(100), '₹100.00');
    });

    test('formatPriceWithCommas formats price with commas', () {
      expect(PriceFormatters.formatPriceWithCommas(1234567.89), '₹1,234,567.89');
      expect(PriceFormatters.formatPriceWithCommas(98765.432), '₹98,765.43');
    });

    test('formatPriceInIndianStyle formats price in Indian numbering system', () {
      expect(PriceFormatters.formatPriceInIndianStyle(12345678.90), '₹1,23,45,678.90');
      expect(PriceFormatters.formatPriceInIndianStyle(987654.32), '₹9,87,654.32');
    });

    test('formatPriceCompact formats price to compact style', () {
      expect(PriceFormatters.formatPriceCompact(123456789.0), '₹12.3Cr');
      expect(PriceFormatters.formatPriceCompact(1234567.0), '₹12.3L');
      expect(PriceFormatters.formatPriceCompact(12345.0), '₹12.3K');
      expect(PriceFormatters.formatPriceCompact(999.0), '₹999');
    });
  });

  group('NumberFormatters', () {
    test('formatNumber formats number with fixed decimal places', () {
      expect(NumberFormatters.formatNumber(123.456, decimalPlaces: 2), '123.46');
      expect(NumberFormatters.formatNumber(123.4, decimalPlaces: 0), '123');
    });

    test('formatNumberWithCommas formats number with commas', () {
      expect(NumberFormatters.formatNumberWithCommas(1234567), '1,234,567');
      expect(NumberFormatters.formatNumberWithCommas(1234), '1,234');
    });

    test('formatPercentage formats decimal as percentage', () {
      expect(NumberFormatters.formatPercentage(0.556, decimalPlaces: 1), '55.6%');
      expect(NumberFormatters.formatPercentage(0.1234, decimalPlaces: 2), '12.34%');
    });

    test('formatFileSize formats bytes to human-readable size', () {
      expect(NumberFormatters.formatFileSize(1023), '1023 B');
      expect(NumberFormatters.formatFileSize(1024), '1.0 KB');
      expect(NumberFormatters.formatFileSize(1048576), '1.0 MB');
      expect(NumberFormatters.formatFileSize(1073741824), '1.0 GB');
      expect(NumberFormatters.formatFileSize(1099511627776), '1.0 TB');
    });
  });

  group('DateTimeFormatters', () {
    final date = DateTime(2025, 9, 17, 21, 30, 0);

    test('formatDate formats date to specified pattern', () {
      expect(DateTimeFormatters.formatDate(date), '17/09/2025');
      expect(DateTimeFormatters.formatDate(date, pattern: 'MM-dd-yyyy'), '09-17-2025');
    });

    test('formatTime formats time', () {
      expect(DateTimeFormatters.formatTime(date), '09:30 PM');
      expect(DateTimeFormatters.formatTime(date, is24Hour: true), '21:30');
    });

    test('formatDateTime formats date and time', () {
      expect(DateTimeFormatters.formatDateTime(date), '17/09/2025 09:30 PM');
    });

    test('formatRelativeTime returns human-readable relative time', () {
      final now = DateTime.now();
      expect(DateTimeFormatters.formatRelativeTime(now.subtract(Duration(minutes: 5))), '5 minutes ago');
      expect(DateTimeFormatters.formatRelativeTime(now.subtract(Duration(hours: 3))), '3 hours ago');
      expect(DateTimeFormatters.formatRelativeTime(now.subtract(Duration(days: 2))), '2 days ago');
      expect(DateTimeFormatters.formatRelativeTime(now.subtract(Duration(days: 35))), '1 month ago');
      expect(DateTimeFormatters.formatRelativeTime(now.subtract(Duration(days: 400))), '1 year ago');
      expect(DateTimeFormatters.formatRelativeTime(now.add(Duration(minutes: 5))), 'Just now'); // Handles future dates as 'Just now'
    });

    test('formatDuration formats duration', () {
      expect(DateTimeFormatters.formatDuration(Duration(minutes: 5, seconds: 10)), '05:10');
      expect(DateTimeFormatters.formatDuration(Duration(hours: 1, minutes: 2, seconds: 3)), '01:02:03');
    });
  });

  group('StringUtilities', () {
    test('capitalize capitalizes the first letter of a string', () {
      expect(StringUtilities.capitalize('hello world'), 'Hello world');
      expect(StringUtilities.capitalize('h'), 'H');
      expect(StringUtilities.capitalize(''), '');
    });

    test('capitalizeWords capitalizes the first letter of each word', () {
      expect(StringUtilities.capitalizeWords('hello world'), 'Hello World');
      expect(StringUtilities.capitalizeWords('test case'), 'Test Case');
    });

    test('truncateText truncates text to max length', () {
      expect(StringUtilities.truncateText('This is a long text', 10), 'This is...');
      expect(StringUtilities.truncateText('short', 10), 'short');
    });

    test('removeExtraSpaces removes multiple spaces', () {
      expect(StringUtilities.removeExtraSpaces('  hello    world   '), 'hello world');
      expect(StringUtilities.removeExtraSpaces(' no_extra_spaces '), 'no_extra_spaces');
    });

    test('maskString masks string correctly', () {
      expect(StringUtilities.maskString('password123'), 'pa*******23');
      expect(StringUtilities.maskString('short'), 'sh*rt');
      expect(StringUtilities.maskString('p', visibleStart: 1, visibleEnd: 1), 'p');
    });
  });

  group('PhoneNumberUtilities', () {
    test('formatPhoneNumber formats phone number with spaces', () {
      expect(PhoneNumberUtilities.formatPhoneNumber('9876543210'), '98765 43210');
      expect(PhoneNumberUtilities.formatPhoneNumber('01234567890'), '012345 67890');
      expect(PhoneNumberUtilities.formatPhoneNumber('123456789'), '123456789'); // No change
    });

    test('maskPhoneNumber masks phone number correctly', () {
      expect(PhoneNumberUtilities.maskPhoneNumber('9876543210'), '98******10');
    });

    test('isValidPhoneNumber validates phone number', () {
      expect(PhoneNumberUtilities.isValidPhoneNumber('9876543210'), true);
      expect(PhoneNumberUtilities.isValidPhoneNumber('987654321'), false);
      expect(PhoneNumberUtilities.isValidPhoneNumber('1234567890123456'), false);
    });
  });

  group('EmailUtilities', () {
    test('isValidEmail validates email format', () {
      expect(EmailUtilities.isValidEmail('test@example.com'), true);
      expect(EmailUtilities.isValidEmail('test.user@sub.domain.co.uk'), true);
      expect(EmailUtilities.isValidEmail('invalid-email'), false);
    });

    test('maskEmail masks email username part', () {
      expect(EmailUtilities.maskEmail('user_name@example.com'), 'u*******e@example.com');
      expect(EmailUtilities.maskEmail('u@domain.com'), 'u@domain.com');
    });
  });

  group('IndianValidators', () {
    test('isValidPAN validates PAN card number', () {
      expect(IndianValidators.isValidPAN('ABCDE1234F'), true);
      expect(IndianValidators.isValidPAN('ABCDEF1234F'), false);
    });

    test('isValidAadhaar validates Aadhaar number', () {
      expect(IndianValidators.isValidAadhaar('123456789012'), true);
      expect(IndianValidators.isValidAadhaar('12345678901'), false);
    });

    // test('isValidGST validates GST number', () {
    //   expect(IndianValidators.isValidGST('22ABCDE1234F1Z5'), true);
    //   expect(IndianValidators.isValidGST('12ABCDE1234F1Z5'), false); // Invalid state code
    // });

    test('isValidPincode validates Indian pincode', () {
      expect(IndianValidators.isValidPincode('123456'), true);
      expect(IndianValidators.isValidPincode('023456'), false);
      expect(IndianValidators.isValidPincode('12345'), false);
    });
  });

  group('ColorUtilities', () {
    test('colorToHex converts Color to hex string', () {
      final color = Color(0xFF123456);
      expect(ColorUtilities.colorToHex(color), '#123456');
    });

    test('hexToColor converts hex string to Color', () {
      expect(ColorUtilities.hexToColor('#123456'), Color(0xFF123456));
      expect(ColorUtilities.hexToColor('123456'), Color(0xFF123456));
      expect(ColorUtilities.hexToColor('#AABBCCDD'), Color(0xAABBCCDD));
    });
  });

  group('RandomUtilities', () {
    test('generateRandomString generates a string of correct length', () {
      expect(RandomUtilities.generateRandomString(10).length, 10);
    });

    test('generateRandomNumber generates a number within range', () {
      final number = RandomUtilities.generateRandomNumber(5, 10);
      expect(number, isA<int>());
      expect(number, greaterThanOrEqualTo(5));
      expect(number, lessThanOrEqualTo(10));
    });
  });

  group('JsonUtilities', () {
    test('prettyPrintJson formats JSON string with indentation', () {
      final json = {'name': 'John', 'age': 30};
      final expected = '{\n  "name": "John",\n  "age": 30\n}';
      expect(JsonUtilities.prettyPrintJson(json), expected);
    });

    test('parseJsonSafely parses a valid JSON string', () {
      final jsonString = '{"name": "Jane", "city": "New York"}';
      final expected = {'name': 'Jane', 'city': 'New York'};
      expect(JsonUtilities.parseJsonSafely(jsonString), expected);
    });

    test('parseJsonSafely returns null for invalid JSON', () {
      final invalidJsonString = '{name: "Jane"}';
      expect(JsonUtilities.parseJsonSafely(invalidJsonString), isNull);
    });
  });

  group('ListUtilities', () {
    test('removeDuplicates removes duplicate elements', () {
      final list = [1, 2, 2, 3, 4, 4, 5];
      expect(ListUtilities.removeDuplicates(list), [1, 2, 3, 4, 5]);
    });

    test('chunkList splits list into chunks', () {
      final list = [1, 2, 3, 4, 5, 6, 7];
      final chunks = ListUtilities.chunkList(list, 3);
      expect(chunks, [
        [1, 2, 3],
        [4, 5, 6],
        [7]
      ]);
    });

    test('findInList finds element or returns null', () {
      final list = [10, 20, 30, 40];
      expect(ListUtilities.findInList(list, (e) => e == 30), 30);
      expect(ListUtilities.findInList(list, (e) => e == 99), isNull);
    });
  });

  group('MapUtilities', () {
    test('sortMapByValue sorts map by value ascending', () {
      final map = {'c': 3, 'a': 1, 'b': 2};
      final sortedMap = MapUtilities.sortMapByValue(map);
      expect(sortedMap.keys.toList(), ['a', 'b', 'c']);
    });

    test('sortMapByValue sorts map by value descending', () {
      final map = {'c': 3, 'a': 1, 'b': 2};
      final sortedMap = MapUtilities.sortMapByValue(map, ascending: false);
      expect(sortedMap.keys.toList(), ['c', 'b', 'a']);
    });
  });

  group('CalculationUtilities', () {
    test('calculateDistance calculates distance between coordinates', () {
      const lat1 = 34.0522, lon1 = -118.2437; // Los Angeles
      const lat2 = 40.7128, lon2 = -74.0060; // New York
      final distance = CalculationUtilities.calculateDistance(lat1, lon1, lat2, lon2);
      expect(distance, closeTo(3935.7, 0.1));
    });

    test('calculatePercentage calculates percentage', () {
      expect(CalculationUtilities.calculatePercentage(50, 200), 25.0);
      expect(CalculationUtilities.calculatePercentage(0, 100), 0.0);
    });

    test('calculateTip calculates tip amount', () {
      expect(CalculationUtilities.calculateTip(100, 15), 15.0);
    });

    test('calculateDiscount calculates discount amount', () {
      expect(CalculationUtilities.calculateDiscount(100, 20), 20.0);
    });

    test('calculateFinalPrice calculates final price after discount', () {
      expect(CalculationUtilities.calculateFinalPrice(100, 20), 80.0);
    });

    test('calculateAge calculates age from birth date', () {
      final birthDate = DateTime(1990, 9, 17);
      expect(CalculationUtilities.calculateAge(birthDate), 35);
      expect(CalculationUtilities.calculateAge(DateTime(1990, 9, 18)), 34);
    });
  });

  group('PasswordUtilities', () {
    test('checkPasswordStrength returns correct strength level', () {
      expect(PasswordUtilities.checkPasswordStrength('pass'), PasswordStrength.weak);
      expect(PasswordUtilities.checkPasswordStrength('Abcdef12'), PasswordStrength.medium);
      expect(PasswordUtilities.checkPasswordStrength('Abcdef1234!'), PasswordStrength.strong);
      expect(PasswordUtilities.checkPasswordStrength('Abcdef12345!@#'), PasswordStrength.veryStrong);
    });
  });
}
