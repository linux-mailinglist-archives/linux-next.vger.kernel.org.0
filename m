Return-Path: <linux-next+bounces-3986-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF378987D45
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 05:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0731C222DB
	for <lists+linux-next@lfdr.de>; Fri, 27 Sep 2024 03:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147AA3399F;
	Fri, 27 Sep 2024 03:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="c//G0L03"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1794320B;
	Fri, 27 Sep 2024 03:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727407850; cv=none; b=Lyg840+Qr7I1GFnt3jyG0HyL7HkRGWkvEVRWQzsaoIV1BvBQ0fuSeGuye6S0PJ5hjE5RTG+kaR5pY678KRg6nFcST9KqO+Mpqp47uTmVK5Q/2erp9eoTAr8K2vkFlswJPnEQmBymDep9SJfgKO8w64x+1NI64674Fr/ZblKb4to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727407850; c=relaxed/simple;
	bh=xbwIOhJax2ua6PRMp+5Fw5HyT5xLLAm0IEKsbIdkp5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EhvSeRU8XWaR3O2aiw61Z4vT5WgcSM6EoQrUzu3EDRUJdoTWFfN/J1JUYGeTarZyo8ub1/v4C1LsOyq562rfJE9m6ivhmBlWCB+Wgn7kbcabOZ2ilQIoYZ/ZodYwKyu4g/xnMwNA08JnWIC9CtwjoitBa37EMBmZb9iLaQqJe1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=c//G0L03; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727407842;
	bh=Pw1wZ0odl7JQw+o6B2m07Gf29JNJUOUP7EGIsTAlWG0=;
	h=Date:From:To:Cc:Subject:From;
	b=c//G0L03B+MjnPN0ulxgVrYXVAmPm4IaEicyn0C4wdTQxMhOBHGOIv3xp6eBojtjV
	 tFx0UMWu/2ZJp9SwdAILq6tUdTFhDNoOFN9866iGAnAmmymDYCHIGObiIplAdcpRi8
	 bjWQ/OFd9VFDNd6rUcOHcB++OPxSokRyKO3s2uSRtbFBz5ZFRCTiePoHmO/HQAfLaF
	 vrZ+SozJ0owF9BSwNrvfv5yraT9qzurtrXp3SRGwFxNfnAe6hVG3v6dSxUzcsQUlEt
	 Gdptc8TsdNte1pl0fXQpppMxVTTN3UTkp/p2Clbd5sX2UnLHSoJhaae1Jq6H0YVlu4
	 eWbEYy7Pio5Lw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XFGFZ2DWxz4wb0;
	Fri, 27 Sep 2024 13:30:42 +1000 (AEST)
Date: Fri, 27 Sep 2024 13:30:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@suse.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the mm-hotfixes tree
Message-ID: <20240927133041.0b54641d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//DUMU9n0.PvFSWhl_BUyuU/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//DUMU9n0.PvFSWhl_BUyuU/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mm-hotfixes tree, today's linux-next build (htmldocs)
produced these warnings:

security/security.c:749: warning: Function parameter or struct member 'gfp'=
 not described in 'lsm_inode_alloc'
security/security.c:1690: warning: Function parameter or struct member 'gfp=
' not described in 'security_inode_alloc'

Introduced by commit

  79d4dccf36ce ("bcachefs: do not use PF_MEMALLOC_NORECLAIM")

--=20
Cheers,
Stephen Rothwell

--Sig_//DUMU9n0.PvFSWhl_BUyuU/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb2JuEACgkQAVBC80lX
0GzZMgf+K4qUUze9xTLZ7hLGoSba+9J5XURebSsLdtEkhB3bTdOAlxjOFmjo9W83
naRaacwTDt9+9bC3DDxM7NT5Nw9XwUInaXObCg/fBZ1Ds5FOm4FMv0XHzci56NDN
2EycpFpXHy+UQXB82whBKM67CF+rG1GLxiXpaxku5yFmuVOCT5TbrP9ud3MJlaM0
z6q8lijUNnc97rxp1ctpAI8TcEAmK/suxu98/qKWWHvAvsaH30vKAHLMJoZXYXRY
Z+qTjs+R/y8TLyrQFO6aOAhdHLZHf+5seB/BdZY9MseG0Cs3VFgCqLfqkn8HVmrC
qYwNrpGM1zqevlGgCNfeC9BGfS6Bjg==
=WHRY
-----END PGP SIGNATURE-----

--Sig_//DUMU9n0.PvFSWhl_BUyuU/--

