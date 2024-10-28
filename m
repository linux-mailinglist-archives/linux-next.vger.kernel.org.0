Return-Path: <linux-next+bounces-4467-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672BF9B2327
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 03:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6EF3B21B1C
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2024 02:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FCC0156F3C;
	Mon, 28 Oct 2024 02:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="r2ibeKvG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A95A2C697;
	Mon, 28 Oct 2024 02:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730083783; cv=none; b=gHTqlYon2QjNj+KfRvVVsf+b04+K+b/oU9m2wxXjlywgrEh5sHx8H9iGmCyPAJx+ovgQzOpk9/LnB75nlbd4MnlGURGy5tztFCehR0VyxRlhl8Fc62pkL54S2PLGv63JtDUHyX8SCFSEIZeJ9KuwmdyzsXLO1V1VJ9XFsoTypUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730083783; c=relaxed/simple;
	bh=1Spm69gr7rLPdHlHF6QFHhxwT5B1oPEfxNHWBWZDx7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=p5ILc2kXEHZ98xWKeHqXDevss9H9xn7FVo1yfUgwwN4+q2wU2yCj5IBnpiN7MqMfQ04Rdq7izQAcIuRwL88M2AnRvzd1lEUg9/NQMhLq68sH69HT6bdO1XmC0AI9aJlDX5NOcQ5Kp+ckK0fzOgEJzNap3+10CBtLbNuz8hdhvxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=r2ibeKvG; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730083775;
	bh=mRYf9ZVWENutyeZOw1NtAF39x5//TNGDCafQQZFRw/g=;
	h=Date:From:To:Cc:Subject:From;
	b=r2ibeKvG1WMKLsFQddoMtpcwhIl7dY8pLV7luCEEeegIHsKndLIIX7HI3ESKbT8cn
	 V2CCOJ1VNkacGdM0sP48+jHUq+w0uKMOZMa7DEqqw9Q2ULZ+5VOwRl9vuLwa+o21uZ
	 PiHwQaOjUuX5X3m0kmzEldXIFZElAKnKGcmCyRuPahZ+8czsA0ddkJM31ZT8TeV2hE
	 qTMNL6tu28UEUiKuzqbZEaIdhaDEK3k6fU3AKwZPc4IURfM+LEclEL5LqWI2vTaBmI
	 Ee3/0WerCr661hg8SlVhV0K3UPxcf+DYpUYQyFE+Hlbhr8w7e57u8R709zn99mUokG
	 nul9K0Imvx1iw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XcHsp6BVJz4x6k;
	Mon, 28 Oct 2024 13:49:34 +1100 (AEDT)
Date: Mon, 28 Oct 2024 13:49:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Cc: DRI <dri-devel@lists.freedesktop.org>, Badal Nilawar
 <badal.nilawar@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20241028134935.48828a6d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z_6=.=V7=hBop7w1tE+Ht2Q";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/z_6=.=V7=hBop7w1tE+Ht2Q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/xe/xe_guc_ct.c

between commits:

  db7f92af6261 ("drm/xe/ct: prevent UAF in send_recv()")
  22ef43c78647 ("drm/xe/guc/ct: Flush g2h worker in case of g2h response ti=
meout")

from Linus' tree and commits:

  52789ce35c55 ("drm/xe/ct: prevent UAF in send_recv()")
  11bfc4a2cfea ("drm/xe/ct: drop irq usage of xa_erase()")

from the drm tree.

I fixed it up (if it wasn't for db7f92af6261 and 52789ce35c55 there
would be no confict) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/z_6=.=V7=hBop7w1tE+Ht2Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmce+78ACgkQAVBC80lX
0Gw6uwf+Prp+wtXTzKLVefrHz5qr0H27/IXiB+umUkmZqG4FfIe3FsCFjtqeEN0s
ybBASn4Ra0R94YfPJqt+k3OwdjCyJktG7Mqy71KACyVBJhkwXKHKxAofdJA0RH+J
fKH+mnoRAUaH5qD2RqC0cVWdFMehKMvR/nkxzET/mFTPwuU3Tbus7B//UOL1EISi
Fk29ndeu/cjJWzN0AKtPP9GnE5ETDWzG73+Ll3ndC6ml48fLLzN1PS8KMSFhfldi
D5IuBcEgnGxHxV+dssHzU7S1NQ1z0Xb8FEShoh3hgcJ8M1RJR4YNQzOAkRTLF7LZ
pVZV8Z8GQBEBNQMaVSu4BGiumKFc6w==
=o1nE
-----END PGP SIGNATURE-----

--Sig_/z_6=.=V7=hBop7w1tE+Ht2Q--

