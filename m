Return-Path: <linux-next+bounces-4141-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DD3994418
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 11:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E9251F22D68
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 09:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F40B158205;
	Tue,  8 Oct 2024 09:22:17 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D98F1422A8;
	Tue,  8 Oct 2024 09:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379337; cv=none; b=XE0TWHpkMMHsgOP8LaECXd+dRxvd1g30Tgv9VDuPpQ/iZbYOQOMG0FDQdVrBNLhdktnNqJdfIAqXGQhqm/KlG4COJMvMZvJfJYRYgueQwZd7rFzs5GJAooS3GHjx8h5c4K5rBw5w2mhpG1g8FzsP8y6YMtsEaV1Gh5F2yaNVx60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379337; c=relaxed/simple;
	bh=sx2bYHHOLMoqNBBAD2+N3p3EeNsNG2rOO0solnU55E4=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=ig9p6vvmYx2fH86Nw4K+TqgoSlHPuOJMqgqafAWwg7noMNbEMHVSscofnvSYaJP5ZfqZobDuI1UNzUVCFcZk8GxVB7oQVhf65VySytSWZOpW9vVNuU9vw3ElTpox2r2jIVhheJvn52k0dOVx/0s1Ix9sUciwV3xpR+rui0eColA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 2013D101917BB;
	Tue,  8 Oct 2024 11:13:12 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id DA15C602DD59;
	Tue,  8 Oct 2024 11:13:11 +0200 (CEST)
X-Mailbox-Line: From 89d99476b2b57bcd3e306996ec4a60db1706253f Mon Sep 17 00:00:00 2001
Message-ID: <89d99476b2b57bcd3e306996ec4a60db1706253f.1728378559.git.lukas@wunner.de>
In-Reply-To: <20241008172926.0b995ea7@canb.auug.org.au>
References: <20241008172926.0b995ea7@canb.auug.org.au>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 8 Oct 2024 11:12:01 +0200
Subject: [PATCH cryptodev-2.6] crypto: doc - Fix akcipher title reference
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

Stephen reports a documentation build warning for "make htmldocs"
introduced by recent commit 6b34562f0cfe ("crypto: akcipher - Drop
sign/verify operations").

The commit renamed a paragraph title in a header file, but neglected to
amend the title reference in the API documentation.  Fix it.

Fixes: 6b34562f0cfe ("crypto: akcipher - Drop sign/verify operations")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20241008172926.0b995ea7@canb.auug.org.au/
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Documentation/crypto/api-akcipher.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/crypto/api-akcipher.rst b/Documentation/crypto/api-akcipher.rst
index 6f47cc70eca0..ca1ecdd4a7d3 100644
--- a/Documentation/crypto/api-akcipher.rst
+++ b/Documentation/crypto/api-akcipher.rst
@@ -8,7 +8,7 @@ Asymmetric Cipher API
 ---------------------
 
 .. kernel-doc:: include/crypto/akcipher.h
-   :doc: Generic Public Key API
+   :doc: Generic Public Key Cipher API
 
 .. kernel-doc:: include/crypto/akcipher.h
    :functions: crypto_alloc_akcipher crypto_free_akcipher crypto_akcipher_set_pub_key crypto_akcipher_set_priv_key crypto_akcipher_maxsize crypto_akcipher_encrypt crypto_akcipher_decrypt
-- 
2.43.0


