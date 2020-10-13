Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C4D28D232
	for <lists+linux-next@lfdr.de>; Tue, 13 Oct 2020 18:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390136AbgJMQYn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Oct 2020 12:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390130AbgJMQYm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Oct 2020 12:24:42 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 774F2C0613D0;
        Tue, 13 Oct 2020 09:24:41 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id q202so14108534iod.9;
        Tue, 13 Oct 2020 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bIGCYEfgq4tA5rYR7t+s/V/5c+QVNfCOp4tp8ujtghY=;
        b=SinFAnDhCsYoEKqDS/VWNZYzgfyrEnxiN1JvJMudv2CyKuKTbBiPAyK5HgohdWuo3C
         w45+sXW3OzsTDkmHJgjuPjM9ZXTWwCpvUS8Wucr/dPhJy7KJi4chidzhGxEJhs9UqZXn
         dYRdzZfBBX6pH5avlio7EvIm6z/p9zqh6adodHu2jC2XX8V3UcqhWcZ46zJ2VQyUx5w/
         eEoNsp25J0niB7JhgT3oZYQ/Ca7CRjzr2Gth50T9Gse/TzZtI9dmpb50q9uOKcReRANk
         MN88fgK3GzlMGETQRcfLkFNQEORyrTxkX0vaohnsYYXiuV/R8u6XSBGBbc/FOv+eRdbv
         gTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bIGCYEfgq4tA5rYR7t+s/V/5c+QVNfCOp4tp8ujtghY=;
        b=srxJaVs+hUUcr9Cjv+k2dsl+O/N4gfjxGIpt9LEaSYz29mVrZKgWGpYBORTJs+2hnc
         6gdn3aqmSo9+zODlRl/3iy5vDpO2zSTI/VUfT1VorVyFVmPzHDfNqZ/H6vzblko/A/Yt
         URyIpehYqH3/GiDezUbTH9mOCetjbPRcs6+BqmJv1JJgeSSUov/CtmUHpSOh/++5A/SW
         sYgj+T0DXUEE18n9mP1Py6zsMpbyuVtpImfB+N3a5At7zsqMjpVY/Lt4f/95t6k5NvVp
         2XRv3ljsf3ohbmTOLiTOTKImXMtLAVyVEj7EmJvcgLxHK44IUngvnYlgbYqH4mQK5Ud2
         DXDg==
X-Gm-Message-State: AOAM530VciW8UhXo0IymUvpoqlzu87RqXACq155TfOXklrfx/qNNx0VW
        mLBqiGy5Zlm1yOJnRiErnv4=
X-Google-Smtp-Source: ABdhPJyooy66hVSGiltM9zve0IFqEjC9GtPqKJlphYYK0PspUYcNjWR5rAh/VNMknY1Z+WjWohBrnQ==
X-Received: by 2002:a6b:bfc7:: with SMTP id p190mr126273iof.121.1602606280839;
        Tue, 13 Oct 2020 09:24:40 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id 2sm199442ill.78.2020.10.13.09.24.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2020 09:24:40 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailauth.nyi.internal (Postfix) with ESMTP id B38A627C0054;
        Tue, 13 Oct 2020 12:24:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 13 Oct 2020 12:24:38 -0400
X-ME-Sender: <xms:xdSFX5TvFuZD9vPS8-PSSX2EOSQ_mv9ta39Iuba8AZrrP8I7cvsVsQ>
    <xme:xdSFXywWaQ_-PMNGsFbjSriVxrZMweT9Zc7JcsQimI0ZcW3z5IOFBYalUDEHpmalC
    vrM4UYUB19BduCfiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheelgddutdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhn
    ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
    htvghrnhepvdelieegudfggeevjefhjeevueevieetjeeikedvgfejfeduheefhffggedv
    geejnecukfhppeehvddrudehhedrudduuddrjedunecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:xdSFX-1QmokdW7lm19K8_lxkMBJkFmf6HM7ygMjKyf8AVaTq9BEFMA>
    <xmx:xdSFXxDPyKD6VqK0Mzvs6QMjiYt0PVmBnwcVE4D1sTDB6m2NFjX2Qw>
    <xmx:xdSFXyhOjN5gentaXpv0IG_J5myjTCarkDPph-rBic9-nNy8Jwloxw>
    <xmx:xtSFX7VO4-dl3L5X4EhdlFluyZnw4z4Xj20f1pLONXAJfFZaGVBsYSZDH2c>
Received: from localhost (unknown [52.155.111.71])
        by mail.messagingengine.com (Postfix) with ESMTPA id F34743064610;
        Tue, 13 Oct 2020 12:24:36 -0400 (EDT)
Date:   Wed, 14 Oct 2020 00:24:35 +0800
From:   Boqun Feng <boqun.feng@gmail.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Qian Cai <cai@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@kernel.org>, x86 <x86@kernel.org>,
        linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [tip: locking/core] lockdep: Fix lockdep recursion
Message-ID: <20201013162435.GB39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
References: <160223032121.7002.1269740091547117869.tip-bot2@tip-bot2>
 <e438b231c5e1478527af6c3e69bf0b37df650110.camel@redhat.com>
 <20201012031110.GA39540@debian-boqun.qqnc3lrjykvubdpftowmye0fmh.lx.internal.cloudapp.net>
 <20201013102715.GX2628@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013102715.GX2628@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 13, 2020 at 12:27:15PM +0200, Peter Zijlstra wrote:
> On Mon, Oct 12, 2020 at 11:11:10AM +0800, Boqun Feng wrote:
> 
> > I think this happened because in this commit debug_lockdep_rcu_enabled()
> > didn't adopt to the change that made lockdep_recursion a percpu
> > variable?
> > 
> > Qian, mind to try the following?
> > 
> > Although, arguably the problem still exists, i.e. we still have an RCU
> > read-side critical section inside lock_acquire(), which may be called on
> 
> There is actual RCU usage from the trace_lock_acquire().
> 
> > a yet-to-online CPU, which RCU doesn't watch. I think this used to be OK
> > because we don't "free" anything from lockdep, IOW, there is no
> > synchronize_rcu() or call_rcu() that _needs_ to wait for the RCU
> > read-side critical sections inside lockdep. But now we lock class
> > recycling, so it might be a problem.
> > 
> > That said, currently validate_chain() and lock class recycling are
> > mutually excluded via graph_lock, so we are safe for this one ;-)
> 
> We should have a comment on that somewhere, could you write one?
> 

Sure, I will write something tomorrow.

Regards,
Boqun

> > ----------->8
> > diff --git a/kernel/rcu/update.c b/kernel/rcu/update.c
> > index 39334d2d2b37..35d9bab65b75 100644
> > --- a/kernel/rcu/update.c
> > +++ b/kernel/rcu/update.c
> > @@ -275,8 +275,8 @@ EXPORT_SYMBOL_GPL(rcu_callback_map);
> >  
> >  noinstr int notrace debug_lockdep_rcu_enabled(void)
> >  {
> > -	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE && debug_locks &&
> > -	       current->lockdep_recursion == 0;
> > +	return rcu_scheduler_active != RCU_SCHEDULER_INACTIVE &&
> > +	       __lockdep_enabled;
> >  }
> >  EXPORT_SYMBOL_GPL(debug_lockdep_rcu_enabled);
> 
> Urgh, I didn't expect (and forgot to grep) lockdep_recursion users
> outside of lockdep itself :/ It looks like this is indeed the only one.
> 
> 
