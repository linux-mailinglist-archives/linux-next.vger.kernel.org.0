Return-Path: <linux-next+bounces-3465-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD16961B63
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 03:22:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C56A1C230DB
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2024 01:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F1B224EA;
	Wed, 28 Aug 2024 01:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iG0QkENa"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0F5224D1;
	Wed, 28 Aug 2024 01:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724808140; cv=none; b=UA2GQCwTn97BVa8j6XEQVon9VhXus6RRvRNy/g9KoteFUPqEBlGxCn5MQgBOPZPEDCl6LxbY542fXTTADlKrNXBcqikSDs3eYgR2vAUy+W0QmM4dVp/OjVzUKHY5S+bOjfFHtExJGcZ6qG+NYiaw1HQl3j1rFMg5wpgityi5Mjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724808140; c=relaxed/simple;
	bh=OT/ewFXToM+ETRFl/FZO1pomW5nvULege6FbtQqujCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=R2r/nA9XnKwS2j589B6McpGlC6ZTG03wzOalQN6PBEYf3NuGRXO7FOf+vUevwKpxQlEa4wV5Kp93V4tyOmnKgZ7tMcHbgE6zyd0fTV6B0TBVB4m8aeWTFJwIwmhaT55K4Sa38Qvplw0Qut8gFUQIz1mRjBxJc3LQqy0yMfBDudI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iG0QkENa; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1724808129;
	bh=w0UTheu8+mOgy5zb9FccWMuqVrPi69dOGezXCZDCDzI=;
	h=Date:From:To:Cc:Subject:From;
	b=iG0QkENarXxaShkXGQey0EbkqdJgscDHrfCBdQtr7pE12jSAiZrPJxvdRgOSByoUf
	 pGh0L9/lU2eVGj+wNoevgA3NGR1VkbmD7bq9o5SgBD8AjZy4FCS6Gk8MJUxGz7qk+o
	 zevx0EKvuKDceLfN/C+9QMC701kvXUnvR2ePrmShf91DdGoO+f6I35ALtZ8DD1JuPv
	 e6G0jvlFxwGxXCav+9+T2fogCN5LGQ8cNHs7WuzL1sFsklfd59PwJTVUhGFehUiBef
	 bdmZ6Duok6EXMGEjuB6K1m6w69HAMZQAS9ab7T5HDJobNNw4994dTOP5NH3TslyLdP
	 V05gjsLN8qWSg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wtmq45wcGz4wd0;
	Wed, 28 Aug 2024 11:22:07 +1000 (AEST)
Date: Wed, 28 Aug 2024 11:22:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Jason Xing <kernelxing@tencent.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Xueming Feng <kuro@kuroa.me>
Subject: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <20240828112207.5c199d41@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/70YbzUcCK6Myv5acFf2mpXK";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/70YbzUcCK6Myv5acFf2mpXK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the net-next tree got a conflict in:

  net/ipv4/tcp.c

between commit:

  bac76cf89816 ("tcp: fix forever orphan socket caused by tcp_abort")

from the net tree and commit:

  edefba66d929 ("tcp: rstreason: introduce SK_RST_REASON_TCP_STATE for acti=
ve reset")

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

diff --cc net/ipv4/tcp.c
index 831a18dc7aa6,8514257f4ecd..000000000000
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@@ -4653,10 -4649,12 +4656,10 @@@ int tcp_abort(struct sock *sk, int err
  	local_bh_disable();
  	bh_lock_sock(sk);
 =20
 -	if (!sock_flag(sk, SOCK_DEAD)) {
 -		if (tcp_need_reset(sk->sk_state))
 -			tcp_send_active_reset(sk, GFP_ATOMIC,
 -					      SK_RST_REASON_TCP_STATE);
 -		tcp_done_with_error(sk, err);
 -	}
 +	if (tcp_need_reset(sk->sk_state))
 +		tcp_send_active_reset(sk, GFP_ATOMIC,
- 				      SK_RST_REASON_NOT_SPECIFIED);
++				      SK_RST_REASON_TCP_STATE);
 +	tcp_done_with_error(sk, err);
 =20
  	bh_unlock_sock(sk);
  	local_bh_enable();

--Sig_/70YbzUcCK6Myv5acFf2mpXK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbOe78ACgkQAVBC80lX
0Gx5AggAgOSkPwGXtjXRb63XxdV4bKQjB9XuqT01uBlarHLP7CjWULUnHq1NfTEV
f58wH83Qech6DstLyFGEXeK40zwKOzzaqWlV1EHJlkQu6oE1VTjFoUdc5GbT2wbV
u+cIralPjBNieOyzmL+nm8U3WNZA4rjKquRK7BGwv4Q85JSq9LSzgRFZsSibZZ/M
gDH5cTkwNJF5KbPBgnWXmqBCqU1YcCMRLfHwQKuRJdJKKiZpQ5FFhLDepzUrxki4
Q6YA5Np0dpYY20R0t2erfwe9EqWbD8HdBt+aZWOOB33fbaWAc8XkZh40UyZcTfXq
/TCVjr8XYNMtSJCeqKwK9Zvs0AyuWQ==
=34lI
-----END PGP SIGNATURE-----

--Sig_/70YbzUcCK6Myv5acFf2mpXK--

