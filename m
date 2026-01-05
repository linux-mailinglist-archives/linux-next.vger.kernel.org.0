Return-Path: <linux-next+bounces-9534-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA3CF1CE0
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 05:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02CEB30084E4
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 04:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDA9F26D4C3;
	Mon,  5 Jan 2026 04:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SThXviUy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A31211A09;
	Mon,  5 Jan 2026 04:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767588169; cv=none; b=ZWV1o0GMJbzqxs4ReL9QMbhV3drm1xER/7dMgy/RWEL9PYQ4q8QRl2jKya4Braexjt9PaGJWbqxyC4FPVhyekUhz6+mb1fFgPZQKCiHURelicoHBh+yv91BPy2ByYnYZyh0OjDbnPITa0qMv7ss8Azjib+EnpC+MWlOs7kgoTM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767588169; c=relaxed/simple;
	bh=dXiWgTyEjxqNNsv3uqM102MsL2PhA5sqoedfDkqR1TA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fSdenpEl+wkYciT4PIu6DhCWNcyyQHiYXYI1OfHw7qrpQA9kMlZYunQNuIt9lsxooEcHaZJAtQLVnQ0gTfDjnZ+PPFIkJ+NC5iuEprvxz+SqLluVEidPfjWWUahsAIRBVQjWet93ReLYOpQzgstGz3ly2FT3Muy0GBInbZO0aN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SThXviUy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767588164;
	bh=KM0IYgL+E+rOotctSZrIyDzov9FtwrXaHMIOytlyfwo=;
	h=Date:From:To:Cc:Subject:From;
	b=SThXviUy1WMW6dHa7UqioOgKAqA4Co4/PZAra/oBJ7wTzFZrbYzgfTr0KqMtmuxOE
	 IoOgLXc9QjxuiktvZjSzQNXdot6xHUtToykROln7dNVO/KyV5B4EMqYQG91xvt8Zjh
	 2dw+okgK7rH0A6aDQHCmZerFHckmJBMR7lA2/peH4ZPz21sM7+ZqBTz877Vr4o/rKZ
	 Wmdya3WE+xd/Odn93PIuwLcP0yvs2vAZk/4RlPZlGxKznvs7UTAmkrn9CjCUx3/X3e
	 tjZfWZaDerGXwtuD7xwefVH6BL1O5Kt0doF7Qev/qQRvZSuML+LpABlF85MmlQfO3f
	 8Ff0CH3HakN1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dl1r35CpGz4w26;
	Mon, 05 Jan 2026 15:42:43 +1100 (AEDT)
Date: Mon, 5 Jan 2026 15:42:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Ath10k List <ath10k@lists.infradead.org>, Jeff Johnson
 <jeff.johnson@oss.qualcomm.com>, Kiran Venkatappa
 <quic_kiranv@quicinc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>
Subject: linux-next: manual merge of the mhi tree with the ath-next tree
Message-ID: <20260105154243.7cd5d049@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dwyl=qoOBjFf8weXgWQttsc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dwyl=qoOBjFf8weXgWQttsc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mhi tree got a conflict in:

  drivers/net/wireless/ath/ath12k/mhi.c

between commits:

  7f54938fc525 ("wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated =
file")
  a72027045263 ("wifi: ath12k: Modularize driver into common and Wi-Fi 7 sp=
ecific components")
  bce3b73d1ca7 ("wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* fo=
r clarity")

from the ath-next tree and commit:

  51731792a25c ("net: qrtr: Drop the MHI auto_queue feature for IPCR DL cha=
nnels")

from the mhi tree.

I fixed it up (I used the former version of this file and then
applied the following merge resolution patch) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

=46rom 667166ff448d06ed3ef9671bf6c8fe7337b71b0a Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 5 Jan 2026 15:39:19 +1100
Subject: [PATCH] fix up for "net: qrtr: Drop the MHI auto_queue feature for
 IPCR DL channels"

interacting with commits

  7f54938fc525 ("wifi: ath12k: Move Wi-Fi 7 MHI configuration to dedicated =
file"
)
  a72027045263 ("wifi: ath12k: Modularize driver into common and Wi-Fi 7 sp=
ecifi
c components")
  bce3b73d1ca7 ("wifi: ath12k: Rename ath12k_* symbols to ath12k_wifi7_* fo=
r clarity")

from the ath-next tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/net/wireless/ath/ath12k/wifi7/mhi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c b/drivers/net/wire=
less/ath/ath12k/wifi7/mhi.c
index b8d972659314..988affafcfd1 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/mhi.c
@@ -20,7 +20,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_c=
hannels_qcn9274[] =3D {
 		.lpm_notify =3D false,
 		.offload_channel =3D false,
 		.doorbell_mode_switch =3D false,
-		.auto_queue =3D false,
 	},
 	{
 		.num =3D 21,
@@ -34,7 +33,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_c=
hannels_qcn9274[] =3D {
 		.lpm_notify =3D false,
 		.offload_channel =3D false,
 		.doorbell_mode_switch =3D false,
-		.auto_queue =3D true,
 	},
 };
=20
@@ -85,7 +83,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_c=
hannels_wcn7850[] =3D {
 		.lpm_notify =3D false,
 		.offload_channel =3D false,
 		.doorbell_mode_switch =3D false,
-		.auto_queue =3D false,
 	},
 	{
 		.num =3D 21,
@@ -99,7 +96,6 @@ static const struct mhi_channel_config ath12k_wifi7_mhi_c=
hannels_wcn7850[] =3D {
 		.lpm_notify =3D false,
 		.offload_channel =3D false,
 		.doorbell_mode_switch =3D false,
-		.auto_queue =3D true,
 	},
 };
=20
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/dwyl=qoOBjFf8weXgWQttsc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbQUMACgkQAVBC80lX
0GxBUggAmkD+perai2g191EGYlpdqfBI+KTIVetnYPkdDxV/L+PS9ahK1RGvM63N
eSG7s3ciyg3XJifzAaQTxH9MtvEVE/HdyKF9Xn0iG8QNAvTFVmdJxRY6FwS02Y3P
i4II+iBDNi/3IQfxPFQcH/13Zp8YnnBMqXa2cgZtNXt6PaWd8LKRDMSMhsEn0rM0
0wjm8TRNoiInCNJu3p06Zn8dxP2yAubnPrAhMlLR6EGoi6LjyC4wN+dV/pg1V3UM
RcqaX88f76VIxwra5Xv71gp4dixhLgdC0C5Gem3hp5xcMN6YqQzNeprZfuzbqmzW
s4VgYVbGZ9YZMaA+gA82IZ3j2Z3e4w==
=blP5
-----END PGP SIGNATURE-----

--Sig_/dwyl=qoOBjFf8weXgWQttsc--

