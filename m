Return-Path: <linux-next+bounces-7399-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A55AFC317
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 08:49:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9C541782AF
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 06:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A92C42222C0;
	Tue,  8 Jul 2025 06:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="prya40Bw"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D0E22126C;
	Tue,  8 Jul 2025 06:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751957298; cv=none; b=QxHIxJxiAuJi6vZVOPfeuioSxKTXC/kA3inNun1ZjmL2fYJNAOnokENzo7X6TAbscXTux43Rv3vO8BaejzOSJ+zBVUurNxwvf6aJ1O/YQN+a4soBU+/VuCsdDBWPSY803RYQazgOx83nC6TWogkAFgZlddpXZPHV061+V9ItePY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751957298; c=relaxed/simple;
	bh=TwK4ez6PMflB9E7lXtEdFSHg6cUKSCDZMRTm/vR9zUE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JNFlzsFaWqyhqU93T9gxSYoVsTbZGv+0NSZn7FkmESjI3670ISUq2K3Mfjzc06AguWwub2TLL32HhS21C7kLeNq8sODSYMw2N74Nx7BT5p3iXgpDcnFkhzCBEx6wYsCBkvAmn6VKw0q09O3JqFSWGzOtFn8nj1L+UMdu1H/FEFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=prya40Bw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B932CC4CEED;
	Tue,  8 Jul 2025 06:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751957298;
	bh=TwK4ez6PMflB9E7lXtEdFSHg6cUKSCDZMRTm/vR9zUE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=prya40Bwp+x+Dwt/bNcu104F9fEpjOq7wMzRp9aPMsvU3XMo4m6dNgq1r/3osxaXz
	 6gYpFtO03008NIyDR7d1gHSMtZrpz43ts6ubHwpt/ccpZDBgPVbfpu3tVuzhsyu5K2
	 7zyAn5PWKRtgsEXf08Z4YJ0kgzQA/q86AQgY2Hok=
Date: Mon, 7 Jul 2025 23:48:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-Id: <20250707234817.d09fc28a3510b23c31c461b4@linux-foundation.org>
In-Reply-To: <20250708160037.2ac0b55e@canb.auug.org.au>
References: <20250708160037.2ac0b55e@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Jul 2025 16:00:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in the mm-hotfixes tree as a different commit
> (but the same patch):
> 
>   f339770f60d9 ("Revert "sched/numa: add statistics of numa balance task"")
> 
> This is commit
> 
>   63afea878dc4 ("Revert "sched/numa: add statistics of numa balance task"")
> 
> in the mm-hotfixes tree.

Thanks, I'll drop the mm.git copy.

