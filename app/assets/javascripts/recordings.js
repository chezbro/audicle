$(document).ready(function() {
    var audioSection = $('section#audio');
    $('a.html5').click(function() {

        var audio = $('<audio>', {
             controls : 'controls'
        });

        var url = $(this).attr('href');
        $('<source>').attr('src', url).appendTo(audio);
        audioSection.html(audio);
        return false;
    });
});
// $('#record').click(function() {
//                rec.record();
//                ws.send("start");
//                $("#message").text("Click export to stop recording and analyze the input");

//                // export a wav every second, so we can send it using websockets
//                intervalKey = setInterval(function() {
//                    rec.exportWAV(function(blob) {
//                        rec.clear();
//                        ws.send(blob);
//                    });
//                }, 1000);
//            });
// $('#export').click(function() {
//                // first send the stop command
//                rec.stop();
//                ws.send("stop");
//                clearInterval(intervalKey);
//                ws.send("analyze");
//                $("#message").text("");
//            });
