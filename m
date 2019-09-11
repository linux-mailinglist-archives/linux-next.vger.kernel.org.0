Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 407D0B00D2
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2019 18:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728842AbfIKQEM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Sep 2019 12:04:12 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:33018 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728825AbfIKQEM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 11 Sep 2019 12:04:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rPqLQQZmMWfIlYV8Oxuof345Z2bJ62xEOdAOhKOltWw=; b=E7Oked1XqrIgsf0xHW15O7jX1
        E1oZ+iVps9y6o6tndbcXQuXbcsDH0vrr1oV/ElWTy5Hixxjd8Wg/6ffzy2GGll47M2txqq0PCs0sV
        KGDByU00KdWiWjBUAJKAYJ8hUyk2+QqT+VfAvctMK39J6EhKf2xfA32Hm1VUJGvE2HyA2muV/y5V7
        pBecImwee7skziMkTmbe/+vo7JpY2XZLxiDyo+FcIjwEOurs63jGwcpMCtDAvf96hc+P3Oh8FHVps
        DsfNflfSpsIbYnMqcpECWTlxsD23xjTmNRySMMce8T4fmsEqiZss6jWO5IFQN1kTd1S9w1kdutCHw
        fJwgk8P9w==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:58994)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1i856G-0007JX-Eg; Wed, 11 Sep 2019 17:04:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1i856C-00044H-Vp; Wed, 11 Sep 2019 17:04:05 +0100
Date:   Wed, 11 Sep 2019 17:04:04 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mike Rapoport <mike.rapoport@gmail.com>,
        Chester Lin <clin@suse.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm tree
Message-ID: <20190911160404.GX13294@shell.armlinux.org.uk>
References: <20190911001459.6ccc76ee@canb.auug.org.au>
 <20190910142128.GR13294@shell.armlinux.org.uk>
 <20190911142106.GA6429@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911142106.GA6429@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 11, 2019 at 03:21:07PM +0100, Mike Rapoport wrote:
> On Tue, Sep 10, 2019 at 03:21:28PM +0100, Russell King - ARM Linux admin wrote:
> > This is correctly signed off, but Mike didn't send the patch correctly.
> > It missed a From: line for the proper author, so the patch was committed
> > as if Mike had authored it, which he didn't.
> 
> Sorry about that, haven't used the patch system for couple of years now.
> Would you like me to resubmit the patch?

No, I recommitted with the correct author.  The patch system takes
standard formatted patches (in the format you'd send to the mailing
lists, complete with the From: header in the first line of the
description, as if you're passing a patch along from someone else)
with the exception of the KernelVersion: header which needs to appear
somewhere before the patch (which can be either body or header.)

>  
> > On Wed, Sep 11, 2019 at 12:14:59AM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Commit
> > > 
> > >   2505b9ba9c37 ("ARM: 8904/1: skip nomap memblocks while finding the lowmem/highmem boundary")
> > > 
> > > is missing a Signed-off-by from its author.
> > > 
> > > -- 
> > > Cheers,
> > > Stephen Rothwell
> > 
> > 
> > 
> > -- 
> > RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> > FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
> > According to speedtest.net: 11.9Mbps down 500kbps up
> 
> -- 
> Sincerely yours,
> Mike.
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
