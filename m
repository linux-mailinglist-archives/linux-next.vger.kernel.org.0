Return-Path: <linux-next+bounces-6119-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC879A77176
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 01:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5BCD7A444E
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 23:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 958E421C171;
	Mon, 31 Mar 2025 23:44:02 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D4F70820;
	Mon, 31 Mar 2025 23:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743464642; cv=none; b=B/N52lZ/hJ7w5Vb3dHjuGvksRD/MQwxZgoUQaB4rDR7JCrYfuGmVljlMh4DuyDuXwhcV0bxiaO61FygsomvU6H0dw5pdgT6LjZHByj6Gq6MHVUhqCM/Y54yiLEfIRqShqHSDyOtGxFzKsl/pre9RsEPuUvIN0DujusQlZmk+FpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743464642; c=relaxed/simple;
	bh=AUKDV8PfXoWdQ7r20oIN28kPP1yywQSrSDL04PCLG1M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RdbY6NRJoVGYHb1xkZd8e6lcViP5YavaqXlDSBsdknip3LW2XA3r0crI/H44iIoY9DDCqFLSLr1lBfARvEWj+5knBqFzLXa/rtyoJl598r7iCFBufwoJB/eqkUqKMGcp/ZkPl7MEAApaXrZdz5huY8Lc8XKIcCPVX7q0xMAotuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632E3C4CEE3;
	Mon, 31 Mar 2025 23:44:01 +0000 (UTC)
Date: Mon, 31 Mar 2025 19:45:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the ftrace tree
Message-ID: <20250331194500.65eb9a71@gandalf.local.home>
In-Reply-To: <20250401094014.4134abe1@canb.auug.org.au>
References: <20250401094014.4134abe1@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 1 Apr 2025 09:40:14 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commits are also in Linus Torvalds' tree as different
> commits (but the same patches):
> 
>   0e5d1a4b22bc ("ring-buffer: Remove the unused variable bmeta")
>   186a3d01d596 ("module: Add module_for_each_mod() function")
>   34c9862b1833 ("tracing: Skip update_last_data() if cleared and remove active check for save_mod()")
>   45be9d6a4e4c ("ring-buffer: Use kaslr address instead of text delta")
>   47d1b7233ae8 ("ring-buffer: Add ring_buffer_meta_scratch()")
>   4cb6fa440707 ("tracing: Show module names and addresses of last boot")
>   7f335d104d30 ("ring-buffer: Add buffer meta data for persistent ring buffer")
>   9042bbf70203 ("tracing: Freeable reserved ring buffer")
>   aad5fa4e9de1 ("mm/memblock: Add reserved memory release function")
>   bab85a646dd9 ("tracing: Show last module text symbols in the stacktrace")
>   c6a1b7c2e58d ("tracing: Update modules to persistent instances when loaded")
>   dca91c1c5468 ("tracing: Have persistent trace instances save module addresses")
>   dfc0b3249550 ("tracing: Initialize scratch_size to zero to prevent UB")
>   e39a2f30d23c ("tracing: Fix a compilation error without CONFIG_MODULES")
>   f20423262b36 ("tracing: Use _text and the kernel offset in last_boot_info")
>   f5d0a66ca482 ("tracing: Have persistent trace instances save KASLR offset")
>   ff700de3978f ("ring-buffer: Fix bytes_dropped calculation issue")
> 

Ah thanks. Linus didn't like the first patch in that series so I rebased
without it, tested it, and sent a second pull request. I forgot to update
my for-next branch to include that update. I'll do that now.

-- Steve

