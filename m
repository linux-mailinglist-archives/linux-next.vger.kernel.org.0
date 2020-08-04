Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0826523B767
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 11:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728629AbgHDJPc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 05:15:32 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50275 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726844AbgHDJPc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 4 Aug 2020 05:15:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596532530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H8QXz7fnC1FbuJmyzQuqpkIxFUX+YqGk4KEmRvjwdmI=;
        b=RivW6jUk+weSOtUKcvDeTiV5sEqU0u57cSzyVCymme0mLVJBZnh1spWkH599mWxgERQIin
        Oxd1eB+Eeu/St9hdCrnCihnL6vyxxH591e92ymxiPcpfAdtObPfVFrVbv3wMgT/PnK4PC6
        74bRDgwhRSKpMDj5HjMeI35CQDPa+xg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-LapTLwfeN0OiVMHpr6F2zA-1; Tue, 04 Aug 2020 05:15:29 -0400
X-MC-Unique: LapTLwfeN0OiVMHpr6F2zA-1
Received: by mail-qv1-f69.google.com with SMTP id d30so8195921qve.5
        for <linux-next@vger.kernel.org>; Tue, 04 Aug 2020 02:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H8QXz7fnC1FbuJmyzQuqpkIxFUX+YqGk4KEmRvjwdmI=;
        b=g3wtWQiKkMy8yBoJ1Ncck12qXZOBg0Dy5z3EBGbbejVuo830tU6sUIoeQXwvZgoExF
         iOQZv/JvRnyrtlYYxGQN9/HK6PPwE7l4+l0o0VUDheXmaStFzm06bI83nanvurqKIUDD
         3wa7unnph9ajLTnQgyD5swk4PJWeX0fwuCYR82qR+nkBtIQvOi8yKqlPTcFTDzIxuRkI
         1MeuFjfazwqdQl6YzJDgyTrb4/tuV/D11+vOf0c+jKGJ4bWVIC3G4au0ripD2gBKtajZ
         LXfbgLqDRivL47Rwkci/qHKnnGENYvRTlP33MYF7O3261bqlglyvVevTE5MLcslTOSCT
         fUag==
X-Gm-Message-State: AOAM533KMmRkVsyUajUyInBHa3yAc2LFZigh2bo5409/BJqYzxS+2sK/
        CkXkmPExtXXX8ZefGOrtqZXi+WmM9bBB36C7QZpTMxBTc+55B7pCsOMSEhzUR+tZra2uyPCcxgw
        /2qVxF12S548xqWJZOqn+MQ==
X-Received: by 2002:ac8:387b:: with SMTP id r56mr20997837qtb.353.1596532528379;
        Tue, 04 Aug 2020 02:15:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSsFMJ3ogES9JB6qeeEOcrOVPHbbmxVdfVmbi9Q/EzOEODdga5bCKDv5Yb/1HR6/0FQgXS+A==
X-Received: by 2002:ac8:387b:: with SMTP id r56mr20997825qtb.353.1596532528169;
        Tue, 04 Aug 2020 02:15:28 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net. [79.177.102.128])
        by smtp.gmail.com with ESMTPSA id 141sm17034212qke.41.2020.08.04.02.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2020 02:15:27 -0700 (PDT)
Date:   Tue, 4 Aug 2020 05:15:22 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20200804051448-mutt-send-email-mst@kernel.org>
References: <20200804151117.232dfef4@canb.auug.org.au>
 <20200804054758.GA17220@ubuntu>
 <20200804070439.GB17220@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804070439.GB17220@ubuntu>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 04, 2020 at 09:04:40AM +0200, Guennadi Liakhovetski wrote:
> Michael, looks like something went wrong with your merge? My patch 
> https://lore.kernel.org/r/20200722150927.15587-3-guennadi.liakhovetski@linux.intel.com 
> has the header, your merged commit 
> https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/commit/?h=vhost&id=bba6f4f52c31af1ce4ebcc063afa08eb063b3d2c
> doesn't have it?
> 
> Thanks
> Guennadi

My bad: patch was based on a hash I did not have in my tree
so git am failed, I use patch and forgot git add.

> On Tue, Aug 04, 2020 at 07:47:58AM +0200, Guennadi Liakhovetski wrote:
> > Hi Stephen,
> > 
> > On Tue, Aug 04, 2020 at 03:11:17PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > After merging the vhost tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > > 
> > > drivers/rpmsg/virtio_rpmsg_bus.c:28:10: fatal error: linux/virtio_rpmsg.h: No such file or directory
> > >    28 | #include <linux/virtio_rpmsg.h>
> > >       |          ^~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > Caused by commit
> > > 
> > >   bba6f4f52c31 ("rpmsg: move common structures and defines to headers")
> > > 
> > > I have used the vhost tree from next-20200803 for today.
> > 
> > Yes, I've seen that, that's a clang build for MIPS... I'll have a look.
> > 
> > Thanks
> > Guennadi
> > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell

