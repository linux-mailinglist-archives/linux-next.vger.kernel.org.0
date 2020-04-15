Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783721AB1AA
	for <lists+linux-next@lfdr.de>; Wed, 15 Apr 2020 21:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436494AbgDOT3G (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Apr 2020 15:29:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:53658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2411884AbgDOT26 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Apr 2020 15:28:58 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A73120771;
        Wed, 15 Apr 2020 19:28:56 +0000 (UTC)
Date:   Wed, 15 Apr 2020 15:28:54 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
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
Message-ID: <20200415152854.625075ab@gandalf.local.home>
In-Reply-To: <26e0f0dd-4ea2-14e7-fae5-81a5a1451272@infradead.org>
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
        <20200415185545.GA1632@home.goodmis.org>
        <26e0f0dd-4ea2-14e7-fae5-81a5a1451272@infradead.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 15 Apr 2020 12:16:49 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:


> > My test suite just tripped over this bug. Is this the patch that you think
> > fixes it?
> > 
> > https://lore.kernel.org/linux-kselftest/20200414081513.GD2828150@kuha.fi.intel.com  
> 
> Yes, it is, but GregKH and Rafael Wysocki don't seem to like that patch
> and are suggesting some changes in lib/kobject.c (only pseudocode,
> no patch yet).
> 
> > I'll add it to see if I can continue my testing.  
> 
> See the thread
> [PATCH v1] kobject: make sure parent is not released before children
> 
> Here is Rafael's suggestion:
> https://lore.kernel.org/linux-kselftest/CAJZ5v0hNemTDVa_S-FfVMbrKjM-RWYoHh88asnUvTNxZinY2cw@mail.gmail.com/
> 

Thanks for the update.

If the first patch prevents the crash from happening, then I'll keep it for
the time being. I have a list of patch "fixes" that get applied to the
kernel I'm testing, such that I can run the tests without them failing for
something that I'm not testing. Otherwise, I'd never get to test my code :-)

Some of theses patches just remove "WARN_ON" because those will cause my
tests to fail. I really don't care if i915 triggers WARN_ON() as my code
shouldn't be affecting it.

-- Steve
