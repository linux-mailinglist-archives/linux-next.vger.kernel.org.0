Return-Path: <linux-next+bounces-6427-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775BAA0012
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 04:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99D15170E95
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 02:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7909D13B298;
	Tue, 29 Apr 2025 02:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WSzQfY90"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F527735;
	Tue, 29 Apr 2025 02:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745894756; cv=none; b=ViX3s9Tj7fzh939b8KszHnIoEBGqK58+C63ZdPRu6GwPEOwU/Lek03NUin//TyhFLUCEzYJKaM1N28QlIctr9qpgymkstNcFmT7IZOibBiyFEs76P0uIspm9Z8Mlq+aZ/d2XPbve0epFvh2ART9c0GSokZaki/Ryq83o7kHcpEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745894756; c=relaxed/simple;
	bh=Ci4h72wZKP6mJR4jKzbM/tBHpynbWTtO67r1MJP0opY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L+c9jedU0sOAnPGqoGTOjgqYDCbHIIFtOCq1sqqA84LkLaYqJXcrBy+LtwRt57F6YHMF9yZLorl2Yl4UUepXqVW8JLMhQsQ2ft4Gz9CnnlKc5eG4PThnydlAzqidwgqj2nxQmznoM5B8qYhD4c+BN502FZy4sjqXJk+XnXMMSac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WSzQfY90; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745894750;
	bh=BmbqdQNAhSoA+47d9GZWMVZmPLzHY9c8h9oax+oZ/kI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WSzQfY90JwXVarLlh1NGq0FhF4uezYb+ixPBOqU+oy0dZCN9I2nQPqxYT+L23i23P
	 FhwBLKSwEjl0FB0vIfmgsjyKYG+ofg0wpfn3QSBNOC5qeW6gQXAOduizlFVY8RenjI
	 MLFAZBXg5p91l9hMpXh47jkIlh6zNaCEkg/U4wcyqyClHG7lgfOjKEz+iE7RMLEIpy
	 Dsaki3Z24s9tXe0nRhxsYqUSDNe3AtgKuMC4TktWAKyQx+lt1FDOiX/Tuo8oDH3jIc
	 AzC2LeZGgIzCNh15ndPPozh+81dAo8aNdsD3y9z1g+leUWgaUXzEACENzzFffEGXOE
	 Swsq1+janEqFQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zml716nhMz4x5g;
	Tue, 29 Apr 2025 12:45:49 +1000 (AEST)
Date: Tue, 29 Apr 2025 12:45:49 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Asahi Lina <lina+kernel@asahilina.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-nova tree
Message-ID: <20250429124549.0c0d8b91@canb.auug.org.au>
In-Reply-To: <aA9F2_yyIGqLFWKU@cassiopeiae>
References: <20250428142436.4579b115@canb.auug.org.au>
	<aA9F2_yyIGqLFWKU@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Mzr7zkrfPkS+Xutfzc76e8p";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Mzr7zkrfPkS+Xutfzc76e8p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Danilo,

On Mon, 28 Apr 2025 11:09:47 +0200 Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Mon, Apr 28, 2025 at 02:24:36PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the drm-nova tree, today's linux-next build (KCONFIG_NAME)
> > failed like this:
> >=20
> > x86_64-linux-gnu-ld: vmlinux.o: in function `rust_helper_drm_gem_object=
_put':
> > (.text+0x1b6cd15): undefined reference to `drm_gem_object_free'
> >=20
> > Caused by commit
> >=20
> >   be8d1a24798f ("rust: drm: gem: Add GEM object abstraction")
> >=20
> > I have used the drm-nova tree from next-20250414 for today. =20
>=20
> This issue was caused by rust/helpers/drm.c not having the required CONFI=
G_DRM
> guards.

So the build was x86_64 allmodconfig, so CONFIG_DRM=3Dm.  The build works
now, thanks.

--=20
Cheers,
Stephen Rothwell

--Sig_/Mzr7zkrfPkS+Xutfzc76e8p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQPV0ACgkQAVBC80lX
0Gz/IAf/Qwque3pUvElg/e1VmVI3sJD/hNzayiKHC6VQOR+bgBG7NSH7pgf8j8u9
x57GYGEQRI2iasU7dIvIb/PweeitdiF/eUXLtqI33Tn+E4rj7NBO/a+EqJvUucXY
6V2ZfQLCS9iIXtx/j1Y4jsGtUga1x9Q1AlK/ntVSW1TeiPSxXw4vP993FUMGlJzV
qnexaI7JB95GL8SF5oCLVo3twcOfhgODIDKIzdUrWuAWGM47g3sqUliJKksMWxNm
sgrQXO3Z5ieS5e14DcLu+JsGWZqhgcqig3hAHa5rebXdpOS92932AydfZfGFMf1T
u2E6jC7usbWrHHmlnNrZpPH02Xp+yA==
=kewy
-----END PGP SIGNATURE-----

--Sig_/Mzr7zkrfPkS+Xutfzc76e8p--

