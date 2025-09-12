Return-Path: <linux-next+bounces-8275-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D26B540CB
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 05:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF5B1BC122D
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 03:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE98A7A13A;
	Fri, 12 Sep 2025 03:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="QZZYV85+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80FE2DC763;
	Fri, 12 Sep 2025 03:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757647114; cv=none; b=higZm0WtbFTdWKzIj0lCpA4j5wT+fEnSWmgSC/sYDzy7AMSTiwYp0RtYVvJ2XH+n09SklOSP9+RBFQlNdjWxu8ToOo3tzOC9jMoV2K8FJ4K0avkgGRt0m1zdpwd+sX4orNAZeZqfHQqJZLFUxnxFlrtbxGxFL6riYWuKwwP1yj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757647114; c=relaxed/simple;
	bh=ubEgGrHEverJU0HZjTPqnazXfy1Hn6FLL1wW91e3Hpk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IbVSCQoNv5aMzakCRN6lUqIFt4FXMDEedSYxzzYupCxKydpvXxoxJ9VjSbZtu+2R3OfEgpA1GPQdo1aIFtJ5XEcP4XNMrm6mopF6wErOIZOfQdhx4F1CFFMAq7ZrAVKsb+IW1iqquBW3u2Ved3YDM27p/mAOUJzfVgPY2nQ9xMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=QZZYV85+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757647111;
	bh=rIHi+pSQ6hhcA1835ICTjZ//WDvlIzAkAfErl0O69lU=;
	h=Date:From:To:Cc:Subject:From;
	b=QZZYV85+uNlDVrlcZrG/yUQrx79DpGmnG9NTS9n31+KtS3tAenYDyOAu0WAVGp2oy
	 7Zy2vo2uyoGPOINEY0mSHNtRo5foxLZ8a0hjuPKlN2PFyYLNmr7pPBlQc6+ghm32nQ
	 p1g8eUbmHses2rabVnBbmgQ8KhDytcGRt2XMcRtERhO+eDsslygQEHFzC/wujdqSva
	 1+4iHUlXLYxHaBKRGuTVcdQ5xZm/o+ac/nPyQHlq/U9pquTdRcXw7Dp+saIV/5HaLA
	 zl7GDu3+Hv3HhG+8CmmSkcKM3hESM3ps6TTsOg0+9StjrzTfJnYNUUULPogoPZk3Qv
	 WRleGkkNr8Ikg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cNKPy6xjgz4w9T;
	Fri, 12 Sep 2025 13:18:30 +1000 (AEST)
Date: Fri, 12 Sep 2025 13:18:30 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the gpio-brgl tree
Message-ID: <20250912131830.773a6929@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cPA01UaJzv6IcsP2v=Z6cXZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cPA01UaJzv6IcsP2v=Z6cXZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mfd tree as different commits
(but the same patches):

  9b33bbc084ac ("mfd: vexpress-sysreg: Use new generic GPIO chip API")
  1efbee6852f1 ("mfd: vexpress-sysreg: Check the return value of devm_gpioc=
hip_add_data()")

These are commits

  e2d401a6c9eb ("mfd: vexpress-sysreg: Use new generic GPIO chip API")
  edfd67239981 ("mfd: vexpress-sysreg: Check the return value of devm_gpioc=
hip_add_data()")

in the mfd tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/cPA01UaJzv6IcsP2v=Z6cXZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjDkQYACgkQAVBC80lX
0GyRNgf/bkq+HdAtk0vRo5hXYhv7Pp5r8/3+NvCxE3pfJB3DrfDOEPSVKYArP603
JZvi45ZGCPYQZy+TgWZ73zYI7ZWv1JxEsUdp+j553SPNF0hXtrqwWWdPiE/N1SU2
9Tgs6HOCe3QnwqHc08NHBIoLLfpMSoIVZjIxGutAyo/EkK1Iu3zKwKc7YOnavVCK
KHLwfMrGzjLFvMv9IyNJwwmRvmF9yUl4RqY1bDMIwKtsWek1hUNa6067rg0uYhoV
BnHxLG204bs6FRAGKRZ4T7dptxhyzZyYBOb9reDPQldOuTCBeOlXL5nrlgt76IjZ
EG4O5tw4vPKXzsvm62/urvbcQN+ohA==
=7e3Q
-----END PGP SIGNATURE-----

--Sig_/cPA01UaJzv6IcsP2v=Z6cXZ--

