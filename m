Return-Path: <linux-next+bounces-7251-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ACBAE9403
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 04:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91E3D189904C
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 02:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4801DEFE8;
	Thu, 26 Jun 2025 02:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BsaLhcJO"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0221BD9D3;
	Thu, 26 Jun 2025 02:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750904541; cv=none; b=d683X83bDgt/SuKhgU4fUIIi9mHtmCo+PX0npeMNSDvEyfn/xrGe9HTcVx++1odJdkpNv57A9JDqm8XkEDw995naJ5h3LjAxb8q1umWtifvOiE+yMQdbCPl3JdgYoQLSCUAHyZbpEBDRVLVjF9bt6jq9teAGWCQR12yZvudgY+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750904541; c=relaxed/simple;
	bh=Fxud1T+zYuDCFzGWW4suY5q1mqW7lsPOnl/3Vu0Vhn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KC9pSybOY2YdoV5qIBx5N5d8i+09GpvD26vxkZR0KuuDgsepeMjeUyq22K81qgY4QyIsKD8Sw+BC8FUCkhvecicF8GXkSsFYEFZwIfHDlx6oft9QcmST4nwecxN5b0kaloZ8SPo9zAIHbgg5hUb5+1XPMb+rvnxed4qkd0WSvdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BsaLhcJO; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750904527;
	bh=guMtPvmhwo4pnUrw5lnTYkNGXeO5txF6DYOWOi/Hxlc=;
	h=Date:From:To:Cc:Subject:From;
	b=BsaLhcJOvGS+Ly60w18a1D2bKOgAx3DxfHNfdri0HJwZ6ABZo0BJvPO6EnmXqMbo9
	 krpTLa7Q3EOhj1ff7XFXUvnmAPbm1+n/syCldXAbwn3B3r7LdYtPde1vvoDPzgHbYx
	 2cv411xTyMSnU8A4QAOgD5afTVcDo6nLvlsNUJBG7FsUYMjWyZoP1155hJiDYoUQLn
	 DrmccUYcg7P+qAbDoaaRpQeRpX75mGnKD1ST8bqo6aLj9R/7QNnMf0ygTlELWSSla1
	 Dnxnz7oz/e9fzcIY1swwlZfFFhRP2on6lgCQKm+6BxFZSwsJTpUoAJ+NzP4AC/Lond
	 YGCm4Zx+9+UlA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bSMrt5gdZz4wcr;
	Thu, 26 Jun 2025 12:22:06 +1000 (AEST)
Date: Thu, 26 Jun 2025 12:22:05 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Donald Hunter
 <donald.hunter@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20250626122205.389c2cd4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1Wv5kJoV.kGB5A7zzqOmViq";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1Wv5kJoV.kGB5A7zzqOmViq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  Documentation/netlink/specs/mptcp_pm.yaml

