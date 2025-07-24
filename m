Return-Path: <linux-next+bounces-7710-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CBDB1074D
	for <lists+linux-next@lfdr.de>; Thu, 24 Jul 2025 12:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 323FB164025
	for <lists+linux-next@lfdr.de>; Thu, 24 Jul 2025 10:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C895B25DD0C;
	Thu, 24 Jul 2025 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eoqGpyPO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A207A2417C6;
	Thu, 24 Jul 2025 10:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753351398; cv=none; b=rYivGgcBkoc/ohi65RiUpCiCJAufIRWsF46W8y4kNHlfu1p/+a3vDDgg6ZatfWXRhk7EzzwRc7cAFQgfyTvx/TQdoycpUJ8mixlaIwIe3zTdD5LfumBllt5uxGdU4nXgK2+Z1SJpD8UYvDQqlFtRhrzEt9yTCOwLSxxGbLOpwrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753351398; c=relaxed/simple;
	bh=CpX8taPohlNsyyzWSAeGLJY8Fbv6VGx8LxV+/HQ6BjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttTPbBgkP9JmSkWaE8M01mXicG1RK6BOWaqKZUkEW9NXYKLn8vwBx4ku3R8bRorUgYIEiswrDebBZiebMsV/yAn3AtXmjue5ykektiddVCWQzXXvzvRwKlw5AU7oXW953wGajCKnUwF52qfrfjQKWmeGQ5FdAFBtnloHVBgRLcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eoqGpyPO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE2BC4CEED;
	Thu, 24 Jul 2025 10:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753351398;
	bh=CpX8taPohlNsyyzWSAeGLJY8Fbv6VGx8LxV+/HQ6BjU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoqGpyPOIUt4chO8DE4EdiHR2BT4nofDHbygqT4TMClaamQLfXjf3Kt6hq9iixl4A
	 R/MgrhIvhWCK82IBHWM1tmuZ0xPBk+vLP+ESYQ/3jgH5f5i7udemJ2s98ZL+UtAeQr
	 Ucxt0RH5aO81+28amocZoflsei3A4Eg6w6+QXkVwPRwW0ebCqxDKffxkpyhwi8fX0o
	 ZM9MHtp3LPnurG+0Xjueb0+GBViB2DFZ0vHcxMEgeAljWIUDiOB1l0V+99V4CLYoS1
	 xME2yP1TGVwB/dUXQcqdMwBnrW8EMNvzjFEn0W/MCt/CNmm5ZdbMbUTQCxN5pNbDZu
	 U0PwA7t9YMNiw==
Date: Thu, 24 Jul 2025 11:03:14 +0100
From: Lee Jones <lee@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Robert Marko <robert.marko@sartura.hr>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mfd tree
Message-ID: <20250724100314.GW11056@google.com>
References: <20250724115409.030d0d08@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250724115409.030d0d08@canb.auug.org.au>

On Thu, 24 Jul 2025, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the mfd tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> WARNING: unmet direct dependencies detected for MFD_AT91_USART
>   Depends on [n]: HAS_IOMEM [=y] && (ARCH_MICROCHIP || COMPILE_TEST [=n])
>   Selected by [y]:
>   - SERIAL_ATMEL [=y] && TTY [=y] && HAS_IOMEM [=y] && COMMON_CLK [=y] && (ARCH_AT91 [=y] || ARCH_LAN969X || COMPILE_TEST [=n])
> 
> Probably introduced by commit
> 
>   ef37a1e24857 ("mfd: at91-usart: Make it selectable for ARCH_MICROCHIP")

Thanks Stephen.

I have reverted this now.

-- 
Lee Jones [李琼斯]

