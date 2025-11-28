Return-Path: <linux-next+bounces-9262-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE09C91928
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 11:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 411A84E24DB
	for <lists+linux-next@lfdr.de>; Fri, 28 Nov 2025 10:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D1A3081DF;
	Fri, 28 Nov 2025 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEEifhwO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77E8242D97;
	Fri, 28 Nov 2025 10:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764324560; cv=none; b=iBPq8/yJQtiv03PjWTFJ6jhYRmK72A5NZH1N8N7BX9tHEcpAe84gcQl9/6eKSg/YP7Ky/LOiHfWDm8Ndy8tiJHmldwF0QlsLmg3NjaQaTMmCOUrOV5BjewCk90NYK1QdTMeMG+1XGwkcaFc5WpakVAM5/rWWD8d/NXNZH71o9lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764324560; c=relaxed/simple;
	bh=r4e4C3OvLyQIwPPk1yJFpHRaatnJcOX0hMUxsiNMRho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUBlINrtM36n+bzWNNg0wc3fSNMAnjVYOxuKDoPnu8CkHCfVsLaUN3zfdYFcoJldaMh+BIBBsDS+UIv9kapv3MOX8DYjxTbLDnlC2JWK4lizWGWwLYPtTTz/CQS2GgJcZqAIfzG5zR4Wf1DKqi6l1QzgEVMC4GDXeqEQw7zUQFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEEifhwO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D6FC4CEF1;
	Fri, 28 Nov 2025 10:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764324560;
	bh=r4e4C3OvLyQIwPPk1yJFpHRaatnJcOX0hMUxsiNMRho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEEifhwOQLudhJP/eHnRvml4ncJq1TWoqI0YpPiZrKkwhpDugDYM8gGQG6XaeBJvX
	 LaBCdKi5t4jW/H5OFcI4VrID4L0S9ReaU5yAXVBsDig4m3wqFFDEOnM64h4MYdcyat
	 R+I4jp3Sfm2KTobSGygEfXoiYgtoh1XbgdXFRMl1YjFo4idRmG093xY3//zGaWLX36
	 uGPPpPmszeoUvZdTq2u1rh57Z/gH7Un23LwYTIMT9bdlqBBFi2/FdfDrytOPvL/eB9
	 Y5FpoAuqdmeTEO0m020rTeXAMGeW8cA87dvxhskvpo1Vz6lQFTkinxWsB+SFe9EwWS
	 zC3mx0m58vDvw==
Date: Fri, 28 Nov 2025 11:09:16 +0100
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20251128-semester-ausnimmt-1261dfc6153b@brauner>
References: <20251106094951.6fe49332@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106094951.6fe49332@canb.auug.org.au>

On Thu, Nov 06, 2025 at 09:49:51AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from include/linux/compat.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:13:
> include/linux/fs.h:1431:1: error: version control conflict marker in file
>  1431 | <<<<<<< HEAD
>       | ^~~~~~~
> 
> and it went downhill from there :-(
> 
> Caused by commit
> 
>   3fef0b63fe1c ("Merge branch 'vfs-6.19.fs_header' into vfs.all")
> 
> Please, the order is merge stuff, test, publish ... :-(
> 
> I refetched the vfs-brauner tree (which has been updated) and tried again.

Hm, it gets tested ofc I'll take a look at the infra to figure out why
it got pushed after a build failure.

