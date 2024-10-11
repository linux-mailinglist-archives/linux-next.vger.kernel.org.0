Return-Path: <linux-next+bounces-4228-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E8999A0F
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 04:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 983DF1C2317B
	for <lists+linux-next@lfdr.de>; Fri, 11 Oct 2024 02:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A16B1EB9F0;
	Fri, 11 Oct 2024 02:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ff7clsSn"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76B11E7C35;
	Fri, 11 Oct 2024 02:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728612657; cv=none; b=qjU4k3VSCLLjDNAwxWRf63ujSlXFqGUVHut5BLDYX8OhwInWN4gkXQZoxPZulIBNjsPM0WgWZMKi7Drz95c75x9lUClUyLNzaczu7J15M+WI8BsF1ExxLidTCdeQMAxlHLGdL+63uiW35tgu+cmhWpLCCQa3dkK4fgBeSFR2uZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728612657; c=relaxed/simple;
	bh=7nnM+aCJSDVx7UEfk8B2G6Xw/chlOCqKlpazAUZnBJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LIqHi5H3HLvmI3/6b8WHBAr3jpfDG6zysN1ASw9bHFeJd6nX4wQkUYJUnqBv1p7GZzVed8NuIw6ra5kWOtO8uzzVkUejrrxzQwqDii0zJiYRIJs063+35FXHVsAyecxP7RDpg0TE65+DQgu7cX6KhL6kRCij3rYRs0bah6xVgAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ff7clsSn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728612647;
	bh=SD2VxmTCxFXyS73HTlXqtNjG87Nx1WLwRrvFIi82oaU=;
	h=Date:From:To:Cc:Subject:From;
	b=ff7clsSndCT+vBcjt+ep7cVVOsikySKc5RaS4QSnOHuLLEDk9hdDHD2Gt95kxMpGT
	 EDbkxP5fty7EKhrrSV2m9ezwNsEkU68ibiIyeW6JLMBnF1+cQzss4rDjthKjgJFC1i
	 9cGsrxHO4bvWLMTUfycuQ69iotUv8W1Kks54TXbYsAYbAQXafjZPMPm0LyyvO0GYfQ
	 Cn9VWtJVYezG+rG9ajd15pn8cGaj4OiZxUWHC2yDd2TO1ixOieybNVUixtmLe91EjF
	 nl++ivvWtLaUjy9FVqcZl/C+jBqAN/r2jblYzaalDhjP4CCFwrBPglI8qhCACItJ47
	 PsKVP5GTYIv1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPqpv3BCsz4xKS;
	Fri, 11 Oct 2024 13:10:47 +1100 (AEDT)
