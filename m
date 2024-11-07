Return-Path: <linux-next+bounces-4678-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB3E9C0917
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 15:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 983501F22449
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CC120CCD1;
	Thu,  7 Nov 2024 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="opIhrEKd"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC31E049C;
	Thu,  7 Nov 2024 14:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730990377; cv=none; b=QubvcFGFPBdX++4cqj2A+NhQ7G707FKKIV5XpU9L/mbyU9FBm3CyvuZUOQQCnO1EcaBmGJ4RSyYjD/g+zc2fiWexFZ0S4wPiHwm8Mb/ZfsJzR3WKeEHgB074Rn3meKzYpNGfTp1ggkCoy1Y7OhpsQE/v8QfiWdut1BzOcbk3Xao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730990377; c=relaxed/simple;
	bh=j5z94PtQoW59kPS8kdY5s2UwbCijAPL8dnOom8ujCx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ef8ZzJ7Wd5lCprIRDz/7NVlnpirDH1dmXZxK5VskW5E3RoeyeHgpFo55JfsQdH7er3jMJJjoYQcSpJSERq68l+AypK6cxoPofSxleKT0Le/IVWXgR2FuS1AtyQYS/hIn2bjUJrLq1yHc1v+Z6u9VDXX47qgvG179cRdJjP2IMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=opIhrEKd; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZZOQcMyQbmxyWBdUsa1OX+zK2dTEt1bfIdzEjlEc8/8=; b=opIhrEKdUxXdObcwcbY3zAHNca
	cw646wFzSEw9NGheDwGJMHSLN8TLzoFy15ULJQm4svLfen20cm4NnyTO3t62ZuFPWefo8VNYay8uU
	0uVQPu1g/AURghetQiZreJ4TMAZLAmH3WxtrfW8YIXfOPv36kDyKj20KeJ0ym6LNMVjBqR1el0DTt
	dAmg9rl8RwdMwdXvWV3+j82jpVNXQ33UCNS2NhSlRHb0tlzBxNV1tU1fKZMKo6kNmh6evRVFL+ZIK
	aMhX2bBOorvoyK7ezT8dq5+ife4ORGRacYPzZdZ4F3iWEUT9Qeivq2MudXYP+mGu1XBhOCjgR8WZN
	ZAb5u3Zg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t93fX-0000000C8u3-1gng;
	Thu, 07 Nov 2024 14:39:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D51083006AB; Thu,  7 Nov 2024 15:39:30 +0100 (CET)
Date: Thu, 7 Nov 2024 15:39:30 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	bigeasy@linutronix.de, boqun.feng@gmail.com
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20241107143930.GC38786@noisy.programming.kicks-ass.net>
References: <20241107182411.57e2b418@canb.auug.org.au>
 <20241107103414.GT10375@noisy.programming.kicks-ass.net>
 <CANiq72kkiwaMpeKgNLYiCSMX_VK7a+6Xu4iQrDiB_cpnXpokxg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kkiwaMpeKgNLYiCSMX_VK7a+6Xu4iQrDiB_cpnXpokxg@mail.gmail.com>

On Thu, Nov 07, 2024 at 03:31:27PM +0100, Miguel Ojeda wrote:
> On Thu, Nov 7, 2024 at 11:34 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > So I can't get RUST=y, even though make rustavailable is happy.
> 
> If you get the chance, please check in e.g. `menuconfig` the unmet `depends on`.
> 
> It could be e.g. the `!CALL_PADDING` one if you have an older `rustc`
> than Stephen.

So menuconfig prints that as a giant line without wrapping, but instead
forces me to press 'right-arrow' to scrol that.

So I can't readily read or even copy/paste it :-(

http://peterz.broke-it.net/sekrit/allmodconfig

Is what I get from: make LLVM=-19 allmodconfig

It has:

CONFIG_RUSTC_VERSION=108200

Which is what I installed today from debian/unstable, because the
version from debian/testing was too old to satisfy make rustavailable.

