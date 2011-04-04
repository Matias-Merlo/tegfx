/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package teg_fx;

/**
 * @author Emmanuel
 */

import javafx.scene.*;
import javafx.scene.paint.*;
import javafx.scene.shape.*;

public class Bars extends CustomNode {
    override function create():Node {
        return Group {
            content: for(x in [0..4]) {
                Rectangle {
                    y: indexof x * 20
                    width: 100
                    height: 10
                    fill:Color.RED
                }
            }
        };
    }
}