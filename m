Return-Path: <linux-next+bounces-4603-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C198D9BACAA
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 07:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C151B20A35
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 06:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 083ED176251;
	Mon,  4 Nov 2024 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NTHxueat"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80F338F97;
	Mon,  4 Nov 2024 06:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730702477; cv=none; b=KmyWgsPtF5/c8Cx+0q8Y1q8jL2l+SZyjruMhSdG55TjpsvbwbbXGmmuOXTRLvHmKFLm6JvoAjEPVmKQfWdFM1rU7oGIMfuSjdp7GfUDqlmzQSvch9nJ3rgoXYCQ9wzXnY0fhZNlp9+MgtFGgX2zFwIIwUJN+TQkb6tD9I2d/BVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730702477; c=relaxed/simple;
	bh=sMpThz9oFXBRIvMvkVTlQ32sp1+nA2+/1weOA4PoMTU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tw9k0vSjpiR4Es+n326bbwj4JxO8llZ9ELmf3hWvp2zyKe8HAzy5CzzEdz9Mk1IWE3U7jAKVs0zdFyzCTGAip2N9xb/FD6Tan4ivbTKfbYwExP2CfXMRyqubQcj0w3gl38iguE1c7RJvLzlyHs4I5TKzgRX44lgD1vlOSTO1++g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NTHxueat; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB70C4CECE;
	Mon,  4 Nov 2024 06:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1730702477;
	bh=sMpThz9oFXBRIvMvkVTlQ32sp1+nA2+/1weOA4PoMTU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NTHxueat7znv/CO+Mf1VLbrzf23JrMUHYTE9NWKnic4EEwv4mNx14+lhZfXYW9o+g
	 /+Zs2D7mpv7DUtEDbZlfGYfc8fDwrCUEMXbypbPqrNQFxYvBUSvOi58R8Y1pqMmjYR
	 w0Hqb+Qg3MnF6fBdQ83dFY/okgq2qaivpZg4gsNE=
Date: Sun, 3 Nov 2024 22:41:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kees Cook <kees@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the kspp tree
Message-Id: <20241103224116.85465356eb415b9d4e5a3459@linux-foundation.org>
In-Reply-To: <20241104164255.62f42928@canb.auug.org.au>
References: <20241104164255.62f42928@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 4 Nov 2024 16:42:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in the mm-hotfixes tree as a different commit
> (but the same patch):
> 
>   a508ef4b1dcc ("lib: string_helpers: silence snprintf() output truncation warning")
> 
> This is commit
> 
>   136dd147cdca ("lib: string_helpers: fix potential snprintf() output truncation")
> 
> in the mm-hotifxes-unstable branch of the mm-hotfixes tree.

um, OK, unsure how string_helpers are a hardening thing (more than
anything else could be) but whatevs.

The v2 patch appears to address James's v1 comments so I'll remove this
from mm.git.


