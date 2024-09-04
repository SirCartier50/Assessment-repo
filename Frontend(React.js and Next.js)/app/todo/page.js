'use client'

import { Button, Container } from "@mui/material"
import Todo from "./todo_component"
import { useRouter } from "next/navigation"

export default function todo(){
    //setup router
    const router = useRouter()

    //display custom react component todo list
    return(
        <Container>
            <Button variant="contained" onClick={()=>{router.push('/')}} sx={{mb:2, mt:2 }}>Back</Button>
            <Todo></Todo>
        </Container>
    )
}