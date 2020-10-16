Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3891290C64
	for <lists+linux-next@lfdr.de>; Fri, 16 Oct 2020 21:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411096AbgJPTov (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Oct 2020 15:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405786AbgJPTou (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Oct 2020 15:44:50 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431EDC0613D3
        for <linux-next@vger.kernel.org>; Fri, 16 Oct 2020 12:44:48 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id p25so2081699vsq.4
        for <linux-next@vger.kernel.org>; Fri, 16 Oct 2020 12:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yRBOPQbN5dYhnvrLr9PYIKh/r7keyLtfCsfZgAWbDAY=;
        b=lWyAZXcjg24uQCaK+mc5h2Cm4Ik2gWrdbgU8YGrpjwN5Da/R2Sdwsl+gOca4joaTAA
         B+8WUwK+LckyAp1ViPfR7JczNVu3/5xE95YaaFLSIPBjlm1yhuPrDMThA3lTE6n4iVtE
         ZApwQg/thvmFfYtxaf17wTERKwnbLGflalqBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yRBOPQbN5dYhnvrLr9PYIKh/r7keyLtfCsfZgAWbDAY=;
        b=IsnAkQTrmeIutqYqMBbdtvXdB0zucrQSsIO4tYLxiiFXvvhOZtEiAMGGNBTZvvsGVL
         yn/giPx5DGPi0LIq3jad3NkyTTVS3AKlyaIxDa5spD1JzoJ6MTfzHanCPLYC0SXNt2bf
         o2NoWZOHIx50Z0NbpPTERfZqDoCyvjVve6ve8vJSvRczDI5BVoQyQ6IXbIQzDycHV3Fk
         rOgHaH9PK1n07a1CpCeOfZSDYoGSiPSUQMGyC+Coz25d6pgJwtcuL5lGtvU/g+/oyA68
         m2taKpuP4QaftuR33lIFba3dNWK9f4zcv0xMY0LXTuX3WAKVWrn+Tqwb9cXfDfN2o3UI
         BKZQ==
X-Gm-Message-State: AOAM532FdqUHBhmYbzZLRSQY/cSXC70y1vkLqtOkiJ8yUZzxO3UJtIPQ
        3i1kfDQGAMqQQz24k2Df4Lk1Mu1KLi5LUG7Bv8PH9g==
X-Google-Smtp-Source: ABdhPJz7JthFresIp4ZMmQ8zArHq2v2ngIrcX9HSohpE8S+a2uHuWpG3PfczgPBpEj5CLhCXBtN5LPzwar/wseymz04=
X-Received: by 2002:a67:3241:: with SMTP id y62mr3559776vsy.47.1602877487310;
 Fri, 16 Oct 2020 12:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200908200950.1368e71b@canb.auug.org.au> <23624101c03e9f60e66bac5c9739769931968c32.camel@intel.com>
In-Reply-To: <23624101c03e9f60e66bac5c9739769931968c32.camel@intel.com>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Fri, 16 Oct 2020 21:44:36 +0200
Message-ID: <CAJfpegsFb6SB74ezwqD=5YUw_8XaREm1q88ontkpWzQ+9V0OxQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
To:     "Williams, Dan J" <dan.j.williams@intel.com>
Cc:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "jgross@suse.com" <jgross@suse.com>,
        "bo.liu@linux.alibaba.com" <bo.liu@linux.alibaba.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "stefanha@redhat.com" <stefanha@redhat.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "vgoyal@redhat.com" <vgoyal@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dgilbert@redhat.com" <dgilbert@redhat.com>,
        "Boeuf, Sebastien" <sebastien.boeuf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 24, 2020 at 3:40 AM Williams, Dan J
<dan.j.williams@intel.com> wrote:
>
> On Tue, 2020-09-08 at 20:09 +1000, Stephen Rothwell wrote:

[...]

> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 8 Sep 2020 20:00:20 +1000
> > Subject: [PATCH] merge fix up for "mm/memremap_pages: convert to
> > 'struct
> >  range'"
> >
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  drivers/xen/unpopulated-alloc.c | 15 +++++++++------
> >  fs/fuse/virtio_fs.c             |  3 +--
> >  2 files changed, 10 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/xen/unpopulated-alloc.c
> > b/drivers/xen/unpopulated-alloc.c
> > index 3b98dc921426..9fa7ce330628 100644
> > --- a/drivers/xen/unpopulated-alloc.c
> > +++ b/drivers/xen/unpopulated-alloc.c
> > @@ -18,6 +18,7 @@ static unsigned int list_count;
> >  static int fill_list(unsigned int nr_pages)
> >  {
> >       struct dev_pagemap *pgmap;
> > +     struct resource res;
> >       void *vaddr;
> >       unsigned int i, alloc_pages = round_up(nr_pages,
> > PAGES_PER_SECTION);
> >       int ret;
> > @@ -27,10 +28,10 @@ static int fill_list(unsigned int nr_pages)
> >               return -ENOMEM;
> >
> >       pgmap->type = MEMORY_DEVICE_GENERIC;
> > -     pgmap->res.name = "Xen scratch";
> > -     pgmap->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
>
> This is broken... it needs to be converted to 'struct range'. I'll take
> care of that when I respin the series. Sorry for the thrash it seems
> this is a new memremap_pages() user since the conversion patches
> landed.

Hi Dan,

I'd like to send this upstream and this conflict needs to be dealt
with some way or another.   Can you send the correct fixup against

git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git#for-next

?

Thanks,
Miklos
