Return-Path: <linux-next+bounces-7909-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1BBB21BA5
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 05:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA8F8188B702
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 03:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC09C189F5C;
	Tue, 12 Aug 2025 03:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R67qNNE3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0235D2882CE
	for <linux-next@vger.kernel.org>; Tue, 12 Aug 2025 03:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754969137; cv=none; b=cy12QT9eL49GBgMbWEEklXcs8LfehHrXSxrASIJwyp2JhsB23oamwApT8pCoFJczG6A7LVVapnGC2Di8L7dwRvuwGiQk+d/AxtBV0cxM53eAaZ+4x/Q6esfdCDgOVieXu+0XPqWVH8yyg4ck+nI66D8kJPfXTDTJTqk14m5+rBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754969137; c=relaxed/simple;
	bh=oh3/V4dA+0v3cOVL0zenzJ7GsKbVpDvqrGv5pEAO+Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ozryw5CwN7QsuuYA88J6vHeglCF93ZLoXID8S6DVdlpZRMc9LNxmLSb/FltdgzRrOZUp49AefchTsHOTiGuV8EF+SSH7G6qi7FAVIXTTzvpJgE2aTeHdiTxOWkxudTnawx9gmYdzLf9kK6fCjXth0xNZXKLQGHpRF67OwGIy7Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=R67qNNE3; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754969132;
	bh=L2z+znZyyoi+9OktLbbAjlOC4KE/UrrdfjmwfapEs60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=R67qNNE3uAE3JfVIovGpzvYRXDwE6vk6tgQ8ER1As3DQwLI6uk7cHVgqBXhoc7ofe
	 Km1/veN4bjISnGpLSEA7TyCrzBiBvp/y21zb9gUJKSn2ort01UpascCnvyVWY/aXbC
	 ZsiLRrT+CU4+AJFdQ9xYGUb33quLQA9tjQjJ4TQs7nK7MQ0ax5FrgQ3qiM+8rIcRi8
	 BL9PJFBKAssM2zaCNyE7XtVbSaqcg7WpA6QSFxKbVGWYrqShWhWvHRwG0eQsI4uOvZ
	 JPoL1jUsbTmdByvuXUIMcFF/xLDx1AnnehgCNSgLk4kdPW0VhoCYLbJLYLYpQNpBIz
	 Z60Fpk+SQb1MA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1H2M5JrLz4xcZ;
	Tue, 12 Aug 2025 13:25:31 +1000 (AEST)
Date: Tue, 12 Aug 2025 13:25:31 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Reza Amini <reza.amini@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Cc: KernelCI bot <bot@kernelci.org>, kernelci@lists.linux.dev,
 kernelci-results@groups.io, regressions@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org
Subject: Re: [REGRESSION] next/master: (build) the frame size of 1448 bytes
 is larger than 1024 bytes [-Werror=fr...
Message-ID: <20250812132531.3012f3f7@canb.auug.org.au>
In-Reply-To: <20250805221946.6b8e0a42@canb.auug.org.au>
References: <175437354419.1010.14815981800290011272@508e4dbc6f9f>
	<20250805221946.6b8e0a42@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/iy=iDwnNrrMkmv5qyTjEL8k";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/iy=iDwnNrrMkmv5qyTjEL8k
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 5 Aug 2025 22:19:46 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Tue, 05 Aug 2025 05:59:04 -0000 KernelCI bot <bot@kernelci.org> wrote:
> >
> > New build issue found on next/master:
> >=20
> > ---
> >  the frame size of 1448 bytes is larger than 1024 bytes [-Werror=3Dfram=
e-larger-than=3D] in drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dc=
n10_hwseq.o (drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwse=
q.c) [logspec:kbuild,kbuild.compiler.error]
> > ---
> >=20
> > - dashboard: https://d.kernelci.org/i/maestro:4d4120bf99fecc5f852604382=
b7c406b99440116
> > - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git
> > - commit HEAD:  afec768a6a8fe7fb02a08ffce5f2f556f51d4b52
> > - tags: next-20250805
> >=20
> >=20
> > Log excerpt:
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:608:1=
: error: the frame size of 1448 bytes is larger than 1024 bytes [-Werror=3D=
frame-larger-than=3D]
> >   608 | }
> >       | ^
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_h=
wseq.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_i=
nit.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_hws=
eq.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_ini=
t.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_h=
wseq.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_i=
nit.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_hws=
eq.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_ini=
t.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_hws=
eq.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_ini=
t.o
> > drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c: In f=
unction =E2=80=98dcn10_log_hubp_states=E2=80=99:
> > drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:447:1=
: error: the frame size of 1156 bytes is larger than 1024 bytes [-Werror=3D=
frame-larger-than=3D]
> >   447 | }
> >       | ^
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn351/dcn351_h=
wseq.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn351/dcn351_i=
nit.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_h=
wseq.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_i=
nit.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/irq_service.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce80/irq_servic=
e_dce80.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce110/irq_servi=
ce_dce110.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce120/irq_servi=
ce_dce120.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn10/irq_servic=
e_dcn10.o
> >   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn20/irq_servic=
e_dcn20.o
> > cc1: all warnings being treated as errors
> >=20
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >=20
> >=20
> > # Builds where the incident occurred:
> >=20
> > ## defconfig+kcidebug+x86-board on (i386):
> > - compiler: gcc-12
> > - dashboard: https://d.kernelci.org/build/maestro:689185f279d5d217e5430=
785
> >=20
> >=20
> > #kernelci issue maestro:4d4120bf99fecc5f852604382b7c406b99440116
> >=20
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> >=20
> > --
> > This is an experimental report format. Please send feedback in!
> > Talk to us at kernelci@lists.linux.dev
> >=20
> > Made with love by the KernelCI team - https://kernelci.org
> >  =20
>=20
> Presumably caused by commit
>=20
>   e63e9f8b3d1c ("drm/amd/display: Fixing hubp programming of 3dlut fast l=
oad")
>=20
> from the amdgpu tree.  Just making the two new pLabels arrays "static"
> (and maybe "const") will probably help.  Maybe declaring them "static
> const char *pLabels[]" ?

Ping?

--=20
Cheers,
Stephen Rothwell

--Sig_/iy=iDwnNrrMkmv5qyTjEL8k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiatCsACgkQAVBC80lX
0GxVMgf/YhuBd3FES8a3zhQzqi/KEuf83u63Db849vipdqiE1/UEKyPWil/0l6jt
1ZhPIrAjXmAW0i4uh6qJLi3e20xc7X6S1SLcyI7JS1kscPYH3hCd5xYX0eHkAl/S
8Dhe/UycqUYL2Aq7wscf3kUQ8B6zEPYaxYVVV64DQIX9PQ1OGZSwKgGwK+9lxrX1
Ycec7inR8HKPPdoFj0dTt4zJWxzw9/9joYAyyAdDfohdePJFfziz8aUu6dDmqbo+
dGRMEpbmtyyAVa9Ti0sL/HnrvP7/3bRsK79xA/IPunDA0F357jASnu44XxdbEGcB
Y78qJ36QyWe4unYXAgv79SnlslFqcA==
=UKgg
-----END PGP SIGNATURE-----

--Sig_/iy=iDwnNrrMkmv5qyTjEL8k--

