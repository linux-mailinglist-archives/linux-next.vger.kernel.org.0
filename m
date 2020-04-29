Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3E521BD20D
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 04:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgD2CGa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 22:06:30 -0400
Received: from ozlabs.org ([203.11.71.1]:34399 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726158AbgD2CGa (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 28 Apr 2020 22:06:30 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49BhhN0pBNz9sRf;
        Wed, 29 Apr 2020 12:06:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588125989;
        bh=cEUkvXjQx9FeslMTIdQ9lW/uGQZLBM+zUKoD1BqBe9w=;
        h=Date:From:To:Cc:Subject:From;
        b=hU7qODst0MpO/MKPnMkBxiNzeYcgLxMi+vQ0PQuj9wAH4JrD9xKuBBXbeTC1FyAq9
         J0pEGYNwQx97cPRI0vkQnYlxiSa23Jbe7gm+XJgH2865vbu7RYqbrD2487AHxxnY74
         7mGpeoSy3d9LCjhbbCzalhpyHlZWfN3wh5qtETO0n6gnm9UnkKtLlI+2gwBFtpxqPn
         j7cC6eBtliVh0+py80k629DbgeGMsrJn6tBJkVPLilWWywBuXlyg520s1HL7LdiqGA
         Vab5xe7afNs1Y+wTAjebCU63GWY1j3xeKWv0ZIAOGVjyBqlixdkbWYsJFLyQZ/YNjU
         IZSwbkp3cTIhA==
Date:   Wed, 29 Apr 2020 12:06:25 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Leon Romanovsky <leon@kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huy Nguyen <huyn@mellanox.com>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Raed Salem <raeds@mellanox.com>
Subject: linux-next: manual merge of the mlx5-next tree with the
 kspp-gustavo tree
Message-ID: <20200429120625.2b5bb507@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kc5ob/m+tWo5k5sswsGpyzC";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/kc5ob/m+tWo5k5sswsGpyzC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mlx5-next tree got a conflict in:

  include/linux/mlx5/mlx5_ifc.h

between commit:

  3ba225b506a2 ("treewide: Replace zero-length array with flexible-array me=
mber")

from the kspp-gustavo tree and commit:

  d65dbedfd298 ("net/mlx5: Add support for COPY steering action")

from the mlx5-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/mlx5/mlx5_ifc.h
index 8d30f18dcdee,fb243848132d..000000000000
--- a/include/linux/mlx5/mlx5_ifc.h
+++ b/include/linux/mlx5/mlx5_ifc.h
@@@ -5743,7 -5771,7 +5771,7 @@@ struct mlx5_ifc_alloc_modify_header_con
  	u8         reserved_at_68[0x10];
  	u8         num_of_actions[0x8];
 =20
- 	union mlx5_ifc_set_action_in_add_action_in_auto_bits actions[];
 -	union mlx5_ifc_set_add_copy_action_in_auto_bits actions[0];
++	union mlx5_ifc_set_add_copy_action_in_auto_bits actions[];
  };
 =20
  struct mlx5_ifc_dealloc_modify_header_context_out_bits {
@@@ -9677,9 -9705,32 +9705,32 @@@ struct mlx5_ifc_mcda_reg_bits=20
 =20
  	u8         reserved_at_60[0x20];
 =20
 -	u8         data[0][0x20];
 +	u8         data[][0x20];
  };
 =20
+ enum {
+ 	MLX5_MFRL_REG_RESET_TYPE_FULL_CHIP =3D BIT(0),
+ 	MLX5_MFRL_REG_RESET_TYPE_NET_PORT_ALIVE =3D BIT(1),
+ };
+=20
+ enum {
+ 	MLX5_MFRL_REG_RESET_LEVEL0 =3D BIT(0),
+ 	MLX5_MFRL_REG_RESET_LEVEL3 =3D BIT(3),
+ 	MLX5_MFRL_REG_RESET_LEVEL6 =3D BIT(6),
+ };
+=20
+ struct mlx5_ifc_mfrl_reg_bits {
+ 	u8         reserved_at_0[0x20];
+=20
+ 	u8         reserved_at_20[0x2];
+ 	u8         pci_sync_for_fw_update_start[0x1];
+ 	u8         pci_sync_for_fw_update_resp[0x2];
+ 	u8         rst_type_sel[0x3];
+ 	u8         reserved_at_28[0x8];
+ 	u8         reset_type[0x8];
+ 	u8         reset_level[0x8];
+ };
+=20
  struct mlx5_ifc_mirc_reg_bits {
  	u8         reserved_at_0[0x18];
  	u8         status_code[0x8];

--Sig_/kc5ob/m+tWo5k5sswsGpyzC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6o4SEACgkQAVBC80lX
0GyHgwgAlTPOPf3m6Uj531tpGne/zC05ApHMYU06GchdDwxp0xdE3afMcwrcmYma
chOuKHY3LWn6PTDcWNKi2Zat3+boM5EXJiOvuZn6zJWSSp71NuPtx4toowHWzgaI
4EHGMDdQbMbdUccJo5dN8cSQvNCuzqEkbr8+Q1nbBDrujX23w03iSl8POfjJHhDP
IcICISYt9hF3xfW6swY90BN3uq058Cj+iwRgCTRqly+k5lpY27XUtNb3jMaCALQ5
5o3RJxg2Mz4MoO5AYEdbXrg9KODw+obkR8MHinjKfvk0Y7QXDJJNRC7XYQqC2jxD
edp7Ei8p0ahJgD3lj8bPdHh1oywEbg==
=Zify
-----END PGP SIGNATURE-----

--Sig_/kc5ob/m+tWo5k5sswsGpyzC--
