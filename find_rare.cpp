#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>
#include <array>
#include <vector>

using namespace std;

int num_states;

void find_num_states(string file_name){
    string line;
    ifstream og(file_name.c_str());

    if(og.is_open()){
        while(getline(og,line)){
            if(line.find("parameter") != string::npos){
                int pos = line.find_last_of('=');
                num_states = stoi(line.substr(pos+1,2));
            }
        }
    }
}

void print_matrix(float **mat){
    for(int i = 0; i < num_states; i++){
        for(int j = 0; j < num_states; j++){
            cout << mat[i][j] << " ";
        }
        cout << endl;
    }
}

void populate_transition_matrix(string file_name, float **t_mat){
    string line;
    ifstream og(file_name.c_str());
    int current_state, next_state, pos, stopchar;

    if(og.is_open()){
        while(getline(og,line)){
            if(line.find(": if") != string::npos){
                pos = line.find_first_of('s'); //finds pre-index to state number
                stopchar = line.find_first_of(" :"); //find post-index to state number
                current_state = stoi(line.substr(pos+1,stopchar)); //grabs int state number
            }
            else if(line.find("nx_state = ") != string::npos){
                if(line.find("default") != string::npos) break; //do not add 1 for default nx_state
                else {
                    pos = line.find_last_of('s'); //finds pre-index to state number
                    stopchar = line.find_last_of(';'); //find post-index to state number
                    next_state = stoi(line.substr(pos+1,stopchar)); //grabs int state number
                    t_mat[current_state-1][next_state-1]++; //increments mat at possible transition location
                }
            }
        }
    }
    
    //print_matrix(t_mat);

    //convert cumulative transition matrix to probabilistic transition matrix using averaging
    for(int i = 0; i < num_states; i++){
        int row_sum = 0;
        for(int j = 0; j < num_states; j++){
            row_sum += t_mat[i][j];
        }
        for(int j = 0; j < num_states; j++){
            t_mat[i][j] /= row_sum;
        }
    }

    //print_matrix(t_mat);
}

float ** init_matrix(){
    float **new_mat;
    new_mat = new float *[num_states];
    for(int i = 0; i < num_states; i++){
        new_mat[i] = new float[num_states];
        for(int j = 0; j < num_states; j++){
            new_mat[i][j] = 0;
        }
    }
    
    return new_mat;
}

void markov_dot(float vec[], float **mat){
    float result[num_states];

    for(int i = 0; i < num_states; i++){
        result[i] = 0;
        for(int j = 0; j < num_states; j++){
            result[i] += vec[j] * mat[j][i];
        }
        //cout << result[i] << " ";
    }
    //cout << endl;

    for(int i = 0; i < num_states; i++){
        vec[i] = result[i];
    }
}

bool arr_eq(float arr1[], float arr2[]){
    for(int i = 0; i < num_states; i++){
        if (arr1[i] != arr2[i]) return false;
    }
    return true;
}

void arr_copy(float ctrlC[], float ctrlV[]){
    for(int i = 0; i < num_states; i++){
        ctrlV[i] = ctrlC[i];
    }
}

void steady_state(float state_0[], float** P){
    float state_n[num_states];
    arr_copy(state_0, state_n);

    //Sn+1 = S0 * P^n
    markov_dot(state_n, P);

    if(!arr_eq(state_0, state_n)) steady_state(state_n, P);
    else{
        cout << "Steady state found!" << endl;
        float a = 1;
        int mindex = 0; //lol see what i did there
        vector<int> mindices;
        for(int i = 0; i < num_states; i++){
            cout << "S" << i+1 << ": " << state_n[i] << endl;
            if(state_n[i] < a){
                a = state_n[i];
                mindex = i;
                mindices.clear();
            }
            else if(abs(state_n[i] - a) < 1e-6){
                mindices.push_back(i);
            }
        }
        cout << "\n\nThe least likely state is S" << mindex+1;
        for(int i = 0; i < mindices.size(); i++){
            cout << ", S" << mindices[i]+1;
        }
        cout << " at " << a << ".";
    }
}

int main(){
    //input filename
    string file_to_parse;
    cout << "Input the file name including .v: ";
    cin >> file_to_parse;

    //parse file for num states
    find_num_states(file_to_parse);
    if (num_states > 0) cout << "This design has " << num_states << " states." << endl;
    else {
        cout << "The file name was incorrect. Please re-run the script." << endl;
        return -1;
    }

    //initialize transition matrix
    float **transition_mat;
    transition_mat = init_matrix();
    //print_matrix(transition_mat);

    //initialize state vector
    float state_vector[num_states];
    for (int i = 0; i < num_states; i++){
        if(i != 0) state_vector[i] = 0;
        else state_vector[i] = 1;
    }

    //parse file for state transitions.
    //this function averages multiple transitions out of the same state to emulate transition probabilities
    populate_transition_matrix(file_to_parse, transition_mat);
    //print_matrix(transition_mat);

    //test of matmul function
    //markov_dot(state_vector, transition_mat);

    //steady state calculation function
    steady_state(state_vector, transition_mat);

    //at this point, I have a probabilistic transition matrix
    //next, I need a matrix multiplication function
    //next next, I need a steady state calculation function
    //last, I need to identify least likely states and print them as output
    //last last, I need to deal with repeating steady states and average the repeating probabilities
    return 0;
}
