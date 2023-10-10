// API_URL comes from the .env.development file

import React, { useState, useEffect } from 'react';
import { API_URL } from "../../constants";


function IdeasList() {
  const [ideas, setIdeas] = useState([]);
  const [, setLoading] = useState(true);
  const [, setError] = useState(null);
  // fetch ideas from the API

  useEffect(() => {
    async function loadIdeas() {
      try {
        const response = await fetch(API_URL);
        if(response.ok){
          const json = await response.json();
          setIdeas(json)
        } else {
          throw response;
        }
      } catch (e) {
        setError("An error occured, damn...");
        console.log("An error occured: ", e);
      } finally {
        setLoading(false);
      }
    }
    loadIdeas();
  }, []);

  return (
    <div>
      {ideas.map((idea) => (
        <div key={idea.id} className="idea-container">
          <h2>{idea.idea}</h2>
          <p>{idea.description}</p>
        </div>
      ))}
    </div>
  );
}





export default IdeasList;