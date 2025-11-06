Return-Path: <linux-next+bounces-8869-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F261C3909C
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 04:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 636A84EF27E
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 03:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ED3E2253EC;
	Thu,  6 Nov 2025 03:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KAuVus+d"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1187F18EAB;
	Thu,  6 Nov 2025 03:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762401423; cv=none; b=m/zn40kNk6MBRK6plmqkULMkC3afWRwe0YHaXeMJ6vLX6/e6vt5dXLzlb/zNw6WcEEELA3hhQhwbYV55cO20U29qPZps0L7g8XATQ3ePzjAiliQqWY3XBR/Pt2NmoeosDVJxWLL8l/xYFi8b0eWRFn3+z5h8inDFzYxTnezcCZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762401423; c=relaxed/simple;
	bh=3DGLDGYWy2Rqy3ANrqvg1wmKrzxrnVatj4+j1+4JM/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bb5u4WE6EV5Q5WlxuYSscq4Q8WNqBJS2WYQX69PoplOr3TBZ/1VPzmYIdnIuGIJr6/vWZhw7lK5y/7SjFZNyLh5A40yJIlp4bekHBApBQUV/SiB4KdHtvieb7hirF6fuDylKCR+/ac54TUdx1Be/Vv4MCivGBJJzjV/E7JIsRV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KAuVus+d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53937C4CEFB;
	Thu,  6 Nov 2025 03:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762401422;
	bh=3DGLDGYWy2Rqy3ANrqvg1wmKrzxrnVatj4+j1+4JM/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAuVus+dmtTw5zUSJeLLMlm03p0hHQW9B1xgSUsrzpSCKwkt8tTTJFKH3YToI/Jlp
	 iONB6F4RilFfckhzZoF+dk1uCFcVGIInEDY8qTGLykxqDcxPxfKerOfuVTFgiHuiTj
	 sRKrS15ZiJIehI/xtJIxVQsdQ3oE6jsZ6xAgEVT/baKc+l6yfF/WavVzXkTduDOoQG
	 m/czeNO8J1mdDog4AmxNPyBoFXR7k2q9ShFt9lkQZmnRFhA3jfO2bKqre/Q0VfMHza
	 cyNnQEeavbK+2JEUnq1pZnCgHtYqISc3Y0HIgkoMSpJ9oSulyl03mpxm11HpQA0p9H
	 AJoYUkBeH1MLw==
Date: Wed, 5 Nov 2025 19:55:21 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Linux Crypto List <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the libcrypto tree
Message-ID: <20251106035521.GA1650@sol>
References: <20251106143623.06b23d57@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106143623.06b23d57@canb.auug.org.au>

On Thu, Nov 06, 2025 at 02:36:23PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the libcrypto tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> WARNING: /home/sfr/kernels/next/next/include/crypto/sha3.h:74 This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
>  * Zeroize a sha3_ctx.  This is already called by sha3_final().  Call this
> 
> Introduced by commit
> 
>   58873ecf091b ("lib/crypto: sha3: Add SHA-3 support")

Thanks.  Do you know if there's an easy way to find these ahead of time?
I usually run './scripts/kernel-doc -v -none ${filename}' to catch
kerneldoc issues.  I did run it on include/crypto/sha3.h, but for some
reason it doesn't detect this issue.

'make htmldocs' doesn't find it either, but does generate a bunch of
unrelated warnings.  I may be missing an option to make it even more
verbose.  Either way, it's also slow to run.

- Eric

