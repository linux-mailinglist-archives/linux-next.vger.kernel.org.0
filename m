Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01E0A766045
	for <lists+linux-next@lfdr.de>; Fri, 28 Jul 2023 01:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjG0Xkg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Jul 2023 19:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjG0Xkf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Jul 2023 19:40:35 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AC772D70
        for <linux-next@vger.kernel.org>; Thu, 27 Jul 2023 16:40:34 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-5844bb9923eso16928157b3.0
        for <linux-next@vger.kernel.org>; Thu, 27 Jul 2023 16:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690501233; x=1691106033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+3mghGdDw3pgWEcgcYoEfWjzZksiK+Y0jeaZ0QzAOU=;
        b=QlXDG7dOBbLTmKZXaDqqSHenhyN0unre9JC8EHuL2yEH17R7suvTwuIiXmH3KhoA3F
         gUo0c/MCiieFd/uG/4EyLTRQ9WWcTwP/Tybc9KzazFt8eUIivVVTo9sXKwMajz4IrvbH
         +jY9dHOXEx/wj9EsGakkGmOMSqxsC9ALJ0S4N7TXgUQI0J/0m7MIEaP7F2lY6vvGzCZr
         4DA7k4GNtlqpK+8p3ADoXpMP6Dzqy3FVCYiHvOcsLy1mKty28PtFy8SneHRLScNS1fwc
         LjGkuTBhiiMImZjg8OXPVxEWY7jq3QYoxEec/UIBAblxtwcjs7/IaVkd9CBtN5qsbzKj
         hG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690501233; x=1691106033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v+3mghGdDw3pgWEcgcYoEfWjzZksiK+Y0jeaZ0QzAOU=;
        b=LMFj0Sq1Nb5XtxTUeB3SrxTHcrSH4e+lin4q1klYTUyRVolH1pOl+EgwBNJHf5P9e7
         rWse/5+52mro+IaxWrGqvpE2eMk46lKdI2DTMlr1AfuquBkLxXuF6d4sRWn2rCApOkCD
         SGBJf6qbEn6HWLPEzsAdACoipyXgcXDFtMpDFVs2ytEFGySczNA4LBAsYDZeEiry42T4
         ane1a7/cmubFX+dVYe5+h4RouPpU+aY9+mFM04R/Cw8bpBaGTd31vjqg1m9bZw/dujdf
         gHwmi4+FXuvAgeMPi48p0UGRay87w2ROQV6k3Fr8C/Yc55aaCggoQ2AFOgzAM/Fqv6QU
         jyZQ==
X-Gm-Message-State: ABy/qLYdeQdPNfKVMN08SBkolPkVL0g7wQDO10vHz0ppMDNL44ZKEBwb
        ePyX+zoFHwLJ+8m6M+x3niQvb5U82B4glSCuxNFZKw==
X-Google-Smtp-Source: APBJJlHLVEX28u/xcbPdrz3nP9qEzXufc0SstV5fe+EEzaCP+mP2LXnP5UNDxPyrWXNSUazXD/9t4Osrmn08UqtuTNI=
X-Received: by 2002:a81:460b:0:b0:577:3666:bb4e with SMTP id
 t11-20020a81460b000000b005773666bb4emr99433ywa.36.1690501233367; Thu, 27 Jul
 2023 16:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230728091849.7f32259d@canb.auug.org.au> <20230728092915.732d4115@canb.auug.org.au>
In-Reply-To: <20230728092915.732d4115@canb.auug.org.au>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Thu, 27 Jul 2023 16:40:20 -0700
Message-ID: <CAJuCfpHe72rCZgkGQpRnVQHOQFdH4Vd=uj9nWi5aA2_2nNDFLA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mm tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jann Horn <jannh@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
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

On Thu, Jul 27, 2023 at 4:29=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> On Fri, 28 Jul 2023 09:18:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the mm tree got a conflict in:
> >
> >   mm/memory.c
> >
> > between commit:
> >
> >   657b5146955e ("mm: lock_vma_under_rcu() must check vma->anon_vma unde=
r vma lock")
> >
> > from Linus' tree and commits:
> >
> >   69f6bbd1317f ("mm: handle userfaults under VMA lock")
> >   a3bdf38e85aa ("mm: allow per-VMA locks on file-backed VMAs")
> >
> > from the mm tree.
> >
> > I fixed it up (I think, please check - see below) and can carry the fix
> > as necessary. This is now fixed as far as linux-next is concerned, but
> > any non trivial conflicts should be mentioned to your upstream
> > maintainer when your tree is submitted for merging.  You may also want
> > to consider cooperating with the maintainer of the conflicting tree to
> > minimise any particularly complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc mm/memory.c
> > index ca632b58f792,271982fab2b8..000000000000
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@@ -5392,32 -5597,18 +5597,21 @@@ retry
> >       if (!vma)
> >               goto inval;
> >
> > -     /* Only anonymous and tcp vmas are supported for now */
> > -     if (!vma_is_anonymous(vma) && !vma_is_tcp(vma))
> >  -    /* find_mergeable_anon_vma uses adjacent vmas which are not locke=
d */
> >  -    if (vma_is_anonymous(vma) && !vma->anon_vma)
> > --            goto inval;
> > --
> >       if (!vma_start_read(vma))
> >               goto inval;
> >
> >  +    /*
> >  +     * find_mergeable_anon_vma uses adjacent vmas which are not locke=
d.
> >  +     * This check must happen after vma_start_read(); otherwise, a
> >  +     * concurrent mremap() with MREMAP_DONTUNMAP could dissociate the=
 VMA
> >  +     * from its anon_vma.
> >  +     */
> > -     if (unlikely(!vma->anon_vma && !vma_is_tcp(vma)))
> > -             goto inval_end_read;
> > -
> > -     /*
> > -      * Due to the possibility of userfault handler dropping mmap_lock=
, avoid
> > -      * it for now and fall back to page fault handling under mmap_loc=
k.
> > -      */
> > -     if (userfaultfd_armed(vma))
> > ++    if (unlikely(vma_is_anonymous(vma) && !vma_is_tcp(vma)))

Is the above extra '+' what compiler complains about?
Patches from Linus' tree remove some code from that function, so
applying them first should simplify the merge.

> >   657b5146955e ("mm: lock_vma_under_rcu() must check vma->anon_vma unde=
r vma lock")

> >  +            goto inval_end_read;
> >  +
> >       /* Check since vm_start/vm_end might change before we lock the VM=
A */
> >  -    if (unlikely(address < vma->vm_start || address >=3D vma->vm_end)=
) {
> >  -            vma_end_read(vma);
> >  -            goto inval;
> >  -    }
> >  +    if (unlikely(address < vma->vm_start || address >=3D vma->vm_end)=
)
> >  +            goto inval_end_read;
> >
> >       /* Check if the VMA got isolated after we found it */
> >       if (vma->detached) {
>
> Sorry, doesn't even build ... let me try that again.
>
> --
> Cheers,
> Stephen Rothwell
