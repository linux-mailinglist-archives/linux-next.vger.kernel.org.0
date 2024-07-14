Return-Path: <linux-next+bounces-2986-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60379930BD2
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 23:49:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 910AE1C20FF8
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 21:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E9F1D53F;
	Sun, 14 Jul 2024 21:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Sxa6Xkia"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7CE13BAE4;
	Sun, 14 Jul 2024 21:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720993748; cv=none; b=SjJlmewagznRGZ+130s39WNXF2/ATWnWurjJldF9MxrUIewb3ZT0h1DGWuptROCVgc1oO2oRA8YjF2ooxMgYWk7SNeJfc5TTFhfEq9RIPtP2pl6+VbJRDNvnLFdUBBY9YFANVUn6Q+KXSzxca1y3GRjA1h7LADRHcsD7u8CwJdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720993748; c=relaxed/simple;
	bh=lwv27pAvwPUUJPfrguYW1hGBQB80dYmxdRR/+TNUw8I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I0gHinpVmnx43K09s4jdAmeKl+wdzX+ezkwLITJZVPRsu/8j/2v160l+znZvDyuX0dYf7dDZ7CyLdzNnZDDXIFSFW+QIYTG1VqKymeUGCXfskqpButDOF2VFGOpgfhgQSLtnFjJLYbFqy1KLhWirB1wlDbsWpIrVrI4MVh4Z2cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Sxa6Xkia; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720993741;
	bh=HZPphXOdO5hAdu9ABGKHr7sBYWhiswN3taVwhKPar3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Sxa6XkiaVuK/x8UBvNTBfk6opgZVBfAD/37/wQYPcN0/USKW0qqeQBgZj0pTVKIb1
	 L3YbXiWj6ZCgj3H4CiAcx3fyaVolMGp2Rh8Lhf8HcJyQA5XTFjbBMmgY+GzzH8eZd/
	 RzpZaRgl5ubQiQ/0dFESLQyFKTCT7pDTjdekFeD3SR9D6MGvRCHOJSVF246jJiXl+Y
	 4aU4F3KNxwkdj9klQw0qk/R+UiYkvMLjP3h0FgbG+Dw6p6U4bh7/VpvIZKEBPCzMgQ
	 LfGQADVFIh2mvgd4KB39+EJcLgUUGChYObV8ffsRetZITWzZJe21cmdYf4c9ByaO2c
	 60MoZX7ZWp9wg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMf9S2QK1z4wb2;
	Mon, 15 Jul 2024 07:48:59 +1000 (AEST)
Date: Mon, 15 Jul 2024 07:48:58 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Drew Fustini <drew@pdp7.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley
 <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: Add thead to linux-next
Message-ID: <20240715074858.5b808ec0@canb.auug.org.au>
In-Reply-To: <ZpIECMEzy1srRfe1@x1>
References: <ZpIECMEzy1srRfe1@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+b9i.620zwSGUJmt8t9edAt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/+b9i.620zwSGUJmt8t9edAt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Drew,

On Fri, 12 Jul 2024 21:35:20 -0700 Drew Fustini <drew@pdp7.com> wrote:
>
> I've taken over the maintainer role for for T-Head SoCs [1] and I've
> set up a tree that I will being using to send pull requests to Arnd.
>=20
> Please add these branches to linux-next:
>=20
> thead-dt-fixes git https://github.com/pdp7/linux.git#thead-dt-fixes
> thead-dt-for-next git https://github.com/pdp7/linux.git#thead-dt-for-next
>=20
> Thanks,
> Drew
>=20
> [1] https://lore.kernel.org/linux-riscv/20240620162522.386-1-jszhang@kern=
el.org/

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/+b9i.620zwSGUJmt8t9edAt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUR8sACgkQAVBC80lX
0Gy+Dwf+IUXHZ+B3xYFt8f2FvyR0r7bj/ktt9rARZhFo0XG17XQzRKue781+QZ0u
1pUEVEUvIL+MLpfLtKgyJ9f4jayBJBeTU5QPy0BePlUEd8Usz7Dp+27Poav7r9X7
84IdH2vt34BlH11lQeaBltvSW1U0m4/sk1eqJ/JZAlirMD9TK/7GS55cDJpMag6j
OqSTlYPuVa2UBZbu8JF4+C+C7Of0gdOb3vwBzgBhmV3L2xan5Dq9Q1w9imQfJEkG
Qd0zU6wqGavdTJIpQIcPk5kOVl+tg1o9bjZ1FI7O6Zy4kIw9m51O4yrQAHjbCzzx
dHTypUxD1QM+jvHbNHTQ7SmCOsv08A==
=Bdq3
-----END PGP SIGNATURE-----

--Sig_/+b9i.620zwSGUJmt8t9edAt--

