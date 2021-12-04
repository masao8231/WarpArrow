#include <iostream>

//A little C++ program to convert a RGB number to love2D defaults
using namespace std;

int main(int argc, char** argv){
    double colors[3];
    for (int i=1; i<4; i++)
        colors[i - 1] = stod(argv[i]);

    cout << "Love2D default: " << colors[0]/255 << ", " << colors[1]/255 << ", " << colors[2]/255 << "\n"; 

    return 0; 
}