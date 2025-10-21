Return-Path: <linux-next+bounces-8670-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 363ADBF492A
	for <lists+linux-next@lfdr.de>; Tue, 21 Oct 2025 06:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4C3718C4CFD
	for <lists+linux-next@lfdr.de>; Tue, 21 Oct 2025 04:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F54F221275;
	Tue, 21 Oct 2025 04:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b="M8h10v7q"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [180.181.231.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1F11EB5DB;
	Tue, 21 Oct 2025 04:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.181.231.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761019692; cv=none; b=nA6zPRUHOraW53NdB6AS2i76dz9wPVsgKpgmD9r+mTtnBzWba/vuLyhrt4Iy5EbBOCnJe8Iw7CC8EZRiiOb00A/mzv8ZXYKyUc4L2aPlSDXaz2Eh6jGK9pokVEJqufTqK1qvOyIt/69sTPLKbaZLq+2LS5Pht8dZ6KZCNfr9rO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761019692; c=relaxed/simple;
	bh=otCA/DNdOW+b41rKqMPvBAFFOBff1X+BHKvz77ZSenk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKM+Tt9FtZheea7GMxaATsbD1uRnpujwxtyNBLuM1KoFXAs6G4iDm1BISrd9v9TUrmJlPDeRLXe83oeEEsfoNeeqDHTaVEb+OmUDyZudfwZRHE31uDdzyIzhbzXeFdhYhwTHTS1g07yKeNqMCQwNHlkPPwLSCb7QsjwSK16EyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=gondor.apana.org.au header.i=@gondor.apana.org.au header.b=M8h10v7q; arc=none smtp.client-ip=180.181.231.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=FFfJ1T3gGeeywcD/IcU+HActRpSmxrKsGyO5NhVaCvU=; 
	b=M8h10v7q9f5AGT5gKkSuaDbHCdisDtDGyY+dgX+D1L60SumcC4ZD4dqOz85VS/VJWQA04l0LNic
	kBSiroNiN2e6tph/2kSuBLx9d6OcO30/U/QJTFYxwT1pg7Jw2974mXcZQkkUNESEFjQZiR7qoYR2g
	TJLyMppS2wKL+gdqEEXjF/ePQlu7rJaxRBgjiLyYdsU2FhLI57Fp0Ld6pHbfPrFxFUKpdqc0ibkph
	img2dTMvEgCVZitTgh7Kh7B2lJVzvdB/HD/dZEwP15yAHi1ToLEmd30lM2U7ToI8Aenrbsz3Hzgdx
	Gyd6ASpb0L2/cF4e3icaAuUPduPf7V9uejYA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vB3fA-00EEef-2N;
	Tue, 21 Oct 2025 12:07:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 21 Oct 2025 12:07:56 +0800
Date: Tue, 21 Oct 2025 12:07:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Linux Crypto List <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] KEYS: trusted: Pass argument by pointer in dump_options
Message-ID: <aPcHHJ29mTHCzVjM@gondor.apana.org.au>
References: <20251020140735.39084e85@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020140735.39084e85@canb.auug.org.au>

On Mon, Oct 20, 2025 at 02:07:35PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the crypto tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> security/keys/trusted-keys/trusted_caam.c: In function 'dump_options':
> security/keys/trusted-keys/trusted_caam.c:37:20: note: the ABI of passing struct with a flexible array member has changed in GCC 4.4
>    37 | static inline void dump_options(struct caam_pkey_info pkey_info)
>       |                    ^~~~~~~~~~~~
> 
> Introduced by commit
> 
>   9eb25ca6c973 ("KEYS: trusted: caam based protected key")
> 
> I am not sure what to do about this.  It would be nice if we could
> suppress the note as we do not support gcc 4.4 any more.  Otherwise,
> I suspect that converting the pkey_info argument to a pointer will get
> rid of the note.

Yes let's change that into a pointer:

---8<---
Instead of passing pkey_info into dump_options by value, using a
pointer instead.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/security/keys/trusted-keys/trusted_caam.c b/security/keys/trusted-keys/trusted_caam.c
index 090099d1b04d..601943ce0d60 100644
--- a/security/keys/trusted-keys/trusted_caam.c
+++ b/security/keys/trusted-keys/trusted_caam.c
@@ -29,12 +29,12 @@ static const match_table_t key_tokens = {
 };
 
 #ifdef CAAM_DEBUG
-static inline void dump_options(struct caam_pkey_info pkey_info)
+static inline void dump_options(const struct caam_pkey_info *pkey_info)
 {
-	pr_info("key encryption algo %d\n", pkey_info.key_enc_algo);
+	pr_info("key encryption algo %d\n", pkey_info->key_enc_algo);
 }
 #else
-static inline void dump_options(struct caam_pkey_info pkey_info)
+static inline void dump_options(const struct caam_pkey_info *pkey_info)
 {
 }
 #endif
@@ -108,7 +108,7 @@ static int trusted_caam_seal(struct trusted_key_payload *p, char *datablob)
 		ret = get_pkey_options(datablob, &info.pkey_info);
 		if (ret < 0)
 			return 0;
-		dump_options(info.pkey_info);
+		dump_options(&info.pkey_info);
 	}
 
 	ret = caam_encap_blob(blobifier, &info);
@@ -140,7 +140,7 @@ static int trusted_caam_unseal(struct trusted_key_payload *p, char *datablob)
 		ret = get_pkey_options(datablob, &info.pkey_info);
 		if (ret < 0)
 			return 0;
-		dump_options(info.pkey_info);
+		dump_options(&info.pkey_info);
 
 		p->key_len = p->blob_len + sizeof(struct caam_pkey_info);
 		memcpy(p->key, &info.pkey_info, sizeof(struct caam_pkey_info));
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

