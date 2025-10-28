Return-Path: <linux-next+bounces-8728-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA2FC127F2
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 02:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1FCDD501A1E
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 01:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455621EC01B;
	Tue, 28 Oct 2025 01:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjLBw+iW"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAD51DEFE8;
	Tue, 28 Oct 2025 01:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761613845; cv=none; b=EF42w/P5pvxwrcUsc+aV89+DMwuHPTmoX+SXwganjkxKdkUzSWBEWYHP/qpGBveIPhdgyB1QEL6sqXDxaOGjzK9sn7WfKuU1VzI+vV94rb1+zXE9KlEdsk0GVShvk5rJAgc7jbeRxBr+xCjKLBZ9TtTbz+61zguETGM8uBoHdC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761613845; c=relaxed/simple;
	bh=h8m0uzzs5hXDsRMcDozsw8gCj9kOMe+SLj90Tna4wVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMSrzkn+5S1O1meCw7bFBZozdlhRXJzQZyNUaaP4JmTR5YnjBVqxkwj3AeWwtcGdl0Sj462nQ6WnsEVVRIGNHWpx76z+P7n26Tn4YuwMJVyDXm3wqDhCL5S+XaN2sc//hq94vmJYXdrvSt5a0h91+zpeO3nmCLXyChwIj3Kh4kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjLBw+iW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B10AC4CEF1;
	Tue, 28 Oct 2025 01:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761613844;
	bh=h8m0uzzs5hXDsRMcDozsw8gCj9kOMe+SLj90Tna4wVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjLBw+iWUre3p+EK5G70MUTkoP1SG8fKH0+bFhu8XPbhKkd6puZMMlhop54LLAwPS
	 aS46bzmLzWjaB/GdD1+CnOJ90LWut/UNzvOpC0s3K307De0cnoYqcILf4PFZWYA8We
	 7CK27gmLo1huDk7ZhHy+Ii/5tHb3lSg/lczPqqCRmLfSUw/LBovWTWK52JNANsGsR6
	 UBvhcp95lvbmJDgTuwhWDLw0/l8gE1qKfrkO6I0t6JdaEmxe1mFC4VAhcNl5AZ76ys
	 NlxdVYI4QgB+j0xtYKuX4wXBV4NbtWh86LAYt+SwnQr7xMkECe0dVk/Un65VyoMjyg
	 HPF7bicx5cMyQ==
Date: Mon, 27 Oct 2025 15:10:43 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Emil Tsalapatis (Meta)" <emil@etsalapatis.com>,
	Emil Tsalapatis <etsal@meta.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with Linus' tree
Message-ID: <aQAYE_X9XJ9RgJb3@slm.duckdns.org>
References: <20251028112205.47129816@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028112205.47129816@canb.auug.org.au>

On Tue, Oct 28, 2025 at 11:22:05AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the tip tree got a conflict in:
> 
>   kernel/sched/ext.c
> 
> between commit:
> 
>   a8ad873113d3 ("sched_ext: defer queue_balance_callback() until after ops.dispatch")
> 
> from Linus' tree and commit:
> 
>   4c95380701f5 ("sched/ext: Fold balance_scx() into pick_task_scx()")
> 
> from the tip tree.
> 
> I fixed it up (see below - but I was not sure if the
> "maybe_queue_balance_callback(rq);" is positioned correctly) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

I resolved this in sched_ext/for-6.19 by pulling for-6.18-fixes but yeah the
conflict is through tip/sched/core. I think your resolution is correct and
matches sched_ext/for-6.19 (sans whitespaces).

I don't know how tip tree resolves these conflicts but either way - leaving
it as-is until the merge window, or pulling master and resolving in tip - is
fine from sched_ext POV. I can sync with tip/sched/core as necessary.

Thanks.

-- 
tejun

