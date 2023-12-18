#include <iostream>
#include <filesystem>
#include <fstream>
#include <string>

using namespace std;

//linked list struct
typedef struct node
{
    string data;
    node* next;
}node;

//linked list create node
node *create(string val)
{
    node *ptr = new node;
    ptr->data = val;
    ptr->next = NULL;
    return ptr;
}

//linked list append value to end of list
node *append(node *head, string val)
{
    node *ptr1 = new node;
    ptr1 = head;

    while(ptr1->next != NULL)
    {
        ptr1 = ptr1->next;
    }
    node *ptr2 = new node;
    ptr2->data = val;
    ptr2->next = NULL;

    ptr1->next = ptr2;

    return head;
}

//duplicates a chosen state and outputs to new file
void dupe_state(string in_file, string out_file, string target)
{
    string line;
    ifstream og(in_file.c_str());
    ofstream out(out_file.c_str());


    node *dupe_list_head = new node;
    string holder;
    int key_num = 0;

    if(og.is_open() && out.is_open())
    {
        while(getline(og,line))
        {
            if(line.find("nx_state = s"+target) != string::npos)
            {
                out << "\t\t\t\t\t\t\tif( keyinput"+to_string(key_num)+" ) nx_state = s"+target+";" << endl;
                out << "\t\t\t\t\t\t\telse nx_state = s"+target+"_d;"<<endl;
                continue;
            }
            else if(line.find("\tx") != string::npos && line[line.length()-1] == ' ')
            {
                if(line.find(", keyinput") != string::npos)
                {
                    key_num = stoi(line.substr(line.find_last_of(",")-1,1))+1;
                }
                line = line + "keyinput" + to_string(key_num) + ", ";
            }
            else if(line.find("input clk") != string::npos)
            {   
                while(line.find(";") == string::npos)
                {
                    out << line << endl;
                    getline(og,line);
                }
                line = line.insert(line.find(";"),", keyinput"+to_string(key_num));
            }
            else if(line.find("parameter") != string::npos)
            {
                int temp1 = line.find(";");
                int temp2 = line.find_last_of("=");
                line = line.insert(temp1,", s"+target+"_d="+to_string(stoi(line.substr(temp2+1,temp1-temp2-1))+1));
            }
            else if(line.find("pr_state or") != string::npos)
            {
                while(line.find(")") == string::npos)
                {
                    out << line << endl;
                    getline(og,line);
                }
                line = line.insert(line.find(")"), " or keyinput"+to_string(key_num));
            }
            else if(line.find("s" + target + " :") != string::npos)
            { //state to dupe found
                out << line << endl;
                dupe_list_head = create(line.insert(line.find(" :"),"_d"));

                while(getline(og,line))
                {
                    if(line.find(" :") != string::npos || line.length() == 0)
                    {
                        holder = line;
                        break; //exit at end of state definition
                    }

                    out << line << endl; //outputs lines to outfile

                    if(line.find("else nx") != string::npos)
                    {
                        dupe_list_head = append(dupe_list_head, "\t\t\t\t\telse nx_state = s" + target + "_d;");
                        continue;
                    }

                    dupe_list_head = append(dupe_list_head, line); //save lines in linked list
                }
                
                node *ptr = dupe_list_head;
                while(ptr != NULL)
                {
                    out << ptr->data << endl;
                    ptr = ptr->next;
                }

                out << holder << endl;
                continue;
            }
            out << line << endl;
        }
    } 
    else cout << "Input or output file did not open." << endl;
}

//main function
int main(void){
    //input filename
    string file_to_parse, file_to_write, target_state;

    cout << "Input the file name including .v: ";
    cin >> file_to_parse;

    int temp = file_to_parse.find_last_of("/") + 1;
    file_to_write = "output/" + file_to_parse.substr(temp,file_to_parse.find(".v")-temp) + "_dupe.v";
    

    cout << "Input the state number you would like to duplicate: ";
    cin >> target_state;

    //duplicates target state, adds key-controlled transitions to dupe state
    dupe_state(file_to_parse,file_to_write,target_state);

    //success!
    cout << "New state s" + target_state + "_d created!" << endl;

    return 1;
}