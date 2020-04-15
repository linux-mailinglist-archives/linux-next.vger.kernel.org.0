Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1775A1AB0EF
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 21:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407757AbgDOTGu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 15:06:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:46638 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1416884AbgDOSzy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 14:55:54 -0400
Received: from home.goodmis.org (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0196020732;
        Wed, 15 Apr 2020 18:55:52 +0000 (UTC)
Date:   Wed, 15 Apr 2020 14:55:45 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: linux-next: Tree for Apr 10 (lib/test_printf.ko)
Message-ID: <20200415185545.GA1632@home.goodmis.org>
References: <20200410132706.170811b7@canb.auug.org.au>
 <27c212c4-b522-561d-411c-e74dc0ff0b74@infradead.org>
 <CAHk-=wjhsM-n_NzSh=cSdpThX+62-x3EmyKjhMqGHFYEyG0nPg@mail.gmail.com>
 <2b0f5d2e-3fe5-10c9-2a9a-9a0b341a52d5@infradead.org>
 <CAHk-=wjXZSPPWzPs=KBDsLZWuq8qO=9qWfiKHw=yV10fFrDv9Q@mail.gmail.com>
 <bfbcaa67-9656-3a80-fc66-c937297c8be0@infradead.org>
 <CAHk-=whpvCqcCYvy=_v_F6NTtBSeQbXZ0iLr_smV2NJLT+XACw@mail.gmail.com>
 <CA+G9fYu47hpXjYtAr32p9yJ97KZqTry+ioAY1S2TqtiKztCYRg@mail.gmail.com>
 <f90fc906-395b-79be-8f44-3807586766f7@infradead.org>
 <CAFd5g46ZaEVoMb2hO94A41Z=YH6ntTdXstZUhHu67mwOKY+QsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFd5g46ZaEVoMb2hO94A41Z=YH6ntTdXstZUhHu67mwOKY+QsA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 14, 2020 at 12:26:29PM -0700, Brendan Higgins wrote:
> On Sat, Apr 11, 2020 at 11:22 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 4/11/20 10:36 PM, Naresh Kamboju wrote:
> > > FYI,
> > >
> > > Is this problem related to,
> > >
> > > Regression reported on Linux next 5.6.0-rc4-next-20200305 on x86_64,
> > > i386, arm and arm64. The steps to reproduce is running kselftests lib
> > > printf.sh test case.
> > > Which is doing modprobe operations.
> > >
> > > BUG: kernel NULL pointer dereference, address: 00 - ida_free+0x76/0x140
> > >
> > > https://lore.kernel.org/linux-kselftest/CAFd5g46Bwd8HS9-xjHLh_rB59Nfw8iAnM6aFe0QPcveewDUT6g@mail.gmail.com/T/
> > >
> >
> > Looks similar. Lots of fwnode, software_node, ida stuff there.
> 
> Sorry for the late reply, I was out.
> 
> Yeah, I am pretty sure it is the same. Heikki proposed a fix that I am
> going to try.

My test suite just tripped over this bug. Is this the patch that you think
fixes it?

https://lore.kernel.org/linux-kselftest/20200414081513.GD2828150@kuha.fi.intel.com

I'll add it to see if I can continue my testing.

-- Steve

