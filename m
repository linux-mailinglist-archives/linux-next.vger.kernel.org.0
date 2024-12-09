Return-Path: <linux-next+bounces-4915-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC6A9E8BC8
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 08:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C5B61884039
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 07:00:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FF23C47B;
	Mon,  9 Dec 2024 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JuKUGzZl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A101EB3D;
	Mon,  9 Dec 2024 07:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733727642; cv=none; b=cBeiYJrfJ2hDsm9PqKa3lvSlpCn83UE1QOV4rNLKXCzO3I/4wp6XwiKeDBa4I9lsujP4UesFx+463ZIhUPK6FCKjuKfaT2R4+XSXBuBpd77zoIKl8ayS3H8FiC0DqhGJ0Z/GFl3oqI3MR/Ggw7IFwGguq2DTGOvYPBzAsYqfGx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733727642; c=relaxed/simple;
	bh=Fxa77D5LuZCzu+mrNkKS3AgtNZjzWt/VSVfG3zzDQ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BD2m2dMC0c4waRr0ylAsKCdPqRIlhHctsXUuHi9PjwW1w854WEEh72AuaR3qhuOR3Rpxnngk6dzMB0wSPNyYUG4SSTz08FULXgB4bSRbxv/ojeH+kfaA1H0gBVsETuN3OfLYV8hjPmC1AlNUHTxskSnYk/jzX1bQtZuNywuLR0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JuKUGzZl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733727633;
	bh=wYrI7Brk9+8tIMQB1nUCtmHseVVpvoEw1yrte9vwUUI=;
	h=Date:From:To:Cc:Subject:From;
	b=JuKUGzZlLq1fjjzAhwi1cH36dkxMQPLHj5Wzx/U5ODppdeI+5FeSL+h5JZ39BonAf
	 6o+spNwSIQculW1TubkPvzuOwx6i6TpUoYbGwwo+uwEC6UHjnuL4+SgnY5ri2rrH89
	 rkFwmGgYU0QUInuwS2xvtygUgyW/timxs9U9qGONoaBeCOW6awwo9qNrnQL46lZZWc
	 8h/ZUjh2Hd/c1CdXEN/IUQOUKonO3iwhpfR6LaCd2DKxrkwAZE+LLFGljVZlgviIRi
	 hkj0PNyGaJf4mZWu+qOaylIt/VuWyoENeYMQZnlJGcSUH0LXnMwiguLbKqsa8Q4gat
	 9EcZ+WwWktgsw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y6CS02jNZz4wcD;
	Mon,  9 Dec 2024 18:00:32 +1100 (AEDT)
Date: Mon, 9 Dec 2024 18:00:34 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Piotr Zalewski <pZ010001011111@proton.me>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the bcachefs tree
Message-ID: <20241209180034.1281736d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/W4S_eHl8BkhrwEvgmP3QNFT";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/W4S_eHl8BkhrwEvgmP3QNFT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  683d63ba028a ("bcachefs: Fix evacuate_bucket tracepoint")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/W4S_eHl8BkhrwEvgmP3QNFT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWlZIACgkQAVBC80lX
0Gyr4Af+ILqV0miPHr5MI5vxeMajqdLLSr/NoHonyjtx5AZ8cimI3RLzEMECAVbC
DfZ0Fbufo7R2hCRnW5I9XMTcgeAADhmPaDMttFgfhkyt6ggyyGPOsXLXjuVIfruw
A7zsLdm1LE1P55EJGDMpC4aaYIPa+4eETgMKkQiIe/SVu1F1spUUHg75zaRY2kcS
REKD+Ut3mkDqSPkrl0zGomcLWlABQXKyPXSNCN13cZJ0uZ1y+lZEySzZQKNq4wUw
pKjTFygyRFfuzVDZfh+SjuviJKO+yP7MFBzj8vYkL5WTxhxosusf5c7bRdZZO03e
QSNcT4hOJXhPy4KZPRyQ+JCITvs84w==
=FkIT
-----END PGP SIGNATURE-----

--Sig_/W4S_eHl8BkhrwEvgmP3QNFT--

