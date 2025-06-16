Return-Path: <linux-next+bounces-7160-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D97A3ADAAEB
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 10:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7EBA7A56A8
	for <lists+linux-next@lfdr.de>; Mon, 16 Jun 2025 08:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B150261362;
	Mon, 16 Jun 2025 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="oIZhSQc1"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEFE189F56;
	Mon, 16 Jun 2025 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063138; cv=none; b=BAzEFRGhodJl+xYOgRmny7E4m8wmZi7BdREpwSMXcwIKaAxOwTcJ26trYt3ddLjHj6OHvK7wwgMGEUDxJX+mYm8WgvmggPxIw29md51HuGIEj5g+tL1CFcuaT3QIh4Pgh6rJMN0WiYcIvAYqoQ47NUbRxe9YQXMIFX9PzdnXfek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063138; c=relaxed/simple;
	bh=cs8ODmouFFhPJh9ppcqIIdAqVeG7KRkviTSrm0mHKd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uc9SWAo2DVoy9QZYZ4EaM1DVFVJ9KojYHjDccdPIwfcnP9Qz8A2MEU64sfr7VAhRLl0EJh1vEgB7n8AxboaYO+sDFiceBlxWFoLZv5HyTmVCOkW5G/2G69EfJDH4pXcpoqfuSNlSrXlqgURYM0AnjvrKZgkZl3f/ZwGYLn2oi5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=oIZhSQc1; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4LqocdEhXQ0As2fdnIbbMcmHN/Z5fyN5voDLLrNKoLI=; b=oIZhSQc1uwRsFCprF8kPjONbZY
	Di/4WoFmADFFM5gvcMEGT8g32fLITLjeUm7mRYaGQgJXAsrAAFolafDZV5hQeB7Rwfy4KA7PW/L8t
	0kmpeSjDgMrEMtmfYF/7/6cCzUQsH9LtpX9xXPyyPTYnqmixgAy1PwaYwEA+y+p0QDK0YwDf9lELi
	U6Et4a16pEfFyKoL7AoN37JlBoHI9MuUZ1VwDsM09EClvYY1eVVbQTFDeYva42XTBKT4cPTESjyCZ
	QTy5bFSYklnZyi4vcx+JcbZ7tBm81hDv654BOD8tNk0h7J33HKcgz2fX8hgTENg64grWaAM328yNF
	3d5kgPLA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uR57V-000M79-0u;
	Mon, 16 Jun 2025 16:38:50 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 16 Jun 2025 16:38:49 +0800
Date: Mon, 16 Jun 2025 16:38:49 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Crypto List <linux-crypto@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: [PATCH] padata: Remove comment for reorder_work
Message-ID: <aE_YGbugmAlKk2tC@gondor.apana.org.au>
References: <20250616153134.1583c3bb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616153134.1583c3bb@canb.auug.org.au>

On Mon, Jun 16, 2025 at 03:31:34PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the crypto tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> include/linux/padata.h:104: warning: Excess struct member 'reorder_work' description in 'parallel_data'
> 
> Introduced by commit
> 
>   71203f68c774 ("padata: Fix pd UAF once and for all")

Thanks for the report Stephen!

---8<---
Remove comment for reorder_work which no longer exists.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: 71203f68c774 ("padata: Fix pd UAF once and for all")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/include/linux/padata.h b/include/linux/padata.h
index b486c7359de2..765f2778e264 100644
--- a/include/linux/padata.h
+++ b/include/linux/padata.h
@@ -90,7 +90,6 @@ struct padata_cpumask {
  * @processed: Number of already processed objects.
  * @cpu: Next CPU to be processed.
  * @cpumask: The cpumasks in use for parallel and serial workers.
- * @reorder_work: work struct for reordering.
  */
 struct parallel_data {
 	struct padata_shell		*ps;
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

