Return-Path: <linux-next+bounces-8700-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D655C040BC
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 03:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CD8A1AA5688
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 01:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F941E260A;
	Fri, 24 Oct 2025 01:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SijKl9Zf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C381DE892;
	Fri, 24 Oct 2025 01:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761270555; cv=none; b=k9hB6nTEgys8Qwntdo0dl4n0n3tSFLb+J1pmSgYuEOND9mI79RbuewtlFKv2UAh8GO2Lz0pclQwOG+yaW5254ddgpkPa3skN5ooKAMkONtEVQdpud4VsQQoKRobkYllM3+w4+zdcqVRk164WBwZNuR/lTSqjo9fAMlEAdA9KIFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761270555; c=relaxed/simple;
	bh=OKDYDV31QudHBzmwcsehj7B9RfLFfCaDJ2kG4AVbdjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DKXfvqkmFzORRpzC3C8x3if8t71ROV29WR/TQ0InB1FhrPTLnrroWbAvXaIZ9RaimlfhcFdsNKizjnBdDTspnFzOM6COdGGVqz8KHTrC6RtzLJwTBtQdJSNTUKsUdApODAsgePBPlom6RHITlUQhm52janPKXLJnKlXlIIjF+N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SijKl9Zf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761270548;
	bh=Vq2W9e0Ar1vX8Fr5jSwA2zZskLlAkqODb7GvMH6VgBU=;
	h=Date:From:To:Cc:Subject:From;
	b=SijKl9ZftgTAWdJ0YxNzACM5YjwrM6makIhtrWwdc6r64ig6wb1Yr4cV4+sXGL8kM
	 IDgfKlFtFbhcaSf75J5w+LWGRUIKPFtV3LSzlapvSgCoaaUMgOD+KiuF4oUNnUnKP8
	 407HdRQWIMQwRTrLJ4vNt4qFeoHs2ZTjMBp57v+cRv1gblLUdBCurPjF0qatJEe/Yz
	 3UwMEJnH1YUmjCpCk3ypPEAkMXqZ84bO/f/fMcn2jFh+FUA/bPVAYE3oCROIHTWASq
	 /yuwQ5/LidSYMQU2oIrtSR1iFVFoEfEYTHluXfn6CrNAY0w0d5TM36USQ6/sVy0gsA
	 JcoM3W+cFXDjQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ct5RR52v7z4wM5;
	Fri, 24 Oct 2025 12:49:07 +1100 (AEDT)
Date: Fri, 24 Oct 2025 12:49:06 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc: Akshay Gupta <akshay.gupta@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jean Delvare <jdelvare@suse.de>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the char-misc tree with the
 char-misc.current tree
Message-ID: <20251024124906.70323e51@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w05ti=TNbcy52lFug5q1NHC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/w05ti=TNbcy52lFug5q1NHC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the char-misc tree got a conflict in:

  drivers/misc/amd-sbi/Kconfig

between commit:

  70ad06df73a9 ("misc: amd-sbi: Clarify that this is a BMC driver")

from the char-misc.current tree and commit:

  5c7dddd7360b ("misc: amd-sbi: Add support for SB-RMI over I3C")

from the char-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/misc/amd-sbi/Kconfig
index ab594908cb4a,acf0450ba220..000000000000
--- a/drivers/misc/amd-sbi/Kconfig
+++ b/drivers/misc/amd-sbi/Kconfig
@@@ -2,11 -2,11 +2,13 @@@
  config AMD_SBRMI_I2C
  	tristate "AMD side band RMI support"
  	depends on I2C
 +	depends on ARM || ARM64 || COMPILE_TEST
  	select REGMAP_I2C
+ 	depends on I3C || !I3C
+ 	select REGMAP_I3C if I3C
  	help
- 	  Side band RMI over I2C support for AMD out of band management.
+ 	  Side band RMI over I2C/I3C support for AMD out of band management.
 +	  This driver is intended to run on the BMC, not the managed node.
 =20
  	  This driver can also be built as a module. If so, the module will
  	  be called sbrmi-i2c.

--Sig_/w05ti=TNbcy52lFug5q1NHC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj62xIACgkQAVBC80lX
0GzFIQf+Pf/CIjEurF2XEAx5vNNjZhkDASgLlWJjDA+2qw8AOH80E2oxmgI0zD+R
zYidRbyHuOREZxFu9EojPH2i21YsfHU+j7OBWav29fn2kCdIla5KyJ1PJxll/fOV
N8NnXVClyzFAswdWkMktkQjHwDOU37WrFUUIq9J9XvxtgKR04LHNX3dlx0ItynEw
qzhuOGtfOEN7OBTM3+VL/58F/nACbFOgs/4yHU7GE3LJu+Rs0BTu0UvVkY+P9z21
qSEyNsjMcBdILKkHromDH3uA1/QEZygE1l42plCL0tU5ja+zyxQRXTzxwM0vviqS
a/Z95GGsqYkefKknh9EyoGsg2L/frw==
=eJoi
-----END PGP SIGNATURE-----

--Sig_/w05ti=TNbcy52lFug5q1NHC--

