Return-Path: <linux-next+bounces-6908-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E748CAC1BD7
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 07:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B0261BA70E5
	for <lists+linux-next@lfdr.de>; Fri, 23 May 2025 05:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AE04221DA6;
	Fri, 23 May 2025 05:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Pjjdn/ly"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701E084FAD;
	Fri, 23 May 2025 05:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747978031; cv=none; b=CDQmjGOjQHyxkSZDCdcmbEYS1vB99oHphX8iK9z38P+BFRrE9vP8gEZR1INKacGfHjA4UR7oSMlgvmSeqy5HOg5XhRo/MnGUOrFT/ww4tzpDlhiqZjoJ/bGlmC8mGnXHTbCAksl42K6TWpU2WqKoMvorDGAo2oLVgjQZzriT0Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747978031; c=relaxed/simple;
	bh=8MYD50nTOlO1b0vm4Mg6QrOrgx1wBMtuXZ/yv7ojsG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YlVTxYM+WiNZpeF8iDOGILrcoD3+Kf9ry5+Vsvi4TdVJfcLww5rDPGY3T2I5s/uxhcCHQ40Zg7Re4D5EqMUbnwGoLP4hy5VDtJkATpX5yplXajTfohi6bkUM/awI/m5IrP0tWjJeFRGUkkblheB4Z0yOVwA09mpJhyma7iSmaLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Pjjdn/ly; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747978024;
	bh=+sF19I01sJ2giW8oAT186UfG3HiTL1V0aDAymplToIg=;
	h=Date:From:To:Cc:Subject:From;
	b=Pjjdn/ly8/mI9wS2QFgcmUXE5VflGy5u7v8bkVxFdsKbPwn8Ie3u8p8n3Tud08Pd3
	 FVKiVhStoI9LQiTZg3YCkgDM+OPMzQ6TPiXW9jtkrBpZoB4SAKhvQTar/D67iDRE5d
	 /wLIG6Vd9D8fI2UrFjoYdZ6alwYX1NPs7ITiriy9IxW15NLL6m1kjVqdiuGNjPzFbt
	 PhB6lV5u2Rv28WxQUU0oMdEE5z7uJTJuv5W111mj2GdKMuzgTVx3cKvtu0pADz6Po6
	 iSwn2rpnCvibC5nqdNp3vh0Ea3//T7SeAJMDCCMfpGnYbBmpyg3hn32HCAY3irYliL
	 WmE9eMAgpd9BQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b3YYz6nM2z4xM2;
	Fri, 23 May 2025 15:27:03 +1000 (AEST)
Date: Fri, 23 May 2025 15:27:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Stephen Boyd <sboyd@kernel.org>, Greg KH <greg@kroah.com>, Arnd Bergmann
 <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the spmi tree
Message-ID: <20250523152703.68dd6bbf@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/otQmwNn_bdrl9F/6J=FL4+2";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/otQmwNn_bdrl9F/6J=FL4+2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the char-misc tree as different commits
(but the same patches):

  02a0fd9c0c40 ("irqdomain: spmi: Switch to irq_domain_create_tree()")
  a35fc095fc52 ("spmi: add a spmi driver for Apple SoC")
  b9f0ab020eb3 ("dt-bindings: spmi: Add Apple SPMI controller")
  e274b9cb7653 ("spmi: Only use Hikey 970 SPMI controller driver when ARM64=
")

These are commits

  16d693749866 ("irqdomain: spmi: Switch to irq_domain_create_tree()")
  77ca75e80c71 ("spmi: add a spmi driver for Apple SoC")
  8cc68226a3a6 ("dt-bindings: spmi: Add Apple SPMI controller")
  cdd18ef98259 ("spmi: Only use Hikey 970 SPMI controller driver when ARM64=
")

in the char-misc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/otQmwNn_bdrl9F/6J=FL4+2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgwBycACgkQAVBC80lX
0GzM2Qf9E8ZWLVmB8fwK254pjNrqoN1ph/ewVynkS8kRaA7P0v9OJNtRPbq8YOtf
7N74XE2Qdgf776N2SX2NPRlvm74LpX8DTInrO42NmjwNpktd//46rLUwdkeHnYCI
9hmCCFa3l3Th9b5MZh3k0ns3CqzGyjgishf8A6hLiUQlcthgIrLJVgLYsbfQez7G
8XnIlO/8KIExK5NWyfuuPhHz+YgSqY3PCzo7DzzLryh4XKZYmga71oHHI71yNfST
bqw5OjZDOyt3ls0vMGmXihtHD7hxzI4si42LLv0eRXrYBeLlh65hnJ1d5J9Y9yz0
TQ4ePX71+PPOl1lBK+q7HxyQpkU5LA==
=xkTN
-----END PGP SIGNATURE-----

--Sig_/otQmwNn_bdrl9F/6J=FL4+2--

