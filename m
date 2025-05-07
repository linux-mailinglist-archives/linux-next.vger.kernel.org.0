Return-Path: <linux-next+bounces-6558-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 511B0AAD282
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 03:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AB613BD652
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 01:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D227261D;
	Wed,  7 May 2025 01:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pMl5no00"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D5376;
	Wed,  7 May 2025 01:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746580237; cv=none; b=t972CEqyEsb+JdIAcIVGF4i9N9nQlbHNbHpKacZh9ndqhDF/X3U5mR8JjbQYZ1s+/pCFFgpu/qty9CUUc8PVvdhVwAGgaU3hYOS5qJJ4oEz+0iCydecCXkjZ/MdJktHZFCjcjTlFb+vyok6F1TvIylN5IGBPeuZB1ciHx/OMh2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746580237; c=relaxed/simple;
	bh=GJIxEVmvyappFD+aCQGBgjhjBYEnZBSzBDsOTZvmSfo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s27gZaGnTC6WuuTM/nvYK1bDCYrBvnyIJQrehhvMJgny2WQ7tzIxXSndOpu1Y0rBv0NybYdfpVo3W6z0sUEAtPrnEBQEaEQeWeA37YoRBvpPz8Hly5aYmVTU8CeHmWIzVcvgA35eAbtX+vIuloP69G1lEUhY0UbmbdAgw3pYmuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pMl5no00; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746580229;
	bh=Hajpg+Y+6AJdBgcA0H9LbivzwOoCAaYgGVzxYVKZQ5A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pMl5no00P3YZ4u+4WU5lMzv4fauA/DYuOe75PI1ElMhaPgUHQt24uJP4wPbtViZaB
	 bILVuy4EVcKP9ccxJWAnXLEljUcxcWnjzOyP50jXf/GUAFrppEMEdevtWEC/A1zvpP
	 R7j5koak4neOkXzkn9qaH9RycrlcPhk524N3DPSYKeje67M1CIp+7HlSKWBKGwBlH2
	 +Q2Yha31rifAksu1LXovxBPRacDi62pv0FyGsU9azcg2BxTPSVMO3bw6ozELWfLgVb
	 ZCflA6YtwNEOwOfnB9edYFX+b1TPiFJxloxnShOG+c2g3xOyt0d9tSfhUtUmINxpUa
	 ZxiZ3hQErbYNg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZscdJ6W2hz4x89;
	Wed,  7 May 2025 11:10:27 +1000 (AEST)
Date: Wed, 7 May 2025 11:10:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Miriam Rachel Korenblit  <miriam.rachel.korenblit@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the iwlwifi-next tree with Linus'
 tree
Message-ID: <20250507111026.4700e392@canb.auug.org.au>
In-Reply-To: <f53576b21774ab6ba8294c5d1954f0528764f2fb.camel@sipsolutions.net>
References: <20250506114402.2f440664@canb.auug.org.au>
	<f53576b21774ab6ba8294c5d1954f0528764f2fb.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Yb5cvjMZCotI4lJvO_G6a=Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Yb5cvjMZCotI4lJvO_G6a=Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Johannes,

On Tue, 06 May 2025 08:26:31 +0200 Johannes Berg <johannes@sipsolutions.net=
> wrote:
>
> > Today's linux-next merge of the iwlwifi-next tree got conflicts in:
> >=20
> >   drivers/net/wireless/intel/iwlwifi/cfg/sc.c
> >   drivers/net/wireless/intel/iwlwifi/iwl-config.h
> >   drivers/net/wireless/intel/iwlwifi/iwl-nvm-parse.c
> >   drivers/net/wireless/intel/iwlwifi/iwl-trans.c
> >   drivers/net/wireless/intel/iwlwifi/iwl-trans.h
> >   drivers/net/wireless/intel/iwlwifi/pcie/drv.c
> >   drivers/net/wireless/intel/iwlwifi/tests/devinfo.c
> >=20
> > between various commits from Linus' tree and various commits from the
> > iwlwifi-next tree. =20
>=20
> Yeah, no surprise, there were some reverts in this area. The good thing
> is that we also already fixed the bugs that necessitated the reverts
> differently, so (eventually, need to check how much is in there now)
> this will just be "take next".

So, at your suggestion, I just used the latter versions of these files,
but I then got the following build failure:

In file included from arch/x86/include/asm/bug.h:103,
                 from include/linux/bug.h:5,
                 from include/linux/fortify-string.h:6,
                 from include/linux/string.h:392,
                 from include/linux/uuid.h:11,
                 from include/linux/mod_devicetable.h:14,
                 from include/linux/pci.h:27,
                 from drivers/net/wireless/intel/iwlwifi/pcie/trans.c:7:
drivers/net/wireless/intel/iwlwifi/pcie/trans.c: In function 'iwl_trans_pci=
e_reset':
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2337:29: error: 'IWL_RESET_=
MODE_BACKOFF' undeclared (first use in this function); did you mean 'IWL_RE=
SET_MODE_REPROBE'?
 2337 |                     mode =3D=3D IWL_RESET_MODE_BACKOFF))
      |                             ^~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
  123 |         int __ret_warn_on =3D !!(condition);                       =
       \
      |                                ^~~~~~~~~
drivers/net/wireless/intel/iwlwifi/pcie/trans.c:2337:29: note: each undecla=
red identifier is reported only once for each function it appears in
 2337 |                     mode =3D=3D IWL_RESET_MODE_BACKOFF))
      |                             ^~~~~~~~~~~~~~~~~~~~~~
include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
  123 |         int __ret_warn_on =3D !!(condition);                       =
       \
      |                                ^~~~~~~~~

So, today I have merged the iwlwifi-next tree from next-20250505 (which
was effectively empty).  You may want to try merging the iwlwifi tree
into the iwlwifi-next tree and resolve any conflicts yourself (now that
the iwlwifi tree has been merged into Linus' tree).
--=20
Cheers,
Stephen Rothwell

--Sig_/Yb5cvjMZCotI4lJvO_G6a=Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgaswIACgkQAVBC80lX
0Gxe9Af/e5hOWEg6Ll6qe/QYK5ItUHxzFuX3z+ez5IKNTHeijdi6lSUJJD2/Ef//
u9syr28EHVJkjBg2GmsHQiAUW3yxtUvwJZE41u9HSgcT6d+LTh2aL3N5ELgT53KC
LbZuKTpGlIpxNJLWx/1XFohy6ruyLqgSLN2JwRxLJ9vpgZE6ajgivg9RNbJ2SZJL
OEfy0BT06osZDqLRW4ZV5fOWJ6YFcprtDQ/F+MF9038gyZXb+vwUN30XtZQaLEGr
HSmOS2SSeOsXj0iZaUh0TCBqW4V5CTw9ZNYAj9uuginTy8jDyRr5kMiTXrokFTnT
R/LeNr4/v0sxTEUhiPF54LrfusRNLg==
=95QZ
-----END PGP SIGNATURE-----

--Sig_/Yb5cvjMZCotI4lJvO_G6a=Q--