Date: Fri, 11 Oct 2024 13:10:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Takashi Iwai <tiwai@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound tree
Message-ID: <20241011131046.5eb3905a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9QX6ePWzLA1/zTjnNdHYZCv";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9QX6ePWzLA1/zTjnNdHYZCv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from sound/pci/hda/patch_realtek.c:29:
sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no me=
mber named 'name'
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                          ^~~~
sound/pci/hda/patch_realtek.c:10759:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10759 |         HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXU=
P_YOGA7_14ITL_SPEAKERS),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initia=
lizer
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                                 ^
sound/pci/hda/patch_realtek.c:10759:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10759 |         HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXU=
P_YOGA7_14ITL_SPEAKERS),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'alc269_fi=
xup_tbl[712]')
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                                 ^
sound/pci/hda/patch_realtek.c:10759:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10759 |         HDA_CODEC_QUIRK(0x17aa, 0x3802, "DuetITL 2021", ALC287_FIXU=
P_YOGA7_14ITL_SPEAKERS),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no me=
mber named 'name'
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                          ^~~~
sound/pci/hda/patch_realtek.c:10764:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10764 |         HDA_CODEC_QUIRK(0x17aa, 0x3820, "IdeaPad 330-17IKB 81DM", A=
LC269_FIXUP_ASPIRE_HEADSET_MIC),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initia=
lizer
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                                 ^
sound/pci/hda/patch_realtek.c:10764:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10764 |         HDA_CODEC_QUIRK(0x17aa, 0x3820, "IdeaPad 330-17IKB 81DM", A=
LC269_FIXUP_ASPIRE_HEADSET_MIC),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'alc269_fi=
xup_tbl[717]')
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                                 ^
sound/pci/hda/patch_realtek.c:10764:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10764 |         HDA_CODEC_QUIRK(0x17aa, 0x3820, "IdeaPad 330-17IKB 81DM", A=
LC269_FIXUP_ASPIRE_HEADSET_MIC),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no me=
mber named 'name'
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                          ^~~~
sound/pci/hda/patch_realtek.c:10779:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10779 |         HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", =
ALC287_FIXUP_CS35L41_I2C_2),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initia=
lizer
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                                 ^
sound/pci/hda/patch_realtek.c:10779:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10779 |         HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", =
ALC287_FIXUP_CS35L41_I2C_2),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'alc269_fi=
xup_tbl[732]')
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                                 ^
sound/pci/hda/patch_realtek.c:10779:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10779 |         HDA_CODEC_QUIRK(0x17aa, 0x386e, "Legion Y9000X 2022 IAH7", =
ALC287_FIXUP_CS35L41_I2C_2),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:58: error: 'const struct hda_quirk' has no me=
mber named 'name'
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                          ^~~~
sound/pci/hda/patch_realtek.c:10781:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10781 |         HDA_CODEC_QUIRK(0x17aa, 0x386f, "Legion Pro 7 16ARX8H", ALC=
287_FIXUP_TAS2781_I2C),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:65: warning: excess elements in struct initia=
lizer
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                                 ^
sound/pci/hda/patch_realtek.c:10781:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10781 |         HDA_CODEC_QUIRK(0x17aa, 0x386f, "Legion Pro 7 16ARX8H", ALC=
287_FIXUP_TAS2781_I2C),
      |         ^~~~~~~~~~~~~~~
sound/pci/hda/hda_local.h:312:65: note: (near initialization for 'alc269_fi=
xup_tbl[734]')
  312 |         { _SND_PCI_QUIRK_ID(vend, dev), .value =3D (val), .name =3D=
 (xname),\
      |                                                                 ^
sound/pci/hda/patch_realtek.c:10781:9: note: in expansion of macro 'HDA_COD=
EC_QUIRK'
10781 |         HDA_CODEC_QUIRK(0x17aa, 0x386f, "Legion Pro 7 16ARX8H", ALC=
287_FIXUP_TAS2781_I2C),
      |         ^~~~~~~~~~~~~~~

Caused by commit

  5b1913a79c3e ("ALSA: hda: Use own quirk lookup helper")

This build has CONFIG_SND_DEBUG_VERBOSE not set.

I have used the sound tree from next-20241010 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/9QX6ePWzLA1/zTjnNdHYZCv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIiSYACgkQAVBC80lX
0GyYqggAhnlYJimAGA9xHOXndXh5fw1T9QymzADz6YjJQ+qh3RiAdz6QWgUB2/Iv
Uzema9n62qwdSpt/6fWxx65ar7D+D1/YotHxpOnXwDh1wIXnhOyLwXsiTxC2DTzh
OLclT7qPOlqP9zoRKT/LRgDMB8n2VVHvS7LviiGoG1vcsIhtX5zj0ohu9Pfw2jw6
zepioPV/AUr4nKq9MCApIXhTb1eAcp6dTVnYHSx4aLJ6xfWuNfJJb/ZTSZpH5h4h
vqpuyDoEwar2b4lcoQQsZy6arauPeLvaXnKwex1iwq7rbfvJOK52s4U8f8BOMGK1
7hCJE1ZjMiUecLlGexDHHF9R376QuA==
=Gk/F
-----END PGP SIGNATURE-----

--Sig_/9QX6ePWzLA1/zTjnNdHYZCv--

