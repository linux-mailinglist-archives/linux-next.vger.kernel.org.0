Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D79E2A2838
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 11:28:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728132AbgKBK21 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 05:28:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgKBK21 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 05:28:27 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBEAC061A04
        for <linux-next@vger.kernel.org>; Mon,  2 Nov 2020 02:28:26 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id c80so2674831oib.2
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2020 02:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Z8GQ3+dlPgWj8N6iGHuphE6RpytAvFZo39Sbtwdhws=;
        b=EzwfEuuEwGYTUTjIasAnUKUIVmBIxn7qJYQhUc2GVEKajha3SO3J3d/VjzMgnwV94F
         V1xFvThPUl79p5+V+oEa5uZ2gpuitZ5MzSvlI5wHu8TwB48Z8uCSz1bX+J83hOAQl2Mc
         ybmPexJOB3IDKeTvAmmWQSMGJBSZzm4EiWwGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Z8GQ3+dlPgWj8N6iGHuphE6RpytAvFZo39Sbtwdhws=;
        b=TF5VbOf5cRY7zoQtS0AhVTodD/xrNjf/WMu/mkvCVCXBQdJX0oqDHQJR6nuyAFiEbr
         gTcHuYtx9lfjYZEfbMS8Xic5gH5DwpAB4AO8NQqc9QSSIBegrFPs5p43T3q2BDb6CEju
         tOIwGXYp4ibP2l4NjjS882sMW06ynnOlM45r40/I/j0tCr2e6wjOf9iXHy+oUAFln3yb
         2HNsflL0S0INhHEEySrP9YYr/nWRKhalkqdbqQIf9OjTdiZZXsYoo7vAnv4EgKvl4wvm
         xHt2Afpp4ZN4IGZkAMj0aa4+wxsGSoCWtIQwNCHoc4ApqoVL2GR7zlOxi1AC6DpjKacs
         TzGw==
X-Gm-Message-State: AOAM5328RbEkNOZB7Y0SIjwWRl7kLqAuY/a3LEwjkUKhHdTh9hB37Ygd
        ETj/k2M8t69s0QcZyo2CWOds2+dw14Lnyu8YnOM6W7G7HRulKQ==
X-Google-Smtp-Source: ABdhPJxtPz32ksTu7x/wIQLWRExfPZVZ9cFoMP8T8mP3YC5ZyI58He8otzTX9cJ+0Sx2RumLcBUlS7qWt0oefuIvIy0=
X-Received: by 2002:aca:b141:: with SMTP id a62mr8909832oif.101.1604312906398;
 Mon, 02 Nov 2020 02:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20201102124327.2f82b2a7@canb.auug.org.au> <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
 <20201102052254-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201102052254-mutt-send-email-mst@kernel.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Mon, 2 Nov 2020 11:28:15 +0100
Message-ID: <CAKMK7uFKRHnYFYw19b-iQHfzQisqn0Zms+1+bxVa6CSbExTP8w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@infradead.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Joerg Roedel <jroedel@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 2, 2020 at 11:23 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Nov 02, 2020 at 10:28:34AM +0100, Daniel Vetter wrote:
> > On Mon, Nov 2, 2020 at 2:43 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the drm-misc tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >
> > > In file included from drivers/gpu/drm/nouveau/nouveau_ttm.c:26:
> > > include/linux/swiotlb.h: In function 'swiotlb_max_mapping_size':
> > > include/linux/swiotlb.h:99:9: error: 'SIZE_MAX' undeclared (first use in this function)
> > >    99 |  return SIZE_MAX;
> > >       |         ^~~~~~~~
> > > include/linux/swiotlb.h:7:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
> > >     6 | #include <linux/init.h>
> > >   +++ |+#include <stdint.h>
> > >     7 | #include <linux/types.h>
> > > include/linux/swiotlb.h:99:9: note: each undeclared identifier is reported only once for each function it appears in
> > >    99 |  return SIZE_MAX;
> > >       |         ^~~~~~~~
> > >
> > > Caused by commit
> > >
> > >   abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> > >
> > > but only exposed by commit
> > >
> > >   4dbafbd30aef ("drm/nouveu: fix swiotlb include")
> > >
> > > I applied the following fix for today:
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Mon, 2 Nov 2020 12:34:57 +1100
> > > Subject: [PATCH] swiotlb: using SIZE_MAX needs limits.h included
> > >
> > > Fixes: abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >
> > I think simplest if this lands through dma-api tree into current -rc
> > kernels. Or should we just put this into drm-misc-next since that's
> > where the problem shows up? Christoph, any preference from dma-api
> > side?
> > -Daniel
>
>
> Or I can merge it since I merged the original patch causing the
> issue ...

Works for me too.
-Daniel
>
> > > ---
> > >  include/linux/swiotlb.h | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > > index 513913ff7486..ed9de7855d3b 100644
> > > --- a/include/linux/swiotlb.h
> > > +++ b/include/linux/swiotlb.h
> > > @@ -5,6 +5,9 @@
> > >  #include <linux/dma-direction.h>
> > >  #include <linux/init.h>
> > >  #include <linux/types.h>
> > > +#ifndef CONFIG_SWIOTLB
> > > +#include <linux/limits.h>
> > > +#endif
> > >
> > >  struct device;
> > >  struct page;
> > > --
> > > 2.28.0
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
