Return-Path: <linux-next+bounces-6606-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD90AAF87D
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 13:10:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEB834A7115
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1E9820F09A;
	Thu,  8 May 2025 11:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="rT3KkXL6"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184EF13635C;
	Thu,  8 May 2025 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746702634; cv=none; b=RTyCmcS325Wk1ivr51KtwFMfjM+UhSl1pavV4DuEykuy4rk3scS7ru5Cbfha33CGvL5CsPajO9Z9xII04DDpqzZxi4ptpvuDH18l19qVzd2ZdQHr2P84jIZWjBWWIvqSKVP0CHxvfRZMO07JlMs4riBo/uIIGnv/U9r80a3zgS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746702634; c=relaxed/simple;
	bh=apzDazRApc8L184ZCd+kMTXpfPKpEbT8IDs20ODUeAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oExGPL5LWeauyIfBsf78UygxzRH7u3/fRsGYjzELSZpN+pWMNe/VlzxyQB9TVbD75pV49rWsE/RN0v5OovyJ4usF8EX5Uh/fWbMqC66T9xYaqrAWofsFMvxJQyhoJn9rpXvsFXu0tKPWJIyOF9Id5ZGBozxVV3wXaliCmId+TXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=rT3KkXL6; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=B5PgKdWYwmTvZP+vXKi5TVXR3KLYo3HXJNEjM9zMT6I=; b=rT3KkXL6muj9CdLOMCIyrNzOT6
	jKoUS74jTWHoQgNJc+SMJonOWlJVMqsc/EvfGpq9AWm6vQr94Fepi1OmZKhzLPQrSJ/4gQVgNh2K+
	AiVnLg2MhmYGdIRfqZAkM5ZiRlnlCQu2AzUitWC3PUyNFcM3mTkzUr6160ikecihS4e2xReGF4KXw
	FpqOyhfKfzJ6EPJDVZleATz9A3zfGtfy5MJhMEOmEwW5sxHjFdUTfktxKMVv1wznKiOqVMUEMBQWp
	BY+wnYEV18ZH/9RJU28Mq+Te49bK206jU3itLYxq8l+flsExZ1dQVQKgV/TjvPDilkrns3I6Y4vlm
	IZDOdgHA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uCz8z-004ZRI-2M;
	Thu, 08 May 2025 19:10:26 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 May 2025 19:10:25 +0800
Date: Thu, 8 May 2025 19:10:25 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
Message-ID: <aByRIfXmkvZ4ZfCs@gondor.apana.org.au>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aBx6DwsjDJmdHphy@gondor.apana.org.au>
 <7b491c56-0f2d-4805-a763-0a46233b8640@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b491c56-0f2d-4805-a763-0a46233b8640@linux.ibm.com>

On Thu, May 08, 2025 at 03:31:25PM +0530, Venkat Rao Bagalkote wrote:
>
> Attached is the complete boot up logs.

Thanks.  Can you please try the Crypto API chacha20poly1305 and
see what happens there? If you have it built as a module you can
load it with

	modprobe chacha20poly1305

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

