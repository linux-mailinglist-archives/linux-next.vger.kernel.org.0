Return-Path: <linux-next+bounces-7696-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E41CBB0E6F6
	for <lists+linux-next@lfdr.de>; Wed, 23 Jul 2025 01:10:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B8A43B1446
	for <lists+linux-next@lfdr.de>; Tue, 22 Jul 2025 23:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F081B28B510;
	Tue, 22 Jul 2025 23:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JDRi+kwL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E155E288C92;
	Tue, 22 Jul 2025 23:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753225832; cv=none; b=hvhPqrs8Bd+maQGIXE7e8rHdqyF5k/kuz3IZKETpIzKqA4af9BhgjBNV4+KTAyvCwvp6b56+AKgS4u322ovDInZUpjNSG6tQej2/iIabqJgd+LSxzX0FPsNxEj8MzPsYHGsBKsKmOv0AuL3vtK5M/1nVk75ZJjVcvh2Te1ZsY4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753225832; c=relaxed/simple;
	bh=+48QO+dImSUBza5zbMGJHnIQpplp1a6yY6ZDkemoQC8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SQkQw+7iI6vpiNyu995mNfz1fNvKc7VfurFm2Jhqn0WqhhlWzuoATCg/o/eqmovEv2o6GfDF4lYx8H67o3CzAy9DVsAOq5xPEW8uC31MW2DWcX5fcUDFOT3C3P56qVgqNT5I85bF3OqsUXWMNiy24Ozi3zQJb0UkYIAfL/8DQ8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JDRi+kwL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753225665;
	bh=j0lHxt6gSk2kMa3k1XT2ruTe0BILUT9W2FhbJWVMHtM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JDRi+kwLW3fGjfK6LsO2mQX/dP34CBADo8boTPKqzxUx04k880tqvpgzSme76lNI/
	 +ByoisndU2uKcgi4SuUK4Az3euBXMp2Nwgh+0uWdfSj1pxUgR2dLYsIvjhrMsX3hWr
	 ZFnZup9V+ZXHlDMFqSJ7kHEB+36Z0k0pOCP35Tt3+uuGPgXJxZGHjgLhdPOPVeogfD
	 s6At45nKq+NGiYj5A0J5IKRUUqxE9oIkuEbZikDKGjI+WYZAg3xHuZg6Ue4ffBex5Y
	 9gdU1WDgUAqZIj0Nzqs3koK9MWva8NJghGN6tRMzn74qSWEPb/noiBVkWVN+wkZTc4
	 u40xvaX3wVrZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bmtG91VPnz4w2R;
	Wed, 23 Jul 2025 09:07:45 +1000 (AEST)
Date: Wed, 23 Jul 2025 09:10:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joel Granados <joel.granados@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Feng Tang
 <feng.tang@linux.alibaba.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the sysctl tree with the
 mm-nonmm-unstable tree
Message-ID: <20250723091028.33fa0ba1@canb.auug.org.au>
In-Reply-To: <lzabgfj2r5uf4gnmuibx6vhgdddi7bhqv3wj3ty6arnquu4itw@wsj4knxljyv6>
References: <20250708190003.4eabc8ab@canb.auug.org.au>
	<lzabgfj2r5uf4gnmuibx6vhgdddi7bhqv3wj3ty6arnquu4itw@wsj4knxljyv6>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UaOKuq=/sFCRbXIe+s42+IC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UaOKuq=/sFCRbXIe+s42+IC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Joel,

On Tue, 22 Jul 2025 11:58:48 +0200 Joel Granados <joel.granados@kernel.org>=
 wrote:
>
> I double checked these, and they seem ok from the sysctl side.
>=20
> @Stephen: Do you prefer an actual acknowledgement that everything is
> good? Or would you prefer no answer to these merge conflict advisories?
> I personally, always make sure that things look sane, but always feel
> that sending out the ACK is a bit of a waste.

Yeah, I generally assume everything is OK unless told otherwise, so the
ACK is not necessary.  Though sometimes I express my doubt in my own
solution (I might say something like "I fixed it up (I hope/think ...")
and then it is nice to know either way.
--=20
Cheers,
Stephen Rothwell

--Sig_/UaOKuq=/sFCRbXIe+s42+IC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiAGmQACgkQAVBC80lX
0GwbAQf+IFIvR2a0qewlO9suRPELyP+ye0vNsxpL70tMuv0Qp0AOS4P8rzGO20Cr
+8z+8CDmFahoHygXJPnF/yJZIDXg+LnSOOZRnEZ+5WakcOrgSjz9Vq2NdqWQd+NT
DXv7MvGM4d5n2WYIYN0brFl1c4vRBhB8aVNcnPch06ausMpIkfMDhehsJ4PWg0Op
GOCOoejOVCuyV8vfyVXAiyicCxdSCtMOWGVaHPv4LgQjk6KP+uOQkl5l/gEi5iLS
PqI1BKY8i9a5/TI3H9XDYWoyzlqutGkO+CVkPalrhqrAeARwmwnDw8o9LcYwyHXQ
YKMPuiEQPZlvnKIePFPeydjkHUsrbA==
=YFcD
-----END PGP SIGNATURE-----

--Sig_/UaOKuq=/sFCRbXIe+s42+IC--

