Return-Path: <linux-next+bounces-3633-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3127096E783
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 04:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE8F41F229B8
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 02:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786991DA21;
	Fri,  6 Sep 2024 02:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gBxVQTOX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6CBE46;
	Fri,  6 Sep 2024 02:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725588283; cv=none; b=gL82hAFzRO+WiIGLdjIcKlXatmPF5lrwQEbFiRP17hhWeiLJe73lgIZKl+kT2sBQQDVeK21YQbURWrqUSVWpY5Xfy+XuzjqU0kjexAlu8lxjBMl0pKHK0BLS9+O3nYqfsAVjhz8GTCFbxP6LNRco0U6bvKzxVhKjRW3LraPGMvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725588283; c=relaxed/simple;
	bh=QU0QMmEGzv/5kEsrnRhoZrQCi/M/pHY74FiECsl3X/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NklVYSzGtjeZfgTHyJ0g+WJK6uDe9TmXLZnV6+dJXbYDcW/QdG9XSij0A/bqE1vL7jiv/uJveldpgOkofNh5zut6zEn6zmxtVOec8QLgzMKCRUUIBtrkisB1rNbt85YUYbMdOAfb/RmqtInvgrKLYCUanAjSIByH9o0kMbXdYlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gBxVQTOX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725588278;
	bh=7Ae4Eto86QZ67F3It73wMkAKCEdI1wg0Y0r//mCMuBs=;
	h=Date:From:To:Cc:Subject:From;
	b=gBxVQTOXPfMszOm+Mkc5rsktxm9QMgkH3J5Ae+lU3UrWQHn5mcihwC0eE4TL4IZBz
	 TrCRGV0RhPoOwUp/P6ZIb2Iz0Pfp9dMq4Fle9+Em36E/N0KIxwllZDv643hk/NKVOj
	 D/KytLEeM8XYdXtleLPLQFdV+5e8huuU4P4+7fk9s2QRkTf+rUG1XiyUN0uKMt8jkq
	 EOFtqmW2Wn5i46x6OciG9cAKAh6tESa9jfo0YEZPFyYpakVRpgG3GPrE0/qzXdmF/h
	 9eubkeLeYBCWNWq7bsR0c/YGxhFzlXmXJzbXtN1ehMi8PkqLzhkpd5iUgNuKu3L4F6
	 lDYAFHRxNpU3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0KKx32jvz4x7H;
	Fri,  6 Sep 2024 12:04:37 +1000 (AEST)
Date: Fri, 6 Sep 2024 12:04:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann
 <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the sophgo tree
Message-ID: <20240906120436.74ffdd06@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6ru6Uu+dOWJDZyBszhJK_9i";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6ru6Uu+dOWJDZyBszhJK_9i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the arm-soc tree as different commits
(but the same patches):

  0014d11186f5 ("riscv: dts: sophgo: Add sdhci0 configuration for Huashan P=
i")
  161477baee0f ("riscv: dts: sophgo: Add i2c device support for sg2042")
  33ae4c56cacf ("riscv: sophgo: dts: add mmc controllers for SG2042 SoC")
  47e5a8daf0b9 ("dt-bindings: riscv: Add Sipeed LicheeRV Nano board compati=
bles
")
  4f8fb973389d ("riscv: sophgo: dts: add gpio controllers for SG2042 SoC")
  7f3cf53e4c65 ("riscv: dts: sophgo: Use common "interrupt-parent" for all =
peri
pherals for sg2042")
  c0a4490b120f ("riscv: dts: sophgo: cv18xx: add DMA controller")
  e8b4716e68ba ("riscv: dts: sophgo: Add mcu device for Milk-V Pioneer")
  f9cc479ddc8c ("dt-bindings: interrupt-controller: Add SOPHGO SG2002 plic")

--=20
Cheers,
Stephen Rothwell

--Sig_/6ru6Uu+dOWJDZyBszhJK_9i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbaYzQACgkQAVBC80lX
0GzAHQf8DPP6aZ6VesgFfNbcT+bXpAEuWcdBEO3+hJp346nKJbxiGi6xWzQuSVEu
Be1GEXly39VvrAZ2W1Ejt3ZFvONEfAQCIGhe0rZmv3D0Wrb7QdlI20DG+ojIY5Zr
5F5IWFT6hOp6SGYaEaWWBxtA5ahTriiK4mQl32rgcDoW+xd1wddtGUBn+FLbpzGs
SCMFrXP2OOWp+M5W2z/GHNs8Ng9VYFjo8jj9rx4WKRiMVMXxZcLHq6pF3GaqzeEz
uy/MvhDnPgNCOWtBcE85/dIizw/sZqLrqcmIMSqBb9OuRJ7HEHQ3wkYHMpimo8XT
0qs5sZNFKlmKruX8jQa1z/3ygypOqw==
=vcA9
-----END PGP SIGNATURE-----

--Sig_/6ru6Uu+dOWJDZyBszhJK_9i--

