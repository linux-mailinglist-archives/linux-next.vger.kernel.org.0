Return-Path: <linux-next+bounces-5333-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A98A2007B
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 23:22:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7EE0C3A41A8
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2025 22:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E94F1DC9B1;
	Mon, 27 Jan 2025 22:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iuDh8fy0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A490D1D932F;
	Mon, 27 Jan 2025 22:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738016477; cv=none; b=K7kPEdfkJAiSgMJ4THPduIjPkshfaIQG9Y7EJWUr3OhmQdU/rxRJf+cTrvi5rJL6MdJYJxe36yAthai0DdLdRqeAvlEBl3eJz4WxTatmE+M2rRqeDRhj0Y4p6QjbNb4fAO3n86Lwn0d5qihAUJpGXx7OdKO6+wFdvCwwlq1mW4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738016477; c=relaxed/simple;
	bh=GIpgLHHzwGU3E7Z1rlTpf2U1vPAtFMlvKvD3oTd5yV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U819WUx5vwHZTgkt8O3ZkuxqZhUxMqGGkQYDRJ6oNqpmYvdKcrf9vgI+rcl1x91QlMpn2cW9NUwvv1x04wy4xaf5QEXAuKBCpGJDCc5VvFqEi6lv2cq//v4HUQtf9ekU3qvCfg1r/DSV4vF05V0/kSn6hLY0Gcu7X03D0WeY5ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iuDh8fy0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738016461;
	bh=ypButPENFewyVD54htziMLjAJI8a4XmG/FH7pfaT348=;
	h=Date:From:To:Cc:Subject:From;
	b=iuDh8fy0zGxHQwINAxYRfNnZYngBxU3YZhKp5VIBmpmw6BZ+B9G3PR34OQPjm109K
	 bC6QreRFI/6tAl6J3b0M71Z9asj5D0UXYKoWY4BPVRuKdFujiU5mBNNkVCTJkJQiVM
	 HhOgGLZebQVBGatz+6+rpDIuJohkviMVqJVwGaVn0+ogN0X0rTS4E5KHPxDIcLXuxj
	 qC2cBRzDSyUJDcF66RfR8P1zeeBgEjxhhVtvQlmdUFXSco+0AXeFlgtGdmYatpn1MZ
	 3KF/l7mYpRo8iHaXNvIzu25qiB9hhI3XLncu5e/wffsvLq6QNo8GusW8iHiTP4GxT0
	 H2GZD1jabye9A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YhjYS6mtXz4wxh;
	Tue, 28 Jan 2025 09:21:00 +1100 (AEDT)
Date: Tue, 28 Jan 2025 09:21:08 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the vfs tree with Linus' tree
Message-ID: <20250128092108.6acba872@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M5xlr87b0HsuMlHG4ZF0lCV";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/M5xlr87b0HsuMlHG4ZF0lCV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/bcachefs/recovery.c

between commit:

  e3c43dbe8e5f ("bcachefs: bch2_btree_lost_data() now uses run_explicit_rce=
overy_pass_persistent()")

from Linus' tree and commit:

  9c86671dae7d ("add a string-to-qstr constructor")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/bcachefs/recovery.c
index 98825437381c,ebabba296882..000000000000
--- a/fs/bcachefs/recovery.c
+++ b/fs/bcachefs/recovery.c
@@@ -32,85 -32,21 +32,83 @@@
  #include <linux/sort.h>
  #include <linux/stat.h>
 =20
- #define QSTR(n) { { { .len =3D strlen(n) } }, .name =3D n }
-=20
 -void bch2_btree_lost_data(struct bch_fs *c, enum btree_id btree)
 +int bch2_btree_lost_data(struct bch_fs *c, enum btree_id btree)
  {
 -	if (btree >=3D BTREE_ID_NR_MAX)
 -		return;
 -
  	u64 b =3D BIT_ULL(btree);
 +	int ret =3D 0;
 +
 +	mutex_lock(&c->sb_lock);
 +	struct bch_sb_field_ext *ext =3D bch2_sb_field_get(c->disk_sb.sb, ext);
 =20
  	if (!(c->sb.btrees_lost_data & b)) {
 -		bch_err(c, "flagging btree %s lost data", bch2_btree_id_str(btree));
 -
 -		mutex_lock(&c->sb_lock);
 -		bch2_sb_field_get(c->disk_sb.sb, ext)->btrees_lost_data |=3D cpu_to_le6=
4(b);
 -		bch2_write_super(c);
 -		mutex_unlock(&c->sb_lock);
 +		struct printbuf buf =3D PRINTBUF;
 +		bch2_btree_id_to_text(&buf, btree);
 +		bch_err(c, "flagging btree %s lost data", buf.buf);
 +		printbuf_exit(&buf);
 +		ext->btrees_lost_data |=3D cpu_to_le64(b);
  	}
 +
 +	/* Once we have runtime self healing for topology errors we won't need t=
his: */
 +	ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVER=
Y_PASS_check_topology) ?: ret;
 +
 +	/* Btree node accounting will be off: */
 +	__set_bit_le64(BCH_FSCK_ERR_accounting_mismatch, ext->errors_silent);
 +	ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVER=
Y_PASS_check_allocations) ?: ret;
 +
 +#ifdef CONFIG_BCACHEFS_DEBUG
 +	/*
 +	 * These are much more minor, and don't need to be corrected right away,
 +	 * but in debug mode we want the next fsck run to be clean:
 +	 */
 +	ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVER=
