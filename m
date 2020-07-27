Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B978322E8FB
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 11:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbgG0J2p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 05:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgG0J2o (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Jul 2020 05:28:44 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49351C061794;
        Mon, 27 Jul 2020 02:28:44 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id l84so1231505oig.10;
        Mon, 27 Jul 2020 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZJg7rUQPxCJO68OHx9bQfRbdAKaeax6Y3AUlWjJj0tk=;
        b=VNWPsY7EVxQ+M/2DB50xFQfaejUcZWxZpMi4qkl7zseIcKLWAZOo47Iwx7APalEdHL
         iuinUjzMwB7TBFiMGjoaYsc8Kewh8YgvwhaH94pn/bZPYCXqf+ALkq5gDNAtfnoUqH3r
         gIiMe9W6uzaAVimf+vx7tRQ0EKOWY46miy/zOJDh83u3VpWarVSMWNGuXTeBkR5KcrX7
         LEH27Qmkft43NQmaS0ffcN05JBT6li8mVVGC4LA+gOliixvfC5mKRh9LZoWdNIGy6lXt
         4/oUlGXPpgeFK4WU3zTfPFiUHVctUOZMfMYuojuS8K814bgfhQKsIU/a+doqNZMVde4B
         dy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZJg7rUQPxCJO68OHx9bQfRbdAKaeax6Y3AUlWjJj0tk=;
        b=QzvXGiWvN8UT0ii9NxuvjdPJv4ls0mgSeItGFsGYca0ieZPPbQtAVNGN126IJkm4Rw
         8QCJF+AfBCqCSZNXje1ZTNRbR+S2fh+4uqlPPbLiFIcse2GDwpnmmv9P7jTY6r6sxqYn
         YK0qphnp0igyTxVOKQ4bf/IwkwZ9qPRroFq3FlydYNRbg4bGRjSfABa+31AJM7CYfyQk
         yQvPg+t1JaFDGrkxPYdHHFOXfw5Y8r8SST6QC8iIUilxs4wgqhGp7Wp066rfaeY0ejIj
         Z3siBAds2wo2Okxsin8zKKD+JwGOyHfoXGIdC3mhY2IQjImxJx1ex1sJeRgBRweUMYaq
         kbDw==
X-Gm-Message-State: AOAM533acVjg1aQ6hBUVEzU5s08r2aELeVb0SyMaUwXzoZKdpJJRQqbP
        Aeg+25k+T3d4ACr9e9qdLAkMFORqt1bKUmKziuI=
X-Google-Smtp-Source: ABdhPJxjye1QxLOvJO/FqAaSdrTq7LPaIbsNyIODBPl7Skk5VhikxfcFNp3lCFfJ6uQT/K/ypVcVEEIKI9owGzwJrN8=
X-Received: by 2002:aca:cf15:: with SMTP id f21mr6552849oig.102.1595842123580;
 Mon, 27 Jul 2020 02:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200727180831.6c356fc1@canb.auug.org.au> <20200727092448.GB1764157@kroah.com>
In-Reply-To: <20200727092448.GB1764157@kroah.com>
From:   Oded Gabbay <oded.gabbay@gmail.com>
Date:   Mon, 27 Jul 2020 12:28:14 +0300
Message-ID: <CAFCwf13o6A_88xBZdTk+XamAULckKB3Wk8A-V8NmmvkXDwB60w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the char-misc tree
To:     Greg KH <greg@kroah.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Omer Shpigelman <oshpigelman@habana.ai>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 27, 2020 at 12:24 PM Greg KH <greg@kroah.com> wrote:
>
> On Mon, Jul 27, 2020 at 06:08:31PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the char-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >
> > In file included from drivers/misc/habanalabs/goya/goya.c:8:
> > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> >    12 | #include "habanalabs.h"
> >       |          ^~~~~~~~~~~~~~
> > In file included from drivers/misc/habanalabs/goya/goya_security.c:8:
> > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> >    12 | #include "habanalabs.h"
> >       |          ^~~~~~~~~~~~~~
> >
> > Presumably caused by commit
> >
> >   70b2f993ea4a ("habanalabs: create common folder")
> >
> > I have used the char-misc tree from next-20200724 for today.
>
> Ugh, this is a mess of a merge with this driver.
>
> Oded, I'll take Stephen's merge resolutions here and push out a new
> version, and try to resolve this error, but if you could verify I got it
> correct, that would be great.
>
> thanks,
>
> greg k-h

Sure, np. Just point me where to look.
Oded
