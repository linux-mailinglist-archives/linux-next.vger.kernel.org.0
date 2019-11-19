Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6855B102E20
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 22:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfKSVR4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 16:17:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:43000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726911AbfKSVRz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Nov 2019 16:17:55 -0500
Received: from paulmck-ThinkPad-P72.home (unknown [199.201.64.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02BCE2245F;
        Tue, 19 Nov 2019 21:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574198275;
        bh=zBB0gG7s7w7EHPTR1+9i6C+WQkP2VFc4jg7B+kLpJ3Q=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=HCoLX8+85dKCSjN+i505BLTozj6SdkZSXyclgcvdWxxPHteoesHkdcEfsXeseVEDa
         yc27cEKLvcbpHMRg7gKXWqTa9HR6+LORezFOI1KpZYl1G0qXGbe/YCYodWO/z74otI
         MJ+yz0G39YU6SRXDvLkVW67eChZV9Wt8BAfQ64u8=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 90BA83520FA7; Tue, 19 Nov 2019 13:17:54 -0800 (PST)
Date:   Tue, 19 Nov 2019 13:17:54 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Marco Elver <elver@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH -next] kcsan, ubsan: Make KCSAN+UBSAN work together
Message-ID: <20191119211754.GI2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191119194658.39af50d0@canb.auug.org.au>
 <e75be639-110a-c615-3ec7-a107318b7746@infradead.org>
 <CANpmjNMpnY54kDdGwOPOD84UDf=Fzqtu62ifTds2vZn4t4YigQ@mail.gmail.com>
 <fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org>
 <20191119183407.GA68739@google.com>
 <20191119185742.GB68739@google.com>
 <3b8e1707-4e46-560d-a1ea-22e336655ba6@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b8e1707-4e46-560d-a1ea-22e336655ba6@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 19, 2019 at 01:07:43PM -0800, Randy Dunlap wrote:
> On 11/19/19 10:57 AM, Marco Elver wrote:
> > Context:
> > http://lkml.kernel.org/r/fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org
> > 
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Marco Elver <elver@google.com>
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Applied, thank you both!

							Thanx, Paul

> Thanks.
> 
> > ---
> >  kernel/kcsan/Makefile | 1 +
> >  lib/Makefile          | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> > diff --git a/kernel/kcsan/Makefile b/kernel/kcsan/Makefile
> > index dd15b62ec0b5..df6b7799e492 100644
> > --- a/kernel/kcsan/Makefile
> > +++ b/kernel/kcsan/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  KCSAN_SANITIZE := n
> >  KCOV_INSTRUMENT := n
> > +UBSAN_SANITIZE := n
> >  
> >  CFLAGS_REMOVE_core.o = $(CC_FLAGS_FTRACE)
> >  
> > diff --git a/lib/Makefile b/lib/Makefile
> > index 778ab704e3ad..9d5bda950f5f 100644
> > --- a/lib/Makefile
> > +++ b/lib/Makefile
> > @@ -279,6 +279,7 @@ obj-$(CONFIG_UBSAN) += ubsan.o
> >  
> >  UBSAN_SANITIZE_ubsan.o := n
> >  KASAN_SANITIZE_ubsan.o := n
> > +KCSAN_SANITIZE_ubsan.o := n
> >  CFLAGS_ubsan.o := $(call cc-option, -fno-stack-protector) $(DISABLE_STACKLEAK_PLUGIN)
> >  
> >  obj-$(CONFIG_SBITMAP) += sbitmap.o
> > 
> 
> 
> -- 
> ~Randy
