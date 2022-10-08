# Setup guide for developers

## Overview

Yiffer.xyz currently consists of a few stack elements:

- The new home of Yiffer.xyz, in Remix
- The "new old api" - nodejs/express with Typescript
- The old api, nodejs/express
- The three old front-end repos, Vue 2 (regular site, mod panel, and advertising site)
- A Google Cloud SQL database (MySQL)
- Google Cloud Storage for images (Will be swapped for Cloudflare R2 at some point)
- The old APIs and front-ends are served through Nginx on an Ubuntu VM with Docker Swarm
- Other services include Postmark (email sending), Cloudinary (image/gif converting), Prerender.io (prerendering, which will be unnecessary once all is on Remix)

## Test sites, how to develop

We have a test domain, `testyiffer.xyz`. You can mess around and do anything you want there. The four relevant domains are `testyiffer.xyz`, `mod.testyiffer.xyz`, `pi.testyiffer.xyz`, and `contribute.testyiffer.xyz`. The latter will always contain the latest master branch build of our Remix repo.

- Use our Linear board. Always keep the status of your tasks up to date!
- Set up Prettier auto-format on save. See the very bottom of this page for how-to.
- Announce PRs and ask code questions on Discord.
- All PRs require one approval before being merged.
- Never _merge_ master into your working branch - rebase your branch onto master instead. This is to have the git history be neat and actually useful to look through.
- Squash your commits unless they are completely separate things.

## The Remix repo

This is where you'll most likely be working. Blazing fast, supermodern technology where both front- and back-end are written together. The goal is to have _all_ of Yiffer over here eventually. Anything new is developed here, and anything old will be rewritten here.

We use Remix with Cloudflare Pages, which means that it's running on the edge in stateless Cloudflare Workers. This makes it incredibly fast, but means that all code must be stateless.

We are currently waiting for Cloudflare to make their new D1 SQL database open beta. This is a edge-only database, which is the last piece of the puzzle needed to complete this new stack of ours. Until then, any API route that needs to deal with database queries are routed to one of the old APIs, but in a way that involves minimal rewrites once we have our hands on D1. See the `Remix` folder for more info.

## The "New old API"

This was created because until we have D1, we can either not develop, or develop in a way that means a minimal amount of rewriting when we do get it. Since our Remix project uses Typescript and our old API does not, writing new database-related API logic in the old API is not a good strat. Additionally, the old API has some oddities in its structure. Therefore, a new API, using the same tech but Typescript, was created for anything new. This will run parallell to the old API. Should you need to spin this up locally, see the `Node APIs` folder for instructions.

## The actual old API

This is where all API logic existed until we started with Remix recently. It's got a bit of a wonky code structure, but luckily none of you will have to write code for this. The only things you might need to do is look up existing api routes to connect to, until we get D1 (I sound like a broken record). Should you need to spin this up locally, see the `Node APIs` folder for instructions.

## The three old front-ends

The current front-ends for the main site, mod panel, and advertising sites are made in Vue 2 and can be found in their own github repos. You should not have to develop anything in these, but you can use their code as inspiration if you'd like, when re-creating things in Remix.

## Checklist for Melon and you, setup

- Melon: Invite you to the yiffer-xyz org on Github (please provide username/email)
- Create a user on testyiffer.xyz. Melon: Give your user the admin role
- Read the pinned messages in `#dev-code` on discord for config files you need

## Prettier auto-format setup

This assumes you're using VSCode. In `settings.json`, add the following lines:

```
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.codeActionsOnSave": {
    "source.organizeImports": true
  },
```

Additionally, install the extension Prettier. That should be all you need.
