Return-Path: <linux-next+bounces-5675-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A33DAA5577C
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 21:33:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AD061719C1
	for <lists+linux-next@lfdr.de>; Thu,  6 Mar 2025 20:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD361E2847;
	Thu,  6 Mar 2025 20:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GB+fsqCS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9D249E5;
	Thu,  6 Mar 2025 20:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741293194; cv=none; b=FCb0Tf4A7KWxGaWCLavKd3DYbBwTeKqSAL4YspD2r70fk+9qsR9A+rnFIMhq1yE8/C7zCXHxVQY4TPDSKOYcYWbz6ATmEXN4CAITcV7+MGHVY6QA2jQEzY18GaFCQxJzjUYLV+Td7wjmG36NQKW0kX32tln9+sbQ4hAXIoKrPT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741293194; c=relaxed/simple;
	bh=/B/dgHCaf/WXr+8smSFGBmSJjg34I4qZgAsvS3yMQzA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SLDmRu1e651Z9aNSp9aXXo8DhnzEYSsSlyBLWK60RCgD7HjFrcnjPKWJG6CaQFaQSA4dLYtyqVwljRuiiNATT1pC2Q504g0Ok7fjw6OLtXY5vg5/lmsBivc6fkFgWUAGBdIf5kCf/vDY+UFjZZ6IJKaQqKKJwgZq3VpfDOLBVkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GB+fsqCS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741293182;
	bh=wZ1HYhtvdyJIi1dGY0PXWUvMpUPQFuoHpk/qt5WIhys=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GB+fsqCS85X9n6B7t76eCBWvQBZdbJgXktO6hZba/Upm9QVHGoN9PjpOHVrqrIC/H
	 J/QqEQAqROdJ69w4Xd3xUU1OCpT4SDjDuOOM1vv+NoUyOdD68CT9V3xtabJvlLNqAu
	 jqnDyZuRUy93ZYf078/vvz6+WMYgHsL+YCowvLLZt7cC8wUBADEz1H+dgNB3Vs8qWE
	 WZ3tDLBle/iCopB174oteHM28Xm0qKMvcRbz6acKYGBv0FJ/RYRppOd5fzQDdG/Abl
	 4pb4pdZwErf0AtyomeioJnbe00rD7x1/h9RMoPvCDXk2oSMnuf8HhWSP2OFvIgy/GG
	 ld9s+yTP5BW9g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z81ML2vKfz4wcd;
	Fri,  7 Mar 2025 07:33:02 +1100 (AEDT)
Date: Fri, 7 Mar 2025 07:33:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>,
 Leon Romanovsky <leon@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the rdma tree with the rdma-fixes
 tree
Message-ID: <20250307073301.5f3da8be@canb.auug.org.au>
In-Reply-To: <4d66668a-ff8e-48f6-a5e3-98ada08c5037@linux.dev>
References: <20250306123733.5212bf69@canb.auug.org.au>
	<4d66668a-ff8e-48f6-a5e3-98ada08c5037@linux.dev>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8FoYGTOxuG7hwJhcjICqC/o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8FoYGTOxuG7hwJhcjICqC/o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Zhu,

On Thu, 6 Mar 2025 11:19:24 +0100 Zhu Yanjun <yanjun.zhu@linux.dev> wrote:
>
> >    	rxe->max_ucontext			=3D RXE_MAX_UCONTEXT;
> > +
> > + 	if (IS_ENABLED(CONFIG_INFINIBAND_ON_DEMAND_PAGING)) {
> > + 		rxe->attr.kernel_cap_flags |=3D IBK_ON_DEMAND_PAGING;
> > +
> > + 		/* IB_ODP_SUPPORT_IMPLICIT is not supported right now. */
> > + 		rxe->attr.odp_caps.general_caps |=3D IB_ODP_SUPPORT;
> > +
> > + 		rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |=3D IB_ODP_SUPPO=
RT_SEND;
> > + 		rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |=3D IB_ODP_SUPPO=
RT_RECV;
> > + 		rxe->attr.odp_caps.per_transport_caps.ud_odp_caps |=3D IB_ODP_SUPPO=
RT_SRQ_RECV;
> > +
> > + 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPO=
RT_SEND;
> > + 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPO=
RT_RECV;
> > + 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPO=
RT_WRITE;
> > + 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPO=
RT_READ;
> > + 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPO=
RT_ATOMIC;
> > + 		rxe->attr.odp_caps.per_transport_caps.rc_odp_caps |=3D IB_ODP_SUPPO=
RT_SRQ_RECV;
> > + 	}
> >    } =20
>=20
> The above snippet is from on_demand paging commits. I do not why it is in=
volved in this commit.
>=20
> It should appear in on_demand_paging patchset.

That is not part of the conflict, but the change is there on one side
of the merge.

> >    /* initialize port attributes */
> > @@@ -107,13 -141,18 +133,13 @@@ static void rxe_init_port_param(struct
> >    /* initialize port state, note IB convention that HCA ports are alwa=
ys
> >     * numbered from 1
> >     */
> >   -static void rxe_init_ports(struct rxe_dev *rxe)
> >   +static void rxe_init_ports(struct rxe_dev *rxe, struct net_device *n=
dev) =20
>=20
> In this snippet, the variable "struct net_device *ndev" is not used in th=
e function rxe_init_ports, it should be removed.

I have added that to my resolution.

--=20
Cheers,
Stephen Rothwell

--Sig_/8FoYGTOxuG7hwJhcjICqC/o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfKBn0ACgkQAVBC80lX
0GxmnQf+PyByGeLhdFZfc9oiY1Qz3JTJZ723VTNZyf523Mj+6J/GakL9fARnj3jI
1kEORRWAWfkQIxPckZUoDT/XnmGsLhh4WXhBqrBkySelBKQGW1QgKaB7Pv5efShf
4EQmOrRI6tJmFadSKO36mF2ZE3dSjzp8I8fHMXO0GPr4eH/bOREVVLT02S/uZ4oh
Y11s2h0QG4Fu81yyEcks7Xrn3LyS9tn1la2gFmJc1Ouf1oVIgXMw/BYefjNqiHXh
1aCeYaSwADuWrerEUij4BIokrJX2Tlx5vxbg3yu6yea6SFX/VSMZS1ccRRN6oqrO
paPC9F8MHMooxQoVBis2ejgFhBWYkA==
=o+r7
-----END PGP SIGNATURE-----

--Sig_/8FoYGTOxuG7hwJhcjICqC/o--

