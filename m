Return-Path: <linux-next+bounces-8697-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6527C03D2C
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 01:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44BE21A06767
	for <lists+linux-next@lfdr.de>; Thu, 23 Oct 2025 23:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12999285C9F;
	Thu, 23 Oct 2025 23:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="otHJIMjH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B1E2BB1D;
	Thu, 23 Oct 2025 23:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761261581; cv=none; b=Kl+7EAeHRMuy0fROzHDO7Ff223ZuzRVjBV4jn4ygjUhPWFLP7ibq1HXHqvpvtwpc0Ybx2L3HuIyfeMD02GyaHrolcVtH8DZWat0n9TMU6rnQ3MfBsVAG/J3n7ZcgGxGcp50YgVlJJO2N4YNmuagR0vrYI7+pKQ/g8JJZHjIVu1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761261581; c=relaxed/simple;
	bh=pqzPEr83Wlp5RWs/H6YYQ2P5xAPk/5VgUVSEbEPhJCo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wjxsjd6wGoTOAsZgmP3+MCORP6ce611gqOgl5yqWtotc5z7czoMewtsVOjW/rxS9DNb2Upm8ogqnNiQomo8AthBuZHAXtxf/PZnB56Mpm9qEWMKuDnggHwYd8ooets55FPh6aaVwHgBsACoszUwv389jejTYGQVT8dTCR36At1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=otHJIMjH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761261573;
	bh=PHe8Y/auY0lx1sCeSGOFYE+yhFxujm0kfMzAgdgRW80=;
	h=Date:From:To:Cc:Subject:From;
	b=otHJIMjHccfGzutmvWvukr7Ow9YnYLYVBKv/QwzF6CuBquoe9fpZe1EWRHTlup1IL
	 8Q9lSa9ddzfiEiRJLmlHCmHXFI3cUud/bZyZKiYNhIEBucdAK6GabeE2yRZze5y1EP
	 jgl8UsDQfCr3g4Y5KkJ+aZ5SP7FAHBFyKdZiU9DCW5SgamRS3PRcWUwnUspNMXhKqh
	 SgTOae/ktx9pxnKIg6jkt9P6xl68yETAHUytRIb7UsD4YMgMDrxfST1gM0bO20hLNw
	 QX32THB7rCmeoy5nfAXCQkmsOrGxAb+PIIodEJejBqwgaeUCcaUeyQqdP2OizxLmOc
	 cNK9/QEqNkCLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ct26r1XBFz4w2S;
	Fri, 24 Oct 2025 10:19:32 +1100 (AEDT)
Date: Fri, 24 Oct 2025 10:19:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>, Shuming Fan
 <shumingf@realtek.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-asoc-fixes tree
Message-ID: <20251024101931.49f46027@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N_geh_a0mPmG+rH8BndhD_l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/N_geh_a0mPmG+rH8BndhD_l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc-fixes tree, today's linux-next build
(x86_64 allmodconfig) failed like this:

sound/soc/sdw_utils/soc_sdw_utils.c:316:18: error: 'struct asoc_sdw_codec_i=
nfo' has no member named 'name_prefix'
  316 |                 .name_prefix =3D "rt1320",
      |                  ^~~~~~~~~~~
sound/soc/sdw_utils/soc_sdw_utils.c:316:32: error: initialization of 'int' =
from 'char *' makes integer from pointer without a cast [-Wint-conversion]
  316 |                 .name_prefix =3D "rt1320",
      |                                ^~~~~~~~
sound/soc/sdw_utils/soc_sdw_utils.c:316:32: note: (near initialization for =
'codec_info_list[12].version_id')
sound/soc/sdw_utils/soc_sdw_utils.c:316:32: error: initializer element is n=
ot computable at load time
sound/soc/sdw_utils/soc_sdw_utils.c:316:32: note: (near initialization for =
'codec_info_list[12].version_id')
sound/soc/sdw_utils/soc_sdw_utils.c:564:18: error: 'struct asoc_sdw_codec_i=
nfo' has no member named 'name_prefix'
  564 |                 .name_prefix =3D "AMP",
      |                  ^~~~~~~~~~~
sound/soc/sdw_utils/soc_sdw_utils.c:564:32: error: initialization of 'int' =
from 'char *' makes integer from pointer without a cast [-Wint-conversion]
  564 |                 .name_prefix =3D "AMP",
      |                                ^~~~~
sound/soc/sdw_utils/soc_sdw_utils.c:564:32: note: (near initialization for =
'codec_info_list[23].version_id')
sound/soc/sdw_utils/soc_sdw_utils.c:564:32: error: initializer element is n=
ot computable at load time
sound/soc/sdw_utils/soc_sdw_utils.c:564:32: note: (near initialization for =
'codec_info_list[23].version_id')

Caused by commits

  3293d3d7b088 ("ASoC: sdw_utils: add name_prefix for rt1321 part id")
  61eb4112a8fb ("ASoC: soc_sdw_utils: add cs35l57 support")

But something else has changed because 3293d3d7b088 was also in
yesterday's linux-next - which did not fail to build.

I have used the sound-asoc-fixes tree from next-20251022 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/N_geh_a0mPmG+rH8BndhD_l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj6uAMACgkQAVBC80lX
0Gz5Twf/XACncpQ3iIx1CoZq0T778CHLHlXczIJ4jOp8HD3hS0lj31UBGHCgZKBI
6Gn7xsX7z3yBSvlbB8NNG5yJM+8ljxc5etrtYhPMlY4Ntr2awjOJs10ebcmYvhnR
YjxooOf/skhaSCNzNo9+4kgvndtFw1ze4CEw0Uhq2tXBNmm+ckUHwlzqUOJMfotg
kYlwl9neVoOmXygXLFaNJxzm17OQduyLYmSg3QzWTO/Q03ekIgD4xuftdJijIqZd
XaTIpH6cyBXeuY95EsutzTski+bUfCy/drLWsqfT9yD4a+2GJXBnkqYNgpDAmjel
uL2OUtJgqKm6AXh6EZ29prj6B1M8VA==
=L94P
-----END PGP SIGNATURE-----

--Sig_/N_geh_a0mPmG+rH8BndhD_l--

