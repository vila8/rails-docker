$(document).ready(function() {
    $('#submit').click(function() {
        var user = $('#username').val();
        var comment = $('#comment').val();

        var data = {
            comment: {
                username: user,
                text: comment
            }
        };
        $.ajax({
            url: '/comments.json',
            type: 'POST',
            dataType: 'json',
            data: data,
            success: function() {
                alert('Comentario agregado');
            },
            error: function(err) {
                err = err.responseJSON;
                if (err.hasOwnProperty('username'))
                    alert('Username ' + err.username);
                else if (err.hasOwnProperty('text'))
                    alert('Comment ' + err.text);
                else
                    alert('Intenta después');
            }
        });
    });

    setInterval(function () {
        $.ajax({
            url: '/comments.json',
            type: 'GET',
            dataType: 'json',
            success: function(data) {
                var html = '<ul>';
                data.forEach(function(comment) {
                    html += '<li class="comments__username"><h3>' + comment.username + '</h3></li>';
                    html += '<li class="comments__text"><h5>' + comment.text + '</h5></li>';
                });
                html += '</ul>';
                $('#comments').empty();
                $('#comments').append(html);
            },
            error: function(err) {
                alert(err);
            }
        });
    }, 5000);
});

