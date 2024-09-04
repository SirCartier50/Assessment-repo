import { NextResponse } from "next/server";

//server side GET route to fetch from json database
export async function GET(req) {

    const res = await fetch('http://localhost:8000/user')
    const data = await res.json()
    console.log(data)
    return NextResponse.json(data)

}