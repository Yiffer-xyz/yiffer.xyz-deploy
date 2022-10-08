# Remix site: Setup guide and explanation

First of all, you should read up on Remix if you don't already know. Their website explains things efficiently. Absolute must-knows are loader and action functions, how forms work out of the box with FormData, some hooks like useTransition, useFetcher, useActionData.

We use Tailwind CSS for styling. You can see examples in the code. I recommend [https://nerdcave.com/tailwind-cheat-sheet](https://nerdcave.com/tailwind-cheat-sheet) to quickly look up stuff as you're learning. You should _never write css_, and only inline style when there is no way around it. Colors exist in `tailwind.config.js` - if you feel the need for adding additional colors, confer with Melon.

For API calls: Put them in the page's action or loader if it's something specific to the page. If it's something reusable like, say, fetching a list of comics, put it in the `api` folder so that it can be reused.

## Temporary old API usage

As explained on the page one level up, we're waiting for D1 SQL. It is not possible to connect this edge api delivered through Cloudflare Workers to non-edge SQL databases without a lot of hassle. Therefore, any API call that requires database interaction will have to go through the old API, or the new old API.

- If the API action only requires a single read/write, it is preferrable to do all the logic in the Remix handler, and literally just create an API call in the new old api that queries the database with the query you need, and returns the raw results. This way, swapping once D1 is available will be almost no work at all.
- If the API action requires a limited number of reads/writes - which they mostly do - the same style can be used, but there will be many calls to the new old API. This is slow, yes, but _we won't publish anything written this way on the main part of Yiffer_.

We will publish the contributions section this way initially, but there are no huge actions there. We can also publish the new mod panel this way, as mods will naturally understand that things are a bit slow - it won't be terrible at all though.

The goal is to have all of Yiffer running in Remix, with the exception of file upload handling (as Cloudflare Workers have limitations on upload body size), and in the future stuff like a logging and/or stats API.

## Running locally

To run this project locally, you'll need to create a `.dev.vars` file in the project root, and fill it with content that should be pinned in the `#dev-code` discord channel. These env variables can be accessed on the loader/action `context` object.

Other than that, `yarn` -> `yarn dev` should be all you need.

When any PR is created, a Cloudflare Pages integration will create a preview build that can be accessed by anyone, and will link it on the pull request itself. When anything is merged into master, the live new.testyiffer.xyz is automatically updated.