Y_PASS_check_lrus) ?: ret;
 +	ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVER=
Y_PASS_check_backpointers_to_extents) ?: ret;
 +#endif
 +
 +	switch (btree) {
 +	case BTREE_ID_alloc:
 +		ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVE=
RY_PASS_check_alloc_info) ?: ret;
 +
 +		__set_bit_le64(BCH_FSCK_ERR_alloc_key_data_type_wrong, ext->errors_sile=
nt);
 +		__set_bit_le64(BCH_FSCK_ERR_alloc_key_gen_wrong, ext->errors_silent);
 +		__set_bit_le64(BCH_FSCK_ERR_alloc_key_dirty_sectors_wrong, ext->errors_=
silent);
 +		__set_bit_le64(BCH_FSCK_ERR_alloc_key_cached_sectors_wrong, ext->errors=
_silent);
 +		__set_bit_le64(BCH_FSCK_ERR_alloc_key_stripe_wrong, ext->errors_silent);
 +		__set_bit_le64(BCH_FSCK_ERR_alloc_key_stripe_redundancy_wrong, ext->err=
ors_silent);
 +		goto out;
 +	case BTREE_ID_backpointers:
 +		ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVE=
RY_PASS_check_btree_backpointers) ?: ret;
 +		ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVE=
RY_PASS_check_extents_to_backpointers) ?: ret;
 +		goto out;
 +	case BTREE_ID_need_discard:
 +		ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVE=
RY_PASS_check_alloc_info) ?: ret;
 +		goto out;
 +	case BTREE_ID_freespace:
 +		ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVE=
RY_PASS_check_alloc_info) ?: ret;
 +		goto out;
 +	case BTREE_ID_bucket_gens:
 +		ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVE=
RY_PASS_check_alloc_info) ?: ret;
 +		goto out;
 +	case BTREE_ID_lru:
 +		ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVE=
RY_PASS_check_alloc_info) ?: ret;
 +		goto out;
 +	case BTREE_ID_accounting:
 +		ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVE=
RY_PASS_check_allocations) ?: ret;
 +		goto out;
 +	default:
 +		ret =3D bch2_run_explicit_recovery_pass_persistent_locked(c, BCH_RECOVE=
RY_PASS_scan_for_btree_nodes) ?: ret;
 +		goto out;
 +	}
 +out:
 +	bch2_write_super(c);
 +	mutex_unlock(&c->sb_lock);
 +
 +	return ret;
 +}
 +
 +static void kill_btree(struct bch_fs *c, enum btree_id btree)
 +{
 +	bch2_btree_id_root(c, btree)->alive =3D false;
 +	bch2_shoot_down_journal_keys(c, btree, 0, BTREE_MAX_DEPTH, POS_MIN, SPOS=
_MAX);
  }
 =20
  /* for -o reconstruct_alloc: */

--Sig_/M5xlr87b0HsuMlHG4ZF0lCV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeYBtQACgkQAVBC80lX
0Gwdwgf/T0nDw7oWnvnj/9pT1bXvaRZjelcFRuuTv0VxXasRmAh7e/XCKcIBhUfe
eXlU5NV1+Ybx4zC8CLir1dsRLz11HES+4hkUgnyZUB4vVELNYieD9jkB0FCfQYLv
A0KwAouwMFSytPr4LU0CwaFSrNTTnNFw5X6tC0S5a7IEruS/zeJFB7ju18S03v4O
wg7HEcNJkgSjEq85c30PBxx9UxFa6ces/Z4cG0eOkAcuUHflFGDG9h2n1580/gsy
FeHh5H1c12A2k0lgb/9uXtDY3bwPze7SNtrZoRSFqq8NFoVkhRUSzmAWJYhEv8P2
dzICYJHdcUTuP2bxuxCqKDfy+7Vz8Q==
=FW19
-----END PGP SIGNATURE-----

--Sig_/M5xlr87b0HsuMlHG4ZF0lCV--

