const books = [
  {name: "Hitchhiker's Guide to the Galaxy"},
  {name: "1984"},
  {name: "Dune"},
  {name: "Fahrenheit 451"}
];
const headers = ["Book", "Author", "Language", "Published", "Sales"];
const tableData = [
["The Lord of the Rings", "J. R. R. Tolkien","English", "1954", "150 million"],
["Le Petit Prince (The Little Prince)", "Antoine de Saint-Exupéry","French", "1943", "140 million"],
["Harry Potter and the Philosopher's Stone", "J. K. Rowling","English", "1997", "107 million"],
["And Then There Were None", "Agatha Christie","English", "1939", "100 million"],
["Dream of the Red Chamber", "Cao Xueqin","Chinese", "1754", "100 million"],
["The Hobbit", "J. R. R. Tolkien","English", "1937", "100 million"],
["She: A History of Adventure", "H. Rider Haggard","English", "1887", "100 million"]
];
import React from 'react';
import ReactDOM from 'react-dom';
// import { Router, Route, Link, browserHistory } from 'react-router'
// import LearnCom from './components/learnCom';
import Table from './components/Table';
ReactDOM.render(<Table url="/role/findByPage.shtml" initData={tableData} headers={headers}/>,document.getElementById('root'));
