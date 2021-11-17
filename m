Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A64B245442F
	for <lists+linux-next@lfdr.de>; Wed, 17 Nov 2021 10:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235334AbhKQJxb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Nov 2021 04:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbhKQJxb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 17 Nov 2021 04:53:31 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B624EC061570
        for <linux-next@vger.kernel.org>; Wed, 17 Nov 2021 01:50:32 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id w29so3388542wra.12
        for <linux-next@vger.kernel.org>; Wed, 17 Nov 2021 01:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y8UtfBKpFljzwKmn9rkEteI/WMskLkeAqKsBUdCz8UA=;
        b=DbWUdU2HqOpPTwanKQRBEJQd5uD6Er5K4hDYn6Sh6afsTM2OECxoojLZVF1GoVFdCU
         o9v0kEdCqclo2pzBpsI8odUiKuPD3+lssQLHx6W1mIuKq3C6fY0jC5rVD1YvQLCbB4zi
         bswjZ/KorKMHnCMFlFN2q50uXEsAeeNS7SymmshYrGPWo5yJ8uez11o9sv42tw0mZ2Bd
         Oal/1lZKY2qEnIxS795fpDeR55YCvYvwFhkASA47EvGsIVMIteQRljBOp+J7csSgMfVv
         HJ+A5dvweeqxDOs/JytDzYu+RkVxGEJRzG4aN4ItcHSeGE8anaBCKC23sB/hgrP7uhg3
         lQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y8UtfBKpFljzwKmn9rkEteI/WMskLkeAqKsBUdCz8UA=;
        b=iFBX68PthLGLOc1EuP7umjic1ur3GhM5NPUeh0ArmzkYElXqEP9j4K82AdtAScckoR
         sKOPStyVBN6YSVp1EDBHN+FmLd9igk2yRYNAIfvleigOH65RSJhjZpSFjqOxGFSoO/XH
         GkUEFSyjQzCxSKsMIPKwNR8Jl90Yooe8hS0hArq7pcEL5ohin8cxYXkIb/WsJgFv1pLg
         i7fK5V/DXfuN8OYA13i3lvssYCtM5edT3xO21LvrGCzENDto0SwJz5za7aI77F2ziCJJ
         26OT2LRPBaKKcGJNNaZInlDtrCAaSuPJMrtSAXYRcEA9xH9oPURp9YaYFrWnPAjE8ty2
         ib6A==
X-Gm-Message-State: AOAM530Py5jC5RFW0Wlr+AHbvost+KN4blEehAshPNZEdc4cniFgHSpo
        skCVF2fFs0DpaqaRLR3IdNgBqeQ/NO0nl1y8+3qCgOcNPzcVNw==
X-Google-Smtp-Source: ABdhPJzMv09fmseHIZvqdbfP8+Dd24b9VGH7IqRJi2UIRDP0NLMfZwcWRtT5hRt6FtAZ2rfzH70XArL4eN2BCXnjSjc=
X-Received: by 2002:adf:dd0a:: with SMTP id a10mr18523894wrm.60.1637142630640;
 Wed, 17 Nov 2021 01:50:30 -0800 (PST)
MIME-Version: 1.0
References: <20211117135800.0b7072cd@canb.auug.org.au> <268ae204-efae-3081-a5dd-44fc07d048ba@infradead.org>
 <CAMuHMdUdA6cJkWWKypvn7nGQw+u=gW_oRNWB-=G8g2T3VixJFQ@mail.gmail.com>
 <CANn89iLXQWR_F6v39guPftY=jhs4XHsERifhZPOTjR3zDNkJyg@mail.gmail.com> <CAMuHMdXHo5boecN7Y81auC0y=_xWyNXO6tq8+U4AJq-z17F1nw@mail.gmail.com>
