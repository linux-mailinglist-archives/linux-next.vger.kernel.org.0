Return-Path: <linux-next+bounces-6548-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD258AAC308
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 13:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C27AA189DA05
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 11:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E94221D93;
	Tue,  6 May 2025 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uU/IQUu2"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48ACEB665;
	Tue,  6 May 2025 11:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746532032; cv=none; b=C2fePGz1yfliNMRbT6l0bfC0iRZ5GbfYeRLYchpG64ANFIhe/VAlRfc9lMJyetzkDIm0MgGhz/ycizqtNcrBlKFln5ZuVJbxCHEz4t4XPAXvN1eX7++ZjYlvEMHqhhKn9li5gfpn08aWgdUc+CDIeEzgmJRK9FF6LlVGaOo86Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746532032; c=relaxed/simple;
	bh=pgme4db0HVf3ULte0O2xM3spLwKaE8qC/9jXQdHimkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Adg9MgCZfP7+PWPcz23OqwPPx/Z3krUpMVkKWAgESEtvZn+Ig+w5VqTu8cURcRrzQt/XQVIQkbZL3/R0BCoYkjQiJ3eXxRnggLtchqtDfjhRr7PNcYr5a+1LMVUGYM0Rzlm1cf9kyY6ur4TQ/Mp4FfzUNoTnTY6b2vXaW0SlQYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uU/IQUu2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3833EC4CEEE;
	Tue,  6 May 2025 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746532031;
	bh=pgme4db0HVf3ULte0O2xM3spLwKaE8qC/9jXQdHimkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uU/IQUu2uTLP4EgDx2Z4TlXN+bQ11NA00hH+kcCNVSCHI9d3zOyKXkS+xQmVuYJK9
	 v6Kx/voZMzLCELx0rC8IGf4IYnMd0vAs10GPd9tvbzZrlzNEcUkPA58aCb59RiGEuH
	 HEIyiAuP7cmFciIAJBOzOwwC8gJtpv+26U7qelksZx6S18uGu52PTXzvJ6AilPG0dd
	 RgKuxSSnP7B3t1/WGm64ggA3QywsS72lYqpFX7v5S0gF1gI48Lwqqsph9dSpkEvFcH
	 9ykwjllTdcaNoP/24Z3tkisTs9+mW0Ji1YaA7CsRoBcvL4x5wrDRuK24YrqQhfy2pL
	 1YT/t2Wx/EHrA==
Date: Tue, 6 May 2025 13:47:08 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the i2c-host tree
Message-ID: <bxojzupzygifyhvjj4wwneyzvsbe5nr6fqsvy2xzjyxyban34p@756t6bmzutro>
References: <20250506191114.1809d6ba@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506191114.1809d6ba@canb.auug.org.au>

Hi Stephen,

On Tue, May 06, 2025 at 07:11:14PM +1000, Stephen Rothwell wrote:
> After merging the i2c-host tree, today's linux-next build (i386 defconfig)
> failed like this:
> 
> drivers/i2c/busses/i2c-i801.c: In function 'i801_probe_optional_targets':
> drivers/i2c/busses/i2c-i801.c:1180:54: error: 'struct i801_priv' has no member named 'mux_pdev'
>  1180 |         if (!IS_ENABLED(CONFIG_I2C_I801_MUX) || !priv->mux_pdev) {

uh yes, priv->mux_pdev is defined under CONFIG_I2C_I801_MUX.

Thanks Stephen! I will add this conditional compile test in my
flow.

I will revert the commit for now, as well.

Thank you,
Andi

