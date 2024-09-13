Return-Path: <linux-next+bounces-3808-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A8597772E
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 05:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD1181F250F7
	for <lists+linux-next@lfdr.de>; Fri, 13 Sep 2024 03:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62AA1A76C3;
	Fri, 13 Sep 2024 03:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/ymLiif"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978BA1E884;
	Fri, 13 Sep 2024 03:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726196744; cv=none; b=aMUm3IBnKqgijpkH5AkmQde94tfzxyO+N2LcXiuDEn7MjJeCy0vISy/POQvsixnDptWCe3oCG1JIuevu9RrBjvNc/rWX8ZV0vC5BfkibzVk95NiO6ULV4xFxxv7xzrVrhqxfiEfeNOiy7RfoSGB9LNbs0AiYUbNr42l3joiAzR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726196744; c=relaxed/simple;
	bh=YM8lctxC687BzgduCQXDPOyU+3EG7NZWn50rPAtYyJc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HVwmfwJjZIQbdur8Ozwusa9lv1FX/1Qz3fBl46K50p9J2yV0duWpPYvVuah5G5pojd3eG6qa6iX6kO12bbrR5sJHmDQlTPE9W3U2OcHJk6zx2OKVmMWSs0SQb2Uf16hXdg8oYuI5icqT8PrSp//dLoe7fDy9baCxH9ACD7nJnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/ymLiif; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF48DC4CEC3;
	Fri, 13 Sep 2024 03:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726196744;
	bh=YM8lctxC687BzgduCQXDPOyU+3EG7NZWn50rPAtYyJc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P/ymLiifKV58I2dvLuJAhMWqopoKBrIHuBj47TnVkWZiI2IXGCnCoD7r5mHBXeO1b
	 qFxT1PLgcmRTrJKpWTCm6uR4Zc7Ez8xXAzI+TgIZmAN6B1krqHW+Ssu+qL6hdSRTZU
	 sYEFtXBKRBiC0PuuGc46Hf4EMzb68FvRJ17qj3S/gKtLqEGUbKlcxkrdsT53Xc971I
	 xZgP0Q7JRU1/QAo73w5HRYTWa8kq7/al3NF753JbnbMQeq1kdGPEGbSxXxcrkcPp9b
	 FNz7TWRn8cxbuvdwwBM1vCPle98hY4cnYwcrjD/dh3wrsLpBPmMh8Ijq7mHAK7M+7Z
	 Lr47MpmK2T4uA==
Date: Thu, 12 Sep 2024 20:05:43 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Mina Almasry <almasrymina@google.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240912200543.2d5ff757@kernel.org>
In-Reply-To: <20240913125302.0a06b4c7@canb.auug.org.au>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Sep 2024 12:53:02 +1000 Stephen Rothwell wrote:
> /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is not a multiple of 4)
> make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229: net/core/page_pool.o] Error 1

Ugh, bad times for networking, I just "fixed" the HSR one a few hours
ago. Any idea what line of code this is? I'm dusting off my powerpc
build but the error is somewhat enigmatic.

