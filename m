Return-Path: <linux-next+bounces-6575-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AC7AADD7E
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 13:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 189527A7DBF
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 11:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6B623315A;
	Wed,  7 May 2025 11:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="jYoPhi4M"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65783233144;
	Wed,  7 May 2025 11:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746617833; cv=none; b=Sq4bG1mQ2nb8WXA2pBjsfQt8HzwGoVzLOmfk1WPbxqKrbCAVTsSP08KsutatJfLZa4O82eZpYtx6V5P+YlJzkpRljY3W0GcWy43Z99ho3aQ3WTXh4mxxpxNVJkj7zbaFQUeM6COA3bgFl+je6+ImBT7c3XWMZ6Xb8BG6GIXffYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746617833; c=relaxed/simple;
	bh=6h+ZTQPoJN30Q060+PwymlwcLiNpLn9kEEje8Ef7FF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntGzfZX4CjZFFkSiSXfT6XLcARXevwuypnBetsSeOLitZH0V8ZOX5zYEqs1Ztb7HIHRwE7Gfa9iHW7jonztN19Kf7YLBex2hd502V5YzK3HHNMkMLjLCOYKr6viVwVRiwe4owes3JnvwbDDfvfBYPXfCKEV/SwBleZbeL3w8PMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=jYoPhi4M; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/HjQ5opUQ8DgLaTKvoPghlC7CgdE1R518qdzpUrZYXw=; b=jYoPhi4M5crOGTqtMTf1iIuprz
	+3skXLog9PEnz27fYR4eck2nd4Se0jA43N7LDULFNal1adko9UlIrVqZiiQrnTe8oC3a4Ih3nNA6J
	bNxioFAwONhKe06xBmL3wWJ810vQm7BPCArHo7prQQWV8F102sg4zOjNdnxc8OsNUJC88txci76nH
	pFvteqPas4tBh0/Viatpdn+U1tJq9qju/pn/6M82zRIKgvSSSoHh4YHMaSwLjHdHIb4kK+0MN4n1F
	GNSrUs/mQrvjNEICcS+YkWFo8fUi3exUwF9cxbKFMVzoIe0bnCQBNvoL0uF7TI//uuuJak/+ywxey
	fKmvDPGQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uCd58-004F90-2F;
	Wed, 07 May 2025 19:36:59 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 07 May 2025 19:36:58 +0800
Date: Wed, 7 May 2025 19:36:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
Message-ID: <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>

On Wed, May 07, 2025 at 01:03:06PM +0200, Thorsten Leemhuis wrote:
>
> """
> ld: warning: discarding dynamic section .glink
> ld: warning: discarding dynamic section .plt
> ld: linkage table error against `poly1305_emit_arch'
> ld: stubs don't match calculated size
> ld: can not build stubs: bad value
> ld: lib/crypto/poly1305.o: in function `poly1305_final':
> /builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250507/linux-6.15.0-0.0.next.20250507.443.vanilla.fc43.ppc64le/lib/crypto/poly1305.c:65:(.text+0x2dc): undefined reference to `poly1305_emit_arch'
> ld: /builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250507/linux-6.15.0-0.0.next.20250507.443.vanilla.fc43.ppc64le/lib/crypto/poly1305.c:65:(.text+0x378): undefined reference to `poly1305_emit_arch'
> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
> make[1]: *** [/builddir/build/BUILD/kernel-6.15.0-build/kernel-next-20250507/linux-6.15.0-0.0.next.20250507.443.vanilla.fc43.ppc64le/Makefile:1250: vmlinux] Error 2
> """

Oops, the powerpc patch was missing the assembly part:

---8<---
Rename poly1305_emit_64 to poly1305_emit_arch to conform with
the expectation of the poly1305 library.

Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
Fixes: 14d31979145d ("crypto: powerpc/poly1305 - Add block-only interface")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
index 16c2a8316696..7cea0ebcc6bc 100644
--- a/arch/powerpc/lib/crypto/poly1305-p10-glue.c
+++ b/arch/powerpc/lib/crypto/poly1305-p10-glue.c
@@ -17,6 +17,7 @@ asmlinkage void poly1305_64s(struct poly1305_block_state *state, const u8 *m, u3
 asmlinkage void poly1305_emit_arch(const struct poly1305_state *state,
 				   u8 digest[POLY1305_DIGEST_SIZE],
 				   const u32 nonce[4]);
+EXPORT_SYMBOL_GPL(poly1305_emit_arch);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_p10);
 
diff --git a/arch/powerpc/lib/crypto/poly1305-p10le_64.S b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
index a3c1987f1ecd..2ba2911b8038 100644
--- a/arch/powerpc/lib/crypto/poly1305-p10le_64.S
+++ b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
@@ -1030,7 +1030,7 @@ SYM_FUNC_END(poly1305_64s)
 # Input: r3 = h, r4 = s, r5 = mac
 # mac = h + s
 #
-SYM_FUNC_START(poly1305_emit_64)
+SYM_FUNC_START(poly1305_emit_arch)
 	ld	10, 0(3)
 	ld	11, 8(3)
 	ld	12, 16(3)
@@ -1060,7 +1060,7 @@ Skip_h64:
 	std	10, 0(5)
 	std	11, 8(5)
 	blr
-SYM_FUNC_END(poly1305_emit_64)
+SYM_FUNC_END(poly1305_emit_arch)
 
 SYM_DATA_START_LOCAL(RMASK)
 .align 5
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

