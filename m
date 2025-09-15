Return-Path: <linux-next+bounces-8300-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25263B5824C
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 18:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A3CB7A17EB
	for <lists+linux-next@lfdr.de>; Mon, 15 Sep 2025 16:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CFD3B1AB;
	Mon, 15 Sep 2025 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qicALOeC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8207227934B;
	Mon, 15 Sep 2025 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757954311; cv=none; b=IjkNVP9Emtavw51/k2WgbMv8Zbi3179BTuPCYEkjqTF4bqtMpFzkBABBXbWI2tdinGLscO1zfDKOzEFqnbhKYDmBMFpuHayBipnDT4l4OKjqhB7bmTtxz4JXgCdKMiFTSXTGHJcScCdYcMsw7YBLzn/xWr5D1KLn908Bzoy1DGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757954311; c=relaxed/simple;
	bh=rPux3kZ+R4cKlhfcbqH6Q3wPadbmps9lgWzK5w84qUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EqqKPDgQRdDNvwlvYZYWoPDOP/arkNOX6W+pLAiL9c2zVetqHgwv2XXQFToKyJkUhfsC8PNGdnwmcqwvhh4S84T/WfBafXnwRq1FftCdO7edA4PAyMSUm5Muuotf/1AzVuJGzbwkvw6rYEhUjlkyfMn9aQ9LHeY2oivMQl33cxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qicALOeC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F37C4CEF1;
	Mon, 15 Sep 2025 16:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757954311;
	bh=rPux3kZ+R4cKlhfcbqH6Q3wPadbmps9lgWzK5w84qUY=;
	h=Date:From:To:Cc:Subject:From;
	b=qicALOeCy/B6hol6Ze0031B5J4oMt5saZygVSnd0z+oBlBDinX7+wt11d9FAQGv9h
	 VocGaZ7P/sltKlMQotnahk8aXH9stVjKZeAG4RnxDFOeTW3it+WWrIPg5uv3ziclYl
	 3MGjafqH4fPcPu6B9AQ1gjEFqUKcC+IKy62yOr1cAvO8R5ZdSV9Foywg7xFSxvB7Hi
	 JFDsMmrnrPj9fO4g/cgQHdsekzNWClwNKcGmy66ACiqukkH9DcBtW4Y9EEHcWpgzOe
	 sCtkhkakJfsc/LOHT6TJhaWLmEIqM28rKevU2hvcIAfpT44Iqg2jqIJ0uQy5LVuW3Y
	 rHzUZWkmneGRA==
Date: Mon, 15 Sep 2025 17:38:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with the fs-next tree
Message-ID: <aMhBAxSlU-vhVqxQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kCTZdpj4RhxVWrrE"
Content-Disposition: inline


--kCTZdpj4RhxVWrrE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/namespace.c

between commit:

  96ff702edaec8 ("mnt: support ns lookup")

=66rom the fs-next tree and commit:

  91e682db2fbe1 ("mnt_ns_tree_remove(): DTRT if mnt_ns had never been added=
 to mnt_ns_list")

=66rom the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/namespace.c
index e3ac6e06be70d,aeeb33bf3e7b3..0000000000000
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@@ -153,10 -195,26 +161,10 @@@ static void mnt_ns_release_rcu(struct r
  static void mnt_ns_tree_remove(struct mnt_namespace *ns)
  {
  	/* remove from global mount namespace list */
- 	if (!is_anon_ns(ns))
 -	if (!list_empty(&ns->mnt_ns_list)) {
 -		mnt_ns_tree_write_lock();
 -		rb_erase(&ns->mnt_ns_tree_node, &mnt_ns_tree);
 -		list_bidir_del_rcu(&ns->mnt_ns_list);
 -		mnt_ns_tree_write_unlock();
 -	}
++	if (!list_empty(&ns->mnt_ns_list))
 +		ns_tree_remove(ns);
 =20
 -	call_rcu(&ns->mnt_ns_rcu, mnt_ns_release_rcu);
 -}
 -
 -static int mnt_ns_find(const void *key, const struct rb_node *node)
 -{
 -	const u64 mnt_ns_id =3D *(u64 *)key;
 -	const struct mnt_namespace *ns =3D node_to_mnt_ns(node);
 -
 -	if (mnt_ns_id < ns->seq)
 -		return -1;
 -	if (mnt_ns_id > ns->seq)
 -		return 1;
 -	return 0;
 +	call_rcu(&ns->ns.ns_rcu, mnt_ns_release_rcu);
  }
 =20
  /*

--kCTZdpj4RhxVWrrE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjIQQIACgkQJNaLcl1U
h9DnwAf/dcLBqnRwO5sx78mBtOb8drd6mySRt2aQOlowkw62+4mZh3As+vOW1osW
rHKD9iEH/I5hFpNWTClFsDL2AFHmAg+f9RFwlNuT2vdApoRNVkiDd28DGP/3cQpI
BVZrAc5jRpAxJ2on3EQ+gt/rbHwy+KrRceLYl0BtHj6Fkr8NcZTxap2/wDYn333M
uR+4QFErsNvpkAzdMyfNLRoG+DChwx3nsE2r3MKm3xUAq1vsW5kTkcaIiByB5Ypk
1Dlb6IdgvKn9qLAeoWMLRgaFOA9sQSRndwabbRfN/yFqWeuYTYPor1O/X/FoVRjl
3V+wqGz3p2l+5VFL2BxwemudA8EOmg==
=uH/+
-----END PGP SIGNATURE-----

--kCTZdpj4RhxVWrrE--

