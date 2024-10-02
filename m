Return-Path: <linux-next+bounces-4064-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D198D2B4
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 14:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 010B7284C08
	for <lists+linux-next@lfdr.de>; Wed,  2 Oct 2024 12:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1C951CF5EF;
	Wed,  2 Oct 2024 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u+G95eU3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27F41CF5E6;
	Wed,  2 Oct 2024 12:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727870839; cv=none; b=axIHdONJQReVocWYPImDfmw6djjqPajZiBdz5+FOtnwPUQbA0mtRU1L6yp0XwV6ax0mg++VQCB2Y+7sitO9juGbb3V19YvdlAbw0fgJpLHHe0QN/GxHCSg4L09jx/7NMwRnSl3caCfFTpwtQQEg9j5++bOkrMZNn+cW9pAOsiyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727870839; c=relaxed/simple;
	bh=J7jIz7y5hNIyebU+amSvJ96wMlB0FFM915/YxmOGEho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VmQ4938yGYOJZ9mWLvNVdiHu45sdlWlpQBbUbkHLcvn7iKKglM4DmEoljqBlllLYnKwtymnHFXsHm8Ky6rJe4bPcFaeTTmObBnfTcGIUFh3BvN4CUwFZrMYX08+fRPSDIXLelGQqzLo3OyknxHURfT4hQYwhOiB6dNf2bjxJToo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u+G95eU3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C4DC4CEC5;
	Wed,  2 Oct 2024 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727870839;
	bh=J7jIz7y5hNIyebU+amSvJ96wMlB0FFM915/YxmOGEho=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=u+G95eU3tXfsIbUFFBwsvMJGTEMgqUxifIUBDwxEHpLjj8UCe6bm0PBzxQm3MgoW8
	 zGi1tWExeMsM1MwLaE/uSvQthZkGk1QU1SslJYEsoXiGDxiW/XGDX/3ct8ET1WnSXF
	 Nxjzfabe0eMURNDp3oFTBKawiZOs2Gl39yP407Y6q36ZYdU8ZPHmbKLeXyA0Pk0AtW
	 jMXHCzaR1QpMt+BkMi0tTn+mgg7TpvlgWoBseo2+H37i3/yXE/+xp0ubHs4Ao4yAUD
	 p9Z47DEK+7Xy8+dDtJL+I9gjo9+cI9xq4T/QMf0t5V7mUJ77qolaFEuCwWEt8PWn+p
	 C2O3qs9CwM3/g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D3D27CE0710; Wed,  2 Oct 2024 05:07:18 -0700 (PDT)
Date: Wed, 2 Oct 2024 05:07:18 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Tomas Glozar <tglozar@redhat.com>
Cc: Valentin Schneider <vschneid@redhat.com>, Chen Yu <yu.c.chen@intel.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <70b06926-5ca5-4fd8-b88f-64179f63425b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <250cde11-650f-4689-9c36-816406f1b9b8@paulmck-laptop>
 <182ef9c6-63a4-4608-98de-22ef4d35be07@paulmck-laptop>
 <xhsmh34m38pdl.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <ac93f995-09bc-4d2c-8159-6afbfbac0598@paulmck-laptop>
 <43d513c5-7620-481b-ab7e-30e76babbc80@paulmck-laptop>
 <xhsmhed50vplj.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <d6033378-d716-4848-b7a5-dcf1a6b14669@paulmck-laptop>
 <xhsmhbk04ugru.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <64e92332-09c7-4cae-ac63-e1701b3f3814@paulmck-laptop>
 <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP4=nvTtOB+0LVPQ=nA3=XdGLhDiwLjcLAb8YmQ+YqR9L+050Q@mail.gmail.com>

On Wed, Oct 02, 2024 at 11:01:03AM +0200, Tomas Glozar wrote:
> út 1. 10. 2024 v 18:47 odesílatel Paul E. McKenney <paulmck@kernel.org> napsal:
> > Huh, 50MB and growing.  I need to limit the buffer size as well.
> > How about "trace_buf_size=2k"?  The default is 1,441,792, just
> > over 1m.
> >
> Yeah, limiting the size of the buffer is the way to go, we only need
> the last n entries before the oops.
> 
> > Except that I am not getting either dl_server_start() or dl_server_stop(),
> > perhaps because they are not being invoked in this short test run.
> > So try some function that is definitely getting invoked, such as
> > rcu_sched_clock_irq().
> >
> > No joy there, either, so maybe add "ftrace=function"?
> >
> > No: "[    1.542360] ftrace bootup tracer 'function' not registered."
> >
> Did you enable CONFIG_BOOTTIME_TRACING and CONFIG_FUNCTION_TRACER?
> They are not set in the default configuration for TREE03:
> 
> $ grep -E '(FUNCTION_TRACER)|(BOOTTIME_TRACING)'
> ./tools/testing/selftests/rcutorture/res/2024.09.26-14.35.03/TREE03/.config
> CONFIG_HAVE_FUNCTION_TRACER=y
> # CONFIG_BOOTTIME_TRACING is not set
> # CONFIG_FUNCTION_TRACER is not set

Ah, thank you!  I knew I must be forgetting something.  Now a short test
gets me things like this:

[  304.572701] torture_-190      13d.h2. 302863957us : rcu_is_cpu_rrupt_from_idle <-rcu_sched_clock_irq

> > Especially given that I don't have a QEMU monitor for these 100 runs.
> >
> > But if there is a way to do this programatically from within the
> > kernel, I would be happy to give it a try.
> >
> > > Also I'd say here we're mostly interested in the sequence of events leading
> > > us to the warn (dl_server_start() when the DL entity is somehow still
> > > enqueued) rather than the state of things when the warn is hit, and for
> > > that dumping the ftrace buffer to the console sounds good enough to me.
> >
> > That I can do!!!  Give or take function tracing appearing not to work
> > for me from the kernel command line.  :-(
> >
> >                                                         Thanx, Paul
> >
> 
> Thanks for trying to get details about the bug. See my comment above
> about the config options to enable function tracing.

I will check up on last night's run for heisenbug-evaluation purposes,
and if it did trigger, restart with this added:

--kconfigs "CONFIG_BOOTTIME_TRACING=y CONFIG_FUNCTION_TRACER=y"

> FYI I have managed to reproduce the bug on our infrastructure after 21
> hours of 7*TREE03 and I will continue with trying to reproduce it with
> the tracers we want.

Even better!!!

							Thanx, Paul