In-Reply-To: <CAMuHMdXHo5boecN7Y81auC0y=_xWyNXO6tq8+U4AJq-z17F1nw@mail.gmail.com>
From:   Eric Dumazet <edumazet@google.com>
Date:   Wed, 17 Nov 2021 01:50:18 -0800
Message-ID: <CANn89iKSZKvySL6+-gk7UGCowRoApJQmvUpYfiKChSSbxr=LYw@mail.gmail.com>
Subject: Re: linux-next: Tree for Nov 17 (uml, no IPV6)
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Netdev <netdev@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Nov 17, 2021 at 1:47 AM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> Hi Eric,
>
> On Wed, Nov 17, 2021 at 10:38 AM Eric Dumazet <edumazet@google.com> wrote=
:
> > On Wed, Nov 17, 2021 at 12:44 AM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Wed, Nov 17, 2021 at 6:49 AM Randy Dunlap <rdunlap@infradead.org> =
wrote:
> > > > On 11/16/21 6:58 PM, Stephen Rothwell wrote:
> > > > > Changes since 20211116:
> > > >
> > > > ARCH=3Dum SUBARCH=3Dx86_64:
> > > > # CONFIG_IPV6 is not set
> > >
> > > It doesn't always happen with CONFIG_IPV6=3Dn, so I guess that's why
> > > it wasn't detected before.
> >
> > Thanks for letting me know
> >
> > I guess the following addition would fix the issue ?
> >
> > diff --git a/arch/x86/um/asm/checksum_64.h b/arch/x86/um/asm/checksum_6=
4.h
> > index 7b6cd1921573c97361b8d486bbba3e8870d53ad6..4f0c15a61925c46b261f87f=
a319e6aff28f4cfce
> > 100644
> > --- a/arch/x86/um/asm/checksum_64.h
> > +++ b/arch/x86/um/asm/checksum_64.h
>
> Are you sure that's the right fix?
> That won't fix the issue with m5272c3_defconfig.
>
> > > > In file included from ../net/ethernet/eth.c:62:0:
> > > > ../include/net/gro.h: In function =E2=80=98ip6_gro_compute_pseudo=
=E2=80=99:
> > > > ../include/net/gro.h:413:22: error: implicit declaration of functio=
n =E2=80=98csum_ipv6_magic=E2=80=99; did you mean =E2=80=98csum_tcpudp_magi=
c=E2=80=99? [-Werror=3Dimplicit-function-declaration]
> > > >    return ~csum_unfold(csum_ipv6_magic(&iph->saddr, &iph->daddr,
> > > >                        ^~~~~~~~~~~~~~~
> > > >                        csum_tcpudp_magic
> > > >
> > > >
> > > > After I made ip6_gro_compute_pseudo() conditional on CONFIG_IPV6,
> > > > I got this build error:
> > > >
> > > > In file included from ../net/ipv6/tcpv6_offload.c:10:0:
> > > > ../net/ipv6/tcpv6_offload.c: In function =E2=80=98tcp6_gro_receive=
=E2=80=99:
> > > > ../net/ipv6/tcpv6_offload.c:22:11: error: implicit declaration of f=
unction =E2=80=98ip6_gro_compute_pseudo=E2=80=99; did you mean =E2=80=98ine=
t_gro_compute_pseudo=E2=80=99? [-Werror=3Dimplicit-function-declaration]
> > > >             ip6_gro_compute_pseudo)) {
> > > >             ^
> > > > ../include/net/gro.h:235:5: note: in definition of macro =E2=80=98_=
_skb_gro_checksum_validate=E2=80=99
> > > >       compute_pseudo(skb, proto));  \
> > > >       ^~~~~~~~~~~~~~
> > > > ../net/ipv6/tcpv6_offload.c:21:6: note: in expansion of macro =E2=
=80=98skb_gro_checksum_validate=E2=80=99
> > > >        skb_gro_checksum_validate(skb, IPPROTO_TCP,
> > > >        ^~~~~~~~~~~~~~~~~~~~~~~~~
> > > >
> > > >
> > > >
> > > > This is UML x86_64 defconfig:
> > > >
> > > > $ make ARCH=3Dum SUBARCH=3Dx86_64 defconfig all
> > >
> > > noreply@ellerman.id.au reported the same issue for m5272c3_defconfig,
> > > and I've bisected the failure to commit 4721031c3559db8e ("net:
> > > move gro definitions to include/net/gro.h").
>
> arch/m68k/include/asm/checksum.h defines csum_ipv6_magic()
> unconditionally, so it looks like just a missing #include.

I don't know, apparently on UM, csum_ipv6_magic() is only found in
arch/x86/um/asm/checksum_32.h,
no idea why...


>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
