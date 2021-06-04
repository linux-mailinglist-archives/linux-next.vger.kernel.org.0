Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB3439B7A1
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 13:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhFDLL1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 4 Jun 2021 07:11:27 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:45839 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbhFDLL1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2021 07:11:27 -0400
Received: by mail-ua1-f52.google.com with SMTP id z13so78235uai.12;
        Fri, 04 Jun 2021 04:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yg1cyMLtFpU6qgef10zjsDeHfF/JPKqUg0hmm8OFcD0=;
        b=j+x5EDx+K0gxRP+qs+ShqEoYwtfv0O/88CsqxzuuqR/v69VGwtocaf4NRALbdjhXyu
         9MZ8pRo0YYrCajWhVyd6rZCZHW06l1WLCvcycptMXpu23pwJtZduOZ+whlpZ47q2OpQk
         SxXcigqyLZ82QiqLaMj5cWgmtPFNVcAJUbt/EvdkbLZ5rXcr36YL4zJC4kLeiSa6iVB/
         7BqNbyuUMOsL0wWwL7E6Va2VTmi91r2ZhTcy5tKyVdfLL4vVSK63ArIoL10Gh+PinsAa
         51p2h8DhQtngXhmFJUp+TVSuoJUD+y/NWwOuv//aJ1Gs++WNwMzLxnfSnJH+yFZk4XWy
         NUlw==
X-Gm-Message-State: AOAM530FI7/FBnNwa1YrGRp4m/ObP8Wb1i3wN8tm/jCy70U5vpIn/c4P
        opMlUlO4EUhakwdyAnqI9kalP/JiSQmcKGidGaI=
X-Google-Smtp-Source: ABdhPJz5v5QywnQWXTr38dyiMhJyEAz1F3gpXBAga4NK52+bsfJW6ksrQV4LARG5mlopl5cIHZCGgQI7isBV2H8ygNY=
X-Received: by 2002:ab0:708c:: with SMTP id m12mr2824270ual.4.1622804966645;
 Fri, 04 Jun 2021 04:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210604090219.385504-1-geert@linux-m68k.org> <KL1P15301MB0343B4F6AF86864149DFB231943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
In-Reply-To: <KL1P15301MB0343B4F6AF86864149DFB231943B9@KL1P15301MB0343.APCP153.PROD.OUTLOOK.COM>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Jun 2021 13:09:15 +0200
Message-ID: <CAMuHMdUyNuqOTHKLkO8=mWsbFJer7C0sOmswAiANSJnoDWbRTw@mail.gmail.com>
Subject: Re: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect and
 chan_index to "unsigned long"
To:     Shyam Prasad <Shyam.Prasad@microsoft.com>
Cc:     Steve French <sfrench@samba.org>,
        "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Shyam,

On Fri, Jun 4, 2021 at 12:41 PM Shyam Prasad <Shyam.Prasad@microsoft.com> wrote:
> Thanks for the email.
> I've already submitted the fix for this. You should see this fixed tomorrow.

Where can I find these submitted fixes?

As per linux-next policy[1], commits in linux-next should be posted
to the relevant mailing list first, which is linux-cifs, AFAIK.

Thanks!

