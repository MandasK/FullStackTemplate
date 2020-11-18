import React from 'react';
import {Helmet} from "react-helmet";



export default function Home() {
    return (
        <div>
            <Helmet>
                <title>Welcome to App</title>
                <meta name="description" content="Nested component" />
            </Helmet>
            <h1>Hello there</h1>
        </div>
    );
}