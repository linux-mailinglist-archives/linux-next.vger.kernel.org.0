Return-Path: <linux-next+bounces-2214-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CDC8BF343
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 02:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5979E1F21E28
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 00:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66062126F09;
	Tue,  7 May 2024 23:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MuGQFQhe"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4617FBAA;
	Tue,  7 May 2024 23:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715126252; cv=none; b=pzXfKCRzkfGC3/p/j4Lf7Ziz7p7tC4sJKa6NKZWcLMBoc9Egxn00SJ2qJ4uNsrCiEE1ovK8c3gptzZGD2VtIWwA/Rqm31ePq/q68oxWbzJStxW+bgmm3OpABbfoKOq7WKHlDmC8vpwba/L91Oh6aMssPbioqWczP+gGK8lvWcr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715126252; c=relaxed/simple;
	bh=cDG2NTu1l+v95jsjCWLrQBe1LvPkUx2yO2UGOxzaSdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dcK81gVDcnbyBfZZ6njG1p3eZr33ANf//LSzzoCuDIHySxDMI9y1KiunLBM+I00spRSY9aUuaRIWNOYNO0mBZCtf6U3Rp9jcUQyFYmYKsPxLQX04qqYh4mmpSmq6M8nAVjaqpyPmSmwooJkR3UXvPcpp8XAsKEFdnREO7Uru/n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MuGQFQhe; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715126247;
	bh=qonoCRoENSIJHdSmQfdZMP+NYWWbYe2n5F6Tg2fO14c=;
	h=Date:From:To:Cc:Subject:From;
	b=MuGQFQhezEIVcPbFUCnt1gJMDJ6LnduX2+A0gTiRFOwnjYcN7BpkP8fYbIzGZnkjH
	 U5ro1Z0hs8toR8EkWR5ELtDD1B1z3bRMW9UbY+NZpXJzs8RCtUe9lUAXO2bKP42zcO
	 k0qx2IXlmPGGSq0IhLxoo3b5kApn+RfSv+pg0aWaV648RbM6iWv4PYGUwJSHLdHv1t
	 nFjT66K3Po1h5BqB/ji3PNyudmef+4c5jlP64wX9NNK88zOumty0OFqzxfNk5oOTbD
	 6cGbGhld44Oe3+cGzoHOtfhrg/5k6iDoOzBBEsO9m6bJ6F/YzRT5DsqmwN/ADUWVa9
	 ctiJDHP30VnNw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYwF26Vs2z4x10;
	Wed,  8 May 2024 09:57:26 +1000 (AEST)
Date: Wed, 8 May 2024 09:57:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Masahiro Yamada
 <masahiroy@kernel.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Jens Remus
 <jremus@linux.ibm.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the s390 tree with the kbuild tree
Message-ID: <20240508095726.32237e53@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1tp04PMxwjC/1OLuKhc1.jA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1tp04PMxwjC/1OLuKhc1.jA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the s390 tree got a conflict in:

  scripts/Makefile.vdsoinst

between commit:

  d6d223135547 ("kbuild: simplify generic vdso installation code")

from the kbuild tree and commit:

  4cfae05eb3aa ("s390/vdso: Create .build-id links for unstripped vdso file=
s")

from the s390 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc scripts/Makefile.vdsoinst
index bf72880c50d0,a81ca735003e..000000000000
--- a/scripts/Makefile.vdsoinst
+++ b/scripts/Makefile.vdsoinst
@@@ -20,8 -21,8 +20,8 @@@ $$(dest): $(1) FORC
  	$$(call cmd,install)
 =20
  # Some architectures create .build-id symlinks
- ifneq ($(filter arm sparc x86, $(SRCARCH)),)
+ ifneq ($(filter arm s390 sparc x86, $(SRCARCH)),)
 -link :=3D $(install-dir)/.build-id/$$(shell $(READELF) -n $$(src) | sed -=
n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p').debug
 +link :=3D $(install-dir)/.build-id/$$(shell $(READELF) -n $(1) | sed -n '=
s@^.*Build ID: \(..\)\(.*\)@\1/\2@p').debug
 =20
  __default: $$(link)
  $$(link): $$(dest) FORCE

--Sig_/1tp04PMxwjC/1OLuKhc1.jA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY6v+YACgkQAVBC80lX
0GxEAQf+LOLDDPPXCsRtyNVh8cGbDdx356TB/E4Pbl/ew3xafjEx/yrPz0QV3YyB
1L1gikOZ8JK5hlvDVmt33hlmnp+bMt8GrnazdCnarhxfIBZk0XnYTLG9IZRxGpG4
fq5J16d8hhyvR+9D73TsAv35+EdDT+ju7vRyjjb7OhabYpQ1Rt+npreOBKIgCTzF
JheE1wkje5sAsfDWIFtid987DW6DuQfIpB9CxGc1XtzkJBanxGRiLZhonz+ILQGD
QrY/+pJtjyb//Qu+IAq2qsfEFhD8gWnGQt7GNiSzEqF9vw6NvLwqI5crM+qJ8MNO
MxQFUmoWg66380N2OZZjYtmaJUIIHw==
=J9g7
-----END PGP SIGNATURE-----

--Sig_/1tp04PMxwjC/1OLuKhc1.jA--

