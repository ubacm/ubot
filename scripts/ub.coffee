module.exports = (robot) ->
  robot.hear /whois (.*)/i, (msg) ->
    uname = msg.match[1]
    robot.http('http://localhost:5000/whois/' + uname)
      .get() (err, res, body) ->
        msg.send "#{body}"
