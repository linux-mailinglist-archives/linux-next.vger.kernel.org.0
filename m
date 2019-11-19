Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2465A102D54
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 21:14:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbfKSUO4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 15:14:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:48508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726711AbfKSUO4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 19 Nov 2019 15:14:56 -0500
Received: from paulmck-ThinkPad-P72.home (unknown [199.201.64.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B175C22317;
        Tue, 19 Nov 2019 20:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574194494;
        bh=LdeFR8HtAJeWIP3e9Vs/cKUSbteqaXMjyl1Ec8EruKk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=SwLovSoQhuIBOL/A5tJGPo/B7AbyFiPYw158oAxj6ucrg+7mTHw4C56LnFqltrVpY
         b6j3bhqfx762viVwIQkBKWNZXQTQqkP2Y4L+dOwLDHK2JuDRNT/wobwWi1Hh/uAxrd
         f2bg32TSgRmNM5oynZjwqvQb6LPlgmDb4vBWg/V4=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 4BC933520FA7; Tue, 19 Nov 2019 12:14:54 -0800 (PST)
Date:   Tue, 19 Nov 2019 12:14:54 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Marco Elver <elver@google.com>
Cc:     Qian Cai <cai@lca.pw>, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev <kasan-dev@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: linux-next: Tree for Nov 19 (kcsan)
Message-ID: <20191119201454.GE2889@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20191119194658.39af50d0@canb.auug.org.au>
 <e75be639-110a-c615-3ec7-a107318b7746@infradead.org>
 <CANpmjNMpnY54kDdGwOPOD84UDf=Fzqtu62ifTds2vZn4t4YigQ@mail.gmail.com>
 <fb7e25d8-aba4-3dcf-7761-cb7ecb3ebb71@infradead.org>
 <20191119183407.GA68739@google.com>
 <1574190168.9585.4.camel@lca.pw>
 <CANpmjNMfCNqgsXQdDckOg0kuMgvnD8_jka8N0AT2K3hC=CUe0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANpmjNMfCNqgsXQdDckOg0kuMgvnD8_jka8N0AT2K3hC=CUe0w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 19, 2019 at 08:05:45PM +0100, Marco Elver wrote:
> On Tue, 19 Nov 2019 at 20:02, Qian Cai <cai@lca.pw> wrote:
> >
> > On Tue, 2019-11-19 at 19:34 +0100, 'Marco Elver' via kasan-dev wrote:
> > > On Tue, 19 Nov 2019, Randy Dunlap wrote:
> > >
> > > > On 11/19/19 8:12 AM, Marco Elver wrote:
> > > > > On Tue, 19 Nov 2019 at 16:11, Randy Dunlap <rdunlap@infradead.org> wrote:
> > > > > >
> > > > > > On 11/19/19 12:46 AM, Stephen Rothwell wrote:
> > > > > > > Hi all,
> > > > > > >
> > > > > > > Changes since 20191118:
> > > > > > >
> > > > > >
> > > > > > on x86_64:
> > > > > >
> > > > > > It seems that this function can already be known by the compiler as a
> > > > > > builtin:
> > > > > >
> > > > > > ../kernel/kcsan/core.c:619:6: warning: conflicting types for built-in function ‘__tsan_func_exit’ [-Wbuiltin-declaration-mismatch]
> > > > > >  void __tsan_func_exit(void)
> > > > > >       ^~~~~~~~~~~~~~~~
> > > > > >
> > > > > >
> > > > > > $ gcc --version
> > > > > > gcc (SUSE Linux) 7.4.1 20190905 [gcc-7-branch revision 275407]
> > > > >
> > > > > Interesting. Could you share the .config? So far I haven't been able
> > > > > to reproduce.
> > > >
> > > > Sure, it's attached.
> > >
> > > Thanks, the config did the trick, even for gcc 9.0.0.
> > >
> > > The problem is CONFIG_UBSAN=y. We haven't explicitly disallowed it like
> > > with KASAN. In principle there should be nothing wrong with KCSAN+UBSAN.
> > >
> > > There are 3 options:
> > > 1. Just disable UBSAN for KCSAN, and also disable KCSAN for UBSAN.
> > > 2. Restrict the config to not allow combining KCSAN and UBSAN.
> > > 3. Leave things as-is.
> > >
> > > Option 1 probably makes most sense, and I'll send a patch for that
> > > unless there are major objections.
> >
> > Both option #1 and #2 sounds quite unfortunate, as UBSAN is quite valuable for
> > debugging. Hence, it is desire to make both work at the same time.
> 
> Apologies, I think I was a bit unclear with #1. For #1, this just
> means that UBSAN is being disabled for the KCSAN runtime and
> vice-versa. All other parts of the kernel are still instrumented with
> both.
> 
> See here: https://lore.kernel.org/linux-next/20191119185742.GB68739@google.com/

Huh.   This somehow got stuck into my non-urgent email.  No idea why.

Anyway, I applied and pushed it out on the kcsan branch of -rcu.

						Thanx, Paul
