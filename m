Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FED139B8CC
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 14:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhFDMNJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Jun 2021 08:13:09 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:40889 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbhFDMNI (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2021 08:13:08 -0400
Received: by mail-vs1-f53.google.com with SMTP id b1so2955285vsh.7;
        Fri, 04 Jun 2021 05:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vt8N+G7F3tftlfqS71OQWB7kcVPnkFJYyYLGwqdVziA=;
        b=tpJzmO+XCJCXONtsOwGFPYx66ZK3tFWYkmkBQn9Hb819FYbUbcCop+youoGE+BAehf
         /FOIK/pQ63GP5by4NzwyakhfEZ6OeXtQ8vYkB0nlODBdOKqJt+P8E9jJ9QoWiapneQ3M
         7j4q0MLoWlKNXk8bFBGHvYjJtnqThUG/F8duXW8B/rsBtlmDzUtN9e9eleANM0daOEOp
         9QRsMLb+dM/OMstkwAb+Nm/7s/P9FTwrRHeATR48tWQwN2rnrGBx4tBbw/vKly4nS4Sh
         kBQDHajslVYO2z0+WE++i+mzLR/Eo8k1MCHnaFVDga0ZSi9XHafUVHy6MQTV7bR9bjYd
         7u/Q==
X-Gm-Message-State: AOAM532BgxNjo1vTBmp1nkkbmfuQ/1OxIe1DmsqZ6RCqynnZD++H2SxY
        z7yEzwgG4M5xoEWNXBnohFJwp8iIwagZk5ghgd8=
X-Google-Smtp-Source: ABdhPJz6VkJ7hBPFmpXUyU8ncbPPogWo8u/RaXLt6UhXBz9QD2IIRdMYrRfl1S2zge1aqc/8E+Mhd5YWYufxj3h2T48=
X-Received: by 2002:a67:fb8c:: with SMTP id n12mr2125550vsr.18.1622808664298;
 Fri, 04 Jun 2021 05:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210604090219.385504-1-geert@linux-m68k.org> <KL1P15301MB0343B4F6AF86864149DFB231943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
 <CAMuHMdUyNuqOTHKLkO8=mWsbFJer7C0sOmswAiANSJnoDWbRTw@mail.gmail.com>
 <KL1P15301MB034321F9FA32CA3A5BBE7AE9943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
 <CAMuHMdXJft7PJ8cnm2GV6AjQctPZzDQJ=czwmTLJcthkBiZppA@mail.gmail.com> <KL1P15301MB0343008F226230DF6F34723F943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <KL1P15301MB0343008F226230DF6F34723F943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Jun 2021 14:10:53 +0200
Message-ID: <CAMuHMdWR5hDGhwGGNzcNy0JEDmBho7dGd==nYXYqX7MrVvS+kQ@mail.gmail.com>
Subject: Re: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect and
 chan_index to "unsigned long"
To:     Shyam Prasad <Shyam.Prasad@microsoft.com>
Cc:     Steve French <sfrench@samba.org>,
        "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Shyam,

On Fri, Jun 4, 2021 at 1:49 PM Shyam Prasad <Shyam.Prasad@microsoft.com> wrote:
> Are you referring to this PR?
> https://github.com/sprasad-microsoft/smb-kernel-client/pull/5

Yes, as that's what your email[2] is pointing to.

> https://github.com/sprasad-microsoft/smb-kernel-client/commit/09d387ff8f064f4d1e7e8d15b248742bac9e12aa.patch
> This patch is now using chans_need_reconnect as unsigned long instead of size_t
> +       /*
> +        * chans_need_reconnect is a bitmap indicating which of the channels
> +        * under this smb session needs to be reconnected.
> +        * If not multichannel session, only one bit will be used.
> +        */
> +       unsigned long chans_need_reconnect;

The commit in the PR has indeed been updated, but the link[3] in the
pull request hasn't.

This makes it very difficult to find and track patches, and review
commits hidden in pull requests that don't even contain the subjects
of the patches in the pull summary. so searching in lore doesn't
find them.
The Linux review policy requires _patches_ to be sent to public
mailing lists.

Thanks for your cooperation!

[2] https://lore.kernel.org/linux-cifs/CANT5p=o6Oq-27Xj4Z6-XzXKL45Dwg7JjGw2HA9jv5+YFQKpHUg@mail.gmail.com/
[3] https://github.com/sprasad-microsoft/smb-kernel-client/commit/2615c7300f93a7ae2d9350da25ed117492f8edbf.patch

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Friday, June 4, 2021 5:12 PM
> To: Shyam Prasad <Shyam.Prasad@microsoft.com>
> Cc: Steve French <sfrench@samba.org>; linux-cifs@vger.kernel.org; linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Stephen Rothwell <sfr@canb.auug.org.au>
> Subject: Re: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect and chan_index to "unsigned long"
>
> Hi Shyam,
>
> On Fri, Jun 4, 2021 at 1:12 PM Shyam Prasad <Shyam.Prasad@microsoft.com> wrote:
> > You can find the updated patches in the linux-cifs mailing list about an hour ago.
> > Titled: Multichannel patches
>
> The link in the updated PR still points to the old buggy patch.
>
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Friday, June 4, 2021 4:39 PM
> > To: Shyam Prasad <Shyam.Prasad@microsoft.com>
> > Cc: Steve French <sfrench@samba.org>; linux-cifs@vger.kernel.org;
> > linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Stephen
> > Rothwell <sfr@canb.auug.org.au>
> > Subject: Re: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect and chan_index to "unsigned long"
> >
> > Hi Shyam,
> >
> > On Fri, Jun 4, 2021 at 12:41 PM Shyam Prasad <Shyam.Prasad@microsoft.com> wrote:
> > > Thanks for the email.
> > > I've already submitted the fix for this. You should see this fixed tomorrow.
> >
> > Where can I find these submitted fixes?
> >
> > As per linux-next policy[1], commits in linux-next should be posted to the relevant mailing list first, which is linux-cifs, AFAIK.
> >
> > Thanks!
> >
> > [1]
> > https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore
> > .kernel.org%2Flinux-next%2F20210430174733.5a31d0c6%40canb.auug.org.au%
> > 2F&amp;data=04%7C01%7CShyam.Prasad%40microsoft.com%7Cf7e7a8acfce742a86
> > 13d08d9274dd650%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637584037
> > 569130123%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIi
> > LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=KtltZkg52K1iI84809CQTx
> > kIN4OxmoxhRDZ%2B%2BW4hu00%3D&amp;reserved=0
> >
> > > -----Original Message-----
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Sent: Friday, June 4, 2021 2:32 PM
> > > To: Steve French <sfrench@samba.org>; Shyam Prasad
> > > <Shyam.Prasad@microsoft.com>
> > > Cc: linux-cifs@vger.kernel.org; linux-next@vger.kernel.org;
> > > linux-kernel@vger.kernel.org
> > > Subject: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect and chan_index to "unsigned long"
> > >
> > > On 32-bit (e.g. m68k):
> > >
> > >     fs/cifs/cifssmb.c: In function 'cifs_reconnect_tcon':
> > >     ./include/linux/kern_levels.h:5:18: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
> > >     fs/cifs/cifssmb.c:201:42: note: format string is defined here
> > >       201 |  cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %d",
> > >           |                                        ~~^
> > >           |                                          |
> > >           |                                          long unsigned int
> > >           |                                        %x
> > >
> > >     fs/cifs/transport.c: In function 'cifs_pick_channel':
> > >     fs/cifs/cifsglob.h:955:20: error: passing argument 2 of 'test_bit' from incompatible pointer type [-Werror=incompatible-pointer-types]
> > >       955 |  test_bit((index), &(ses)->chans_need_reconnect)
> > >           |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > >           |                    |
> > >           |                    size_t * {aka unsigned int *}
> > >     ./arch/m68k/include/asm/bitops.h:151:66: note: expected 'const volatile long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
> > >       151 | static inline int test_bit(int nr, const volatile unsigned long *vaddr)
> > >           |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
> > >
> > >     fs/cifs/sess.c: In function 'cifs_chan_set_need_reconnect':
> > >     fs/cifs/sess.c:98:22: error: passing argument 2 of 'bset_mem_set_bit' from incompatible pointer type [-Werror=incompatible-pointer-types]
> > >        98 |  set_bit(chan_index, &ses->chans_need_reconnect);
> > >           |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > >           |                      |
> > >           |                      size_t * {aka unsigned int *}
> > >     ./arch/m68k/include/asm/bitops.h:41:69: note: expected 'volatile long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
> > >        41 | static inline void bset_mem_set_bit(int nr, volatile unsigned long *vaddr)
> > >           |                                             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
> > >     fs/cifs/sess.c:98:22: error: passing argument 2 of 'bfset_mem_set_bit' from incompatible pointer type [-Werror=incompatible-pointer-types]
> > >        98 |  set_bit(chan_index, &ses->chans_need_reconnect);
> > >           |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > >           |                      |
> > >           |                      size_t * {aka unsigned int *}
> > >     ./arch/m68k/include/asm/bitops.h:50:70: note: expected 'volatile long unsigned int *' but argument is of type 'size_t *' {aka 'unsigned int *'}
> > >        50 | static inline void bfset_mem_set_bit(int nr, volatile unsigned long *vaddr)
> > >           |                                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
> > >
> > >    [...]
> > >
> > > As bitops can only operate on long objects, and
> > > cifs_ses_get_chan_index() already returns "unsigned long", fix this by changing cifs_ses.chans_need_reconnect and chan_index from "size_t" to "unsigned long".
> > >
> > > Fixes: 374c6c7bba3cbaa1 ("cifs: changes to support multichannel
> > > during channel reconnect")
> > > Reported-by: noreply@ellerman.id.au
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > Can you please add Link: headers when committing patches?
> > > I could not find this patch in the lore archives of linux-cifs or linux-fsdevel, presumably it was posted elsewhere?
> > > Thanks!
> > > ---
> > >  fs/cifs/cifsglob.h | 2 +-
> > >  fs/cifs/sess.c     | 6 +++---
> > >  2 files changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h index
> > > 8fea2ddd2bd7af26..a9c026af21e1e9d1 100644
> > > --- a/fs/cifs/cifsglob.h
> > > +++ b/fs/cifs/cifsglob.h
> > > @@ -968,7 +968,7 @@ struct cifs_ses {
> > >          * enable the sessions on top to continue to live till any
> > >          * of the channels below are active.
> > >          */
> > > -       size_t chans_need_reconnect;
> > > +       unsigned long chans_need_reconnect;
> > >  };
> > >
> > >  static inline bool
> > > diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c index
> > > 1721a3b246942266..1a17ddd6abbe5778 100644
> > > --- a/fs/cifs/sess.c
> > > +++ b/fs/cifs/sess.c
> > > @@ -94,7 +94,7 @@ void
> > >  cifs_chan_set_need_reconnect(struct cifs_ses *ses,
> > >                              struct TCP_Server_Info *server)  {
> > > -       size_t chan_index = cifs_ses_get_chan_index(ses, server);
> > > +       unsigned long chan_index = cifs_ses_get_chan_index(ses,
> > > + server);
> > >         set_bit(chan_index, &ses->chans_need_reconnect);
> > >         cifs_dbg(FYI, "Set reconnect bitmask for chan %lu; now 0x%lx\n",
> > >                  chan_index, ses->chans_need_reconnect); @@ -104,7 +104,7 @@ void  cifs_chan_clear_need_reconnect(struct cifs_ses *ses,
> > >                                struct TCP_Server_Info *server)  {
> > > -       size_t chan_index = cifs_ses_get_chan_index(ses, server);
> > > +       unsigned long chan_index = cifs_ses_get_chan_index(ses,
> > > + server);
> > >         clear_bit(chan_index, &ses->chans_need_reconnect);
> > >         cifs_dbg(FYI, "Cleared reconnect bitmask for chan %lu; now 0x%lx\n",
> > >                  chan_index, ses->chans_need_reconnect); @@ -114,7 +114,7 @@ bool  cifs_chan_needs_reconnect(struct cifs_ses *ses,
> > >                             struct TCP_Server_Info *server)  {
> > > -       size_t chan_index = cifs_ses_get_chan_index(ses, server);
> > > +       unsigned long chan_index = cifs_ses_get_chan_index(ses,
> > > + server);
> > >         return CIFS_CHAN_NEEDS_RECONNECT(ses, chan_index);  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
