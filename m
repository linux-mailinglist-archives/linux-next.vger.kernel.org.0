Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2429CC01
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2019 10:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730446AbfHZI6w (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Aug 2019 04:58:52 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46311 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729854AbfHZI6v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Aug 2019 04:58:51 -0400
Received: by mail-oi1-f194.google.com with SMTP id t24so11504471oij.13;
        Mon, 26 Aug 2019 01:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tnEOaWMh9o7a4lsL8t46ApShoBTiXhp9jJWi58Cb5Gc=;
        b=gNTC26TCRuhPCnmLwV5ci68NVeucexpxmpB1zZ5+bnany2+xp/mtE3YzqxreRpNFxK
         DdFU21+dZU3gMwdgfNjFzatQOh3il9bMnPF6ZGFXOKfBjL1DdOxA7SUnIFVcFIg28kNC
         9FzCvHJdW+D6G25inX+wGKdhB6VHtn1O9LCIB06t9B5nymrYZIIgjflUgvzYLASNoo3S
         RjKUqqWucD0lnA1490FxRzyERKwRG8R0YNe8cE/6zGZ8CdzZErgAtBWBQ4SS1YmRIL4b
         OfqtA1leb5iWDXKj2g3BExtshV9AO4ObjXVurg05FiqeJsM8vcCkYBualjbq24tZVV3Q
         PSoA==
X-Gm-Message-State: APjAAAVDJsd/v1pjsT7NGK35NBnsDdKDQ7nj2NdUREG3SjUT8HhTPGXe
        IeiVNelAiOktV4RQIehY7WXROxbKveTBNMGOY2A=
X-Google-Smtp-Source: APXvYqxXAEmTrR0e9s0qceFFoDeOwnHS/Xoq0e/yv+MEHb3J0+ID75RlA2eDMhAg81C5BpolzjElQX/42D45ESS6+Fk=
X-Received: by 2002:a54:478d:: with SMTP id o13mr11607090oic.54.1566809930697;
 Mon, 26 Aug 2019 01:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <c0005a09c89c20093ac699c97e7420331ec46b01.camel@perches.com>
 <9c7a79b4d21aea52464d00c8fa4e4b92638560b6.camel@perches.com>
 <CAHk-=wiL7jqYNfYrNikgBw3byY+Zn37-8D8yR=WUu0x=_2BpZA@mail.gmail.com>
 <6a5f470c1375289908c37632572c4aa60d6486fa.camel@perches.com>
 <4398924f28a58fca296d101dae11e7accce80656.camel@perches.com>
 <ad42da450ccafcb571cca9289dcf52840dbb53d3.camel@perches.com>
 <20190820092451.791c85e5@canb.auug.org.au> <14723fccc2c3362cc045df17fc8554f37c8a8529.camel@perches.com>
 <CAHk-=wgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=DPBE0Q@mail.gmail.com>
 <9d12995c5e7e41fc5d8ba202f76a2cf854183245.camel@perches.com> <CAHk-=wi6bEnBy11HJBbgPsG3-ctE6Zyi2+3cnozjMAafSUBAaQ@mail.gmail.com>
In-Reply-To: <CAHk-=wi6bEnBy11HJBbgPsG3-ctE6Zyi2+3cnozjMAafSUBAaQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Aug 2019 10:58:39 +0200
Message-ID: <CAMuHMdVtCKVXNghfrs6RgtSDC08c0eyR-xD6d7mkZuSSPEFY-Q@mail.gmail.com>
Subject: Re: rfc: treewide scripted patch mechanism? (was: Re: [PATCH]
 Makefile: Convert -Wimplicit-fallthrough=3 to just -Wimplicit-fallthrough for clang)QUILT
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Joe Perches <joe@perches.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Linus,

On Wed, Aug 21, 2019 at 2:41 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Aug 20, 2019 at 4:37 PM Joe Perches <joe@perches.com> wrote:
> > > So I'm putting my foot down on yet another broken string copy
> > > interface from people who do not understand this fundamental issue.
> >
> > I think you are mistaken about the stracpy limits as
> > the only limit is not the source size but the dest.
> >
> > Why should the source be size limited?
>
> You just proved my point. You don't understand that sources can also
> be limited, and the limit on a source can be *smaller* than the limit
> of a destination.
>
> Did we learn *NOTHING* from the complete and utter disaster that was strlcpy()?
>
> Do you not understand why strlcpy() was unacceptably bad, and why the
> people who converted strncpy() to it introduced real bugs?
>
> The fact is, it's not just the destination that has a size limit. The
> source often has one too.
>
> And no, the source is not always guaranteed to be NUL-terminated, nor
> is the source buffer guaranteed to be larger than the destination
> buffer.
>
> Now, if you *know* that the source is smaller than the destination
> size, you can do:
>
>     len = strnlen(src, srclen);
>     memcpy(dst, len);
>     dst[len] = 0;
>
> and that's not wrong, but that works only when
>
>  (a) you actually do the above
>
>  (b) you have no data races on src (or you at least only require that
> 'dst' is NUL-terminated, not that 'len' is necessarily the correct
> length of the result
>
>  (c) you actually know as the programmer that yes, the source is
> definitely smaller than the destination.
>
> and honestly, people don't get _any_ of that right.

(d) you know the untouched trailing end of dst[] does not leak data.

Anything else we're missing?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
