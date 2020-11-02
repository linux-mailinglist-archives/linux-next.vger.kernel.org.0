Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634232A28AE
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 12:05:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgKBLFV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 06:05:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35911 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728239AbgKBLFV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 06:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604315119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=r+Q0QGef/Chloit35akJAvp2UK5y4+Yr2p6vISWEuwM=;
        b=K3mlqsA/dkP5D4qaZi6cjFjeil2ud2jZUJhbaka55N8L2QdIg/vDMuebea1xzE/5iJ3kHn
        GTJjxrU/uuFh7UT4H+xIalfgFoPptvzzgznfwZJ7ZDNIq8391qbNxKP8fPa9kTWxY0nLRV
        z51Lwgsz+zW0Jaefhrw3budLwDqAiMQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-meGiIuBnP4q8xLIXFOAMCQ-1; Mon, 02 Nov 2020 06:05:18 -0500
X-MC-Unique: meGiIuBnP4q8xLIXFOAMCQ-1
Received: by mail-wr1-f72.google.com with SMTP id 33so6241309wrf.22
        for <linux-next@vger.kernel.org>; Mon, 02 Nov 2020 03:05:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=r+Q0QGef/Chloit35akJAvp2UK5y4+Yr2p6vISWEuwM=;
        b=LVVMdxTxdZzO9DzwhRUdeU+lvVQLddK0EC7sStdGoltDdO1KvQQQ31WPENs480fRei
         OLvbNtAj8JV9Ig+kTmLPiW4DfD9Hr/DygxZKSu5Os4JS5ubY8sRNQGcxJiZxzTxPv7+i
         ifQtyxBwZLN6q9PFuIA3Njh+yiBzdPKXkhmsdWbDOFEJ1h+0y3uSzpSplvyvgpyZhnDz
         YlENK+u15Q1CnGBMyEPK84B1dd21w2HO1k7zOZ6lJeHj+vsSEgmQmjz1AZ+/nejSZYVz
         xoWkF+APc9zoqhIjMtMrZmwVLablGh0R6igYJvudQ8Kr/HYS2SeB/1zAgzNZI+73MqlK
         0Ohg==
X-Gm-Message-State: AOAM533n4PI7SCT90XIxFT6FR58+XubVWEwH8iMphCEsUaP1up2dJqXx
        IImCDIBAQaFLK+nS1jku4MGPCmeoM7iw9MTZVYveTrk448P6eRZlMRCPuCItCEOV1ETORh6tZVw
        gidiVuntSPoG65xp19xX/6g==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr12021240wma.48.1604315117045;
        Mon, 02 Nov 2020 03:05:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmEIqLJMyDiiIjNpv7lb80eabtXHYd5HB0MoVHivQmdUJd1PBVcw8MORSBRsifC7fHtfm/vg==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr12021212wma.48.1604315116864;
        Mon, 02 Nov 2020 03:05:16 -0800 (PST)
Received: from redhat.com (bzq-79-181-134-187.red.bezeqint.net. [79.181.134.187])
        by smtp.gmail.com with ESMTPSA id y4sm21531180wrp.74.2020.11.02.03.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 03:05:16 -0800 (PST)
Date:   Mon, 2 Nov 2020 06:05:12 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Christian K??nig <christian.koenig@amd.com>,
        Joerg Roedel <jroedel@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201102060422-mutt-send-email-mst@kernel.org>
References: <20201102124327.2f82b2a7@canb.auug.org.au>
 <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
 <20201102102711.GA28511@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102102711.GA28511@infradead.org>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 02, 2020 at 10:27:11AM +0000, Christoph Hellwig wrote:
> On Mon, Nov 02, 2020 at 10:28:34AM +0100, Daniel Vetter wrote:
> > > --- a/include/linux/swiotlb.h
> > > +++ b/include/linux/swiotlb.h
> > > @@ -5,6 +5,9 @@
> > >  #include <linux/dma-direction.h>
> > >  #include <linux/init.h>
> > >  #include <linux/types.h>
> > > +#ifndef CONFIG_SWIOTLB
> > > +#include <linux/limits.h>
> > > +#endif
> 
> No conditional includes please.  And the proper fix for the reported
> issue is to stop poking into swiotlb internals in random drivers..

Meaning?

