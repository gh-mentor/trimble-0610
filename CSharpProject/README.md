<!--
This file documents the design and implementation of the PayrollLibrary project. 
Details:
- The project contains related classes that provides functionality for a company to manage hourly and salaried employees.
- The library is implemented in C# and adheres to the SOLID principles.
- This document also includes details of the classes,  usage and license information.
-->


# PayrollLibrary

The PayrollLibrary project is a C# library that provides functionality for a company to manage hourly and salaried employees. The library is implemented in C# and adheres to the SOLID principles.

## Classes

The library contains the following classes:

- `Employee` - Represents an employee with a name and address.
- `HourlyEmployee` - Represents an hourly employee with an hourly rate and hours worked.
- `SalariedEmployee` - Represents a salaried employee with a monthly salary.
- `Payroll` - Provides functionality to calculate the payroll for a list of employees.
- `Company` - Represents a company with a list of employees.
- `Department` - Represents a department with a list of employees.

## Usage

To use the PayrollLibrary, you can create instances of the `Employee`, `HourlyEmployee`, `SalariedEmployee`, `Payroll`, `Company`, and `Department` classes and call their methods to manage employees and calculate payroll.

Example:

```csharp
Employee employee = new HourlyEmployee("John Doe", "123 Main St", 15.0, 40);
Employee employee2 = new SalariedEmployee("Jane Smith", "456 Elm St", 5000.0);

List<Employee> employees = new List<Employee> { employee, employee2 };

Payroll payroll = new Payroll();
decimal totalPayroll = payroll.CalculatePayroll(employees);

Console.WriteLine($"Total payroll: {totalPayroll}");
```