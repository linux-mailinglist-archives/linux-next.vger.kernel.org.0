Return-Path: <linux-next+bounces-7857-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B492B1B35C
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 14:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 427217ADE30
	for <lists+linux-next@lfdr.de>; Tue,  5 Aug 2025 12:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9F82270568;
	Tue,  5 Aug 2025 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SKQSEjqI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB972749D1
	for <linux-next@vger.kernel.org>; Tue,  5 Aug 2025 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754396749; cv=none; b=G9nFUn6MhfVqNKX0vP6Z8sFifmXj3UU2wP1Fe5OvKmQeqiapzJJN6UShtcSvu8EhAPeIGWp0PVht8XWRZgE/v8yJWYEEKn7CroSV6WFwUH+b5iONs/06gzyyzEOb36qb887uEj+c4lb2LfTWVPLWxXeuvjKtoOLhmvMcyydnY5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754396749; c=relaxed/simple;
	bh=9uqag+0+Xegzr+l3svBjDjVLIzo35g9RdE8wlR/GZQU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SqVWQxqTfrmIjnK2vE95vJEU2E9KrhA/5p5FfeFjCaqNsRk+s//lO21dpa/SlACvJpbKeakDFR4FOwsNvTo6w+VL7QqhNDKKiim7JloHPKeMke12Kj6mAWwi7hjpm/WZ6EhEiWbfYrHFuj6q5jncY/4DEdfM6z3ftnlp1QdNs4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SKQSEjqI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754396391;
	bh=89aa+0VDBNvHlryLxy5mMqLpPniftwYq/dfu5JfPqyY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SKQSEjqIBN4TmNlTX7jape8XnXnJpGjHwxwtzp61KNUThPFAm2MwNAPN18DupEAYq
	 4v2wc4dzBh9I/+b0mWFYPcPRf+PuusfxGSsXLCAV/Chdofb7Cs7Ixh8MRouN5IRaai
	 kyuuXmibbuv7YLCxQ1k9DBlVOzjJxZb3EQO+AdLyKnaEN5mG0pvOvXW5f66e5/5gq2
	 63INV/sivRnletACxAeoxg5EdkLfZa5uHrxPcg9/cBFN7+VHm3EAypUyB/kH23YeTH
	 wWORwBGf4YwLZndBt3dmbTV7fFsEpPnQQzm4EcwhFd3TmEJegotVLOEfw89WVxJsAY
	 x7ApaZRgctm3A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bxCD72n1jz4wb0;
	Tue,  5 Aug 2025 22:19:51 +1000 (AEST)
Date: Tue, 5 Aug 2025 22:19:46 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Reza Amini <reza.amini@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Cc: KernelCI bot <bot@kernelci.org>, kernelci@lists.linux.dev,
 kernelci-results@groups.io, regressions@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org
Subject: Re: [REGRESSION] next/master: (build) the frame size of 1448 bytes
 is larger than 1024 bytes [-Werror=fr...
Message-ID: <20250805221946.6b8e0a42@canb.auug.org.au>
In-Reply-To: <175437354419.1010.14815981800290011272@508e4dbc6f9f>
References: <175437354419.1010.14815981800290011272@508e4dbc6f9f>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FTRV2MXrS//G=iarmlT=MuP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/FTRV2MXrS//G=iarmlT=MuP
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 05 Aug 2025 05:59:04 -0000 KernelCI bot <bot@kernelci.org> wrote:
>
> Hello,
>=20
> New build issue found on next/master:
>=20
> ---
>  the frame size of 1448 bytes is larger than 1024 bytes [-Werror=3Dframe-=
larger-than=3D] in drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn1=
0_hwseq.o (drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.=
c) [logspec:kbuild,kbuild.compiler.error]
> ---
>=20
> - dashboard: https://d.kernelci.org/i/maestro:4d4120bf99fecc5f852604382b7=
c406b99440116
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git
> - commit HEAD:  afec768a6a8fe7fb02a08ffce5f2f556f51d4b52
> - tags: next-20250805
>=20
>=20
> Log excerpt:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:608:1: =
error: the frame size of 1448 bytes is larger than 1024 bytes [-Werror=3Dfr=
ame-larger-than=3D]
>   608 | }
>       | ^
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_hws=
eq.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn303/dcn303_ini=
t.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_hwseq=
.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn31/dcn31_init.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_hws=
eq.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn314/dcn314_ini=
t.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_hwseq=
.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn32/dcn32_init.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_hwseq=
.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn35/dcn35_init.o
> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c: In fun=
ction =E2=80=98dcn10_log_hubp_states=E2=80=99:
> drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn10/dcn10_hwseq.c:447:1: =
error: the frame size of 1156 bytes is larger than 1024 bytes [-Werror=3Dfr=
ame-larger-than=3D]
>   447 | }
>       | ^
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn351/dcn351_hws=
eq.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn351/dcn351_ini=
t.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_hws=
eq.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/hwss/dcn401/dcn401_ini=
t.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/irq_service.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce80/irq_service_=
dce80.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce110/irq_service=
_dce110.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dce120/irq_service=
_dce120.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn10/irq_service_=
dcn10.o
>   CC      drivers/gpu/drm/amd/amdgpu/../display/dc/irq/dcn20/irq_service_=
dcn20.o
> cc1: all warnings being treated as errors
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>=20
>=20
> # Builds where the incident occurred:
>=20
> ## defconfig+kcidebug+x86-board on (i386):
> - compiler: gcc-12
> - dashboard: https://d.kernelci.org/build/maestro:689185f279d5d217e5430785
>=20
>=20
> #kernelci issue maestro:4d4120bf99fecc5f852604382b7c406b99440116
>=20
> Reported-by: kernelci.org bot <bot@kernelci.org>
>=20
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
>=20
> Made with love by the KernelCI team - https://kernelci.org
>=20

Presumably caused by commit

  e63e9f8b3d1c ("drm/amd/display: Fixing hubp programming of 3dlut fast loa=
d")

from the amdgpu tree.  Just making the two new pLabels arrays "static"
(and maybe "const") will probably help.  Maybe declaring them "static
const char *pLabels[]" ?

--=20
Cheers,
Stephen Rothwell

--Sig_/FTRV2MXrS//G=iarmlT=MuP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiR9uMACgkQAVBC80lX
0GynsAf/aC0QnO59J48o2kuKmTnJ/uh9mJTKPKwA/qWoVcnOpnlR9/IPZ+PLS8rM
qosMIkjXtQqEHGsmFy+/1vxFIs3jsN1fmVKoCS160xPXMkEFaL7ASZkjnHD6XrAu
ZHjAgNDOCTJhJSYPs4kK8Pc+3oKt/IwUbiwn0u3PwJJKJ13x2JSXf2RumJbYON0H
Dv78FbxqCDhiwhuV+l5bYS/+9VQZavamw5jL19Uqkgs9jprTMaInvGyiI037MVTp
bGQTHjDhgyOecT1rVL7uEFqDtNMgnWDCm46SClHesUXJOPHk3JsO3QAinUsz3yS1
mA6k86oVel0OJwKKwweFkHBEw1w4wQ==
=jTO4
-----END PGP SIGNATURE-----

--Sig_/FTRV2MXrS//G=iarmlT=MuP--

