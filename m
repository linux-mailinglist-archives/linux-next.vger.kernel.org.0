Return-Path: <linux-next+bounces-6580-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94296AAE814
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 19:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F251BC6808
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 17:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23F928C030;
	Wed,  7 May 2025 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUii1rUV"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878F91B87D5;
	Wed,  7 May 2025 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746639863; cv=none; b=sU4YFg7jdFmkeI3ZEFMe4FQwd5hZImesdONW3IEBLqaju2YIi7MrtUvQlPRQOjH/gktOTvqshZVDY6b16xmn0lXVSc5BPYOjwX/3UMivHY4W/UX3hF+w1lNcopndGo+LaUa5AAuFroHNR3LCwAA83jNTfHaUc3pWPcqGW/EwKbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746639863; c=relaxed/simple;
	bh=zOuYgw5tHy8XVrwz0CABi8v0q/xyE5LbbROK4gul0+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPrpR4P0+qKbkJxObMO1phjAhlWSJSUzLKtt3l2jTpvqax4f9h14Vvx8NEWDjx80ppVqw12AeqIX0TjLRoG3Vnq0M+9nLSjlvzItdvQQo1VECCm62LLcX0kaBImi/Kckl861dGkKOX04L/FTSrgNV5bPjMihJsT36MsfKkympkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUii1rUV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB8DC4CEE2;
	Wed,  7 May 2025 17:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746639863;
	bh=zOuYgw5tHy8XVrwz0CABi8v0q/xyE5LbbROK4gul0+A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DUii1rUVQRg0WcRNHtMKo0FKEviDecwQbNhHCOMfgZpwWKttl6pN9qO0f698AqixT
	 bk9kxRMFh2VysNqdAHsdhMaUbySlG/SBXnUqwrxFNiTJGW3XmN1Vl/yF6Xiwqs8OVr
	 eATlgmKNGXgMGvZDqOAK23SXQfFmRHso5P8sdqS/IdbjjuuqVSdPh+9S7135oetloY
	 IfEBXR6YncGv0SxFov/I7xQT4GdcQFi8nI6SUkgudYSY+m7t9IhynI5eaJKo8avjKT
	 IN78bvplkxUwFHwzG/4UCojMKyq8CgD6jnFufn6+XF7EhNHt2w5TS4Rr1eoworjn28
	 U0x6WW/Mxve9w==
Date: Wed, 7 May 2025 19:44:18 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-ID: <aBub8jBVSRNmsR23@gmail.com>
References: <20250507132247.3e3076e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507132247.3e3076e3@canb.auug.org.au>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in the uml tree as a different commit
> (but the same patch):
> 
>   48199713a6a8 ("um: Use irq_domain_create_linear() helper")
> 
> This is commit
> 
>   7633b8b1e793 ("irqdomain: um: use irq_domain_create_linear() helper")
> 
> in the uml tree.

The -tip version (48199713a6a8) has gone away now that it was picked up 
by the maintainer, so this should all be resolved in tomorrow's -next.

Thanks,

	Ingo

