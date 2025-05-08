Return-Path: <linux-next+bounces-6610-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0788CAAF9BB
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 14:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA2D01C21425
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 12:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E346225414;
	Thu,  8 May 2025 12:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="MCL2XdEo"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41D4136A;
	Thu,  8 May 2025 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746707007; cv=none; b=Z3COn7v8iHcgcW9A7Ykj4y1h5YpCT6mnCpXD3liIpHgo7DZPnPZO1Og9LVLjgAu5oe9p2O23GwjQwhiMA3d4izCKe40PIVODDYi/c2o2IlLCZW4X3Xa8bvg2FCif6PMbdUGmEH2jn/ZzSYjOdy2eiZQ+RcGzqYIl5SZXMBMlibU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746707007; c=relaxed/simple;
	bh=Sjp6bmtVHli8BA8nNdhscC9ie3IBREH+YYSOwoQv084=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PY4X83PcqqhiKYtfiUcAsiCdwn3+lmk6Oa7NDi2gYCQlEhuO1MfgLWm/9BhmZPALZURdeQfLVa09EaizmaEpxFoyMxaD4TkaJ/k53u4/Yzf5hP/aza7mMGgMF9YPKR33gA2jopP43UE0jJNIaOGm9FRB4/0/kwy9zcGTI15NGaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=MCL2XdEo; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oVh979BFxl5kyaFXiLi3I0RPEDGB3MrEtm5i0w6VnhE=; b=MCL2XdEoFzYT9wpGuS/gTxrn/x
	u+QGtv187Xt+zQdxGyRjRXL49YF4P8hMmh8CPMWXEmzyGhMNDGhfK6c/jT8MUdyvg9w7CefDJ61Ps
	SN+DX/DLfs8x2tnZUmCxZHHuU8JpwSIIogrevuUQ5WoqVhoS35bdUmJl/B3MAR957chqm+EOwOvXW
	QOnBfOhdBZpL1sqUhXxlYdRXlVz6maOnlY3ZsGQhx6QRd1vAWhxdRFrtafAvhzzCHnohz5ielVhii
	SQYbIcsGiFTP8vGt4ug91jSm/Np1Hq+6830nCiPskYJcV41szyCyMcUuDt1HoOUP42txMmtniSYQU
	It58UyfQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uD0HV-004aD0-1Z;
	Thu, 08 May 2025 20:23:18 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 May 2025 20:23:17 +0800
Date: Thu, 8 May 2025 20:23:17 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] crypto: powerpc/poly1305 - Restore crypto_simd_usable test
Message-ID: <aByiNZNxqyTerdYG@gondor.apana.org.au>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>

On Thu, May 08, 2025 at 05:27:13PM +0530, Venkat Rao Bagalkote wrote:
>
> Yes, its was on the same machine, next-20250506 passed.

OK I found one bug in my patches, I incorrectly removed the simd
tests for powerpc.  Does this patch help?

---8<---
Restore the crypto_simd_usable test as powerpc needs it.

Fixes: 14d31979145d ("crypto: powerpc/poly1305 - Add block-only interface")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
index 7cea0ebcc6bc..154eced0bf9e 100644
--- a/arch/powerpc/lib/crypto/poly1305-p10-glue.c
+++ b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
@@ -6,6 +6,7 @@
  */
 #include <asm/switch_to.h>
 #include <crypto/internal/poly1305.h>
+#include <crypto/internal/simd.h>
 #include <linux/cpufeature.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
@@ -51,7 +52,7 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
 	if (!static_key_enabled(&have_p10))
 		return poly1305_blocks_generic(state, src, len, padbit);
 	vsx_begin();
-	if (len >= POLY1305_BLOCK_SIZE * 4) {
+	if (crypto_simd_usable() && len >= POLY1305_BLOCK_SIZE * 4) {
 		poly1305_p10le_4blocks(state, src, len);
 		src += len - (len % (POLY1305_BLOCK_SIZE * 4));
 		len %= POLY1305_BLOCK_SIZE * 4;
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

