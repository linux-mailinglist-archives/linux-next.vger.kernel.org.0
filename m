Return-Path: <linux-next+bounces-4211-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B2D998210
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 11:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B93CEB2C452
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 09:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901AB1C1AD0;
	Thu, 10 Oct 2024 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="lti91DfD"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254591946C8;
	Thu, 10 Oct 2024 09:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551610; cv=none; b=oseAAKj2ipw7dApWvsxEuCJ7TFamZ32XOZ2+wj2R1Hf8uO4TkayPSQLpl+QsJ1SY4PLAMKkc9apAOkU9OrKipoXiwKYnsuGpye8hp3zYpItZWx6qniN4RY8rE85YeCJx/KJGL/Qg783H3K/9F6HZUxw2Hp90r6fp5caols6IbE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551610; c=relaxed/simple;
	bh=vw981JrmdTFGw2mcPs7TlPtRfJiY+KJpWBxQvctodM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZgED+062Dbh1M3fCvmxPcebdc8iXkyUGhsxm6nPfisRk5GualSxGV3yN+qv+Z/rx03mKwaBWf5iHD2t3X4CEFAsSSKk0YQnVW7Hobcn7VzPiejmKiGZj0btHWk4LlEH+9W5KbO7Tpa8NpFgBu0mM4DAQ5xFyng/dAx4x4cyJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=lti91DfD; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=YrD3dZcQ/1N+Kih7XsQ5u2nyxxKVWZbGHR4YZYMFoig=; b=lti91DfDSNanVKXPLY/35v7c3h
	wehlePFPfrtOEwFZVSLvmW4IZtEry+EXYPHg/0rwjqDHOggln+VxO8sN3B+Xtbv09oqvhfnWsSkK6
	UdDp+RlWr4ioobdP3oIXLc1h4I9SguB4mHaa5ofXTJR1xRBrKoTZg1QpWWrwv/7feuIhYjGrphMiZ
	G83rrSh0d9oBHpEDm9KKAd1QeWyz/PfG6jcOmRjMuWZgQOte/PhKVTr/kqFzsd5g52Uz5jy2Ypu4z
	LadNx8ALyJIF+OWBQicQXniI76Ew8bvWkYipXxDBykv+ZEAyLG/sFcIhjF8iJHW6VxbLMQGqujfaP
	bUsJv2jw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1syp4Y-008IAj-1K;
	Thu, 10 Oct 2024 17:13:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 10 Oct 2024 17:13:16 +0800
Date: Thu, 10 Oct 2024 17:13:16 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: [PATCH cryptodev-2.6] crypto: doc - Fix akcipher title reference
Message-ID: <ZwearIUezhYVOvaQ@gondor.apana.org.au>
References: <20241008172926.0b995ea7@canb.auug.org.au>
 <89d99476b2b57bcd3e306996ec4a60db1706253f.1728378559.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89d99476b2b57bcd3e306996ec4a60db1706253f.1728378559.git.lukas@wunner.de>

On Tue, Oct 08, 2024 at 11:12:01AM +0200, Lukas Wunner wrote:
> Stephen reports a documentation build warning for "make htmldocs"
> introduced by recent commit 6b34562f0cfe ("crypto: akcipher - Drop
> sign/verify operations").
> 
> The commit renamed a paragraph title in a header file, but neglected to
> amend the title reference in the API documentation.  Fix it.
> 
> Fixes: 6b34562f0cfe ("crypto: akcipher - Drop sign/verify operations")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20241008172926.0b995ea7@canb.auug.org.au/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  Documentation/crypto/api-akcipher.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

