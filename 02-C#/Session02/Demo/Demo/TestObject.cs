using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo
{
	class MyClass
	{
		public void Print<T>(T item)
		{
			Console.WriteLine(item);
		}
		public void TestPrint()
		{
			Print<int>(100);
			Print<string>("Aliaa");
			Print<char>('A');
			Print<bool>(true);
		}

		public void PrintWithObject(object item)
		{
			Console.WriteLine(item);
		}
		public void TestPrintWithObject()
		{
			PrintWithObject(100);
			PrintWithObject("Aliaa");
			PrintWithObject('A');
			PrintWithObject(true);
		}
	}
	enum MyEnum
	{

	}

	struct MyStruct
	{

	}

	interface MyInterface
	{

	}
}
