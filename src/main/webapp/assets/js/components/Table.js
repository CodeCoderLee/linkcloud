import React from 'react';
import $ from 'jquery';
import Modal from './Modal';
import ReactDOMServer from 'react-dom/server';
const Pagination = require('rc-pagination');
const Table = React.createClass({
  propTypes: {
    headers: React.PropTypes.arrayOf(
      React.PropTypes.string),
    initData: React.PropTypes.arrayOf(
      React.PropTypes.arrayOf(
        React.PropTypes.string
        )
      )
  },
  _preSearchData: null,
  _log: [],
  getInitialState: function() {
    return {
      data: [],
      tempData: [],
      sortBy: null,
      descending: false,
      search: false,
      edit: null,
      headers: [],
      headersEN: [],
      pageSize: 5,
      currtPage: 1,
      selectAll: false,
      showModal: false,
      doDel: {
        deleteIds: [],
        isDelete: false
      }
    };
  },
  _selectPage: function(event) {
    let self = this;
    let nextPage = this.state.currtPage + 1;
    let prevPage = this.state.currtPage - 1;
    let max = self.state.tempData.length;
    console.log(event.target.textContent);
    if (event.target.textContent === '»') {
      this.setState({
        currtPage:  nextPage*5 >=max ? max/5 : nextPage
      });
      setTimeout(function() {
        let pagePos = self.state.currtPage;
        let data = self.state.tempData.slice(5*(pagePos-1),5*pagePos);
        self.setState({
          data: data
        });
      },0);
    } else if (event.target.textContent === '«') {
      this.setState({
        currtPage:  prevPage*5 <=5 ? 1 : prevPage
      });
      setTimeout(function() {
        let pagePos = self.state.currtPage;
        let data = self.state.tempData.slice(5*(pagePos-1),5*pagePos);
        self.setState({
          data: data
        });
      },0);
    } else {
      let num = Number(event.target.textContent);
      let pagePos = this.state.currtPage;
      let data = this.state.tempData.slice(5*(pagePos-1),5*pagePos);
      this.setState({
        currtPage: num,
        data: data
      });
    }
  },
  _renderPagination: function() {
    let max = this.state.tempData.length;
    return (
      <div>
        <ul className="am-pagination am-pagination-centered bcc-pagination" onClick={this._selectPage}>
          <li>&laquo;</li>
          {this.state.tempData.map(function(ignore,idx) {
            if (idx % 5 === 0) {
              return (<li key={idx}>{idx / 5 + 1}</li>);
            }
          })}
          <li>&raquo;
          </li>
        </ul>
      </div>
    );
  },
  _regEscHandler: function() {
    let self = this;
    document.onkeydown = function(event) {
      if (event.keyCode === 27) {
        self.setState({
          edit: null
        });
      }
    }
  },
  _replay: function() {
    let self = this;
    let idx= -1;
    if (self._log.length === 0) {
      console.warn('please begin play and store state');
      return;
    }
    let cancelId = setInterval(function() {
      idx++;
      if (idx === self._log.length -1) {
        clearInterval(cancelId);
      }
      self.setState(self._log[idx]);
    },1000);
  },
  _logSetState: function(newState) {
    if (this._log.length === 0) {
      this._log.push(JSON.parse(JSON.stringify(this.state)));
    }
    this._log.push(JSON.parse(JSON.stringify(newState)));
    this.setState(newState);
  },
  _search: function(event) {
    let needle = event.target.value.toLowerCase();
    console.log(needle);
    if (!needle) {
      this._logSetState({
        data: this._preSearchData
      });
      return;
    }
    let idx = event.target.dataset.idx;
    console.log(idx);
    let searchData = this.state.tempData.filter(function(row) {
      return row[idx].toLowerCase().indexOf(needle) > -1;
    });
    this. _logSetState({
      tempData: searchData
    });
  },
  _sort: function(event) {
    let column = event.target.cellIndex;
    let pagePos = this.state.currtPage;
    let data = this.state.tempData.slice(0);
    let descending = this.state.sortBy === column && !this.state.descending;
    data.sort(function(a,b) {
      return descending ? ( a[column] < b[column]) : (a[column] > b[column]);
    });
    data = data.slice(5*(pagePos-1), 5*pagePos);
    this._logSetState({
      tempData: data,
      sortBy: column,
      descending: descending,
      logInfo: event.target.cellIndex
    });
  },
  _toggleSearch: function() {
    if (this.state.search) {
      this._logSetState({
        data: this._preSearchData,
        search: false
      });
      this._preSearchData = null;
    } else {
      this._preSearchData = this.state.data;
      this._logSetState({
        search: true
      });
    }
  },
  _renderSearch: function() {
    let headers = this.state.headers;
    let headersCnt = [];
    if (!this.state.search) {
      return null;
    }
    return (
      <tr onChange={this._search}>
      <td><span className="am-badge am-radius">搜索</span></td>
      {this.state.headers.map(function(ignore,idx) {
        if (idx === 0) {
          return;
        }
        return (
          <td key={idx}>
          <input type="text" data-idx={idx}/>
          </td>
        );
      })}
      </tr>
    );
  },
  _download: function(formate,ev) {
    let contents = null;
    formate === 'json' ? contents = JSON.stringify(this.state.tempData) : contents = this.state.tempData.reduce(function(result,row) {
      return result
      + row.reduce(function(rowresult,cell,idx) {
        return rowresult
        + '"'
        + cell.replace(/"/g,'""')
        + '"'
        + (idx< row.length -1 ? ',': '')
      },'')
      +"\n";
    },'');
    let URL = window.URL || window.webkitURL;
    let blob = new Blob([contents],{type: 'text/' + formate});
    ev.target.href = URL.createObjectURL(blob);
    ev.target.download = 'data.' + formate;
  },
  componentWillMount: function() {
    let self = this;
    var arr = [];
    var tempArr = [];
    var data = null;
    $.getJSON(this.props.url,function(json) {
      self.setState({
        headers: json['headers'],
        headersEN: json['headersEN']
      });
      json['rows'].map(function(rowsCnt,idx) {
        console.log(rowsCnt);
        let max = self.state.headersEN.length;
        for (let i = 0; i<max;i++) {
          tempArr.push(rowsCnt[json['headersEN'][i]]);
        }
      arr.push(tempArr);
      tempArr = [];
      });
      console.log(arr);
      let pagePos = self .state.currtPage;
      let data = arr.slice(self.state.pageSize*(pagePos-1),self.state.pageSize*pagePos);
      self.setState({
        tempData: arr,
        data: data
      });
    });
  },
  _deleteHandler: function() {
    let self = this;
    let oDodel = this.state.doDel;
    let data = this.state.data;
    let tempData = this.state.tempData;
    oDodel.deleteIds.map(function(did,idx) {
      data.splice(did,1);
      tempData.splice(did,1);
    });
    this.setState({
      doDel: {
        deleteIds: oDodel.deleteIds,
        isDelete: true
      },
      tempData: tempData
    });
    setTimeout(function() {
      let pagePos = self.state.currtPage;
      let idata = self.state.tempData.slice(self.state.pageSize*(pagePos-1),self.state.pageSize*pagePos);
      self.setState({
        data: idata
      });
    }, 0);
  },
  addData: function() {
    let self = this;
    this.setState({
      showModal: !this.state.showModal
    });
  },
  addNewItem: function(item) {
    let data = this.state.data;
    let tempData = this.state.tempData;
    data.push(item);
    tempData.push(item);
    this.setState({
      data: data,
      tempData: tempData
    });
    console.log('addNewItem');
  },
  _renderToolBar: function() {
    return (
      <div className="imcoTable-toolbar">
        <button type="button" className="am-btn am-btn-default" onClick={this._toggleSearch}>搜索</button>
        <button type="button" className="am-btn am-btn-success" onClick={this._changeData}>datasource</button>
        <button type="button" className="am-btn am-btn-primary" onClick={this.addData}>新增</button>
        <button type="button" className="am-btn am-btn-danger" onClick={this._deleteHandler}>删除</button>
        <a className="am-btn am-btn-secondary" onClick={this._download.bind(this,'json')}>Export Json</a>
        <a className="am-btn am-btn-secondary" onClick={this._download.bind(this,'csv')}>Export Csv</a>
      </div>
      );
  },
  _selectAll: function(event) {
    let self = this;
    this.setState({
      selectAll: !this.state.selectAll
    });
    setTimeout(function() {
      console.log(self.state.selectAll);
    },0)
  },
  _renderHeader: function() {
    let self = this;
    return (
      /* comments
         output table header
         by ihtml5
         email: szmtjs_062408120@qq.com
      */
      <thead onClick={this._sort}>
        <tr>
        <th>
        <form >
          <input type="checkbox" onChange={this._selectAll}/>
        </form>
        </th>
        {this.state.headers.map(function(header,colIdx) {
          if (colIdx=== 0) {
            return;
          }
          if (self.state.sortBy === colIdx) {
            header += (self.state.descending ? '\u2191' : '\u2193');
          }
          return (
            <th key={colIdx}>{header}</th>
          );})}
        </tr>
        {this._renderSearch()}
      </thead>
    );
  },
  _showEditor: function(event) {
    let self = this;
    this._logSetState({
      edit: {
        row: parseInt(event.target.dataset.row, 10),
        col: event.target.cellIndex,
        cnt: event.target.innerHTML
      }
    });
  },
  _save: function(event) {
    event.preventDefault();
    let input = event.target.firstChild;
    let data = this.state.data.slice(0);
    data[this.state.edit.row][this.state.edit.col] = input.value;
    this._logSetState({
      edit: null,
      data: data
    });
  },
  _recordDeleteId: function(event) {
    let self = this;
    let id = event.target.dataset.row;
    this.state.doDel.deleteIds.push(id);
    setTimeout(function() {
      console.log(self.state.doDel);
    },0);
  },
  _renderBody: function() {
    /*
      comments
      output table body
      by ihtml5
      email: szmtjs_062408120@qq.com
      if ((self.state.doDel.deleteIds.indexOf(idx.toString())> -1) && self.state.doDel.isDelete) {
        return;
      }
    */
   let self = this;
   let pagePos = self.state.currtPage;
   let data = self.state.tempData.slice(self.state.pageSize*(pagePos-1),self.state.pageSize*pagePos);
    return (
      <tbody onDoubleClick={self._showEditor}>
        { data.map(function(rowData,idx) {
          return (<tr key={idx}>
            <td><form>
            {self.state.selectAll ? <input data-row={idx} type="checkbox" checked/> : <input type="checkbox" data-row={idx} onChange={self._recordDeleteId}/>}
            </form></td>
            {rowData.map(function(data,iidx) {
              if (iidx === 0) {
                return;
              }
              if (self.state.edit && self.state.edit.row === idx && self.state.edit.col === iidx) {
                return (
                  <td key={iidx} data-row={idx}>
                  <form onSubmit={self._save}>
                    <input type="text" defaultValue={self.state.edit.cnt}/>
                  </form>
                  </td>);
              } else {
                return (<td key={iidx} data-row={idx}>{data === '' ? '暂未填写': data}</td>);
              }
            })}
          </tr>);
         })}
      </tbody>
    );
  },
  _renderLoading: function(params) {
    return (
      <div>
          Application {params ? params : 'state'}:   <span className="am-badge am-badge-success"> {this.state.edit.row ? 'no' : this.state.edit.row}</span>
      </div>
    );
  },
  _changeData: function() {
    let self = this;
    var arr = [];
    var tempArr = [];
    var data = null;
    $.getJSON(this.props.url,function(json) {
      self.setState({
        headers: json['headers'],
        headersEN: json['headersEN']
      });
      json['rows'].map(function(rowsCnt,idx) {
        for (let i in rowsCnt) {
          tempArr.push(rowsCnt[i]);
      }
      arr.push(tempArr);
      tempArr = [];
      });
      console.log(arr);
      let pagePos = self .state.currtPage;
      let data = arr.slice(self.state.pageSize*(pagePos-1),self.state.pageSize*pagePos);
      self.setState({
        tempData: arr,
        data: data
      });
    });
  },
  componentDidMount: function() {
    let self = this;
    this._regEscHandler();
    document.onkeydown = function(e) {
      if (e.altKey && e.shiftKey && e.which === 82) { // ALT+SHIFT+R(eplay)
        self._replay();
        console.log(self._log);
      } else if (event.keyCode === 27) {
        self.setState({
          edit: null
        });
      }
    };
    console.log('componentDidMount');
    console.log(React.PropTypes);
  },
  onChange: function(page) {
    let self = this;
    this.setState({
      currtPage: page
    });
    setTimeout(function(){
      let pagePos = self.state.currtPage;
      let data = self.state.tempData.slice(self.state.pageSize*(pagePos-1),self.state.pageSize*pagePos);
      self.setState({
        data: data
      });
    },0);
  },
  render: function() {
    return (
      <div>
        {this._renderToolBar()}
        <table className="imcoTable">
          {this._renderHeader()}
          {this._renderBody()}
        </table>
        <Pagination showSizeChanger defaultCurrent={1} pageSize={this.state.pageSize} onChange={this.onChange} current={this.state.currtPage} total={this.state.tempData.length} />
        <Modal isShow={this.state.showModal} addData={this.addData} addNewItem ={this.addNewItem}/>
      </div>
    );
  }
});
export default Table;
