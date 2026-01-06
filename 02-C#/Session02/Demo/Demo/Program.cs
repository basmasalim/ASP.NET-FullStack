namespace Demo
{
	internal class Program
	{
		static void Main(string[] args)
		{
			#region Variable Declaration

			//int number = 100;
			//Console.WriteLine(number);
			//string studentName = "Aliaa Tarek";
			//Console.WriteLine(studentName);

			#endregion

			#region Data Types
			#region Value Type Data Types

			//int x;
			//// CLR Will Allocate 4 Uninitialized Bytes in Stack 
			//x = 10;
			//Console.WriteLine(x); // 10

			//Int32 y;
			//// CLR Will Allocate 4 Uninitialized Bytes in Stack 
			//y = 20;
			//Console.WriteLine(y); // 20

			//y = x; // 10
			//Console.WriteLine(x); // 10
			//Console.WriteLine(y); // 10

			//x++;
			//Console.WriteLine(x); // 11
			//Console.WriteLine(y); // 10

			#endregion
			#region Reference Type Data Types

			//Point p1;
			//// Declare For Reference of Type Point “P1” Referencing to Null
			//// 4 Bytes Allocated in Stack For Pointer|Reference 
			//// 0 Bytes Allocated in Heap 
			//p1 = new Point(); // Has 2 References (P1 ,P2)
			//				  // 1. Allocate Required Bytes at Heap
			//				  // 2. Initialize Allocated Bytes Of Object With Default Value
			//				  // 3. Call User Defined Constructor (If Exist)
			//				  // 4. Assign Reference (P1) To Allocated Object

			//Console.WriteLine($"P1.X = {p1.x}"); // 0
			//Console.WriteLine($"P1.Y = {p1.y}"); // 0

			//Point p2 = new Point(); // Unreachable Object
			//Console.WriteLine($"P2.X = {p2.x}"); // 0 
			//Console.WriteLine($"P2.Y = {p2.y}"); // 0 
			//p2 = p1;
			//Console.WriteLine("After P2 = P1");
			//p1.x = 10;
			//p1.y = 20;
			//Console.WriteLine($"P1.X = {p1.x}"); // 10
			//Console.WriteLine($"P1.Y = {p1.y}"); // 20
			//Console.WriteLine($"P2.X = {p2.x}"); // 10 
			//Console.WriteLine($"P2.Y = {p2.y}"); // 20

			#endregion
			#endregion

			#region Object 

			#region ToString()
			//Point P1 = new Point() { x = 1, y = 2 };
			//Console.WriteLine(P1.ToString()); // Demo.Point

			//int X = 50;
			//Console.WriteLine(X.ToString()); // 50

			//object number = 123;
			//Console.WriteLine(number.ToString()); // 123

			//object name = "Aliaa";
			//Console.WriteLine(name.ToString()); // Aliaa 
			#endregion

			#region Equals()
			//Point P1 = new Point() { x = 1, y = 2 };
			//Point P2 = new Point() { y = 1, x = 2 };
			//Console.WriteLine(P1.Equals(P2)); // False


			//int X = 10;
			//int Y = 10;
			//Console.WriteLine(X.Equals(Y)); // True


			//object number01 = 10;
			//object number02 = 10;
			//Console.WriteLine(number01.Equals(number02));//true


			//object name01 = "Route";
			//object name02 = "Route";
			//Console.WriteLine(name01.Equals(name02)); // True
			#endregion

			#region GetHashCode()
			//Point P1 = new Point() { x = 1, y = 2 };
			//Point P2 = new Point() { y = 1, x = 2 };
			//Console.WriteLine(P1.GetHashCode()); // 54267293
			//Console.WriteLine(P2.GetHashCode()); // 18643596
			//									 // GetHashCode Of Object 

			//int X = 10;
			//int Y = 10;
			//Console.WriteLine(X.GetHashCode()); // 10
			//Console.WriteLine(Y.GetHashCode()); // 10
			//									// GetHashCode of int

			//object number01 = 10;
			//object number02 = 10;
			//Console.WriteLine(number01.GetHashCode());// 10
			//Console.WriteLine(number02.GetHashCode());// 10
			//										  //  GetHashCode of object but Will Call GetHashCode of int

			//object name01 = "Route";
			//object name02 = "Route";
			//Console.WriteLine(name01.GetHashCode()); // 1464061437
			//Console.WriteLine(name02.GetHashCode()); // 1464061437
			//										 // GetHashCode of object but Will Call GetHashCode of string
			#endregion

			#region GetType() - GetType of object Not Overridden
			//Point P1 = new Point() { x = 1, y = 2 };
			//Console.WriteLine(P1.GetType()); // Demo.Point

			//int X = 50;
			//Console.WriteLine(X.GetType()); // System.Int32

			//object number = 123;
			//Console.WriteLine(number.GetType()); // System.Int32

			//object name = "Aliaa";
			//Console.WriteLine(name.GetType()); // System.String 
			#endregion

			#region Examples 
			//object obj;
			//// Declare for variable/Reference of Type 'Object' Referencing to Null
			//// This References Can Refer To An Instance from type object or any type that inherit from object 
			//// CLR Will Allocate 4 Bytes in Stack For Reference 
			//// 0 Bytes Will Allocated at Heap 

			//obj = new object();
			//obj = new string("Route");
			//obj = "Route"; // Boxing 
			//obj = 1; // Boxing 
			//obj = 1.2; // Boxing 
			//obj = true; // Boxing 
			//obj = 'A'; // Boxing 
			//obj = new DateTime(); // Boxing 
			//obj = new DateOnly(); // Boxing 

			//int number = (int) obj; // Unboxing - Not Safe 
			#endregion

			#endregion
		}

		#region Comments 
		// 1.Single Line Comments
		// This Function is Used To adds Two Numbers

		// 2.MultiLine Comments

		/* This Function 
		 * is Used To
		 * adds Two Numbers
		 */

		// 3.XML Comments

		///<summary>
		/// This Function is used To adds Two Numbers
		///</summary>
		/// <param name="x"> The first number to add </param>
		/// <param name="y"> The second number to add </param>
		/// <returns>The sum of the two numbers.</returns>
		public int Add(int x, int y)
		{
			return x + y;
		}
		#endregion
	}
}

