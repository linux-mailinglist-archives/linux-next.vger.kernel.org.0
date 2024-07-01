Return-Path: <linux-next+bounces-2764-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C04C991DCD6
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 12:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CFF7B2181B
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6FD112F365;
	Mon,  1 Jul 2024 10:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="cZc8hfSy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3BC12D1FF;
	Mon,  1 Jul 2024 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719830113; cv=none; b=ZKA39wVLzoD46fvW1vkmEYfZpeIWYsX2HS/Z1EQj8BB6ijyK/18LFDyixrGzTUr7V+sA20Itti3LiUp5StjoJurQ/cT2cTBDLEmzVksdSkkSMElp5xifkfH/jSoBAP8D5L0J8E5d4gpomjlxWCURhlP+rFQR3JJQ31bhgH5EvrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719830113; c=relaxed/simple;
	bh=Mmz+2dx5cpVS5YtvtPwVx6XaqDt1igMuihlv6awjfdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkV/Z3hgGcn9jPz6buiL8pdLOsF0vAhzlMLifPyV67IZNc/1Zmymcj+wdsWwsp/nuHJpixISzvGZmJvtGBbyzimtWl+nnZHDWkyJ06fblBPR9DhqeBzRbMmsXvj5IdQ7x06SHWwXhKUaqFXNPQ9bEZCGyizVjAl/H3blgmCIgdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=cZc8hfSy; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E633E40E0185;
	Mon,  1 Jul 2024 10:35:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id dwLZEh2YD_WK; Mon,  1 Jul 2024 10:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1719830104; bh=NOuFjr/UlbKkvyJRgO/cJCw8YFOCfJg3myNEK+D6AQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cZc8hfSygYueR24ymG5pqUJlSGGvNAW1ZVz5gtbvmGD5ZJ31KThUWiv/hOHEnm0mI
	 VJY2+xX7iIPlEhYJsKmYhuAmo3KWmPHrJdvIIHU005m/VezRpeUF2u8aQjDtA0RPI7
	 hsrfeav0VbUI6e6KaZyKwLW1+Bgd//EUL51GE4+SGgSf1+Hwem7fk5VCZyUVr48n93
	 AQ0cr3J/LTXa21zq17sX+MCeqa/3dRKaWfqVR1XGiTI25zROHox9oTXaLj6OCJvzoX
	 L7r8BpzOM5jqy5p2qNBGeiJp0LToakLt0L8tVJXZrUOnWUJxv5ocUR2z05T9pHyRfc
	 9L308lRT23dR9Y812ZRETBFkXcAjqUv/Y8wYQaJMrlYnE2VCuJ+cH9Kfa7juy6yy/A
	 vU3umSR4/IORLICozOuqch/OqpO1QXQa3TXw+qvmKOS8zdI7+YmTLFM7ts3MInpv9u
	 w/HEEpPcLJvAc5OfnMIfengLTd8D+W8EP/IHMh0QDCeCbbxeymtYg/V3BoAPOnq/nX
	 ewEO0f3ibpqb2Kajz8kEI0pBnea0T5RPZBmu9QxKWPTqQAhMKaFeMQnvH33vx4nLUA
	 CI4x7vrm8nvaIM/HDQ4j3KGqYbGBHMbS02VCWrkzCQuhcsVYuIZq2a462RjLZw3ete
	 jOaov9OgMF16R7uls9iZEOOg=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A22A240E019D;
	Mon,  1 Jul 2024 10:34:56 +0000 (UTC)
Date: Mon, 1 Jul 2024 12:34:51 +0200
From: Borislav Petkov <bp@alien8.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] Documentation/ABI/configfs-tsm: Fix an unexpected
 indentation silly
Message-ID: <20240701103451.GDZoKGS5klAmgmXI6s@fat_crate.local>
References: <20240701184557.4735ca3d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240701184557.4735ca3d@canb.auug.org.au>

On Mon, Jul 01, 2024 at 06:45:57PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/ABI/testing/configfs-tsm:97: ERROR: Unexpected indentation.
> 
> Introduced by commit
> 
>   627dc671518b ("x86/sev: Extend the config-fs attestation support for an SVSM")

---
From: "Borislav Petkov (AMD)" <bp@alien8.de>

Fix:

  Documentation/ABI/testing/configfs-tsm:97: ERROR: Unexpected indentation

when building htmldocs with sphinx. I can't say I'm loving those rigid
sphinx rules but whatever, make it shut up.

Fixes: 627dc671518b ("x86/sev: Extend the config-fs attestation support for an SVSM")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Link: https://lore.kernel.org/r/20240701184557.4735ca3d@canb.auug.org.au
---
 Documentation/ABI/testing/configfs-tsm | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-tsm b/Documentation/ABI/testing/configfs-tsm
index 1db2008f25f9..534408bc1408 100644
--- a/Documentation/ABI/testing/configfs-tsm
+++ b/Documentation/ABI/testing/configfs-tsm
@@ -103,8 +103,7 @@ Description:
 		provider for TVMs, like SEV-SNP running under an SVSM.
 		Specifying the service provider via this attribute will create
 		an attestation report as specified by the service provider.
-		Currently supported service-providers are:
-			svsm
+		The only currently supported service provider is "svsm".
 
 		For the "svsm" service provider, see the Secure VM Service Module
 		for SEV-SNP Guests v1.00 Section 7. For the doc, search for
-- 
2.43.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

