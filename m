Return-Path: <linux-next+bounces-7806-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0A5B17C2B
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 06:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C516F3B50F2
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 04:44:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0276B1F03C5;
	Fri,  1 Aug 2025 04:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="d8g3JG9S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3F11F03F3;
	Fri,  1 Aug 2025 04:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754023438; cv=none; b=LDm9vZcY6LlF7VDf31zdUIA4yL9u9EDtgUnA7FTYyY/aVKvb4f/k2BE2upo/fmIvXXYKO1Bym/arqC8OjE/WumzwbqpqFECTbo79RerZK9gBn8uyM7zMzCme3kcwqMSP9u+Ifimz0sLj9ZZ5lw6LhIssfR75XaRutq/GnLeZ5No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754023438; c=relaxed/simple;
	bh=1pq7mT3aXdMJ5HKjQ22VQObOhcZ1gXBwXiNEK8gPcRw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T2x/3RSGNdsppF25rV/msOLgrdkUHg9e/Ka8tMesu6TLE6CARV4TcpPzY/RTCuJkcZSvW4+6wZPNXM7W3xMkXzng7KcB4uOJKtBXATtsVCa7nFWE1THoSrTdw8QxKoZ4MtPaAzQox+NDkhMa7kCRT10ZEeAQmbglhWAXDjSfRR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=d8g3JG9S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754023205;
	bh=E1s+P0XagDZNpW3tmeEcdaQR8X7L6waJy5qRcoaQkzc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d8g3JG9SKJ5d8rTJ3TcUFsb3J2CLyNadA1hahWlAnvlvf08ZUZJofH/5AtD27lfgv
	 ryvXDe+Iq+fkLoZltpaFspCQ6e2IC3gEFju8D0/PmZhSHPCX1XfRaFe6FElW/2+KBl
	 WWuJwoTgLaVgD18w7WI0MnRkbxij5fT6x5QbZECkwCWQ434qGkohdk+Bn5xtdKsMwd
	 nQ33Db4ENQtpIzmjlBoxLug4I7vOZ/vFFAeIEHfqsFrx+fhck0I6Yvm9eujIN0sAjm
	 MaDHmXlwkS8kcEXNT47xdOQyaV9DrNsChQXL8p4ClHRe8iLc8gIUj6axJS5a51kzpQ
	 ILn4yRA1555zA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4btYCS6sVsz4x6n;
	Fri,  1 Aug 2025 14:40:04 +1000 (AEST)
Date: Fri, 1 Aug 2025 14:43:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20250801144354.0ac00f39@canb.auug.org.au>
In-Reply-To: <20250716203115.6e02e50c@canb.auug.org.au>
References: <20250716203115.6e02e50c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ArZk5=GT1Ros.GOqjtnvG0p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ArZk5=GT1Ros.GOqjtnvG0p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 16 Jul 2025 20:31:15 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/drm_bridge.c:1242: warning: Function parameter or struct =
member 'connector' not described in 'drm_bridge_detect'
>=20
> Introduced by commit
>=20
>   5d156a9c3d5e ("drm/bridge: Pass down connector to drm bridge detect hoo=
k")

I am still seeing that warning.  That commit is now in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ArZk5=GT1Ros.GOqjtnvG0p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiMRgoACgkQAVBC80lX
0Gw2ogf9FaHkFEghSGGBEBG3JDl1dHYs+Cnc9wIuUOFdV/PQi1YCh4QA5vIOGqRN
w18kWcXwsIyDPIHldj7qV+RoIE4MQmACRYXxjBC9AKNjz25vP98WDAe0JFXPoHKY
E+OOr+4OsKukcOAeYk5e2PQXVrAuN7fF9kbLtJveunWV+daHk5Ht161OyrQFRvL+
ZtGO4NQd+ormTpUMbUY3/Nf6Du5kedtcdsL9zNmJbibVR9XzJhM/BIx7FbifCHRJ
dNfwp17lvvIl9YO7WszqiwrOOuoKR+3iNJMTHL1PN0MZwTUFK1it71hBEljhKO/l
2uZcgrA20P+QfSWP2NoOUMggCuOYOw==
=OflU
-----END PGP SIGNATURE-----

--Sig_/ArZk5=GT1Ros.GOqjtnvG0p--

