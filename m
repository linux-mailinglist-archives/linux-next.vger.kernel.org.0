Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79881131A19
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2020 22:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgAFVIt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 16:08:49 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:42494 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbgAFVIt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Jan 2020 16:08:49 -0500
Received: by mail-io1-f66.google.com with SMTP id n11so43364664iom.9
        for <linux-next@vger.kernel.org>; Mon, 06 Jan 2020 13:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+eDaek1Ee2kg6Q/8/vv1VdmBerDSTO12+og01hxQgik=;
        b=Jcsh8ybJzR/aCasR9itoZGejP1nwOseFFdufy4+4p0LptMZz5JfxbDs3ROrT3Vd7YE
         lLJyXvyBjGlYLh1Fh3lfvUhLMe326DdxOC5y5Z3slArusvo/HIsq+XEM3J6FtRL2+0O+
         9qylXim4vo6cWM7cI5iwZWdRJkDYma3erAQXiPhu6P0ZW3wFK2fGc5K9wp6KrUygonDO
         VsZzfS1jFubkEATjEFAVIbrAkCrtrcka/QbgwmSdW6R6Jc3gl4UwVayTFnx6PHrePkpR
         q82mrzaSFtFR4eTmwLpoQ2Ea9uP3y+ieYWos79WVthxudoKtk+bSFYOfa49GoSv5XktD
         6JZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+eDaek1Ee2kg6Q/8/vv1VdmBerDSTO12+og01hxQgik=;
        b=rleASr1ptX7HwhmftTDhyeGHu1zsY1XDZwSt8SQRcLgp5W4G+CenfUGSHoPaFQoumb
         O7IopqfsJODYV9iutVfMjvJrGF0iQ3zQwm5iUG++1n0wjW9rh5zGYs5TRVgCHLOB3k2t
         5UbgZbK59boNvLOJDKrKKzJ9vsceW7rd5ePLLL7ThgYzBZidTBbDoNSMT4P5WrtlPfeI
         0qrUfhbQ5N7saXIdocEnvUTj+Me8S31c4kKHAdqybXjFMmxWvttG5zbl1vQ2RHjY6YBk
         nay5ZhOClMJBPWnjsx4DfavZGJWltQy5xMuMmqUe6NUmK1vRPVRkw4EtBhrhI+c+X0EN
         l0WA==
X-Gm-Message-State: APjAAAWfyeyDC/YMVjl27+EHkWfmZ7tmqwBTji8QP6AUg0Kj+EZ+OZPT
        26powRyztbONzltwNOhszXDJPaL3oDwdpIGLo7FuEw==
X-Google-Smtp-Source: APXvYqxbh2lqXLU6Um5AJwW6TpNl2yNRIlMcGFgaeFa3N4xZyVae2eOduhaeZDcZIFaGUdyQH4RtgQzfDUFCF6RsTZo=
X-Received: by 2002:a5e:9907:: with SMTP id t7mr70465866ioj.72.1578344928641;
 Mon, 06 Jan 2020 13:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20191212160622.021517d3@canb.auug.org.au> <CAOesGMiabP7nAPYKrmP=j_8bSj-UfUSFoiD0W+kqzaBp-6J2hQ@mail.gmail.com>
 <20200106181006.GL13449@paulmck-ThinkPad-P72>
In-Reply-To: <20200106181006.GL13449@paulmck-ThinkPad-P72>
From:   Olof Johansson <olof@lixom.net>
Date:   Mon, 6 Jan 2020 13:08:37 -0800
Message-ID: <CAOesGMjTbrtVTU6ootOrOifKLqY_D0bstgqBKGriE9pVkNcPOQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the rcu tree
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 6, 2020 at 10:10 AM Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Mon, Jan 06, 2020 at 09:51:47AM -0800, Olof Johansson wrote:
> > Hi,
> >
> > On Wed, Dec 11, 2019 at 9:06 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the rcu (I think) tree, today's linux-next build (x86_64
> > > allnoconfig) produced this warning:
> > >
> > > kernel/time/timer.c: In function 'schedule_timeout':
> > > kernel/time/timer.c:969:20: warning: 'timer.expires' may be used uninitialized in this function [-Wmaybe-uninitialized]
> > >   969 |   long diff = timer->expires - expires;
> > >       |               ~~~~~^~~~~~~~~
> > >
> > > Introduced by (bisected to) commit
> > >
> > >   c4127fce1d02 ("timer: Use hlist_unhashed_lockless() in timer_pending()")
> > >
> > > x86_64-linux-gnu-gcc (Debian 9.2.1-21) 9.2.1 20191130
> >
> > This is still there as of last night's -next. Any update on getting a
> > fix queued together with the offending patch?
>
> Hello, Olof,
>
> Thank you, I had indeed lost track of this one.  :-/
>
> Does Eric's patch fix things for you?
>
> https://lore.kernel.org/lkml/CANn89i+xomdo4HFqewrfNf_Z4Q5ayXuW6A4SjSkE46JXP9KuFw@mail.gmail.com/

It does, but it's not a proper patch (whitespace damage, no S-o-b, etc).


-Olof
