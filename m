Return-Path: <linux-next+bounces-2965-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A1892F646
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 09:32:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 434981F2375A
	for <lists+linux-next@lfdr.de>; Fri, 12 Jul 2024 07:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0922313DBA0;
	Fri, 12 Jul 2024 07:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiT5T+Nj"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A632030A;
	Fri, 12 Jul 2024 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720769503; cv=none; b=eI2RcpfxjijUo4/zXkEgrZ6zc5hzBAcow2uv7pvv7oxrDFISJWiBy7MrP2XlHr40o5cB+dpZe3acKNJUz31lAgQEc9kyo8LujP+J5KUDUQJDNb3UViVqU/OIQ/uCp5dNPFxPmEoaXB3ptU8QD+k8gIuDzB48TFxRQDcaZJcpL9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720769503; c=relaxed/simple;
	bh=ST+2O9383BDvNEn8kzfJyi6yzRIz7DzsE3D4ToMyiuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbbm5i7NNzVzsC/zcpPdZlACNXCDXgamLAPij3K3b0YhBYg3tsbYkDrMSZ4e5mgAdRnKtLh4tsl5OkEFass1/Y5Ts1VD0VHpEkzIg4J/1yMBNAEGSZRHqK3Xg49tnntxGnq1eCHk/oDAALXznUTKmYhY6sr9IH0XhLM2NwGbc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiT5T+Nj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C310C3277B;
	Fri, 12 Jul 2024 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720769503;
	bh=ST+2O9383BDvNEn8kzfJyi6yzRIz7DzsE3D4ToMyiuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XiT5T+NjiYFgB1AEJRrrLlEQXU93J0mc/aDaZ5KZtQeQagIf+W3OY0ul8quY2rBgR
	 nnqQGHEISSa/Qv+r0Ney0JiCadRwfgw9G8D6LRCx3GBzP9wcvBZLYmzvE5w+sXceWM
	 wvW1xAs4/ITN+DKXvMO6SEEdsJITiEzOWVx/2fxD4gny4kD2wBiNvF4x/9nFP+Uidr
	 ZhTqGc1nHEDRc8BGBN+r9+aF3AMk8yFQ3E8m7Sq03zb1gsePcNAYHPy/NTvhOTis2v
	 K7igp0V6MZ5RZtNXBxQ3Q54kst4Fo5/scMapa74rWJ/S2KUSCjmZWTgeCxpTHPlbtx
	 Ky4l+B4u6BdzA==
Date: Fri, 12 Jul 2024 08:31:39 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20240712073139.GO501857@google.com>
References: <20240712144831.269b1bc6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240712144831.269b1bc6@canb.auug.org.au>

Christian,

> Hi all,
> 
> After merging the leds-lj tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/leds/leds-lp5569.c:11:
> drivers/leds/leds-lp5569.c: In function 'lp5569_post_init_device':
> drivers/leds/leds-lp5569.c:204:52: error: passing argument 3 of 'lp55xx_read' from incompatible pointer type [-Werror=incompatible-pointer-types]
>   204 |                           chip, LP5569_REG_STATUS, &val);
>       |                                                    ^~~~
>       |                                                    |
>       |                                                    int *

The only reason for applying this set this late in the cycle was that
they appeared to be fixes for other brokenness.

This is the second set that you've submitted in recent days that has
caused build breakages.  Something is wrong with your current
development practices.  Are you able to identify and rectify these
issue(s) before a lose trust in your submissions?

-- 
Lee Jones [李琼斯]

