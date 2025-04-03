## Boot
# devtools::document()
# roxygen2::roxygenise()
# devtools::check()
# devtools::install()
# devtools::build()
# usethis::use_git()
# pkgdown::build_site()
# usethis::use_github_action()
# usethis::use_pkgdown_github_pages()
# usethis::use_bioc_github_action()

 
## one time
# pak::pak("r-lib/httr2")
# https://stackoverflow.com/questions/72189273/r-cmd-check-github-actions-workflow-failing-on-warnings-notes
# - uses: r-lib/actions/check-r-package@v2
#        with:
#          build_args: 'c("--no-manual", "--no-build-vignettes")'
#          error-on: '"error"'


## GitHub Release Process
# ----------------------
# 1. Update NEWS.md with version changes
#
# 2. Merge develop into main:
#    git checkout main
#    git pull origin main
#    git merge develop
#
# 3. Create version tag:
#    git tag -a v0.x.x -m "Release version 0.x.x"
#
# 4. Push changes to GitHub:
#    git push origin main
#    git push origin v0.x.x
#
# 5. Return to develop branch:
#    git checkout develop
#
# 6. Create GitHub Release (optional):
#    - Go to repository on GitHub
#    - Navigate to "Releases" section
#    - Click "Draft a new release"
#    - Select the tag you just pushed
#    - Add release title and description
#    - Publish release

#---
#title: Database
#vignette: >
#  %\VignetteIndexEntry{Interoperability with file formats}
#  %\VignetteEngine{knitr::rmarkdown}
#  %\VignetteEncoding{UTF-8}
#author: "`r 'Author: Matthew Hung'`"
#date: "`r paste('Last Updated:', format(Sys.Date(), '%Y/%m/%d'))`"
#output:
#  html_document:
#    code_folding: hide
#knitr:
#  opts_chunk:
#    collapse: true
#    comment: '#>'
#---