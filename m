Return-Path: <linux-next+bounces-4766-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A27319C66A8
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 02:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C9D36B2958E
	for <lists+linux-next@lfdr.de>; Wed, 13 Nov 2024 01:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AEE01F94D;
	Wed, 13 Nov 2024 01:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="P4xbzwuH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C2A134A8;
	Wed, 13 Nov 2024 01:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731461047; cv=none; b=MPb68x1BVVZv4RL3E1F5CS7oJCimwTuXPCldumHkZND5XpRuH9WIht816nh0dMEKQTHVHmggroX5uv0KRjiKb8ym9seK3vxTYkA3UuyR5mMlz8jtP/vNv1cxM46hFfFYWFZPHW6XIDqqADNrOC0Na8vCG01oyIuQXbuU3MBgrX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731461047; c=relaxed/simple;
	bh=sUKz3jCT2hiAfo2BD57mh6EmTwdB5aP1+aVXCjzoIw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dt32r6/Re5N6NEiqkv5wCftZ1kBp5jPj50/rZzJ22pGneQjjdmfD/3jGQgz0mkVE8Y9lXIdXy8thglSynhtN0Eg9sz6k6xNIXTDc9GSsLluJ2UOSeAY+v7g+NJ08Mqk0bPoOezB2S2zApPvndhIz2bQRUspcj6LAlLR34XRZx0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=P4xbzwuH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731461039;
	bh=YTvwOVHqUNLK9XlVW0eiqWJCmdjKjorGQduxber6A+o=;
	h=Date:From:To:Cc:Subject:From;
	b=P4xbzwuHCV6A2QZcFbCBK8D+ucx6ZXFRFPDuCimpGIONfOvlVWZIWzbJlWIbZUMbf
	 5tJpKcNfWb5wqzDMPchvMNPac9cM+JgFNkaHxxR5xA3v/IWJz4kSGYDa85RiIeTQi5
	 MDjKHbok1Az1zA55CpSDhluscTlZFdvxv9yKK4ITgd5Qrfmf/wrOlpAoeCKWxirFZN
	 pQIWET89dZxx3qfnu+/rlKFcuU/oo8IwQmoENFeIfPUaebFfYNrh2vAJX+NAmal85R
	 XbMQlImXQprdupfpcUEXXvMtILrXY2ZF5d1boIU8roD84yE76rPiHxOjrz2J+QT0Ze
	 V9fLSYYQlYk2g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xp5Cf3llYz4wb1;
	Wed, 13 Nov 2024 12:23:57 +1100 (AEDT)
Date: Wed, 13 Nov 2024 12:23:59 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Stanislav Fomichev <sdf@fomichev.me>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20241113122359.1b95180a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LgKoOoNNB=8NtuqrS93ebRH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LgKoOoNNB=8NtuqrS93ebRH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  tools/testing/selftests/net/.gitignore

between commit:

  252e01e68241 ("selftests: net: add netlink-dumps to .gitignore")

from the net tree and commit:

  be43a6b23829 ("selftests: ncdevmem: Move ncdevmem under drivers/net/hw")

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

diff --cc tools/testing/selftests/net/.gitignore
index 59fe07ee2df9,48973e78d46b..000000000000
--- a/tools/testing/selftests/net/.gitignore
+++ b/tools/testing/selftests/net/.gitignore
@@@ -18,8 -19,6 +19,7 @@@ ipv6_flowlabel_mg
  log.txt
  msg_oob
  msg_zerocopy
- ncdevmem
 +netlink-dumps
  nettest
  psock_fanout
  psock_snd

--Sig_/LgKoOoNNB=8NtuqrS93ebRH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcz/68ACgkQAVBC80lX
0Gyblgf/XvYusQlNhiqcaGdiOAFSbPddN2qoVU2EcAz2vq8r+nogGPMmPW4nJiE1
VHh4l508qhkRHaOc5GG/X8WmiWWHUCikqSVogsr6l77Xhz9X7zhkkLFlEIkFGz01
5oUzXkNNXmkzjThLmNrNuuphuHLYQIHeI0u5t/khbmalhoGKMZSO7Kn9/mwL3L5N
0vsFCgtSzIrPJysXAsS8VI0avkJx/SgktCEWYaGRP5Lct1EqxG6jTcRRvQSnKbwh
Z7PkVt67TvAg5SzuN2Nss/45RYwGD7lORWVvNhlONSHkXlgun5IUKqCR3rqKk43h
RPAP8PG6IvhoFeEQrgOH9ibmm1e59w==
=eakZ
-----END PGP SIGNATURE-----

--Sig_/LgKoOoNNB=8NtuqrS93ebRH--

