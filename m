Return-Path: <linux-next+bounces-4564-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 902059B8613
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 23:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F5A8282A32
	for <lists+linux-next@lfdr.de>; Thu, 31 Oct 2024 22:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735EE1DFD81;
	Thu, 31 Oct 2024 22:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EYSv5dTm"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E93713AD32;
	Thu, 31 Oct 2024 22:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730413348; cv=none; b=E+pIeXQ3t/U2wp2zgfvd0NkayPWI4rDY6M540v51w7dDQ0TJjDpX3yu0KncGgc2bFebDIFda5fWh+PuWyRlvid3nQ+19mmN4UiKyuMu+MAVOlHLBhF+jCTSx/rk909+845ILUyLU8wIV2nCn25KxbJvyxYEN+1zca1LSRziYcfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730413348; c=relaxed/simple;
	bh=MaRSl8pJNPAd8LvnPbW2lflozVxiL/22y5SLtksvYMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DNCtN4Q8rXIKDWTB8k9NPVuNOq4ckFCTADIDpR1q9g4H4DdSOzn8losztkvHIw8hFaL8t+OqbLBhFWQYO/tdg/V8fYVzqeJyhXLombHJurnx/joZNfVOAfEsw5dCzof4V6uRDnpAQ7BfCmNcLwi1CYN3PVYO/unhA/747z6NqDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EYSv5dTm; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730413334;
	bh=bgvMN0XMMz9KcRLA6TMov31YlCeMn61J6dd+sKQrbN4=;
	h=Date:From:To:Cc:Subject:From;
	b=EYSv5dTmb6JVB8hNKc7A1VwUznWdFtTnjAUPveT31cm5STTWcLKZsL/paRFgUm04v
	 wHi8518GxZjfW9M2Q8pJ7pwop9Jm4meSMA+yOWmzlt6qtlknK3bsu5pPOK+gZQeWuC
	 vTzGlQPh7o8ekmDteeyMI7aFBi2kUdCtNAclNY1x4pY67ynwTfDX8LxkSR6BtkRAA+
	 HyO0M//hFQifgE8ZtPpksAoCl6UzfHgvmt7b350pI0UbkLXjDGDkmxMw/PE66mrFH5
	 v/vFuvicdt9zzKtVw56yDx1Du6r3Hlj0qFniC6kYYvQVrD7A3YBKR3S2UZ0FhUdXMI
	 FCQ+/SZyZz5Rw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XfdlQ6DkQz4xG4;
	Fri,  1 Nov 2024 09:22:10 +1100 (AEDT)
Date: Fri, 1 Nov 2024 09:22:12 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.cz>
Cc: David Sterba <dsterba@suse.com>, Haisu Wang <haisuwang@tencent.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Qu Wenruo <wqu@suse.com>
Subject: linux-next: manual merge of the vfs-brauner tree with the btrfs
 tree
Message-ID: <20241101092212.1c112872@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5eA2eSVkCbgv.C_JzBDT9W1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5eA2eSVkCbgv.C_JzBDT9W1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs-brauner tree got a conflict in:

  fs/btrfs/inode.c

