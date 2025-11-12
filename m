Return-Path: <linux-next+bounces-8925-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4AC505AC
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 03:43:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2FEFC4E1AC1
	for <lists+linux-next@lfdr.de>; Wed, 12 Nov 2025 02:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BFC2C11C2;
	Wed, 12 Nov 2025 02:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="N/aF+Qqg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6124222069A;
	Wed, 12 Nov 2025 02:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762915375; cv=none; b=LHPB/RYjcrEkXsL0tqOV/2VYZDnyWofnCvsHdigSmArbG8pCMyVcI37SiUd3j8oLbXvAPEDyEroK1WIccy7J7h2e/qZzJj59+zga2mtAEWUkvBdGjgi8FwahR4gJhFaur9qhVqjeVNsAVZCiaQhGf5oCMWgWszPm68dz1KinBCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762915375; c=relaxed/simple;
	bh=mzL/GWUNfzLfejSMI1SwX5cIzVTdAqiUINxU6+gF9KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=d88F4gHKDOhjOWBrP+DFMiBgkDEkf8XtA2tgEWKRmn0M01NXZTRh5jdUCBTc9H93hYmc4TOuiusRLf8/m0P4CjYKnN0AEyw+VS2idPo4PdpRSxI0hEIKmhe0FaX/jqBpbysS0TqzFk5JvAarMaW0s+zCCZrtzYb9AI9efXT5L0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=N/aF+Qqg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762915363;
	bh=DxF7ga4NrgoqNcSdUN/T2CBq2SQuapbBrxdONofE1eg=;
	h=Date:From:To:Cc:Subject:From;
	b=N/aF+QqgEWwYdQFXUP0qOUVjJFQbDU2pKAtNgg3gtx2u2rGkraIl8bAAgwgonLZDs
	 5GnisvMgxTS4yoba0wO7/rWc2PWZWpbMN2+rUX5VgigxpOgx9T0l0MSVACXhs7A9kn
	 Oz6mQihVs8kLX7x1Mc+Y0/yp1ux1m5Rx06JEQM4D49mk2zpDyjo/pbYboJtMfcFW4V
	 rwkKt+QXW+bw1fYaW1hgEfl31bUxNXcdMz+ujh9oQZwQZpoQx50j5MYse74qZsF+GJ
	 4B6bp3ZGskduXUNZQxMy0MxUFkyYDEwkZVAzh78XinmTwfM5Eq1vinB2kqmexYMQq5
	 2bPqU0RE5SMzw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d5nkW5RjTz4wCy;
	Wed, 12 Nov 2025 13:42:43 +1100 (AEDT)
Date: Wed, 12 Nov 2025 13:42:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Mateusz Guzik <mjguzik@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the vfs-brauner tree
Message-ID: <20251112134242.2608a613@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4VXBz5LDcv3G5JvPsFKU53c";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4VXBz5LDcv3G5JvPsFKU53c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (htmldocs)
produced these warnings:

WARNING: fs/namei.c:627 function parameter 'idmap' not described in 'lookup=
_inode_permission_may_exec'
WARNING: fs/namei.c:627 function parameter 'inode' not described in 'lookup=
_inode_permission_may_exec'
WARNING: fs/namei.c:627 function parameter 'mask' not described in 'lookup_=
inode_permission_may_exec'

Introduced by commit

  5ecf656231cc ("fs: speed up path lookup with cheaper handling of MAY_EXEC=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/4VXBz5LDcv3G5JvPsFKU53c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkT9CIACgkQAVBC80lX
0Gz2nAgAk5HM+7+H9Uvr6DsS4eYv2BOFlj88sJAHaFjEHeJv2FdoDnuSWm+YjAMz
nJfAeoIUHeNB6x0wZYG1jhlWDBoAMdFdOQYwXLfel/cTMyTYjfcK0szh5sfIX8p5
eazuttCzbdXHxtF+MWWAf2KgO2N7yTSXpPvBDQ+hAN06IbCjEJcO+0J62KYKHurp
mGjjs4BmWHCh8IXX1lL0pGkn+IuoOgHPUFFQbKPym/7RsnD9llolNUe6gfykg94b
UQGKYbnsWnJIwYUxskVQguTDR6byg1C2EVVbe4Atp46Kr0/Cs8Mc73hHdLQ3dIHR
4wuZjlTax+zHedzW9MfYp6Q/bb+9lw==
=GRKM
-----END PGP SIGNATURE-----

--Sig_/4VXBz5LDcv3G5JvPsFKU53c--

