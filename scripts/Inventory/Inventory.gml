//script for any kind of inventory, constructor->we use struct for the invenotory
function Inventory() constructor {
    
    //array invetory
    _inventory_items=[];
    
    //function to create an item struct and add it to the array
    item_set = function(_name, _quantity, _sprite){
        array_push(_inventory_items, {
            name: _name,
            quantity: _quantity,
            sprite: _sprite,
        })
    }
    
    //function to find an item in the array (inventory)
    item_find = function(_name){
        for(var i=0; i<array_length(_inventory_items); i++){
            if(_name==_inventory_items[i].name){
                return i;
            }
        }
        
        return -1; //item not found
    }
    
    item_add = function(_name, _quantity, _sprite){
        
        //variable contains if item has been found or not
        var index = item_find(_name);
        
        //if item is already in the array, we increase its quantity
        if(index>=0){
            _inventory_items[index].quantity += _quantity;
        }
        //if item is not already in the array we need to turn it into a struct and add it
        else {
        	item_set(_name, _quantity, _sprite);
        }
    }
    
    //check if inventory has at least a certain quantity of an item
    item_has = function(_name, _quantity){
        var index = item_find(_name);
        
        if(index>=0){
            return _inventory_items[index].quantity >= _quantity;
        }
        
        return false;
    }
    
    //function to subtract a certain quantity of an item
    item_subtract = function(_name, _quantity){
        var index = item_find(_name);
        
        if(index>=0){
            if(item_has(_name, _quantity)){
                _inventory_items[index].quantity -= _quantity;
                
                if(_inventory_items[index].quantity<=0){
                    item_remove(index);
                }
            }
        }
    }
    
    //function that removes an item from the array completely and shifts it
    item_remove = function(_index){
        array_delete(_inventory_items, _index, 1);
    }
    
    item_get = function() {
		return _inventory_items;
	}
    
    //function to print out invtory's contents as a json string
    toString = function(){
        return json_stringify(_inventory_items);
    }
}