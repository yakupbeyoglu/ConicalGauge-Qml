import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtGraphicalEffects 1.0
Window {
        visible: true
        width: 640
        height: 480
        title: qsTr("Hello World")
        property double value :0
        Slider{

                from : 0
                to : 270
                onValueChanged: {
                        canvas.clearCanvas();
                        canvas.paintCanvas(value);
                        console.log(value);
                }
        }

        Rectangle {
            width: 500
            height: 500
                x: 250
            color : "black"



            Canvas {




                id: canvas
                anchors.fill: parent
                function paintCanvas(v)
                {
                        console.log(v)
                    var ctx = getContext("2d");
                    var x = 210;
                    var y = 300;
                    var radius = 150;
                    var startAngle = (Math.PI / 180) * 90;
                    var progressAngle = (Math.PI / 180) * (90 + v);
                    ctx.lineCap="round";
                    ctx.lineWidth = 10;
                    ctx.beginPath();
                    ctx.arc(x, y+5, radius, startAngle, progressAngle);
                    ctx.strokeStyle = "#1eff00";
                    ctx.stroke();
                    canvas.requestPaint();
                }
                function clearCanvas() {
                    var ctx = getContext("2d");
                    ctx.reset();
                    canvas.requestPaint();
                }

            }
            Glow {
                     id:glow
                     anchors.fill: canvas
                     radius: 20
                     samples: 70
                     color: "#1eff00"
                     source: canvas

             }


}}
