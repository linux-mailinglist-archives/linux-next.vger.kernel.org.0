Return-Path: <linux-next+bounces-2740-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AEE91D6A4
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 05:40:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BA13281F48
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 03:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59835DF71;
	Mon,  1 Jul 2024 03:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="f9xl785m"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2311362;
	Mon,  1 Jul 2024 03:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719805197; cv=none; b=rvth2EX8EVvJiS0i+o3PrUePcOYQ1ylQVtcLzYphicdFCDYABnLcZB5OI26Ifun+yY1aiJNQ7ZoEhbMHp3r0Y//pAVmJFUeJ/nxK0ISZHMiVP/BjzTIB5mD9GLu2jVCGkRgTpm2MHFu7T4d2HpKGqm/gy/MODQrXRFWqzmkbGlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719805197; c=relaxed/simple;
	bh=NShMIw8PvaShlP2qFjutFKz+4EYBrTmtzS9tVVyzq24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AfWv+kUb/8Rfee/+u8YGUr1zOdRRUyoHJM4k8No5s0Lg526MOOzL93VNcV1kOzQfLGAkFd+vliT1RlyvG2hWF/Vfq2BSYpcXh+rBZ5oxpVE+/YuWcGU8PkKr2hUCKADdIScoSINBJfm5tdQ58ryfUkT8bIJuEW+r6Rk2/1jPJKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=f9xl785m; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719805192;
	bh=aQUOqbKuNclpsESLJDFAPRXZ3r0lMq++LC2toSUgUdY=;
	h=Date:From:To:Cc:Subject:From;
	b=f9xl785m5jp2PV5631D1nl+I21fl1Qptx85Fu+oifUOYhBGRUxpwy4lpwF1EHoE8g
	 Uk2ZLsthyMiLoKtfRJqkHk5G1H7e+eAlbcmE5FR1I0INV8wKD6BXLVm4w54z5WcZfc
	 KOm8YXNi+FgcnsMARvndKpt686t3T245S8X63YkfUPwF86nkdxaBGsgwxESZy8igDF
	 HnMoU0l0dwIk1Wl7PyLDCb5RROVl/kzXIt/DXzP54tnQVZLaV27KNXkg3YMi7L4QMX
	 ej27aAHQnNX2fIFEzf/yEQEyuWtQG2ygRWrGJZicJ5aRc1XkegA+VwuC8mzpX0AB0U
	 ipGvONYdiqBcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WCBcm1yp9z4wc1;
	Mon,  1 Jul 2024 13:39:51 +1000 (AEST)
Date: Mon, 1 Jul 2024 13:39:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>
Cc: Daniel Jurgens <danielj@nvidia.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Yoray Zack
 <yorayz@nvidia.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20240701133951.6926b2e3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mzSouvsUbFvf9.9VDwKjzk0";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mzSouvsUbFvf9.9VDwKjzk0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  include/linux/mlx5/mlx5_ifc.h

between commit:

  048a403648fc ("net/mlx5: IFC updates for changing max EQs")

from the net tree and commit:

  99be56171fa9 ("net/mlx5e: SHAMPO, Re-enable HW-GRO")

from the net-next tree.

I fixed it up (I think, see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/mlx5/mlx5_ifc.h
index 85310053a40d,66b921c81c0f..000000000000
--- a/include/linux/mlx5/mlx5_ifc.h
+++ b/include/linux/mlx5/mlx5_ifc.h
@@@ -2029,11 -2032,11 +2032,15 @@@ struct mlx5_ifc_cmd_hca_cap_2_bits=20
  	u8	   pcc_ifa2[0x1];
  	u8	   reserved_at_3f1[0xf];
 =20
- 	u8	   reserved_at_400[0x40];
+ 	u8	   reserved_at_400[0x1];
+ 	u8	   min_mkey_log_entity_size_fixed_buffer_valid[0x1];
+ 	u8	   reserved_at_402[0x1e];
+=20
 -	u8	   reserved_at_420[0x3e0];
++	u8	   reserved_at_420[0x20];
 +
 +	u8	   reserved_at_440[0x8];
 +	u8	   max_num_eqs_24b[0x18];
 +	u8	   reserved_at_460[0x3a0];
  };
 =20
  enum mlx5_ifc_flow_destination_type {

--Sig_/mzSouvsUbFvf9.9VDwKjzk0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaCJQcACgkQAVBC80lX
0Gxo0Qf/XQqwY/7hZ7LYKjVv+GUsTSB+X7xsqM3hnZAPjkuhl8mF5RxDZS0qBiuZ
n3MQjW4D9OeNYlp7v3nqwZonHvv2pKuGXmD/+91yX7Ft35J3PaCmvmRZ3PTB2Ulw
UJ/+KLEiv8lc3b+tGMhYCUpXRFPqCN9IuVirXKNnnaa9jqMzj2tlmICx2gp2HsH6
PyjQyzvkvHpL0nH4xPvVYMPDy4zUPRQyB1oDfz4NVz4hW0MFwLWrY3n8ce6bIq5t
Q4yeGNOdFfcWJcCHCGMvrImlIpwwMOXMAf4uw/mewaUBPT+mwsLSzYp8iwp125mC
HXcvK/v/8hOk4F8bw050yak0fEIabw==
=b4Hb
-----END PGP SIGNATURE-----

--Sig_/mzSouvsUbFvf9.9VDwKjzk0--

