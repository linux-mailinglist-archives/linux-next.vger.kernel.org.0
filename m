Return-Path: <linux-next+bounces-2989-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A85930C0D
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 00:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9B881C20C92
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 22:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C488013D28F;
	Sun, 14 Jul 2024 22:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VvY/ixG+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF8313CF86;
	Sun, 14 Jul 2024 22:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720997963; cv=none; b=j/1BAtBJ36cJrks44FoS6yVsPOkFSyf2cNyQAJE8CPtJVTiAOFIcASYOoF2NpgRcu3Kb8vvJVv1aKeUvLzIwh32T1RmBxz6svHx7HmNu7r9mjg8AvkVMolB0ri6I7M9iGePAYjyYip/wy5eceuX2rQqMc/2dDZq/Lr2LU3Hqqps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720997963; c=relaxed/simple;
	bh=bUdFrvZsgLofwEDRv2ewbgWxNtjSSB5xhefddWiiac4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n4QOaQIYYjB1DefvmPVjDrST2CdLaKZL+4uswWnVveNsrx78Ry4dar14XVyHIfO7aG62GU0cgXccnJBmpvkr4GsfdWoo9pu0f96tCrPjboHTpVpwZDnmR3QWd+1GwFf1voyASrxzzTHfH/pYCrJawF7BzkJ0NEXhS9U9zOWpfyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VvY/ixG+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720997959;
	bh=cXP3bCEOsBRgK4CgO+y3pcrCAh0xhl9P25icE6xJpjg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VvY/ixG+x0fi0fYGrl2CX246zSxkLiTOUvmZB7HKPMfZowqqTHWXIy3lmPuQJTd4j
	 DdHh4pPI2CnaqmDEQfy04JkyB1ATLw//l+Q9WnzeM577CilGdkxQc6K3GfWeM/Prxg
	 qqYc0ahdcxZChE+J4NV1OC6xXox56Fy6fK/+do4drTInFwQ4Rx+FvAQMNESbAQQuFB
	 yXekQKkG3XgYlbKW0Ikd5em6yOWWr/lYYWPxi17nuWZ47BAqUbVQqT/LHwGMDLLd9S
	 7Zuf8mrkTp7zrPfeQ7DT8jaTQkyhIqXNAB/Dyo89hajHdA2kfR5Icf7RJg5ibUhzvC
	 Cx2Um70OTKaSw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMgkb2vZ4z4wbh;
	Mon, 15 Jul 2024 08:59:19 +1000 (AEST)
Date: Mon, 15 Jul 2024 08:59:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240715085918.68f5ecc9@canb.auug.org.au>
In-Reply-To: <20240422095642.41892152@canb.auug.org.au>
References: <20240130135626.312c7ebd@canb.auug.org.au>
	<20240422095642.41892152@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qjyhDBeNGGB9.2nzMjMJSut";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qjyhDBeNGGB9.2nzMjMJSut
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 22 Apr 2024 09:56:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 30 Jan 2024 13:56:26 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > After merging the amdgpu tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h:1: warning: no=
 structured comments found
> > drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dio.h:1: warning: no=
 structured comments found
> >=20
> > Introduced by commit
> >=20
> >   d79833f34bdc ("Documentation/gpu: Add entry for the DIO component") =
=20
>=20
> I am still seeing these warnings (as of last Friday) but the above
> commit is now in Linus' tree.

I am still seeing these warnings (as of last Friday).
--=20
Cheers,
Stephen Rothwell

--Sig_/qjyhDBeNGGB9.2nzMjMJSut
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUWEYACgkQAVBC80lX
0Gw3XQf8DDHi32HSHzjOPVIzzobML4OYKEKVB04H/HXFLVYhdXvDjtE3uvmWZslI
PlSr57zMPjpTUJOz3/1ZxDFFbHGUppgAfh7pXw+tkz2WSVuhyXmuGaf2JPMU5xgd
SRbo/Y3uuvvG7VuvbH53nWutexKQl2aop2G3MtUvpzMv8nreUNXDPKwr6FxMf8pm
c2syTu92Uh9klYAJ0iUECHiBlEIugwbSXkFHdVTKT98HluRhGs1XxHfky4DV30cn
m2q3DVO/lyj64XLcEDlbzBD9PdvG5u292Uy6SH2asfE2XHZOVmssm7tCBVc82gh4
iFuQVh41mP05/ztHkqVFrFpKwyzB/g==
=2WRY
-----END PGP SIGNATURE-----

--Sig_/qjyhDBeNGGB9.2nzMjMJSut--

