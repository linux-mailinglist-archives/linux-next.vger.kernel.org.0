Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2C10766081
	for <lists+linux-next@lfdr.de>; Fri, 28 Jul 2023 02:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbjG1AIT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Jul 2023 20:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjG1AIS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Jul 2023 20:08:18 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A2B9BF
        for <linux-next@vger.kernel.org>; Thu, 27 Jul 2023 17:08:17 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-cfd4ea89978so1374600276.2
        for <linux-next@vger.kernel.org>; Thu, 27 Jul 2023 17:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690502896; x=1691107696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtTvM5Vq5jGq47OwLqe5C4EcXJ2/hEwJJ43AjprfYhY=;
        b=d0p+OrRHlljMePXr1xZWOrjChJUEjcNLhruwHUnEQ7Dt/4iaco4TnVoq7bxDVuO6Qn
         E2vLu/Ql8DAtaYEJU5k3n3BkApogefajtylPXnvbu4hc0tkN0pOU1OjFwWp59++pELgF
         1yladkRkOA0kQRzuHI92ongxqpADqj3FU2wx/DaFArEI/1qKRHuUDN4JmzRLJfxaqNI2
         VgIwCjVMSA1+2Je3qxjSDuALz/ZOdi4+jbGIJwqb5p+xTTJwEsw7up4V0nI9nFrO+3/L
         WwxZPuR59ahNtr2KlOr2YHxDDzJ3nWKwxv0zlusL8CMNsF1G+b9EVdV1sdLlvZXDkgAW
         Y56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690502896; x=1691107696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtTvM5Vq5jGq47OwLqe5C4EcXJ2/hEwJJ43AjprfYhY=;
        b=dDMoTmUjjScQsCiuPeT/OzQoPsdSOFjU3Dm2QnsmctVyk5d03TecFUWF8V+aCUtg1j
         ThqCN8wwS7uInC5sRR80d/oinEwvOvhdVHj35xZCio+8IG0fZVA6yH3C5O5RWfrQd7Tm
         6G/vvCej/9IOSL4uBATmIOKIRj08N7/xpPlVGpi2XOwWhG27GWatphlcZGnxyK9bxS5y
         ntXvQ2PKfOhVHbG2m3PE95HgCDZjCGZlV+OOZ0zvoP2SQX3iDeXsTc8QwPDr2/7/9hSB
         qpsW35gYA9UYNqr8Dz1XTu3QUozU8zsRfv4Ey35eSYdzp8W582nxLNJkgcy6P5d5sit+
         OrXg==
X-Gm-Message-State: ABy/qLaCTsVTSHue5lF+cwTQSMOUJSioDhwi0FRLSaq+H5B6G+Wew2gt
        bPz33wHapZQSdjq07k0TnqX/J0d8GFSxKPJqQTWy1Q==
X-Google-Smtp-Source: APBJJlG56ohe06r5T/Qy/YR4xnA8rC2Cv3JqWl7ELQZMflyxIg1sLSCzn/9D4+1QNpbqZfXIpngqEAqNAkH+R4Cpw/4=
X-Received: by 2002:a5b:945:0:b0:cf7:770:229f with SMTP id x5-20020a5b0945000000b00cf70770229fmr182755ybq.46.1690502896297;
 Thu, 27 Jul 2023 17:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230728091849.7f32259d@canb.auug.org.au> <20230728092915.732d4115@canb.auug.org.au>
 <CAJuCfpHe72rCZgkGQpRnVQHOQFdH4Vd=uj9nWi5aA2_2nNDFLA@mail.gmail.com> <ZMMCxRGMsSd9H+J3@casper.infradead.org>
In-Reply-To: <ZMMCxRGMsSd9H+J3@casper.infradead.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Thu, 27 Jul 2023 17:08:03 -0700
Message-ID: <CAJuCfpFPyFvaJOWW8NcvibZ5_QQg7t-GOo_270wRBXs8zX7QOg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm tree with Linus' tree
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jann Horn <jannh@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 27, 2023 at 4:50=E2=80=AFPM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Thu, Jul 27, 2023 at 04:40:20PM -0700, Suren Baghdasaryan wrote:
> > On Thu, Jul 27, 2023 at 4:29=E2=80=AFPM Stephen Rothwell <sfr@canb.auug=
.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > On Fri, 28 Jul 2023 09:18:49 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> > > >
> > > > Today's linux-next merge of the mm tree got a conflict in:
> > > >
> > > >   mm/memory.c
> > > >
> > > > between commit:
> > > >
> > > >   657b5146955e ("mm: lock_vma_under_rcu() must check vma->anon_vma =
under vma lock")
> > > >
> > > > from Linus' tree and commits:
> > > >
> > > >   69f6bbd1317f ("mm: handle userfaults under VMA lock")
> > > >   a3bdf38e85aa ("mm: allow per-VMA locks on file-backed VMAs")
> > > >
> > > > from the mm tree.
> > > >
> > > > I fixed it up (I think, please check - see below) and can carry the=
 fix
> > > > as necessary. This is now fixed as far as linux-next is concerned, =
but
> > > > any non trivial conflicts should be mentioned to your upstream
> > > > maintainer when your tree is submitted for merging.  You may also w=
ant
> > > > to consider cooperating with the maintainer of the conflicting tree=
 to
> > > > minimise any particularly complex conflicts.
> > > >
> > > > --
> > > > Cheers,
> > > > Stephen Rothwell
> > > >
> > > > diff --cc mm/memory.c
> > > > index ca632b58f792,271982fab2b8..000000000000
> > > > --- a/mm/memory.c
> > > > +++ b/mm/memory.c
> > > > @@@ -5392,32 -5597,18 +5597,21 @@@ retry
> > > >       if (!vma)
> > > >               goto inval;
> > > >
> > > > -     /* Only anonymous and tcp vmas are supported for now */
> > > > -     if (!vma_is_anonymous(vma) && !vma_is_tcp(vma))
> > > >  -    /* find_mergeable_anon_vma uses adjacent vmas which are not l=
ocked */
> > > >  -    if (vma_is_anonymous(vma) && !vma->anon_vma)
> > > > --            goto inval;
> > > > --
> > > >       if (!vma_start_read(vma))
> > > >               goto inval;
> > > >
> > > >  +    /*
> > > >  +     * find_mergeable_anon_vma uses adjacent vmas which are not l=
ocked.
> > > >  +     * This check must happen after vma_start_read(); otherwise, =
a
> > > >  +     * concurrent mremap() with MREMAP_DONTUNMAP could dissociate=
 the VMA
> > > >  +     * from its anon_vma.
> > > >  +     */
> > > > -     if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
> > > > -             goto inval_end_read;
> > > > -
> > > > -     /*
> > > > -      * Due to the possibility of userfault handler dropping mmap_=
lock, avoid
> > > > -      * it for now and fall back to page fault handling under mmap=
_lock.
> > > > -      */
> > > > -     if (userfaultfd_armed(vma))
> > > > ++    if (unlikely(vma_is_anonymous(vma) && !vma_is_tcp(vma)))
> >
> > Is the above extra '+' what compiler complains about?
> > Patches from Linus' tree remove some code from that function, so
> > applying them first should simplify the merge.
>
> I see you're unfamiliar with the output of git diff --cc ...

guilty as charged.

>
