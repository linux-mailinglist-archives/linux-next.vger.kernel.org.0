Return-Path: <linux-next+bounces-5023-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124CBA01BD4
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 21:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 368AD7A1567
	for <lists+linux-next@lfdr.de>; Sun,  5 Jan 2025 20:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C0C1D319B;
	Sun,  5 Jan 2025 20:44:00 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20D31D0F46;
	Sun,  5 Jan 2025 20:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736109840; cv=none; b=t8N3KosMMPWZOl0Rqfhz+r0DViLjGvHCU1Sqs+3U9sRrtzjRMco0QVfTvP9cnEFP4kc7Yg04DQK2QZ6JpQNsYGgD+d5MlElWkyuDZPhhqJa3+fOfTc438aY/p8QjVbD/Ukh48v2DeSBYFHQsvXobgUGRZPUZgfruLsQ32DqexRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736109840; c=relaxed/simple;
	bh=OFYF+0f6MOH+dgKYH/oV3IVg9TbLMq9DNXc9RdwDd9E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dV7AcRCmqIDQ2PpoF/IYMexqrAzydN6NfLUYqcWbcwlKKPBOYJ2bQgpCKE+jZzrPinEK+fz/0cfmQHy6CFzma6n9Lwge9RfR5G/b+6vpSXFICc5lyl11dGJC0beFwDgDManNs8Wv1oIFSmxlIdU2a1XLseO82Bq+/oks8sqh7XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00357C4CED0;
	Sun,  5 Jan 2025 20:43:59 +0000 (UTC)
Date: Sun, 5 Jan 2025 15:45:23 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the ftrace-fixes tree
Message-ID: <20250105154523.2c7c399a@gandalf.local.home>
In-Reply-To: <20250106063313.0e7fbc75@canb.auug.org.au>
References: <20250106063313.0e7fbc75@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 6 Jan 2025 06:33:13 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   ab9d98250259 ("ftrace: Fix function profiler's filtering functionality")
>   e99b3d0cb6cd ("fgraph: Add READ_ONCE() when accessing fgraph_array[]")
> 
> These are commits
> 
>   789a8cff8d2d ("ftrace: Fix function profiler's filtering functionality")
>   d65474033740 ("fgraph: Add READ_ONCE() when accessing fgraph_array[]")
> 
> in Linus' tree.
> 

Bah, I sent out a slight update to Linus, and ended up rebasing it on
v6.13-rc5. I'll rebase my ftrace/for-next on top of that one, test it, and
re-push it. Probably tomorrow.

Thanks,

-- Steve

