import React from "react";

function IndexComponent (props) {
  const { books } = props

  const renderBooks = () => {
    return books.map((book, index) => {
      return (
        <tr key={ index }>
          <td>{ book.title }</td>
          <td>{ book.genre }</td>
          <td>{ book.author }</td>
          <td>
            <a href={ `/books/${book.id}/edit` }>Edit</a>
          </td>
        </tr>
      )
    })
  }

  return (
    <table className="book-list">
      <thead>
        <tr>
          <th>Title</th>
          <th>Genre</th>
          <th>Author</th>
        </tr>
      </thead>
      <tbody>
        { renderBooks() }
      </tbody>
    </table>
  )
}

export default IndexComponent
