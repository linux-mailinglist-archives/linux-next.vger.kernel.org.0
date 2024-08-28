Return-Path: <linux-next+bounces-3468-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD50961E28
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 07:22:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B5B91C225BB
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 05:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BAE142E83;
	Wed, 28 Aug 2024 05:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="F/ToYNZk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE8113C8F6;
	Wed, 28 Aug 2024 05:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724822567; cv=none; b=LU/RTbRLdygkC/Vi7HVgBq5ZWiwYca3tdTHwh76Nwrnh3nRV+TZyMGeH51SEb0ZB7FLUawT5uDkurNRhkaKnmEnLD4C/jmewTRpxC0RFfiJk98vnzEt4DlYQFOMpq4FPyUhhfhiDryT8KZjENainDLj9BXHBTzJ4n9M3wIH1nek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724822567; c=relaxed/simple;
	bh=P7noquJb4G6O9R/FaiqkwlXbQJ6lC4edL8khAJg4bxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WEo0dAjRCeIJ7ETp1vbIBf6BBTI84uzh8MeeeeOU8mkHhOd1+zn5tarnD2S891yCPjk76n+GOIa39yv8+SeN2D6XCPmeFDEy7JpNPZPGuR08SjqB9Y5qulIRyzczk6ycu/MY2tXGrtZTI/U7wXBy/YgOxIipCrA286Bt5G/z/kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=F/ToYNZk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724822563;
	bh=IrMygltdXQL55zbcTUvsWMgmgjgP2Tt7p5/VVTmpUrU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F/ToYNZk4jHpFtmz/zVMOiqAt8qV5w0W/6OvYy1d2lOsIcM2TWo20IoM4JJn/dyES
	 8Jr8FhLd4XHPgOvHVmLZ91d7fvqV23ur2Sh8M/iYcSWC8cfPkq+2Tgk7ypSCW48tsw
	 /V8lpmW1K7vJQLzH4Zuq9RjyNJHQQUJMKjNB8ifm3LD5TWw7b7SEfoUQXBhG+9sXZx
	 2la0+Xl0wOVbBs8t6IXxbv50nSFO33JbCH3f4QCL87sCqpCnqYr27KXNhPt50eVkj5
	 CNss/JhRSPOL5LUNavsnJRd/O0Q8bXT8YFM2futBgCgqGbggwbyLzfAspVrGTzQWNx
	 Axcy+moN2UdsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wtt8g0S1tz4wj2;
	Wed, 28 Aug 2024 15:22:43 +1000 (AEST)
Date: Wed, 28 Aug 2024 15:22:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Christian =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240828152242.4526f1e1@canb.auug.org.au>
In-Reply-To: <20240813134010.65d77461@canb.auug.org.au>
References: <20240813134010.65d77461@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dnr/Bcmy8aYhMA0xJEqhPvf";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/dnr/Bcmy8aYhMA0xJEqhPvf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 13 Aug 2024 13:40:10 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the vfs-brauner tree, today's linux-next build (arm64
> defconfig) produced this warning:
>=20
> <stdin>:1603:2: warning: #warning syscall setxattrat not implemented [-Wc=
pp]
> <stdin>:1606:2: warning: #warning syscall getxattrat not implemented [-Wc=
pp]
> <stdin>:1609:2: warning: #warning syscall listxattrat not implemented [-W=
cpp]
> <stdin>:1612:2: warning: #warning syscall removexattrat not implemented [=
-Wcpp]
>=20
> Presumably introduced by commit
>=20
>   1810bb54fc6e ("fs/xattr: add *at family syscalls")

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/dnr/Bcmy8aYhMA0xJEqhPvf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbOtCIACgkQAVBC80lX
0GzOZgf/b8g2Gypmia41CPywcIDoqkr0HezpJ+L7ML6rorQvLeOeKxDVI7ix67zK
Hv00tGnzOp669MnKsOiObA+T0kPkY/D3Zs8QKvrilf+ALmNEKX1JI9l6R1OmzvwI
FMoOcBDUYIIKMNh2GPxedbD2oMPza7EqIqbB1kyuBCGxQ2l1IvnL/jD5ZFMei+AC
jNB6F4jki+m6ogGQqcGvcEmvACXD6XL+zxYJzVizHqOKZajaIlMLw/+Uxt7hZwfr
+g7RzAP5e07EuNEpdIPm8ST+eyfRiRrd5Sr/PjObMWwW0eUbuBCMWq7yMtVnop5I
CnylsINpFVdb4mt4LBNXeLkE6Q6b7A==
=MAhM
-----END PGP SIGNATURE-----

--Sig_/dnr/Bcmy8aYhMA0xJEqhPvf--

