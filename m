Return-Path: <linux-next+bounces-5984-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314D0A6E452
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 21:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9BE37A224D
	for <lists+linux-next@lfdr.de>; Mon, 24 Mar 2025 20:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7AE1AAE2E;
	Mon, 24 Mar 2025 20:27:21 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816A817E0;
	Mon, 24 Mar 2025 20:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742848041; cv=none; b=rPY52KEewyWPV+WN4qMYsmu3kaFJlfYBjUwuuirNOH83IY47Dm1ZboPohdzopPlRnWPgpWIbwTQGuuPKHM/poNxuJu1tIVa2qRKEnwWsxndc0eNRlX04GiG28ASi7MPgmr/BZsMbj4c0u+foYP01RxxrsU7WER23elmNwgJ7f3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742848041; c=relaxed/simple;
	bh=YLMnGIT3vZCVyFu8ky1mPKgPHp937CnACVRHmUQJprY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rcA0OcYC3Km/7Rpptpg0KgD+Egz/69uHxQhhJvegkv1CWUPBhoe7tzBw12mWi0qFWbOfqUksFocypH26DSZLjDx1eymvONU/Fe/ZcrGVPnCAjiw6p8yV6y9VDCMoS2Z/bLCe8ofrfcY3qramHwgs6Tkv+6tyrlAOBPdwwbBJyyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE18C4CEDD;
	Mon, 24 Mar 2025 20:27:20 +0000 (UTC)
Date: Mon, 24 Mar 2025 16:28:02 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the ftrace tree
Message-ID: <20250324162802.0fda49eb@gandalf.local.home>
In-Reply-To: <20250324133533.19b88cbf@canb.auug.org.au>
References: <20250324133533.19b88cbf@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Mar 2025 13:35:33 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> In commit
> 
>   6d5934331009 ("tracing: Do not use PERF enums when perf is not defined")
> 
> Fixes tag
> 
>   Fixes: a1e3ad43115e ("tracing: Ensure module defining synth event cannot be unloaded while tracing")
> 
> has these problem(s):
> 
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'

I rebased due to a conflict between my topic branches. Good thing too, as
it appears it also caught the fact that I cut and pasted the wrong commit
to fix :-p


> 
> Did you mean
> 
> Fixes: a1e3ad43115e ("tracing: Fix synth event printk format for str fields")
> 
> or
> 
> Fixes: 21581dd4e7ff ("tracing: Ensure module defining synth event cannot be unloaded while tracing")

Thanks,

-- Steve

