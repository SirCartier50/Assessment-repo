
'use client'
import { useRouter } from "next/navigation"
import { Button, Container, Stack, Typography } from "@mui/material";
import Image from "next/image";
import { useState } from "react";

export default function Users() {

  //setup data array and router
  const [data, setData] = useState([])
  const router = useRouter()

  //fetch api endpoint to get data
  const grabResponse = async() => {
    await fetch('api/info', {
      method: "GET"
    }).then(res => res.json()).then(data => {
      console.log(data[0].id)
      setData(data)})
  }

  //display users list
  return (
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
          padding: 2,
          gap: 2,
        }}
      >
        <Button variant="contained" onClick={grabResponse} sx={{mb:2 }}>Get Users from Json Server</Button>
        <Typography variant="h4" sx={{mb:2}}>Users List</Typography>
        {data && (
          data.map(entry => (
            <Stack direction="row" spacing={10}>
              <Typography>{entry["id"]}</Typography>
              <Typography>{entry["name"]}</Typography>
              <Typography>{entry["access"]}</Typography>
            </Stack>
          ))
        )}
      </Container>
    </Container>
  );
}
