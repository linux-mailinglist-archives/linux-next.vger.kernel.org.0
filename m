Return-Path: <linux-next+bounces-5032-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1394EA01CF1
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 02:03:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB00916234E
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 01:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12707182D2;
	Mon,  6 Jan 2025 01:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="X04HEx/Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C94801;
	Mon,  6 Jan 2025 01:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736125381; cv=none; b=Mg0cjMhCIoIpwkqXxx5eEX4BeKNKflq6trCZ3dOjCG0iyEfAK20wzGATuT2pgJBlJPwBTuDuaqmHturrwxuarxpuXU2slaWTpSROQpPWutQ0JRHfSFe8VyM5kjBU0pEuxq0+FLue9SRumRmptrJ6tJsCMcnD6GncJJF/Mv6cjUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736125381; c=relaxed/simple;
	bh=nm0uQgwT7od0vW3iFlIycsKziRFz79TbmN2Xn2rw9zA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mvKU6uwJZQKUesCuIuGPcsO4Ed+2cOnZ4MNdUZNlIVH0IVIeMoFLFPl9bVmeRyORk93WQkkt7WxSix50efBOrJrhDl2mOYHA0lh4ybkTyEbWlicdbx/OrSGUWwMJvN9DzWYupC2Zkk7f0vtqnmckPQLOdsE3Ec18/NAt5PJAvk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=X04HEx/Y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736125367;
	bh=hUAI27qyyGuVce/f1T8wzXEBFJcbe/WNjTvninBQiR8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X04HEx/Yq/562zd11um4wzsfKwSrzqK0vZ0qrue61fcn3N1QaLu00Dv5JQBmiYIEx
	 kVJo44tjnWh6QAjpmptpoubJglApJGlh953TdXdON6583GYW21maU4cPc47S1dUDQA
	 OZ9MkI95k+ti6OLrECM/wVa7bK3gqVRA8AzEeEC5eF0MeeJ97dj9L/7bU75bmroKdh
	 bZxVZnoRfWvxzpMZmojMJnUlDH6NJoO5Vg5QQVwfc3Vv+xRUIDsOQScBlf28XpX12D
	 9/01NcRtAWZRO9Fa6V7jRv/APSEyyKiAbWEEH2ifoG6MEUJeC6mLK5eMOFa8g5WwrG
	 8h8+Q4C02j4pg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRGBG2pMZz4x4t;
	Mon,  6 Jan 2025 12:02:46 +1100 (AEDT)
Date: Mon, 6 Jan 2025 12:02:52 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Junxian Huang <huangjunxian6@hisilicon.com>, Leon Romanovsky
 <leon@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yuyu Li <liyuyu6@huawei.com>, Zhu Yanjun
 <yanjun.zhu@linux.dev>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250106120252.000a2afa@canb.auug.org.au>
In-Reply-To: <20250106105106.3d94b0c3@canb.auug.org.au>
References: <20250106105106.3d94b0c3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lKWs7p0ve4vM_YajYcCDK8D";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/lKWs7p0ve4vM_YajYcCDK8D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Jan 2025 10:51:06 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the rdma tree got a conflict in:
>=20
>   drivers/infiniband/sw/rxe/rxe_net.c
>=20
> between commit:
>=20
>   2ac5415022d1 ("RDMA/rxe: Remove the direct link to net_device")
>=20
> from Linus' tree and commit:
>=20
>   958152336cfa ("RDMA/rxe: Remove deliver net device event")
>=20
> from the rdma tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/infiniband/sw/rxe/rxe_net.c
> index 8cc64ceeb356,d400aaab0e70..000000000000
> --- a/drivers/infiniband/sw/rxe/rxe_net.c
> +++ b/drivers/infiniband/sw/rxe/rxe_net.c
> @@@ -595,13 -577,7 +585,13 @@@ void rxe_port_down(struct rxe_dev *rxe
>  =20
>   void rxe_set_port_state(struct rxe_dev *rxe)
>   {
>  -	if (ib_get_curr_port_state(rxe->ndev) =3D=3D IB_PORT_ACTIVE)
>  +	struct net_device *ndev;
>  +
>  +	ndev =3D rxe_ib_device_get_netdev(&rxe->ib_dev);
>  +	if (!ndev)
>  +		return;
>  +
> - 	if (netif_running(ndev) && netif_carrier_ok(ndev))
> ++	if (ib_get_curr_port_state(ndev) =3D=3D IB_PORT_ACTIVE)
>   		rxe_port_up(rxe);
>   	else
>   		rxe_port_down(rxe);

It also needed the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 Jan 2025 11:36:03 +1100
Subject: [PATCH] fix up for "RDMA/rxe: Remove deliver net device event"

interacting with "RDMA/rxe: Remove the direct link to net_device"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/infiniband/sw/rxe/rxe_verbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.c b/drivers/infiniband/sw/=
rxe/rxe_verbs.c
index 47d57046fad4..6152a0fdfc8c 100644
--- a/drivers/infiniband/sw/rxe/rxe_verbs.c
+++ b/drivers/infiniband/sw/rxe/rxe_verbs.c
@@ -62,7 +62,7 @@ static int rxe_query_port(struct ib_device *ibdev,
 	ret =3D ib_get_eth_speed(ibdev, port_num, &attr->active_speed,
 			       &attr->active_width);
=20
-	attr->state =3D ib_get_curr_port_state(rxe->ndev);
+	attr->state =3D ib_get_curr_port_state(ndev);
 	if (attr->state =3D=3D IB_PORT_ACTIVE)
 		attr->phys_state =3D IB_PORT_PHYS_STATE_LINK_UP;
 	else if (dev_get_flags(ndev) & IFF_UP)
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/lKWs7p0ve4vM_YajYcCDK8D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7K7wACgkQAVBC80lX
0GzECgf+OeR4iyfnu2fy9XPq5CdqU3DaFjQNsAPqvXomXKfx0FuKIYM20EgLjtIR
U247cTVwvnH3u03YLRDlUg4XkzSXg+Hbf+vJ6v+eIvUvVtRxaiHcj3rPyq70/Xtb
HewKeWmYb5xQgMoAjShdOXXgeDXbOSBtb92Fvyjk23tbKJ3krLGdQ+MVFow1sP8a
+tYrKUYU7oQX1FPRsf+3H/UrM+6V6fvO4U8CUAb4CBJMzHlDoTqqqa4VHF/XkfDP
GoO75jX0UqrgOhh7xfWatJDO9yBRkv8LDAQGoD6v5Cd5KmfAO5dQvNW/Pdthvtpd
+vdHSyilZb04viSd1lRh5J3WHK4hWw==
=7SgA
-----END PGP SIGNATURE-----

--Sig_/lKWs7p0ve4vM_YajYcCDK8D--

