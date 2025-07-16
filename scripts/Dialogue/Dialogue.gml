//scripts are useful to define global functions or variables
function create_dialog(_messages){
    
    //check if obj.dialog already exists
    if(instance_exists(obj_dialog)) return;
        
    //we create obj.dialogue and save it in a variable
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
}

//colors associated with strings (characters' names)
char_colors = {
    "Congrats!": c_yellow,
    "Cross": c_yellow,
    "Player": c_aqua,
    "Cam": c_orange
}

room1_end = [
{
    name: "Cross",
    msg: "You have reached the end! Easy right?"
},
{
    name: "Cross",
    msg: "Thanks for playing!"
},
{
    name: "Cross",
    msg: "Feel free to have fun in the next room."
},
{
    name: "Cross",
    msg: "I'll keep a hold of your inventory to make it more challenging."
},
]

cross_diag1 = [
{
    name: "Cross",
    msg: "Welcome to the dungeon, newbie!"
},
{
    name: "Player",
    msg: "Thank you?"
},
{
    name: "Cross",
    msg: "Well, it's hardly a dungeon."
},
{
    name: "Player",
    msg: "A dungeon?"
},
{
    name: "Cross",
    msg: "It's pretty much a cave inhabited by a few weaklings."
},
{
    name: "Player",
    msg: "I see..."
},
]

cam_diag1 = [
{
    name: "Cam",
    msg: "No amount of money could ever make me go in there."
},
{
    name: "Cam",
    msg: "You go first!"
},
]