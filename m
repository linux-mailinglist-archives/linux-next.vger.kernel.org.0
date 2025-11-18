Return-Path: <linux-next+bounces-9076-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6ECC6A416
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 16:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0688D4F5D71
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 15:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABA7357A2A;
	Tue, 18 Nov 2025 15:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c2N8Ze5h"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4125B354AF2;
	Tue, 18 Nov 2025 15:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478353; cv=none; b=oTHElue6i5kPRZDbySZQOamo3RhPjweVocSO+AS3vkbJPotCNzxzFkYLxGvoBoPB4PCdvvXVMmzmTqrlGLmmHlaWVydTxKsv3yDSoF5x0a9B2UERhZgUX0Ap7/fiAddm6RsB26WITKKYja2zSR4SRNvkiuuIV+yGprN7VU7hetI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478353; c=relaxed/simple;
	bh=xPm74SzcjrYXS3BQp6zUAy5awYG5qyIBV2SS0uoqTxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBI3t3693+6daSA1ra2E2GTUENtErlduonVgOF+DFPD4PmVY3v14cQFhUbg5BnTK5njiXqZqwvJv0SB7L52TkbEumarA+a32j2myYi2BEuT7E4ZLhHeYoS4y/uul8WfJiW/ZRDees1zoT09fbkCJcu6lg7EO3scOS1MIkUNaV1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c2N8Ze5h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF355C116B1;
	Tue, 18 Nov 2025 15:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763478352;
	bh=xPm74SzcjrYXS3BQp6zUAy5awYG5qyIBV2SS0uoqTxk=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=c2N8Ze5hRk34S2aDIX86/EbxgAK01LcnxMfI1lrgq/A62QfgvmJIZ5PUFySreskNc
	 jhL/zP7Y3ty2sBsvom/fONk/56x4zJ23MuU+rQmOXJBu3iaQFlLnPgQlsYYrOV3ZEO
	 tenfwL+2RPwlsOmXlGgncsqXklhojAxnreTFAgCNQRIlAv//daLyzsAxrpQ+Ka0ioG
	 07HfFN0sDF9iM0w94KRWWaem0j7Bcc4TEm1JEKNnJpsHB8EyGU6h5WqF19RdgrCWHa
	 nMVzWH4Ek9FvREMrlIJ5lTJjYi6HBe6bmhmRHY2x4cpWiSBz+NjqjFkiDHTpciIxeU
	 /sawHacxP8WJQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 5D45ECE0CFD; Tue, 18 Nov 2025 07:05:52 -0800 (PST)
Date: Tue, 18 Nov 2025 07:05:52 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Yonghong Song <yonghong.song@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rcu tree with the ftrace tree
Message-ID: <2b4fce38-92c7-4c87-8f62-7c1e665f3bf9@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20251114135226.64831207@canb.auug.org.au>
 <20251114074255.3e535084@gandalf.local.home>
 <e2674451-21f2-4388-bf3c-8ca9946f81cf@paulmck-laptop>
 <5d6033df-b651-4daa-a804-dd142f441358@linux.dev>
 <20251118073508.JdhVECQD@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118073508.JdhVECQD@linutronix.de>

On Tue, Nov 18, 2025 at 08:35:08AM +0100, Sebastian Andrzej Siewior wrote:
> On 2025-11-14 10:31:45 [-0800], Yonghong Song wrote:
> > > I believe that migration needs to be disabled at this point, but I am
> > > again adding Yonghong on CC for his perspective.
> > 
> > Yes, migration needs to be disabled for rt kernel in order to let
> > bpf program running properly.
> 
> Why is disabling migration special in regard to RT kernels vs !RT?
> Why do we need to disable migration given that bpf_prog_run_array()
> already does that? Is there a different entry point? 
> My point why is it required to disable migration on trace-point entry
> for BPF given that the BPF-entry already does so.

When I tried doing without that disabling some weeks back, it broke.

Maybe things have changed since, but I must defer to Yonghong &c.

							Thanx, Paul

