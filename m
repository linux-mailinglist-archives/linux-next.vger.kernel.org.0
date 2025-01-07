Return-Path: <linux-next+bounces-5083-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B280BA04AA1
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 21:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 043807A3272
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2025 20:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45302132111;
	Tue,  7 Jan 2025 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lMpCfdYt"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C881F63E2;
	Tue,  7 Jan 2025 20:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736280159; cv=none; b=au6KFpDUC95qDJlEtsJPaslyZndBs8Nc+Qt6YEC1zSi27sNdskfXoP5WrPmRAkcHcx3hqY9IjPZxW6RNA3PRYpxfS/GG3DpFFcMSYyeQMlwnjCj1pjzuMN13xLNSnjDLk2JTQ+DGw9xbrF/e93DuIFL7C3cmqmgEPoreiyzVP7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736280159; c=relaxed/simple;
	bh=KP86ei4R8xVFQTwRSA0miMhFB1lEv7rc1vAXdjcKDu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m0cMh0Kz3g5AMTYZA76G49bdnhbAES/AHEU4QdW3Ha2AWHqDO60mqH0nbuM2ALNQdNQmdWZ1tFMYiSYZQe5BJm9UKhBLCDI1hVY42pVa/kUN/F3MPaXyN5JGKcQhoGcNVwepsuvj2EXyorQ/rMEqbr/Bm3zFiTWQGruVancw2WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lMpCfdYt; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736280144;
	bh=86ArD6duWUVBKcQtmpKDKN/zyhmXI2VPS0+uZJ5XmRc=;
	h=Date:From:To:Cc:Subject:From;
	b=lMpCfdYt441Iu/1/Ydo4rj3Hu2B7vqjJx6cgKd6fBtdjDB6L66HDOPabaNritQxyb
	 fKa1QAcEWv8S1N/690JbtqZq1TRczN6+fcM16DMUeFo02W3FFXzUM3CGZayAJhUsjR
	 6SQGPv2yrD6lQlm6KsMzEjWO0dKMsJysWim0oL5YTpQRAPoNuxEWV59Pkd349cLotf
	 pC0eS0BmLVT1hsurS9Xk7raz/MLjVlfbSwSkhJovN2mjDwz4I0QEITtFFGOUmQXDpU
	 gqce+DuiydAIrgQW+5OoYoafnhPYGXZAURTYiDQhRc68e92IZ6bqtuqEVnN975Gnn8
	 z8NhRBLjMl8dQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YSMQm3fjbz4wcl;
	Wed,  8 Jan 2025 07:02:24 +1100 (AEDT)
Date: Wed, 8 Jan 2025 07:02:28 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Greg KH <greg@kroah.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the driver-core.current tree
Message-ID: <20250108070228.1067a48c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XmJOeH.JIxxZN+zG+vnScwN";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XmJOeH.JIxxZN+zG+vnScwN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  b4aee757f1ba ("MAINTAINERS: align Danilo's maintainer entries")

This is commit

  2872e21c47c3 ("MAINTAINERS: align Danilo's maintainer entries")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/XmJOeH.JIxxZN+zG+vnScwN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd9iFUACgkQAVBC80lX
0Gz4Swf/VYEDncaxarxjLM7OCYAAInjhHrBD9m7O/1iVHqM23xTVw2CYlvWLRwKk
+UWEiIHPukWG5P8WDRO1+QvJ7/jy/FMc+uhBZlYhXqvyLq5xU/3VOjXP5YcLS4cB
Hh+RVPQ03kl80mw0mXAhup0Qk4iflgT9yPG5JJKhOswO3fSJcxEuNpMzjMCGBSdT
0AIKrgrsi8Ki3d03lmrlRDAHpZMduZjOKEZV9PmCv/bPVUedNpQAx+OxyEdD28eV
YZ/SBjP7X3PWFPFllCMFTeM7fQjEZEfj8kfA0FOONB8k2Bv9dx50GWDpkn826RJJ
4g496zic1WxZHWpZqCJVYdGeKSNxsQ==
=M9zT
-----END PGP SIGNATURE-----

--Sig_/XmJOeH.JIxxZN+zG+vnScwN--

