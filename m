Return-Path: <linux-next+bounces-3749-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F9974C30
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 10:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35C5AB24A55
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 08:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DDB14F9CC;
	Wed, 11 Sep 2024 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IQQD/vZG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A34D14AD0A;
	Wed, 11 Sep 2024 08:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726042068; cv=none; b=QCL3AvX4ly8lOXiHlnPO8iq16VTDkAYnF5VAzHo6kwNI2GfpKVPm1EJrHPuRQlePkzGy7ou6P8v9EliKVotYFzmUldcwlFF/IBW80olP4DUG6s2P2m4Tzm75aRd9HEI7rKpOOPNdJqcR51t30A7Gie2AauQyyWN7q3Dol+eCveI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726042068; c=relaxed/simple;
	bh=v3LbJBbpeC8+KnXJYSTUptnNvzm8pH5YK3fdLk1+/TM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XpNPTZLh/n1CuCDGYis9m6hPNC3W+8N5g3OXWOUJVhCDw4rT2GR6bZSrgvhct2WUhXRh8VWNlcT6yBZoRxAZbh2E2x9yEEEM/2BTaYIdKt9jllwOVTVV1HRCnsAvYzy+3oJA/5NTxkP3h1uPz28JtjeIAjawpkId5h+NO185Tyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IQQD/vZG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726042063;
	bh=J9I9AywEtirK5ot8lZS/W21rZh4OTYU8/w4W+v+ZHNo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IQQD/vZGwJplY2+gBHMq1gfhZ3pY9+dWMsq/1l7hxyEwNCN02IlhvahPce3b3/+U4
	 2m/lwHJLSZgLcOLJpsYBuYOeFZ+SNRQAN1hg1+uL8ZN/CS5zvr3DRWHREfhpOQdd7C
	 xN4h2WNA+W8q9kAsiga/JdfB19DPFskud497oIzWPIbTxBYRRVpLxf4i+kg1Si6Nh5
	 /jcysHmVyEkcPxyc1ik9GM0hJUUeX+4c4y+du9mx0tN77p4kmlVZKrnOrV4pBxZtM/
	 Sdap3XiUHuz//TymKUOvlyILxtH6nK1R3Rp8p84VldiZ0xmq3KKCvV4+CTkt32cqxa
	 pMRehrU77w07A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3Y8Z4czxz4x21;
	Wed, 11 Sep 2024 18:07:42 +1000 (AEST)
Date: Wed, 11 Sep 2024 18:07:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc-fixes
 tree
Message-ID: <20240911180741.45311006@canb.auug.org.au>
In-Reply-To: <20240904163018.214efaa7@canb.auug.org.au>
References: <20240904163018.214efaa7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HcZ+o.Rshuv9TMmXsqwKYFu";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HcZ+o.Rshuv9TMmXsqwKYFu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 4 Sep 2024 16:30:18 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-misc-fixes tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> Error: Cannot open file drivers/gpu/drm/drm_bridge_connector.c
>=20
> Introduced by commit
>=20
>   9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")

That commit is now in Linus' tree, but I am still getting the warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/HcZ+o.Rshuv9TMmXsqwKYFu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbhT80ACgkQAVBC80lX
0GwODAf/UAM20a1Ws0VJcWEjEeidMaYtGA+dNaXqpjv5I/ImROV0Zy+eFBZrrwYB
UX2uYTBs00+KXmhhbF8JRnvlX+4gcqzH4OVGmKDEsheq/XI5jxpQcjviNB8d2IVY
2twN3PpFIn7ZarAfOCdlcUI7whbTxyZ+AxyqJ76iFh3CKlwgSUuN/gZRlzzEhGXU
Wh7LaTMDpv0qM/TdPP8MlkeoPteaPKknD33HTqdHZNltowB2GLieRvmQnS9Adxlf
4havsHjP7/vHSVqHb3Eeux1h4Su9tj/Z2FD1To9B4bTeLd3r4ObxsveU6fc6cSEr
mkPTndtAOWHsAJmmC4sh3e+Hdn4uiA==
=7hK7
-----END PGP SIGNATURE-----

--Sig_/HcZ+o.Rshuv9TMmXsqwKYFu--

