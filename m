Return-Path: <linux-next+bounces-5426-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C03A32B9D
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 17:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E88AC7A1C96
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 16:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665E020F088;
	Wed, 12 Feb 2025 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+ZZAGN0"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0953398A;
	Wed, 12 Feb 2025 16:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739377940; cv=none; b=QOcP4To2IxiXLjdGO/NU83Q1d/BnIbS0JVu/mLjMu+daXqBaRZu/BG+EHrZJC0zbrflKqtqgSvD3Yl7XEisLsqFWDnigWqwPbQcsJvFvOHRhw2Uw+JIavTElq5I4WESJZTzbW7dp+2B8I5NFWrrvk5pwC0rhZpTvLyA05YM1+3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739377940; c=relaxed/simple;
	bh=4qPZZNO9Xgqax2PtEJrDHZXxcfS02n/00e7Nf8UKaQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BpLR/BCSvkdh7FFiNoX8LsVo+N2iWSBqpwx5R6Dc0YJTx5JqoSR1E4s8eLSGigvTMFpe8vqbJKo/6LducBYBqbOvLoLWuwFwjpS7Zzpadc8Nmi6d6J6ejDbdsimiYY6i4rK+KLqIxzX/uF4HPqYgkm1SwqyctPm+xbvk9SKzuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+ZZAGN0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F37C4CEDF;
	Wed, 12 Feb 2025 16:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739377939;
	bh=4qPZZNO9Xgqax2PtEJrDHZXxcfS02n/00e7Nf8UKaQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O+ZZAGN0IBA0W7WyLGWX+3P/DY56otcilf0I1A/1r46s6dxmxCb9YGE0KOuVG1H3/
	 8AWArpcI0z2QvSSaJHSm/K5cqd/AEHlR1J+/lKgfflV/o0ZumW4vGkpRRJ//CWgZfy
	 MEFA8e076+RAlqL5EsmHFh9rXdq26qEBhRMD/ygetCFFSzYP6KlhgCw6JH9zFloMFY
	 RhiSjrPovCqAUIwWDc1FJi6lCw8bOrQmPp6bSv51cNkZgr7vfm2MIEc5a+g4UJtSKk
	 Dg6aYjkhEfKfQUmXGAHjScHDYpdho+uvhyRlHxEEDhNZo5jzCmfWxhXryVoO8flu0G
	 aD02rAoDw038g==
Message-ID: <8e27ccd9-47c4-45f0-ad93-b88d603108b4@kernel.org>
Date: Wed, 12 Feb 2025 22:02:09 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: trees being removed
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jeff Layton <jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>,
 Joel Stanley <joel@jms.id.au>, Kent Overstreet <kent.overstreet@linux.dev>,
 Linus Walleij <linus.walleij@linaro.org>, Nick Terrell <terrelln@fb.com>,
 Vineet Gupta <vgupta@kernel.org>
References: <20250212095632.6bdd50d7@canb.auug.org.au>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20250212095632.6bdd50d7@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/12/25 04:26, Stephen Rothwell wrote:
> The following trees are going to be removed from linux-next because they
> have not been updated in more than a year.  If you want a tree restored,
> just let me know (and update its branch).
>
> Tree			Last commit date
>   URL
>   comits (if any)
> ----			----------------
> arc			2023-09-10 16:28:41 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git#for-next

Ack: We don't need 2 next tending trees for ARC any longer.

Cheers,
-Vineet

> file-locks		2023-09-01 08:09:48 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git#locks-next
> fsi			2023-12-14 19:44:11 +1030
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/fsi.git#next
>   ec084e4ec314 ("fsi: sbefifo: Bump up user write cmd length")
>   f7236a0c919e ("fsi: sbefifo: Handle pending write command")
>   c5eeb63edac9 ("fsi: Fix panic on scom file read")
> gpio			2023-09-10 16:28:41 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git#for-next
> header_cleanup		2024-01-15 15:52:12 -0500
>   git://evilpiepirate.org/bcachefs.git#header_cleanup
> kspp-gustavo		2024-01-21 14:11:32 -0800
>   git://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git#for-next/kspp
> tsm			2023-10-19 18:12:00 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/djbw/linux#tsm-next
> zstd			2023-11-20 14:49:34 -0800
>   https://github.com/terrelln/linux.git#zstd-next
>   98988fc8e9ed ("zstd: import upstream v1.5.5")
>   40eb0e915deb ("zstd: Backport Huffman speed improvement from upstream")
>   3f832dfb8a8e ("zstd: fix g_debuglevel export warning")
> zstd-fixes		2023-11-14 17:12:52 -0800
>   https://github.com/terrelln/linux.git#zstd-linus
>


