#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
 
using namespace std;

void insert_trojan(string in_file, string out_file, string target, string trigger_num, char payload)
{
    string line;
    ifstream og(in_file.c_str());
    ofstream out(out_file.c_str());

    int num_states;

    if(og.is_open() && out.is_open())
    {
        while(getline(og,line))
        {
            if(line.find("integer nx_state;") != string::npos)
            {
                out << line << endl;
                out << "integer trojan_count;" << endl;
            }
            else if(line.find("parameter") != string::npos)
            {
                int temp1 = line.find(";");
                int temp2 = line.find_last_of("=");
                num_states = stoi(line.substr(temp2+1,temp1-temp2-1));
                out << line << endl;
            }
            else if(line.find("rst == 1'b1") != string::npos)
            {
                out << line << endl;
                getline(og,line);
                out << "\t\tbegin\n\t\t\ttrojan_count = 0;" << endl;
                out << "\t" << line << "\n\t\tend" << endl;
            }
            else if(line.find("s" + target + " :") != string::npos)
            {
                //out << "\t\t\t\ts" + target + " : trojan_count = trojan_count + 1;" << endl;
                //out << "\t\t\t\t\t" + line.substr(line.find(":")+1) << endl;

                out << line << endl;

                while(getline(og,line))
                {
                    if(line.find("begin") != string::npos)
                    {
                        out << line << endl;
                        out << "\t\t\t\t\t\t\ttrojan_count = trojan_count + 1;" << endl;
                        continue;
                    }
                    if(payload == '1')
                    {
                        if(line.find("1'b1") != string::npos)
                        {
                            out << "\t\t\t\t\t\t\tif (trojan_count < "+ trigger_num +") begin" << endl;
                            out << "\t" << line << "\n\t\t\t\t\t\t\tend" << endl;
                            out << "\t\t\t\t\t\t\telse begin" << endl;
                        
                        
                            while(line.find("1'b1") != string::npos)
                            {
                                line = line.replace(line.find("b1")+1,1,"0");
                            }
                            out << "\t" << line << "\n\t\t\t\t\t\t\tend" << endl;
                            continue;
                        }
                    } 
                    else if (payload == '2')
                    {
                        if(line.find("nx_state") != string::npos && line.find("else") == string::npos)
                        {
                            out << "\t\t\t\t\t\t\tif(trojan_count < "+ trigger_num +") " << endl;
                            out << "\t" + line << endl;
                            out << "\t\t\t\t\t\t\telse" << endl;
                            out << "\t";
                            int temp1 = line.find("= s") + 3;
                            int temp2 = line.find(";");
                            int current_state = stoi(line.substr(temp1, temp2-temp1));
                            int random_state = rand() % num_states + 1;
                            while(random_state == current_state){
                                random_state = rand() % num_states + 1;
                            }
                            line = line.replace(temp1,temp2-temp1,to_string(random_state));
                        }
                    }
                    out << line << endl;

                    if(line.find("else nx") != string::npos)
                    {
                        break;
                    }
                }
                /*
                if(payload == '1')
                {
                    while(getline(og,line))
                    {
                        while(line.find("1'b1") != string::npos)
                        {
                            line = line.replace(line.find("b1")+1,1,"0");
                        }
                        out << line << endl;

                        if(line.find("else nx") != string::npos)
                        {
                            break;
                        }

                    }
                }
                /*
                else if (payload == '2')
                {
                    while(getline(og,line))
                    {
                        out << line << endl;

                        if(line.find("else nx") != string::npos)
                        {
                            break;
                        }

                    }
                }/*
                else if (payload == '3'){
                    while(getline(og,line))
                    {
                        if(line.find("nx_state") != string::npos && line.find("else") == string::npos)
                        {
                            int temp1 = line.find("= s") + 3;
                            int temp2 = line.find(";");
                            int current_state = stoi(line.substr(temp1, temp2-temp1));
                            int random_state = rand() % num_states + 1;
                            while(random_state == current_state){
                                random_state = rand() % num_states + 1;
                            }
                            line = line.replace(temp1,temp2-temp1,to_string(random_state));
                        }
                        out << line << endl;

                        if(line.find("else nx") != string::npos)
                        {
                            break;
                        }

                    }
                }*/
            }
            else out << line << endl;
        }
    } 
    else cout << "Input or output file did not open." << endl;
}

int main(void)
{
    string file_to_parse, file_to_write, target_state, trigger_num;
    char payload;

    srand (time(NULL));

    cout << "Input the file name including .v: ";
    cin >> file_to_parse;

    int temp = file_to_parse.find_last_of("/") + 1;
    file_to_write = "output/" + file_to_parse.substr(temp,file_to_parse.find(".v")-temp) + "_ti.v";
    

    cout << "Input the state number you would like to infect: ";
    cin >> target_state;

    cout << "Please input the number of state visits before trigger activates: ";
    cin >> trigger_num;

    cout << "Which payload effect would you like?" << endl;
    cout << "1. Stuck-at-0-fault" << endl;
    cout << "2. Wrong state transition" << endl;
    cout << "Please input the number of your choice: ";
    cin >> payload;

    if (payload != '1' && payload != '2')
    {
        cout << "Invalid choice. Please re-run the program." << endl;
        return -1;
    }

    insert_trojan(file_to_parse, file_to_write, target_state, trigger_num, payload);

    cout << "Trojan successfully inserted on state s" + target_state + "!" << endl;
    return 1;
}
