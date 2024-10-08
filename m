Return-Path: <linux-next+bounces-4136-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 882BE993F23
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 09:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F82A1F22DC1
	for <lists+linux-next@lfdr.de>; Tue,  8 Oct 2024 07:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A968F1DE2DA;
	Tue,  8 Oct 2024 06:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Utx4v5Da"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69C81DE2D9;
	Tue,  8 Oct 2024 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728368787; cv=none; b=YW8T0OdIZXLQLX6LhWK1m56rma/W7nVA9hA4fovI+S31Ev7ruovKpljbOaLmRrT+W3nPfljNSi6qyeuNEtsvG7sV1KtTVXGWfQvtZNjd4g6RiA0Q9orva0W6Eekmp89OfR3zQ3pcOoqmz2hg8HoOCetX5MKHGN9vagYkyw4+u30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728368787; c=relaxed/simple;
	bh=FBn5hUcmPojNqX2JjsbG0PtHs/T0zBBfdvmWQORKrc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MQlT+NdRjgxsh7lXeqkLbcIb3dbvensq37oX6dH/4ysaKrHwsSc6cLo1uTVP7IWZgjCgxRn7qic5kDk0lZXqxvPymb2LFr2dJsomdvIeGS3O2to9NCPMbmGExqt2Gz/oZdr576/Gafn85fMU5fBq6zBqR38nnoXFckv5U3qql/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Utx4v5Da; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728368781;
	bh=sG/byCiHjgnFQwYunXfvNYFt3ZlgN1Siml+c6vJoNRU=;
	h=Date:From:To:Cc:Subject:From;
	b=Utx4v5DaYXtAAL1+0dvP/b6oSqCVtOuQlM1pKZiY+jPMg6GPez/UEXNlABlGAmCq2
	 slCkI8R1FHVIJ/ogkkCgGqjJkG4+WxJQRIvTieYYewZ42E7x9CXeQSn+Y366jcrMRy
	 7Awy150+UeBwwdBeGSx3O8FXqf5UIXC4whwGKYc/i6rQQR9WZRb2Ndq1HwT3uvYmX5
	 tM5540nA9Dls06U8bpurt6paaTsIH6VaqRVQN32juZE4fbqaZxBSo8yCuEtItNQy3F
	 vKo7HRajHWS+6G4zGxmz65zYIgLOzy7Q2RPh4cIgWSXbIczs4ECJX8lGFXqx37/d7O
	 zXCS4zP6RQ/jA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XN5d83hBwz4wb0;
	Tue,  8 Oct 2024 17:26:20 +1100 (AEDT)
Date: Tue, 8 Oct 2024 17:26:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20241008172620.6fbd5569@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/kKyl1Fx/nkDa0.LzYNSkGpE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/kKyl1Fx/nkDa0.LzYNSkGpE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/panthor.rst:10: WARNING: duplicate label panfrost-usage-s=
tats, other instance in Documentation/gpu/panfrost.rst

Introduced by commit

  6a797bdfde77 ("drm/panthor: add sysfs knob for enabling job profiling")

--=20
Cheers,
Stephen Rothwell

--Sig_/kKyl1Fx/nkDa0.LzYNSkGpE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcE0IwACgkQAVBC80lX
0Gz8uwf8Dm7UEpyJb2LcJkH2HvBkj5OvJQ8dxAzCeWkmBFvtQ0nPE3TMlzBlHuW4
bmIcWmWbgKMDxeK0SVvqUvhz6I43Tyo1if6RoDt+pYcf/xKMFgBCuTqlYwzPSlSB
M739DDj27lYfQRu7s3kZbfDON6OyFeHn1goqYC2UBN74dehLPvE0Zv71p/C61pxU
pT50xsVi9DCosUDCX1RGB2Y79EUhsQc/ZrLk4vvho7MI0ThW4lpg39ApN3nSm8Kc
M4x/FDoI9biPF42TP5j9vYupvtQbORPEUuXSJS6Cn098bDQGttEODGHycz7t4VVY
mkpGTudO5k3e5OlcG8j1XYMjvCqDrg==
=kq3B
-----END PGP SIGNATURE-----

--Sig_/kKyl1Fx/nkDa0.LzYNSkGpE--

