Return-Path: <linux-next+bounces-9615-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0023D15CDD
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 00:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A8223018D65
	for <lists+linux-next@lfdr.de>; Mon, 12 Jan 2026 23:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E173C28000B;
	Mon, 12 Jan 2026 23:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WwIKyeok"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C06F27AC4D;
	Mon, 12 Jan 2026 23:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768260539; cv=none; b=fnBple8L68EX8YtYZzsw9BVCzTthEcshhIw5Q7mjBL11YfhySuj8/j+BwdVlY2iW/jDVOeYfBvPVSagI63TiXpXxZ8I0lH/ptqvkAVvQJug6bI0AZVzAfJqI4Pbg2p5bQ7ZKmozVQ4ojmhBWmepAl849jNKhl08lvhKigwLiOgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768260539; c=relaxed/simple;
	bh=psXz4fyixAYMhuwcfGGkW9eMI1TOTMqitIpcpYizJ9c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JHVvYw8lxwtXKsfevhbt7Yvt6E7+a47HxDyfp3CnMaf/q/AvtR9Nw9cL5OanLJWC4iHv5OxyxtalmRwqSSymhl8K/ecb7ggIKZgIjHp33/6RelaIFL/t4KJ6I9/8ohHQACn1ayJrnzw5e1ow059BYPeZ/5DBe+Fi9MNBgtIrm3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WwIKyeok; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768260534;
	bh=VO0VhdMEVQ36nPXVzjPlPyDjR87GMIc3/kxvqjbYvag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WwIKyeokzNrX84n+uBiQUGHY/qYoevlKHHVhlZbb0VJRiGMW4nrfIKtXkSkJULBRX
	 2B3E8ortD9S6g1/vvD+8rG8vogLjc2hRGXMCcajK/A4RX2mD4xdtcx47DoLRzE0Xty
	 fJxJqzD8AYg0eVkhBUSmlMeW38Ps3E7uQJ5vy7ymDJHnjtoGF8a0/2z7eSc9MVrELi
	 GfSNVkS8M+8FEzYR3BpJz6eq3Kk5Km+s5NUbLrQtFjQVJ7cEK3WHtWsrDoqSbfDBXC
	 HfXxdkGs99f8r9wFLBJKkBLlS9a7+NYGKbHaZKVAaWRomT/iJG7TVkfaRN9SHKkGe2
	 SsiGfduPWGxug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dqpVG10Jwz4w2R;
	Tue, 13 Jan 2026 10:28:54 +1100 (AEDT)
Date: Tue, 13 Jan 2026 10:28:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux-kernel Mailing List <linux-kernel@vger.kernel.org>, Mark Brown
 <broonie@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linus
 Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: changing maintainership
Message-ID: <20260113102853.2594a006@canb.auug.org.au>
In-Reply-To: <20251218180721.20eb878e@canb.auug.org.au>
References: <20251218180721.20eb878e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_6Ef4YCLplwsqISAUPEw7oK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/_6Ef4YCLplwsqISAUPEw7oK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 18 Dec 2025 18:07:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I will be stepping down as Linux-Next maintainer on Jan 16, 2026.  Mark
> Brown has generously volunteered to take up the challenge.  He has
> helped in the past filling in when I have been unavailable, so
> hopefully knows what he is getting in to.  I hope you will all treat
> him with the same (or better) level of respect that I have received.

Due to logistics with leaving IBM, my last linux-next release will be
Thursday, Jan 15 (i.e. I won't have time to do a release on Friday).
Mark should take up the mantle sometime after that.

--=20
Cheers,
Stephen Rothwell

--Sig_/_6Ef4YCLplwsqISAUPEw7oK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmllg7UACgkQAVBC80lX
0GyPOAf9HasImW5JzInIenToLzyUOkcJnpDEU4FW/L5YTEIbwKPPhmtqgvH0ER/m
yejBm58B8W4m2pbU+6wK7UYAVnRmV9UuFKow1H3ae3tHZjGGmo6EUk7tJXP6wste
Q5W/5AY0pvogjU5LwJn8CQQlMdNWHgDmBqsTiFLVSNw/vb38KDkOmQpfwUM3f4EX
7IIvq7rSubOkJXAAcSKWGG/Jna83ClXwEnzWZaI91F/wedGO0wlDagm9tw1N62Qq
6CCeT3cgfNuPrp/IZn0U/sCMwrSRh8o4g2MiHFUWnOTbIecqZ73hHpJCc+3orDGL
UEzKWf2YaljQsnJoeKtDCyqEysWI2Q==
=AL6v
-----END PGP SIGNATURE-----

--Sig_/_6Ef4YCLplwsqISAUPEw7oK--

