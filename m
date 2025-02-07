Return-Path: <linux-next+bounces-5390-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7040A2BA40
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2025 05:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7E241888DDB
	for <lists+linux-next@lfdr.de>; Fri,  7 Feb 2025 04:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FD1232392;
	Fri,  7 Feb 2025 04:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kermhLMV"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7905A194A67;
	Fri,  7 Feb 2025 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738902496; cv=none; b=c/wxktUiDnn69jZL0dYYrX9xN8T906plquIVpOzi+kpbQD9E+WkauWbq4MKXFfnLfteP9/6aU8j01SL+LEb06VBELDXHwJUgmUn1hYCjoXwIk65sZUlrX/JPWKH6vkyXlowHHnqthDZj1nqsFgYoQg38P9pFcSC6Y8RiWQGbeQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738902496; c=relaxed/simple;
	bh=yT7iNYsJw5w5/OI9nJVoOOQhpH7Phe8Ukdf+b++QSp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=unadS6gQ7VBZ+9kqi8bJMrL1dFpqh/VkHQ7kxYvh0kVpb2YF9p/FOPIUoYB/NEGdNmJOGfGYHe4mtx/x+mFcaJjKX9f8dM3kj26UUfOMpxfwseNt0yZJZsUDhcG3Lvrni3N9DQcv+PxWUCpJQWxPTeDmj6GPEf5EdB0y6Be6Qv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kermhLMV; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738902478;
	bh=aRfInykvyu9H5xfo5j+0DsLOgJuOZcyLxO4RSwTBpHo=;
	h=Date:From:To:Cc:Subject:From;
	b=kermhLMVeNzh6Nqau8Y+W/O8/DnlMiDyBOApiS3Msl9+OA4N8ca2CwTyIa3nthMkw
	 kEVKqp9by65o89VWXzvOl/Ge0GjyujEMpcim6Uy5AI6s2pOwDTrAvDgAq0YCjldMdh
	 LQ2lqzdaWhhnqT0uFfg/eKQmHWizbqR2xmyndUBRy33Wx/YwYcDfBMBmtYX3r8euQ9
	 X+GzWQmaHJ9IVLK2hq9RXD2AXc/D45M/ujUcnZ7WtBpT4wT3PM+MKp7+VBEcaozw3F
	 ygm1fWzpG5C5NVzwFo4ubfyPbGAb9yUl3191nq2Hd7AniDbuBEh49RMopErQ8Hajw9
	 mio/fbkBJUniQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yq1DG1yqfz4wbR;
	Fri,  7 Feb 2025 15:27:58 +1100 (AEDT)
Date: Fri, 7 Feb 2025 15:28:07 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the sound-asoc-fixes tree
Message-ID: <20250207152807.267e5bb7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qzuwtOkIQ70YnnnDW8LjfeC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/qzuwtOkIQ70YnnnDW8LjfeC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc-fixes tree, today's linux-next build
(powerpc allyesconfig) failed like this:

sound/soc/codecs/cs35l41.c: In function 'cs35l41_acpi_get_name':
sound/soc/codecs/cs35l41.c:1166:31: error: implicit declaration of function=
 'acpi_device_hid'; did you mean 'acpi_device_handle'? [-Wimplicit-function=
-declaration]
 1166 |                         hid =3D acpi_device_hid(adev);
      |                               ^~~~~~~~~~~~~~~
      |                               acpi_device_handle
sound/soc/codecs/cs35l41.c:1166:29: error: assignment to 'const char *' fro=
m 'int' makes pointer from integer without a cast [-Wint-conversion]
 1166 |                         hid =3D acpi_device_hid(adev);
      |                             ^

Caused by commit

  1d44a30ae3f9 ("ASoC: cs35l41: Fallback to using HID for system_name if no=
 SUB is available")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/qzuwtOkIQ70YnnnDW8LjfeC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeli9cACgkQAVBC80lX
0Gyp4Qf/bWSI+NeoJsQQEMFdx8xC0GYmV2VuOFlMwa1PedIn3z6/jNUMKBYPsr4t
IyEdBFBGLpKpe6HA4qimx/RJkdWz7dpf4JbW1b0LdzwgSbDMcx9xu+6NveSJNWwu
7TXiTmsDZKTHlCIT4bUi6Pe9B/vrea/mtP/EGSNOhQNMWupGO4f4eUXpZhVpmQ3y
vZnfOAvaxlOldkMYhE9Vp9Ds78YLV4P+FOuWiqITik4W+b8bq9w6jnE0lZr7UYTb
5GNlyBsUD6vPu1oPT5xXaGPUBYOxqwmtvi0X6AHNrmtCG4A5hfaXi+vT/0vJWjzA
F9EgHJ0LcWxO+qSUD8hJLHx1wTifRw==
=zJOn
-----END PGP SIGNATURE-----

--Sig_/qzuwtOkIQ70YnnnDW8LjfeC--

