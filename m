Return-Path: <linux-next+bounces-6754-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DAFAB5F50
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 00:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70AEB19E6E67
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 22:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36FE51F2B85;
	Tue, 13 May 2025 22:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xgmm++rC";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ylCeGvmb"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9081878F43;
	Tue, 13 May 2025 22:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747175627; cv=none; b=JNTCnblLqF3LLavTkLwqG+jv5aFQq8biHEk8gdr2X67Amr6k+sLDxG2H0DYxGnprdAdcaRxxoaqM542GWKviAZ9Tt4A2CWPDXMxNGTuACXyVLPQ5LSYW7J6TIW7iZ1OrDFMbZXDs/ea6nyf6WGalKk041XNYqUvZn8BaiuAIxQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747175627; c=relaxed/simple;
	bh=YUNyQIe2U9PIChTRWi/w1n2BI+PrjEJrqXJnOcNN0QI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xpy49KPKywiCoU6N1yColfsWQqEiN9oQSOOM/UyZPfycpRMwFage52oIISp4fC4NZEZgIGzlTLDbCGapj9ytj+A5AS9Gcek+CN9tn2wl1bd+qZ7NVKbo4txnC5sdzPVZiXztTOg5VjRDVsTgs5AKiIGR7+mfLszynZ3EMB8WMvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xgmm++rC; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ylCeGvmb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747175623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBu6jOiYhKDCfpRwEEfnOMMozIrEopxusl8R7L65TRE=;
	b=Xgmm++rCS5or8sQP/V7FV/7I+gu417wa64wrkUW9S4eApJbYYv5izpvXL5MMT+OVgLxsP6
	hDkmUzmeK3eLTvoiMSQQYCUnGC948WCuRu8UAb9upD9pyHiKqPqktl0O79sKs61w+rUCg0
	b575qo2yKoIvXORefoPqA1FnlvXXUf7ZzTwRZj44JIEfraet4gt/DwlEgxNoKpPkVW09mH
	wfJULnEir8zySqw/lrsdqdthDup5E+ALI0F1awUycTjZnj6lpZJ9hodhQIh/6+nAxwx4nj
	CiBFGwYAI/4os7x/QlrEn7RkuQuCgDEyxWrnx7ioVUyXcqkszJwgG57LI/92oQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747175623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBu6jOiYhKDCfpRwEEfnOMMozIrEopxusl8R7L65TRE=;
	b=ylCeGvmb66S/kbdelfb34eDz/rLFmMWgKMuM+s29oM1cPIpq4R3C1s5iqkgKhT3zueuwrC
	Tkpj96byw+nnTjDw==
To: Bert Karwatzki <spasswolf@web.de>, linux-kernel@vger.kernel.org
Cc: Bert Karwatzki <spasswolf@web.de>, linux-next@vger.kernel.org,
 llvm@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Subject: Re: lockup and kernel panic in linux-next-202505{09,12} when
 compiled with clang
In-Reply-To: <20250513164807.51780-1-spasswolf@web.de>
References: <20250513164807.51780-1-spasswolf@web.de>
Date: Wed, 14 May 2025 00:33:39 +0200
Message-ID: <87h61ojg3g.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, May 13 2025 at 18:48, Bert Karwatzki wrote:
>> 
>> I'll now start a bisection where I revert 76a853f86c97 where possible in
>> order to find the remaining bugs.
>
> The second bisection (from v6.15-rc6 to next-20250512) is finished now:
>
> This commit leads to lockups and kernel panics after
> watching ~5-10min of a youtube video while compiling a kernel,
> reverting it in next-20250512 is possible:
> 76a853f86c97 ("wifi: free SKBTX_WIFI_STATUS skb tx_flags flag")
> This commit leads to the boot failure, reverting leads to the
> compile error it is supposed to fix:
> 97f4b999e0c8 ("genirq: Use scoped_guard() to shut clang up")

I really have a hard time to understand what you are trying to explain
here. 'This commit leads..' is so unspecified that I can't make any
sense of it.

Also please make sure that you have commit b5fcb6898202 ("genirq: Ensure
flags in lock guard is consistently initialized") in your tree when
re-testing. That's fixing another subtle (AFAICT clang only) problem in
the guard conversion. If it's not in next yet, you can just merge

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core

into next or wait for the next next integration.

Thanks

        tglx





