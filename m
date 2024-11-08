Return-Path: <linux-next+bounces-4711-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 478589C1FDF
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 15:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBCAC1F24564
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2024 14:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8081F6660;
	Fri,  8 Nov 2024 14:59:27 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323C61F5839;
	Fri,  8 Nov 2024 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731077967; cv=none; b=bD3rtqPOntMzqPHM4muPZ6LV+qSHSspMFoaczyLwlygPTiN8Fcr+NvlOcp4IdXwM7krfzA+FRchyQUFn7LmCkzfrxlpq4LV0xF54oEjpA2PhI8XA7l7RJBBy9QQMZIkOnUuV8m0nbsO1UpIfFu2YMCEPxbUGXEv4h9MXULS5z28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731077967; c=relaxed/simple;
	bh=pc8UXh/mRbVKJCFHGPQ3Dj+A4rpGyu83fvFMY3p87cw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r1wpgaVtco1sAu+jVsN1GeDmg9uKTC2F+jGmwOJPpV5g8XALcWi7mWo30onQiCVgjxeHZDm+0wYZiOq+cB0ehNfvd5YBOPoNEvrwN335IjzIDFPJMoILEkZinO+KtnBxGzvk5b+U0M29Wagb6odlf6EyGms6FVFyqRRy0YuAtYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC86C4CECF;
	Fri,  8 Nov 2024 14:59:26 +0000 (UTC)
Date: Fri, 8 Nov 2024 09:59:33 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241108095933.72400ee1@gandalf.local.home>
In-Reply-To: <20241108152149.28459a72@canb.auug.org.au>
References: <20241108152149.28459a72@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 8 Nov 2024 15:21:49 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: modpost: missing MODULE_LICENSE() in samples/rust/rust_print_events.o
> ERROR: modpost: "__tracepoint_rust_sample_loaded" [samples/rust/rust_print.ko] undefined!
> ERROR: modpost: "rust_do_trace_rust_sample_loaded" [samples/rust/rust_print.ko] undefined!
> 
> Caused by commit
> 
>   91d39024e1b0 ("rust: samples: add tracepoint to Rust sample")

Alice,

Can you send a patch to fix this?

> 
> I have used the ftrace tree from next-20241107 for today.
> 

I'll remove my rust topic branch until we have a fix.

Thanks,

-- Steve


