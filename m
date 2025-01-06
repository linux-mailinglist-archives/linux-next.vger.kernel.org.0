Return-Path: <linux-next+bounces-5044-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CABB0A01ED4
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 06:34:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 554E13A33B5
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 05:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F752200CB;
	Mon,  6 Jan 2025 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="px3URJ72"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBBC3D69;
	Mon,  6 Jan 2025 05:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736141665; cv=none; b=s63YGKFFzNlGFOeV1M0HVocU4H4buPFdz/q0FO4y9JfRptFAprt7/26DA2SP2GsZEkUcmpvd8CzCg6g1bJuZUG2abpsCif1tgZoD/ScbrEDh2VxUgfpCF/InMTbpGV6Rm1hbAOGD5cYrU7Rkbf0rTA1psJ/sz1EBeZPUWXS+fo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736141665; c=relaxed/simple;
	bh=gf81dpZc0ELZBRRqEHa1nmMj38IVsWu+t7T0qSKtybs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lZ3C5qOHl4I3xZey9AyKTeMMesBs8g9oYKe3FtVQaH2sNCAVSJ1czts1aFhpgHOM44TnaN3ZOfqDjQag67D+OWi/9qBtOBIJKTCMbj9s6N6jZPQ7LPBgPgWF6n1fO/dgreUOmgoLEODfW/yrRmUjnq6oIaIMcOcQ1vYXsXztQyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=px3URJ72; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736141647;
	bh=1z642srB7MhOWCxtk1gR8/5n50OlxT2rXxHbfuG8A84=;
	h=Date:From:To:Cc:Subject:From;
	b=px3URJ72K8AKqYq9vA/kNvacetzHh51QqPeh2FIDmdPzidKrob1tVedEjAPmvWwYL
	 4rIZoGRUA3d4k3CGBwC71C5P2dkqEr/BD9oT67Yh+rCJmP9AXuDG0kXbrqLkSz1kzM
	 JmVj8zRsx+5TrIeXZZxHit9Q8Fo2fAKJw9IYOoySYzJ3njE5q7+Bgkjr5bgADzS1XE
	 nBJFI8CjoAry4mBGNYBq5jspYsmaVvbVICXIhWnK6q9aJpHRv5xKKD0WWu3BB1fukx
	 Xyzs5yuyaDOtjuzvhE/6Ug2lhgS9lyAZBl6OxHtHF9/jO7CzsCSTrohM/QDE4liu/o
	 1aGDctKSxQCmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRNCL4PyBz4wxm;
	Mon,  6 Jan 2025 16:34:06 +1100 (AEDT)
Date: Mon, 6 Jan 2025 16:34:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley
 <James.Bottomley@HansenPartnership.com>
Cc: Eric Biggers <ebiggers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>
Subject: linux-next: manual merge of the scsi-mkp tree with the scsi-fixes
 tree
Message-ID: <20250106163412.1d6f6750@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LbmwtxUMdhA4i8LukYwjOJb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LbmwtxUMdhA4i8LukYwjOJb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the scsi-mkp tree got a conflict in:

  drivers/ufs/host/ufs-qcom.c

between commit:

  7bac65687510 ("scsi: ufs: qcom: Power off the PHY if it was already power=
ed on in ufs_qcom_power_up_sequence()")

from the scsi-fixes tree and commit:

  30b32c647cf3 ("scsi: ufs: qcom: Convert to use UFSHCD_QUIRK_CUSTOM_CRYPTO=
_PROFILE")

from the scsi-mkp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/ufs/host/ufs-qcom.c
index 91e94fe990b4,eae8dfb8c91e..000000000000
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@@ -1826,7 -1876,7 +1878,6 @@@ static const struct ufs_hba_variant_op
  	.dbg_register_dump	=3D ufs_qcom_dump_dbg_regs,
  	.device_reset		=3D ufs_qcom_device_reset,
  	.config_scaling_param =3D ufs_qcom_config_scaling_param,
- 	.program_key		=3D ufs_qcom_ice_program_key,
 -	.reinit_notify		=3D ufs_qcom_reinit_notify,
  	.mcq_config_resource	=3D ufs_qcom_mcq_config_resource,
  	.get_hba_mac		=3D ufs_qcom_get_hba_mac,
  	.op_runtime_config	=3D ufs_qcom_op_runtime_config,

--Sig_/LbmwtxUMdhA4i8LukYwjOJb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7a1QACgkQAVBC80lX
0GxJzAf/cpFd89H3Gx07cuWNBUexay8Ba8Ewy0E4z3k5n9+hsRlCJIWAT1xuujDi
wx3dLIxmB2i9h0PoKFwaUZvnASXCnwHhcEQ9bUgGVpE1zepQpwNz6dXF7rT4TEtG
Nk/ui+8muAvwCjVpVhVzjhC22BW9vKmCNaFm95c0vbZWVRYpkIKSQ0ctwsq5Tm/j
ioP7oU2AAkXYy99N4e2LSdC4lCMDXoicFJnGmNcsG7QTJO0nPPc1hVeRtw+++1wP
oLLyC/bNZgdP6ucwuZCtuiPMJ90YV5nj8cxODgV5srp8MchTia6sd5gQrW9m35I8
yxPUo5/JrjUgI1MigEQXyRfg89KDsA==
=lyHw
-----END PGP SIGNATURE-----

--Sig_/LbmwtxUMdhA4i8LukYwjOJb--

