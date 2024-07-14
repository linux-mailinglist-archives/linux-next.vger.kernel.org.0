Return-Path: <linux-next+bounces-2992-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B304A930C1C
	for <lists+linux-next@lfdr.de>; Mon, 15 Jul 2024 01:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39B7EB21321
	for <lists+linux-next@lfdr.de>; Sun, 14 Jul 2024 23:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E37273F9;
	Sun, 14 Jul 2024 23:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="huDujaUa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2BC15C0;
	Sun, 14 Jul 2024 23:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720998464; cv=none; b=GZq3kzKMGjX1NxFK0vz/wWgGIZNWnq0+BPv64amX2PSGoYvqN/cWDf2kabSsFZBPZHzRZdlyzzzn4tO1dbujJlmnRRURKScIIZYcdt6C8s65c1+MqONRPEk/IKtsRoXZV4ljgql1PopeyLbeROFTfLWjTahTTd/8JIVRhPBcPrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720998464; c=relaxed/simple;
	bh=9K2ZbZwmh1oXagWpEpjanIdDZD/9/gYIpAxAfW621cA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0dczVbU/B9drJzhhDXXK2IiArUHz5ISDwyomAKV5QZz274wlCydfs3Q2vLVRRthh8Mnu0aQrHTQ7jjUttqohd2WMl2kpzV5QU0qI2LytIWZKApWvy7jk8j39HQDJ0b0NmySdKw0+bCyAk0QyvpsuhDDwWGBs3lQ4wIqvh8E2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=huDujaUa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720998460;
	bh=iRAdv3RafCzDHqJWMxlzyVN+MTslTElmdFKmtPA3lqU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=huDujaUaBncLLCiHwO06zxz70Q+dSDm93Aca23lbK4JpmK3xJqITzMtzRck2XSMap
	 MFYWbzxd76PJIPoz3QfXfCSON/srkVuWO2r7xdNccas51CDGvkMJMMUl+/rsqTY64q
	 B3H98BmpBvks6VDurNH7ar+MTEqkTvCXTU2x85RlJ+hC1hN2TAoStY4sb5MpFhM+09
	 SmGJY3tfHc/b7UW+xEPnBs2v4u55sNZuotm1drfMW3ovU2Cqv01Voucq0lvb7Llo19
	 eo7wtAXxThzQJBdAHL0Eqb10sHgrybP1W5ODblO8UyX+tESatOMfCFNY2M3x7mKzON
	 zwX8Y6zDaUUKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMgwD07SYz4w2Q;
	Mon, 15 Jul 2024 09:07:39 +1000 (AEST)
Date: Mon, 15 Jul 2024 09:07:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, Alex Deucher
 <alexander.deucher@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240715090739.0393c3db@canb.auug.org.au>
In-Reply-To: <20240531152636.1b58caa0@canb.auug.org.au>
References: <20240531152636.1b58caa0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6Ion2i2riJfqEER_C_lKWJn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/6Ion2i2riJfqEER_C_lKWJn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 31 May 2024 15:26:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:586: warning: Function =
parameter or struct member 'bb_from_dmub' not described in 'amdgpu_display_=
manager'
>=20
>=20
> Introduced by commit
>=20
>   234e94555800 ("drm/amd/display: Enable copying of bounding box data fro=
m VBIOS DMUB")

I am now seeing this warning after the merge of the drm tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/6Ion2i2riJfqEER_C_lKWJn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUWjsACgkQAVBC80lX
0GzXegf/WOAHAywBc27WyA1dJa8wFcRR1PrwJLp8oGyuJiFu53zgdOCmStmpxV1q
0K3+03LMuRp4pMnxw3zEZTrPcTq4MP3tXZtPRwAkHZFVE84XmfxNtdWpoSkQ5O3h
yc49fKctWfBUfJ1jxbFsOXwwUneKpyYuQENhpadkfgjiklyNv+qLqk9JOebwbZVE
P4By8YaHl13VcLCiV9129zBYLHv88AA+MhfZH6FXw3+ndbWSqLdnygM/8NuvH89e
YIYxmheK0lgV0mu3vgtXlr81SI9TvrNvUXGOnzebKlylhee2PZJQ69FegCTo9mAH
BnNGJpGhppu6OCxCsMLn97q+jnaQyQ==
=ajeE
-----END PGP SIGNATURE-----

--Sig_/6Ion2i2riJfqEER_C_lKWJn--