[1] https://lore.kernel.org/linux-next/20210430174733.5a31d0c6@canb.auug.org.au/

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Friday, June 4, 2021 2:32 PM
> To: Steve French <sfrench@samba.org>; Shyam Prasad <Shyam.Prasad@microsoft.com>
> Cc: linux-cifs@vger.kernel.org; linux-next@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [EXTERNAL] [PATCH] cifs: Change cifs_ses.chans_need_reconnect and chan_index to "unsigned long"
>
> On 32-bit (e.g. m68k):
>
>     fs/cifs/cifssmb.c: In function ‘cifs_reconnect_tcon’:
>     ./include/linux/kern_levels.h:5:18: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘size_t’ {aka ‘unsigned int’} [-Wformat=]
>     fs/cifs/cifssmb.c:201:42: note: format string is defined here
>       201 |  cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %d",
>           |                                        ~~^
>           |                                          |
>           |                                          long unsigned int
>           |                                        %x
>
>     fs/cifs/transport.c: In function ‘cifs_pick_channel’:
>     fs/cifs/cifsglob.h:955:20: error: passing argument 2 of ‘test_bit’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>       955 |  test_bit((index), &(ses)->chans_need_reconnect)
>           |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                    |
>           |                    size_t * {aka unsigned int *}
>     ./arch/m68k/include/asm/bitops.h:151:66: note: expected ‘const volatile long unsigned int *’ but argument is of type ‘size_t *’ {aka ‘unsigned int *’}
>       151 | static inline int test_bit(int nr, const volatile unsigned long *vaddr)
>           |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>
>     fs/cifs/sess.c: In function ‘cifs_chan_set_need_reconnect’:
>     fs/cifs/sess.c:98:22: error: passing argument 2 of ‘bset_mem_set_bit’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>        98 |  set_bit(chan_index, &ses->chans_need_reconnect);
>           |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                      |
>           |                      size_t * {aka unsigned int *}
>     ./arch/m68k/include/asm/bitops.h:41:69: note: expected ‘volatile long unsigned int *’ but argument is of type ‘size_t *’ {aka ‘unsigned int *’}
>        41 | static inline void bset_mem_set_bit(int nr, volatile unsigned long *vaddr)
>           |                                             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>     fs/cifs/sess.c:98:22: error: passing argument 2 of ‘bfset_mem_set_bit’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>        98 |  set_bit(chan_index, &ses->chans_need_reconnect);
>           |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>           |                      |
>           |                      size_t * {aka unsigned int *}
>     ./arch/m68k/include/asm/bitops.h:50:70: note: expected ‘volatile long unsigned int *’ but argument is of type ‘size_t *’ {aka ‘unsigned int *’}
>        50 | static inline void bfset_mem_set_bit(int nr, volatile unsigned long *vaddr)
>           |                                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
>
>    [...]
>
> As bitops can only operate on long objects, and
> cifs_ses_get_chan_index() already returns "unsigned long", fix this by changing cifs_ses.chans_need_reconnect and chan_index from "size_t" to "unsigned long".
>
> Fixes: 374c6c7bba3cbaa1 ("cifs: changes to support multichannel during channel reconnect")
> Reported-by: noreply@ellerman.id.au
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Can you please add Link: headers when committing patches?
> I could not find this patch in the lore archives of linux-cifs or linux-fsdevel, presumably it was posted elsewhere?
> Thanks!
> ---
>  fs/cifs/cifsglob.h | 2 +-
>  fs/cifs/sess.c     | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h index 8fea2ddd2bd7af26..a9c026af21e1e9d1 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -968,7 +968,7 @@ struct cifs_ses {
>          * enable the sessions on top to continue to live till any
>          * of the channels below are active.
>          */
> -       size_t chans_need_reconnect;
> +       unsigned long chans_need_reconnect;
>  };
>
>  static inline bool
> diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c index 1721a3b246942266..1a17ddd6abbe5778 100644
> --- a/fs/cifs/sess.c
> +++ b/fs/cifs/sess.c
> @@ -94,7 +94,7 @@ void
>  cifs_chan_set_need_reconnect(struct cifs_ses *ses,
>                              struct TCP_Server_Info *server)  {
> -       size_t chan_index = cifs_ses_get_chan_index(ses, server);
> +       unsigned long chan_index = cifs_ses_get_chan_index(ses, server);
>         set_bit(chan_index, &ses->chans_need_reconnect);
>         cifs_dbg(FYI, "Set reconnect bitmask for chan %lu; now 0x%lx\n",
>                  chan_index, ses->chans_need_reconnect); @@ -104,7 +104,7 @@ void  cifs_chan_clear_need_reconnect(struct cifs_ses *ses,
>                                struct TCP_Server_Info *server)  {
> -       size_t chan_index = cifs_ses_get_chan_index(ses, server);
> +       unsigned long chan_index = cifs_ses_get_chan_index(ses, server);
>         clear_bit(chan_index, &ses->chans_need_reconnect);
>         cifs_dbg(FYI, "Cleared reconnect bitmask for chan %lu; now 0x%lx\n",
>                  chan_index, ses->chans_need_reconnect); @@ -114,7 +114,7 @@ bool  cifs_chan_needs_reconnect(struct cifs_ses *ses,
>                             struct TCP_Server_Info *server)
>  {
> -       size_t chan_index = cifs_ses_get_chan_index(ses, server);
> +       unsigned long chan_index = cifs_ses_get_chan_index(ses, server);
>         return CIFS_CHAN_NEEDS_RECONNECT(ses, chan_index);  }

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
