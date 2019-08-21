Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0840996E2E
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 02:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfHUAUs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 20:20:48 -0400
Received: from smtprelay0094.hostedemail.com ([216.40.44.94]:55756 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726215AbfHUAUs (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 20:20:48 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 3D9DE181D33FC;
        Wed, 21 Aug 2019 00:20:46 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 10,1,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1963:2393:2553:2559:2562:2828:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3871:3872:3873:3874:4321:4605:5007:8603:10004:10394:10400:10471:10848:11026:11232:11473:11658:11914:12043:12114:12297:12663:12740:12760:12895:13069:13255:13311:13357:13439:14181:14659:14721:21080:21451:21627:21789:21944:30054:30060:30070:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:31,LUA_SUMMARY:none
X-HE-Tag: crush78_7af148c290837
X-Filterd-Recvd-Size: 3059
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf11.hostedemail.com (Postfix) with ESMTPA;
        Wed, 21 Aug 2019 00:20:44 +0000 (UTC)
Message-ID: <edd8efd53fadd07992f804cc595c6ae5fdb60e73.camel@perches.com>
Subject: Re: rfc: treewide scripted patch mechanism? (was: Re: [PATCH]
 Makefile: Convert -Wimplicit-fallthrough=3 to just -Wimplicit-fallthrough
 for clang)QUILT
From:   Joe Perches <joe@perches.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Julia Lawall <julia.lawall@lip6.fr>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Tue, 20 Aug 2019 17:20:43 -0700
In-Reply-To: <CAHk-=wgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=DPBE0Q@mail.gmail.com>
References: <c0005a09c89c20093ac699c97e7420331ec46b01.camel@perches.com>
         <9c7a79b4d21aea52464d00c8fa4e4b92638560b6.camel@perches.com>
         <CAHk-=wiL7jqYNfYrNikgBw3byY+Zn37-8D8yR=WUu0x=_2BpZA@mail.gmail.com>
         <6a5f470c1375289908c37632572c4aa60d6486fa.camel@perches.com>
         <4398924f28a58fca296d101dae11e7accce80656.camel@perches.com>
         <ad42da450ccafcb571cca9289dcf52840dbb53d3.camel@perches.com>
         <20190820092451.791c85e5@canb.auug.org.au>
         <14723fccc2c3362cc045df17fc8554f37c8a8529.camel@perches.com>
         <CAHk-=wgqQKoAnhmhGE-2PBFt7oQs9LLAATKbYa573UO=DPBE0Q@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2019-08-20 at 16:28 -0700, Linus Torvalds wrote:
> On Mon, Aug 19, 2019 at 5:08 PM Joe Perches <joe@perches.com> wrote:
> > 2: would be Julia Lawall's stracpy change done
> > with coccinelle: (attached)
> 
> I'm not actually convinced about stracpy() and friends.
> 
> It seems to be yet another badly thought out string interface, and
> there are now so many of them that no human being can keep track of
> them.
> 
> The "badly thought out" part is that it (like the original strlcpy
> garbage from BSD) thinks that there is only one size that matters -
> the destination.
> 
> Yes, we fixed part of the "source is also limited" with strscpy(). It
> didn't fix the problem with different size limits, but at least it
> fixed the fundamentally broken assumption that the source has no size
> limit at all.

Umm, btw: have you actually looked at stracpy?

It's just a convenience wrapper around strscpy
and dest must be a char array and its size
does not need to be specified as a somewhat
useless argument otherwise prone to misuse.

#define stracpy(dest, src)						\
({									\
	size_t count = ARRAY_SIZE(dest);				\
	BUILD_BUG_ON(!(__same_type(dest, char[]) ||			\
		       __same_type(dest, unsigned char[]) ||		\
		       __same_type(dest, signed char[])));		\
									\
	strscpy(dest, src, count);					\
})

I sent several patches for those misuses.

