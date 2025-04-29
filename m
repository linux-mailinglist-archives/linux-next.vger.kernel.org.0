Return-Path: <linux-next+bounces-6436-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B05AA06C1
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 11:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79B9F189AF66
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 09:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E00F42BCF6F;
	Tue, 29 Apr 2025 09:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="IvZKxd7x"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9937B29E050;
	Tue, 29 Apr 2025 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918126; cv=none; b=S2sFQTYunaohCVc6DQ3biIq9CXpk3qqEzL8nsbYkHEnXmSixS3JjBO3npybHF6T1oxBT0I8e9LbMpN1ScWz46CrI5iDvXB/csxRm1nJyAY1YZm+EGbAxx5oHI+Zr0O5etJxs5ml4l7qqpawTMzjpx/inSfvGE0PsdARlWbNRbAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918126; c=relaxed/simple;
	bh=c708bh1BAzg8GkvuBglqGr5yJumeSZvjUu20VzKp+bA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HtyuELeut4lZP28gOPHolPIb4TLnI+m2gYRHj5iManq83xqYVsmfmXA7y8AIFergM6nfOtJP26Ofsf0DYx0kbxDqHGsRyjfvU+8SBAsBqEXOMllMg4Ff5rx2VT0G6SkL4gy9EWRsf/jmTEFpMhHPxgdgVZ4WCU552/26HpcXzks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=IvZKxd7x; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745918122;
	bh=4T+TSUqSTmChsT9BYGX7xvF9Hv1CGd+hkKeH9kkP5Og=;
	h=Date:From:To:Cc:Subject:From;
	b=IvZKxd7xEaL54IMD28NtMgPeZRq2wY4V7g/GrwzGCSZUdI35uBbQ4RZhxtUhN0uki
	 yTvfU0fUGVH5nV9iAh00R58NziFKEJl/ktGw1oQGRbNg+gnIr0AsRVKEsW3ObyTZRt
	 m2kCCX2i4irOx6Bc3dhHYMe3ZFbgrOHq9//+RyCAcagJgUqVJmMJ+/e41MMoUek5zZ
	 tbZm6MePF0N8HLtOdZBRUuPTQpOF8OFqVojmiLyK3TqZH+9VbinGcoYO8k03ZZL2Bv
	 KeAkqXUsPueLGp+EdmCerfrJQFmMELmj7Pxv2Fd2M7RvVKylJFSnyuEtQo6RycYAIy
	 9E4tzyMUP0IVw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZmvmV4Nq4z4wcy;
	Tue, 29 Apr 2025 19:15:21 +1000 (AEST)
Date: Tue, 29 Apr 2025 19:15:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the vfs-fixes tree
Message-ID: <20250429191520.5aa5f923@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/K5xZc2wJG/X/3aZPFxrykSF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/K5xZc2wJG/X/3aZPFxrykSF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  72dbec48ca3c ("do_umount(): add missing barrier before refcount checks in=
 sync case")

Fixes tag

  Fixes: 48a066e72d97 ("RCU'd vsfmounts")

has these problem(s):

  - Subject does not match target commit subject
    Just use
        git log -1 --format=3D'Fixes: %h ("%s")'

So:

Fixes: 48a066e72d97 ("RCU'd vfsmounts")

--=20
Cheers,
Stephen Rothwell

--Sig_/K5xZc2wJG/X/3aZPFxrykSF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgQmKkACgkQAVBC80lX
0GyZ7Af/YgMY970Nz+kbbhCCQc+dmCht5WrmXq/ukzxoi2cfPMe4Fik1TsaDIGeo
VP5LNy8FKEBQ6biLr6QeLiqcZA+IvVvi47MmWjYPAZP1JRAFQnDcDYKbv0eGM5Le
Qk8JUiipZcNRX5oKk47xtc17I8XaCSUF+MnnzMIcvXAwOaOYUL7qpOOtLdYSM4xG
w+XU/mRhMPZQc9cjp2LJPV+k7X0gy+ma76UziurSJ2pSJovXHKBqqC1wPUY68Mif
cd9klnTBIeFVbwgTIXSOqqLywpmunu9egnp16vaDVaTFGxN3BVHIo94gmFr+ge0F
B5bqGV32RhT9w9PeBMbhTOkwxugvqg==
=uM+0
-----END PGP SIGNATURE-----

--Sig_/K5xZc2wJG/X/3aZPFxrykSF--

