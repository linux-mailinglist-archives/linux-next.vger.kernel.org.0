Return-Path: <linux-next+bounces-9023-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C65C61C0D
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 21:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D78D3B1939
	for <lists+linux-next@lfdr.de>; Sun, 16 Nov 2025 20:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2B823EAA3;
	Sun, 16 Nov 2025 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZtnnS3Zl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976C0222578;
	Sun, 16 Nov 2025 20:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763323295; cv=none; b=Q1M1RsXDK585zc1a+bLdQohIqnnOZu8whpuETbR2MSPloJ0+R3uuZprPdU8nbBJAsvbvPdcnu3EwIFS387Ud1AF//27cFpmPT9wl0OcRTfvEg0imM/TSoP65pGeuqujaosy0jGwNazBx23xbc23hOiokJ1UKJ+cu8ZPpz8c7PVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763323295; c=relaxed/simple;
	bh=fAgRHYa5d8U5zJHyD1nRI4CiQ3xr3sWDIrY2nh3ag5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcv/rejRfO81TjHUlN4RYdLshChtJPoxDaFNRYmPkhN/pQ4hWShEvSB3VXaLt6/3o2fJ1sxRcFEm4erHCseWUcyDzWQBeeJk9s7IFVNaQnkfGqijFicvaYATkrOtZs5oRlaG9XIKfQawXZsOQ9rO6osGcRBaR/4jLWd+4K3Mbpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZtnnS3Zl; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A6BF240E016E;
	Sun, 16 Nov 2025 20:01:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id M2iRB_r0ERQe; Sun, 16 Nov 2025 20:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1763323283; bh=Qu4TDc3rK7/IY2F1EOWIQL8XsZiZUQzcWVUPatlThSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtnnS3ZlRFfONEhekW8SzT+6DZ1dQ4haOZUXbtr7NsFoGXylsftWSQ3CDhMvSjddN
	 VVAzh70VxsfH6yQnNUlMCxYwsP/MOeNq4sjojfj6bkQ91BxWkKObwtafXE1vwgH/uZ
	 v7xeb69O3ZrXQ5yX/pIQ14gNTSlCyVB/rXlgInq2/R2h5Mxbjss6ab6tjGV4p4b+P1
	 oTwRLe3nuRImhMq0wssM+czVzHB+XXw8zOlK9Guj7oinPwPBpXXxmm+0ebTyKHx43h
	 hzp2/UtT1jSO3NGE833259xUfDJrO6IdEbxQdxXZbjgb8p6L6lrIvwt+BsXMEwoJCD
	 BLzBuV62LChQBziE5AM7NKEX3ZezxQX/SnKkrdZN26wGeU8mSbOW2euUxRtLRR8cyU
	 m+51/tFPOt9/yO8EJEub+HN3LtMLvPfiNTwZhhImhS4KBcwDUY9DaLuPz9PS7Bbj1c
	 i9M8VB94XweF9nqjD4ay0zWZwFHCw/aRcFox6aU9c4QD1FO1U3pyPSXCr00KTpnHRi
	 Jaz/szHE+kAYVkz5PTWnWrEUstJzXuPS/z2IfysjVlpCrZss6k8C0KCPh4WXdhn5Js
	 UdpF0D4Lwfy8ZHX69n1eDRchy2YzNarRLxipvUOQ+3nlk3j1XDUQKsx/Zp1jNONsfI
	 DPa3XxQtrViI+xxqUj1y4j2I=
Received: from zn.tnic (pd9530da1.dip0.t-ipconnect.de [217.83.13.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id AB07B40E015A;
	Sun, 16 Nov 2025 20:01:16 +0000 (UTC)
Date: Sun, 16 Nov 2025 21:01:11 +0100
From: Borislav Petkov <bp@alien8.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20251116200111.GDaRoth3r8a1sPwzva@fat_crate.local>
References: <20251117064912.407640aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117064912.407640aa@canb.auug.org.au>

On Mon, Nov 17, 2025 at 06:49:12AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   1c7ac68c05bc ("x86/acpi/boot: Correct acpi_is_processor_usable() check again")
> 
> is missing a Signed-off-by from its committer.

Fixed.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

