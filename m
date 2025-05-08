Return-Path: <linux-next+bounces-6599-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4335DAAF6CC
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CE5A1B644FD
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 09:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB151DE2DF;
	Thu,  8 May 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="X111kyzZ"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF66E5A79B;
	Thu,  8 May 2025 09:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746696727; cv=none; b=ZgKIzNk8ewAnMqCsGJcDPhGsgtF3oVzDcgSddwaNcMA3dGqQ86PWv7GmeQexeehaNvzQ9/pCJfjXlJN+EACnFPCEKs8nuKQImcMJDraf7ss/jQjXEW5fsdNY0fke3TuhpK+Wjd6hk5yhPaMhZ3kaos5BZJrdht0NeWeaID9PkPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746696727; c=relaxed/simple;
	bh=mzJvlyVGHlRjxsqMJpN53ex7Qqv6i67QF7M9Sxr3gzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDTa18tWgXpGua3GiuT4nsTq89syLPiCEx3o9l67pv6X3QBJtoGmBnHoP7ek8f6oMqEZRbp5Wc5GjcCiEVbu0jT3fxQn0Pjo82LcKwVvL4vjtSupucQqUvTX/O0gY+0QlXhf/yO4E/mGAQ0e6eoLo4bZHg3/d5hT/ghXfhBi8tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=X111kyzZ; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/u4hUroWiR4CUV4mKLWgPe15CpB5sXH4FE5c7lscFJ4=; b=X111kyzZDqklOQ2dMTGxZpagk5
	Tli3pN1DrjJS7bQEb32uUMh5OJw8HotxlANEPfi6vpedQz62urhhduOzRqvtazI4xmFhNwd6jjD+t
	ZpvGKS+Aa1QDPVZIO5yEuWC+wwHHQMFFWwE5OvLRys9MFx2K248JkGfhS6aHM58bXpSWlphZ4F1du
	/TUfuX08vMlkKYkzAu5J/WCVTF91b4P60kwe04e6j8r8dxrh0/qDwuQ/xOIMQjbxwocidgx8J1hAw
	TGucSFxU+Fc+G3v4ZwAgVfZjkaiNEQ7SHyjr2h+FuXH/gqgM5O6z+jdvc+hoofHKpVwgdlMbfd4Kk
	Dr2CXY+w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uCxbj-004Y8R-12;
	Thu, 08 May 2025 17:32:00 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 May 2025 17:31:59 +0800
Date: Thu, 8 May 2025 17:31:59 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
Message-ID: <aBx6DwsjDJmdHphy@gondor.apana.org.au>
References: <cover.1745815528.git.herbert@gondor.apana.org.au>
 <915c874caf5451d560bf26ff59f58177aa8b7c17.1745815528.git.herbert@gondor.apana.org.au>
 <242ebbf1-4ef0-41c3-83cb-a055c262ba4a@leemhuis.info>
 <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>

On Thu, May 08, 2025 at 02:46:06PM +0530, Venkat Rao Bagalkote wrote:
>
> I tested this patch by applying on next-20250507, though it fixes the build
> issue, it has introduced a boot warning.
> 
> 
> Warning:

Can you post the complete boot up messages please?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

