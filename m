Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F108DA5074
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 09:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729500AbfIBHzX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 03:55:23 -0400
Received: from verein.lst.de ([213.95.11.211]:47882 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729457AbfIBHzX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 03:55:23 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 53D3A227A8A; Mon,  2 Sep 2019 09:55:20 +0200 (CEST)
Date:   Mon, 2 Sep 2019 09:55:20 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: linux-next: Tree for Aug 30
Message-ID: <20190902075520.GB28967@lst.de>
References: <20190831003613.7540b2d7@canb.auug.org.au> <20190901182226.GA20315@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190901182226.GA20315@roeck-us.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Sep 01, 2019 at 11:22:26AM -0700, Guenter Roeck wrote:
> On Sat, Aug 31, 2019 at 12:36:13AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20190829:
> > 
> > The compiler-attributes tree gained a build failure for which I reverted
> > a commit.
> > 
> > The arm-soc tree gained a conflict against the arm tree.
> > 
> > The csky tree gained a conflict against the dma-mapping tree.
> > 
> > The fuse tree gained a conflict against the fsverity tree.
> > 
> > The vfs tree gained conflicts against the fuse tree.
> > 
> > The pci tree gained a build failure for which I revereted a commit.
> > 
> > The net-next tree still had its build failure for which I applied a patch.
> > It also gained a conflict against the net tree.
> > 
> > The regulator tree still has its build failure for which I reverted
> > a commit.
> > 
> > The keys tree still has its build failure so I used the version from
> > next-20190828.
> > 
> > The driver-core tree lost its build failure.
> > 
> > The staging tree got conflicts against the net-next and usb trees.
> > 
> > The akpm-current tree gained a build failure due to an interaction with
> > the hmm tree for which I applied a patch.
> > 
> 
> Something in the fixup patch seems to be wrong. I get the following
> error with sh4 boot tests when booting from usb.
> 
> sm501-usb sm501-usb: OHCI Unrecoverable Error, disabled
> sm501-usb sm501-usb: HC died; cleaning up
> 
> Unfortunately, bisect doesn't help much (see below). Reverting the fixup
> patch as well as the offending patch (plus a context patch) alone does
> not help either. Further analysis shows that the problem exists since
> at least next-20190823. Another round of bisect on next-20190827 suggests
> another culprit (see second bisect below). Reverting all the offending
> patches doesn't help either, though, only result in a different error.
> 
> usb 1-1: new full-speed USB device number 2 using sm501-usb
> sm501-usb sm501-usb: DMA map on device without dma_mask
> 
> With that, I am giving up. Copying Christoph as he appears to be heavily
> involved in the patch series causing the problems.

What was the last tree you tested that works perfectly?
