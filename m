Return-Path: <linux-next+bounces-5274-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C84A17710
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 06:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B60D7A3DB2
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2025 05:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387C285931;
	Tue, 21 Jan 2025 05:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="KNIM8MCT"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CA3383;
	Tue, 21 Jan 2025 05:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737438132; cv=none; b=qzxzf9F7441JDvMo2S/Coq59nXFPi4+8XTMSlrWRG0/eURmrhZHVoeDRrWHqJbk2TF4De9ouqIY80kc4XdP4et+NLyF+HFE9LffqB2jshOwDhamlOQd7iPrLl8bWSRnNiWQvN6YLGuUPMDEv7zpe0EZf8vGegVjEbayyNyYdS1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737438132; c=relaxed/simple;
	bh=hrRT5NkSNav7YmyMcq4pdCINebmNKeSj7GKgvPhGR2M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cnczQiDutBUvdXs8nPSUzP/UeptQeR0iMvuJOigQ41MYR/69gWaERc9tTXeDMd1Pvq91Dn1ps50/1WMPKyX5Gy8bQ/KFQQodtDI7ltq4scS5Mk0kWdRAnpalDc1p4kL4kbsET51JRO4xA4zkDdgD+kN20kD3OiJnuMVZ480ROd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=KNIM8MCT; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1737438116;
	bh=W5rlUE9pSuUHpHz6caHGNTYQd/mhE+46jBfxUUf3PRk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KNIM8MCTHi60AX2o3imk1smnxRbChwAnrO46jhiV2Ror/nTwFBPW8niGYyBZTgZoZ
	 gxBmkSaQYFtYFOq9w9g16eMNxTFVk76sbwLhXSU4VaXZgmjHn2vv5cT0g4boYF/IV8
	 R8DnNy2s6cUzyfsPEnCEBDfvXsjJEwp8H2LLhhjZ/MxDsdghzXgxmhOi5RIoC9jNO7
	 XswmMLYpqMKx+RjlXZtoQhYJEP9qc7P7NwPPIkyVlJL2ApVxS4+LFW0FqvqfAGHEnz
	 41YY9b9clCaH389eGbmLUl7LDtjMHLAau1wtFAUi2Eg71ncjY12TQFF1B6DiWzSYUK
	 qN5AawrVDbUpQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YcbgS0gNsz4x2g;
	Tue, 21 Jan 2025 16:41:56 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Madhavan Srinivasan
 <maddy@linux.ibm.com>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the powerpc tree
In-Reply-To: <20250117174051.532c5772@canb.auug.org.au>
References: <20250117174051.532c5772@canb.auug.org.au>
Date: Tue, 21 Jan 2025 16:42:01 +1100
Message-ID: <87msfk4tau.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
>
>   7fee0217538a ("MAINTAINERS: powerpc: Update my status")
>
> This is commit
>
>   77a903cd8e5a ("MAINTAINERS: powerpc: Update my status")
>
> in Linus' tree.

Sorry my fault. I asked Maddy to apply it without noticing that Linus
had already applied it.

cheers

