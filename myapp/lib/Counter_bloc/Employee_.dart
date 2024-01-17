// Import necessary packages



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Counter_bloc/Employee_event.dart';
import 'package:myapp/Counter_bloc/employee_state.dart';

import 'package:myapp/Apis/ApiCall.dart';

// Employee Bloc
class Employee
 {
  final String employeeName;
  final int employeeAge;

  Employee({required this.employeeName, required this.employeeAge});
}

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState>
 {
  EmployeeBloc() : super(EmployeeInitial());

  @override
  Stream<EmployeeState> mapEventToState(EmployeeEvent event) async* 
  {
    if (event is FetchEmployees) 
    {
      yield EmployeeLoading();

      // Simulate fetching employees from the API for demonstration purposes
      final List<Employee> employees = await fetchEmployees();
      yield EmployeeLoaded(employees: employees, searchQuery: '', ageFilter: null);
    }
     else if 
     (event is UpdateSearchQuery) 
     {
      yield EmployeeLoaded
      (
        employees: (state as EmployeeLoaded).employees,
        searchQuery: event.query,
        ageFilter: (state as EmployeeLoaded).ageFilter,
      );
    } else if
     (event is UpdateAgeFilter) 
     {
      yield EmployeeLoaded
      (
        employees: (state as EmployeeLoaded).employees,
        searchQuery: (state as EmployeeLoaded).searchQuery,
        ageFilter: event.ageFilter,
      );
    }
  }

 

}