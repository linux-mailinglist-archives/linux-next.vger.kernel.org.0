Return-Path: <linux-next+bounces-8102-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D50B3583A
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 11:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3C9A1B226DB
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 09:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2C983093D2;
	Tue, 26 Aug 2025 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MnTPVs1/"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AB928850E;
	Tue, 26 Aug 2025 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756199328; cv=none; b=QaU/R2FZ6gLteyxSNLRIA9XsMjYw9AImkPyDjigoOCjTDQ/SJuS1/KejDKof1fhmIp5wEVfVhMNxXIVt07+9D7tpUyH7qKhM2IHHMemjEasTTEJfL2h6d51miMhxbkxK6HWOKs5bzw9H1BbLBgxp1MOeLpVVAlIYRUfrvGfbNlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756199328; c=relaxed/simple;
	bh=nmUln0R+s/hcTfNqaGeaVPSa3a1AAOD1zeAQOgp7ydQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R6MDV8BMzGVZdXFHBR9YE1P5QFsGvOtxFyOmyXhwWofGX14iHeaEJMjKaPJ+kWUKM06TbMNyIx3Yq4TXTGaLPr0fwLZepO22IQPTcEgLZXMiDmXMWFr7rAS6jXwXRz+zaI6GkI8IHpxTdbFwA8tmQ2oPV8Qi5frcX4geIj7+pMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MnTPVs1/; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756199323;
	bh=HNV9skBB1CpGX0BmDnXAV8s/ECFMTR9Ndy6wP7DY23U=;
	h=Date:From:To:Cc:Subject:From;
	b=MnTPVs1/usukaLxa6HpnEKWWLU4t8LJFEuJAprEuEWKZiSfgLouSpN4ZmDmyWFqCi
	 qRzI3VIS4FiHxCdT1610tz0NyC8T/JG4MobyJMmWqTHLACvcEaNxR0yePRtzXjCL5l
	 dn6sI516VGei+GuP54YMbibilfq0ldAWI2MUtyvASBeleEpmIfGlGyxhTMca5By/vT
	 w7x6lBvJT4Io+qt6zH3ijlzuKfKHcgMkt954A0W7AiFj7w9dfoYcsApxm/rBxErnSR
	 VWWi0GYyNp/6MbHko2oBfP9+73FmlqOqGeaNCTJpEDrbxtIjP+4kSKqbnnMcs7KN8j
	 uqsy0OWA2uTJA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cB1zv58Sxz4w1v;
	Tue, 26 Aug 2025 19:08:43 +1000 (AEST)
Date: Tue, 26 Aug 2025 19:08:43 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-ID: <20250826190843.68a0ccd2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H7ymVjx_dd_5AHQ5wbHVdHk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/H7ymVjx_dd_5AHQ5wbHVdHk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d2567dc490b0 ("kexec/arm64: initialize the random field of kbuf to zero i=
n the image loader")

Fixes tag

  Fixes: bf454ec31add ("kexec_file: allow to place kexec_buf randomly

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

--=20
Cheers,
Stephen Rothwell

--Sig_/H7ymVjx_dd_5AHQ5wbHVdHk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiteZsACgkQAVBC80lX
0Gzm4gf/f2K56uVBLE1sbn6J7cBXl5D1xoiPSD//Ak/ZcmCy6vLk6QebeVLaJxnD
5R4LuRPUnpHa6IhT/iW/I0vDm4dg8UpcPTVhBSMQ2XzSZKOMIJ+BPi785Xt4c3s7
zV/lXKXThGfjj5iRB8XI16zSYjVDcTgccIEEqaeoTc/v0V+uujJceSNhcplCnZ5U
VCAY55uEtTyOo/fll1YRaluNsvQWQH9vMcqgyz6x2ZgKqIhV5AvcAgF86VOnmumu
LJK5IHBN8DwDabRDq0OUceBmXUax1ZQ3No0W1KmAkB6Lfb1kDtZeVEy2Lz+7XN7z
6jG3ZtrnkkJT0Xoi64KYHm1nsjtVSA==
=8CGC
-----END PGP SIGNATURE-----

--Sig_/H7ymVjx_dd_5AHQ5wbHVdHk--

