/*
This is the main file for the program.
The program creates a company, adds departments to the company, and adds employees to the departments.
*/

using System;
using System.Collections.Generic;

namespace AcmeCorporation
{
    class Program
    {
        static void Main(string[] args)
        {
            // Create a company
            Company acme = new Company("Acme Corporation", new CompanyAddress("123 Main St", "Springfield", "IL", "62701"), "555-1234");

            // Create departments
            Department hr = new Department(1, "Human Resources");
            Department it = new Department(2, "Information Technology");
            Department sales = new Department(3, "Sales");

            // Add departments to the company
            acme.AddDepartment(hr);
            acme.AddDepartment(it);
            acme.AddDepartment(sales);

            // Create employees
            Employee emp1 = new HourlyEmployee(1, 1, "John", "Doe", 15.0);
            Employee emp2 = new SalariedEmployee(2, 1, "Jane", "Smith", 50000.0);
            Employee emp3 = new CommissionedEmployee(3, 3, "Bob", "Jones", 0.1);

            // Add employees to departments
            hr.AddEmployee(emp1);
            hr.AddEmployee(emp2);
            sales.AddEmployee(emp3);

            // Display department names
            List<string> departmentNames = acme.ListDepartments();
            foreach (string name in departmentNames)
            {
                Console.WriteLine(name);
            }

            // Display employee information
            foreach (Department department in acme.Departments)
            {
                Console.WriteLine(department.Name);
                foreach (Employee employee in department.Employees)
                {
                    Console.WriteLine(employee.FullName + " - " + employee.GetPay());
                }
            }
        }
    }
}