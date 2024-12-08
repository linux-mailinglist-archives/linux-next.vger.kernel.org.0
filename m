Return-Path: <linux-next+bounces-4898-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE29E87D2
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 21:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FA11281806
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 20:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43C41170A19;
	Sun,  8 Dec 2024 20:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="WmgJkrtP"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97F54279;
	Sun,  8 Dec 2024 20:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733690637; cv=none; b=D7q+5lI9hIrinYmWP4bkISwdOJiRtXQKE/CQgBzUvvoqKLoVJnWmc7XfVV3bcj3gOjyqzaEmCUNCKhswpqpjFrG2txQhnKhCq7t1Vk6P7Z0/2nwkulZF4+pJJ+CSNakf4QK1SR9UxZ6JrOxv0WMD8GgvljqgWoHSaEseXxVUck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733690637; c=relaxed/simple;
	bh=6BWU0hZV2jLmRul4qy+mjGDsP/wVffXC4RNo32WCxVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DWSF8bvBr0110OMhatoiHaUwnn62zmkyrBFyA/iRT1CWUQpw66Qrp5WkZfsbpOnC+1sEC74JiqPsJx8JelE6BwSN3n5E0bAyHhkNAJIxZd9xXwWukGuH2oKqp/ZFvUWmyj7VTCsAF3wYOrTiiWlbWW4rdLDncRs3MP+1erw2LjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=WmgJkrtP; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733690627;
	bh=rukCAf4+2WalAdVRmzZ9d3Ciblz8ULBlhtnSQHtWqhs=;
	h=Date:From:To:Cc:Subject:From;
	b=WmgJkrtP2N4aPC5ncN33P3Ai3X//No57PujyILJ6M/Ubic2iSc0gXFzSV5QJfQqwt
	 or/LVqjdAwg3c+SSu1qu4JL3CB+0BUTnUV9NS2sdOoeL/NICGo1/iOi+yBOt2VOBk9
	 qBxBMjmRd1BsKLREvyVHMeNhtZWLqANZwREot8aH38050/z2TqIWQziEVo3cAbkqJQ
	 hY9CXFpWIyyZbiTR5ZOSr5LSmUq6WAxpfdqhma8adSTAao/eHXtJONZxeJ+18gJU8m
	 fgMKywjAEb1zwj+tjUotP9c3qwVsA6tt1KpA0+gZrbWiLqzP2ZBOYPS1SiZ4mefz+8
	 eari9KhwwIxpw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y5xmM1twVz4wnp;
	Mon,  9 Dec 2024 07:43:46 +1100 (AEDT)
Date: Mon, 9 Dec 2024 07:43:50 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: John Johansen <john.johansen@canonical.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the apparmor tree
Message-ID: <20241209074350.0f91cd13@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TyPgLWu.zkv2QIJ3JxkTBDO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TyPgLWu.zkv2QIJ3JxkTBDO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  1432b850e9f3 ("apparmor: lift new_profile declaration to remove C23 exten=
sion warning")
  e2d0dd4fbff2 ("apparmor: replace misleading 'scrubbing environment' phras=
e in debug print")
  2b8b30835a39 ("parser: drop dead code for XXX_comb macros")
  4ce19f6feaf3 ("apparmor: Remove unused parameter L1 in macro next_comb")
  9a7d70cd5b7e ("Docs: Update LSM/apparmor.rst")
  572b0240ab22 ("apparmor: audit_cap dedup based on subj_cred instead of pr=
ofile")
  3262d1f3a44d ("apparmor: add a cache entry expiration time aging out capa=
bility audit cache")
  db448fcb9f42 ("apparmor: document capability.c:profile_capable ad ptr not=
 being NULL")
  973e9b1e8e76 ("apparmor: fix 'Do simple duplicate message elimination'")
  2d7d55704a7b ("apparmor: document first entry is in packed perms struct i=
s reserved")
  dd977e6130f0 ("apparmor: test: Fix memory leak for aa_unpack_strdup()")
  e81345416df0 ("apparmor: Remove deadcode")
  81eae8aed8a5 ("apparmor: Remove unnecessary NULL check before kvfree()")
  08c7de530d83 ("apparmor: domain: clean up duplicated parts of handle_onex=
ec()")
  30c434a8acc9 ("apparmor: Use IS_ERR_OR_NULL() helper function")
  e7e0f73d0ab2 ("apparmor: add support for 2^24 states to the dfa state mac=
hine.")
  ee650b3820f3 ("apparmor: properly handle cx/px lookup failure for complai=
n")
  2b05c4cd52bc ("apparmor: allocate xmatch for nullpdb inside aa_alloc_null=
")

These are commits

  04b5f0a5bfee ("apparmor: lift new_profile declaration to remove C23 exten=
sion warning")
  8acf7ad02d1b ("apparmor: replace misleading 'scrubbing environment' phras=
e in debug print")
  9133493a76d7 ("parser: drop dead code for XXX_comb macros")
  211551768291 ("apparmor: Remove unused parameter L1 in macro next_comb")
  d00c2359fc18 ("Docs: Update LSM/apparmor.rst")
  74a96bbe1294 ("apparmor: audit_cap dedup based on subj_cred instead of pr=
ofile")
  fee7a2340f18 ("apparmor: add a cache entry expiration time aging out capa=
bility audit cache")
  8532503eac69 ("apparmor: document capability.c:profile_capable ad ptr not=
 being NULL")
  9b897132424f ("apparmor: fix 'Do simple duplicate message elimination'")
  a2081b78e212 ("apparmor: document first entry is in packed perms struct i=
s reserved")
  7290f5923191 ("apparmor: test: Fix memory leak for aa_unpack_strdup()")
  75535669c9c1 ("apparmor: Remove deadcode")
  648e45d724ed ("apparmor: Remove unnecessary NULL check before kvfree()")
  ab6875fbb9d3 ("apparmor: domain: clean up duplicated parts of handle_onex=
ec()")
  c03093730616 ("apparmor: Use IS_ERR_OR_NULL() helper function")
  9208c05f9fdf ("apparmor: add support for 2^24 states to the dfa state mac=
hine.")
  db93ca15e5ae ("apparmor: properly handle cx/px lookup failure for complai=
n")
  17d0d04f3c99 ("apparmor: allocate xmatch for nullpdb inside aa_alloc_null=
")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/TyPgLWu.zkv2QIJ3JxkTBDO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWBQYACgkQAVBC80lX
0GxYbwf8CxtISgGJKKawcW9tjfQH/lh+HJ602KA9UJ+VyY713hMPzlJNKx2lZMF0
yIm17jfCHtGciwoagDcrE8CL9tvstalPJdklKVL3C1pE/Mf8fOK3NoxBRhk1fby3
0/J2BxfjvI35gQ+vAgd1ADp2sM9pdyn7cJsJ8yzR8VdtzFBzteKYRepAHOdXrwB/
gAfrO/c0bOurCh6QaGdwudnXhx3bMm+maxYWlg0NmzGOPJj+vWjGHlIhLfSQTbC3
+VFpnMFJbxAPMmgjSHZbbNWcxVS6NhmbqFR0fuQwDgP5SiVnPGTtwxBnJFEf+Fak
fVdOijXw3UjHBXmrMClHF8N2SlImbw==
=o196
-----END PGP SIGNATURE-----

--Sig_/TyPgLWu.zkv2QIJ3JxkTBDO--

