Return-Path: <linux-next+bounces-6278-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C12BDA911A7
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 04:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5915C3B8A68
	for <lists+linux-next@lfdr.de>; Thu, 17 Apr 2025 02:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB3E1ADC8D;
	Thu, 17 Apr 2025 02:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="XoExxfSG"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4F4C91;
	Thu, 17 Apr 2025 02:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856808; cv=none; b=H4vTq3fRmxN6D4FO7a1Hh2JZSyKze7XKPsgKxN5HTDh7iKQzDGXwfdF6CJuogxtKhC0TnLBuLHl58VFB4alIhwJRUp3s+v8Q+xQGctuATKXklIljrsxyjQ/k69FzkaLPRbwPEKHv4/x+Nva6dQXjHtATllx90pvvtJ+Xr09Dn2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856808; c=relaxed/simple;
	bh=uAl0/bX1bo/E8cYxxBa99UHbh98ErTeMCNf3j7GsGNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lUemN0DAxLc2pjSy+Ukf2/YYSZgmHgo5DDp7s1VL2HwFzwLGUcR/5A9sa+H5/g+xb1hvwH+atRtglnYEppNK2bOh/cY+eVhN3JepRhkTXSroH/+rM6UX/A0460735QHzVk8iU/0ZjnxLgrgucAG346y6jIMi6UDmLT3l85CS16Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=XoExxfSG; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+cJH1NNz3aSIiKeY3vly5wDD6i9k8qaw7IDZWgMMWfs=; b=XoExxfSGdrIeSwoQv99XAFWZ4s
	CxrxVvlbQ03AcN6vBEpUrOq0H5gfseJI2R4Dg46H5BoXWhKLDvVoMmkoVJCe4lOFwY2ms1zjvzLyB
	tbPXWlCst5Edt6OaTMoptFHYQqa/yebOgNCW84vodVug59FhnfUO7IgKV1fFi9yonN3YArZDhqN38
	un4iJMI1Lk9ENgftEqIgD25RsbkEDtyoQ7x+h68oltSA9If22/X4ux4R1rhtp7SuSNAmYlFhAtAOM
	EdWlFD+BzJUUzUjzJYnrf0EJpd553jldNuVxF7iRgaTbVHEo5cfWGtK0GZLBaYQpWgxUzRJp/nBSX
	WPqND9bA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5ExQ-00GMgW-2r;
	Thu, 17 Apr 2025 10:26:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 17 Apr 2025 10:26:28 +0800
Date: Thu, 17 Apr 2025 10:26:28 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] powerpc/crc: Include uaccess.h and others
Message-ID: <aABm1F_dvMhakYVt@gondor.apana.org.au>
References: <cover.1744356724.git.herbert@gondor.apana.org.au>
 <c2a0a6a3467c6ff404e524d564f777fad31c9ebc.1744356724.git.herbert@gondor.apana.org.au>
 <20250416170943.GB189808@quark.localdomain>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416170943.GB189808@quark.localdomain>

On Wed, Apr 16, 2025 at 10:09:43AM -0700, Eric Biggers wrote:
> 
> This patch broke the powerpc build:
> 
> ../arch/powerpc/lib/crc32-glue.c: In function 'crc32c_arch':
> ../arch/powerpc/lib/crc32-glue.c:44:17: error: implicit declaration of function 'pagefault_disable'; did you mean 'preempt_disable'? [-Wimplicit-function-declaration]
>    44 |                 pagefault_disable();

Sorry, I should've done a grep for asm/simd.h.

---8<---
The powerpc crc code was relying on pagefault_disable from being
pulled in by random header files.

Fix this by explicitly including uaccess.h.  Also add other missing
header files to prevent similar problems in future.

Reported-by: Eric Biggers <ebiggers@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 7ba8df47810f ("asm-generic: Make simd.h more resilient")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/powerpc/lib/crc-t10dif-glue.c b/arch/powerpc/lib/crc-t10dif-glue.c
index f411b0120cc5..fa988e249f01 100644
--- a/arch/powerpc/lib/crc-t10dif-glue.c
+++ b/arch/powerpc/lib/crc-t10dif-glue.c
@@ -6,15 +6,15 @@
  * [based on crc32c-vpmsum_glue.c]
  */
 
-#include <linux/crc-t10dif.h>
-#include <crypto/internal/simd.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/kernel.h>
-#include <linux/cpufeature.h>
-#include <asm/simd.h>
 #include <asm/switch_to.h>
+#include <crypto/internal/simd.h>
+#include <linux/cpufeature.h>
+#include <linux/crc-t10dif.h>
+#include <linux/jump_label.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/preempt.h>
+#include <linux/uaccess.h>
 
 #define VMX_ALIGN		16
 #define VMX_ALIGN_MASK		(VMX_ALIGN-1)
diff --git a/arch/powerpc/lib/crc32-glue.c b/arch/powerpc/lib/crc32-glue.c
index dbd10f339183..28450fe04e86 100644
--- a/arch/powerpc/lib/crc32-glue.c
+++ b/arch/powerpc/lib/crc32-glue.c
@@ -1,12 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#include <linux/crc32.h>
-#include <crypto/internal/simd.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/cpufeature.h>
-#include <asm/simd.h>
 #include <asm/switch_to.h>
+#include <crypto/internal/simd.h>
+#include <linux/cpufeature.h>
+#include <linux/crc32.h>
+#include <linux/jump_label.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/preempt.h>
+#include <linux/uaccess.h>
 
 #define VMX_ALIGN		16
 #define VMX_ALIGN_MASK		(VMX_ALIGN-1)
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

