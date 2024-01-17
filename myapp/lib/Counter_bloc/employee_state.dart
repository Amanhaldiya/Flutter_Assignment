import 'package:myapp/Counter_bloc/Employee_.dart';
import 'package:myapp/UI/Filter_List.dart';


abstract class EmployeeState {}

class EmployeeInitial extends EmployeeState {}

class EmployeeLoading extends EmployeeState {}

class EmployeeLoaded extends EmployeeState 
{
  final List<Employee> employees;
  final String searchQuery;
  final AgeFilter? ageFilter;

  EmployeeLoaded({
    required this.employees,
    required this.searchQuery,
    required this.ageFilter,
  });

  List<Employee> get filteredEmployees
   {
    // Apply search filter
    List<Employee> result =
        employees.where((emp) => emp.employeeName.toLowerCase().contains(searchQuery.toLowerCase())).toList();

    // Apply age-based filter
    if (ageFilter != null)
     {
      result = result
          .where((emp) => emp.employeeAge >= ageFilter!.lower && emp.employeeAge <= ageFilter!.upper)
          .toList();
    }

    return result;
  }
}
