-- see https://github.com/chipsenkbeil/distant.nvim for info about installing distant on the remote server
--
return {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
        require('distant'):setup()
    end
}
