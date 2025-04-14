Return-Path: <linux-next+bounces-6231-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D62EDA88EC3
	for <lists+linux-next@lfdr.de>; Tue, 15 Apr 2025 00:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE54B17B345
	for <lists+linux-next@lfdr.de>; Mon, 14 Apr 2025 22:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BF01E5B7D;
	Mon, 14 Apr 2025 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="XjLoLPe5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2F71E1E16;
	Mon, 14 Apr 2025 22:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744668297; cv=none; b=Q0aky/f7uivzx+TQjdzAMwLeY9DKB7bGifrM6HweyFUPNuolRSlzkJ3YpDAIP/+8Hv/O+tzxE105ufVqZlNhNUg0VkKxTULTmrlh2jHSSdj5GXijy/IN9qobVkOm4o+RJ1I4xkhNNuv0lmKCkA4aPidQcdBj8CJmpQtECrO+5h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744668297; c=relaxed/simple;
	bh=bdcC76Gd8pW9PB/o1MyoZsG4x6ob3rUj3hpIIrnwP10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Z8Wv5Exhqj0V9JN7Il+qZqEt8hACyWex25fZ/zZKxGW0Vt8qUdu2Z4vci6m4+S/2UW7iJtSxK/kLLJBueAWUevCFPjUkFtKr7dv2f8fKEIVgtw5luF4ClgwnI6EHzyPvUwYVUy2PMYCA2vfhYycoDrTOwRf9lhFCXEQwN3WGjq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=XjLoLPe5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1744668287;
	bh=8AljGsdjeuuG3/P1KW9Ixv6CQNDiSSYIwPiKlr2UGGw=;
	h=Date:From:To:Cc:Subject:From;
	b=XjLoLPe5k/5wI5PuBwAUjGLpLQeWe3CcCsk9/r7U/I88YxdHSQQ3ZNLkES1FtJdnV
	 BLWMkltM18nc4STTH+itS8jmhyHPVtAj1LpA00rQ/4ZkjuvjeW+WXP4j1rZlSWYyn2
	 NKp1X94CgraM9ZhE0PgVmmMDi3+1OJjeOJHjkmvqlUBenJjp8dhKBByhEOxUnxeveA
	 CGoj+Lm5rUhJDYT9Q1XZfR8wBUOyZrJjDtYde6ULfeS7sbnLx4Jxr4DMDNkymmL500
	 EirZmbGEXSP6cnHSUIuwKFxlFfF22GqTV1lj2lZgatCP2sRVvZ3WSzgx4xN5IDp2Oi
	 E6LN9tQFx2atg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zc1YC3DQ4z4wy6;
	Tue, 15 Apr 2025 08:04:47 +1000 (AEST)
Date: Tue, 15 Apr 2025 08:04:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Jun Nie <jun.nie@linaro.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the drm-msm-fixes tree
Message-ID: <20250415080446.50f232a1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wwlXR7wYyHwkmnfna4t=ErI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wwlXR7wYyHwkmnfna4t=ErI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  bcaa391e177c ("drm/msm/dpu: check every pipe per capability")

Fixes tag

  Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")

has these problem(s):

  - No SHA1 recognised

It should be:

Fixes: dbbf57dfd04e6 ("drm/msm/dpu: split dpu_plane_atomic_check()")

--=20
Cheers,
Stephen Rothwell

--Sig_/wwlXR7wYyHwkmnfna4t=ErI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmf9hn4ACgkQAVBC80lX
0Gz4LAf+OzXMe8metAhp3CNEaS2ipF++yBo9boEGeJRo/oYVlb/5H5YiYHuPNOed
+Sb+0LatvgTx2OZ6hOQlc2oMtzE27f8qd3cU7As64sjtTLyTiIPBoG67hmvvms2I
jAb2NrgAYnQubvr0hGsY62wCenJeAJ+mK3rIJBrOmCrG22MMaDmRYC46xLITRgZn
Lv/qgaX+7PAaBZN50OK2QBxoGqrnST0PEb1T6TLAknuMaTAuS9TLKNL5vabSONS2
YWgsqycoFobE9Nwrrx9cCu5xKxTgBrj6/UMrh3jsIoTEYunO7SSKNW0A36oolzFk
4bqu0Os51RDyS+RtNbziqGhhMEbrSQ==
=hY0A
-----END PGP SIGNATURE-----

--Sig_/wwlXR7wYyHwkmnfna4t=ErI--

