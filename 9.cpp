#include <bits/stdc++.h>
using namespace std;

template <class T, int S>
int findGeneric(T (&arr)[S], T sub){
    for(int i=0;i<S;++i){
        if(arr[i]==sub){
            return i;
        }
    }
    return -1;
}

int main(){
    int arr[5]={0,1,2,3,4};
    cout << findGeneric(arr,3) << endl;
    cout << findGeneric(arr,5) << endl;
    float farr[5] ={0,1,2,3,4};
    cout << findGeneric(farr,(float)3) << endl;
    cout << findGeneric(farr,(float)2.5) << endl;
    return 0;
}