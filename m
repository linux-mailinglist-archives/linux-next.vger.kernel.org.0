Return-Path: <linux-next+bounces-2932-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00EC92DD36
	for <lists+linux-next@lfdr.de>; Thu, 11 Jul 2024 01:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D7A91C2162D
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 23:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8559156F2E;
	Wed, 10 Jul 2024 23:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ucx2S3yl"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE6814A4F7;
	Wed, 10 Jul 2024 23:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720655826; cv=none; b=TrVl9DNPndqjJYZ32RuYNH2IKubqGsV6KrSvJj36nYOp6L+W38bR6pYINs/FdOxKyem6dgVs2ystpvhEX0pKbL6larXUWoQ/PEGnPmd0alHSxsyjbSv8DHIv8S7jKbkct2Targ5Qdbqs1VrbMEhY6wpt8+/q4LDC0wnZNcHs8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720655826; c=relaxed/simple;
	bh=20LodhAF5NZY/wj9L6s++4NvO1MS0tf0GZZ308h5avA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IfDYfLBU88wsu4nDC+li7trTrG8HHwbQBcg7wDhyVy9VIY7AcrajIDnfs2IJo8D6l60CSqTo/INTfefdowAMTHkSDmkcCBy9Rgo64fueyvJTFUwnhD9FDNZROHUdC4ImTSMZ8G7eY3Y4Iu70T8ngVK3oZLa2Ttv8vlnNXBdtVr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ucx2S3yl; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1720655821;
	bh=vMGO5t7CfB8Jzk6TZKffnuhhdmCstVI6as26I67ukKI=;
	h=Date:From:To:Cc:Subject:From;
	b=ucx2S3ylHQdUQRgS0VBgz9enzZZfvI67JWL3Nuhc0IRG3+9SawQ5sEQwRPxhDIazU
	 8p9Eoi+du0hJw7hFYO9MDFkIONnY82sr7Mu1c4gsaQ4r8fXDJHkSjO1nSqBdw6kZUj
	 tSoJqfrOJA4fWnGBJr/6j/wY4vQ5BNTbc3BdUtu9XoZ44Vm9V150iNRWHVPdR+P8+y
	 cz7pDmckhLqBSRT6lQuubbR/EfD6fz9yQpfw6H0UsDPjIUg3Ho2K4VHStNwLkqAix4
	 WqLPjJ1C2BO9eO0UIOoG4UQZY20vXU1tVJtHFu1auTWQDUIt5MFvKlIiYgzCpPVT0m
	 qvZeu2bhBVKIg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WKFC14dBbz4wZx;
	Thu, 11 Jul 2024 09:57:01 +1000 (AEST)
Date: Thu, 11 Jul 2024 09:57:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the bcachefs tree with Linus' tree
Message-ID: <20240711095701.3779f634@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/o5XShApwHJv/aCNkmq65PVx";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/o5XShApwHJv/aCNkmq65PVx
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the bcachefs tree got a conflict in:

  fs/bcachefs/backpointers.c

between commit:

  92e1c29ae803 ("bcachefs: bch2_btree_write_buffer_maybe_flush()")

from Linus' tree and commit:

  f75ad706a1cf ("bcachefs: fsck_err() may now take a btree_trans")

from the bcachefs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/bcachefs/backpointers.c
index 6d8b1bc90be0,ca16fa5de7c8..000000000000
--- a/fs/bcachefs/backpointers.c
+++ b/fs/bcachefs/backpointers.c
@@@ -903,18 -925,20 +903,18 @@@ static int check_one_backpointer(struc
  	if (ret)
  		return ret;
 =20
 -	if (!k.k && !bpos_eq(*last_flushed_pos, bp.k->p)) {
 -		*last_flushed_pos =3D bp.k->p;
 -		ret =3D bch2_btree_write_buffer_flush_sync(trans) ?:
 -			-BCH_ERR_transaction_restart_write_buffer_flush;
 -		goto out;
 -	}
 +	if (!k.k) {
 +		ret =3D bch2_btree_write_buffer_maybe_flush(trans, bp.s_c, last_flushed=
);
 +		if (ret)
 +			goto out;
 =20
- 		if (fsck_err(c, backpointer_to_missing_ptr,
 -	if (fsck_err_on(!k.k,
 -			trans, backpointer_to_missing_ptr,
 -			"backpointer for missing %s\n  %s",
 -			bp.v->level ? "btree node" : "extent",
 -			(bch2_bkey_val_to_text(&buf, c, bp.s_c), buf.buf))) {
 -		ret =3D bch2_btree_delete_at_buffered(trans, BTREE_ID_backpointers, bp.=
k->p);
 -		goto out;
++		if (fsck_err(trans, backpointer_to_missing_ptr,
 +			     "backpointer for missing %s\n  %s",
 +			     bp.v->level ? "btree node" : "extent",
 +			     (bch2_bkey_val_to_text(&buf, c, bp.s_c), buf.buf))) {
 +			ret =3D bch2_btree_delete_at_buffered(trans, BTREE_ID_backpointers, bp=
.k->p);
 +			goto out;
 +		}
  	}
  out:
  fsck_err:

--Sig_/o5XShApwHJv/aCNkmq65PVx
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaPH80ACgkQAVBC80lX
0GyvewgAnsjpKKPfLH0pUHX6ACTJNY4vTfqRb5tWcdeqk4ymCpT+48J9ykP/QeRa
HVgySJQe+Vq/2B4ogrYkF2xMawxoHjvCGKAGlnG/Ja110GYS5SK6wAxxGbZFcRhE
qKIxpEgte5Qa17HTQ6hq0U02y58+lkyJrFKOkL01YiolgpADacbrFlhmFALAXpWY
LX7368/E76nk9fgWE9XDagLJgQP/K2T6kRTstnw1mtp4UHSe2l5CbjuN+m3H5Oqb
0SHlolymQoE2MD9MJQYbthVmTqBQwRlPlOLbmZ04MUPHUGbMz2r6j6+SfJTBFO1E
C8KDvgel/LleUTJS3dsPG9/VBLQcqA==
=jZHV
-----END PGP SIGNATURE-----

--Sig_/o5XShApwHJv/aCNkmq65PVx--

