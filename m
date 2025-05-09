Return-Path: <linux-next+bounces-6644-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F702AB135B
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 14:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 433493AA65F
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 12:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2717290D90;
	Fri,  9 May 2025 12:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="PHQ44vc9"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42583272E44;
	Fri,  9 May 2025 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793756; cv=none; b=K3ltYYirvgegtyf1ib8LsGK2NvFvIfdA01zhbNdHt6DjpqbeQXfoY+7YpCTUtSjih1RrcDz6dp1pn39c6vV/j95gfOpJAscg82x1i+P/u7Em8ykDOakRk9kh78Gi3v6sam3Nq8ptS2UXql6BAKu4yIOfVgE/BKfdejHzeT150nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793756; c=relaxed/simple;
	bh=3eoQG3YvVxmlJYDaiEVItGucK+HKphFxx9vtxG+0HxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5sFGw17zcl5T8MRdu5/JOr/XnY11tjGc6OZr6DNL1ImIS9O04YO+5TK6vqDvqAvsSpJUhz28HqvhxS7WTXEZrVZNLNy9FPHOjwwxEEXlqd1YaWpqjdAxEwudOH8UhnoY2QM7j/fuSecpzGnwDajZIvrSO4MWhh69LU8NwuNvXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=PHQ44vc9; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Nfy+p2+K50BeVO/KsNOia7LPtjZvYn6v3ybzTty3Vcc=; b=PHQ44vc9GqAsj0AvgjLkpbBLMw
	Mj2eHzXFbfkyWWx9vTvJ6vAj6A5mBvq+zobNJhmonvOSH/QQAqPNhw7SfBWXRa9aWVe41sP5PmQ+Q
	30FJYaXMWBtiLHdi0LmfKrPFEy9CUArRDIRRFbSpjwRXB2I50DPsBBnWBQhMn7Mi1d0XdqQq4mDBx
	C4QLt2DeHJsceW9vAL5B2qktgzHlbZBZJWnZpPRabZbF6bvSSLye8lERq7GO14KApivJtpTpQAAO8
	OxuesOvrJ91V9wR4bzc9Q72J/PWtizSDxLYQZSzmW8+U5RT6ZjBqu+il5V/JXk8R+VqaPM8Dzkmtv
	sM8wrksA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDMqa-004qxm-2T;
	Fri, 09 May 2025 20:29:01 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 09 May 2025 20:29:00 +0800
Date: Fri, 9 May 2025 20:29:00 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] crypto: powerpc/poly1305 - Fix input mixup in
 poly1305_emit_arch
Message-ID: <aB31DI4QBBZuQObQ@gondor.apana.org.au>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>

On Thu, May 08, 2025 at 08:35:48PM +0530, Venkat Rao Bagalkote wrote:
>
> Unfortunately, above patch dosent fix the boot warning.

This works for me:

---8<---
Swap the order of the arguments in poly1305_emit_arch to match
the prototype.

Fixes: 14d31979145d ("crypto: powerpc/poly1305 - Add block-only interface")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/arch/powerpc/lib/crypto/poly1305-p10le_64.S b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
index 2ba2911b8038..5b368baf96d2 100644
--- a/arch/powerpc/lib/crypto/poly1305-p10le_64.S
+++ b/arch/powerpc/lib/crypto/poly1305-p10le_64.S
@@ -1027,7 +1027,7 @@ Out_no_poly1305_64:
 SYM_FUNC_END(poly1305_64s)
 
 #
-# Input: r3 = h, r4 = s, r5 = mac
+# Input: r3 = h, r4 = mac, r5 = s
 # mac = h + s
 #
 SYM_FUNC_START(poly1305_emit_arch)
@@ -1051,14 +1051,14 @@ SYM_FUNC_START(poly1305_emit_arch)
 	mr	12, 8
 
 Skip_h64:
-	ld	6, 0(4)
-	ld	7, 8(4)
+	ld	6, 0(5)
+	ld	7, 8(5)
 	addc	10, 10, 6
 	adde	11, 11, 7
 	addze	12, 12
 
-	std	10, 0(5)
-	std	11, 8(5)
+	std	10, 0(4)
+	std	11, 8(4)
 	blr
 SYM_FUNC_END(poly1305_emit_arch)
 
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

