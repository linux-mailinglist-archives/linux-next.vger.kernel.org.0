Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE7F315D11
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 03:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235277AbhBJCRR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 21:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234960AbhBJCQ1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 21:16:27 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00385C061756;
        Tue,  9 Feb 2021 18:15:46 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Db3Jb3B5Hz9sBJ;
        Wed, 10 Feb 2021 13:15:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612923345;
        bh=HrYbbPkMd2CSwFO3wUv8R0fp87DNVHaZ1SFMINQnFfY=;
        h=Date:From:To:Cc:Subject:From;
        b=LXC2eHbSDUAoWxFirQGlvSBQ+WaR3LoAOi/NikbL6P4eL1Vob9eW28WKR4OtgtZ37
         Zk8aMGYp3sJGy5KDxhBqoQXrB08T1U/1ytpTSXYUWDpqZjM5N6//X00/I3vFwDaHE7
         6MuGUx6myWcW+QWe7RzUSDpdKYqbbPQ/DXfXTqJN0bljKN2Jl1Cvv/c3fwqaFtFtNX
         FwK5rckPbVTW/aEMmntrey9FT+NzlrsfGaY/cMVzv4ceP5/Y/2ZFJnWtms7zFZtKXM
         b5WN4D3Ry4rac8LcmyCCkn1NNXxv0AbRfKTWr7OE9f9OeknvNRBwVs/77BlKT1YZ9A
         izOApkLvhPLgA==
Date:   Wed, 10 Feb 2021 13:15:42 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
Cc:     Bob Pearson <rpearson@hpe.com>,
        Bob Pearson <rpearsonhpe@gmail.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Wilck <mwilck@suse.com>
Subject: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20210210131542.215ea67c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xWYV/P/qx5xr6A5ADcnhg/+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/xWYV/P/qx5xr6A5ADcnhg/+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/sw/rxe/rxe_net.c

between commit:

  f1b0a8ea9f12 ("Revert "RDMA/rxe: Remove VLAN code leftovers from RXE"")

from Linus' tree and commit:

  899aba891cab ("RDMA/rxe: Fix FIXME in rxe_udp_encap_recv()")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/sw/rxe/rxe_net.c
index 943914c2a50c,36d56163afac..000000000000
--- a/drivers/infiniband/sw/rxe/rxe_net.c
+++ b/drivers/infiniband/sw/rxe/rxe_net.c
@@@ -153,15 -152,14 +153,19 @@@ static struct dst_entry *rxe_find_route
  static int rxe_udp_encap_recv(struct sock *sk, struct sk_buff *skb)
  {
  	struct udphdr *udph;
+ 	struct rxe_dev *rxe;
  	struct net_device *ndev =3D skb->dev;
 +	struct net_device *rdev =3D ndev;
- 	struct rxe_dev *rxe =3D rxe_get_dev_from_net(ndev);
  	struct rxe_pkt_info *pkt =3D SKB_TO_PKT(skb);
 =20
+ 	/* takes a reference on rxe->ib_dev
+ 	 * drop when skb is freed
+ 	 */
+ 	rxe =3D rxe_get_dev_from_net(ndev);
 +	if (!rxe && is_vlan_dev(rdev)) {
 +		rdev =3D vlan_dev_real_dev(ndev);
 +		rxe =3D rxe_get_dev_from_net(rdev);
 +	}
  	if (!rxe)
  		goto drop;
 =20

--Sig_/xWYV/P/qx5xr6A5ADcnhg/+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAjQc4ACgkQAVBC80lX
0GxvnQf9EAkvQXgABaVqlGlyAIt2+/7I0vWTkZINwx1w+krym2rqbhFGVzVNPqp8
7AIcqRcc3s25s2P5Gshq/caSL0tIT4GeI/pehskbzz+rKt6CKbWs0niblpn5TjxN
hN1sG+0sAvlygjqsz8MWRTYBIK/R4K3HOFTQ5kbeDlkv1G7Qr8rMzsbPXydg6YgT
O8weWLePFBI1koYlPW7BpuPfNEPtBuBj4X2prmBEC9OuhiJM30VbXFOIt7CgI+EB
jlBs0z/MsNryTM1uiHAw9H5lyG+fKUf8xSLzTnP97RUitYclN5R9s27gZ5mS92+Q
DsqGNB1A+CDhkTNcuq+f7sLnRaCisA==
=8IWq
-----END PGP SIGNATURE-----

--Sig_/xWYV/P/qx5xr6A5ADcnhg/+--
