module.exports = (robot) ->
  robot.hear /whois (.*)/i, (msg) ->
    uname = msg.match[1]
    robot.http('http://localhost:5000/whois/' + uname)
      .get() (err, res, body) ->
        if res.statusCode isnt 200
          msg.send "There was an error processing the request for: " + uname
          return

        msg.send "#{body}"
