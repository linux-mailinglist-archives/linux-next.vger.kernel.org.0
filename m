Return-Path: <linux-next+bounces-5123-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD5A0841C
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 01:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6902168A98
	for <lists+linux-next@lfdr.de>; Fri, 10 Jan 2025 00:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585771B59A;
	Fri, 10 Jan 2025 00:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gkHF0mEN"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E216318027;
	Fri, 10 Jan 2025 00:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736469546; cv=none; b=KLnZ6Ky1n1D1IY0DVI5RBawvYhdagYL71rJZtNkdhICtYxCE7/28fnursFJ3VDZGkfNq8WIkCqjK3KWkHiSC4Z4PNP4TnnCCHyocGiCJL71oFyjScMjbs9c+T+PisTWcoOJvia6mCtk+drBOccbiOaZlYffO3jMBH7QZVEo9kQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736469546; c=relaxed/simple;
	bh=USLWQfxpnifDI7bI7LMEAhh96ZN3GcS886bvNQdGPG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lUdK1N7o3jeMydVeu+ZvyEDcGRY2PW9RxDhOm57m/G9C4MIHSqaRXTY73QjaJbga4WJTjX7gb872qx2RJuMaAcMw3BJVo/RxYSIAypMlw+kBWVnKugLhFbFBgdfHmor+5yIJuq6Za/vFmyrx4LsnDebClGgYkAYwfd8+QqJMByQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gkHF0mEN; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1736469532;
	bh=+268IEIWqre3m/HtwdeirbBvYpoYdpacccHtch4UCkA=;
	h=Date:From:To:Cc:Subject:From;
	b=gkHF0mENxxKQkwiIZq5DYv6Sa/97n1tMXEcQmGuB5+blE+wBVwSJpYbvSf9R+wm6A
	 8InG54QJ1SXG6F12VNHp4bhVkJJAGlcxs5yW7oneN9/lwE9lAMoTBbVlvzIXUXrsw/
	 mhkx/ksuP3Yq5nhDKjwPVHiAilxig8KIGy1nOrTZ4nm6gffpP42B6e+2XK/edRoAvt
	 8VgXSRaNsBzkYYUtOV9HitjCK3tb0mCqcBqrWtufqHVWpUumSukH+pxduY7jQ9RLJb
	 moQZWCesrTW1Jxkcp23PPKg2IXAn9ng7niFuUIG1wBWLIBxcLIPQ9E5BsYjxb435Be
	 M9NXEnZab7BLg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YTjSq4jT4z4wb5;
	Fri, 10 Jan 2025 11:38:51 +1100 (AEDT)
Date: Fri, 10 Jan 2025 11:38:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Toke =?UTF-8?B?SMO4aWxhbmQtSsO4cmdlbnNlbg==?=
 <toke@redhat.com>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20250110113855.4332724a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/vKEcN32l+Ln8y9D/1UzFGCc";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/vKEcN32l+Ln8y9D/1UzFGCc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/sched/sch_cake.c

between commit:

  737d4d91d35b ("sched: sch_cake: add bounds checks to host bulk flow fairn=
ess counts")

from the net tree and commit:

  a42d71e322a8 ("net_sched: sch_cake: Add drop reasons")

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

diff --cc net/sched/sch_cake.c
index 2c2e2a67f3b2,deb0925f536d..000000000000
--- a/net/sched/sch_cake.c
+++ b/net/sched/sch_cake.c
@@@ -1972,6 -1935,8 +1974,7 @@@ static struct sk_buff *cake_dequeue(str
  {
  	struct cake_sched_data *q =3D qdisc_priv(sch);
  	struct cake_tin_data *b =3D &q->tins[q->cur_tin];
 -	struct cake_host *srchost, *dsthost;
+ 	enum skb_drop_reason reason;
  	ktime_t now =3D ktime_get();
  	struct cake_flow *flow;
  	struct list_head *head;

--Sig_/vKEcN32l+Ln8y9D/1UzFGCc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeAbB8ACgkQAVBC80lX
0GxPtQf+NMtv8tA9waEkIc+GvofGU8wFBvwTI2F15ZuctRFQs3XYLgx/i2kBF/a5
9XyEv35ZG45jT+We7sxqxa5hoBfiVV7s6E41cL+DnqD6ABEvHpq/PGgJYd+bnbrl
QL77lPrYGTK9DEHJ3SZWgEJ/k+AqU8k0gpkJmmYImQnX7OJJj8oi65ft7tuIyDwP
PmYYedACQVfz+JX9WzwI4oLiwlGfJ80E0MQv68/XrWtZB1Or+bSQw5gxYxorn4wU
dvIL86jQ1kpmm0vT+gSNDR0dd1JYGESEX27/Z96TVGsjqsAP4K9UrSoJJnmniBmH
w0vSnEKhWN6sj28w+XbCwPgQY26yVQ==
=WPs9
-----END PGP SIGNATURE-----

--Sig_/vKEcN32l+Ln8y9D/1UzFGCc--

