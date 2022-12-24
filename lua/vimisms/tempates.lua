local au = vim.cmd
-- Templates
-- HTML
au("autocmd BufNewFile *.html 0r ~/.config/nvim/skeletons/html.html")
-- Blog posts
au("autocmd BufNewFile *contents/posts/*.md 0r ~/.config/nvim/skeletons/blog-post.md")
-- Typescript REACT
au("autocmd BufNewFile *.tsx 0r ~/.config/nvim/skeletons/react.tsx")
au("autocmd BufNewFile *.jsx 0r ~/.config/nvim/skeletons/react.tsx")
-- Bash
au("autocmd BufNewFile *.sh 0r ~/.config/nvim/skeletons/script.sh")
-- Python
au("autocmd BufNewFile *.py 0r ~/.config/nvim/skeletons/python.py")
