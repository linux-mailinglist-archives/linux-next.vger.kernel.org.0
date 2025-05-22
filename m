Return-Path: <linux-next+bounces-6896-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B6BAC01CD
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 03:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B6B5A24D6F
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 01:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A6222CCA5;
	Thu, 22 May 2025 01:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="hhOU3RW4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6875310A3E;
	Thu, 22 May 2025 01:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747878020; cv=none; b=HIEaHuqp3Zyt+hw5v37exxbNJNHHeOY3TmQL3g7pQeMEsjTKb4Y8ESmgmrkztWTTf3d+S8HVNdAS8W5JcLf9cdbVjE6Kb/pQrmA22SdBfWq7l1kxW2vRfy8yGVrE+awX874nuckWTuB/udR6lGP91+NLTZC1FoYek+WcBCK1G4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747878020; c=relaxed/simple;
	bh=IuTT0cqhaZoX+06GVZyyGMaJC9s4XluYBrUAa31GMaI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjUkvQL/r7+W+K4TL4h5CsZ7B1UlhbUCjEriWYHp6ooPXnEeBLlZtrqq0Mvm9IIfYFFaTKRWF/eGteDDXAxMKwwanxJ2U+XJ9lRqJeYnpDADJ0y6lsTiz0dVQmgZeUfOWJsv9dxbqm8hjS5OMpM0E5MstjLhbNJmp7r3yxjMETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=hhOU3RW4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747878015;
	bh=YlY3JCgO4B8/Z3ixy0Htn8OSBlaA+oznvuO0ecmSx7Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hhOU3RW4prOzFhraJ5gunOt8Njr3Y07jK+6o4VPL2Ty/2ZzlSGqUUWNNjAVF27HTe
	 BeGu55p3o9cHJhqxZZxYT4Q989bf4A98wqcYMG0I31gr/Wop9JAfW2PjGASzqjHBno
	 /Aq+sKDPpXwiRq9I0lPjxrEmuDosOI0j3AlKRHBgGWXfyfRBnzpj/wuc4a+Giq/7OP
	 92io9F9XZ6Jid7Ej5ys8viMSHA27qLetmP9P+adTVXHCOmTtzDZGlFZLJtPkitoAIL
	 IzEoRD/WiRar7EpfH3vmCt6kX+6HhhALoyiBp0WtHhABO4M7+xS4Df8MOhLD0FuFVp
	 LrZtZP+/yYsNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2rZl2M0Wz4x8Z;
	Thu, 22 May 2025 11:40:15 +1000 (AEST)
Date: Thu, 22 May 2025 11:40:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, ARM
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: linux-next: duplicate patches in the aspeed tree
Message-ID: <20250522114014.5743b499@canb.auug.org.au>
In-Reply-To: <20250522113033.066d7216@canb.auug.org.au>
References: <20250522113033.066d7216@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pFxV9.L8dGLtaX3pbE_t2ix";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pFxV9.L8dGLtaX3pbE_t2ix
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[cc arm-soc]

On Thu, 22 May 2025 11:30:33 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>=20
>   28fe68179368 ("arm64: dts: nuvoton: Add pinctrl")
>   82f50ddf894e ("ARM: aspeed: Don't select SRAM")
>   856d11d63f85 ("soc: aspeed: lpc: Fix impossible judgment condition")
>   f3089a4fc247 ("soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()=
")

--=20
Cheers,
Stephen Rothwell

--Sig_/pFxV9.L8dGLtaX3pbE_t2ix
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgugH4ACgkQAVBC80lX
0GxlFwf/VkAZdLIiadJwYfAmM+bq8LFtzHRE59Ylz6SOv6eGe0O5hAB8GSuYWBI5
cKS4V0Dy6v+egWIV13sxIOu4pY7e7/O7bLAtU2N9vTNxZl9kroIIg8neix4whtnO
/uXwZP2mGkplO5skZAKBD/YUI/o7ITMYiqZTfHM2C5rHqo9OAj2j2AppWtTQ8UUZ
B48aJeZ6Samjp5rpFdirufcJbLAOPFeyy7iLBuSTO01yCutmgLObyMCSa7QKHhpH
uCAYKZQbPT4VW7x2UBBiputMWfR4ckDCaJqqaW54bJRE3N8cbLNwaj3U/UA0/YCV
sr0ZxSd4TI5dtPtTuRQc1uCbeoUJ9A==
=lOHx
-----END PGP SIGNATURE-----

--Sig_/pFxV9.L8dGLtaX3pbE_t2ix--

