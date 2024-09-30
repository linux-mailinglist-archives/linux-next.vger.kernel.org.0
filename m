Return-Path: <linux-next+bounces-4022-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A35B98B0A8
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 01:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1242B23020
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 23:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A19A2188CC1;
	Mon, 30 Sep 2024 23:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="B1RNi9lJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2558186E24;
	Mon, 30 Sep 2024 23:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727737906; cv=none; b=Wfi1oeNaiQqK5VdOJJNv13S9dIcGSnXmnS1Z41gj62bpSrPGcnl/JjcOdRY4/xPEayDbfGmLjc0r4V+s6L575tEztlEuucjaweZjOYb1XYejXfUJjZhd2IoBl7EuHaus62QnSNSpvIWf0gvqJkdlbHOyyzpkMFyyQObpJWu5nnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727737906; c=relaxed/simple;
	bh=NYXnSSeBKk2VTEP/KkCVZOmQvFmKIuNvOkRbY83JZSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aNfgjDdiSw2QFf1uJCl1m0lp7F+AYtpbRKUCiHSR1ZoTroOt2plq2TIpD+xOpoU9jSfT1RxnbEHOs3btCPqnXc+tYw98CPjY8Tz7R/vsRwahKEjwaTuNEsv5yh7ASHZM/u/dAG2FkRcc9H+/XXQ9e5C8/yQvzdGe5I+1ywKhpV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=B1RNi9lJ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727737894;
	bh=1l0TkxmTIAr6jaBDS+uvP74bk2FQ3qnSyXWdIIeS+os=;
	h=Date:From:To:Cc:Subject:From;
	b=B1RNi9lJlTfgZGFZYIEbPdsl7QE9+0BAH8wh0qXxFKUE2h0Gqha6fjrwadgt1pRaq
	 io+LFHbY1JqOxhwxkTDcVUe43E1S1F7qh6S5cWM8obpmT/YRi6qGEy9yx45FHitfKh
	 s+sP7/NRc5+PArOFyAFC0+pFcoGbhCjQ39701srM1QytAiz1s7iLIEolfBCY/7Rw07
	 tc9QrRpqFtsxg/4Jxa6Vo735rsESnhZC23oMkJKWxcPhcgDUA23C9qZXE+JJmwN509
	 UzzeCWk57c59mBEpMdnnDkoZXnqUSiKdvuaHOu14mrfP4V1qJFxQIWubz8oxHjMP1d
	 gCSibexxilXiA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHcJk44LZz4wd6;
	Tue,  1 Oct 2024 09:11:34 +1000 (AEST)
Date: Tue, 1 Oct 2024 09:11:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Benjamin Coddington <bcodding@redhat.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20241001091134.1eab47c2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eNdsL93BM5u43k.NsR2oK2l";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eNdsL93BM5u43k.NsR2oK2l
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/lockd/svclock.c: In function 'nlmsvc_lock':
fs/lockd/svclock.c:483:34: warning: unused variable 'inode' [-Wunused-varia=
ble]
  483 |         struct inode            *inode =3D nlmsvc_file_inode(file);
      |                                  ^~~~~

Introduced by commit

  81be05940ccc ("NLM/NFSD: Fix lock notifications for async-capable filesys=
tems")

--=20
Cheers,
Stephen Rothwell

--Sig_/eNdsL93BM5u43k.NsR2oK2l
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7MCYACgkQAVBC80lX
0GwkRwgAgGzgC/Dhty7ALD7LrFm4OkjV6zoCXjClpI7ocDiedpCNiIfP4rRCzoLx
yyFCdu8RDuQL902Pchg6EmiVIi27baaEpeTg2eS6IYB9sdpvXjfscJLTF0Aquler
JGDcyljE9yHLg+RrfNK/9pzzuVG+LcYknmz2ZJZOne+8norfe5Rcwkw8wxsWOmFC
CK/zMISFj8eg839HDO1KcRxGlvbEoS4xxV9STjibWjo5IqysELzl0SYCx2D8RdxL
9lVsTPHv4wYIIEwISeq0ygGz6snnlgbjhdywF8NS6MbUIqxaIRU7YBQlfoe6cESG
psk8m2ephaLhGv6LxMupuvDAJJ/r+Q==
=2Tcu
-----END PGP SIGNATURE-----

--Sig_/eNdsL93BM5u43k.NsR2oK2l--

