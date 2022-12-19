import { Controller } from '@hotwired/stimulus'
import React from 'react'
import { createRoot } from 'react-dom/client'
import IndexComponent from '../components/books/index_component.jsx'
import EditComponent from '../components/books/edit_component.jsx'

class BooksController extends Controller {
  static values = {
    action: String,
    books: Array,
    book: Object
  }

  connect () {
    const root = createRoot(document.getElementById('books'))

    switch (this.actionValue) {
      case 'index':
        return root.render(<IndexComponent books={ this.booksValue } />)
      case 'edit':
        return root.render(<EditComponent book={ this.bookValue } />)
      default:
    }
  }
}

export default BooksController
