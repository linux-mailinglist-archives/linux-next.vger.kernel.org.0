Return-Path: <linux-next+bounces-3021-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C8B931E11
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 02:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8F201F2257F
	for <lists+linux-next@lfdr.de>; Tue, 16 Jul 2024 00:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CFF187F;
	Tue, 16 Jul 2024 00:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VQtdARkM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFB41860;
	Tue, 16 Jul 2024 00:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721090518; cv=none; b=dbnteoo39rNHH2xab1JSTPJOkuZydZweUEVmXhx6J1U4dQHxXqrfQnGYZanEe8eDvFm5lhd7+P1myTjwijZ4HvYmB9LNjSTt4PAg0pikuUiaXxGYn+KMvuhJwGVQloZJZVdGh7qR2ycNc/rTzv0UnjWRuVKFiDBZHhdsP+sqX6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721090518; c=relaxed/simple;
	bh=BkM+ScH4RtQxVTtUSHazVvgH6+xHSxk+9PZYEGR6cT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R5t3xQMlYbkT+QjetK/3fJgV9xc2Vvyxex6SaqS4i4Frpa3ghDzSnojr5VCLfHBok3Fg9MJ4gZ51ZU9BVLZEUUYOVaL1lxWsWNLXycNduNEXVAHkWQMH+hdXHl+w1/MeK2PYmQb8x5slg0k7TbvYfA9Z3k+fdYWDeMRcLSqc2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VQtdARkM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721090511;
	bh=ZeZwkQCqNfnZnoGCOyubbytd70pev66kMO3JAOTChE8=;
	h=Date:From:To:Cc:Subject:From;
	b=VQtdARkMJO1mvAE62LlZro7Iim7IhCZdKs2vToXt92EDwUpR7Qx9dbLvi3/sagX8K
	 laAAq2sJCd6pw0gtCnAxLigYOxUe9F85B08YNsgVPsuLad53ZPw8f7KCyyBOEqN4+h
	 zgLE5w3Wa5ZcF5bgl7q+lDRUA3XJ80qgqrfpPywz6L0uBLxUK0epokqgTZAMA3ELmf
	 T+e0DH/jE6g+Ko9a2Y85b+0XUlmmcUWTMpd2elW/IAomO/6Rw6983+Ya+x65lL2pWc
	 UqzDJ/+PcpvnCkyHRIjduRss7STqF5vRjpU5a2gcMAX2CAA45lFG2QVqvaswxSEcAA
	 AV4GfYe9sl7vg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WNKyR1Hzfz4x1y;
	Tue, 16 Jul 2024 10:41:51 +1000 (AEST)
Date: Tue, 16 Jul 2024 10:41:50 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the clk tree
Message-ID: <20240716104150.3e99e835@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BsHtZYbrJfISFjNNTpV+LO+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BsHtZYbrJfISFjNNTpV+LO+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the clk tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

ERROR: modpost: missing MODULE_LICENSE() in drivers/of/of_kunit_helpers.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/of/kunit_overlay_test.d=
tbo.o
ERROR: modpost: "device_is_bound" [lib/kunit/kunit.ko] undefined!
ERROR: modpost: "__dtbo_kunit_overlay_test_end" [drivers/of/overlay_test.ko=
] undefined!
ERROR: modpost: "__dtbo_kunit_overlay_test_begin" [drivers/of/overlay_test.=
ko] undefined!

Presumably caused by commit

  aa46879db9ac ("of: Add a KUnit test for overlays and test managed APIs")

I have used the clk tree from next-20240715 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/BsHtZYbrJfISFjNNTpV+LO+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaVwc4ACgkQAVBC80lX
0GzvwQf8DO2YGW++1lZlZIC8jpDnVUugyZr1LS8sjMgljnLYcGZYKt6OcT38pLW0
FwVJq36vUqbh82GkMGwXsuvrDwX85OT5a2kM5cEA8tyiNhZC4cRP/oClRGL6kGIj
Iin6HEZLL01yTVEFKZN2HMBvm26paGdAGb89pJPirS+y7CUp8P1J/ZdaZmnpL5q6
6syxLbHKlwp9N6+NkRpDaq4EiQUYXtXyrIh8bc6t0mjAdLCNEQf3l8q9lBolVucl
vPY11BTyMAR7FKEnz43A3ve87Vp0tmktJZ6mmsxQmuAt9m6zp6FJZVqsy6Lv549q
2lW2QuFPm4BFoec+9FtHKSKNY6wOjA==
=c2BR
-----END PGP SIGNATURE-----

--Sig_/BsHtZYbrJfISFjNNTpV+LO+--

