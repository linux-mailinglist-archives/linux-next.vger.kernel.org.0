Return-Path: <linux-next+bounces-6620-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E17CAB0682
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 01:33:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E8461B6739D
	for <lists+linux-next@lfdr.de>; Thu,  8 May 2025 23:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D603A215772;
	Thu,  8 May 2025 23:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Fu8ZXCYL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01BD2153ED;
	Thu,  8 May 2025 23:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746747188; cv=none; b=mKO1uCir8D6KuZfh40OdRazP65OrIR5+IT25PZahKFcvnlQOb1hDTgBBOiNJnjRH1W/AgcuU+W9DcfRQWjAUX6O6I4xm7U9Y6IWp778MptqhI3zHZ+nPDEGlDr6wsURSTKa+3qNS2vyZiaqVTbULEnkeDnynzQtoLQsayEzeUx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746747188; c=relaxed/simple;
	bh=M+74eJenX8RtxoAWRJk99DZySnYqroLoXj88m1cIHLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NVLz7EEq21a0A1erW8xJ4lEJ2H3+SmvQkG54j11DPwM0h6Km31TgZUP1C7pawHetXvaflt8OpH4J9mKIAKKpEf0Huo7NDO6D5w+dYV+/j8FOU/ffkHfctFVSTTURgpvRpFn0n+hw5Wz8xhcBJhkvpz1YNt9dZpzQpKhgEP5/2bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Fu8ZXCYL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746747179;
	bh=fbeboMrwAN2XrDwcUJlw1eeFAQ+G8DTbhaKCk7hlOMc=;
	h=Date:From:To:Cc:Subject:From;
	b=Fu8ZXCYLkqOYY9Mm4Np+H1jPNgZ7ZlsgGXuZTFT6dz+Q8nth5XEt8KuuyEU6AJv+A
	 OrTVAuFNgEAYU9rJzgKQEhBK2mh4LxGfh9OI/IqHVcYpxCOHpqZngRTQKdY9AhYaZu
	 ZdC8aL8vZKl2987HVeXrRjMK4Z5kiZv9JnGQ0lARl/pwbcvkLl6albIqBBvX8Jtt6c
	 elymNu1IOzQvQSLyv+/kHoFAzl1oEWD+ZWT37XVKFfebM/xBnPxJ4swSxH5ER0gIYp
	 Y4Umbyih3N1I0NyCxpm2mYs8sHlckOKECSlx/cIVMeQWH/hY8rPU3q/5rGiLP4ebKl
	 2ZYkMBA93e+dw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZtpMv0Ztnz4xS0;
	Fri,  9 May 2025 09:32:58 +1000 (AEST)
Date: Fri, 9 May 2025 09:32:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Sterba <dsterba@suse.com>, Kairui Song <kasong@tencent.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the mm-unstable tree with Linus' tree
Message-ID: <20250509093257.6f30ba58@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/79.o8MQXpJZ45fZVIErQSoB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/79.o8MQXpJZ45fZVIErQSoB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the mm-unstable tree got a conflict in:

  fs/btrfs/extent_io.c

between commit:

  38e541051e1d ("btrfs: open code folio_index() in btree_clear_folio_dirty_=
tag()")

from Linus' tree and commit:

  88916e92c953 ("btrfs: drop usage of folio_index")

from the mm-unstable tree.

I fixed it up (basically the same change - I used the former) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/79.o8MQXpJZ45fZVIErQSoB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgdPykACgkQAVBC80lX
0GyyzAf/WETY2qHzPUaplID+ThFhTJfr0c62q0+DdKTXdjdaEFYYGpopI+Kkbex/
y2GKaBuMF3EfCUyHqCOHocMkXIY/eEP1aLk402OeReoOswyH2ry5i8w39V8S+OH5
ZdYMKLXCirIzQqTKrf+GOKOPn5dLl9vaSRehYoUrkvDCiI63d0q0zPs9juSughF9
+YjiQHgaF2SZxyIy5ysw53M9qCzR8lbFNXs16E2ErYBQxDv1iF8bJOavUjNimiHt
sQvLAlkgLKyHTXa0O3CjZHQY3DqF7+9uHhDKnyxcRqE5JyPVpj+mBJ+RKmfIIS4h
aAHZr4Mx/HLfBRb+LUhN9LhaEQMlmQ==
=rikT
-----END PGP SIGNATURE-----

--Sig_/79.o8MQXpJZ45fZVIErQSoB--

