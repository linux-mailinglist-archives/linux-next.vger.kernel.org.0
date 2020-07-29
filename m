Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9EB231C5A
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 11:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgG2Jzb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 05:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbgG2Jza (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 05:55:30 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6805C061794;
        Wed, 29 Jul 2020 02:55:30 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id k4so20246245oik.2;
        Wed, 29 Jul 2020 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E7erpnfbP9UW/PH4NnSfoZeY+/w2CdxSy9rFIVFRNZw=;
        b=X3Tpz0Ml4211y0EgfEepTuWScOzS31v5EVUVlXKb8olwLZ1tCn4QmmbGVBsluBqM36
         n8K8r63CMUd00feYm21azqMlTsAZhrFzVG6XQGuZ2ELkrK8qFxR4bpXM/EfLxLwZO6sn
         yR3L7jQGv2jrt2Vd4AtTeP1xSR8cniJRpDu3OyeCrkbIZDgwObOhS1UT8aUSclNWRSIn
         fau5A6NP8REwCxoF5lVotENxM1g0cxoXhSh0l4JGuO6GNpp1cvyRAxGkMyI/xqVz+YB6
         Y8FnG+M/BnABiRV36CRg+FRkvfjWNV3SekzcZ50hov8Lh4kXpC+cG4REsjXgOXjKqCNa
         JO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E7erpnfbP9UW/PH4NnSfoZeY+/w2CdxSy9rFIVFRNZw=;
        b=krgTHrv6aan0iwZmGsCrFM4f1DAC394ueTHd+u9fpaIrvvqXvm0IV1rwwdfHRZVmrr
         7Xh7B6sLGOGnsHmbbf0xNK0TuXDVB5nuKc67oF/myOwY1OGo58ggaRHCIr9wXFX+WV9i
         B7QFFb5vodJ3EhKmLkxCZLKz7EBtx95Ao4tWncLjA6RGolZc5SRR6lTtaxny0CzSIok1
         y9i8tGO6EtjxW/IJqokbOVKA5mSgQ1Wi/z9+Q/bmbPkLRVmPf4opamhjH+DeCQqyjUuk
         i87N+3KC811IAgXdCd+T2OnE5arTOynO8zNb2X+UHgZM8GsB5ITixFqkg57OCFg0+qsD
         Zd8w==
X-Gm-Message-State: AOAM531j022h9Eqt5PGeODZJUmGcMyQ7xS4ddpUJ9PE7QO3kSPIxtHD1
        9HsKjS6f54yuUKMnpQLnbuwbUgeWLjCgqlQ4lpJ/oLNa
X-Google-Smtp-Source: ABdhPJyYq4OAA2WzDvrnilNqWmUhqYkFI4Sk7Ft9ummr0yDDDAt5ED3rQ5g6xDPinkB+vDftpXh4I8m4RUUVk8DOoKg=
X-Received: by 2002:aca:a990:: with SMTP id s138mr7133132oie.154.1596016529937;
 Wed, 29 Jul 2020 02:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200727180831.6c356fc1@canb.auug.org.au> <20200727092448.GB1764157@kroah.com>
 <20200728173331.5bf1f438@canb.auug.org.au> <20200728075336.GB351768@kroah.com>
 <20200728182359.2b9b31bf@canb.auug.org.au> <20200728171705.GD43359@kroah.com> <20200728171913.GE43359@kroah.com>
In-Reply-To: <20200728171913.GE43359@kroah.com>
From:   Oded Gabbay <oded.gabbay@gmail.com>
Date:   Wed, 29 Jul 2020 12:55:00 +0300
Message-ID: <CAFCwf11_h8eC5B8Fod=LiJJ2vjaOrdNs3W+pHnK-YhM=jD-yeQ@mail.gmail.com>
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

Great, thanks!
Oded

On Tue, Jul 28, 2020 at 8:19 PM Greg KH <greg@kroah.com> wrote:
>
> On Tue, Jul 28, 2020 at 07:17:05PM +0200, Greg KH wrote:
> > On Tue, Jul 28, 2020 at 06:23:59PM +1000, Stephen Rothwell wrote:
> > > Hi Greg,
> > >
> > > On Tue, 28 Jul 2020 09:53:36 +0200 Greg KH <greg@kroah.com> wrote:
> > > >
> > > > On Tue, Jul 28, 2020 at 05:33:31PM +1000, Stephen Rothwell wrote:
> > > > > Hi Greg,
> > > > >
> > > > > On Mon, 27 Jul 2020 11:24:48 +0200 Greg KH <greg@kroah.com> wrote:
> > > > > >
> > > > > > On Mon, Jul 27, 2020 at 06:08:31PM +1000, Stephen Rothwell wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > After merging the char-misc tree, today's linux-next build (x86_64
> > > > > > > allmodconfig) failed like this:
> > > > > > >
> > > > > > > In file included from drivers/misc/habanalabs/goya/goya.c:8:
> > > > > > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> > > > > > >    12 | #include "habanalabs.h"
> > > > > > >       |          ^~~~~~~~~~~~~~
> > > > > > > In file included from drivers/misc/habanalabs/goya/goya_security.c:8:
> > > > > > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> > > > > > >    12 | #include "habanalabs.h"
> > > > > > >       |          ^~~~~~~~~~~~~~
> > > > > > >
> > > > > > > Presumably caused by commit
> > > > > > >
> > > > > > >   70b2f993ea4a ("habanalabs: create common folder")
> > > > > > >
> > > > > > > I have used the char-misc tree from next-20200724 for today.
> > > > > >
> > > > > > Ugh, this is a mess of a merge with this driver.
> > > > > >
> > > > > > Oded, I'll take Stephen's merge resolutions here and push out a new
> > > > > > version, and try to resolve this error, but if you could verify I got it
> > > > > > correct, that would be great.
> > > > >
> > > > > The conflicts are gone, but I still get these errors.
> > > >
> > > > Very odd, I can not duplicate this at all here.  I just did a clean
> > > > checkout of the char-misc-next branch and a full 'make allmodconfig' for
> > > > x86_64, and it worked just fine.
> > > >
> > > > Are you sure it's not coming from some other tree?
> > >
> > > Do you build with a separate object tree?  I always use make O=...
> > > which makes the difference.  I tested with just your tree.
> >
> > Ah, no, I do not.  Odd, let me see what kind of crazy they are doing
> > with include build directives...
> >
> > thanks for the hint.
>
> Ok, fix sent out, that should resolve this.
>
> thanks,
>
> greg k-h
