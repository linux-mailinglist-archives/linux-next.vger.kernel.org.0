Return-Path: <linux-next+bounces-9453-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E3FCC9B4F
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 23:28:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B18E730380D6
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 22:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A10B03126C6;
	Wed, 17 Dec 2025 22:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AO5E1skD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4BC312800;
	Wed, 17 Dec 2025 22:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766010424; cv=none; b=OtjaRyAd/cog1yasHBHLUmok778cCPvtT87FzOYvXCLFJcmGYeFKFgUO8XQHiZOQKStmjXI8zGdtErlCXIP91MhXgdBxoEzmJvFM+42pG7Kahj+bHOepa1zhPU/XebgQ8yN2PzfeE1QUE3e/9Iw5Jc7wanZKYFb99KXaPQsQsfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766010424; c=relaxed/simple;
	bh=JKvtBPPQZ8YlMGs4EVZ6neb81ETtq6mWv0uLucKiH0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=TM6QDGWD7hexpRo/DIzLX1L8Uk+mc5QFKGY1xTA93MR4+OQrPGXFmYfgaaPQ+zV/Ueic25AvEaObZJnYJ8/3q10P5S2Sf5nznKDD6/Zp5bCWMJVnHnTkhodBKeaAMTRoXX5aCFOA0Rku9lZLt7gWJQOB1j6doSscTyBQ1jp+uco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AO5E1skD; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1766010416;
	bh=wVAKyBBfyEvE6Law3VzblqMjrZdjHSTIfCAzD1A9bB8=;
	h=Date:From:To:Cc:Subject:From;
	b=AO5E1skDkgateZxfleKAKrqQCzDPl4r1rVGOs54n1ezLslHKmcKZTP+UMpqQizhB1
	 eqYt2yzfp71+DEuoo8wvVgDozHGQpljeLF57cZ6dB/tYb2bgM9Hzw3+fxgTs2E4yqd
	 pbvZ6GzmNRHgGnO+fZ6A4qfjH6+HA8+D9ljpnbj/uusJrvnLTOKqW2J+6sCtVH6uCk
	 VGNbyT30C9eu4UZN63P46FxZBF8GqULFo99dnFC0i1mttfrxZrpOZ/we74W0ZwWV0z
	 aQBLs41qfvJ5Z6YeXnvWQ1tXCCvypi8uzCxMTxVaUvNcTDyeWmK+RykMa0YxKj0bIo
	 l11qfnusxA8rw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dWpLm2HjXz4wCm;
	Thu, 18 Dec 2025 09:26:56 +1100 (AEDT)
Date: Thu, 18 Dec 2025 09:26:55 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>, Johannes
 Thumshirn <johannes.thumshirn@wdc.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the btrfs tree
Message-ID: <20251218092655.4fe4165c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o018usBFqBInt5Z9yUQsxce";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/o018usBFqBInt5Z9yUQsxce
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from fs/btrfs/disk-io.h:12,
                 from fs/btrfs/super.c:34:
fs/btrfs/bio.h:100:14: error: duplicate member 'can_use_append'
  100 |         bool can_use_append;
      |              ^~~~~~~~~~~~~~

(and several others similar)

Caused by commits

  a9e53c29f361 ("btrfs: shrink the size of btrfs_bio")
  009334649b08 ("btrfs: zoned: don't zone append to conventional zone")

interacting with commit

  ad93f92010a1 ("btrfs: zoned: don't zone append to conventional zone")

from the btrfs-fixes tree.

I applied the following merge fix patch for today, but please clean up
your trees.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 18 Dec 2025 09:21:11 +1100
Subject: [PATCH] fix up for "btrfs: shrink the size of btrfs_bio"

interacting with commit

  ad93f92010a1 ("btrfs: zoned: don't zone append to conventional zone")

from the btrfs-fixes tree.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/btrfs/bio.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/btrfs/bio.h b/fs/btrfs/bio.h
index 4d0f416a8be0..157cdfa2f78a 100644
--- a/fs/btrfs/bio.h
+++ b/fs/btrfs/bio.h
@@ -96,9 +96,6 @@ struct btrfs_bio {
 	/* Whether the bio is written using zone append. */
 	bool can_use_append:1;
=20
-	/* Whether the bio is written using zone append. */
-	bool can_use_append;
-
 	/*
 	 * This member must come last, bio_alloc_bioset will allocate enough
 	 * bytes for entire btrfs_bio but relies on bio being last.
--=20
2.52.0

--=20
Cheers,
Stephen Rothwell

--Sig_/o018usBFqBInt5Z9yUQsxce
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlDLi8ACgkQAVBC80lX
0Gz39wf+IVkNt8mcJR9+dPwarhXAXQHJoX8KeZ5g2sJonHBrudwPcDOHAeizaScR
K1HWOmPuVF1wooh8uG7ZQiWwTonFSfcsi6zKsmpMkz3CX0ubKJgfMI5guc1zMbzx
3273rp+rGnJls3Q7/b0uD8doroMR6KpR1REA4/xVVLe3My3yYdieEjbR3E2xwPdp
ybnl6yvODj/UuQvzeMuNSUDL7EDBlSd95hNrNfL3d7nXZZvECzXj92YIEUKiMct6
7cPpzHcg7G7vibsJ+ADpEIasNWLdnZBGQAkwdFNBWzqoOyjTlOkN9gIKywAOZeWf
IP+gx/RFM9cZH39XnVIHTxTxp4havA==
=1wlh
-----END PGP SIGNATURE-----

--Sig_/o018usBFqBInt5Z9yUQsxce--

