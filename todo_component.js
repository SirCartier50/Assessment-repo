import { Container, TextField, Button, Box, Stack, Typography, FormGroup, FormControlLabel, Checkbox } from "@mui/material";
import { useState } from "react";


function Todo(){
    //create use states for the todo list and items
    const[item, setItem] = useState('')
    const[list, setList] = useState([])

    //function for adding items into the todo list array
    const addItemToList = () => {
        if (item != []) {
            setList([...list, item]);
            setItem('');
        }
    };

    //display the todo list
    return(
            <Box 
                width="100vw" 
                height="100vh" 
                display = "flex" 
                alignItems="center"
                flexDirection = "column"
                gap={2}
                mt={8}
            >
                <Typography variant="h3">Todo List</Typography>
                <Stack direction="row" spacing={2}>
                    <TextField value={item} label="Add Item" onChange={(e)=>setItem(e.target.value)}/>
                    <Button variant="contained" onClick={addItemToList}>Add</Button>
                </Stack>
                
                <Stack direction="column">
                    {list.map((entry)=> (
                        <FormGroup>
                            <FormControlLabel control={<Checkbox />} label= {entry} />
                        </FormGroup>
                    ))}
                </Stack>
            </Box>
    )
};

export default Todo;
