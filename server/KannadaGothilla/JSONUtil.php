<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of JSONUtil
 *
 * @author suhas
 */
class JSONUtil {
   private $assocArray = null;
   
   function __construct() {
       $this->assocArray = array();
   }
   
    function __destruct() {
        $this->assocArray = null;
    }
    
    function addArray($arr){
        foreach($arr as $key => $value) {
            $this->assocArray[$key] = $value;
        }
        
    }
    
    function addKeyValue($key, $value){
       $this->assocArray[$key] = $value;
    }
    
    function addDBResult($key, $arr){
        $this->assocArray[$key] = $arr;
    }
    
    function getJSON(){
        return json_encode($this->assocArray);
    }
  
}
