Return-Path: <linux-next+bounces-3778-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE64B97604A
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 07:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D88861C22B02
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 05:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E3D1885A1;
	Thu, 12 Sep 2024 05:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JJ6Nvmy9"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A89846D;
	Thu, 12 Sep 2024 05:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726118517; cv=none; b=khJBYmPHcevQ2MklqICEZfxYx745DxJL58Ok8vaqEBQj2yo677W12+zhYtoDUA1qQIsYzAuKelNtI+KvY4evIEn6G2gUz1sfb3oeRHQmdJMghRolbZPy9c89aVF2uVg45XnP9nvs+iU59oX+K0RasutvZ9omyMrZ9tWhiJIc8a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726118517; c=relaxed/simple;
	bh=FvwI3m0rM8ZYeRK2nXdJVSDhmMdutUqwiqySPAtD3sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CAkDzOOAo7NV40TCd1skRxWQYFr4/eBAHDUQo9ZYQjp+e+tVRigR71w4IwseI9O9qVsQWu0FNDZYhYdRZ+lxP1Wxjv9dFD68SUrc6NUN1nbsWr1qonT4BHuFGqsJtbWF7j+5MxtcSh8BcprVbWe5HLbc6tc5145g/HXOoT2PLRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JJ6Nvmy9; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726118512;
	bh=nVCohKEAwkvAHf/tQ851c+bKnKzo1Jw3O3NqEpgemDs=;
	h=Date:From:To:Cc:Subject:From;
	b=JJ6Nvmy97SnShBNHbm9m3tMneJu8FsWBIwkVoAqcgPKUheAtkPbLPgC0x5RtfK9sR
	 vHW7MV6NOX9d55JKMNOQgTtwsGfSV6TOm1JUBUlpMgOHi5LASLelBauKmoLa7dgRgZ
	 PswU11sBW1sXSO/LaiC6clcUaUVQ3DyHXJEvZopBWTWYGOjfa6cTRRKC/kuHom5+wI
	 1+agTorQyW2kgTNgD2wsTLjq57fUWQ1T3knA7Fq/sK4tRLys3mfjqBTgl/+qWOwQcw
	 mW7PS23ZzLQm5sCSIfRvdcrGf15NS9/CICWDcDQzFgY5eNVhq5JFijYF8BdWx+b2wX
	 nb1b0jSyUlbmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X45Ql6g79z4wnw;
	Thu, 12 Sep 2024 15:21:50 +1000 (AEST)
Date: Thu, 12 Sep 2024 15:21:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Wim Van Sebroeck <wim@iguana.be>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the watchdog tree
Message-ID: <20240912152150.1db4cec7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/SZ1tyPRS+4HXO5RphA0jglZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/SZ1tyPRS+4HXO5RphA0jglZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  369afb28a856 ("wdt: ts72xx: add DT support for ts72xx")
  ba60f951a098 ("dt-bindings: watchdog: Add Cirrus EP93x")

These are commits

  07933ff8d919 ("wdt: ts72xx: add DT support for ts72xx")
  ad39ab18fd06 ("dt-bindings: watchdog: Add Cirrus EP93x")

in the arm-soc-tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/SZ1tyPRS+4HXO5RphA0jglZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiem4ACgkQAVBC80lX
0GzqnQf+IXoJcnxH7UlcUu9zf4juPNHx22Td0s4lGBT4hK2yQf/nErqDP36Hkdon
CugufE99hEwqOGw1GhPjCcDL1bxjoz2UlHVbWMUKJ/L5Oq4StvCuIukuNDFA/9p8
75AeriXJcIxgl1mP2LsAatDRb0rPfCQn7sxtU/qWUZl5BZsmGr1OSGRChMFgs7WV
lR2bjfUnzESjJjCdO36lJlx7gOEKFtHSkT8eZjekcOSIoej+Bjol2khboV2dw0ci
/3DPw0F6FndJXWxk1Fm77Z9gVJ/svPe1PLXFLT8MqO0DVY79rJkfrpFYPFwSevbB
oJxEDOKIzt/kvukoKjERaPhfI9noWQ==
=5RD3
-----END PGP SIGNATURE-----

--Sig_/SZ1tyPRS+4HXO5RphA0jglZ--

