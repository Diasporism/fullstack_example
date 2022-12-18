import { Controller } from '@hotwired/stimulus'
import React from 'react'
import { createRoot } from 'react-dom/client'
import IndexComponent from '../components/books/index_component.jsx'
import ShowComponent from '../components/books/show_component.jsx'
import EditComponent from '../components/books/edit_component.jsx'

class BooksController extends Controller {
  static values = {
    action: String
  }

  connect () {
    const root = createRoot(document.getElementById('books'))

    switch (this.actionValue) {
      case 'index':
        root.render(<IndexComponent />)
        return
      case 'show':
        root.render(<ShowComponent />)
        return
      case 'edit':
        root.render(<EditComponent />)
        return
      default:
        return
    }
  }
}

export default BooksController
