Return-Path: <linux-next+bounces-7853-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C374B1ACCE
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 05:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DF91189EE87
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 03:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA6E16F8E9;
	Tue,  5 Aug 2025 03:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dgJTap4T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB366ADD;
	Tue,  5 Aug 2025 03:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754364980; cv=none; b=Fo1MXSy+d2ZrvAYlgx1DEPjUC1dYqA4Wcst/ugf1vLpAtavW2kNF/TJh0r8+UMaKZerxfJd0T0NxPYdbfS98QKLoQEBvP25KHy6tJf6roPZUJqspF8VpifO2YbM8HDneDu8Drawab38dbeP+AacpFkg2AiNRzGlMOLjN17Dp5Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754364980; c=relaxed/simple;
	bh=JC65SuDE9wcuFfXKbi+CenmWs+rLOpbcuZelsp2hjrA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d3Db9pLQOCPp0kzKLeraIOrbGvqeXfeT3wJk6KSe8xjsPhUuRNtboM32+JfQ3hnjV6t1tnsgzRAdX734KB9R7GgCpIJuoDGyHrJvrzFOLkEqwr6p38DrZy/9fvGoWd9QQDfeFJzWuGAdpH6jN/Svah9MuPHHpvYjFsHRIpCO9y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dgJTap4T; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754364976;
	bh=JC65SuDE9wcuFfXKbi+CenmWs+rLOpbcuZelsp2hjrA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dgJTap4TnxyJqLFAK2amUbuB2XDG/FpQzjxrVog7EV02ZtwUhxAlCXtKF/aHUCtIM
	 X4Peb4p2k2YKJU9KGsK+s2Eq4nwmRgNzuw/4TqsyQeLj2xl+GfDNl4BK2bHMXGPbAv
	 eFZCnHpO+3SetuWMwVPYaodAchdWmT/pSzg6JgYNaiz8N1NCaBZy6coFXcsTtQNuo5
	 SBMcd0hEX1eEdG8iubnizMnWxQjyICEX5gaEDSzssXrHtKApnrvTMjpwntiWmT20gg
	 O0G36/NB0UporCbGM8XQRj0sHXHsSW82QdSEkgFUA0tTnLQgbgc/ycDh4+GJ5yHWyq
	 KtovNpcHS0x9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bwzc05z5wz4wbY;
	Tue,  5 Aug 2025 13:36:16 +1000 (AEST)
Date: Tue, 5 Aug 2025 13:36:16 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-msm tree
Message-ID: <20250805133616.1e5eeb1d@canb.auug.org.au>
In-Reply-To: <20250708144409.73aec136@canb.auug.org.au>
References: <20250708144409.73aec136@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KkgFwJulEh+Ohh72IG19Ao5";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KkgFwJulEh+Ohh72IG19Ao5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Jul 2025 14:44:09 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-msm tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x43c: s=
ibling call from callable instruction with modified stack frame
>=20
> I don't know what introduced this warning.

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/KkgFwJulEh+Ohh72IG19Ao5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiRfDAACgkQAVBC80lX
0GzQ1Af+OU+mmKcVuZoNBwIpnuFCE5E9Nxd+vkvzP57CI0iaktjDijNDUO+45I02
2Ke30rRbvZCqQHzsEKQqDoQflpaCvP8C0UAKcz90FVCD7HLaE9u8SdgXLi3NAbdA
K3q6dcC++cG0fzcUCI/9kOM+Ncx7JcZXUOQD5NK5v6YcwAot615ZTvpX3wKXiPaT
sa5AXK1WsSmAnsGzwK1bUlZbUjeDFmtpiDLItVx+PnudpDuDzW7GJQ6SG3HL21Fv
bc5C1U7twrLGyaNSK6Fc5oUQiNavENY/YYT7yPgP9FiuRAVs+w/GBC38Ny3BlI7S
pQeaoI5L1QS2DmkHCIZi4JwXvIgG0g==
=QMMj
-----END PGP SIGNATURE-----

--Sig_/KkgFwJulEh+Ohh72IG19Ao5--

