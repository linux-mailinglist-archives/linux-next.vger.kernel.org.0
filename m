Return-Path: <linux-next+bounces-5207-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFAEA11658
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 02:07:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50EF3188AC4B
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2025 01:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CC61DA23;
	Wed, 15 Jan 2025 01:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="cYhef7bS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B02E630;
	Wed, 15 Jan 2025 01:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736903260; cv=none; b=BSGhCBOlQu2mlnXg1Xebxg2mgJz2F7QljCtAJXNH2Zo8ppIuQVgvvNs3xXdTn9z9GXm4krUGdPv1TEROco+wbHFHFuNUPnv9gTYRlhB1hNqWMJMETV/xNaLwsy4TN0wfIs4TFUyhXTT0fjgFwQ0fyicP7mdd/46znnKybYBnJAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736903260; c=relaxed/simple;
	bh=2azUmSr5jkDQ3p8WGY0lOXjho4Aoedb/z9Bm8yyml8U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Skd8TtzsAE15PIAhFF/0HBtwVgZtAMSYao12rYZubo6+OHYuZ85TWmDcAhXkGtLtnu7Ch0NC1rbnDGZaCgIcuD/dwzsjJDOKeMzGLsFIDQNwHti+FBbG7fNk3PItj4eQQpAqvgNVlDT98JYNoqPsI23lN+GHsKWQV9IofR4pFgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=cYhef7bS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736903246;
	bh=lkTDgAyjrLzua64WIH4jxHEO6C9OQ7nTKpfcH6w8t8s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cYhef7bSDePvpfXXs2HNAUPJvTskbCHteofpOORoKDLVk4X065SlOr/AS/6leQi9N
	 EI2AOJeDMDYCZEdvqGpkETUL+BffzrVRe4UHgYm//WlnfRSg6+WJ/kruF8DgEKEp0d
	 GhgI3BYAOMKvaxK9oWtLP4nh2js79Hr+bgHUGy3UEZkYDlbk6P2KdYBynfu/US+d+4
	 ohERc4uAMwfbbtBBP3bIi1mv2nl7y19M14oUPZSBLB48CU6ebQ08oSEysiZGqkiedt
	 EkgLxRie5xEjVnSSgVwTsPULbJGextZkCO5WIWVdeyQb9LDSz9k+Efyx5DaPh/y70/
	 4ABi2T/iA+WoQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXnsT3m1lz4wj1;
	Wed, 15 Jan 2025 12:07:25 +1100 (AEDT)
Date: Wed, 15 Jan 2025 12:07:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Bernard Metzler <bmt@zurich.ibm.com>, Junxian Huang
 <huangjunxian6@hisilicon.com>, Leon Romanovsky <leon@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yuyu Li <liyuyu6@huawei.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250115120732.4a210e37@canb.auug.org.au>
In-Reply-To: <20250115004130.GJ5556@nvidia.com>
References: <20250106111307.7d0f55ba@canb.auug.org.au>
	<20250114204828.GI5556@nvidia.com>
	<20250115082721.732ba8d2@canb.auug.org.au>
	<20250115004130.GJ5556@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_//.7cl.ik+B6KaAV46w1rFrt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_//.7cl.ik+B6KaAV46w1rFrt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Tue, 14 Jan 2025 20:41:30 -0400 Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Wed, Jan 15, 2025 at 08:27:21AM +1100, Stephen Rothwell wrote:
> > Hi Jason,
> >=20
> > On Tue, 14 Jan 2025 16:48:28 -0400 Jason Gunthorpe <jgg@nvidia.com> wro=
te: =20
> > >
> > > I think we need to retain the ib_get_curr_port_state() call: =20
> >=20
> > Why?  =20
>=20
> That is how the new system is supposed to work.. Drivers are supposed
> to call ib_get_curr_port_state() not open code it. This matches what
> is in the for-next tree:
>=20
>         attr->state =3D ib_get_curr_port_state(sdev->netdev);
>         attr->phys_state =3D attr->state =3D=3D IB_PORT_ACTIVE ?
>                 IB_PORT_PHYS_STATE_LINK_UP : IB_PORT_PHYS_STATE_DISABLED;
>=20
> > It is no longer used to determine the attr->phys-state value and
> > then attr->state is set again just below.   =20
>=20
> Ah, missed that, it should be deleted also, and the phys_state should
> use the other hunk too:
>=20
> --- drivers/infiniband/sw/siw/siw_verbs.c       2025-01-14 16:37:02.02373=
8738 -0400
> +++ /home/jgg/oss/testing-k.o/drivers/infiniband/sw/siw/siw_verbs.c     2=
025-01-14 20:38:42.611302948 -0400
> @@ -189,10 +189,9 @@
>         attr->max_msg_sz =3D -1;
>         attr->max_mtu =3D ib_mtu_int_to_enum(ndev->max_mtu);
>         attr->active_mtu =3D ib_mtu_int_to_enum(READ_ONCE(ndev->mtu));
> -       attr->phys_state =3D (netif_running(ndev) && netif_carrier_ok(nde=
v)) ?
> +       attr->state =3D ib_get_curr_port_state(ndev);
> +       attr->phys_state =3D attr->state =3D=3D IB_PORT_ACTIVE ?
>                 IB_PORT_PHYS_STATE_LINK_UP : IB_PORT_PHYS_STATE_DISABLED;
> -       attr->state =3D attr->phys_state =3D=3D IB_PORT_PHYS_STATE_LINK_U=
P ?
> -               IB_PORT_ACTIVE : IB_PORT_DOWN;
>         attr->port_cap_flags =3D IB_PORT_CM_SUP | IB_PORT_DEVICE_MGMT_SUP;
>         /*
>          * All zero

Thanks, I have updated my resolution to that today.

--=20
Cheers,
Stephen Rothwell

--Sig_//.7cl.ik+B6KaAV46w1rFrt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeHClQACgkQAVBC80lX
0GyG9Qf/Y9BDKtsxPC4BohdpaiRUAEgBINNrQ6ZU3SrvBauqNnGkaC2tdiI7+sbS
zYQ3wVEMBILC3X7XeIToE/A1h1PpxpCTvaAMYT8Gyhz2mf+xMjJbfZ67EnCmT6+S
BDyrVmqrVGRF25LQBN//6/4KS+vXqPVnD+4Wq5/5wXpuSYkao0xMPWGNW4dWH46q
W5BRF6IG5WGj6HBQxqO9yDddQb3eG5SrQmfO16ZVlytp/nAxqUu1i/cFMNZwYrEF
snH68DQQa28FkWcQ3ASd079o8IidhVeW5Zj6eeoqZrbMMFRdORYUKkWSfTxXdi2G
S9lxuKYIBRqQ4Mv8BdY0qg9Fgfpcjg==
=QoiQ
-----END PGP SIGNATURE-----

--Sig_//.7cl.ik+B6KaAV46w1rFrt--

