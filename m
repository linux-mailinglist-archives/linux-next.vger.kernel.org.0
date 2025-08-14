Return-Path: <linux-next+bounces-7938-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40595B2593D
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 03:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 948FB5C0204
	for <lists+linux-next@lfdr.de>; Thu, 14 Aug 2025 01:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E5678F2E;
	Thu, 14 Aug 2025 01:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YWrqswGN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C715A7263B;
	Thu, 14 Aug 2025 01:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755135741; cv=none; b=dW8prpiZvTx++0E5Hou6fUBeXuJj5686/BvJBnesFKoZi79UqL3X+kqTfqnRmcmnezje3lJetDYr3oc/8ZdPi5h+k+X8Eau5I1nnR7mLqk/wOt8mTQgvlyVZf+yEmseeL+w6ObrXyG+FmBzGSgUw9pTDZedwrbfPQrjKS+hwGHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755135741; c=relaxed/simple;
	bh=Rw+pu+peCaYge0AoCUwiSxdU8CuhMy8jWNrPeCV/Gqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jRtsMzQWHuYWKeLHjCTEbwh9K3cmk9XribAZ1iH5uym6/l0zqxU4f/VfnZUhHe96KcuILuYgCq9uqJs3NzUJ1wfxRk8WiR4nUN9rWQuIEPj9/XgdfSid8/2VicGwQXOsuYS5S+ziBjfYQqUBjDRy2Yl1rFjfTJKAI1c7he/XF8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YWrqswGN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1755135735;
	bh=BoQjNHcSTqBSm8/g9xSlXTgBMgYi/g2g7YQFiR/wprk=;
	h=Date:From:To:Cc:Subject:From;
	b=YWrqswGN/z3zONChak208QV2TYz5qgyn+kLY3yEEHATGy3WFnVXO9AOew1KxOoYRK
	 vz5KYKtZ0EYOjVRIrCLjCQLtSjQ4d9bRhwICUXeVtHMxpdpeeaLeqJr39uX2cZ382w
	 dWoUBd0LWrWutswO8uS8DQir3XaJ1dgUEZ5+RKrcEG18r+CJPvhL7I3HdO7EReh/ET
	 KJ58EGPaCvPl090L+dcBtwbzRrUl/jjiCNMB43icSMEZHpnTIX1ZFd6R15TyL7QZYd
	 meenfmwAznwIJJDUCtaySLez+f8EiRn0HCCkKRAGYHKOERs1hU+79FbZuAEx9WYvnS
	 yi+BXgcZ/dhyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c2SfG6Vz1z4wcg;
	Thu, 14 Aug 2025 11:42:14 +1000 (AEST)
Date: Thu, 14 Aug 2025 11:42:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the ipmi tree
Message-ID: <20250814114214.609818aa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tX2BVTQpzL7MTWMVvxLdtkz";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tX2BVTQpzL7MTWMVvxLdtkz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the devicetree tree as a different commit
(but the same patch):

  84e7845761c7 ("dt-bindings: ipmi: aspeed,ast2400-kcs-bmc: Add missing "cl=
ocks" property")

This is commit

  a2f5472f1cbe ("dt-bindings: ipmi: aspeed,ast2400-kcs-bmc: Add missing "cl=
ocks" property")

in the devicetree tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/tX2BVTQpzL7MTWMVvxLdtkz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmidPvYACgkQAVBC80lX
0GzjDggAkaz1N0Lokj1kni7y8Qzxl0XW/iw+ppcRZ8czY0d50KmBZb3e31xwShzu
vZIbkJnF2LS6eul0RI5qmfprRzDzC4mRGChAz3mdT8T9qGTiKu8h37vAVfdmWhg4
bL1vN2Trb3eoLlqdkiE5EZAAFUAz6xEfCZYiIMRbnGbLWVoqSzYI5/I6noM2fPgQ
jS7MZ6D8ddVEmQ6XrjWKhTX+kLBRF9qjCvNqCBNGkk2Lj9i5LS4/aLoKCtnbKW0H
2jLBWKqlCJq4FAzOsmuZ05UPqQYHdctyqSI1OB/kdmqxS24jNKF9p6ZYPrHolPZT
EFo/jS9QBagUNQO2IM8rfQBQjYPIdQ==
=j5mG
-----END PGP SIGNATURE-----

--Sig_/tX2BVTQpzL7MTWMVvxLdtkz--

