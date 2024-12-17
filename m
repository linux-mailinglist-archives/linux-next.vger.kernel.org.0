Return-Path: <linux-next+bounces-4978-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB49F3ECE
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 01:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE6DC1886C31
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2024 00:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F178467;
	Tue, 17 Dec 2024 00:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S06IeFWY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1BC647;
	Tue, 17 Dec 2024 00:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734395623; cv=none; b=QmPzOse1RIcILqQCJiwugxpU84132ybiPEK3hNN8yNXOIXKOEHI8e/N6G/nxhjniB36Pw3qEV8yZwVE++cMymqe2EpTPTPaxmXH6+gmKNar46uYij0hmgmsJACXc99HUmbW9Y3BkLHx1RGSK1QEuiZ3Li+WvGjVPBTuP6GdQQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734395623; c=relaxed/simple;
	bh=mnKuPjoaSWWAxDvnxk4zqCLZLZwYWmKdxNCkGDv+cFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lD+1/AGcSWI29O6qCfG3jf8V5mUrucF+vAVvK6cTrAUDGjLHKQgo4lTydXeTqHkzUoTjwSyn2te6TSUiMCkDk8TQMlw/YYhrEiEa/fC3j02Th1MsovSlOBE2zgZ5HYvr8329BqHqtlLMGzeg9c514cezC001pV3pCksu/E0+YgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S06IeFWY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DAC6C4CED0;
	Tue, 17 Dec 2024 00:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734395622;
	bh=mnKuPjoaSWWAxDvnxk4zqCLZLZwYWmKdxNCkGDv+cFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S06IeFWYFvkohQaAQy118Xgy+pbAkKC7oX5UXQTtQvuhjVtplNNod/cmHKtilh29K
	 OCt3p5fHK+/HVz81rDmKECPmJ2UmS5hs/Ijs4H1Gq4wAsBpwodxnSV7ciSCUgueJMI
	 2q1JiQs2+gVa0PtfemdW1qDlwXFiIJdwWTfA+5Q3qDXyMSpWVxmulsT7Brhirv6tSY
	 SWA8x+GfveB8yrOrkJrb5gGY9u0m2yjvlGjSlEFeSKLhLWyTgJxdtpPPjz7xebmeT2
	 vsc/XW3Ilp8Y82Nu53n+OPHiN1nGo7Y+2G6sJZRuBNlzp1wkjbcbs26zvERdEXhin4
	 TXXXMfsqFy3+g==
Date: Mon, 16 Dec 2024 21:33:39 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Ruffalo Lavoisier <ruffalolavoisier@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the perf tree
Message-ID: <Z2DG41WOlZgQl9Ue@x1>
References: <20241216082725.2ef47ce1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216082725.2ef47ce1@canb.auug.org.au>

On Mon, Dec 16, 2024 at 08:27:25AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   8791a78fb70e ("perf test: Remove duplicate word")
> 
> is missing a Signed-off-by from its author.
> 
> This is probably not necessarily necessary ;-)

:-)

I can force push after the original author provides the Signed-off-by,
but for such a simple patch can we just keep things as-is?

Is that that what you're saying?

- Arnaldo

