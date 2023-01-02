#include <iostream>
#include <vector>
// #include <mapColors.h>

using namespace std;

bool colorisValid(char color, int node, vector<vector<int>> graph, vector<char>& nodeColors);
bool tryAddingColor(int node, vector<vector<int>> graph, vector<char>& nodeColors, vector<char> colors);
bool solve(int start_node, vector<vector<int>> graph, vector<char>& nodeColors, vector<char> colors);


bool colorisValid(char color, int node, vector<vector<int>> graph, vector<char>& nodeColors)
{
    for (auto ele: graph[node]) {
        // Iterate over all connected nodes and check if there is a constraint violation
        if (nodeColors[ele] == color) {
            // colors match, constraint violated
            return false;
        }
    }

    // No constraints violated, return true
    return true;
}

bool tryAddingColor(int node, vector<vector<int>> graph, vector<char>& nodeColors, vector<char> colors) 
{
    for (int col_idx = 0; col_idx < colors.size(); col_idx++) {
        // Iterate over all colors for assignment. Also check if constraints are violated
        char color = colors[col_idx];
        if (colorisValid(color, node, graph, nodeColors)) {
            nodeColors[node] = color;
            bool success = solve(node + 1, graph, nodeColors, colors);
            if (success) return success;

            nodeColors[node] = 'N';
        }
    }

    // If problem was not solved by any assignments, reset
    nodeColors[node] = 'N';
    return false;
}

bool solve(int start_node, vector<vector<int>> graph, vector<char>& nodeColors, vector<char> colors)
{
    if (start_node == graph.size()) {
        // Completed
        return true;
    }

    else if (nodeColors[start_node] == 'N') {
        // No color assigned yet. Try adding color here
        return tryAddingColor(start_node, graph, nodeColors, colors);
    }

    // If color already assigned, go to the next node
    return solve(start_node + 1, graph, nodeColors, colors);
}


int main() 
{
    vector<vector<int>> graph { {1, 2, 3, 4, 6, 7}, {0, 5}, {0, 4, 8}, {0, 7},
     {0, 2}, {1, 6}, {0, 5, 7}, {0, 3, 6, 8}, {2, 7} };
    vector<char> colors { 'R', 'G', 'B' };

    vector<char> nodeColors(graph.size());

    for (int i = 0; i < graph.size(); i++) {
        nodeColors[i] = 'N';
    }

    bool solved = solve(0, graph, nodeColors, colors);
    if (solved == true) {
        for (int i = 0; i < nodeColors.size(); i++) {
            cout << "Node " << i << ": " << nodeColors[i] << endl;
        }
    }
    else {
        cout << "No Solution" << endl;
    }

    return 0;
}