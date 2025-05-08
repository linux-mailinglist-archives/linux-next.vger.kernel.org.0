Return-Path: <linux-next+bounces-6607-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA59AAF8E3
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 13:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9846F7BA604
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 11:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E80221FBB;
	Thu,  8 May 2025 11:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="V5q87i8f"
X-Original-To: linux-next@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A40B665;
	Thu,  8 May 2025 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746704396; cv=none; b=b+vx4CmwKp7vz5QIN6QhXxbQXBUhUu5sl2jAj3VvgyaswmxFzLOF1Fa+TVBOINCIMpJbhfqW9hwTzyPWTYNRx0rvHfMUgsFgs+yPyHwLm9I1Bu9oQR8pzFuIb6/XE0XgubIM2ipPudVQayEuyvVR44Tqzj2cvubifv8mIs3Y5qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746704396; c=relaxed/simple;
	bh=fPQdKvCJDhLYIvVC0aFX67n1LEU1/snDN+9EgYkgCFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvteankjgQ7stMd7ac/PcCx4qjDbEOJIBhJMm/nt9dWQ3sn0NXIz2K34JdG9Xi0bW6EJl6cNeRmxIcAZTX/f5NU3cMQXQysvkcWZ8zRpoVrRbQX4Kd6gpVXBmS0+bwbiac+9ReR3e6cTfXw7O/gqSv4qnmXjY4avFEjohRhi49c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=V5q87i8f; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SWSIVafegTr2c9lkZjFs/xIIH46FvLh6zwN5OpSFD8g=; b=V5q87i8fQLjOQROwPuiopR311X
	iySMgEPmhBnZdSm/Ks/2C74Dtj2CL3mxmbQO8wtjd/M2mEiHAlEAO5TJgX9tP9/GyyL+EjiHQ4n6d
	9B3YfPqF3rFF+swo7mnAP+pp1An2DSOZHLDgNPKbhPuu3Tz5l31unhyyNdIZm3osmFOP73gBcrCgQ
	mbOYD0N6AeEsi4vi6lx8psw5CNGvPbfuXwVIODaaHdPG0nuq8YpzVuKbqFk4NRnzsk64E5OeGvZ4W
	WslSavsExHmT3AxdihtslZXlj+dgTj1tZejY2s0/rPhTtznBe0279TmqDF+Ey43TJzEa2yStZ9kld
	/o7/tTag==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uCzbJ-004Zgm-0z;
	Thu, 08 May 2025 19:39:42 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 08 May 2025 19:39:41 +0800
Date: Thu, 8 May 2025 19:39:41 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] crypto: powerpc/poly1305 - Add missing poly1305_emit_arch
Message-ID: <aByX_Y64C6lVRR8M@gondor.apana.org.au>
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

What was the last next tree that's known to be good on this machine?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

