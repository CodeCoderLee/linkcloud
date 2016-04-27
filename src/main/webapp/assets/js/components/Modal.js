import React from 'react';
import $ from 'jquery';
import ReactDOMServer from 'react-dom/server';
import ReactDOM from 'react-dom';
const Modal = React.createClass({
  propTypes: {
  },
  getInitialState: function() {
    return {
      bccname: '',
      description: '',
    };
  },
  _addItem: function() {
    let bccname = this.state.bccname;
    let description = this.state.description;
    let randomId = parseInt(100*Math.random(),10).toString();
    let obj = [randomId, bccname, description];
    this.props.addNewItem(obj);
    this.refs.bccModal.style.display = 'none';
    this.props.addData();
  },
  _changeHandler: function(name,event) {
    let newState = {};
    newState[name] = event.target.value;
    this.setState(newState);
    console.log('changeHandler');
  },
  render: function() {
    let isShow = (this.props.isShow ? 'block' : 'none');
    return (
      <div className="bcc-modal" style={{display: isShow}} ref="bccModal">
        <i className="am-icon-close bcc-close" onClick={this.props.addData}></i>
        <input className="am-form-field am-input-lg" type="text" name="bccname" defaultValue="名称" value={this.state.bccname} onChange={this._changeHandler.bind(this,'bccname')}/>
        <input className="am-form-field" type="text" defaultValue="描述" name="description" value= {this.state.description} onChange={this._changeHandler.bind(this,'description')}/>
        <input className="am-form-field am-input-sm" type="button" defaultValue="提交" onClick={this._addItem}/>
      </div>
    );
  }
});
export default Modal;
