Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD6A96DD4
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2019 01:37:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726254AbfHTXhc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 19:37:32 -0400
Received: from smtprelay0178.hostedemail.com ([216.40.44.178]:44955 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726248AbfHTXhc (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 19:37:32 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 6DB2F180A8151;
        Tue, 20 Aug 2019 23:37:30 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 57,3.5,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::,RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:1963:2393:2553:2559:2562:2692:2693:2828:3138:3139:3140:3141:3142:3354:3622:3865:3866:3867:3868:3870:3871:3872:3873:3874:4250:4321:5007:6119:7903:8603:10011:10394:10400:10471:10848:11232:11658:11914:12114:12297:12663:12679:12740:12760:12895:13069:13161:13229:13255:13311:13357:13439:14093:14096:14097:14181:14659:14721:21063:21067:21080:21451:21627:21789:21795:21944:30012:30051:30054:30056:30060:30070:30079:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:1:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: scene35_2441a800be623
X-Filterd-Recvd-Size: 3565
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf16.hostedemail.com (Postfix) with ESMTPA;
        Tue, 20 Aug 2019 23:37:29 +0000 (UTC)
Message-ID: <9d12995c5e7e41fc5d8ba202f76a2cf854183245.camel@perches.com>
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
Date:   Tue, 20 Aug 2019 16:37:27 -0700
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
> 
> Honestly, I really really REALLY don't want yet another broken string
> handling function, when we still have a lot of the old strlcpy() stuff
> in the tree from previous broken garbage.
> 
> The fact is, when you copy strings, both the destination *AND* the
> source may have size limits. They may be the same. Or they may not be.
> 
> This is particularly noticeable in the "str*_pad()" versions. It's
> simply absolutely and purely wrong. I will note that we currently have
> not a single user or strscpy_pad() in the whole kernel outside of the
> testing code.
> 
> And yes, we actually *do* have real and present cases of "source and
> destination have different sizes". They aren't common, but they do
> exist.
> 
> So I'm putting my foot down on yet another broken string copy
> interface from people who do not understand this fundamental issue.

I think you are mistaken about the stracpy limits as
the only limit is not the source size but the dest.

Why should the source be size limited?

btw: I also think str.cpy_pad is horrible.


