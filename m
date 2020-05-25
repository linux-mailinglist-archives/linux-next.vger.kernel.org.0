Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A801E08A5
	for <lists+linux-next@lfdr.de>; Mon, 25 May 2020 10:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731391AbgEYIUr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 May 2020 04:20:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725849AbgEYIUo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 May 2020 04:20:44 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3482C05BD43
        for <linux-next@vger.kernel.org>; Mon, 25 May 2020 01:20:42 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id o24so15457991oic.0
        for <linux-next@vger.kernel.org>; Mon, 25 May 2020 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Azh7Qf5VqGk1C5GHmcLCjaOZm5RvD53r5M4Q66y5N4E=;
        b=G1bvHWQvaSzoekxw3mZ7s4c83ovTLXsKLzv3enF9zYsC9+tgS2i9AW2iOGqlowFhri
         k3mmhKEAGjbvtDNLBBW/BRGvs2DlJTdM/dD0lpKbvlHbUxo79Kxm+tn9tsp4R6wT9i1m
         Sfa1KVv6reJKwKFn9um4GzRQps/Atzo6MTEzmzLE8GDBznrbiP/L4IyPmL7OOVDrFUcI
         P9KG7fskRERGdWqROan1hpxepyqr/pEh1t37fif2YcbKYS4aFtmWkEmjcyNRHsjLxPg+
         S8QumjJdluVOXzH+A7bUuxxUdRKmjJQaKv/KzyH7owfz3PuF4U9wT+0u4+YSwupJ3ZTJ
         eS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Azh7Qf5VqGk1C5GHmcLCjaOZm5RvD53r5M4Q66y5N4E=;
        b=H3LIqBM571yv3NpmQlrjRGUtcD2wOzw/qAfzrQqILlRl7gcYrXe9iJIJncjX4oYoMn
         HZCzgzpZTA+8UFlyEMNiyaIk7M0JJQEWWReW8b6BTFljqTxXpuY8cA1HG/p6cHKWBnQm
         ujEfKs6pSDiYc0vEHnIr8NepmOF16mRWlsfaIlSSX87NAQQHd6ckKWY4KqxoZN2SAR46
         T781VXGlLZ9ZiOJQlsROWjLaKpnMTBvmy26vIuELBThxnKi4wzVHOfk1l1EZQ8izcDvn
         FboUwSbVmvW79576DjXR8tNmKqhRUfg/uewzHPn0g8h4Kf8rwdaHxd0o6+u7IZu1AlCJ
         X3kw==
X-Gm-Message-State: AOAM532e0hoZxuqQ1D8I6M44pzNyxwA5soBakh/S0mm30Hfj7uGJH90A
        iScPHDGaMn6bGoV9QNS8bNFR4rfUquVOuCCp0+5mCEJUbSA=
X-Google-Smtp-Source: ABdhPJzPfGvkXoAEO6zWx5fGwS/RRPJEryJvMFIXf0ksHObwHtbFS1z8Vgxvdql1XeVzo3PZPlnI/SPaIp2bNYA9MjI=
X-Received: by 2002:aca:d0d:: with SMTP id 13mr2336227oin.172.1590394841810;
 Mon, 25 May 2020 01:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200522033119.1bbd99c5@canb.auug.org.au> <20200521173520.GL6608@willie-the-truck>
 <20200522171708.5f392fde@canb.auug.org.au> <20200522174944.1a1732fa@canb.auug.org.au>
 <20200523001223.GA23921@paulmck-ThinkPad-P72> <20200523064643.GA27431@zn.tnic>
 <87a71zq8ml.fsf@nanos.tec.linutronix.de> <20200523150614.GP2869@paulmck-ThinkPad-P72>
 <871rnaqxor.fsf@nanos.tec.linutronix.de> <20200523212345.GR2869@paulmck-ThinkPad-P72>
 <20200525003706.GA13789@paulmck-ThinkPad-P72>
In-Reply-To: <20200525003706.GA13789@paulmck-ThinkPad-P72>
From:   Marco Elver <elver@google.com>
Date:   Mon, 25 May 2020 10:20:29 +0200
Message-ID: <CANpmjNMjvJqVFiY+xSUK=oePP9TsDzZHVh6XKM77ar5fh_fdFQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the tip tree
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will@kernel.org>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 25 May 2020 at 02:37, Paul E. McKenney <paulmck@kernel.org> wrote:
>
> On Sat, May 23, 2020 at 02:23:45PM -0700, Paul E. McKenney wrote:
> > On Sat, May 23, 2020 at 09:05:24PM +0200, Thomas Gleixner wrote:
> > > "Paul E. McKenney" <paulmck@kernel.org> writes:
> > > > On Sat, May 23, 2020 at 11:54:26AM +0200, Thomas Gleixner wrote:
> > > >> core/rcu is the one which diverged and caused the merge conflict with
> > > >> PPC to happen twice. So Paul needs to remove the stale core/rcu bits and
> > > >> rebase on the current version (which is not going to change again).
> > > >
> > > > So there will be another noinstr-rcu-* tag, and I will rebase on top
> > > > of that, correct?  If so, fair enough!
> > >
> > > Here you go: noinstr-rcu-220-05-23
> > >
> > > I wanted this to be 2020 and not 220 but I noticed after pushing it
> > > out. I guess it still does the job :)
> >
> > Now -that- is what I call an old-school tag name!!!  ;-)
> >
> > I remerged, rebased, and pushed to -rcu branch "dev".
> >
> > If it survives testing, I will reset -rcu branch "rcu/next" as well.
>
> And passed!  The compile times are back to their old selves on my
> laptop as well.
>
> Thank you for setting this up, Thomas!!!

I just noticed that -rcu and -tip both still have their own version of
"ubsan, kcsan: Don't combine sanitizer with kcov on clang". For there
to not be any conflicts in -next, "ubsan, kcsan: Don't combine
sanitizer with kcov on clang" could be dropped from -rcu.

Thanks,
-- Marco
