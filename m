Return-Path: <linux-next+bounces-5205-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B23FA11472
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 23:56:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1306D7A2E2E
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 22:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A418B2135B9;
	Tue, 14 Jan 2025 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DeVMK3rw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E0D20AF6D;
	Tue, 14 Jan 2025 22:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736895375; cv=none; b=LHf8kKGD7TaO3SMrBZBi2otrZhjW8cqUoHN218nAdFxv8E4CT7L2ynZxKVgnS2mBsM3LLCk2jFPrwrsFr5N1vpN2ithRMUHymVXpnBiWJVZJ1yctRcMBTE7Pz99s5YfMQqfnvz2E0ITpHc2eHW83upF6jfEoIlctM5TKJyRoB3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736895375; c=relaxed/simple;
	bh=zdK4uTtu0vRS9xOJArid7rSo+ZJEZflvlLJwd3/f6Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E5+egzO4+v3U2ublTgv0/qrNrWarmlfkbbNAc2c0LbwX/3V3QgTCLIKLKb03OrJBXa1wJlfRDAsACp4dGI8VnVLM7Z9M88CbffG/KsEdqyAHOjBw64AmHXmQDqVx8DmMlTfI6lzl8oqHaYFxxboU7wQ3mwyE0tc9lTzPQrKaZss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DeVMK3rw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736895354;
	bh=buUYNZX0LvddXi32/Q6x1dNXXVQS3m81kFjOwTKf9lY=;
	h=Date:From:To:Cc:Subject:From;
	b=DeVMK3rwo2Zjc4JMMUpV7pKGuLXeRy+TtscMMTqI0iiQHtpmh4Ba04dd8MuLeRuxy
	 wNEOQeRTgWiYaJN2aC3/Pb7g1anTm8fibVr5I5cIell8iUn6jQbLDFjQsgkbgAD+cb
	 97mq0naZf0gmlC/gl/MYTmN/ncLA9KbuN6H6TlQhV6oO2Vvf6pgAN+2IT+7MfdXMXL
	 xfV6HiyGTmMSWkrHLv5216wIYleEPcfkTo3aY1Hsjq17Tm0Ya3pDl5mmu1N3OWIZQJ
	 UqlTpbLsM/SavJWCBh0P9hu2m1L8RxILcdKaS8l8x2uJhURSCDuXAE78LPX3w8KwcQ
	 RuHsdTAYHEXlw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXkxj45sdz4w2R;
	Wed, 15 Jan 2025 09:55:53 +1100 (AEDT)
Date: Wed, 15 Jan 2025 09:56:00 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the tip-fixes tree
Message-ID: <20250115095600.1d336ce6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=M6zl435xi=+ab/yPgkciqM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=M6zl435xi=+ab/yPgkciqM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotfixes tree as a different commit
(but the same patch):

  a9bbe3413331 ("x86: Disable EXECMEM_ROX support")

This is commit

  1b5fe18d3454 ("x86: disable EXECMEM_ROX support")

in the mm-hotfixes-unstable branch or the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/=M6zl435xi=+ab/yPgkciqM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeG64AACgkQAVBC80lX
0GxMoQf/c6JlRZiEwZPevGsyf4WJXWgQMYaY3rpebyNcpl8BU9PwPOGamUnSR+xV
RT9f4B/V1B+aW7/lLrtZN1VBcVyhclb6P7emcNKIX2f67QprWXnlc+QCXvVCHiHm
ZDbbYmwnFgFeHpaPIbKQxUULI5QhIYebDyixs8MJLQLCnC2efwbPesCgZszh1jJN
KkgZ859ZMbBJN4H93LdNxCai9Wq/z2vPh3HS1ScKiEjHHD611zZSv+SnSNr7b8HI
Ll65Zyo8AMFBCeY7rdv3Rb0RSGBNWVT/Yy3FtTWnufxNNw3rASKDc5e8ZO43wdlX
qQCE1/VJrRUHGljpIJjyLgD6/aihGw==
=5CdP
-----END PGP SIGNATURE-----

--Sig_/=M6zl435xi=+ab/yPgkciqM--

