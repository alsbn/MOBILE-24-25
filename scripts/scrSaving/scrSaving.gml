//global struct to store data across the game
global.game_data={
    
    room_data: {} //struct that contains all rooms'data
}


//function to save the game
function save_game(){
    
    save_room();
    
    //we convert the array of save data into a string
    var _string = json_stringify(global.game_data);
    
    //we create a buffer sized perfectly to fit our data
    var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
    
    //we write our save data onto the buffer
    buffer_write(_buffer, buffer_string, _string);
    
    //we save the buffer onto a txt file
    buffer_save(_buffer, "save.txt");
    
    //we delete the buffer
    buffer_delete(_buffer);
    
    
    /*less efficient saving system below:
     * 
     *we open/create the save file
    var _file = file_text_open_write("save.txt");
    
    //we write the save data in the file
    file_text_write_string(_file, _string);
    
    //we close the file
    file_text_close(_file);
     */
}

//function to save the data when exiting the room (same as when quitting game)
function save_room(){
    var _array=[];
    
    //to save the single instance of the player we create a struct
    var _playerStruct = {
        object: object_get_name(obj_player),
        x: x,
        y: y,
    }
    
    //we push the player struct into the array
    array_push(_array, _playerStruct);
    
    //to save all enemy instances
    with(obj_enemy_parent){
        var _struct = {
            object: object_get_name(obj_enemy_parent),
            x: x,
            y: y,
            hp: hp
        }
        
        array_push(_array, _struct);
    }
    
    //to save the data array into the room data associated to the room name
    struct_set( global.game_data.room_data, room_get_name(room), _array)
}

//function to load a game
function load_game(){
    
    //check if there is a save file
    if(file_exists("save.txt")){
        
        /*less efficient implementation
         *
        //we open the save file
        var _file = file_text_open_read("save.txt");
        
        //we read the save file
        var _json = file_text_read_string(_file);
        */
        
        //we load the buffer from the txt file
        var _buffer = buffer_load("save.txt");
        
        //we read the buffer
        var _json = buffer_read( _buffer, buffer_string);
        
        //we delete the buffer
        buffer_delete(_buffer);
        
        //we reform the array from the json text
        global.game_data = json_parse(_json);
        
        load_room();
        
        
        /* part of the less efficient implementation
        file_text_close(_file);
         */
    }
}

//function to load room's data
function load_room(){
    
    //we store the room's data in the variable _array
    var _array = struct_get(global.game_data.room_data, room_get_name(room));
    
    //if we found room data then array is not undefined
    if(_array!=undefined){
        
        //we destroy the instances that are automatically created at the start of the game
        instance_destroy(obj_player);
        instance_destroy(obj_enemy_parent);
        
        //we iterate through the array and load the data
        for(var i=0; i<array_length(_array); i+=1){
            var _struct = _array[i];
            instance_create_layer(_struct.x, _struct.y, "Instances", asset_get_index(_struct.object), _struct);
        }
    }
}