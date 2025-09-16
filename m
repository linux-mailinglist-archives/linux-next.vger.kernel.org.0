Return-Path: <linux-next+bounces-8323-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC79CB590E4
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 10:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F1011BC20FD
	for <lists+linux-next@lfdr.de>; Tue, 16 Sep 2025 08:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10162868BA;
	Tue, 16 Sep 2025 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RKxmxzcv"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7802286435;
	Tue, 16 Sep 2025 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758011865; cv=none; b=YS26B+aWSw3siBox5uxEd9/FzwFQG3l74OvVyVu7+QR+rK6CBgxJ/0K2Ebj5p6f4NJERoTpI4kjBn6zloXDoMfjsuwbAOVenP1qkT8vwqUBcCTtFDBeZlPBrK9M4fuDiTLUvr2sUVHrcBRGQ8Hh6ovgPHOGEhoryoy+DP4NSOKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758011865; c=relaxed/simple;
	bh=wUX2z4ja6u3M96oDmX5gE4IbwOQNn2IdFfGSkgLpC48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EX218yrcqaXCaqy3bN8tEGXViXiJH+Jsv2GXqgtICdNAGJB7PmnJkSoUIlPCl4mx4y2v/WIcZAB1rmdrMjOybWI3e2sPJ/l6pMYc2nWoziDg/co/2CyzvlrdwlPvZZrnToV8oaoAQyriRx5OB8SvBqCaFRrPsP/hCSrQqiahJ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RKxmxzcv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6D2C4CEEB;
	Tue, 16 Sep 2025 08:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758011865;
	bh=wUX2z4ja6u3M96oDmX5gE4IbwOQNn2IdFfGSkgLpC48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RKxmxzcvmLzYPkuQ5CRrVlLCHoml7ORoViM2WDhWuHnzx8Htmbe7/aqrfXQCc1skM
	 49Jrqd5Jx9fswF6lVd+3Q/nlyjdhqNV1zfthuwhvbK5YeAjJFkCRH0otEQw89rbaRE
	 wK+HUZODyjwF4DvCYnz2P6be93PVZ2QkrWAM+tigt+7qzjBHY8QAE0HxIZpGL0+RQo
	 UuPztyjK9F9cViAVRDJpk+xzDbv4IVSyhc6PG4erXgSLqFt5WnZ91gnNKw7w7oOglT
	 E4gvKU/pt/wEHPY6OXq6i2LJNbeQc7+tZ45d35OT6qm6jtQDTFc9fkChi6ATJvbljo
	 hIIP6IjrZ0AYQ==
Date: Tue, 16 Sep 2025 09:37:41 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-ID: <20250916083741.GE1637058@google.com>
References: <20250912130919.47804780@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250912130919.47804780@canb.auug.org.au>

On Fri, 12 Sep 2025, Stephen Rothwell wrote:

> Hi all,
> 
> The following commit is also in the mfd tree as a different commit
> (but the same patch):
> 
>   23fc2a41a2c6 ("dt-bindings: mfd: aspeed: Add AST2700 SCU compatibles")
> 
> This is commit
> 
>   9ea57a192d35 ("dt-bindings: mfd: aspeed: Add AST2700 SCU compatibles")

It appears as though the author continued to post the whole set 2 more
times after 3rd September when this patch was applied to the MFD tree.

According to the tip-bot, Thomas then applied the whole set on the 9th
September.

Thomas, are you able to drop this from your tree?

-- 
Lee Jones [李琼斯]

