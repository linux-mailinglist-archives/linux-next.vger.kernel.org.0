Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB86DE8068
	for <lists+linux-next@lfdr.de>; Tue, 29 Oct 2019 07:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730425AbfJ2Gc2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 29 Oct 2019 02:32:28 -0400
Received: from verein.lst.de ([213.95.11.211]:38162 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730227AbfJ2Gc2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 29 Oct 2019 02:32:28 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2D0D868B05; Tue, 29 Oct 2019 07:32:25 +0100 (CET)
Date:   Tue, 29 Oct 2019 07:32:24 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>,
        "Darrick J. Wong" <darrick.wong@oracle.com>,
        David Chinner <david@fromorbit.com>, linux-xfs@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the xfs tree
Message-ID: <20191029063224.GA17179@lst.de>
References: <20191029101151.54807d2f@canb.auug.org.au> <20191028231806.GA15222@magnolia> <20191029055605.GA16630@lst.de> <20191029172351.40eae30d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029172351.40eae30d@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 29, 2019 at 05:23:51PM +1100, Stephen Rothwell wrote:
> Hi Christoph,
> 
> On Tue, 29 Oct 2019 06:56:05 +0100 Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Mon, Oct 28, 2019 at 04:18:06PM -0700, Darrick J. Wong wrote:
> > > On Tue, Oct 29, 2019 at 10:11:51AM +1100, Stephen Rothwell wrote:  
> > > > Hi all,
> > > > 
> > > > After merging the xfs tree, today's linux-next build (powerpc
> > > > ppc64_defconfig) failed like this:  
> > > 
> > > <groan> Yeah, that's the same thing reported by the kbuild robot an hour
> > > ago.  FWIW I pushed a fixed branch but I guess it's too late for today,
> > > oh well....
> > > 
> > > ...the root cause of course was the stray '}' in one of the commits,
> > > that I didn't catch because compat ioctls are hard. :(  
> > 
> > Weird.  My usual builds have compat ioclts enabled, and I never got
> > any report like this.
> 
> It only fails for !(defined(CONFIG_IA64) || defined(CONFIG_X86_64))
> I reported it failing in my powerpc build.

Oh, ok.  I actually see your report now as well, which for some reason
got sorted into my spam folder.
