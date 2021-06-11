Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB623A4B02
	for <lists+linux-next@lfdr.de>; Sat, 12 Jun 2021 00:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbhFKWsx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Jun 2021 18:48:53 -0400
Received: from mail104.syd.optusnet.com.au ([211.29.132.246]:51773 "EHLO
        mail104.syd.optusnet.com.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229777AbhFKWsx (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Jun 2021 18:48:53 -0400
Received: from dread.disaster.area (pa49-179-138-183.pa.nsw.optusnet.com.au [49.179.138.183])
        by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 284F6862B88;
        Sat, 12 Jun 2021 08:46:38 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
        (envelope-from <david@fromorbit.com>)
        id 1lrpvC-00Bgjv-D7; Sat, 12 Jun 2021 08:46:38 +1000
Date:   Sat, 12 Jun 2021 08:46:38 +1000
From:   Dave Chinner <david@fromorbit.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dave Chinner <dchinner@redhat.com>,
        Chandan Babu R <chandanrlinux@gmail.com>,
        "Darrick J . Wong" <djwong@kernel.org>,
        Allison Henderson <allison.henderson@oracle.com>,
        Christoph Hellwig <hch@lst.de>, linux-xfs@vger.kernel.org,
        Linux-Next <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        noreply@ellerman.id.au
Subject: Re: [PATCH] xfs: Fix 64-bit division on 32-bit in
 xlog_state_switch_iclogs()
Message-ID: <20210611224638.GT664593@dread.disaster.area>
References: <20210610110001.2805317-1-geert@linux-m68k.org>
 <20210610220155.GQ664593@dread.disaster.area>
 <CAMuHMdWp3E3QDnbGDcTZsCiQNP3pLV2nXVmtOD7OEQO8P-9egQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWp3E3QDnbGDcTZsCiQNP3pLV2nXVmtOD7OEQO8P-9egQ@mail.gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=F8MpiZpN c=1 sm=1 tr=0
        a=MnllW2CieawZLw/OcHE/Ng==:117 a=MnllW2CieawZLw/OcHE/Ng==:17
        a=kj9zAlcOel0A:10 a=r6YtysWOX24A:10 a=7-415B0cAAAA:8 a=tBb2bbeoAAAA:8
        a=sw44Y3MIkDGLgX3rhVgA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
        a=Oj-tNtZlA1e06AYgeCfH:22
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 11, 2021 at 08:55:24AM +0200, Geert Uytterhoeven wrote:
> Hi Dave,
> 
> On Fri, Jun 11, 2021 at 12:02 AM Dave Chinner <david@fromorbit.com> wrote:
> > On Thu, Jun 10, 2021 at 01:00:01PM +0200, Geert Uytterhoeven wrote:
> > > On 32-bit (e.g. m68k):
> > >
> > >     ERROR: modpost: "__udivdi3" [fs/xfs/xfs.ko] undefined!
> > >
> > > Fix this by using a uint32_t intermediate, like before.
> > >
> > > Reported-by: noreply@ellerman.id.au
> > > Fixes: 7660a5b48fbef958 ("xfs: log stripe roundoff is a property of the log")
> > > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > > ---
> > > Compile-tested only.
> > > ---
> > >  fs/xfs/xfs_log.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > <sigh>
> >
> > 64 bit division on 32 bit platforms is still a problem in this day
> > and age?
> 
> They're not a problem.  But you should use the right operations from
> <linux/math64.h>, iff you really need these expensive operations.

See, that's the whole problem. This *isn't* obviously a 64 bit
division - BBTOB is shifting the variable down by 9 (bytes to blocks)
and then using that as the divisor.

The problem is that BBTOB has an internal cast to a 64 bit size,
and roundup() just blindly takes it and hence we get non-obvious
compile errors only on 32 bit platforms.

We have type checking macros for all sorts of generic functionality
- why haven't these generic macros that do division also have type
checking to catch this? i.e. so that when people build kernels on
64 bit machines find out that they've unwittingly broken 32 bit
builds the moment they use roundup() and/or friends incorrectly?

That would save a lot of extra work having fix crap like this up
after the fact...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
