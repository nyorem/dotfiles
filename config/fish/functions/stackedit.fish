function stackedit
        set HERE (pwd)
        cd $HOME/libs/stackedit
        node server.js &
        cd $HERE
        open http://localhost:3000
end
