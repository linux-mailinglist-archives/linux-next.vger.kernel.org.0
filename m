Return-Path: <linux-next+bounces-3764-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C72975AA6
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 21:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4953B1F23F51
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 19:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528AC1B5804;
	Wed, 11 Sep 2024 19:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="px+f6i1w"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26111199FB1;
	Wed, 11 Sep 2024 19:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726081424; cv=none; b=oblp6H/ymT6q7KDqmVJitRFCjUnr5w8doldXm0g5VNuYjtfcoJ7OYCr9Rj/vtd8GFYw8IE9EZfDTnfBv2KuZW46WOxl0r65y3kkWOmKt6+BkaXXsNchGTVzabPO/IyMuyGTPKpUA1GZOtsy9GJxtwtDOnQGdJd2JH5uRO82JIvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726081424; c=relaxed/simple;
	bh=cB5xxdOkS/VgO4fhlPuNrAiLm1l6EjiFx7cfT9LsvZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFW2B9CB4Y7SY1ShrWZV8PGqhc3K5yUqmxDCdUe4/A5TKVohNaoHdA8RGenukhtFNhBqHbQSnm4DNdaH7i3bG8uiT2aQCzsJmtmjQTZ5FL172uDKejiMyWqh1w1+XWrAzi5ipPu0SHD4mdAMAUeeDEdfrX44RTNEtiVRi3oCpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=px+f6i1w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D026C4CEC0;
	Wed, 11 Sep 2024 19:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726081423;
	bh=cB5xxdOkS/VgO4fhlPuNrAiLm1l6EjiFx7cfT9LsvZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=px+f6i1wB0leHSMFk18jANYt5VSiaKjHG2LM++WUQE0EmHiHYVKKaKNKHBnIVH2u4
	 w+9bIzAB6hP4E69WyGRva5039xj77vz9VT9R1jJec8Y/FILpow6ZWau3AnLnOQkSQt
	 yTkPUTtqdmK6uuVYY1in2ZLA1J5e4fMjIhAm/bWmFgI8zsKUd4+tBmhuUh6P++fbkm
	 QPGGUg4vMxl546foxICVTeZrK/hl9LXIM+svuhyuodCXQnxVIrd2m7SJv4LkGHhv2y
	 KDoxrbWkZv/IIu1Yo6O4HLf4EAMciwEOAIhADRUZKHYpvkT8mzM/d7wWkdtTSYhpqP
	 eFlqlguYPMedA==
Date: Wed, 11 Sep 2024 09:03:42 -1000
From: Tejun Heo <tj@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Chen Yu <yu.c.chen@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sched-ext tree with the tip tree
Message-ID: <ZuHpjntxhary-X8q@slm.duckdns.org>
References: <20240911164046.2c97e2b7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911164046.2c97e2b7@canb.auug.org.au>

On Wed, Sep 11, 2024 at 04:40:46PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the sched-ext tree got conflicts in:
> 
>   kernel/sched/fair.c
>   kernel/sched/syscalls.c
> 
> between commits:
> 
>   84d265281d6c ("sched/pelt: Use rq_clock_task() for hw_pressure")
>   5d871a63997f ("sched/fair: Move effective_cpu_util() and effective_cpu_util() in fair.c")
> 
> from the tip tree and commit:
> 
>   96fd6c65efc6 ("sched: Factor out update_other_load_avgs() from __update_blocked_others()")
> 
> from the sched-ext tree.
> 
> I fixed it up (I used the latter version of kernel/sched/fair.c and see
> below) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.

I pulled tip/sched/core and resolved the conflict the same way. Will follow
up with a minor cleanup patch.

Thanks.

-- 
tejun

