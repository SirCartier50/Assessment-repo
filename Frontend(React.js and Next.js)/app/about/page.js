'use client'
import { useRouter } from "next/navigation"
import { Button, Container, Stack, Typography } from "@mui/material";
import Image from "next/image";

export default function About(){
    //setup router
    const router = useRouter()

    //display about page
    return(
        <Container>
            <Button variant="contained" onClick={()=>{router.push('/')}} sx={{mb:2, mt:2 }}>Back</Button>
            <Container
                sx={{
                display: 'flex',
                flexDirection: 'column',
                alignItems: 'center',
                justifyContent: 'flex-start',
                minHeight: '100vh',
                textAlign: 'center',
                gap: 2,
                padding: 6,
                }}
            >
                <Typography variant="h4">About Us</Typography>
                <Typography variant="h6">This webpage is a test site that tests Next.js navigation and custom compnents</Typography>
            </Container>
        </Container>
    )
}
