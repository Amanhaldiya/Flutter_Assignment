import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myapp/Counter_bloc/Employee_.dart';
Future<List<Employee>> fetchEmployees() async {
  final response = await http.get(Uri.parse("https://dummy.restapiexample.com/api/v1/employees"));
  if (response.statusCode == 200) {
    // Parse the response and create a list of Employee objects
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> employeeData = data['data'];
    return employeeData.map((e) => Employee(
      employeeName: e['employee_name'],
      employeeAge: int.parse(e['employee_age'].toString()),  // Ensure it's parsed as an integer
    )).toList();
  } else {
    throw Exception("Failed to load employees");
  }
}