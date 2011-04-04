/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package teg_fx;

import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.Group;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;
import javafx.scene.control.ListView;
import javafx.scene.control.Button;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.control.TextBox;


/**
 * @author Emmanuel
 */

public class MenuPaises extends CustomNode{
    var lista: ListView;

    override function create():Node {
        return Group {
        content:[
             VBox{
                spacing: 20
                content:[
                    HBox {
                        width: 200
                        height: 100
                        layoutY: 1
                        spacing: 10
                        content: [
                                TextBox {
                                    text: "Probando, probando! 1, 2 3"
                                    columns: 12
                                    selectOnFocus: true
                                }
                        ]
                    },
                   HBox{ spacing: 10

                         content: {
                            lista = ListView {
                                vertical: false
                                width: 100
                                height: 10
                                items: [
                                    Button {
                                        text:"Mover Fichas"
                                        action: function(){
                                        }
                                    },
                                    Button {
                                        text:"Calcular"
                                        action: function(){
                                        }
                                    }
                                    Button {
                                        text:"1"
                                        action: function(){
                                        }
                                    },
                                    Button {
                                        text:"2"
                                        action: function(){
                                        }
                                    }
                                    Button {
                                        text:"3"
                                        action: function(){
                                        }
                                    },
                                    Button {
                                        text:"4"
                                        action: function(){
                                        }
                                    }
                                    Button {
                                        text:"5"
                                        action: function(){
                                        }
                                    },
                                    Button {
                                        text:"6"
                                        action: function(){
                                        }
                                    }
                                    Button {
                                        text:"7"
                                        action: function(){
                                        }
                                    },
                                    Button {
                                        text:"8"
                                        action: function(){
                                        }
                                    }
                                    Button {
                                        text:"9"
                                        action: function(){
                                        }
                                    },
                                    Button {
                                        text:"10"
                                        action: function(){
                                        }
                                    }
                                ]
                            }
                        }
                    }//HBox
                ]
            }
          ]
       }
    }
}
