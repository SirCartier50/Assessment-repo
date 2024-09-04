'use client'
import { Button, Container, Stack, Typography } from "@mui/material";
import Image from "next/image";
import { useRouter } from "next/navigation";
import { useState } from "react";

export default function Home() {
  //setup router
  const router= useRouter()

  //display Homepage
  return (
    <Container
    sx={{
      display: 'flex',
      flexDirection: 'column',
      alignItems: 'center',
      justifyContent: 'center',
      minHeight: '100vh',
      textAlign: 'center',
      gap: 2,
    }}>
      <Typography variant="h2">Hello and Welcome to homepage</Typography> 
      <Typography variant="h6">Here you have links to our users list, todo list tool, and the about page!</Typography>
      <Stack direction="row" spacing={10}>
        <Button variant="contained" onClick={()=>{router.push('/users')}}>Users</Button>
        <Button variant="contained" onClick={()=>{router.push('/todo')}}>Todo List Tool</Button>
        <Button variant="contained" onClick={()=>{router.push('/about')}}>About</Button>
      </Stack>
    </Container>
  );
}
