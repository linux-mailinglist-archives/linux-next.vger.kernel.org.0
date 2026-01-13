Return-Path: <linux-next+bounces-9647-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F026ED1B755
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 22:41:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B88B3035064
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 21:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1389434D909;
	Tue, 13 Jan 2026 21:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kONRmICf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7B934D907;
	Tue, 13 Jan 2026 21:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340489; cv=none; b=I49sdE1PNGE1VUHNfa+Di0KTQsrbtYeRxijRJ+EPurlSm4LV0QIQCbnWcs1nSk6aeu1RAGM0rXfycApkfESklUWABmIAsoBzl1OnMztlHguXEQmIQn7Q6d4vEXwDS/h39HLlnLuNvqkqfFJ9RfyukZe6TYEOmXs48BvImVoOca4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340489; c=relaxed/simple;
	bh=lxiJNNCZKWHUZ8n6le+v1YgyqlN18rOQHJL9OiTPXPA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JkaGJwcmCA+Qmbi1wS8St5/qsM4Qtn7eO7N3YEPGk3/vB5LS/e7LMsxnlo+l9HMpBT7sfrQ4lFiD7RYXYPOKY9idvcoFrET9lyWb18ZLO0Ci7PWP/ExRGUkpApcuYCRLpuR5bp5Flv3kCR40yX8g7AFpcV1B0ZXX9NADHjPH6No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kONRmICf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1768340484;
	bh=XjgzuQtoJsJa4A1V80sfG0+dn3ckGvNCDYOeV+8Y+Xg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kONRmICfinTDoqUuYzG06JRqwn+dhKLPHh209K2NggssDwAZU8L0d6ITHRDhTZDUI
	 Tn+pVUnWRvtEUPJnBgGQCe5qOF8X9qMleNXbMlJjPRiQGbK6o8lbRmOESAHEMfB5P/
	 Qtm95tANROw6LUJanr6NrVcCk0jqJ3o2FO6lW0QtjxAbJ0aiv/o/QlqdF4F3M3IVTm
	 8uJg/73NyCEYGHANimC8gCVaVCrTc2gRWFW5sI7SCtc5yg8c7lNVLM0D5DgFoh3BiP
	 rXdJiw1pmsT/K/KMIwtSamcabBxoEt2xs9Ldk0+d2lMcE7EAIRa0evvOzAdbe+V8YA
	 DLihdx3i5EL4g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4drN3m39B9z4wGs;
	Wed, 14 Jan 2026 08:41:24 +1100 (AEDT)
Date: Wed, 14 Jan 2026 08:41:23 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>
Cc: Felix Gu <gu_0233@qq.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the spi tree
Message-ID: <20260114084123.7a3fc1b1@canb.auug.org.au>
In-Reply-To: <20260114083730.4e405e1f@canb.auug.org.au>
References: <20260114083730.4e405e1f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2pwp3Xe+U_eBX5G_RdlF3SP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2pwp3Xe+U_eBX5G_RdlF3SP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 14 Jan 2026 08:37:30 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> In commit
>=20
>   383d4f5cffcc ("spi: spi-sprd-adi: Fix double free in probe error path")
>=20
> Fixes tag
>=20
>   Fixes: ac17750 ("spi: sprd: Add the support of restarting the system")
>=20
> has these problem(s):
>=20
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").

This is actually in the spi-fixes tree, sorry.

--=20
Cheers,
Stephen Rothwell

--Sig_/2pwp3Xe+U_eBX5G_RdlF3SP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlmvAMACgkQAVBC80lX
0Gy/uggAgUYps8bMm0D+5kEoFYzyid0f+TjezV7y8vwkdpMnGwqE9Js9AV9N1MKJ
SCYYWmxoMLvPdKTmllnpIcpRbXnCO0zVC9dF0L7+PyhASGE/hepsUqk2YuQxIJYS
C2Duud/1qwNBclunop4TRQe9cKDaK+bZ8fUI4EeUlclVjZK9hzm/ltH2rKgPXBLx
xh3TVMYWg1+nICrYEPj1FsMMhCCtzGqNaWxnSAAoNWjxDAbwa9WUFz1qJTbDDzEg
DXYu65yQarDT30fycJEfGuQZN1/7qkxwUMPbCD8F/EVFhmNXFsliF19fz11OLXvT
GpwgNNXXQ+M1hiZky1h8WFTUyfadZA==
=D1MX
-----END PGP SIGNATURE-----

--Sig_/2pwp3Xe+U_eBX5G_RdlF3SP--

