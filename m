Return-Path: <linux-next+bounces-5025-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2FA01BF8
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 22:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3735C3A3B3D
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 21:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D82D5336D;
	Sun,  5 Jan 2025 21:19:15 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF3317996;
	Sun,  5 Jan 2025 21:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736111955; cv=none; b=UFjJDSQ6Z7atWCsWqTV8+XUSsrb3QQ/Qf1l46pxmUawz9KPwoFE16vGme7Z3sGr7mIWVs4+qDdrYcXhcFqE6WrO5G7O8GDF88EPyutmy23skV48ibqhmbiBXLzsTh2hXNUu+jFV0wFzo3LkLHSiiL4SLEuahmL/GqSqgzV4g59c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736111955; c=relaxed/simple;
	bh=0PxxAwDthJ9PKci7HdlwbrL6jVYukOL+NAM25GeAypM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=We6SgogDCTV5f4rBgOyxADbfRtjD8/P3b1BMHStecmaloStQeBpLg7Uy5D28ona+tGEAdUfMaAWW4CPTd2zpMGpjjKw581+Q/wN21TI8Olzp7pIV9YzV1JxPmwkc0Y1etP9YX9VKLcJXfBrSAT0IvWrMvFoDcwNmhZ9+3mH0kzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C70CC4CED0;
	Sun,  5 Jan 2025 21:19:14 +0000 (UTC)
Date: Sun, 5 Jan 2025 16:20:38 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the ftrace-fixes tree
Message-ID: <20250105162038.0db04ec7@gandalf.local.home>
In-Reply-To: <20250105154523.2c7c399a@gandalf.local.home>
References: <20250106063313.0e7fbc75@canb.auug.org.au>
	<20250105154523.2c7c399a@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 5 Jan 2025 15:45:23 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

> > The following commit is also in Linus Torvalds' tree as a different commit
> > (but the same patch):
> > 
> >   ab9d98250259 ("ftrace: Fix function profiler's filtering functionality")
> >   e99b3d0cb6cd ("fgraph: Add READ_ONCE() when accessing fgraph_array[]")
> > 
> > These are commits
> > 
> >   789a8cff8d2d ("ftrace: Fix function profiler's filtering functionality")
> >   d65474033740 ("fgraph: Add READ_ONCE() when accessing fgraph_array[]")
> > 
> > in Linus' tree.
> >   
> 
> Bah, I sent out a slight update to Linus, and ended up rebasing it on
> v6.13-rc5. I'll rebase my ftrace/for-next on top of that one, test it, and
> re-push it. Probably tomorrow.

Ah, I didn't see that this was the "fixes" branch. I'll just go and update
that.

Thanks,

-- Steve

