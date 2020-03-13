Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2CF183F6A
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 04:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgCMDRh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 23:17:37 -0400
Received: from ozlabs.org ([203.11.71.1]:52195 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgCMDRg (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 23:17:36 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48drV62x7Xz9sST;
        Fri, 13 Mar 2020 14:17:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584069454;
        bh=ldxHFAXKQE97+v1SRtxLJNZc/rbeWkm1Dkdkyk2tJGw=;
        h=Date:From:To:Cc:Subject:From;
        b=NrCxGDlGZnqSGhfVBIpGSup6ql+N1ixG6op5fbmtLRMO/+iQqm1lkYNg9Hqkgzztm
         ZG/hCZ5AGw7btp7XWNm7hBosg7kI1PQQRf1t47SdnEpMtIgRkj6aEmBS+SNmEFvK4O
         0DBs8Qu4XD8JSmGYWfMmhf42s0qCFKNDVOmWF0oChX2nQpi7su/91XVSA2Jpe430ZN
         njceYnp67GR/HfF/gOAcnOjLE3FNpGpwEt1OUNn4yJO/qdWj9wy7hNcmlxsFCzhZdW
         nRk/W7CfqzdAmILUUQt9vsHc0whYws9ljGHfy2A2SZ/IPdlogpcfH6hHvY4nwwb2dX
         k2Tmv6Qu9VR6Q==
Date:   Fri, 13 Mar 2020 14:17:32 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Pablo Neira Ayuso <pablo@netfilter.org>,
        NetFilter <netfilter-devel@vger.kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Blakey <paulb@mellanox.com>
Subject: linux-next: manual merge of the netfilter-next tree with the
 net-next tree
Message-ID: <20200313141732.14b6e3e1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yf=nCwDlLhONyVinAjC8vTL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yf=nCwDlLhONyVinAjC8vTL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the netfilter-next tree got a conflict in:

  net/netfilter/nf_flow_table_offload.c

between commit:

  978703f42549 ("netfilter: flowtable: Add API for registering to flow tabl=
e events")

from the net-next tree and commit:

  1f412791407b ("netfilter: flowtable: Use nf_flow_offload_tuple for stats =
as well")

from the netfilter-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc net/netfilter/nf_flow_table_offload.c
index 42b73a084a63,482a7284e122..000000000000
--- a/net/netfilter/nf_flow_table_offload.c
+++ b/net/netfilter/nf_flow_table_offload.c
@@@ -596,8 -619,10 +597,11 @@@ static int nf_flow_offload_tuple(struc
 =20
  		i++;
  	}
 +	mutex_unlock(&flowtable->flow_block_lock);
 =20
+ 	if (cmd =3D=3D FLOW_CLS_STATS)
+ 		memcpy(stats, &cls_flow.stats, sizeof(*stats));
+=20
  	return i;
  }
 =20

--Sig_/yf=nCwDlLhONyVinAjC8vTL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5q+0wACgkQAVBC80lX
0Gyuhwf5AcyfzBo6V1kPBWRFg5gxSwxV14m/StoUCnvLa6DY0vipL3gHKIDIuPVZ
wBxB2HyB+qRBeVMbZedriIoYMYc5aSIkaW8OdSs7D+9gCck8VN5S+mlglRLIcYHl
TbmpjGeoPJjQtit5embRdgDUOchLyOfl/i0FJRBkh30/Gzjqy4uHNRJjUnyWMh4R
8KwV4yKmhDK3idrhcFwjjwz9gpmg+iuQB4pN5aX3/jXPs/Fw6MeaDfaFV/AkNSbT
lruA8Bx0WKdZ5XAJMnu1V6fukwHejdaXeq0Ek/Q3WiG/9IxiKfp6ebsKT5zfdUuE
BuJ0RYJ5A0Y21z9hLKhJ89xLAEYqnw==
=mBn8
-----END PGP SIGNATURE-----

--Sig_/yf=nCwDlLhONyVinAjC8vTL--
