Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3F011E126C
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 18:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389191AbgEYQNn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 12:13:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:60930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391223AbgEYQNm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 May 2020 12:13:42 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2FBA82071A;
        Mon, 25 May 2020 16:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590423222;
        bh=jiZiG0bor02kpE35BPuQQ3h8r6eEvC1hLuIUNVg03kk=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=KCkxdrwJOY8nW6Wagc7h7jekGDCj0PmCMjLMyDqM5r6wv6jO52Y92ujMsalAY1QUw
         Ai2SN/dFBQWGQkKW21uPSuLMemM5B0Y0pwh0o9eWn9+7KUZAR5g3K2T4tqI7U9Ityp
         E2ucNhVhRk/ce9i2tYenJWduJQz6u5Bhdj5603wc=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 17583352267B; Mon, 25 May 2020 09:13:42 -0700 (PDT)
Date:   Mon, 25 May 2020 09:13:42 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Marco Elver <elver@google.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20200525161342.GY2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200522171708.5f392fde@canb.auug.org.au>
 <20200522174944.1a1732fa@canb.auug.org.au>
 <20200523001223.GA23921@paulmck-ThinkPad-P72>
 <20200523064643.GA27431@zn.tnic>
 <87a71zq8ml.fsf@nanos.tec.linutronix.de>
 <20200523150614.GP2869@paulmck-ThinkPad-P72>
 <871rnaqxor.fsf@nanos.tec.linutronix.de>
 <20200523212345.GR2869@paulmck-ThinkPad-P72>
 <20200525003706.GA13789@paulmck-ThinkPad-P72>
 <CANpmjNMjvJqVFiY+xSUK=oePP9TsDzZHVh6XKM77ar5fh_fdFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNMjvJqVFiY+xSUK=oePP9TsDzZHVh6XKM77ar5fh_fdFQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 25, 2020 at 10:20:29AM +0200, Marco Elver wrote:
> On Mon, 25 May 2020 at 02:37, Paul E. McKenney <paulmck@kernel.org> wrote:
> >
> > On Sat, May 23, 2020 at 02:23:45PM -0700, Paul E. McKenney wrote:
> > > On Sat, May 23, 2020 at 09:05:24PM +0200, Thomas Gleixner wrote:
> > > > "Paul E. McKenney" <paulmck@kernel.org> writes:
> > > > > On Sat, May 23, 2020 at 11:54:26AM +0200, Thomas Gleixner wrote:
> > > > >> core/rcu is the one which diverged and caused the merge conflict with
> > > > >> PPC to happen twice. So Paul needs to remove the stale core/rcu bits and
> > > > >> rebase on the current version (which is not going to change again).
> > > > >
> > > > > So there will be another noinstr-rcu-* tag, and I will rebase on top
> > > > > of that, correct?  If so, fair enough!
> > > >
> > > > Here you go: noinstr-rcu-220-05-23
> > > >
> > > > I wanted this to be 2020 and not 220 but I noticed after pushing it
> > > > out. I guess it still does the job :)
> > >
> > > Now -that- is what I call an old-school tag name!!!  ;-)
> > >
> > > I remerged, rebased, and pushed to -rcu branch "dev".
> > >
> > > If it survives testing, I will reset -rcu branch "rcu/next" as well.
> >
> > And passed!  The compile times are back to their old selves on my
> > laptop as well.
> >
> > Thank you for setting this up, Thomas!!!
> 
> I just noticed that -rcu and -tip both still have their own version of
> "ubsan, kcsan: Don't combine sanitizer with kcov on clang". For there
> to not be any conflicts in -next, "ubsan, kcsan: Don't combine
> sanitizer with kcov on clang" could be dropped from -rcu.

Thank you for spotting this!  Yes, if it is already in -tip, I should
drop it.  If this causes trouble for clang users working with -rcu, I
can always pull in the exact commit used in -tip.

Anyway, -rcu branch "dev" no longer contains this commit.

							Thanx, Paul