between commits:

  530eec3e0f6e ("btrfs: simplify range tracking in cow_file_range()")
  25e40a35c927 ("btrfs: extract the inner loop of cow_file_range() to enhan=
ce the error handling")

from the btrfs tree and commit:

  a6752a6e7fb0 ("btrfs: Switch from using the private_2 flag to owner_2")

from the vfs-brauner tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/inode.c
index 6ec223f9987f,c14e37438a0b..000000000000
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@@ -1293,147 -1320,6 +1293,147 @@@ u64 btrfs_get_extent_allocation_hint(st
  	return alloc_hint;
  }
 =20
 +/*
 + * Run one cow range, which includes:
 + *
 + * - Reserve the data extent
 + * - Create the io extent map
 + * - Create the ordered extent
 + *
 + * @ins will be updated if the range should be skipped for error handling=
, no
 + * matter the return value.
 + *
 + * Return 0 if everything is fine.
 + * Return -EAGAIN if btrfs_reserve_extent() failed for zoned fs, caller n=
eeds
 + * some extra handling.
 + * Return <0 for other errors.
 + */
 +static int run_one_cow_range(struct btrfs_inode *inode,
 +			     struct folio *locked_folio,
 +			     struct btrfs_key *ins,
 +			     u64 start,
 +			     u64 end, u64 *alloc_hint, bool keep_locked)
 +{
 +	struct btrfs_root *root =3D inode->root;
 +	struct btrfs_fs_info *fs_info =3D root->fs_info;
 +	struct btrfs_ordered_extent *ordered;
 +	struct btrfs_file_extent file_extent =3D { 0 };
 +	struct extent_state *cached =3D NULL;
 +	struct extent_map *em =3D NULL;
 +	unsigned long page_ops;
 +	const u64 len =3D end + 1 - start;
 +	u32 min_alloc_size;
 +	int ret;
 +
 +	ASSERT(IS_ALIGNED(start, fs_info->sectorsize));
 +	ASSERT(IS_ALIGNED(end + 1, fs_info->sectorsize));
 +
 +	ins->offset =3D 0;
 +	ins->objectid =3D 0;
 +
 +	/*
 +	 * Relocation relies on the relocated extents to have exactly the same
 +	 * size as the original extents. Normally writeback for relocation data
 +	 * extents follows a NOCOW path because relocation preallocates the
 +	 * extents. However, due to an operation such as scrub turning a block
 +	 * group to RO mode, it may fallback to COW mode, so we must make sure
 +	 * an extent allocated during COW has exactly the requested size and can
 +	 * not be split into smaller extents, otherwise relocation breaks and
 +	 * fails during the stage where it updates the bytenr of file extent
 +	 * items.
 +	 */
 +	if (btrfs_is_data_reloc_root(root))
 +		min_alloc_size =3D len;
 +	else
 +		min_alloc_size =3D fs_info->sectorsize;
 +
 +	ret =3D btrfs_reserve_extent(root, len, len, min_alloc_size, 0,
 +				   *alloc_hint, ins, 1, 1);
 +	if (ret < 0)
 +		return ret;
 +
 +	file_extent.disk_bytenr =3D ins->objectid;
 +	file_extent.disk_num_bytes =3D ins->offset;
 +	file_extent.num_bytes =3D ins->offset;
 +	file_extent.ram_bytes =3D ins->offset;
 +	file_extent.offset =3D 0;
 +	file_extent.compression =3D BTRFS_COMPRESS_NONE;
 +
 +	lock_extent(&inode->io_tree, start, start + ins->offset - 1,
 +		    &cached);
 +
 +	em =3D btrfs_create_io_em(inode, start, &file_extent,
 +				BTRFS_ORDERED_REGULAR);
 +	if (IS_ERR(em)) {
 +		unlock_extent(&inode->io_tree, start,
 +			      start + ins->offset - 1, &cached);
 +		ret =3D PTR_ERR(em);
 +		goto out_free_reserved;
 +	}
 +	free_extent_map(em);
 +
 +	ordered =3D btrfs_alloc_ordered_extent(inode, start, &file_extent,
 +					     1 << BTRFS_ORDERED_REGULAR);
 +	if (IS_ERR(ordered)) {
 +		unlock_extent(&inode->io_tree, start,
 +			      start + ins->offset - 1, &cached);
 +		ret =3D PTR_ERR(ordered);
 +		goto out_drop_em;
 +	}
 +
 +	if (btrfs_is_data_reloc_root(root)) {
 +		ret =3D btrfs_reloc_clone_csums(ordered);
 +
 +		/*
 +		 * Only drop cache here, and process as normal.
 +		 *
 +		 * We must not allow extent_clear_unlock_delalloc()
 +		 * at error handling to free meta of this ordered
 +		 * extent, as its meta should be freed by
 +		 * btrfs_finish_ordered_io().
 +		 *
 +		 * So we must continue until @start is increased to
 +		 * skip current ordered extent.
 +		 */
 +		if (ret < 0)
 +			btrfs_drop_extent_map_range(inode, start,
 +						    start + ins->offset - 1,
 +						    false);
 +	}
 +	btrfs_put_ordered_extent(ordered);
 +
 +	btrfs_dec_block_group_reservations(fs_info, ins->objectid);
 +
 +	/*
 +	 * We're not doing compressed IO, don't unlock the first page
 +	 * (which the caller expects to stay locked), don't clear any
 +	 * dirty bits and don't set any writeback bits
 +	 *
- 	 * Do set the Ordered (Private2) bit so we know this page was
++	 * Do set the Ordered flag so we know this page was
 +	 * properly setup for writepage.
 +	 */
 +	page_ops =3D (keep_locked ? 0 : PAGE_UNLOCK);
 +	page_ops |=3D PAGE_SET_ORDERED;
 +
 +	extent_clear_unlock_delalloc(inode, start, start + ins->offset - 1,
 +				     locked_folio, &cached,
 +				     EXTENT_LOCKED | EXTENT_DELALLOC,
 +				     page_ops);
 +	*alloc_hint =3D ins->objectid + ins->offset;
 +	return ret;
 +
 +out_drop_em:
 +	btrfs_drop_extent_map_range(inode, start, start + ins->offset - 1, false=
);
 +out_free_reserved:
 +	btrfs_dec_block_group_reservations(fs_info, ins->objectid);
 +	btrfs_free_reserved_extent(fs_info, ins->objectid, ins->offset, 1);
 +	/* This is reserved for btrfs_reserve_extent() error. */
 +	ASSERT(ret !=3D -EAGAIN);
 +	ins->offset =3D 0;
 +	ins->objectid =3D 0;
 +	return ret;
 +}
 +
  /*
   * when extent_io.c finds a delayed allocation range in the file,
   * the call backs end up in this code.  The basic idea is to

--Sig_/5eA2eSVkCbgv.C_JzBDT9W1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmckAxQACgkQAVBC80lX
0Gz4jQf9GmN7bLevIaVP2Xy77EMnQHIA0LjaojpUAGLItKo/jCnWBXEXNIbSdspg
WlKgub0PU1TB5FBFrrDnjqoym62ttcgnbJ5Kp/xu7APXN1DJbbs593IkXQWnPWA1
Hf3dMyXKECp8FDpEPOm9crmIjwybn2DPkI96BIjFO2LnE0V9hweH4/hFK+z1k4SW
Qrfpy33caqC2Ziec+ixT+cPkPXo6qfydkbuhzGEFq3osMOmtZekE2nc/uxNG32Tc
Vhut+t/NEN6clasxZ+8aUkv5R2UklsXkXuq91nSM0K7/rooN+S6nHNxEPwpmUDqy
/Ve9ePSMjIUSAB3Ds6HjPuUQGqwSWg==
=cCx0
-----END PGP SIGNATURE-----

--Sig_/5eA2eSVkCbgv.C_JzBDT9W1--