between commit:

  9e6dd4c256d0 ("netlink: specs: mptcp: replace underscores with dashes in =
names")

from the net tree and commit:

  ec362192aa9e ("netlink: specs: fix up indentation errors")

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

diff --cc Documentation/netlink/specs/mptcp_pm.yaml
index fb57860fe778,bc395963e628..000000000000
--- a/Documentation/netlink/specs/mptcp_pm.yaml
+++ b/Documentation/netlink/specs/mptcp_pm.yaml
@@@ -17,72 -17,72 +17,72 @@@ definitions
      enum-name: mptcp-event-type
      name-prefix: mptcp-event-
      entries:
-      -
-       name: unspec
-       doc: unused event
-      -
-       name: created
-       doc: >-
-         A new MPTCP connection has been created. It is the good time to
-         allocate memory and send ADD_ADDR if needed. Depending on the
-         traffic-patterns it can take a long time until the
-         MPTCP_EVENT_ESTABLISHED is sent.
-         Attributes: token, family, saddr4 | saddr6, daddr4 | daddr6, spor=
t,
-         dport, server-side.
-      -
-       name: established
-       doc: >-
-         A MPTCP connection is established (can start new subflows).
-         Attributes: token, family, saddr4 | saddr6, daddr4 | daddr6, spor=
t,
-         dport, server-side.
-      -
-       name: closed
-       doc: >-
-         A MPTCP connection has stopped.
-         Attribute: token.
-      -
-       name: announced
-       value: 6
-       doc: >-
-         A new address has been announced by the peer.
-         Attributes: token, rem_id, family, daddr4 | daddr6 [, dport].
-      -
-       name: removed
-       doc: >-
-         An address has been lost by the peer.
-         Attributes: token, rem_id.
-      -
-       name: sub-established
-       value: 10
-       doc: >-
-         A new subflow has been established. 'error' should not be set.
-         Attributes: token, family, loc_id, rem_id, saddr4 | saddr6, daddr=
4 |
-         daddr6, sport, dport, backup, if-idx [, error].
-      -
-       name: sub-closed
-       doc: >-
-         A subflow has been closed. An error (copy of sk_err) could be set=
 if an
-         error has been detected for this subflow.
-         Attributes: token, family, loc_id, rem_id, saddr4 | saddr6, daddr=
4 |
-         daddr6, sport, dport, backup, if-idx [, error].
-      -
-       name: sub-priority
-       value: 13
-       doc: >-
-         The priority of a subflow has changed. 'error' should not be set.
-         Attributes: token, family, loc_id, rem_id, saddr4 | saddr6, daddr=
4 |
-         daddr6, sport, dport, backup, if-idx [, error].
-      -
-       name: listener-created
-       value: 15
-       doc: >-
-         A new PM listener is created.
-         Attributes: family, sport, saddr4 | saddr6.
-      -
-       name: listener-closed
-       doc: >-
-         A PM listener is closed.
-         Attributes: family, sport, saddr4 | saddr6.
+       -
+         name: unspec
+         doc: unused event
+       -
+         name: created
+         doc: >-
+           A new MPTCP connection has been created. It is the good time to
+           allocate memory and send ADD_ADDR if needed. Depending on the
+           traffic-patterns it can take a long time until the
+           MPTCP_EVENT_ESTABLISHED is sent.
+           Attributes: token, family, saddr4 | saddr6, daddr4 | daddr6, sp=
ort,
+           dport, server-side.
+       -
+         name: established
+         doc: >-
+           A MPTCP connection is established (can start new subflows).
+           Attributes: token, family, saddr4 | saddr6, daddr4 | daddr6, sp=
ort,
+           dport, server-side.
+       -
+         name: closed
+         doc: >-
+           A MPTCP connection has stopped.
+           Attribute: token.
+       -
+         name: announced
+         value: 6
+         doc: >-
+           A new address has been announced by the peer.
+           Attributes: token, rem_id, family, daddr4 | daddr6 [, dport].
+       -
+         name: removed
+         doc: >-
+           An address has been lost by the peer.
+           Attributes: token, rem_id.
+       -
+         name: sub-established
+         value: 10
+         doc: >-
+           A new subflow has been established. 'error' should not be set.
+           Attributes: token, family, loc_id, rem_id, saddr4 | saddr6, dad=
dr4 |
 -          daddr6, sport, dport, backup, if_idx [, error].
++          daddr6, sport, dport, backup, if-idx [, error].
+       -
+         name: sub-closed
+         doc: >-
+           A subflow has been closed. An error (copy of sk_err) could be s=
et if
+           an error has been detected for this subflow.
+           Attributes: token, family, loc_id, rem_id, saddr4 | saddr6, dad=
dr4 |
 -          daddr6, sport, dport, backup, if_idx [, error].
++          daddr6, sport, dport, backup, if-idx [, error].
+       -
+         name: sub-priority
+         value: 13
+         doc: >-
+           The priority of a subflow has changed. 'error' should not be se=
t.
+           Attributes: token, family, loc_id, rem_id, saddr4 | saddr6, dad=
dr4 |
 -          daddr6, sport, dport, backup, if_idx [, error].
++          daddr6, sport, dport, backup, if-idx [, error].
+       -
+         name: listener-created
+         value: 15
+         doc: >-
+           A new PM listener is created.
+           Attributes: family, sport, saddr4 | saddr6.
+       -
+         name: listener-closed
+         doc: >-
+           A PM listener is closed.
+           Attributes: family, sport, saddr4 | saddr6.
 =20
  attribute-sets:
    -

--Sig_/1Wv5kJoV.kGB5A7zzqOmViq
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhcrs0ACgkQAVBC80lX
0GyJFQf/YVXfuSw9TOJKVWfsQo5w9fpyHxWVMG/noF6xfRkBigF0aDV9tP9YX7S1
Hj0zysTHmVvu/fX4+/xZ7GRZPpjkiZZOA56iWSKcS5BNDxurURXVLFaoSAvz4oKR
qagKWrp2HZwdxJJDG9qPXIr1fXcHPHWLsUBz6RsA3BD4QpguYht3InCUk6g/5cI0
xPOIutFKUShVLBsgWihNZwoqRcDPjLbIJgkB6DCZJm0oXhrliYWTmrHQ71HimEiF
NWxwR3C/YVGgWYeIqXb3nEA48rWUjwdy17P36pMOCzUfMc8UTmTHdN22M7Uaxsh9
9Now5hvlHISx2pQiy6LG0QomdcURuw==
=4V12
-----END PGP SIGNATURE-----

--Sig_/1Wv5kJoV.kGB5A7zzqOmViq--

