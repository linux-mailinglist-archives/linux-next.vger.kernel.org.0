Return-Path: <linux-next+bounces-2174-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C98BC56B
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 03:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B5461C20311
	for <lists+linux-next@lfdr.de>; Mon,  6 May 2024 01:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBDE3BBE2;
	Mon,  6 May 2024 01:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YUtcXnR4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E4E6FB2;
	Mon,  6 May 2024 01:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714958901; cv=none; b=SukBgftSTe/8Q5q2lq3s+mBgr1wNTBw3T7yb59cKSEQ/nNwNVXrhmqA/6+aROTW41duQTkmCljNb8qFma2mwMVZzTFxpq93QYFOXIOhN8kCO9sG4+VNDAZIYQsf9GrqJXbKro3G9T+SV0PhFNiMybe+pMU/TLVWWFzCxj7A64sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714958901; c=relaxed/simple;
	bh=FH0j+718jaZ9VEDPVGBk26CBdIh+lNLduqokz3lP1F0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=naa1jOIpxwXtp1/oZyObz4ke+UAsS3STtSWXPewzNuwCvw+JvqPbR2q/Vcc+N294fLr6nNpxajQHSYuKFoKLSmB3cw7T8Hju8gGZ+Nu5hlZOwnJfzU+zwJyAsKClpnH032LXdoUFaZVN2ownAkxpv2ccFDMDGfGrZKIKAofLYW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YUtcXnR4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1714958894;
	bh=9iI3Zjz4TQ8UsPbf24bHOXOdziGqsh2fOxFue/0w/Hk=;
	h=Date:From:To:Cc:Subject:From;
	b=YUtcXnR4b6Z5fibzPSYB05OtCZzY97cr5TqrfFwudslpP58SGyEO+2QiAlF/7ism+
	 IeWQjZoUt5iGwaY1URrvTQcx/S1TaqFvmqByqp3AdlGv/76jNrh1N8fvh/xZnTNfDg
	 stkPZEwuulJoUvLuNA9THQcB5xxSRN2uDaa8E/SvtlH5JwvZpKw85mbHlU3MdRwMJp
	 o2kzoaVMiITl9/zYpEOhGeDLIyUveKDKxEvXq9Tu7cSVpXw5+9axz4O7S2L4Omftlt
	 mlcHW8Hi4MYmNOT1yVZllr2o81POKmWkvXc9BMxxgsDVjxfhYvZGKzMcUVJbtiBZEm
	 DfdjIXqEcwZOw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VXkLj5vDVz4wck;
	Mon,  6 May 2024 11:28:13 +1000 (AEST)
Date: Mon, 6 May 2024 11:28:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Networking <netdev@vger.kernel.org>, Johannes Berg
 <johannes.berg@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Miri Korenblit
 <miriam.rachel.korenblit@intel.com>
Subject: linux-next: manual merge of the net-next tree with the kbuild tree
Message-ID: <20240506112810.02ae6c17@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/g+ZxHzBaV8rjNyuPr1nq.DW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/g+ZxHzBaV8rjNyuPr1nq.DW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  drivers/net/wireless/intel/iwlwifi/mvm/Makefile

between commit:

  7c972986689b ("kbuild: use $(src) instead of $(srctree)/$(src) for source=
 directory")

from the kbuild tree and commit:

  2887af4d22f9 ("wifi: iwlwifi: mvm: implement link grading")

from the net-next tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/net/wireless/intel/iwlwifi/mvm/Makefile
index 764ba73cde1e,5c754b87ea20..000000000000
--- a/drivers/net/wireless/intel/iwlwifi/mvm/Makefile
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/Makefile
@@@ -15,4 -16,4 +16,4 @@@ iwlmvm-$(CONFIG_IWLWIFI_LEDS) +=3D led.
  iwlmvm-$(CONFIG_PM) +=3D d3.o
  iwlmvm-$(CONFIG_IWLMEI) +=3D vendor-cmd.o
 =20
- ccflags-y +=3D -I $(src)/../
 -subdir-ccflags-y +=3D -I $(srctree)/$(src)/../
++subdir-ccflags-y +=3D -I $(src)/../

--Sig_/g+ZxHzBaV8rjNyuPr1nq.DW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmY4MioACgkQAVBC80lX
0Gxu7gf9H2jdre2Zs2XXQL03YpWEMJx14nF1wh+CoGnYQnIzLjTvgnT/G6MwJlE6
34zRIMUPbVTPZzkyZpIn29U26Xo0gH89O69UO/wvLenX+7t4I2P8BkMPr/gtLa4W
AqZT75UCIQFfa2dzpduiMwQSSIfpyQAq8TpvYPiEdxCq+QBkxySnAo39kSpSGi6U
Gd9XHm+oGZKw3738oUR3FUaS03xaRpfGYEqzd6bXq5Ny7FlQBIwiT333+2hM2u28
BHYDO/SsLRFWgv1Kz0TnxbGXQZjLGe91Lu4pSmaoFiVMvAzW1NKN5p2Uz3IUGaO3
ezoq+Kyb0V1yI1o/AXvVYLRMRxDhSg==
=lTLJ
-----END PGP SIGNATURE-----

--Sig_/g+ZxHzBaV8rjNyuPr1nq.DW--

