Return-Path: <linux-next+bounces-5418-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E08A31D43
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 05:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A4C03A69DA
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2025 04:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334B41DBB0C;
	Wed, 12 Feb 2025 04:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ncbyeifZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59369271835;
	Wed, 12 Feb 2025 04:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739333390; cv=none; b=JFE9FVRcJxMHkIqvLpJqeA5z2n2js9Xj5/EnRpaVG+DMoiTDowsrmyTdF5kc6aFj5Pb/MjdkB3G7NM4Obnal3QVztkTvd//bUc2HnGNYyPHI9rsO/dDqgna9JPHKs5gVZshJT0Hhz9CNIAPouMlu/8ap4RsXZnrTF5st2S/8VN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739333390; c=relaxed/simple;
	bh=tthhte5WpPBlPegC7zlEGximMq20wrabTaYfJhauCsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A462Ghb8oQHE8pLx+9iDQsMzMh9Q8wu8oYIAkFu/Hc5XiNuqWs6hpY+gQq0kZKXU8CqpS4nECc39XYxdB89sBXh/qEdV2k7rmlWrbNO3Ic7onEhvEZS7MosMR+dZ/M5zMI4zmTkJHa04zvD5mpNUd3UxBuZeLecnWZCPUsisdiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ncbyeifZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1739333382;
	bh=n4SLNZo+HWxGDF2NoR0UK+a6b8buuttTIBSMqkgcwlE=;
	h=Date:From:To:Cc:Subject:From;
	b=ncbyeifZUl7BNpOIJOpVGMnQ8L7gHWIJG/58yGPlTVo8OfF793g0L215vh+rpxlOo
	 jPJddWm0OW8ae/Y/V/gXFWvDEKW5mvjwo/pUMa6cu+Z4iy3NQ307r30kelWxYguDkQ
	 zX1eXHpIzs8WSx5EsBNe4nnAXz+oQ5w7B+g5FURe17WGIs+wq84Bl3Vm+ewv/JHMxi
	 H3OE6+XHdMQxXv4R341iQP1mvrcyoV3RdbBgEID3NGSvsZaOqx66lSjtoR7izP/YVG
	 tK+F8SCR2kZ+qni37ZYNJmBWEC8oVDYKB1DHfn8pH3wlPDHdSfP/H/MrGHCO43HXL8
	 WuRKHpPK0oeZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Yt4Zs6TRlz4wcj;
	Wed, 12 Feb 2025 15:09:41 +1100 (AEDT)
Date: Wed, 12 Feb 2025 15:09:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vlastimil Babka <vbabka@suse.cz>, "Paul E. McKenney"
 <paulmck@kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the slab tree with the rcu tree
Message-ID: <20250212150941.5e4fa1c9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IWehAMvErheNh3tvHouwiBl";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IWehAMvErheNh3tvHouwiBl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the slab tree got a conflict in:

  kernel/rcu/tiny.c

between commits:

  84ae91018af5 ("rcutorture: Include grace-period sequence numbers in failu=
re/close-call")
  2db7ab8c1086 ("rcutorture: Expand failure/close-call grace-period output")
  7acc2d90151f ("rcutorture: Make cur_ops->format_gp_seqs take buffer lengt=
h")

from the rcu tree and commit:

  b14ff274e8aa ("slab, rcu: move TINY_RCU variant of kvfree_rcu() to SLAB")

from the slab tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc kernel/rcu/tiny.c
index 8a52aca686a5,7a34a99d4664..000000000000
--- a/kernel/rcu/tiny.c
+++ b/kernel/rcu/tiny.c
@@@ -246,31 -232,6 +232,20 @@@ bool poll_state_synchronize_rcu(unsigne
  }
  EXPORT_SYMBOL_GPL(poll_state_synchronize_rcu);
 =20
- #ifdef CONFIG_KASAN_GENERIC
- void kvfree_call_rcu(struct rcu_head *head, void *ptr)
- {
- 	if (head)
- 		kasan_record_aux_stack(ptr);
-=20
- 	__kvfree_call_rcu(head, ptr);
- }
- EXPORT_SYMBOL_GPL(kvfree_call_rcu);
- #endif
-=20
 +#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST)
 +unsigned long long rcutorture_gather_gp_seqs(void)
 +{
 +	return READ_ONCE(rcu_ctrlblk.gp_seq) & 0xffffULL;
 +}
 +EXPORT_SYMBOL_GPL(rcutorture_gather_gp_seqs);
 +
 +void rcutorture_format_gp_seqs(unsigned long long seqs, char *cp, size_t =
len)
 +{
 +	snprintf(cp, len, "g%04llx", seqs & 0xffffULL);
 +}
 +EXPORT_SYMBOL_GPL(rcutorture_format_gp_seqs);
 +#endif
 +
  void __init rcu_init(void)
  {
  	open_softirq(RCU_SOFTIRQ, rcu_process_callbacks);

--Sig_/IWehAMvErheNh3tvHouwiBl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmesHwUACgkQAVBC80lX
0GxS5wf7BbSgzHps7mfyUWYTO4TIdMd1hxLeX2llH1x5pMJ4IZQWD+mswes1MFzj
hc0IalEAiQX0x/3BAeujd4h/NdicoO8QHNTp5C/Ilu+bB42NPFxcm/K2CPyWo//Q
ACDhG40WI8rzbFQujfZPj+uK8MYnwWJsps4wcUIY9rqjTe5NdjC7RBHAro+66n1n
QRG74TgXFvQjvX7YClb1aC52JHR2l/PE+pLn0jBFV6i3tAGU6H5TeaW2rx7012NS
YB3kYcCJpu5NHz6wCXiSHVHbL4wMqPP1frbfLZ0d55qBrUcm2llb7Bp7wqM0P35E
xAPZERM4FOEvJgbx5xYhzjanR6LcvA==
=Eaos
-----END PGP SIGNATURE-----

--Sig_/IWehAMvErheNh3tvHouwiBl--

