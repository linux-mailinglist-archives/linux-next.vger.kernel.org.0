Return-Path: <linux-next+bounces-6609-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B675AAF93F
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 14:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E55703AAE9D
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC8C223704;
	Thu,  8 May 2025 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="G+COPHFN"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1597935280;
	Thu,  8 May 2025 11:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746705594; cv=none; b=LpEx0WGmkqsCUyPo3BuukDd7YDgtkyke2I8v1b1Cuj2Z6RDD41gmA1N00WSC3vILXByVDHYcLw4kWybPTl5Wo6ZWbfsEwUtinHrOBvDSvEZT/TLwxiyZJiXor0arEGjBrebc/BTZMZVPVhpf3OFNOo4OAFJZ1D6dXNKx84D/HxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746705594; c=relaxed/simple;
	bh=yq1xfRWUja2QgYuBWvX2RSo6z98dAajGasDPD0h2Guo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dnw8xJA8VZbZVf7fTY+g0/eJV+l3UNsFag86srZjWWNLyYCT6DBsIsXGjiw6Ub0qoGJsdlxQ+34d79Kvbi6V/5o2Fg9haViMgOIoKIdgQoRe97muYlWjkMx2kdufCQntpJgJwADh++UoZZbTqaNJSdlJOXxXeIhIOpOjXiXLjE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=G+COPHFN; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Ak+0FkJ77B+neIp3Ofd2G8ogvm0tI4VS388WrK0Dhn8=; b=G+COPHFNMCIHwULDnnYN8QPzzw
	XiRXL//Cp9Za2IMajyhPa16gPMFyB8vyXT+85etB3g3vcHfswFYAL5vlsap7+wEfeiZbittrS/Jrc
	z5IMSbaS3/oux7vxTivjpe1Tv8fJj1tcLVD2LXyLzX+tLy/qT64iNgShCNZbgPlVPGvBWQPn7SU2t
	1Fi1RBcDOOz1mBKIsgeaZakAys/XS9dZhTfxs+2zbADNbxRl7AkGQAiTs696Jcv4XplR+fgKQkzfl
	uPCK2LemUiQUHXGI1Nn5WlXI0B3IHyepMwpmVvwJrcVOi0/87/qj/tXL1fzarCQu5xYjiM7fePaJd
	iGP1RdZg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uCzuk-004ZsB-2f;
	Thu, 08 May 2025 19:59:47 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 May 2025 19:59:46 +0800
Date: Thu, 8 May 2025 19:59:46 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
Message-ID: <aBycsn-Jsd6mPLiw@gondor.apana.org.au>
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

Great!
> 
> 
> Also, modporbe works fine.
> 
> 
> ]# modprobe chacha20poly1305
> ]#

Did you check dmesg?

Self-test failures will only show up there.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

