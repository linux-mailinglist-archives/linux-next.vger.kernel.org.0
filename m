Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 862F12A2828
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 11:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgKBKXp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 05:23:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53820 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728316AbgKBKXo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 05:23:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604312623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Wp9LWIdQQeaVWYBrapN4RJch0BVmepD/23UqIg4kz2Q=;
        b=N5pyokfibvJ10Oon/5gPH5FD3eyWGD97+iQvkfdzQo9T9BT2P6PNeIcd/1PCf6M1eSErP/
        OBrNWQ9JW/mi23R137tHQm0MRmCOT8oazAfbNZXi2fZbXwkQ33BdTcVdsXP4Ty4G4AdLa9
        FDch3oDOkT+HMZTH2EhAdyxPh8ii34g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-xJ7xdLL6N42u5pyxyVpkwg-1; Mon, 02 Nov 2020 05:23:39 -0500
X-MC-Unique: xJ7xdLL6N42u5pyxyVpkwg-1
Received: by mail-wr1-f72.google.com with SMTP id 31so6235798wrg.12
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2020 02:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wp9LWIdQQeaVWYBrapN4RJch0BVmepD/23UqIg4kz2Q=;
        b=gEVoC+MabvVgwqugN27nD4Owas4BJ0HgGTNtz3ZIRhPZZ0d5VRvt2koSk+1JTbkLcz
         tt8QYcL5EkK4BxnSJxfLGZxhv679DUrhOVxWewYt/W2hI4/VfMK3VjQz9TiivTuGVzGK
         jRt+Ud/1yUePPsWpWVHeT1ja26XGuiHWM8b4yU4bzTKN4NnzVDP08OkTM/FuFtEAeHFF
         +1zzu+eqHzih6gSC76CMP6cQWGAFba/25+d5o+PCWoFHKAiw7jhLqKIn2zKD6yMWIETM
         iHfkeJp6v+2jHEtkGzzfU8iutVwj3yLvQobJATyrbpBY44cDCuaK0mC1BBqxcojkYqBj
         a2qg==
X-Gm-Message-State: AOAM5338VVUoEoxyvnJzaAAC/MQGEh8AYod2081DfEGHad05ebGSXdVe
        /OnDp+WU/Edkny8FLR/m3lgT7hWMWxkjZ/Gim8W8KJs321yypSbD0ExQLOm7xnQiX1WVli/CJ+i
        IAo3ENLRdH8P76a697KLIlw==
X-Received: by 2002:a05:6000:18f:: with SMTP id p15mr12460074wrx.185.1604312618488;
        Mon, 02 Nov 2020 02:23:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznFGNmmLYGwZJwr0mGaJjbUUa+GHkURX7Blm6FFeB1v9AnrgQ4pPjIhkgBVh1ilzBqxxD+OQ==
X-Received: by 2002:a05:6000:18f:: with SMTP id p15mr12460054wrx.185.1604312618293;
        Mon, 02 Nov 2020 02:23:38 -0800 (PST)
Received: from redhat.com (bzq-79-182-97-190.red.bezeqint.net. [79.182.97.190])
        by smtp.gmail.com with ESMTPSA id z15sm20847366wrq.24.2020.11.02.02.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 02:23:37 -0800 (PST)
Date:   Mon, 2 Nov 2020 05:23:28 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Christoph Hellwig <hch@infradead.org>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Joerg Roedel <jroedel@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201102052254-mutt-send-email-mst@kernel.org>
References: <20201102124327.2f82b2a7@canb.auug.org.au>
 <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 02, 2020 at 10:28:34AM +0100, Daniel Vetter wrote:
> On Mon, Nov 2, 2020 at 2:43 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the drm-misc tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > In file included from drivers/gpu/drm/nouveau/nouveau_ttm.c:26:
> > include/linux/swiotlb.h: In function 'swiotlb_max_mapping_size':
> > include/linux/swiotlb.h:99:9: error: 'SIZE_MAX' undeclared (first use in this function)
> >    99 |  return SIZE_MAX;
> >       |         ^~~~~~~~
> > include/linux/swiotlb.h:7:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
> >     6 | #include <linux/init.h>
> >   +++ |+#include <stdint.h>
> >     7 | #include <linux/types.h>
> > include/linux/swiotlb.h:99:9: note: each undeclared identifier is reported only once for each function it appears in
> >    99 |  return SIZE_MAX;
> >       |         ^~~~~~~~
> >
> > Caused by commit
> >
> >   abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> >
> > but only exposed by commit
> >
> >   4dbafbd30aef ("drm/nouveu: fix swiotlb include")
> >
> > I applied the following fix for today:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 2 Nov 2020 12:34:57 +1100
> > Subject: [PATCH] swiotlb: using SIZE_MAX needs limits.h included
> >
> > Fixes: abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> I think simplest if this lands through dma-api tree into current -rc
> kernels. Or should we just put this into drm-misc-next since that's
> where the problem shows up? Christoph, any preference from dma-api
> side?
> -Daniel


Or I can merge it since I merged the original patch causing the
issue ...

> > ---
> >  include/linux/swiotlb.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 513913ff7486..ed9de7855d3b 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -5,6 +5,9 @@
> >  #include <linux/dma-direction.h>
> >  #include <linux/init.h>
> >  #include <linux/types.h>
> > +#ifndef CONFIG_SWIOTLB
> > +#include <linux/limits.h>
> > +#endif
> >
> >  struct device;
> >  struct page;
> > --
> > 2.28.0
> >
> > --
> > Cheers,
> > Stephen Rothwell
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

