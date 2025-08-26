Return-Path: <linux-next+bounces-8098-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE8CB355AD
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 09:30:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88745E6061
	for <lists+linux-next@lfdr.de>; Tue, 26 Aug 2025 07:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B20F2D0629;
	Tue, 26 Aug 2025 07:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dBguUV9A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8A1F4168;
	Tue, 26 Aug 2025 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756193449; cv=none; b=lbsLkZOQrLMX9hddkAJIWvTO2eAO6kTSanZ68JyOU/HEq2fkNequJYoYlWaRZr8oO1qPdoF4YHoTja5Sq4ghw5nm6pZSHnMB/NAWZwlsVmHViA/lU/IueIj+hbV73Fugiciq88cuM4lvIJY0IBHxdgecMxgtCcqkJHW1AeN9qAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756193449; c=relaxed/simple;
	bh=5S3UMIPodNVjhpTMEeif7jUhrrR8As+5RgHewPDs4Wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=l6FZVJ7dAr6pv9GZZUUyMXhyZJIW7q2Dnv2Etmgo0AwqQHGgWFSeNGKWLN8UNqFLl959Aq2MAU0+SfKxtUYyQNgEQ19ZAE91h6aOiTJvGzLOJl93Fv8loVE37krl9GcIaet5q6IHco7FNu3npYhcUOOfYdVxf9Q2epo2Jeg7mIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dBguUV9A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756193443;
	bh=77SwepCLKUh1bVS5Imnq5tF2/c3yBBYQ36UNb1v4A7g=;
	h=Date:From:To:Cc:Subject:From;
	b=dBguUV9AI2y7gACs0UZ4dlNWXgC2Pzlr9PZpTkaG7TsYSBKkvt4F4EEqtM02Y/raX
	 XBjbUze4JqwNM5OpS0OULT1PtBzzsI+RCAs5PcidFeE4sCO8VuX3XIkg04n+OVatBh
	 P2PkzAu37fG/A9uO7LCzMB62Y8wD2mry9AbYFw+T4ytf3j3WwLcdOm2kNgQHwmINVn
	 pvx5XFionbp/wyz2YuUzCwiCiNz3Uln5L+PNU7TWPeeFs+SnGqZLKVtORyivtSjCQB
	 E5fDP5E33zz1Jk5Vfw75h4JMyU1oKVBReMFsU5BszTiRWVj1R6Q4OD7+3e/EQHzQf/
	 KEfGlex3DwYDg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c9zpp05Qkz4x3j;
	Tue, 26 Aug 2025 17:30:41 +1000 (AEST)
Date: Tue, 26 Aug 2025 17:30:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Danilo Krummrich <dakr@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Vitaly Wool <vitaly.wool@konsulko.se>
Subject: linux-next: manual merge of the rust-alloc tree with the
 mm-unstable tree and Linus' tree.
Message-ID: <20250826173041.3140da7b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tkEKcYWrGrPL0t2ufggYFxO";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tkEKcYWrGrPL0t2ufggYFxO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the rust-alloc tree got a conflict in:

  rust/kernel/alloc/allocator_test.rs

between commits:

  501046225a67 ("rust: alloc: fix missing import needed for `rusttest`")
  c8a3b6ec0370 ("rust: add support for NUMA ids in allocations")

from the mm-unstable tree and

  0f580d5d3d9d ("rust: alloc: fix `rusttest` by providing `Cmalloc::aligned=
_layout` too")

from Linus' tree and commit:

  fe927defbb4f ("rust: alloc: remove `allocator_test`")

from the rust-alloc tree.

I fixed it up (I removed the file) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/tkEKcYWrGrPL0t2ufggYFxO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmitYqEACgkQAVBC80lX
0GyBGwf+ObqCR73wDy9xiuhF6JirEFCC7Gmnxm2Y0ouoKnMnbIVAx042V+4TrEfi
+kNk1stFCASzYRU7L7eVF4Akg2jbW8mbYi3/wNhseCdlshdo/q9VfLfKtX8K0ot2
QzuX3u/0mvjGa2hiyQB/1l5ywhHZDpMLvylFSAgdeSFLLjmy3wE6PU01J6SLE+zl
RLkCHqT826M03HDcX65wQAe+37wHS0DHrQSXy8Y/P2nFNzVAmdbmR49jTOCYDEXi
hwRqnYonUvU/MYLINyfzTEXUgzmgadEXLYI4o11AEjbA3rFxaI/vZAKWzqQ8coSH
9h6gtSki9CpDz3/IiJXzPL/suNkmwA==
=mcCp
-----END PGP SIGNATURE-----

--Sig_/tkEKcYWrGrPL0t2ufggYFxO--

