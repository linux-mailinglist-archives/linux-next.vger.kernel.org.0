Return-Path: <linux-next+bounces-6657-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B50BCAB212C
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 06:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78905A00C99
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 04:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC3B1B6CE0;
	Sat, 10 May 2025 04:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lKG4nV5N"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E90139B;
	Sat, 10 May 2025 04:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746852298; cv=none; b=cX73EK8YeaSHeEmocnjggV8M+r93A7syoRTSDmq/WNJ0GKHl01sd58EsRRXXtXcMaEEW5//FZ64bqbxoSfNG5seEXuNOSirQuR4qy+djcfWEEdrbtnZMtc7/d6tnUfiVrA0K6HEiqTzhhhQAZCJ/DL2Ei4vuhTFQ+DIbm1MPqvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746852298; c=relaxed/simple;
	bh=kh4sjLq5JF+8Y2rGuukJ83uDaRTovVpc65OIA0JKgFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yl7W7hpKT6WoFCC+A9ONmgan1WN1z0zpJn7hg8V8u8jTu8ndlI+nGPXAVDn6yN78MLeae4k7NAppo9hxe+PRMhQUtfcurqm1+ezS/xPez1qu1MVx6zQVqwZ5o90s2rihQKtH6kl24p/nGF4Y9k2a+L5WlyZ3pZDqCFPge0DlDJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lKG4nV5N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B64C4CEE2;
	Sat, 10 May 2025 04:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746852297;
	bh=kh4sjLq5JF+8Y2rGuukJ83uDaRTovVpc65OIA0JKgFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lKG4nV5NFMIcqqUBDecvoGiwskeK/rIJKv4tYDYE3tiTW2b3hWExmEySN8HuyrZrV
	 UV/HWqoafoGBRjCAgFzDrhI+ZkcZIJE+s55SEqTA48B4ljBjcf1H9NxdLNQEaT4wS1
	 XQVEGdGQPMdabCj4S9fr7D6JrzEWc19v5No11pIQNHCKdQJyTek5CEqEF0ucONvT6w
	 VPpEEntRtHWR8XZKIGbRWoO0s0wbca3ybEm6gD6GvYOKePLoh14FPquyZw/VPn59bJ
	 0YrQSNEJq3+khNbYmUAt7HobSf4RHYFR/ReGtHqjzQKWqzN16affoObLWHhybhBuiw
	 tvcUC8gFxdhiw==
Date: Fri, 9 May 2025 21:44:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Fix input mixup in
 poly1305_emit_arch
Message-ID: <20250510044450.GA505731@sol>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB31DI4QBBZuQObQ@gondor.apana.org.au>

On Fri, May 09, 2025 at 08:29:00PM +0800, Herbert Xu wrote:
> On Thu, May 08, 2025 at 08:35:48PM +0530, Venkat Rao Bagalkote wrote:
> >
> > Unfortunately, above patch dosent fix the boot warning.
> 
> This works for me:
> 
> ---8<---
> Swap the order of the arguments in poly1305_emit_arch to match
> the prototype.
> 
> Fixes: 14d31979145d ("crypto: powerpc/poly1305 - Add block-only interface")
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

This fixes "-cpu Power10", but older CPUs (e.g. "-cpu POWER9") are still
failing.

- Eric

