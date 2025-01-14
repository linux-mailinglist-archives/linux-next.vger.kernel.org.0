Return-Path: <linux-next+bounces-5204-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0BCA11309
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 22:27:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19EFA18897DF
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2025 21:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F19920F996;
	Tue, 14 Jan 2025 21:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Mxzphp+F"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1F120F090;
	Tue, 14 Jan 2025 21:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736890050; cv=none; b=R/VmPsOfcEeCXY0Sx0Ga9uRa7YcKcAXJuX1gsjY3ttbiACUNkTJTnGb8uKuysoJTaaNbKcb8kvVoqxd1NyBNz93rSR9Mzv9Bc9DQQrCS/kVk3rxe4V2XmVcSQv9JNkM5gZF/20aUCDMRqnwnCCjhz9HEzN7zy0dV2peawKVz08c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736890050; c=relaxed/simple;
	bh=e6zl5htypgk4PDMI3FIajJfePXIC28UiNtc6z4HEz9U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ry0GBcttGuww8iAb+WYzFoAYFhwzdEYC+QVIj3FrlHeCi2UVvR5cEjCu7IAErA1cekHNgPYFFB3jQXkq7o3wCvXu1it4pwPX/8cyCzeihduqdHAFOiv3tXLv9znWea7hh9JP6nJtb3BspYAkC6NkWi2oSRwh+OcHWOocBT3Dnfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Mxzphp+F; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736890036;
	bh=jk+e5Vuj5MlkMODjfIJzXU1vdYCkeuEWbkt+ZnY3HE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mxzphp+FgRv8fXR6CT0q18SWn3UMboW6aGpXK9nIYLS1icWb1QeDyVJT+Pj9odKft
	 alkCYmzZYYYJExLIW/WYdGbA0IMheFL3TNml+dX+y4mHSgTdroy/rPgAzQ34lfU8IR
	 wVFErG34FfyRt/oxQ+mW4HZ94xABrBDPZkV8H119lRzqnEb/At1PK+CHbAVmIfZVYJ
	 M5OATH7Nnv93fGdlLPCQivGGthAyUpHqhZYNhU8hXYccVm2ET9JQ+UrpDpfdBSaON+
	 KhT9uA63isNa8DX9EjrhbyTWuub6YwhHnP/Q/utD++3L7/JMFSJYbwc+ApWxCaw96s
	 0V8PVngCq6bww==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YXhzR3m9Nz4wnx;
	Wed, 15 Jan 2025 08:27:15 +1100 (AEDT)
Date: Wed, 15 Jan 2025 08:27:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Doug Ledford <dledford@redhat.com>, Bernard Metzler
 <bmt@zurich.ibm.com>, Junxian Huang <huangjunxian6@hisilicon.com>, Leon
 Romanovsky <leon@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Yuyu Li <liyuyu6@huawei.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree
Message-ID: <20250115082721.732ba8d2@canb.auug.org.au>
In-Reply-To: <20250114204828.GI5556@nvidia.com>
References: <20250106111307.7d0f55ba@canb.auug.org.au>
	<20250114204828.GI5556@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Klc__/+wfX1XVXuQdAMSkVl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Klc__/+wfX1XVXuQdAMSkVl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Tue, 14 Jan 2025 16:48:28 -0400 Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> I think we need to retain the ib_get_curr_port_state() call:

Why?  It is no longer used to determine the attr->phys-state value and
then attr->state is set again just below.  And
ib_get_curr_port_state(ndev) dose not appear to have side effects.

> --- drivers/infiniband/sw/siw/siw_verbs.c       2025-01-14 16:37:02.02373=
8738 -0400
> +++ /home/jgg/oss/testing-k.o/drivers/infiniband/sw/siw/siw_verbs.c     2=
025-01-14 16:42:50.797896811 -0400
> @@ -189,6 +189,7 @@
>         attr->max_msg_sz =3D -1;
>         attr->max_mtu =3D ib_mtu_int_to_enum(ndev->max_mtu);
>         attr->active_mtu =3D ib_mtu_int_to_enum(READ_ONCE(ndev->mtu));
> +       attr->state =3D ib_get_curr_port_state(ndev);
>         attr->phys_state =3D (netif_running(ndev) && netif_carrier_ok(nde=
v)) ?
>                 IB_PORT_PHYS_STATE_LINK_UP : IB_PORT_PHYS_STATE_DISABLED;
>         attr->state =3D attr->phys_state =3D=3D IB_PORT_PHYS_STATE_LINK_U=
P ?

--=20
Cheers,
Stephen Rothwell

--Sig_/Klc__/+wfX1XVXuQdAMSkVl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeG1rkACgkQAVBC80lX
0GyI8gf9HnvbM7PS/6zpqtmsZfW5e8423kiVM5ApYvQ8gNttKiWuv3NfKiQ4Xf36
NLnAFNBaXWk+ib40gxG5ddh++9KlSNxK3vqeYvDk42D7jo2/gCrurwm8zpyNR4cb
ytn5gGGtYU+alDnM6md5thB7H7uAAmvBegF8bQaAY8uZ26k2Hou6IKUvLzfHMjzZ
ZK+PYZTyGCU8oqLIxLmSoGbQBRgdxMha3YQIbE0TCHMSn4KhjDrK1DZl0AMhMbHL
Mt7X4Vx4qB7e5xT8J6pXUE0GccISI0x1NHfDfUrVfcck8vXfeh7Hf3vnirLXFbp0
M/Rn8oCP8DeJ57jzqnmwb6gwmXBLWg==
=3+Jh
-----END PGP SIGNATURE-----

--Sig_/Klc__/+wfX1XVXuQdAMSkVl--

