Return-Path: <linux-next+bounces-4997-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3729F73F1
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 06:34:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C39F516B9AA
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2024 05:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265B61F76D3;
	Thu, 19 Dec 2024 05:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Zxmk61zF"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E227E575;
	Thu, 19 Dec 2024 05:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734586491; cv=none; b=IPodcux0RCTpMsEBz85T4/IU8DJroSyWsAQy42L6QNclwgOoz2o36QhIl5XqZYpF4/NDW1xHd1mVooZZtgJ31H4izQBXJt8trfcBqSOYMrKECUpXbwIPTP5AJ+eDiLDFNH/3XzzTl7LH0yUnpkGL83tgyMJF/1s6u3aooSo5qSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734586491; c=relaxed/simple;
	bh=FS5Qz1O7qF2ZgOI98iMRpjhWvDrAgMYWom4p3rX2jdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=V5i3mqxToNbn+pcQJv8OWg0GTcV4wxvkUmUWPHje2oGBDN7qS255oiqO7NbEdmNwcrj3gGuaev/iI/6c2TSpnU7exK5Als9FCFNsxYyM4B3vrVxttqgqxLGC784n6NoCfTgkP4RsM5P2SqDfAzQYOlB51WngNGpL3hH0/Z9dqng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Zxmk61zF; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734586479;
	bh=mEOrwoRof+7AbnzdqmfsejfP/PL1wMy5jeoWsKX98jY=;
	h=Date:From:To:Cc:Subject:From;
	b=Zxmk61zFqHOtIOd5ShPh62iOKi0CE5ouIfKlwQA5ov9Cg2lPxhKPbuKC/Ip/7lgi6
	 BfLOiUNvYADh7bjPdLydWMXaQWPgoP/q8a2KoRSnNsSGfg5fC2noo2pJrSAFNloDL7
	 3KFd1R0y9rGEpnj9+4/x1Wt5tCLJDdZhBxl5gIGxN3uK40R/vS8FAU99P0n0DgAKxm
	 1WzaK4xL9Ln7VuaKEs1Wt2TXRQEB8X17De3xaBCElBOF3grYQ1o2CRylI75ITRQeeQ
	 +X+whV1YFGKH5R+nsM7zu3Gjn5R4l7fcqM7GvfATRo19ehlxJQS/qGJHtXKXrTqW2G
	 hniTKYKQIAKYg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDK4G4N5Qz4xdw;
	Thu, 19 Dec 2024 16:34:38 +1100 (AEDT)
Date: Thu, 19 Dec 2024 16:34:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kees Cook <kees@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?=
 <mic@digikod.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the execve tree
Message-ID: <20241219163443.349fab59@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//GhQ24aPOODXpsSb7GIBfVg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//GhQ24aPOODXpsSb7GIBfVg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the landlock tree as different commits
(but the same patches):

  95b3cdafd7cb ("ima: instantiate the bprm_creds_for_exec() hook")
  2a69962be4a7 ("samples/check-exec: Add an enlighten "inc" interpreter and=
 28 tests")
  3e707b07f582 ("selftests: ktap_helpers: Fix uninitialized variable")
  faf2d88e5567 ("samples/check-exec: Add set-exec")
  0e7f90f34cf7 ("selftests/landlock: Add tests for execveat + AT_EXECVE_CHE=
CK")
  b083cc815376 ("selftests/exec: Add 32 tests for AT_EXECVE_CHECK and exec =
securebits")
  a0623b2a1d59 ("security: Add EXEC_RESTRICT_FILE and EXEC_DENY_INTERACTIVE=
 securebits")
  a5874fde3c08 ("exec: Add a new AT_EXECVE_CHECK flag to execveat(2)")

These are commits

  d294b3aee748 ("ima: instantiate the bprm_creds_for_exec() hook")
  3cb0af26efa1 ("samples/check-exec: Add an enlighten "inc" interpreter and=
 28 tests")
  027e1a676890 ("selftests: ktap_helpers: Fix uninitialized variable")
  b8ef9d9f61cd ("samples/check-exec: Add set-exec")
  297d25a26208 ("selftests/landlock: Add tests for execveat + AT_EXECVE_CHE=
CK")
  926b857736c8 ("selftests/exec: Add 32 tests for AT_EXECVE_CHECK and exec =
securebits")
  4196eeb79f44 ("security: Add EXEC_RESTRICT_FILE and EXEC_DENY_INTERACTIVE=
 securebits")
  9f05363166c3 ("exec: Add a new AT_EXECVE_CHECK flag to execveat(2)")

from the landlock tree.

--=20
Cheers,
Stephen Rothwell

--Sig_//GhQ24aPOODXpsSb7GIBfVg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdjsHMACgkQAVBC80lX
0GyAHQf8CHbG3S1vNhVLImGOBoEMfohYP/dBK6fMXNjYjMVEKHTBWIDiRcJuIoI3
TGpSkZNb/M3Jt95BhJbdpcxwxKnoCNlrslqSlFGhtm2NAf/2AvnSRldKZDBnHvXe
S8cjWInIt3C7uqee8YOgVuzk+p+pryoWv8De33PhHT/opqv+vWO5ck3xA0Zj6Agq
ZueQtumzUBEIjbBaUIdERLSNiOkLdv1k+s8AAnMVTHf+kgsN9zgpo/qY6+Mjrt3+
iO0/gkJBszeYCDnOBmyEbCb58pczrpm9+3doyvN7WDkF2TRcCed+yf4Y6c1eT/X4
VcaO97QImnNPURh+9Gccl9kvJt39yQ==
=CdeD
-----END PGP SIGNATURE-----

--Sig_//GhQ24aPOODXpsSb7GIBfVg--

