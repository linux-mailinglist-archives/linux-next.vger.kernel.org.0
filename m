Return-Path: <linux-next+bounces-7851-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E24B0B1ACC5
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 05:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62B9B189D127
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 03:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705B21EA7DB;
	Tue,  5 Aug 2025 03:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dd6cqySK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2684D179BD;
	Tue,  5 Aug 2025 03:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754364690; cv=none; b=gmPJbfkeND1l8RdRiWF6YCCND1uoJMRxeN6U1JOhOih88YNVSZYpkGAimLhkg1Cr0UsVQ7+c//2GBaYpt5dxTBl/KRQGH7CsnI0lgByj3qm3TasZY2EMbbBH4ifJG/IxX1ODOEgyi0b4npFH7s9UQ6bT42TNU8VKKY2PuVjNvwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754364690; c=relaxed/simple;
	bh=gUtkbztmQvdeHQAbP42jNSwai1NyZam9pejzGDHk5Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k9144yuAPGJnPySdVW4pkqvLKw2DXjcR9oJZIR1zCfgCtmXrljW0Hr8EwsT3TLnWE5G/1M1yCYG13FZv01Fnb6UYcfjPMinTLP+8KXQA4o7bE0PJF9+NeqK/3bcERV+EG5Co4NTE9HeruyoHhS6TFphZhcW7NXK5qFtM9e3rfZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dd6cqySK; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754364683;
	bh=gUtkbztmQvdeHQAbP42jNSwai1NyZam9pejzGDHk5Ro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dd6cqySKQMb3QvLVjG7wSt4EdYqWaMVowFTJ5bGcmLilFnIuchnQDW7UTRHX4fnz4
	 0+hi29Q6gDkoB2bZYauUH2OZn/6nz/Xa/nS3ZydOdthYVJtxWrcvI9i10vPBF69ekq
	 OxvgpyKwhXuKYjXTJwfDS0rXYI1WqaF3FnP1VhSc9Z61b80cZidcJ94uMEaOXSnbmX
	 HzsmZ2I8/f2FG8Tq9h12UzqL/WqBkQXjXiVzqioINrj7TKPE9mwHp6J1/S1/CCmu/Z
	 +7JZZr+Mcl4wwwEJJ77eR7MyxC3wuZt/cNb+11nzSMbKdWKTLXzmJeCgbR/yyB9Y8u
	 wrzmNJ8Otb2gQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwzVM56gHz4wcd;
	Tue,  5 Aug 2025 13:31:23 +1000 (AEST)
Date: Tue, 5 Aug 2025 13:31:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the kbuild tree
Message-ID: <20250805133123.5a5edb70@canb.auug.org.au>
In-Reply-To: <20250730164047.7c4a731a@canb.auug.org.au>
References: <20250730164047.7c4a731a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tG14QQJ_AjAfnn/_gdbpWMI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tG14QQJ_AjAfnn/_gdbpWMI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 30 Jul 2025 16:40:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the kbuild tree, today's linux-next build (arm64 defconfig)
> produced this warning:
>=20
> aarch64-linux-gnu-objcopy: vmlinux.unstripped: warning: empty loadable se=
gment detected at vaddr=3D0xffff800082750000, is this intentional?
>=20
> I am guessing this is caused by something added to the kbuild tree today.

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/tG14QQJ_AjAfnn/_gdbpWMI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiRewsACgkQAVBC80lX
0Gzbdwf9GICdV0nQhT0V53oMiNNiujab84MFRWbVIH55fXFEn+AFJxYe5pwEs8JP
9EXexqdGAIoYyRT4ubxGSz9ZRhBVFRsriiE2D1Bn9sGoXphHmUUOo9CFAWFU3eJ0
erBfRDk93HwUNVusfFhOwzmRmJJ8+lwR4TNmbmo/7YNCxHzejzMOOYt7okQJY/So
JNstidcD53jR7woM4obPUhDA0/iPhgwrdN+crkRk+sLOahbT24JPFD2n0OJWOsOe
CJFVD+xj5oBtAvh/AEzmhln8w72EwuBCYJeLXBwZmLSwDRqFyDShgv5JPdLBQgHC
Pyv4kiOtNEAxDuPwwIG50Pqu/gK5og==
=WPFJ
-----END PGP SIGNATURE-----

--Sig_/tG14QQJ_AjAfnn/_gdbpWMI--

