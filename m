Return-Path: <linux-next+bounces-2336-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C74AB8C70FB
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 06:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE7AE1C22A57
	for <lists+linux-next@lfdr.de>; Thu, 16 May 2024 04:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891A4FBF3;
	Thu, 16 May 2024 04:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b="Y71SZzMK"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.rothwell.id.au (gimli.rothwell.id.au [103.230.158.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8832F9CF;
	Thu, 16 May 2024 04:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.230.158.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715834638; cv=none; b=ht8VZ6eqYvqB1wyhZTaTJ+WOkPAWmG8tq1p4Mcdf8l9e0+si8eiqDL/oKOKHP/310pIeE5aZx3jVBdxN/de73VQemEm5S61OJzY6/8d96WpzIgiYSBIhOzqFYXvBep/2YSkR8M5Xl1/L1AcIkad4gdP6FMyDShBR61rGMAIHcPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715834638; c=relaxed/simple;
	bh=r1kOvfgIYROHWlLOWok8nOUpUvblp7y8+UA6RrmiDLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UwJStwRHThbrw7eyfxYvDZXJgmRyC6dqqbRi6qa2fyrS0zp/5TOgCMI6o6Gcf5pUAHsd8O5ebQvETG28nXqMTlgInaFGXrZCQ75YXjTh5ZGK776My/fWdFFOVTdw1KkGC1BB4d8NPrQphqNhqRK7bKtWFILcnTG0AiaWS+m+PvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au; spf=pass smtp.mailfrom=rothwell.id.au; dkim=pass (2048-bit key) header.d=rothwell.id.au header.i=@rothwell.id.au header.b=Y71SZzMK; arc=none smtp.client-ip=103.230.158.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rothwell.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rothwell.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rothwell.id.au;
	s=201702; t=1715834180;
	bh=r1kOvfgIYROHWlLOWok8nOUpUvblp7y8+UA6RrmiDLY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y71SZzMKdNFi775gwXxXQZntcsEzWtoVGOTUG5yNXVlDLCfBWHVFOjfF9lrhTKObR
	 zWA5kOBA+5xP90d/ObePZi8BufFHwGrkhvOjNa8UhtYsDOQUXNH26cTeulASLhduTI
	 AyQNYfJ7XRX/7E4CHPiU5EQF4yk8yuFMKtlAUNpx3m3n0H6aVPWGkte6shEQGVZ8uz
	 bKQFAO//OtvPlcTLQGCg6F4LlaTWrhLR9D9/ei3sdCWmkDp8fYr3kDFeWqKUxUBW6H
	 UCoalryUFWvtD0cCVMV5dN9jsUCvdXLsPj7b/bwo1bxh9Dw+vHePp2hv/uS79DzpG2
	 gpaKQqPlg7YqA==
Received: from authenticated.rothwell.id.au (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.rothwell.id.au (Postfix) with ESMTPSA id 4Vfy354RHgz4L;
	Thu, 16 May 2024 14:36:17 +1000 (AEST)
Date: Thu, 16 May 2024 14:36:12 +1000
From: Stephen Rothwell <sfr@rothwell.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the powerpc tree
Message-ID: <20240516143612.1a369133@oak>
In-Reply-To: <87cypmwk92.fsf@mail.lhotse>
References: <20240515163708.3380c4d1@canb.auug.org.au>
	<87cypmwk92.fsf@mail.lhotse>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8=rEbHDsm_Vfaw.dcRcMzja";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/8=rEbHDsm_Vfaw.dcRcMzja
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, 16 May 2024 12:42:01 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> >
> > After merging the powerpc tree, today's (it may have been yesterday's)
> > linux-next build (powerpc allyesconfig) produced this warning:
> >
> > WARNING: modpost: vmlinux: section mismatch in reference: fadump_setup_=
param_area+0x200 (section: .text.fadump_setup_param_area) -> memblock_phys_=
alloc_range (section: .init.text) =20
>=20
> I don't see the warning, but clearly it is possible if the compiler
> decides not to inline fadump_setup_param_area().
>=20
> What compiler version are you using?

$ gcc --version
gcc (Debian 13.2.0-7) 13.2.0

(on zz1 if you want to test)
--=20
Cheers,
Stephen Rothwell

--Sig_/8=rEbHDsm_Vfaw.dcRcMzja
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZFjTwACgkQAVBC80lX
0Gz/qgf/UJFGAJa8YAH/RLjgrt44P6TQj7A0baJl0AhyJHCh4vSoeUKU76gt1a4y
yLMDSLtS8ar9pHKQO1+HAVEaboun2nieyDDoM6qDeyw0Pywm58+r5XjeSxEGOEfb
5QPKnGihFEbxxoU2RQjIpT9A4Jk6X9P4gILdcy9EtFSvIK0OG6PgIIaisQCfUWnT
fSjvKKSKcFsz/vRMIvr5rTPXgIUHSyMC93h1cSKv4izciaeGxvmup/iu8FPS7Txl
MTUDFpDINHJOLG82u6CedDXuqlOcCBgtYXBvmCkIH/dEfGeVjevDwokpbrFjk3qC
GGjpxOLqlbzxgqp9o2c7Qs4YG1F0/Q==
=MM25
-----END PGP SIGNATURE-----

--Sig_/8=rEbHDsm_Vfaw.dcRcMzja--

