Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8B5D23B555
	for <lists+linux-next@lfdr.de>; Tue,  4 Aug 2020 09:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgHDHEn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 4 Aug 2020 03:04:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:3049 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725300AbgHDHEn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 4 Aug 2020 03:04:43 -0400
IronPort-SDR: uV+asw/lHNxmzRg84ubXi1MYmAWmBt5gRAklKl43YTHafIUo9cJh2N86sJGAB7Q3tfVwqm2Dd2
 5Mfe6NmTKd1w==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="216659870"
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="216659870"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2020 00:04:42 -0700
IronPort-SDR: BEzCxMTEOWI2KWxgMhdy8+D9VZxAoT4EjR775AH2lYTG98ChrEBmBxaU4mynWZHK0U7YVrmP7W
 BNfRh1+y3ROA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; 
   d="scan'208";a="324532983"
Received: from ekonks-mobl.ccr.corp.intel.com (HELO ubuntu) ([10.252.37.210])
  by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2020 00:04:41 -0700
Date:   Tue, 4 Aug 2020 09:04:40 +0200
From:   Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the vhost tree
Message-ID: <20200804070439.GB17220@ubuntu>
References: <20200804151117.232dfef4@canb.auug.org.au>
 <20200804054758.GA17220@ubuntu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200804054758.GA17220@ubuntu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Michael, looks like something went wrong with your merge? My patch 
https://lore.kernel.org/r/20200722150927.15587-3-guennadi.liakhovetski@linux.intel.com 
has the header, your merged commit 
https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git/commit/?h=vhost&id=bba6f4f52c31af1ce4ebcc063afa08eb063b3d2c
doesn't have it?

Thanks
Guennadi

On Tue, Aug 04, 2020 at 07:47:58AM +0200, Guennadi Liakhovetski wrote:
> Hi Stephen,
> 
> On Tue, Aug 04, 2020 at 03:11:17PM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the vhost tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > drivers/rpmsg/virtio_rpmsg_bus.c:28:10: fatal error: linux/virtio_rpmsg.h: No such file or directory
> >    28 | #include <linux/virtio_rpmsg.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~~
> > 
> > Caused by commit
> > 
> >   bba6f4f52c31 ("rpmsg: move common structures and defines to headers")
> > 
> > I have used the vhost tree from next-20200803 for today.
> 
> Yes, I've seen that, that's a clang build for MIPS... I'll have a look.
> 
> Thanks
> Guennadi
> 
> > -- 
> > Cheers,
> > Stephen Rothwell
