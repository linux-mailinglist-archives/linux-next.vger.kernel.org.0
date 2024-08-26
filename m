Return-Path: <linux-next+bounces-3426-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E79195F690
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 18:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60AB21C21A2A
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 16:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F7418D64D;
	Mon, 26 Aug 2024 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSB+SODc"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517A21865E7;
	Mon, 26 Aug 2024 16:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724689868; cv=none; b=Atvp81Y5mEwj7BZgDdKts8c66AV4NGdkuyVS/Vnf8nIMU7YBZGE7xGVRi7rh76NWwTnfjWZ0jLnRPHEGVg3XeVANY8gPsIyWcUI8FUfJiNFxlscbGeCpck1+BDISzC+fdFkzA9m//pagSOFI2sN9OL+OdY3WpGFAXOv16CbrusU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724689868; c=relaxed/simple;
	bh=uctcGm9llZGS5ckp6lUfEXW4KEe6hjYHQrQX+Z42poc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mwiaq/olUuP//yR3wqVEytjxBMDmgki8GxnoLNWE2xnxU9dTd+RCb26KlF2vkUCBxiwC0NOMezt+/mGIxNiQ6suymKNXzvJUGW7Y2VlPKfKrlJZdFjma4/8KLo1xaikJn8hbO2+Ox0x0/hPzzcsnWrUqFXGQsRSA86kBGqdZlCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSB+SODc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC6BC52FC0;
	Mon, 26 Aug 2024 16:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724689867;
	bh=uctcGm9llZGS5ckp6lUfEXW4KEe6hjYHQrQX+Z42poc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=nSB+SODc6181g8MX7uHGlBR768/M17xygUHUORi3VQ3qKl+u0fYOm4IUXrvDZGn3J
	 23ksLGpe5fwFQqjEg+vP+6Bq6f5jDrBLnXnmEE9jeZlJrmQm6j5Heq83hIyEo4ZQVI
	 +P+DRLvd09c+j77s/BsaH+VUGAEoQHCscA8F8ffIQ+DaPjm9SiHS3+/WNjjg6C6akH
	 +ogwUAglYnLCVkiDmu/n2Z+BMrnKqxRtwr5x19tpCr1qa3UsJUQADB7RYDR/cnUQX1
	 XIzADoR8m8nEUg8DjlaJT768DYpiki6q/guXbQsalQ+M1rEMMLyUHA9bw2/dGoWbnm
	 15WXsi0qEtPtw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 87EC7CE0BC7; Mon, 26 Aug 2024 09:31:07 -0700 (PDT)
Date: Mon, 26 Aug 2024 09:31:07 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	sfr@canb.auug.org.au, linux-next@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <b1824f4a-f5cc-4011-876f-8a73cf752067@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20240823074705.GB12053@noisy.programming.kicks-ass.net>
 <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xhsmho75fo6e4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On Mon, Aug 26, 2024 at 01:44:35PM +0200, Valentin Schneider wrote:
> On 23/08/24 09:47, Peter Zijlstra wrote:
> > On Wed, Aug 21, 2024 at 02:57:16PM -0700, Paul E. McKenney wrote:
> >
> >> 2e0199df252a ("sched/fair: Prepare exit/cleanup paths for delayed_dequeue")
> >>
> >> The preceding commit is very reliable.
> >>
> >> Only instead of (or maybe as well as?) introducing the dequeue_rt_stack()
> >> bug, the 2e0199df252a commit introduced a build bug:
> >>
> >> ------------------------------------------------------------------------
> >>
> >> In file included from kernel/sched/fair.c:54:
> >> kernel/sched/fair.c: In function ‘switched_from_fair’:
> >> kernel/sched/sched.h:2154:58: error: ‘__SCHED_FEAT_DELAY_ZERO’ undeclared (first use in this function); did you mean ‘__SCHED_FEAT_LATENCY_WARN’?
> >>  2154 | #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
> >>       |                                                          ^~~~~~~~~~~~~
> >> kernel/sched/fair.c:12878:21: note: in expansion of macro ‘sched_feat’
> >> 12878 |                 if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
> >>       |                     ^~~~~~~~~~
> >> kernel/sched/sched.h:2154:58: note: each undeclared identifier is reported only once for each function it appears in
> >>  2154 | #define sched_feat(x) !!(sysctl_sched_features & (1UL << __SCHED_FEAT_##x))
> >>       |                                                          ^~~~~~~~~~~~~
> >> kernel/sched/fair.c:12878:21: note: in expansion of macro ‘sched_feat’
> >> 12878 |                 if (sched_feat(DELAY_ZERO) && p->se.vlag > 0)
> >>       |                     ^~~~~~~~~~
> >>
> >
> > Oh gawd, last minute back-merges :/
> >
> > Does the below help any? That's more or less what it was before Valentin
> > asked me why it was weird like that :-)
> 
> Woops...

On the other hand, removing that dequeue_task() makes next-20240823
pass light testing.

I have to ask...

Does it make sense for Valentin to rearrange those commits to fix
the two build bugs and remove that dequeue_task(), all in the name of
bisectability.  Or is there something subtle here so that only Peter
can do this work, shoulder and all?

							Thanx, Paul

