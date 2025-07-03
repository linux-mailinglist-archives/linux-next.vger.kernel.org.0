Return-Path: <linux-next+bounces-7343-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B52CAF835D
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 00:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CE101C86E50
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 22:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227DF2882C5;
	Thu,  3 Jul 2025 22:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="s9eh9/+A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3E72AF19;
	Thu,  3 Jul 2025 22:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751581616; cv=none; b=CLb+TN6f2POGOlHC0+FUj2TJS8BFjGYAkR1pg1fLK3mDANnecUbHgp8A5KNn4lRBDTzTKBpSldyYJMEVSsu8PITeF5uc6str3jQ6mEOFnUqzdwasU4xdEcU+Knh1KcPfdecdUc9JIJh51cB1XGI/ORuuVV270Na9X8i5psRDjAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751581616; c=relaxed/simple;
	bh=cLgp5L2FcC2uJ9MnO2hzh+7uym2B9XXH1jyaMDpQAxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=g49aT5FFBZ1NIQV5+BxVCRfycB9uWyw4GrhpcvnVliUiTrn17zXJ/AJdXwDI4SjleS406M3ZbbIaHzHa4vLv3LBDZihst4j0vxFnXmpBrJsUb5w40M9J8bIwvzlgNljwKTTFljFhyGwME8f0c3vQyzPmLiIv1C0BRmY8cDpTDmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=s9eh9/+A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751581581;
	bh=k9/GILL9jYnHpUreGhxCR6p5KrN5Ntd00d/w/2da71w=;
	h=Date:From:To:Cc:Subject:From;
	b=s9eh9/+AFgbCn/oYD8vVQqJgzOXflUFrn8xtP9EuSIH7lC8EaSfE/m2YZPpB7BLgX
	 tJ8PCPzyHcgszpMBDmXwiqxelclCo7GBSitYdIbqWcTOXCgMoKZbg+I928QIljWy4A
	 cRvxPDq3rJPM9SjSQrpPFbTjtPAFd02g+QuQ905BDdGRLe6MnOCYQePwaz/JdZyGhK
	 SFx4GeMTDYz4mdD3LFVZOX3iEseX8Xq4GaGcYKcgeVNYYh78qw6x2BwG8GZulnnrXC
	 cOb8Z2MBs03qYckpY951gjll90ZeZlatSEDXmUlm3/21ilii/rDi2xN5ATO7a/XlRW
	 1eRuOOD6Cp+rg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bYBF86fvRz4wcg;
	Fri,  4 Jul 2025 08:26:20 +1000 (AEST)
Date: Fri, 4 Jul 2025 08:26:45 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steve French <smfrench@gmail.com>
Cc: Wang Zhaolong <wangzhaolong@huaweicloud.com>, CIFS
 <linux-cifs@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the cifs tree
Message-ID: <20250704082645.37b267dd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GJ_tB3cllo_N6UywFaNhkLH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GJ_tB3cllo_N6UywFaNhkLH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2799c0ada68c ("smb: client: fix race condition in negotiate timeout by us=
ing more precise timing")

Fixes tag

  Fixes: 515ccdbe9b2f ("[Backport] smb: client: fix hang in wait_for_respon=
se() for negproto")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: 7ccc1465465d ("smb: client: fix hang in wait_for_response() for negp=
roto")

--=20
Cheers,
Stephen Rothwell

--Sig_/GJ_tB3cllo_N6UywFaNhkLH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhnA6YACgkQAVBC80lX
0GyBWQf/YYom00j+DyPWixOfM12dmTAzn2hQfqcdGeEVI7WSq8P2uM+2h7p0bCnA
uQ+kzR0BOTnYhQMzrqA4YsmF4xmM6URTiY+dKk26cfkHbXGSZxQ1dO8npeBSPezo
nwEsOhmxCQu41njLo0AS12f+Ram3JV9a/7vkOpVCYzbR6G5nzLBfLZvz/6sdtGMB
8rKGTh9UEx7VEw08bs8IqVfy56LbsfCDAzl9rxfNHgvndYqgHEAGHITyHoDKuzOd
/qle5bsvhxnW/tszprNhShwP6CLtsPjZkLDH6W39lQN4g76Cr4cz5p6NjCD1WbFR
d4qpc96nyW9JA3K28hU6OIYB8Kb1xA==
=lhbM
-----END PGP SIGNATURE-----

--Sig_/GJ_tB3cllo_N6UywFaNhkLH--

