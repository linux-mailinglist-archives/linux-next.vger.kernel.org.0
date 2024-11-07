Return-Path: <linux-next+bounces-4660-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D3A9C034B
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 12:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2F18B2294D
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 11:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568111E2615;
	Thu,  7 Nov 2024 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b="XueR0Y3V"
X-Original-To: linux-next@vger.kernel.org
Received: from www.linux-watchdog.org (www.linux-watchdog.org [185.87.125.42])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FE61373;
	Thu,  7 Nov 2024 11:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.87.125.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977474; cv=none; b=QrJqrbrceY3n/CTJvfIViyxURrsGYRxDyaZQJOfzDQhqa9SVWjKuBeRZfCdBKuLoPvFsmSscevNMZ3yjIDRHbbnRLAZ1YvijErl2ggpqhxYTSljpV0vO7dt7KotvBPGKgBmHD+9xrsMg4mKMQqzIa920S90HXTK12UFdf21fREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977474; c=relaxed/simple;
	bh=O6xIdu6aXdyfqeAwn1cksGsn6YfOCp8120QKSZGsaGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TACc5ZXZwfg4YJyV8tk6Hue5Zcqv67u8W+/5+r91u6l8KkT3xGPGOkRY9r9DTP+H0e5EgiigIM6+b28AbmROeo9J+Er5DZNAIqBvh460688OS9GxOLql7Cgmf9hiX4dOMeke5oHf6nsGHwjuhd3KDxq5m3sIiFRquKgFcOlNkQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org; spf=pass smtp.mailfrom=linux-watchdog.org; dkim=pass (1024-bit key) header.d=linux-watchdog.org header.i=@linux-watchdog.org header.b=XueR0Y3V; arc=none smtp.client-ip=185.87.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=linux-watchdog.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux-watchdog.org
Received: by www.linux-watchdog.org (Postfix, from userid 500)
	id 2F15440A06; Thu,  7 Nov 2024 11:37:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.linux-watchdog.org 2F15440A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-watchdog.org;
	s=odk20180602; t=1730975829;
	bh=O6xIdu6aXdyfqeAwn1cksGsn6YfOCp8120QKSZGsaGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XueR0Y3VMw8+KK4pEAZX9yi1eQMUozbN1KhTXnGz+B2aCQHOnO9qSGxcFxs/alOoO
	 yo2ePMtLnnuglc9dlZ56RHirHMhG5ofn7tqlRcbG3+oeTerNkwbreNI6HhFbnpzw18
	 fMLnwA6FJPv6CPoCX9e5P/lTjEsGnkAMmoz/wvhk=
Date: Thu, 7 Nov 2024 11:37:08 +0100
From: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Wim Van Sebroeck <wim@iguana.be>,
	Byoungtae Cho <bt.cho@samsung.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Sunyeal Hong <sunyeal.hong@samsung.com>,
	Taewan Kim <trunixs.kim@samsung.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: linux-next: manual merge of the watchdog tree with the
 samsung-krzk tree
Message-ID: <20241107103708.GB4818@www.linux-watchdog.org>
References: <20241107165933.3e8b5af5@canb.auug.org.au>
 <a0e3d45f-d982-4961-9945-3c81c0380806@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0e3d45f-d982-4961-9945-3c81c0380806@kernel.org>
User-Agent: Mutt/1.5.20 (2009-12-10)

Hi Krzysztof,

> On 07/11/2024 06:59, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the watchdog tree got a conflict in:
> > 
> >   arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> > 
> > between commit:
> > 
> >   ef1c2a54cbc7 ("arm64: dts: exynosautov920: add peric1, misc and hsi0/1 clock DT nodes")
> > 
> > from the samsung-krzk tree and commit:
> > 
> >   3595a523d043 ("arm64: dts: exynosautov920: add watchdog DT node")
> 
> The main problem is above patch should have never been taken to watchdog
> tree. I never agreed on that. I never acked it. It is against SoC
> policies which are always requesting entire DTS to go through SoC tree.
> 
> Please drop the patch from watchdog. Or revert it.
> 
> Best regards,
> Krzysztof
> 

See my other e-mail. Since the 3 patches were about adding a new watchdog driver, I indeed took them in.
This was reverted and I can only presume that you will take the 3 patches and do the necessary via the SoC tree.

Kind regards,
Wim.


