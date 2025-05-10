Return-Path: <linux-next+bounces-6659-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F14AB214C
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 07:33:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8875B1BA36B2
	for <lists+linux-next@lfdr.de>; Sat, 10 May 2025 05:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D3D136672;
	Sat, 10 May 2025 05:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UghYKtZq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9D63D6A;
	Sat, 10 May 2025 05:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746855197; cv=none; b=MDthFezHGZXfOdceK7llIo6yuQjzoOWO43GvLqRuXIW3MpzqhtiTNonK/ilmjj5W7ZYfhf1aZPvmVkRcWADz4yJiFMc330w7EG3ZSd88kQWTPV4uI0FnsBRRQDDOa8qCUgRzGZnPMd/or/7qOrplY6I3z0T20MQz27q2M+f6dAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746855197; c=relaxed/simple;
	bh=VwjCQphGqjKITLICjAVqlj79IxthuExL0Y5AvgVDJU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ER0F6Wazg+uYG1puoj0ODvocVm8BQ6YqW7m1ZduaSeULLSBZKF+5GVIbs+diWfxUNcsSvqGyQJqgiaOsO7lweB1HjJt3uDTJCbxfd7w2W0X6iA91Hi0b6jwypfzfm43qc8ep0MFqLAAMZNlzZBEHoJN8DxPGKX9dH+Y/kmoyrhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UghYKtZq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31F6C4CEE2;
	Sat, 10 May 2025 05:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746855195;
	bh=VwjCQphGqjKITLICjAVqlj79IxthuExL0Y5AvgVDJU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UghYKtZqXQYjNWAk8+/MO9TguERN1zSS1OX2UKvq+++BWeW155VDvZB5lAX6SwuRS
	 6YHwRdC4LVNNcRpvnTMCqHDwxMSALkXC7isHi9uTIKAHWcQxyhLbw/zEskzOHSrbM4
	 F+KXQsoZgPCMh1m7IWKBg+n9qm068VxwwgcoQ+YZYubEt5A6shRs5LeREoXtXeJ/CS
	 l+a/I+iDF9aWnPMoCyqlq74APfPYiXNt0VeRaW1dxBNdxMG0Z5JP0iEMzNAJ9N6t8U
	 XG3Pj6KEwAttW+e+IqPfmKAg2wEaaO8nJWRl8UrecFU42UlrlrEhIDjRz/8soBYqgH
	 sBX6/LQ64pPug==
Date: Fri, 9 May 2025 22:33:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Message-ID: <20250510053308.GB505731@sol>
References: <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aB7fvi_FBdnmLUON@gondor.apana.org.au>

On Sat, May 10, 2025 at 01:10:22PM +0800, Herbert Xu wrote:
> On Fri, May 09, 2025 at 09:44:50PM -0700, Eric Biggers wrote:
> >
> > This fixes "-cpu Power10", but older CPUs (e.g. "-cpu POWER9") are still
> > failing.
> 
> You're right.  I'll revert this and apply the following patch
> instead.
> 
> BTW this thing is still hopelessly broken if it's called from
> softirq context because there is no SIMD fallback.  Yes I removed
> the SIMD check but it was already broken before that as it simply
> switched from the 4-block version to the 1-block version if SIMD
> is not available rather than actually doing something that is
> safe in softirq context.
> 
> Perhaps we should just remove this altogether until it's fixed.

Yes, the PowerPC Poly1305 code incorrectly uses VSX without first checking
crypto_simd_usable().  And PowerPC also doesn't support VSX in softirqs, or at
least it doesn't claim to (it doesn't override may_use_simd(), so it gets the
default from include/asm-generic/simd.h which returns false in softirq context).
Maybe add 'depends on BROKEN' to CRYPTO_POLY1305_P10 for now, and give the
PowerPC folks (Cc'ed) a chance to fix this before removing the code.

- Eric

