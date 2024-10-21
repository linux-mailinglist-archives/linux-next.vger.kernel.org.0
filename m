Return-Path: <linux-next+bounces-4341-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A709A586A
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 03:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC3A8B22147
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2024 01:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9478F5C;
	Mon, 21 Oct 2024 01:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iBa//zF5"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9DF8C1F;
	Mon, 21 Oct 2024 01:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729472799; cv=none; b=eZF3LOOT7gjp0CIXse8DFxfkb0lC0yepRUrVOwG2YA8FIgoGb5rdnT73tx7yqnOigwsA3TjlTTYUTztlLETiUcJ32Gz2YhZwiJUAPTSA0LkhgOTTZP6ue3taNqmw8NFShjC9obfn1qBx1VdI+tKhHcxKLoI0mQIiTUeZiQ1pQ90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729472799; c=relaxed/simple;
	bh=BtAcvx/sux07+eU/FRiTOY/hS3eUDtaOrLdxIHVXp3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=H4lCWGrUPWvjRMwmhUhXfLqpnrU3myMX6y8otHhvrPGSA9EYmFL/4PdNA+Z2Zv8iVWS2Lkltd6TFsx1LadM1MjVyUtyrxOjRpBEyq2axzRZ4/GvvCJdMPG9/C6aTYTcX96EkDYx4Y9nU8iHgorM2cVh5QuzwK9w8Z0zAtnhFDeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iBa//zF5; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729472792;
	bh=Czs2ytMjKemwFBjo0/5X+QuiwirorhOYul1Z6Cqz0Xg=;
	h=Date:From:To:Cc:Subject:From;
	b=iBa//zF5qyqX+GuurFBlB8mgdMaDGh0mSNQ2xCx3Rnj/X03kpUwANp7F9hqL91rii
	 5nr7IQj4t0ObAa/NStmOF7zSU+lmf4zZhaXjVyYbWZ8e6jLMMQZn9T7y5BzX/96cwj
	 b6IVtHy6+U3Wo977mruEMLDhD13/AlFAs1Jw8LL7qN075NeDHMFm+661CT5ws/X667
	 vLdXO1OQy56zwRPnKAKoq9M97Hi7lQ2vUPT9ZNdXWbfAACt+MpbHMfUoPue6oEk2TD
	 oq/c3n7buGCwM+BP0alNnHK2pe0qDcJ+Lwx4oIf9SH4LEKilIeII36J3OpJ9o8jmBY
	 AG6gDSP370bLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XWxw731bWz4w2R;
	Mon, 21 Oct 2024 12:06:31 +1100 (AEDT)
Date: Mon, 21 Oct 2024 12:06:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Breno Leitao <leitao@debian.org>, Christoph Hellwig <hch@lst.de>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the block tree with Linus' tree
Message-ID: <20241021120631.5ed43983@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NDE5wawB=d8h478fcM4_jiB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NDE5wawB=d8h478fcM4_jiB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  block/elevator.c

between commit:

  b4ff6e93bfd0 ("elevator: do not request_module if elevator exists")

from Linus' tree and commit:

  a2c17a5ea44f ("block: return void from the queue_sysfs_entry load_module =
method")

from the block tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc block/elevator.c
index 9430cde13d1a,d6b4eb5443d9..000000000000
--- a/block/elevator.c
+++ b/block/elevator.c
@@@ -708,23 -709,12 +708,21 @@@ void elv_iosched_load_module(struct gen
  			    size_t count)
  {
  	char elevator_name[ELV_NAME_MAX];
 +	struct elevator_type *found;
 +	const char *name;
 =20
  	if (!elv_support_iosched(disk->queue))
- 		return -EOPNOTSUPP;
+ 		return;
 =20
  	strscpy(elevator_name, buf, sizeof(elevator_name));
 -	request_module("%s-iosched", strstrip(elevator_name));
 +	name =3D strstrip(elevator_name);
 +
 +	spin_lock(&elv_list_lock);
 +	found =3D __elevator_find(name);
 +	spin_unlock(&elv_list_lock);
 +
 +	if (!found)
 +		request_module("%s-iosched", name);
-=20
- 	return 0;
  }
 =20
  ssize_t elv_iosched_store(struct gendisk *disk, const char *buf,

--Sig_/NDE5wawB=d8h478fcM4_jiB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcVqRcACgkQAVBC80lX
0Gyj6Af8D8rChf8buMq+bkYxDoQkCDdyEsYNCXNlJ0HcGsAGEXPtESPDJQJG+Sf0
Hpc2zh15UVDYAIyLz0QExLyuSwPGOZ9W/ICjRVExUOxoqe+9AJxx5wQRTFwgv88Y
spQsHgn9d1cF7Fb6Aw7dG7t/1IT7RrvHMTi4EjDi0A2DlPIXd+WBabxwFgzFKxrK
VjHWSGxjTrk5OE1YZZUe1yNS+KzliOwtG/f2TFU33EUAvavuE1K28ZpY9es2AWBo
wmlxxot3DaYEjqeWBAFxKC/nu1haeUkx7DBxyzbZ6F0j7w4GGE5ASki8a6uTO+ju
xAsDqo8Hsy15bX3hAwsfI6xfKzLAMA==
=rXll
-----END PGP SIGNATURE-----

--Sig_/NDE5wawB=d8h478fcM4_jiB--

