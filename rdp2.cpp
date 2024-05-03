#include <iostream>
using namespace std;


string istr;
int i;
bool valid = true;

void E();

void F()
{
	if (istr[i] == 'i')
	{
		i++;
		//cout << "i " << i << endl;
	}
	else if (istr[i] == '(')
	{
		i++;
		//cout << "( " << i << endl;
		E();
		if (istr[i] == ')')
		{
			i++;
			//cout << ") " << i << endl;
		}
	}
	else
	{
		//cout << "currently at " << i << " " << istr[i] << endl;
		valid = false;
	}
}

void TD()
{
	if (istr[i] == '*')
	{
		i++;
		//cout << "* " << i << endl;
		F();
		TD();
	}
}

void T()
{
	F();
	TD();
}

void ED()
{
	if (istr[i] == '+')
	{
		i++;
		//cout << "+ " << i << endl;
		T();
		ED();
	}
}

void E()
{
	T();
	ED();
}


int main()
{

	while (true)
	{
		cout << "Enter a string: ";
		cin >> istr;
		// cout << "\nyour string: " << istr << "\n";
		i = 0;
		E();
		
		if (i == istr.length() && valid)
		{
			cout << "String accepted\n";
		}
		
		else
		{
			cout << "String rejected\n";
		}

		cout << "Enter (y/n) to continue: ";
		char x;
		cin >> x;
		
		if (x != 'y') break;
	}
	return 0;
}

