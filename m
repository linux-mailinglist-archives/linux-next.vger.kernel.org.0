Return-Path: <linux-next+bounces-7305-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 249EDAF0BBD
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 08:36:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD8DE7A57AA
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 06:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7127821D3F6;
	Wed,  2 Jul 2025 06:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hu0MWRDy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15746219A72;
	Wed,  2 Jul 2025 06:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438188; cv=none; b=ORZmMaKXppa6oQ+b2MkVUONEjD0v+Grf9dy9rp0QFbcUEsUxogz/1K+SL3HgHpPTYTPaFU0JjoXY3IxN04+22OoQDwQCsfHx18i9Ao69wBy5eoUF9M2E7+YTGC5iU08dHyk6ers3bu/1LqywnAY24wssFLExodG3D9eHmAOc+rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438188; c=relaxed/simple;
	bh=V4QjxPC5V3OVInIUvfeN2FPT8MN8DD7KSv0VnN9r1V0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sAh1YIDYW0RBOIfo6GFSDcvjOBcWjOvuQo4pf1IA85OVwzXZWh6aqVKoy9Jd5/Hp6BXym/7aCzDmySEJABsJ/BNwTxy8a4Rnc+xSOkXXebrIvVFtF6UYRqt+wPkGNnusbI8QVHq6A1zRYM30mqPV+5oonAzWqfuPh2446YLyp6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Hu0MWRDy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751438168;
	bh=YB2UDereTETtBpJlylMDGKHz/iacjhjFr7eKz4FmJbY=;
	h=Date:From:To:Cc:Subject:From;
	b=Hu0MWRDyd6ZerGfP04o+5eE95VTrje9Ap2MnjXGHeQyCtv4E3/CMY8/j6x6zJNI06
	 jiixwpBxMRZ0FhDTpN/1691ZwPhVTMz8sFBbFMweCin84CoRAMHqxTv7YlaNPLWQj2
	 4YJbJZCd5VbIB6cFt352rDXaEJECulc4eWWnAd/nERKVkDmtFcuVfFBIPZ2l5SxU0/
	 svRRp/SpY3gcm2eJQkftp4EdATVsRD+GkVZQNLVg5zLimU14pEZnaJXezyshtqqcOP
	 H360MmMB2SW8i+ARA4t8iiLRTfNm7uTR4P+nPmmt3pZgdYeQDm3/QXgvmaws4h84pH
	 cXsumRuexMtPg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX9CD4Dgdz4wyV;
	Wed,  2 Jul 2025 16:36:08 +1000 (AEST)
Date: Wed, 2 Jul 2025 16:36:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the kselftest tree
Message-ID: <20250702163622.12bd45dc@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aDepFjW6iKDfG28yKNUQAma";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/aDepFjW6iKDfG28yKNUQAma
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-nonmm-unstable tree as a different
commit (but the same patch):

  fd4fadf0da98 ("selftests: ptrace: add set_syscall_info to .gitignore")

This is commit

  1d8c98f3b408 ("selftests: ptrace: add set_syscall_info to .gitignore")

in the mm-nonmm-unstable tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/aDepFjW6iKDfG28yKNUQAma
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhk02YACgkQAVBC80lX
0Gycvgf/RQB3xwowT9piwkEbNhDvv3mtTYBUgtYXLA0zfZjfaqX4PV0gbjEWxisA
auEbpE24j3r3D+npdP/RnzCuujQ7xwPCKG6FuEOMgWy3wIMgxQ+e4SoOYmOYXqST
4UlHZJ2KTWtUFbaFPqjoqcUl8Ho2HNJAzH6dxr6eRMGXEp9yoAEvTmbIAw6e+40R
bo5+KkR56bvWQARBK0qRCa/1boeptmRKU/6um3M3kMaaVNb8/beURaQoix59D6al
OLYP3FfpvVkmDItJ5UtOZSagdA15ytysdQkpxCNcAFmsMBfcPFqKe2mf0BSx7uZA
Y+AnuaFagifoB06Tciqnp6kKDhMdMg==
=DGPV
-----END PGP SIGNATURE-----

--Sig_/aDepFjW6iKDfG28yKNUQAma--

