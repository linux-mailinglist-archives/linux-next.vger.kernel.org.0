Return-Path: <linux-next+bounces-8877-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B518BC39157
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 05:22:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72DE33B1B48
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 04:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC052C11F3;
	Thu,  6 Nov 2025 04:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R/MMluLQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB272BDC3E;
	Thu,  6 Nov 2025 04:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762402926; cv=none; b=WJm4GRt8dNRMuRLyaAgDyt1e6RizzmCWvKW8Ul//1UAG34AZV2j9uISWXktyn5+utTJGUWs8QfmegyPRO1tpmKiJUFawxGqTj372www6oMNpCAIRI3HTfN1tTUsr4OTdoeTvVt47PdmdkQgsFerkH4XhmBG9HWSaIyOl3iNudZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762402926; c=relaxed/simple;
	bh=LD3TJTY1zArtq+VRrbR0huzsNTOCtmcq9yfYHN1pbQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fCoiOxcmC8B1NhJ2ejbNPYMGA/bH6XSHywYgfhiEkVV7Yb31mZj79CdKKvAo2cVMGDbPbOhoUqnKLvM/JptpxOeXfXgxPdRfk/Y6Gl+qMEx3hUOcYxyjV5WVgExGJ9HgGpmYerigzrUB3dsAezE3CwT+IcQ0wtUqyjRktZfS52o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R/MMluLQ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762402922;
	bh=MRQkcWineOBwMrRNd1qXJWRdZB0PlL23f7QJgSyfj3E=;
	h=Date:From:To:Cc:Subject:From;
	b=R/MMluLQmeFadc/gNya+J3lmyPe8SmiOGFJ6K7I40HvcWO5zjPi6sQn07Z1Jzp/Jl
	 CAs80KiByknpmsjl4Pwxt8x+s7uWLYcUamh0upyBOzhq9awQcYA9sCJwrGPZgBhtHx
	 eREyXZ5NSSkqflEQMmPxzSsadO6HPP0Kz4NTxmcN6bF8SbNGVuLZULq9Z/1QX/xI4R
	 e1C3jfexpYwJcRIxDlI0i0rhJZ3FSSu63ZyRIcdcCU1ADyrZT23sI/HtmdSUjrpgn+
	 NGWxQB8773YRH/pgAjPwVoJ3lh4/g8c3hBlaJ0PtqkoMp1d0WWe9kHRaz7FHzhBnEu
	 jO3eDxPdUptqw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d28Cs6yj3z4xGp;
	Thu, 06 Nov 2025 15:22:01 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:22:01 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm tree
Message-ID: <20251106152201.6f248c09@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BNYysu0WmGJ3V1lS4mK8O3n";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BNYysu0WmGJ3V1lS4mK8O3n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm tree, today's linux-next build (htmldocs) produced
this warning:

WARNING: drivers/gpu/drm/drm_vblank.c:2267 expecting prototype for drm_crtc=
_vblank_start_timer(). Prototype was for drm_crtc_vblank_cancel_timer() ins=
tead

Introduced by commit

  74afeb812850 ("drm/vblank: Add vblank timer")

--=20
Cheers,
Stephen Rothwell

--Sig_/BNYysu0WmGJ3V1lS4mK8O3n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMImkACgkQAVBC80lX
0GzEVgf/UOcduoHTMaZDA5XVaDMAD757BQ4TS29IU2ZT+JjY/s/7Ivq1xVC5aOae
QiPjvq4yrX+W863v4TslZKviFP67inr4/vXL0QvWI6VsoOqcIUSSjdNDRIAhwy3C
nlWrxFl390gjm//UoqTqJWPGcIHIxzEGthlPxgILHDVgrxNuyacbT2MF8BkJJfrL
xm3RtteztJ1oIrChN6RugSKmipDm6SVn8FDTxbo1h1QFeh2uJGkRuRck9/7sth8A
DrH+IyXtSJTp2n0M7ZCoyo3lVksF/7jZOPw5hDk73gLsAYAV87T3sq7CbnpKzb5F
GcOSesIDb1xmhRdoWaDRxDdJ8XuzIg==
=2CKm
-----END PGP SIGNATURE-----

--Sig_/BNYysu0WmGJ3V1lS4mK8O3n--

