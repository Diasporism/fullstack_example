import React, { useState } from "react";

function EditComponent (props) {
  const { book } = props

  const [title, setTitle] = useState(book.title)
  const [genre, setGenre] = useState(book.genre)
  const [author, setAuthor] = useState(book.author)

  const submit = (e) => {
    e.preventDefault()
    const headers = new Headers([['Content-Type', 'application/json']]);
    const body = JSON.stringify({ data: { title, genre, author } })
    const method = "PUT"
    fetch(`/api/v1/books/${book.id}`, { method, headers, body }).then(_res => {
      window.location.replace('/books')
    })
  }

  return (
    <form onSubmit={ (e) => { submit(e) } }>
      <label>Title: </label>
      <input type="text" name="name" required value={ title } onChange={ (e) => setTitle(e.target.value) } />
      <label>Genre: </label>
      <input type="text" name="genre" required value={ genre } onChange={ (e) => setGenre(e.target.value) } />
      <label>Author: </label>
      <input type="text" name="author" required value={ author } onChange={ (e) => setAuthor(e.target.value) } />
      <input type="submit" value="Submit" />
    </form>
  )
}

export default EditComponent
