Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEC414ABB8
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2020 22:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgA0Vji (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 16:39:38 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33781 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgA0Vji (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jan 2020 16:39:38 -0500
Received: by mail-ot1-f67.google.com with SMTP id b18so9996572otp.0;
        Mon, 27 Jan 2020 13:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=emATBRbaUsYnGzrnrWbUfoRnXZ/zt1eiX/9E0bH5l+0=;
        b=T1w+sMLT0SEgmbEGn5GrSas3493ob7c9cbaw0ucQlBvGfCOV7RD1OyShezg8ClKBJ4
         hXnCoMGCx8q/M8IYmBXJyxOhhdXMTbQerBPuBIqB5yoBIP49lNI+LkJsORsvvkc+EVhE
         db/iijZthEE/MEnq4zcctQD8dqen9J9yl6dEHhruVqGkaVcyK+oZYjUHO/WDIWnxBOic
         alI1gZLmXt5t1MIRgSxzddE5XvV6YamJEGZ9wB6om5tWIKsf2HFWtHLmXFVgz3wLArtn
         ZQ30rhnGpqdeivFndEfZewC8+9mKRoDePWPtvKdnCkgF6eZu5kCkPtRBTFULBCMFIxQo
         U+FQ==
X-Gm-Message-State: APjAAAVUXtAAq+E9yKIgYHL4YMkWuW6f2GIHAcglO9KGHuGuMsLWkrfT
        lOHqtWrN1HPO+HWEA2yRgNSvsYNzsUQGVtTZBc8=
X-Google-Smtp-Source: APXvYqxFa1UtWtyjRF3EQiTAjTCqvdldmiC9GZPMzwr5pDulk3WxtW2FMWKnbfesUT1eYkMBNrHPZ5F7D1quQs8gtfg=
X-Received: by 2002:a9d:8f1:: with SMTP id 104mr13258704otf.107.1580161177379;
 Mon, 27 Jan 2020 13:39:37 -0800 (PST)
MIME-Version: 1.0
References: <20200113095037.156597ff@canb.auug.org.au> <20200128074942.74ae0eaf@canb.auug.org.au>
In-Reply-To: <20200128074942.74ae0eaf@canb.auug.org.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Jan 2020 22:39:26 +0100
Message-ID: <CAMuHMdVRvvmHOCx=pqMJqxS0eHaSA+w0NJdZdfz7Rak_6rBKvA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the vfs tree with the m68k tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kars de Jong <jongk@linux-m68k.org>,
        Aleksa Sarai <cyphar@cyphar.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Jan 27, 2020 at 9:49 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Mon, 13 Jan 2020 09:50:37 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Today's linux-next merge of the vfs tree got a conflict in:
> >
> >   arch/m68k/kernel/syscalls/syscall.tbl
> >
> > between commit:
> >
> >   e8bb2a2a1d51 ("m68k: Wire up clone3() syscall")
> >
> > from the m68k tree and commit:
> >
> >   0a51692d49ec ("open: introduce openat2(2) syscall")
> >
> > from the vfs tree.
> >
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell
> >
> > diff --cc arch/m68k/kernel/syscalls/syscall.tbl
> > index a00a5d0db602,2559925f1924..000000000000
> > --- a/arch/m68k/kernel/syscalls/syscall.tbl
> > +++ b/arch/m68k/kernel/syscalls/syscall.tbl
> > @@@ -434,4 -434,5 +434,5 @@@
> >   432 common  fsmount                         sys_fsmount
> >   433 common  fspick                          sys_fspick
> >   434 common  pidfd_open                      sys_pidfd_open
> >  -# 435 reserved for clone3
> >  +435 common  clone3                          __sys_clone3
> > + 437 common  openat2                         sys_openat2
>
> This is now a conflict between the vfs tree and Linus' tree - just a
> reminder for pull requests.

Thanks, I completely forgot about these conflicts.
Fortunately I always send my pull requests early ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
