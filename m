Return-Path: <linux-next+bounces-7832-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE5BB199D5
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 03:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B38B3B0C14
	for <lists+linux-next@lfdr.de>; Mon,  4 Aug 2025 01:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4291B532F;
	Mon,  4 Aug 2025 01:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Q76UD000"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E85429A1;
	Mon,  4 Aug 2025 01:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754270744; cv=none; b=LeZEOrFmYG21z+WiYdCBBmAI0vRp2Pd0adr08onjPdZ+BVwguM//u674Ngpg5PNiu5VJJNLUYUIzNLFO5QjgP2sreJnpbL1Tspi+mSHX/2TY0OlJM45F9PhXZfkqn21vE+2PWQKmhDTjYyQUymFgCZZ6NnfT+85EcZSVtfaoSvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754270744; c=relaxed/simple;
	bh=CTOoSNavDPNe0/kE+A0n+AOfb1d3h5xV6lZHbqYaTJc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e+DdKGp9VIkC+WqnODStttryfhczbi7dJmL+NSNCAzq5A8LfY168+R6wbSXwHTO5947NlJdNR4TV2rv+wDqHhJNGuaOGJF80yfnJXox4jnm5JbdXr71mB0jcEimlNeoZxqGw6qfxvyNp1FiOcYo/luCBSObhbjaocQ6aUHSZKVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Q76UD000; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754270740;
	bh=jBZdkOsb/xZN8sCpF660Oe7sczVXc58fhkHo5Im8OUY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q76UD000a9cvo3+8auLqWgUAlRKGgLToVn1UDJReDtns+A6v4o6d21d9U7w5Va/0b
	 0Jr0dYuM+6WB9Yr3Eqf1fLOFQ7B7vFEKSJK7eBE+tPfE1HE7CGNV23IiAlsIwi7RQd
	 zbjdfKQet6rknDgPoxbGgmCCfJAHhsxTq+uEGNS8gg8xN/5RSWu2WFLtrE+5rOZyNz
	 xOIncTDwUHndXfVz7p2lJQ33T3rpO4blLCwf3wIhKtCAIaCVLxnFeJ+nUn8caVi8YE
	 uvGUvifIBdKIX5LFE8oWGz3+Af+rxGNcsExY0Dg/i1QXpE1YNdUKMJWdmrd7JZcHS8
	 8Gf5P90LuEjrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwJlm5cr0z4wbY;
	Mon,  4 Aug 2025 11:25:40 +1000 (AEST)
Date: Mon, 4 Aug 2025 11:25:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <20250804112540.6b8ed4b9@canb.auug.org.au>
In-Reply-To: <20250730161223.63783458@canb.auug.org.au>
References: <20250730161223.63783458@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qYqlHPDibEQVcTVn.ijODbv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qYqlHPDibEQVcTVn.ijODbv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 30 Jul 2025 16:12:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the kbuild tree, today's linux-next build (i386 defconfig)
> failed like this:
>=20
> ld: .vmlinux.export.o: in function `__ksymtab___builtin_memcmp':
> .vmlinux.export.c:(___ksymtab+__builtin_memcmp+0x0): undefined reference =
to `__builtin_memcmp'
>=20
> Caused by commit
>=20
>   c4b487ddc51f ("modpost: Create modalias for builtin modules")
>=20
> I have reverted that commit, along with its parent and child, for
> today.  It's parent commit
>=20
>   66ef3890c628 ("modpost: Add modname to mod_device_table alias")
>=20
> generated this warning in the i386 defconfig build:
>=20
> scripts/mod/file2alias.c: In function =E2=80=98handle_moddevtable=E2=80=
=99:
> scripts/mod/file2alias.c:1480:25: warning: variable =E2=80=98modnamelen=
=E2=80=99 set but not used [-Wunused-but-set-variable]
>  1480 |         size_t typelen, modnamelen;
>       |                         ^~~~~~~~~~

I am still reverting those commits.

--=20
Cheers,
Stephen Rothwell

--Sig_/qYqlHPDibEQVcTVn.ijODbv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiQDBQACgkQAVBC80lX
0GwU4Qf9FzvN6cHDOLiFCXUT9csNPoiyrUXRt9u9iyGLxsTnYgNegQEKL18Ou8Yz
YJr0NIqkuKHuLWx7V5vuZfWXRG9pjrdSV6E8bjaIt05XrEIkX1hODlZDM36M9ES9
A2NnI78sISQPGhaNWdYXJ/3ukZIfPnB2aHZ5xCb93bqFRfbP78TukktCdImcuSwA
S/VCvx7Dpm0ZjIdOn5t/gzCCuTv9gHF88rY0X9Cc2CZYiKVdKBHEZtNbdJOCYdH6
M1GX0cshj8ygblLN7d7D8hdVpeNz5YtTpv5ZP9ab3wQ4DUHYknLt1ewm24OR45/R
hu0DC9T6wg1VcJtazYdjMAekdf/pFg==
=eBwl
-----END PGP SIGNATURE-----

--Sig_/qYqlHPDibEQVcTVn.ijODbv--

