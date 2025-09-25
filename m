Return-Path: <linux-next+bounces-8499-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D80BA1012
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 20:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 102B31BC706F
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 18:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0C4315D33;
	Thu, 25 Sep 2025 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="wlo7M4e5"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D7C314B90;
	Thu, 25 Sep 2025 18:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758824801; cv=none; b=B8QLTEAyFVLHowQi6KIY9q00xz4g3u3fPFXKScUcWzfSyWHyeh2bXa38xYf+WRmn0IfN+4bsNuPPeDgXEtzenZ34WQ7iwp4cGweqZVugRkTrOrTa/Y4diMLwfDgeERrM89Vy/t8mdGtMhAcgVJvv/ZocRw921+LYtfJyUX3qqYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758824801; c=relaxed/simple;
	bh=1BKTLCkeo3mikppbV+v2f+Gdr0HOJhMCtC60+FD5xyA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=IAx04jFf+Bnga2kzqd0mcgwm3Awj08DIHqIxDfhRlAptZNaoIp8SHUYA59kSPwLEqTTvzbxZdz84bMFPk5FSlJ+nSHva0D0QRd+7P72mBJ03TaicLPMiZg5pYnu2+mjSR8mc4RTSz2ZgCCJ8avqoqhan9Dp8klehaek9FL+tZkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=wlo7M4e5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA7B7C4CEF0;
	Thu, 25 Sep 2025 18:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1758824800;
	bh=1BKTLCkeo3mikppbV+v2f+Gdr0HOJhMCtC60+FD5xyA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=wlo7M4e55I2J73+hvrMZfbQ/gqnssDqkelFvnXBq9hmuN+oAZQMkJb4NgCZTTWue1
	 kKf5I7+8yST/Cue7FXVWMF0/Eh5vwppJJgeBh9V0vHfgGm9inAHDN8qpKDpC86yPW+
	 jYCn/1cOC8jiaK20OFhfvUG1Zt76Re5t6gyflgw8=
Date: Thu, 25 Sep 2025 11:26:40 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Paul Walmsley <pjw@kernel.org>
Subject: Re: linux-next: manual merge of the mm-stable tree with the
 mm-hotfixes tree
Message-Id: <20250925112640.573c99e5bab74dc36b18fd75@linux-foundation.org>
In-Reply-To: <aNU8moQVmqvduSPU@sirena.org.uk>
References: <aNU8moQVmqvduSPU@sirena.org.uk>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 25 Sep 2025 13:59:06 +0100 Mark Brown <broonie@kernel.org> wrote:

> Hi all,
> 
> Today's linux-next merge of the mm-stable tree got a conflict in:
> 
>   arch/riscv/include/asm/pgtable.h
> 
> between commit:
> 
>   668208b161a0b ("riscv: use an atomic xchg in pudp_huge_get_and_clear()")
> 
> from the mm-hotfixes tree and commit:

This is in the mm-stable tree.

>   546e42c8c6d94 ("riscv: Use an atomic xchg in pudp_huge_get_and_clear()")
> 
> from the mm-stable tree.

And this will be from a riscv tree, I assume.

> I fixed it up (see below) and can carry the fix as necessary.

Please just take the version from the riscv tree.



