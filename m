Return-Path: <linux-next+bounces-8661-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1BDBF2B45
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 19:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AC96F4E7C9F
	for <lists+linux-next@lfdr.de>; Mon, 20 Oct 2025 17:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8881D32ED3E;
	Mon, 20 Oct 2025 17:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MN2FwggB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E68F221FC8;
	Mon, 20 Oct 2025 17:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760981241; cv=none; b=FGY7Bee6wpYzrg7pprX3ApFWjlf8HTPOd+PkYqnUExrGHBBFUtKcvKxxy6RJycLK8iSyQJE55H5NP1uDMcTphVp6SvuaYcKeGiQnQZ/LJA2HfNg6xycShuiJHWAoJM3msslyWo+QSVzV0/itkLrKM4Uoi2TqjfrcBq+KegGW1KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760981241; c=relaxed/simple;
	bh=1nxTYEr3g0K0qeXqz/n2wn9f9jvWRwFO2vxNmohFYVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dujckdp7+cRAe8ahq0Seq0SslBw2I7sId8elD4789/7DNyZTnRL2ikDqnXWfqpo+43ADgaowRLh8sVAF3pdeieIXYGEuq4DyS+yN+ElvM+MSwm8fxbeLzzpHzL/uL/8md8WslfDjFIa2GzIOOr8NBzAEui520SVBcirUhLS1qRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MN2FwggB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE304C4CEF9;
	Mon, 20 Oct 2025 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760981240;
	bh=1nxTYEr3g0K0qeXqz/n2wn9f9jvWRwFO2vxNmohFYVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MN2FwggBYeELMkadIMAFGqvP3JaEfffNedw4L34MTSpLf3iUDJxYNVYgJ44kjhLgl
	 /EXMutpRZ+e3AwIR2LiH0s+WdevBeuLbgE24QABxsK1zMMI0fqS8yCQrCOOZtYnvUz
	 vBwvCfU4Er15HCMBwJFgS9x5+4NkJxXSddunFBemJH7XkTvc59ryQLgfqFjhd/vO+h
	 Ql6wL2SxMx3QZ7fJmGyJrb8mTTjIws5nE/r3oF2UvdLmi5zaaXsZBku/3/h/0Dr5VZ
	 ZucPrCPfmNnECJfMOMk44WVQurRazvvSZibAb4mWK515jo2RgBXMe5qNGlXKff9YR+
	 WHz3jwaMH5qQA==
Date: Mon, 20 Oct 2025 17:27:19 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wei Liu <wei.liu@kernel.org>,
	Mukesh Rathor <mrathor@linux.microsoft.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hyperv tree
Message-ID: <20251020172719.GA312639@liuwe-devbox-debian-v2.local>
References: <20251020133144.5e6e3d03@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020133144.5e6e3d03@canb.auug.org.au>

On Mon, Oct 20, 2025 at 01:31:44PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the hyperv tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> arch/x86/hyperv/hv_init.c: In function 'hyperv_init':
> arch/x86/hyperv/hv_init.c:558:17: error: implicit declaration of function 'hv_root_crash_init' [-Wimplicit-function-declaration]
>   558 |                 hv_root_crash_init();
>       |                 ^~~~~~~~~~~~~~~~~~
> 
> Caused by commit
> 
>   60116744be53 ("x86/hyperv: Enable build of hypervisor crashdump collection files")
> 
> $ grep CONFIG_MSHV_ROOT .config
> $
> 
> I have used the hyperv tree from next-20251017 for today.

Thanks for the report. I will fix it in hyperv-next.

Wei

> 
> -- 
> Cheers,
> Stephen Rothwell



