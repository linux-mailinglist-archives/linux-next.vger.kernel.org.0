Return-Path: <linux-next+bounces-5665-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 560DBA54006
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 02:38:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D55E63A8E83
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 01:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A9118DB0A;
	Thu,  6 Mar 2025 01:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RS3pkv+g"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CC9186287;
	Thu,  6 Mar 2025 01:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741225062; cv=none; b=K4XDa1klx9TLtZO70u3kWxGh6Ibq0d7qpbTwZgL6K8caW36tnDaObXCGcEIJCtyyOKatywYBEuTxky3LtC+U1oo6YnUKelQJbMHwIAlSEiPk7ZQ2XmeRI8p+Zy+Ffk4NUi0DKrSMJjr1IDTEn0QSkD01Am+GqNypTCacp9EvaHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741225062; c=relaxed/simple;
	bh=mdG4Zlkz4w0VtnDSqcKqiw5+RE+SrqmsUHPyLOIjr50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AVJIw2H+R9GETFNApGLgd5AAWv7K7d8ZZwmtLgjvb+mXpFtaXTRszVQTl3MEl5H9t0MVmTbzA6kfuPninau41RszF2eBKhY0OkqTTaEOSugViLVvaHYlwhi0fMs4p7xTOf1tkuGa/SdslW9jxIIJMmJlW8LvwOuyWP4GL5+G/lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RS3pkv+g; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741225055;
	bh=b14hT0CwZl6pyqMSRzy1INpkYsSKZHFIpy7HFqEwe3w=;
	h=Date:From:To:Cc:Subject:From;
	b=RS3pkv+ggwT1BUOa1V6NqzKm1fmhcYw619PVecfrtZ0nE1MoWlCCH58h7baQQv980
	 V0rDpdWs+mNKpolNu9j27pJUIwdx/5obE1mRJvMwQPoJj2GVRddlCEXPtr6FlpEnUI
	 3TiL7BGMFKQdu6x7ECOyFNbGjyvPfx9mx5CYDcGRxolbZlJMAaKzTsRgyZNPsTx49Q
	 fQwr3Q/6HUql1Vv5dumx58SNe8RY94yz9fdLXYKPVtBllXczG47mOc1cQ1II8OhyE+
	 ny3q5znu9qSdERqHAM7KX4+9BuDMZ0reOGpWg2FgPPkHRg1azOgIhkJI/S6Usz4zZE
	 5gPfgVcAIPP+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z7X9B5999z4wcr;
	Thu,  6 Mar 2025 12:37:34 +1100 (AEDT)
Date: Thu, 6 Mar 2025 12:37:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: linux-next: manual merge of the rdma tree with the rdma-fixes tree
Message-ID: <20250306123733.5212bf69@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tf4SpDS.Zr5nCA0GDSwSjZq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tf4SpDS.Zr5nCA0GDSwSjZq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/sw/rxe/rxe.c

between commit:

  8ce2eb9dfac8 ("RDMA/rxe: Fix the failure of ibv_query_device() and ibv_qu=
ery_device_ex() tests")

from the rdma-fixes tree and commit:

  d34d0bdb500e ("RDMA/rxe: Replace netdev dev addr with raw_gid")

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

diff --cc drivers/infiniband/sw/rxe/rxe.c
index e27478fe9456,4e56a371deb5..000000000000
--- a/drivers/infiniband/sw/rxe/rxe.c
+++ b/drivers/infiniband/sw/rxe/rxe.c
@@@ -72,10 -71,45 +69,39 @@@ static void rxe_init_device_param(struc
  	rxe->attr.max_pkeys			=3D RXE_MAX_PKEYS;
  	rxe->attr.local_ca_ack_delay		=3D RXE_LOCAL_CA_ACK_DELAY;
 =20
 -	ndev =3D rxe_ib_device_get_netdev(&rxe->ib_dev);
 -	if (!ndev)
 -		return;
 -
+ 	if (ndev->addr_len) {
+ 		memcpy(rxe->raw_gid, ndev->dev_addr,
+ 			min_t(unsigned int, ndev->addr_len, ETH_ALEN));
+ 	} else {
+ 		/*
+ 		 * This device does not have a HW address, but
+ 		 * connection mangagement requires a unique gid.
+ 		 */
+ 		eth_random_addr(rxe->raw_gid);
+ 	}
+=20
  	addrconf_addr_eui48((unsigned char *)&rxe->attr.sys_image_guid,
- 			ndev->dev_addr);
+ 			rxe->raw_gid);
 =20
 -	dev_put(ndev);
 -
  	rxe->max_ucontext			=3D RXE_MAX_UCONTEXT;
+=20
+ 	if (IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING)) {
+ 		rxe->attr.kernel_cap_flags |=3D IBK_ON_DEMAND_PAGING;
+=20
+ 		/* IB_ODP_SUPPORT_IMPLICIT is not supported right now. */
+ 		rxe->attr.odp_caps.general_caps |=3D IB_ODP_SUPPORT;
+=20
+ 		rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |=3D IB_ODP_SUPPORT_S=
END;
+ 		rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |=3D IB_ODP_SUPPORT_R=
ECV;
+ 		rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |=3D IB_ODP_SUPPORT_S=
RQ_RECV;
+=20
+ 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPORT_S=
END;
+ 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPORT_R=
ECV;
+ 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPORT_W=
RITE;
+ 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPORT_R=
EAD;
+ 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPORT_A=
TOMIC;
+ 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPORT_S=
RQ_RECV;
+ 	}
  }
 =20
  /* initialize port attributes */
@@@ -107,13 -141,18 +133,13 @@@ static void rxe_init_port_param(struct=20
  /* initialize port state, note IB convention that HCA ports are always
   * numbered from 1
   */
 -static void rxe_init_ports(struct rxe_dev *rxe)
 +static void rxe_init_ports(struct rxe_dev *rxe, struct net_device *ndev)
  {
  	struct rxe_port *port =3D &rxe->port;
 -	struct net_device *ndev;
 =20
  	rxe_init_port_param(port);
 -	ndev =3D rxe_ib_device_get_netdev(&rxe->ib_dev);
 -	if (!ndev)
 -		return;
  	addrconf_addr_eui48((unsigned char *)&port->port_guid,
- 			    ndev->dev_addr);
+ 			    rxe->raw_gid);
 -	dev_put(ndev);
  	spin_lock_init(&port->port_lock);
  }
 =20

--Sig_/tf4SpDS.Zr5nCA0GDSwSjZq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfI/F0ACgkQAVBC80lX
0Gy9Rgf+NUrR94Ozr+KpEmArfvqz46pEJ+MBD/PuvII5kKZJ++08HbAexxHvPP0/
Wr+Qkeiddf8JNjrdQn6WI8x7gw5VM13P+B36YLux29c5Y+5eWxMvoiZ7GrvGWOZf
dTUGHaaPU6qwSLA7hV0NQQ8ztAKba2jBmETAGHBIU0pwYLYo7i3knHq5O7ia7Gy1
vQ9Qg63nWtXHT7YUzs/r+a/+VBNIJgFnlRKqE21neTgb7v9bzmG0UuMepAbmF3pH
RyYIMXhnpd/hEJcrLojw3ujOLIrivJVUdZsk1xeWBnC4w3fc/z4TEXbGg1LXug0J
IVqH3hm5q2mTqK3OQhG/8XYCOZg+8Q==
=Wn97
-----END PGP SIGNATURE-----

--Sig_/tf4SpDS.Zr5nCA0GDSwSjZq--

