Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 677451A613B
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 02:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgDMA3p (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Apr 2020 20:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:49422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgDMA3p (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Apr 2020 20:29:45 -0400
Received: from smtprelay.hostedemail.com (smtprelay0040.hostedemail.com [216.40.44.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBE9C0A3BE0;
        Sun, 12 Apr 2020 17:29:45 -0700 (PDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 93A90181D337B;
        Mon, 13 Apr 2020 00:29:44 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:421:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3834:3865:3866:3867:3868:3870:3871:3874:4184:4250:4321:4560:5007:7875:9121:10004:10400:10848:10967:11232:11233:11473:11658:11914:12043:12050:12262:12296:12297:12438:12555:12679:12740:12895:13069:13071:13138:13231:13311:13357:13439:13894:13972:14180:14181:14659:14721:21060:21080:21365:21433:21451:21611:21627:21939:30030:30054:30060:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:1,LUA_SUMMARY:none
X-HE-Tag: offer33_72017b532ee55
X-Filterd-Recvd-Size: 2330
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Mon, 13 Apr 2020 00:29:43 +0000 (UTC)
Message-ID: <8194c2197b9d57f6c37cc6417c9dc9b310732e6b.camel@perches.com>
Subject: Re: linux-next: manual merge of the realtek tree with Linus' tree
From:   Joe Perches <joe@perches.com>
To:     Andreas =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-realtek-soc@lists.infradead.org" 
        <linux-realtek-soc@lists.infradead.org>
Date:   Sun, 12 Apr 2020 17:27:36 -0700
In-Reply-To: <dbdc1f6b-faf8-7d0d-7730-4ae3f5610dde@suse.de>
References: <20200413085034.5e77f236@canb.auug.org.au>
         <dbdc1f6b-faf8-7d0d-7730-4ae3f5610dde@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2020-04-13 at 02:22 +0200, Andreas Färber wrote:
> Hi,
> 
> Am 13.04.20 um 00:50 schrieb Stephen Rothwell:
> > Today's linux-next merge of the realtek tree got a conflict in:
> > 
> >    MAINTAINERS
> > 
> > between commit:
> > 
> >    3b50142d8528 ("MAINTAINERS: sort field names for all entries")
> > 
> > from Linus' tree and commit:
> > 
> >    d6656fa4c621 ("ARM: Prepare Realtek RTD1195")
> > 
> > from the realtek tree.
> 
> Already fixed on v5.8/soc but not yet merged into for-next - done now.

Hello Andreas.

One of the lines changed was from 2017.

d6656fa4 (Andreas Färber     2017-10-05 03:59:15 +0200 2263) F: arch/arm/mach-realtek/

Is that commit ever going forward?

commit d6656fa4c6215b293d23ed7242ced83a2fce1fec
Author: Andreas Färber <afaerber@suse.de>
Date:   Thu Oct 5 03:59:15 2017 +0200

    ARM: Prepare Realtek RTD1195
    
    Introduce ARCH_REALTEK Kconfig option also for 32-bit Arm.
    
    Override the text offset to cope with boot ROM occupying first 0xa800
    bytes and further reservations up to 0xf4000 (compare Device Tree).
    
    Add a custom machine_desc to enforce memory carveout for I/O registers.
    
    Signed-off-by: Andreas Färber <afaerber@suse.de>


