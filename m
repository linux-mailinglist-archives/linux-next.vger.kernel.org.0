Return-Path: <linux-next+bounces-6923-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79603AC380C
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 04:37:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48146172216
	for <lists+linux-next@lfdr.de>; Mon, 26 May 2025 02:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF62172BB9;
	Mon, 26 May 2025 02:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UvByZA9d"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030201684B0;
	Mon, 26 May 2025 02:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748227028; cv=none; b=ieBU9iqW67dgclvwjupJMMUy+SkAf5kxxipPha8bF5ojlorYkoi6doQLWpRRmGVwE5x9NL3Ru92Y/9AQAwoNHr+Oq2AwevXhY6Dv+YSG/Eh8ySbPJ6opIoFPfrx4P3Rlwz8VFNy520/ARQCPsrKP5JR2f7r7PubhBn6kBXDxjK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748227028; c=relaxed/simple;
	bh=fULEnYkOybJaMF+q9MHZhS8Kp6AqrJAzRf0iQC9jV/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YSXMg0EnqITmQK+S/DOBlAtb+U9FTKH8O8lpvmjNGxXL3kbZ2LXgoPR25RL8h1IMVbPcjClq20ljIgjWw0m0HTBipXpVcAVKkWzFskfKB4+zXY6i0iL3pOCFRkQT+B1j0/F0sdUAU0r8OagzC8iq50Q+VfTSWkVjzJBeFxgJL4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UvByZA9d; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748227022;
	bh=MSgBsbhjopG/rJnEv9Yg3cH8BSoSdlSokua/t8EAc6I=;
	h=Date:From:To:Cc:Subject:From;
	b=UvByZA9dSua4l6ctX/Tbq76CXX6YyipO0ohiYAyq4eEyknx6FPA08tQgdJt56lSyh
	 Yw83vW+L3RnCAHvL3YsYdVY1jbr+tfcpyRp2C6b9oVZGFmUIl2VncwSUdhpNGEZf5/
	 kgfeumFM0M7SkLMydsYyyOcVF1r0y/6PC8RcwrTgFN4I47Tr38jg1d6QqYvxKBwmUi
	 nQqET1fjeJ1ua/OEnH2MmpKCYE0NSgAUF4GQuqyeeeGQnTqPo20j9eRnnMyr3DXZeM
	 GYqKUldbc+faADJjc8PPGsmNCUHuU6ICxPMCaDK+VoT+5EiKnBpzXwZJj1hUefhDCr
	 hQtR4DlC6EO9Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b5KfQ3y3wz4wy6;
	Mon, 26 May 2025 12:37:01 +1000 (AEST)
Date: Mon, 26 May 2025 12:37:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Networking <netdev@vger.kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@amazon.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the net-next tree with the vfs-brauner
 tree
Message-ID: <20250526123701.01aec1c4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Edb.vmf1a8O2sEIpdK4PS+I";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Edb.vmf1a8O2sEIpdK4PS+I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/unix/af_unix.c

between commit:

  fd0a109a0f6b ("net, pidfs: prepare for handing out pidfds for reaped sk->=
sk_peer_pid")

from the vfs-brauner tree and commit:

  3f84d577b79d ("af_unix: Inherit sk_flags at connect().")

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

diff --cc net/unix/af_unix.c
index 59a64b2ced6e,bd507f74e35e..000000000000
--- a/net/unix/af_unix.c
+++ b/net/unix/af_unix.c
@@@ -1711,10 -1627,12 +1705,12 @@@ restart
  	/* The way is open! Fastly set all the necessary fields... */
 =20
  	sock_hold(sk);
- 	unix_peer(newsk)	=3D sk;
- 	newsk->sk_state		=3D TCP_ESTABLISHED;
- 	newsk->sk_type		=3D sk->sk_type;
+ 	unix_peer(newsk) =3D sk;
+ 	newsk->sk_state =3D TCP_ESTABLISHED;
+ 	newsk->sk_type =3D sk->sk_type;
+ 	newsk->sk_scm_recv_flags =3D other->sk_scm_recv_flags;
 -	init_peercred(newsk);
 +	init_peercred(newsk, &peercred);
+=20
  	newu =3D unix_sk(newsk);
  	newu->listener =3D other;
  	RCU_INIT_POINTER(newsk->sk_wq, &newu->peer_wq);

--Sig_/Edb.vmf1a8O2sEIpdK4PS+I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgz080ACgkQAVBC80lX
0GzCRwf/URgqf1W8RCrZ2RHotHnryHTDfpTQPQLpjLxWnDW68sDAtH26mJbsRx6K
V5RjJiKA+0eDFeGt4Bfct7BacN1mx+G4UHFUuhijaGc5CkS6cIRjtVQiQUAphPcP
ClDo5d3gDQeRY6F78LjWC4tniLSj+yo+Alwth0XWQpnxGBAQqf0ZLXk6iW9IOrqw
/DGh67Ecj4/u8xMZ54+GMbOVIBxp9USlccymfysaU7SdXDQlFELzRKc8r64kGev3
Vxgy7e3zTi4Mm7kGu+XafIwiwyC9eBBGvc9evV+gK22JA+727baRN2LZtvG2dviF
nB/K7tq4nxn8X/pz7aZi0uBIMC17jA==
=Ykql
-----END PGP SIGNATURE-----

--Sig_/Edb.vmf1a8O2sEIpdK4PS+I--

