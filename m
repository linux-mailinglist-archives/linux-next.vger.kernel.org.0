Return-Path: <linux-next+bounces-9577-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B960BCFD466
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 11:53:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C36CA3063460
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 10:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F6C325497;
	Wed,  7 Jan 2026 10:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="DqnnkWUW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5BA321F42;
	Wed,  7 Jan 2026 10:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767783174; cv=none; b=UeRycSoiN9sowT0W5FOQLih6TMBX7J7EH+QcXjHkO5ASFhaxb5tvfqZpF0+5WV7TWvu561J/1EWlIl4PVX2RWz9xlPNKFn5eSaDF3EGhWLuL+bKTbNIs8LAKoLDHyuqUA+JObyKlXpYEcJDhQujldos13Lb3+3jzPKsluWIP4FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767783174; c=relaxed/simple;
	bh=2MxVJ1A/hd8jh2nQafsWSB2PTbLisSkvYPmrCPYsqWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IaF9rh4Ngn1x1mTvOTcJMAd2WiCgDfSLmdIyMVSrvI+D60wFm/XZQF73eVOSLRHZ7Dp33zze8km2eoxL12YA2oqTs6sfxNsEpKHVFsac0PIjbQqEhNbHFELKTTPE1nxfqKQc1OcNFCIQwUs/vpnLS/7VjFYfvzXcEhdi9vG5gjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=DqnnkWUW; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7699C40E00DA;
	Wed,  7 Jan 2026 10:52:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Rk2drm1QTvoL; Wed,  7 Jan 2026 10:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1767783157; bh=DnSMnTDDPjv9Io/44SFRq5p7jBQmOQ0Q1r4bvaovLkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqnnkWUWfVYZDuLJpEpFDFqs+C0mdo1eA2kdnnusZ34cKqaL1w762wvXfwdGyoRC8
	 MOH6pi0J9vICvl7Bj+2b8+CxIAbKIx/HCIQ2ox0iAgs6e6iI5O0AMgfaP68F/sKn+b
	 SC8DZLOo0PNordggaOcHbw0pnwxaULl6/c/5EEH99tS8IQilgVM4vvRuJPg573WrDp
	 b2pgTQlyqeiAohejHdDHD82ZTGQbwH6GS1x2+zk3GhumcfxWZWVtC4x+XQj6JpSs8h
	 GfRkAZ3HjIAjtVA2+6ju7PkrdVfVlNL7oBBSZcvmXHa/L0a0v3HydOqiUex43vjfpI
	 YTNqS2TcWtlzF2PFm7WuQmrxl/fslnJLHZdT0j4Kr87eD3/AYQ04mYglX9O7sHNH3v
	 RmVx42iBSjvqHBjITPQlW/fE8FaT/ZvHR5VEPqlBowmXy/M65Q2tJx/oXCKk5IuSWP
	 Bbq0/bkKIB8BCgEWia4vNWX3mdwyQDUXyuJhCG/lSVJBWRyk4gVRl/y4aYsvmNkMep
	 3ytir1GrfQpmUnkclGvO/xNfPk7w8hAhGx1sMmf7SADdJ1ObWbQO1LCzLoOQLKm1Yt
	 AEZVoX7p4O2CLri1uJNQ/LBaNrdBpvsmJ1CsY/zS3MpNlq8CZPN/jx/n8jvuJg7o6V
	 oRVJP9WA5HVHZd8yDPWKPNmA=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id BFBA640E0281;
	Wed,  7 Jan 2026 10:52:30 +0000 (UTC)
Date: Wed, 7 Jan 2026 11:52:22 +0100
From: Borislav Petkov <bp@alien8.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
References: <20260107134710.15363555@canb.auug.org.au>
 <20260107144753.7071f5f2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260107144753.7071f5f2@canb.auug.org.au>

On Wed, Jan 07, 2026 at 02:47:53PM +1100, Stephen Rothwell wrote:
> So this still failed with yesterday's tip tree, so clearly there is
> some other change in today's linux-next that has exposed this. 

Yes, because tip/master is fine. This is the usual include hell biting us.

> Instead of using the old version of the tip tree, I have just reverted this
> commit for today.

Ok, below is what fixes it. How do you want to handle this?

---
diff --git a/arch/x86/coco/sev/internal.h b/arch/x86/coco/sev/internal.h
index 039326b5c799..0df642c76626 100644
--- a/arch/x86/coco/sev/internal.h
+++ b/arch/x86/coco/sev/internal.h
@@ -2,6 +2,9 @@
 #ifndef __X86_COCO_SEV_INTERNAL_H__
 #define __X86_COCO_SEV_INTERNAL_H__
 
+#include <asm/percpu.h>
+#include <asm/msr.h>
+
 #define DR7_RESET_VALUE        0x400
 
 extern u64 sev_hv_features;
diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
index 0e6c0940100f..9cfbb27a7bab 100644
--- a/arch/x86/include/asm/sev.h
+++ b/arch/x86/include/asm/sev.h
@@ -16,6 +16,7 @@
 #include <asm/coco.h>
 #include <asm/set_memory.h>
 #include <asm/svm.h>
+#include <asm/pgtable_types.h>
 
 #define GHCB_PROTOCOL_MIN	1ULL
 #define GHCB_PROTOCOL_MAX	2ULL


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

