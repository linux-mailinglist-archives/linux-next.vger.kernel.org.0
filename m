Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D987288D33
	for <lists+linux-next@lfdr.de>; Sat, 10 Aug 2019 22:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbfHJUmb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 10 Aug 2019 16:42:31 -0400
Received: from smtprelay0208.hostedemail.com ([216.40.44.208]:54724 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726014AbfHJUmb (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Sat, 10 Aug 2019 16:42:31 -0400
X-Greylist: delayed 554 seconds by postgrey-1.27 at vger.kernel.org; Sat, 10 Aug 2019 16:42:30 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave08.hostedemail.com (Postfix) with ESMTP id 287351800294E
        for <linux-next@vger.kernel.org>; Sat, 10 Aug 2019 20:33:17 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 5A0FA1802913B;
        Sat, 10 Aug 2019 20:33:15 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:599:800:960:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2559:2564:2682:2685:2691:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3872:3873:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:7903:9025:10004:10400:10848:11232:11658:11914:12043:12050:12114:12297:12438:12555:12740:12760:12895:12986:13069:13142:13230:13255:13311:13357:13439:14096:14097:14180:14181:14659:14721:14819:21080:21451:21627:21811:30041:30054:30060:30070:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:25,LUA_SUMMARY:none
X-HE-Tag: dust49_1c42199401b48
X-Filterd-Recvd-Size: 3048
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf15.hostedemail.com (Postfix) with ESMTPA;
        Sat, 10 Aug 2019 20:33:14 +0000 (UTC)
Message-ID: <4398924f28a58fca296d101dae11e7accce80656.camel@perches.com>
Subject: Re: [PATCH] Makefile: Convert -Wimplicit-fallthrough=3 to just
 -Wimplicit-fallthrough for clang
From:   Joe Perches <joe@perches.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Sat, 10 Aug 2019 13:33:12 -0700
In-Reply-To: <6a5f470c1375289908c37632572c4aa60d6486fa.camel@perches.com>
References: <c0005a09c89c20093ac699c97e7420331ec46b01.camel@perches.com>
         <9c7a79b4d21aea52464d00c8fa4e4b92638560b6.camel@perches.com>
         <CAHk-=wiL7jqYNfYrNikgBw3byY+Zn37-8D8yR=WUu0x=_2BpZA@mail.gmail.com>
         <6a5f470c1375289908c37632572c4aa60d6486fa.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, 2019-08-10 at 13:18 -0700, Joe Perches wrote:
> On Sat, 2019-08-10 at 12:44 -0700, Linus Torvalds wrote:
> > On Sat, Aug 10, 2019 at 12:32 PM Joe Perches <joe@perches.com> wrote:
> > > What does it take for this sort of patch to be applied by you?
> > 
> > The basic rule tends to be: "normal channels".
> []
> > I pulled from Gustavo earlier today to add a few more expected switch
> > fall-through's, I guess I can take this Makefile change directly.
> 
> Thanks. It's simple enough.
> 
> There are classes of patches generated by scripts that have
> no real mechanism to be applied today.
> 
> For instance: global coccinelle scripted changes to use stracpy
> https://lore.kernel.org/lkml/alpine.DEB.2.21.1907251747560.2494@hadrien/
> 
> and trivial scripted changes to MAINTAINERS
> https://lore.kernel.org/lkml/6482e6546dc328ec47b07dba9a78a9573ebb3e56.camel@perches.com/
> 
> that are basically impossible to be applied by anyone but you.
> 
> Otherwise there are hundreds of little micro patches most of
> which would not otherwise be applied.
> 
> There should be some process available to get these treewide
> or difficult to keep up-to-date and apply patches handled.
> 
> I believe these sorts of scripted patches should ideally
> be handled immediately before an RC1 so other trees can be 
> synchronized in the simplest way possible.

Hey Stephen

Question for you about a possible -next process change.

Would it be reasonable to have some mechanism to script
treewide patches to generate and apply after Andrew Morton's
mmotm patches are applied to -next?

This could allow treewide scripted patches to have
compilation and test coverage before possibly being
applied to Linus' tree.

What would be necessary to allow this?

