Return-Path: <linux-next+bounces-5601-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4944CA48E9F
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 03:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88665188D22A
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 02:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0B516ABC6;
	Fri, 28 Feb 2025 02:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qrOcqSsl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55F615746F;
	Fri, 28 Feb 2025 02:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740709807; cv=none; b=uPlDJH316tCojAS+XSS38qv+HOTanabodRZjcMdOe6HkoUVoyfhOpsRjebDLczZzdvTGoVrWE8zIxKOTBrRvjY/mD7MRxPhpRWs4Z7lYpX2LmFjG968JR3OCrjpHvivYTzZF54A5389WWbxjlIx0qroN4iotqbm/awD/XFRoc4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740709807; c=relaxed/simple;
	bh=R1nVNqPAm2ZQTpo0udxcMXFYQ3FxPBlyYe7zlDbN1CM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S8YJMdEKZGEg1eWflUWT3UzG9Ew4WF4zFRvaRcur3oQjlrslf+qlUdSykgCT7IVn543XrpuzTp//tXtpA/zoFDQvhQ0GcxVX4UQpFHJ9et9Oy5tP/HdFpebXa4cZfyCVwCOTKlcN6rzlQhzqJ+ubLKq/k12SoRtgVLNmFEMzdGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qrOcqSsl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740709796;
	bh=7Y1Eyx2SKE0LWaPQrAdnGMrDRPwivGsytrjHgeNsiuU=;
	h=Date:From:To:Cc:Subject:From;
	b=qrOcqSslPq9eDeBqOuIRzSXCdOm0WeWOQDSgYE+u8ThcSfFToMhAu2B899mfEc7CW
	 uTtBLI9JQBRfU/eLrmleYaHm1H63yC62z6HCx2zQuqawcTgQIcsk5fVH/atqwNIWcy
	 7KcqRwYeQvFRFioambpoPh5f/T7vWRCmO2NGjeijwLzZUDmEiDCD5RHhFQzeOghc9E
	 o1UhH9TyNiqJOqPvBdZdVTUpkHwGOSuHfACEzXF41AeB8fpeZN9WoSWigRlyfkDkaa
	 W0j0Sy7WF2rA/VTX/mu8qMAhEJUqNO4wByotdCO4GLXq0mNgGglCCbAQ7LDRETD4mO
	 sMcFJPIXz8c2w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z3scN0LlGz4wbx;
	Fri, 28 Feb 2025 13:29:55 +1100 (AEDT)
Date: Fri, 28 Feb 2025 13:29:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Christian Brauner <brauner@kernel.org>
Cc: Networking <netdev@vger.kernel.org>, Lin Feng <linf@wangsu.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Stefano Jordhani <sjordhani@gmail.com>
Subject: linux-next: manual merge of the net-next tree with the vfs-brauner
 tree
Message-ID: <20250228132953.78a2b788@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z5uY4b5hMjhQlEAu.MxNqqn";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/z5uY4b5hMjhQlEAu.MxNqqn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  fs/eventpoll.c

between commit:

  d3a194d95fc8 ("epoll: simplify ep_busy_loop by removing always 0 argument=
")

from the vfs-brauner tree and commit:

  b9d752105e5f ("net: use napi_id_valid helper")

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

diff --cc fs/eventpoll.c
index 9b06a0ab9c32,2fecf66661e9..000000000000
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@@ -447,8 -447,8 +447,8 @@@ static bool ep_busy_loop(struct eventpo
  	if (!budget)
  		budget =3D BUSY_POLL_BUDGET;
 =20
- 	if (napi_id >=3D MIN_NAPI_ID && ep_busy_loop_on(ep)) {
+ 	if (napi_id_valid(napi_id) && ep_busy_loop_on(ep)) {
 -		napi_busy_loop(napi_id, nonblock ? NULL : ep_busy_loop_end,
 +		napi_busy_loop(napi_id, ep_busy_loop_end,
  			       ep, prefer_busy_poll, budget);
  		if (ep_events_available(ep))
  			return true;

--Sig_/z5uY4b5hMjhQlEAu.MxNqqn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfBH6EACgkQAVBC80lX
0Gy+Swf+KR6UyPmPrOnBSQ2BPjkwcU/awAAp/4iFzUq3qoW9mb4Zd4F6Zdc0xC9s
/yNERQ8VVYZ8QSSKL7XXqF3+IzcDE8/da8LYXI/C60kghX7Z7MCllSbaFE/HWo6g
XOIbprF3FhulDD5veanRvHPsRZSrwSCn4OhoKl4yPVXd9THg7XmhVuuQD+3tsTJt
kQmlhZdcrP1Bcx0J1Nt2ZlC7QlDBsW1FGAWKMXB5lR26Z+8Sn/PeuoEwvczdIPwk
rz0AN3UE80R53ACqSDMXVYR2IUs0jttQ0kaCVSWMkEVztDzisoomC5vD2QOjOliu
clwMusRaJ4vUclKPLeah/jN6pzsz0A==
=a4Yz
-----END PGP SIGNATURE-----

--Sig_/z5uY4b5hMjhQlEAu.MxNqqn--

