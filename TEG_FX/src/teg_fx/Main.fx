/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package teg_fx;

import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.effect.DropShadow;
import javafx.scene.effect.Glow;
import javafx.scene.paint.Color;
import javafx.scene.input.MouseEvent;
import javafx.ext.swing.SwingTextField;
import javafx.animation.transition.ScaleTransition;
import javafx.scene.effect.Blend;
import javafx.scene.effect.BlendMode;
import javafx.scene.control.Button;
import javafx.ext.swing.SwingButton;
import javafx.scene.layout.Panel;
import javafx.scene.CustomNode;
import javafx.scene.Node;
import javafx.scene.control.Tooltip;
import javafx.scene.Cursor;
import javafx.scene.input.MouseButton;
import java.net.URL;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;

/**
 * @author Emmanuel
 */
var x: Number = 587;
var y: Number = 389;
var scale = 1.0;
var FONDO_LIMPIO = true;

def miBlend: Blend = Blend {
	mode: BlendMode.BLUE
	opacity : 0.5

}

def miDS: DropShadow = DropShadow {
	offsetX: 10
	offsetY: 10
	color: Color.BLUEVIOLET
	radius: 10
}


def txtCoo: SwingTextField = SwingTextField {
    columns: 10
    text: "X: {x} Y: {y}"
    editable: false
}

def argentina: ImageView = ImageView {
    x: 268
    y: 537
//    scaleX: bind scale
//    scaleY: bind scale

    image: Image {
        url: "{__DIR__}images/Argentina.png"
        smooth: true
    }

    onMouseEntered: function(e: MouseEvent): Void {
        Escala.node = argentina;
        Escala.play();
    }
    onMouseExited: function(e: MouseEvent): Void {
        Escala.node = argentina;
        argentina.scaleX = scale;
        argentina.scaleY = scale;
        Escala.stop();
    }
 }

 def niger: ImageView = ImageView {
    x: 587
    y: 389

    image: Image {
        url: "{__DIR__}images/Niger.png"
        smooth: true

    }
    onMouseEntered: function(e: MouseEvent): Void {
        Escala.node = niger;
        Escala.play();
    }
    onMouseExited: function(e: MouseEvent): Void {
        Escala.node = niger;
        niger.scaleX = scale;
        niger.scaleY = scale;
        Escala.stop();
    }
 }

var Escala = ScaleTransition {
    duration: 1s
//    node: argentina
    byX: 0.1 byY: 0.1

//    repeatCount:4 autoReverse: true
};



  def canada: ImageView = ImageView {
    x: 0
    y: 197
    cursor: Cursor.HAND
    image: Image {
        url: "{__DIR__}images/Canada.png"
        smooth: true
    }

    onMouseEntered: function(e: MouseEvent): Void {
        Escala.node = canada;
        Escala.play();
        miDS.color = Color.CORAL;
        canada.effect = miDS;

    }
    onMouseExited: function(e: MouseEvent): Void {
        canada.scaleX = scale;
        canada.scaleY = scale;
        Escala.stop();
        miDS.color = null;
        canada.effect = miDS;
    }

    onMouseClicked: function(e: MouseEvent): Void {
        if (e.button == MouseButton.SECONDARY){
            FONDO_LIMPIO = false;
            menu.translateX = e.x;
            menu.translateY = e.y;
            menu.visible = FONDO_LIMPIO;
        }
        else if(e.button == MouseButton.PRIMARY){
            //fichaNaranja.visible = true;
            FONDO_LIMPIO = true;
            menu.visible = FONDO_LIMPIO;
        }
    }

 };

 def fichaNaranja = ImageView {
    x: 10
    y: 100
    smooth: true
    visible: true
//    visible: false;
    image: Image{
       url: "{__DIR__}/images/fichas/ficha-naranja.png";
   }
 };


var menu = MenuPaises {
    visible: bind not FONDO_LIMPIO;
    };
    
var tt: ToolTip = ToolTip{
    };

//def canada: ImageView = ImageView {
//    x: bind x
//    y: bind y
//
//    image: Image {
//        url: "{__DIR__}/images/Canada.png"
//        smooth: true
//
//    }
//    onMouseExited: function(e: MouseEvent): Void {
//        if (scale == 1.0) scale = 2.0 else scale = 1.0;
//        canada.scaleX = scale;
//        canada.scaleY = scale;
//    }
//    onMouseDragged: function(e: MouseEvent): Void {
//        x = e.x;
//        y= e.y;
//        txtCoo.text= "X: {x} Y: {y}";
//    }
// }
//
def myPanel: Panel  = Panel {
	content: [canada]

}

def bars: Bars = Bars {};

Stage {
    title: "TEG - Táctica y Estrategia para la Guerra"
    fullScreen: true
    scene: Scene {
        content: [
            ImageView {
                fitHeight: 768 // HACER UNA FUNCION EN JAVA PARA RECUPERAR
                fitWidth: 1366 // LA RESOLUCION DE LA PANTALLA
                image: Image {
                    //ScaleTransition {
                    //    duration: 2s
                    //    node: argentina
                    //    byX: 1.5 byY: 1.5
                    //    repeatCount:4 autoReverse: true
                    //}.play();
                    url: "{__DIR__}images/mundo.jpg"
                    smooth: true
                    backgroundLoading: true
                    placeholder: Image {
                        url: "{__DIR__}images/reloj.jpg"
                    }

                }
                onMouseMoved: function(e: MouseEvent): Void {
                    menu.translateX = e.x;
                    menu.translateY = e.y;
                }
                onMouseClicked: function(e: MouseEvent): Void {
                    FONDO_LIMPIO = true;
                }

            }
            niger,
            argentina,
            canada,
            txtCoo,
            menu,
            fichaNaranja
        ]
    }
}
//
//var progressTimeline: Timeline = Timeline {
//    repeatCount: Timeline.INDEFINITE
//    keyFrames: [
//        KeyFrame {
//            time: 100ms
//            action: function(): Void {
//            if (image.progress > 99.9) then progressTimeline.stop();
//            if (image.progress > 75.0) then
//            println("loading status: {image.progress}%")
//            }
//        }
//    ]
//};
