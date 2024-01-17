

// Employee Bloc
import 'package:myapp/UI/Filter_List.dart';

class Employee 
{
  final String employeeName;
  final int employeeAge;

  Employee({required this.employeeName, required this.employeeAge});
}

abstract class EmployeeEvent {}

class FetchEmployees extends EmployeeEvent {}

class UpdateSearchQuery extends EmployeeEvent 
{
  final String query;

  UpdateSearchQuery(this.query);
}

class UpdateAgeFilter extends EmployeeEvent {
  final AgeFilter? ageFilter;

  UpdateAgeFilter(this.ageFilter);
}

