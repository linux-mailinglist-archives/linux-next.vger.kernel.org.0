Return-Path: <linux-next+bounces-5088-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE45A051A9
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 04:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4FB2161317
	for <lists+linux-next@lfdr.de>; Wed,  8 Jan 2025 03:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE89A198E92;
	Wed,  8 Jan 2025 03:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TKlLXD31"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718F259490;
	Wed,  8 Jan 2025 03:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736307612; cv=none; b=IUm49E9Oxl7Wqka5+V+5iyPgxYoK1mPbBqplnfgNopBpmmdhfSK41sL1ic56w/eGZuYwjCYTaJGL3LDEUlNYkSqcP9UDOD2Q+sfbASUBunHnTtg9TTX+utz1UrBq5TEdwUIcTWe6PP2y+7t/DyVQYQ/zlSBSVz/ki8f9mQE93rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736307612; c=relaxed/simple;
	bh=nJzJDPkFr1R0vofj0FUp576AUzuwlj76/G9iJKmKKks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EPSDqkfeWWLU9WGfwjkHfTBd43cw4BpGunbstKhAzGcEHTPkPVvybIaRS9u0kvDqk7RytVmM7mgv6IHNz+Hu4UKnFqBkE3kXNeva0hEy8qW8GfBk1fTxQSpyaOQ2lugzDLp+Bf+Zk4vJ6DLoUnxxawE3yeIbm1CWkI4dN/29GpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TKlLXD31; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736307598;
	bh=7czeec3KX/3LjHKBxMfcaje8wAQStBDWRZm0Q0beq4Q=;
	h=Date:From:To:Cc:Subject:From;
	b=TKlLXD31EE36elOk6GEGnZI7+uZojo7TNJDenzh/3bPqiC9aFmX/Vf1LnLoNhQEvx
	 L+Djw0YOk5XfuHABwNqWDlC6pkGfMLb0rnEMMf/Upjee2RmVArJwiXy9jeZj+iAG5t
	 GNTOY3rTflBdKKzyDEzn/IKlfHEnV72lZESeUXNFzwdPHaWely8SUk6sjFhOcnduve
	 PgJ4gMKjHQeOor6GD74ELZ0gVY9rxpmbh5JgzdSV0OHow6zQ3E3EuRPhypZ89n+1+Q
	 YLTTWVr3u1IXS0JRZkXwWPU+/HdOtIjjyCQNDz+lMyzpMgDB8U+Wt+vWev/rGqzD5v
	 g3Pe4cW6tTYwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YSYZj0dG9z4wvb;
	Wed,  8 Jan 2025 14:39:57 +1100 (AEDT)
Date: Wed, 8 Jan 2025 14:40:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <shuah@kernel.org>, David Miller <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Laura Nao
 <laura.nao@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Willem de Bruijn <willemb@google.com>
Subject: linux-next: manual merge of the kselftest tree with the net-next
 tree
Message-ID: <20250108144003.67532649@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IODd3m+JJxETFIENaX2Q7UE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IODd3m+JJxETFIENaX2Q7UE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kselftest tree got a conflict in:

  tools/testing/selftests/kselftest/ktap_helpers.sh

between commit:

  912d6f669725 ("selftests/net: packetdrill: report benign debug flakes as =
xfail")

from the net-next tree and commit:

  279e9403c5bd ("selftests: Warn about skipped tests in result summary")

from the kselftest tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc tools/testing/selftests/kselftest/ktap_helpers.sh
index 05a461890671,531094d81f03..000000000000
--- a/tools/testing/selftests/kselftest/ktap_helpers.sh
+++ b/tools/testing/selftests/kselftest/ktap_helpers.sh
@@@ -118,5 -107,9 +118,9 @@@ ktap_finished()=20
  }
 =20
  ktap_print_totals() {
+ 	if [ "$KTAP_CNT_SKIP" -gt 0 ]; then
+ 		echo "# $KTAP_CNT_SKIP skipped test(s) detected. " \
+ 			"Consider enabling relevant config options to improve coverage."
+ 	fi
 -	echo "# Totals: pass:$KTAP_CNT_PASS fail:$KTAP_CNT_FAIL xfail:0 xpass:0 =
skip:$KTAP_CNT_SKIP error:0"
 +	echo "# Totals: pass:$KTAP_CNT_PASS fail:$KTAP_CNT_FAIL xfail:$KTAP_CNT_=
XFAIL xpass:0 skip:$KTAP_CNT_SKIP error:0"
  }

--Sig_/IODd3m+JJxETFIENaX2Q7UE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmd985MACgkQAVBC80lX
0GyYeggAkhEdbu2tP0dzlToclCrQeNAlmwYmCF7tNaGXzgN+0BoVDgwb/fXQP2BO
rvLy2wq9S6Gi/95Nnk6II1omeZUcBn7WTmd2jz87KKjAWfGagkANghrippYZo94j
4Fa0UoKG558DPm46ctl55QNv/EYEwVflO7VT81oaLDZ5ahm3V456FeYFjK6Ta8XP
pUSpr4ak07uLeEyEnmeM1mv/W07v5ci/j2b7IuTB/SGld+q2FEIN+6eATEACkGxI
NhjhujpQyARSeE1OMLmghTDoZuUzoHeN8mWa7zyJVpCdRLnLAnPQ/Uq4ZySZhtaW
tjWx3B+EBOCWjf0I/p07nTRfUYzdtA==
=vRu+
-----END PGP SIGNATURE-----

--Sig_/IODd3m+JJxETFIENaX2Q7UE--

