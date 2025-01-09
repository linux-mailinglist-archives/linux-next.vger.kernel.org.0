Return-Path: <linux-next+bounces-5114-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EE6A06DAF
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 06:41:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29ADA160133
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 05:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 355AC2144BB;
	Thu,  9 Jan 2025 05:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="e4XzP0Cu"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5541A143888;
	Thu,  9 Jan 2025 05:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736401312; cv=none; b=tqcPn/NmmY9baAYKc7V/cp6iF7od7jgmZIK5mJMidoeRY8caE9uWnMqGkgePb9vgxV5LVKL3uf73GYsdypv4Vn07MU1/IvlLrwhG319O9KbeX+O++lrMl4521Ywzj1V2bRjjYK1t6xPGEN0tdLA6xUItaERrExwo7YyQ0qR+wVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736401312; c=relaxed/simple;
	bh=kl102T50SS4o8SSttfNPM1BWm3Cvayg/j2Oewud2A9U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjZPNuZHOxuVXAoguQwlmgZinSSmhglAWOkOc4IAx0O9W7uFqzAPI87e9eQWSIFc+hAQBhBLbKNTrkkToMPdz/ljskcylgvmGf8x3RaQ46noI8GRbx3/2+atbQYakHGQt7lphhU3gHVY9rA8cQolwKDLnR1VaYjcRscXxZz2zHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=e4XzP0Cu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736401297;
	bh=f6Sw4MAxXlgz0pR/RQDRmbvPhWxR3e2PeXOJs2luinM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e4XzP0Cu1z5NLUNHcmWDvgub19QoVIavDXkHgyr7mRORdEOqwrOtfxbHtm2uY+CDU
	 QZtlEZLLFclyxgvrZ66vL2aU45ACL9eOPSfoThUeU7pDVB89Ih/7EyIenPDv7K186n
	 YNqyI+S2N7MyrDkfJ/tvhiULjpof5QK9f3IzTpRCD2UGp7XmX2jpR/i4fem+Xg2wf+
	 f80JsjcGbioncCXgHABUY1L5XV2rEVCoX7/zsVYKOsPPsk3bL/trb+iGtPXE1CPwti
	 lhWY/YwW6BWdoFs8dqJLhNPQf52MgPnJB7lQWmPtMCK+iwAfEiS0IGi7bnsGj5hIqv
	 z9OBZao6Ax75Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTDDc3CnPz4w2M;
	Thu,  9 Jan 2025 16:41:36 +1100 (AEDT)
Date: Thu, 9 Jan 2025 16:41:42 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>, Jani Nikula <jani.nikula@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Matt Atwood
 <matthew.s.atwood@intel.com>, Matt Roper <matthew.d.roper@intel.com>, DRI
 <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-xe tree with Linus' tree
Message-ID: <20250109164142.07cd8023@canb.auug.org.au>
In-Reply-To: <20241216183801.0d5c9a5f@canb.auug.org.au>
References: <20241125120921.1bbc1930@canb.auug.org.au>
	<20241216183801.0d5c9a5f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yXwjqy1v8zCMpHf2Pl8=x_s";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yXwjqy1v8zCMpHf2Pl8=x_s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Dec 2024 18:38:01 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 25 Nov 2024 12:09:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > Today's linux-next merge of the drm-xe tree got a conflict in:
> >=20
> >   include/drm/intel/xe_pciids.h
> >=20
> > between commit:
> >=20
> >   493454445c95 ("drm/xe: switch to common PCI ID macros")
> >=20
> > from Linus' tree and commit:
> >=20
> >   ae78ec0a52c4 ("drm/xe/ptl: Add another PTL PCI ID")
> >=20
> > from the drm-xe tree.
> >=20
> > I fixed it up (I deleted the file and added the following merge fix pat=
ch)
> > and can carry the fix as necessary. This is now fixed as far as linux-n=
ext
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> >=20
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 25 Nov 2024 12:05:38 +1100
> > Subject: [PATCH] fix up for "drm/xe/ptl: Add another PTL PCI ID"
> >=20
> > interacting with "drm/xe: switch to common PCI ID macros" from Linus'
> > tree.
> > ---
> >  include/drm/intel/pciids.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> > index 32480b5563db..7883384acd5e 100644
> > --- a/include/drm/intel/pciids.h
> > +++ b/include/drm/intel/pciids.h
> > @@ -829,6 +829,7 @@
> >  	MACRO__(0xB092, ## __VA_ARGS__), \
> >  	MACRO__(0xB0A0, ## __VA_ARGS__), \
> >  	MACRO__(0xB0A1, ## __VA_ARGS__), \
> > -	MACRO__(0xB0A2, ## __VA_ARGS__)
> > +	MACRO__(0xB0A2, ## __VA_ARGS__), \
> > +	MACRO__(0xB0B0, ## __VA_ARGS__)
> > =20
> >  #endif /* __PCIIDS_H__ */
> > --=20
> > 2.45.2 =20
>=20
> OK, so commits ae78ec0a52c4 and 493454445c95 were merged in commit
>=20
>   8f109f287fdc ("Merge drm/drm-next into drm-xe-next")
>=20
> but include/drm/intel/xe_pciids.h was not deleted (it is not longer
> referenced anywhere in the tree) and the above patch was not applied :-(
>=20
> Since then that part of the drm-xe tree has been merged into the drm
> tree in commit
>=20
>   bdecb30d579e ("Merge tag 'drm-xe-next-2024-12-11' of https://gitlab.fre=
edesktop.org/drm/xe/kernel into drm-next")
>=20
> So, include/drm/intel/xe_pciids.h needs to be removed from the drm tree
> and the above patch applied there.

Ping?
--=20
Cheers,
Stephen Rothwell

--Sig_/yXwjqy1v8zCMpHf2Pl8=x_s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd/YZYACgkQAVBC80lX
0GzvnwgAgNkJzbDj5gapAk8StTFF3CT3b2Vn2mLZo7V8/4IQxO/9uEdgVUmDvdV+
K25/ikWw26DPnSU4dI+j1BxTMzBHKr6kfOGtm520Wpuy+GcColN/0zxqnP8JGB2h
AmjTBM6efrBx9K6jIhc761DmGffICzxPLV86VidDsQ/1cHhg9Quw1E1TGDIt3e1G
mKBDuJOMrwltb4g662JCWrY4x3NCgHGB7UeyNFoaMKbK+jaNlasbHwHQvPNhTCc1
USKrBiaa5uVea0rOHd0MMaAHriVHob5T/+Fol1OFtu64R8KbRzcY9Bgca5OlRBE4
1TGUdbCJSTruLHLzEt/xKzuD8EqG7Q==
=EeeT
-----END PGP SIGNATURE-----

--Sig_/yXwjqy1v8zCMpHf2Pl8=x_s--

