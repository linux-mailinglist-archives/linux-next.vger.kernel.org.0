Return-Path: <linux-next+bounces-5051-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CFA01F5B
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 07:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 078CE1882763
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 06:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A6B1D5ACD;
	Mon,  6 Jan 2025 06:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pdYtUJs7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE463194A64;
	Mon,  6 Jan 2025 06:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736146011; cv=none; b=EPjCWbHcBZhEaEQEXmgsGe+gMQ5hd9mKuSggFf9haMmoGApd+f+OoFDEqmh0pt3E25D/crLxvLLaYqKQF0dpPrNsILLMw1sM5vz7YGGDG1qfBTO0EMM43lGQnfuVPvv+gannWNJBnSPaxNvGhKCXYo2YckGxG0+dvzM4g8boaRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736146011; c=relaxed/simple;
	bh=ztaaOtRF/DzCq+SyAfzwhgsYJUTYKSBVWME0lFySH6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ToZjZjlvka5iHshhOTYQPQbRLzMZqh4wmj9eiiP5935GxvJtmdJZytOg/ninx6Hh3pjsi23NckwqXr77H+FcjDP/A3oZzoXz/ZfDnNOXG1pc0VsJ6kyVXIGcbH5yUER6D7IcqxspK3MZwpLvW2fRICacxBbcwz+D/ZnHvfpQ/H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pdYtUJs7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736146000;
	bh=eE+tC5jg4RI8fC+gH7BkdGjyyfYVRoLtqaworXk3mi0=;
	h=Date:From:To:Cc:Subject:From;
	b=pdYtUJs7dfbpgwgICNJYyZeKHLiJuWkf5asE9bV+tgtCCxfYwxxDBDd/i4CKifsxd
	 KFq8DY/nni3mRCG+tDNq80njSSW2SLUSaSWX9MwtCro1DOUjGj3GVPSO6HtNLMatYM
	 pIg/HJVKrgUI433Gk0Xj0N+WrCcMpBNbMyO6O02AJz03Kz4HlXaTFnamdinSYR0ljy
	 fFCHU6jBEcQ+jwgYz3wN2Zh/p7JKa7Cu0NGm+b5XURG9J/VeddKUFl1YsajQ0GFVMm
	 qEybMYHlRETo7x07zpmGYDGzKogqv9LSbQJ3YC2ZeD3ojRHd/PTkiQak4TkC2trO6C
	 y9dZ0lrSHgUvg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YRPq40ltHz4wvb;
	Mon,  6 Jan 2025 17:46:39 +1100 (AEDT)
Date: Mon, 6 Jan 2025 17:46:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the drm-misc tree
Message-ID: <20250106174645.463927e0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bSDe6BhN8wSbD=71InrCSQ5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bSDe6BhN8wSbD=71InrCSQ5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced these warnings:

include/drm/drm_bridge.h:738: warning: Function parameter or struct member =
'hdmi_audio_prepare' not described in 'drm_bridge_funcs'
include/drm/drm_bridge.h:738: warning: Excess struct member 'prepare' descr=
iption in 'drm_bridge_funcs'

Introduced by commit

  0beba3f9d366 ("drm/bridge: connector: add support for HDMI codec framewor=
k")

--=20
Cheers,
Stephen Rothwell

--Sig_/bSDe6BhN8wSbD=71InrCSQ5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd7fFUACgkQAVBC80lX
0GyYUwf/c1e5GaHKMJ31ODBJQJ7nMt64tgnVuhxd+oEhEw3fMWpqfsPy3F/LeZIO
ap4lxU3Bu6lVG2HeYsEBaP+lJDWjZeEarnR+IwnJPRchfDs2VcYkmp2qzAlQ4QR6
EjKnR2T42GazqCwE/55fB64bor4WG46bcvfvb7VlIKbJxbm6xa5zfjbEYk7KUg8V
yTIZ6fBZecmATy9IU45NJDK31y8Tow4rumMRAwyKzffY+Pv3gB3ncLw9ftCSB+vv
0n1ep5sUwnZpPKgHwKyX7LdFmGBzFvfGgX3K2NKcnzjL5thJngTaSI9R8WaveWWf
xWJOKrPeCAnX9UuChXHYmJexNcsmbA==
=L2xM
-----END PGP SIGNATURE-----

--Sig_/bSDe6BhN8wSbD=71InrCSQ5--

