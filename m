Return-Path: <linux-next+bounces-7634-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8DB0A45A
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 14:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B73BA1C43EC9
	for <lists+linux-next@lfdr.de>; Fri, 18 Jul 2025 12:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124482DA76B;
	Fri, 18 Jul 2025 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kca1fld8"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571131F4190;
	Fri, 18 Jul 2025 12:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752842489; cv=none; b=lW6T4I3k2yNvwwm77nd1fnnqI+VIB3x65XuoFPn6iwxlChPz+S0FgSwQwAVDLu0zZ6tvdfLbWA/PZWCgFRu2JeTxDY7qDBHVBXP0YmPAWKjdJFby5Al/Myz6ylik0VdeaqQ4jnKmtSNUWCEtSHCJbKfGoAHUx1XeWfUuRdV5lTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752842489; c=relaxed/simple;
	bh=e4qdE4bnAtgOUD38JSZLeLi7ZmI0bx8VbczAmPlJp5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f/JTQkQn+pOTXJueWXm3aXPFoPV64rhcUQ3yfENGa0ml3IYFPA3CtoUrpkMBubeUQqptWrGeLsWKITl2ejg++DRYR2JvxEPWpASs9xUjZXbSwEg55BIK7R9/bbIUVpWAfIp8nGQ+H5ZLj6eixW/KCmEtTZbjkoH6KmgQVJ9qzqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kca1fld8; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752842349;
	bh=CRxW7ZwmzVJUDKZrRKpsVZXUOE4lsbLWy7Wc99vEDn8=;
	h=Date:From:To:Cc:Subject:From;
	b=kca1fld8wTDoGIi+k0DjaG2lvN1QBMfjcPsA5QRC3EVxGwBO0kIpGW71MaqBjr+nq
	 Z5h6f/8gb+dUHKALXuFeeyZkrIx9iKzKsS/4ZowawufP9FKPKd74rGqw80yVIoNh8L
	 I+AbMZ5ZwTBuBoWDPbJejqVgTZ3XoBcNH896HRAt7RApmjvGtx9MAvM6Ttx0rlxgXB
	 B0Aoh0b1QmkLvijthKPUBd6kXO12rNb7nNLUSXAL5Cm7ACHHNaQE6+wFTMqGmmZ6BI
	 6H3+ifp3yj0xwlEqv02ETlaIDmtsVR1Myybhr9Fn07xb18ghoYScOBwnAH6bZMIixl
	 7g3SnyB+Qyh7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bk8Vj4L8vz4x5Z;
	Fri, 18 Jul 2025 22:39:09 +1000 (AEST)
Date: Fri, 18 Jul 2025 22:41:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the pci tree
Message-ID: <20250718224118.5b3f22b0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5DMAZT9ISQLyB4Smd0vbGGc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5DMAZT9ISQLyB4Smd0vbGGc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the pci tree, today's linux-next build (sparc defconfig)
produced this warning:

In file included from /home/sfr/next/next/include/linux/pci.h:37,
                 from /home/sfr/next/next/drivers/pci/pci-sysfs.c:19:
/home/sfr/next/next/include/linux/device.h:199:33: warning: 'dev_attr_boot_=
display' defined but not used [-Wunused-variable]
  199 |         struct device_attribute dev_attr_##_name =3D __ATTR_RO(_nam=
e)
      |                                 ^~~~~~~~~
/home/sfr/next/next/drivers/pci/pci-sysfs.c:688:8: note: in expansion of ma=
cro 'DEVICE_ATTR_RO'
  688 | static DEVICE_ATTR_RO(boot_display);
      |        ^~~~~~~~~~~~~~

Introduced by commit

  c4f2dc1e5293 ("PCI: Add a new 'boot_display' attribute")

--=20
Cheers,
Stephen Rothwell

--Sig_/5DMAZT9ISQLyB4Smd0vbGGc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh6QO4ACgkQAVBC80lX
0Gz+tQf/Z7w2LraHrkH6M/60dwrngsJqFglWnVjq+HppgkhxPFYD3LymbJ04AUE1
KVCPeKqzAUPOx99j/bb1P+es2DzGcbHfPvfSa0B7ZhWPFBEcZc6tcr8obsmxhL81
aAVTIuMzRc+ghpPxCYtCRYWRC5B69gIzMvxvsddFlsfE8ZCkLb5YJDa7uuTu10BE
9ZX/em15NIa9N9G0LssiSwSibO1QNh6s1DXRys8Z9iJrm3TxV1j6QM2uva80VgRo
WXm2QhMm0WtHt2QbnHel8CU48Ufrl+a5ko1/gb5IIF6o7KEki+A/x+sM2Gmz9htt
DTWwmr6XMCXLjioSmyc+hcBkWvlEhg==
=gTMJ
-----END PGP SIGNATURE-----

--Sig_/5DMAZT9ISQLyB4Smd0vbGGc--

