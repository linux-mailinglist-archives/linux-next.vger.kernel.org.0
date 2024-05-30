Return-Path: <linux-next+bounces-2422-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC3B8D4301
	for <lists+linux-next@lfdr.de>; Thu, 30 May 2024 03:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66D231C213CA
	for <lists+linux-next@lfdr.de>; Thu, 30 May 2024 01:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313BF175AA;
	Thu, 30 May 2024 01:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Mmj9kcDd"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991DE17588;
	Thu, 30 May 2024 01:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717033187; cv=none; b=X8i8XQxhpNZVnzIZgJgMGvm1l+Y9NqzcQwi41NMB3zzQbennmhddgPFU9BBXmz83YiH3t8vMX+TFS8APQvF1Q5A+dmOt70YgDEabfCoM8fZTVSX3HURSmEPA48GHrbwvrmRWSTE4VjJRMmMGdII1BmjVki6ZPZdAXSAkFCdSLQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717033187; c=relaxed/simple;
	bh=mz4RT6hveuJ2IUTffPJMhhSR3xpExYc7bL9BHeP9LPw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=OBC9dprHbgv5Okb8Q4W0gee0ntiZpPLGPOKQtwjQ+dAS2PN5eq+l1NITa0LahV4AeCGOafXwMwjb7rK7LIOR+0hNfsExH9f5d9dH0XrSOhth5H5Sz19/AixwmJDYUdvkYvtpju3SKyDHyrAH538ffWGEWsO89NhJ9ZyGOtmiJ24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Mmj9kcDd; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1717033173;
	bh=mz4RT6hveuJ2IUTffPJMhhSR3xpExYc7bL9BHeP9LPw=;
	h=Date:From:To:Cc:Subject:From;
	b=Mmj9kcDd8Oh/sOzHJ3sm8e3o3T9Of950UPUQvk5SlCd1Hmr6GpaoTYsNJBTzcc9PN
	 AGFB4/wABwbt4cUAgcS1yhBVevU7Fk8DehLDJarKyDzXw/6OoZJZDFG6x+xNdeXdXZ
	 ypdgmAE7VI69HZczNAYZk3kxGARnUMFsSlpaJ7t+Dz4ydryZxf4cPZ0mvcv7Qryg8l
	 gT3mmvUjIqa1BKbzY1JQ2v0tI1udhmQH0lHCJqFf8+poR5jrE/zHvjJ01gtOfao7pW
	 EqZVhcCWyLzV1kMcvtaAOVEFEVt47ODFC5/cxk5Kc2c2sbRPZ1GsoSWl+yHALYcJyK
	 dsjuHt6OzzC1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VqTSj0kYmz4wp3;
	Thu, 30 May 2024 11:39:33 +1000 (AEST)
Date: Thu, 30 May 2024 11:39:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: no release today
Message-ID: <20240530113930.3bc514ef@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zm.wPoikpwxrPqA91=G_l5Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Zm.wPoikpwxrPqA91=G_l5Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

There will be no linux-next release today and most likely not
tomorrow either.

--=20
Cheers,
Stephen Rothwell

--Sig_/Zm.wPoikpwxrPqA91=G_l5Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZX2NIACgkQAVBC80lX
0GwgyQf7BlXzQ/mWeNU4BgdgbBcCO2jCiLYoDGs31DKyUCpdBQ1DO6lb0nZlrcg6
Zyw5AWJtX3FdXeLQCUzOfaBCWk6Ip7oaE29GEyP/bXXaQUumAvrUnQa3XYDYAOXJ
05rOMf9ACucqHxnNfWpo+3nsY8EfiwF+Worx4PMnLFjbjz2839sK21BI5sZZtnby
YMKzEjmy6cihF3RQApCNMC5J8aSbE5jlUdDUNA1YQTu1Zu2ZZ67MDUPSp8sclCR3
wre4T1vt0mc0ZsEcKjinOoaMLojP2K6vgmcwYTkY8a5VAwn7dv8n3XbrpT/+jvx6
NQHh4y91U9yxXE4hemuJAw2G3WZBlw==
=s2yd
-----END PGP SIGNATURE-----

--Sig_/Zm.wPoikpwxrPqA91=G_l5Q--

