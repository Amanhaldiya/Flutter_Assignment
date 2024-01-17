import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/Counter_bloc/Employee_.dart';
import 'package:myapp/Counter_bloc/Employee_event.dart';
import 'package:myapp/Counter_bloc/employee_state.dart';
import 'package:myapp/UI/Filter_List.dart';


class EmployeeDashboard extends StatelessWidget 
{
  const EmployeeDashboard({super.key});
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
      title: const Text("Employee Dashboard")
      ),
      body: BlocProvider
      (
        create: (context) => EmployeeBloc()..add(FetchEmployees()),
        child: const EmployeeList(),
      ),
    );
  }
}
class EmployeeList extends StatelessWidget 
{
  const EmployeeList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    return BlocBuilder<EmployeeBloc, EmployeeState>
    (
      builder: (context, state) 
      {
        if (state is EmployeeLoading) 
        {
          return const Center(child: CircularProgressIndicator());
        } 
        else if 
        (
          state is EmployeeLoaded
        ) 
        {
          return Column
          (
            children: 
            [
              Padding
              (
                padding: const EdgeInsets.all(16.0),
                child: Row
                (
                  children: [
                    const SizedBox
                    (
                      width: 16
                    ),
                    Expanded
                    (
                      child: TextField
                      (
                        onChanged: (value) 
                        {
                          // Dispatch the search query update event
                          context.read<EmployeeBloc>().add(UpdateSearchQuery(value));
                        },
                        decoration: const InputDecoration
                        (
                          labelText: 'Search by Name',
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox
              (
                height: 10
              ),
              DropdownButton<AgeFilter>
              (
                hint: const Text('Filter by Age'),
                value: state.ageFilter,
                onChanged: (value) {
                  
                  if 
                  (
                    value != state.ageFilter
                  ) 
                  {
                    context.read<EmployeeBloc>().add(UpdateAgeFilter(value));
                  }
                },
                items:
                [
                  AgeFilter(20, 30),
                  AgeFilter(31, 40),
                  AgeFilter(41, 50),
                  // Add more age filters as needed
                ].map((filter) 
                {
                  return DropdownMenuItem<AgeFilter>
                  (
                    value: filter,
                    child: Text
                    (
                    '${filter.lower} - ${filter.upper} years'
                    ),
                  );
                }
                ).toList(),
              ),
              const SizedBox
              (
                height: 10
              ),
              Expanded
              (
                child: ListView.builder
                (
                  itemCount: state.filteredEmployees.length,
                  itemBuilder: (context, index) 
                  {
                    return ListTile
                    (
                      title: Text(state.filteredEmployees[index].employeeName),
                      subtitle: Text('Age: ${state.filteredEmployees[index].employeeAge}'),
                    );
                  },
                ),
              ),
            ],
          );
        } else 
        {
          return const Text('Error loading employees');
        }
      },
    );
  }
}
