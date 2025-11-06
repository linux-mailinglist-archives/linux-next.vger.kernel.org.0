Return-Path: <linux-next+bounces-8878-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61478C3916F
	for <lists+linux-next@lfdr.de>; Thu, 06 Nov 2025 05:24:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F98F3B9A09
	for <lists+linux-next@lfdr.de>; Thu,  6 Nov 2025 04:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C542C11CF;
	Thu,  6 Nov 2025 04:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OZmlPCxL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE155245006;
	Thu,  6 Nov 2025 04:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762403094; cv=none; b=Wo3WgMda38vH3l95vGVcB2gRp5cDka9rfwnlH603QRB/bGftSs5SPf9FlCIULXGeRw6EQmLhMCNB9EhwGXW69uxA46xiQoF+3a0po0u/pt87gKIX2nW/045+JE6E59UsArQLlogFC3BBVW8bcWyKNvzeGf7XOZoTu3tKIhuP/9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762403094; c=relaxed/simple;
	bh=h8YUZFyKOsq6k/ExnTuHpNMS76dAqK3eRmXgNmKkbkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oIuFe2FPLw5D7C6ALrFjLh2wch+l0W4sx6Ls9T9pYyzSXkYulKyVVNf8Ifbp4XVuI5QVmKtnOHbS3mgFJWQfX8xdEHpBotwwzt/BljAH0XK4UlilUH8ow1WcJGkGZKfSjry0ApH1NMk1Zj/TqGx6yHBaZntp1U9Dg8DKztMpMlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OZmlPCxL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1762403089;
	bh=jScILRVhE2oDsSJy38UFQR8/CAbeoy127HkXyX2Nouk=;
	h=Date:From:To:Cc:Subject:From;
	b=OZmlPCxLUOBBm/H7RywoNxtiqNik6GOEN4QB+V0GbRcnVuqmrds2L8uyjo3/t8lBO
	 PHWkcgvtnWbOhFpuDJ5cBGyl4KgAIH0ybF9o2wC2I2VHJndCM1+hU2gJ6evDLhADPQ
	 koBLQ1N+r9X+Hlyd0OaBWFzG4BMpdC5hRmOgqE9uibUyg21zXsLmZtVcMBAFDA1HFI
	 FO9FXtTa0D3KymvcxNTti/M5hYvnVajG/A4V7mSJLlRHAtNLWlAPTR114UyXrmBrI3
	 4BwqkVHlOn6LilPIypqfBW2vEcNzh4L/tTFf4TixKYJd5Ze/JkuA9OxZ88XTb41sfL
	 TEr7otc/H3FAw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d28H46khnz4wM2;
	Thu, 06 Nov 2025 15:24:48 +1100 (AEDT)
Date: Thu, 6 Nov 2025 15:24:48 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning in Linus' tree
Message-ID: <20251106152448.453b53ad@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8rCGGy8QP4MJA3/8nfOh+FV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8rCGGy8QP4MJA3/8nfOh+FV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next build (htmldocs) produced this warning:

WARNING: drivers/gpu/drm/imagination/pvr_device.h:339 struct member 'power'=
 not described in 'pvr_device'

Introduced by commit

  330e76d31697 ("drm/imagination: Add power domain control")

--=20
Cheers,
Stephen Rothwell

--Sig_/8rCGGy8QP4MJA3/8nfOh+FV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkMIxAACgkQAVBC80lX
0GwEnAf/QjqhRMCe47+ikiRf5fPTo02ETe/9Tk65L/y4MEXGLmFDm1X0cnLyKGhD
cuB5tM7JtzYx3z8a8BxApq3RBFXgFCyTxCr4DUCGQVJmUqOE/sVT0idApduXMmww
XhKFsHPohmqe1H+AsPtJPqufXGK62qiXzlS1BkWOHPbWH2r9SMRYicUc4mGYnD2c
nNQaB2th/WuDIIKlpXAlybcvYjf6RcRob5B0Ct1OQqA0npZjZZzD6O2WQgLxsfwP
QCuqUIJ8zXOFFBqVOCGsysvnd/0xdQeka6uxflKtIzQFLg7HTWZUjGNZXUu53lHe
uLQqDkiuPPcJBiZ1tNeI5XZKG2EolQ==
=Ztgn
-----END PGP SIGNATURE-----

--Sig_/8rCGGy8QP4MJA3/8nfOh+FV--

