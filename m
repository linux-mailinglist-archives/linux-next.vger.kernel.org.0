Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8F7D441185
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 00:53:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbhJaX4Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 31 Oct 2021 19:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230121AbhJaX4Z (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 31 Oct 2021 19:56:25 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A2D0C061714;
        Sun, 31 Oct 2021 16:53:44 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HjCft63swz4xYy;
        Mon,  1 Nov 2021 10:53:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1635724423;
        bh=8qpRvUf3pO3WF4IVa6m9XZxp19tM0aU6BlO8+iPVN7E=;
        h=Date:From:To:Cc:Subject:From;
        b=pNBS35IixelZpMOfQi259V7zCwaMoM7Z1Yn5mhJ6Wefpn3DPtY/J80ZjKVGh4Ag95
         wFzxc8fKSJOa3e2IzQJFvDWW+dTOQsmGlAP/OxppGe0A04dEY6s7f3/q5eoMor75dW
         ha8lr9jf61i4eXe5n4CL8fhFN4p27XmLmWWXJB7J7GXZky+Sc1fmkeg6eCyzVBXCA/
         Sz/QP6QcjCOI6w0m3o8zLv0eUxb2Uk0jOHRqc1Us+VHstdVymcM2vMGUYlfV3L/YQO
         twqoMwLLw7rOZgdMkF8BmJzBlASrnBRJclT2yppZzOY+X2oRfbueSSxecipKvsnt/D
         3uJme25qcRZaA==
Date:   Mon, 1 Nov 2021 10:53:41 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     David Sterba <dsterba@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Qu Wenruo <wqu@suse.com>
Subject: linux-next: manual merge of the btrfs tree with Linus' tree
Message-ID: <20211101105341.5fde8108@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4T=H+b6AAkcmXFR+Ay4mzf0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/4T=H+b6AAkcmXFR+Ay4mzf0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the btrfs tree got a conflict in:

  fs/btrfs/lzo.c

between commit:

  ccaa66c8dd27 ("Revert "btrfs: compression: drop kmap/kunmap from lzo"")

from Linus' tree and commit:

  d4088803f511 ("btrfs: subpage: make lzo_compress_pages() compatible")

from the btrfs tree.

I fixed it up (this may be completely wrong or incomplete :-( - see below)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/lzo.c
index 3dbe6eb5fda7,00cffc183ec0..000000000000
--- a/fs/btrfs/lzo.c
+++ b/fs/btrfs/lzo.c
@@@ -112,61 -112,126 +112,130 @@@ static inline size_t read_compress_leng
  	return le32_to_cpu(dlen);
  }
 =20
+ /*
+  * Will do:
+  *
+  * - Write a segment header into the destination
+  * - Copy the compressed buffer into the destination
+  * - Make sure we have enough space in the last sector to fit a segment h=
eader
+  *   If not, we will pad at most (LZO_LEN (4)) - 1 bytes of zeros.
+  *
+  * Will allocate new pages when needed.
+  */
+ static int copy_compressed_data_to_page(char *compressed_data,
+ 					size_t compressed_size,
+ 					struct page **out_pages,
+ 					u32 *cur_out,
+ 					const u32 sectorsize)
+ {
+ 	u32 sector_bytes_left;
+ 	u32 orig_out;
+ 	struct page *cur_page;
+=20
+ 	/*
+ 	 * We never allow a segment header crossing sector boundary, previous
+ 	 * run should ensure we have enough space left inside the sector.
+ 	 */
+ 	ASSERT((*cur_out / sectorsize) =3D=3D (*cur_out + LZO_LEN - 1) / sectors=
ize);
+=20
+ 	cur_page =3D out_pages[*cur_out / PAGE_SIZE];
+ 	/* Allocate a new page */
+ 	if (!cur_page) {
+ 		cur_page =3D alloc_page(GFP_NOFS);
+ 		if (!cur_page)
+ 			return -ENOMEM;
+ 		out_pages[*cur_out / PAGE_SIZE] =3D cur_page;
+ 	}
+=20
 -	write_compress_length(page_address(cur_page) + offset_in_page(*cur_out),
++	write_compress_length(kmap(cur_page) + offset_in_page(*cur_out),
+ 			      compressed_size);
++	kunmap(cur_page);
+ 	*cur_out +=3D LZO_LEN;
+=20
+ 	orig_out =3D *cur_out;
+=20
+ 	/* Copy compressed data */
+ 	while (*cur_out - orig_out < compressed_size) {
+ 		u32 copy_len =3D min_t(u32, sectorsize - *cur_out % sectorsize,
+ 				     orig_out + compressed_size - *cur_out);
+=20
+ 		cur_page =3D out_pages[*cur_out / PAGE_SIZE];
+ 		/* Allocate a new page */
+ 		if (!cur_page) {
+ 			cur_page =3D alloc_page(GFP_NOFS);
+ 			if (!cur_page)
+ 				return -ENOMEM;
+ 			out_pages[*cur_out / PAGE_SIZE] =3D cur_page;
+ 		}
+=20
 -		memcpy(page_address(cur_page) + offset_in_page(*cur_out),
++		memcpy(kmap(cur_page) + offset_in_page(*cur_out),
+ 		       compressed_data + *cur_out - orig_out, copy_len);
++		kunmap(cur_page);
+=20
+ 		*cur_out +=3D copy_len;
+ 	}
+=20
+ 	/*
+ 	 * Check if we can fit the next segment header into the remaining space
+ 	 * of the sector.
+ 	 */
+ 	sector_bytes_left =3D round_up(*cur_out, sectorsize) - *cur_out;
+ 	if (sector_bytes_left >=3D LZO_LEN || sector_bytes_left =3D=3D 0)
+ 		return 0;
+=20
+ 	/* The remaining size is not enough, pad it with zeros */
 -	memset(page_address(cur_page) + offset_in_page(*cur_out), 0,
++	memset(kmap(cur_page) + offset_in_page(*cur_out), 0,
+ 	       sector_bytes_left);
++	kunmap(cur_page);
+ 	*cur_out +=3D sector_bytes_left;
+ 	return 0;
+ }
+=20
  int lzo_compress_pages(struct list_head *ws, struct address_space *mappin=
g,
  		u64 start, struct page **pages, unsigned long *out_pages,
  		unsigned long *total_in, unsigned long *total_out)
  {
  	struct workspace *workspace =3D list_entry(ws, struct workspace, list);
+ 	const u32 sectorsize =3D btrfs_sb(mapping->host->i_sb)->sectorsize;
+ 	struct page *page_in =3D NULL;
  	int ret =3D 0;
- 	char *data_in;
- 	char *cpage_out, *sizes_ptr;
- 	int nr_pages =3D 0;
- 	struct page *in_page =3D NULL;
- 	struct page *out_page =3D NULL;
- 	unsigned long bytes_left;
- 	unsigned long len =3D *total_out;
- 	unsigned long nr_dest_pages =3D *out_pages;
- 	const unsigned long max_out =3D nr_dest_pages * PAGE_SIZE;
- 	size_t in_len;
- 	size_t out_len;
- 	char *buf;
- 	unsigned long tot_in =3D 0;
- 	unsigned long tot_out =3D 0;
- 	unsigned long pg_bytes_left;
- 	unsigned long out_offset;
- 	unsigned long bytes;
+ 	/* Points to the file offset of input data */
+ 	u64 cur_in =3D start;
+ 	/* Points to the current output byte */
+ 	u32 cur_out =3D 0;
+ 	u32 len =3D *total_out;
++	char *sizes_ptr;
 =20
  	*out_pages =3D 0;
  	*total_out =3D 0;
  	*total_in =3D 0;
 =20
- 	in_page =3D find_get_page(mapping, start >> PAGE_SHIFT);
- 	data_in =3D kmap(in_page);
-=20
  	/*
- 	 * store the size of all chunks of compressed data in
- 	 * the first 4 bytes
+ 	 * Skip the header for now, we will later come back and write the total
+ 	 * compressed size
  	 */
- 	out_page =3D alloc_page(GFP_NOFS);
- 	if (out_page =3D=3D NULL) {
- 		ret =3D -ENOMEM;
- 		goto out;
- 	}
- 	cpage_out =3D kmap(out_page);
- 	out_offset =3D LZO_LEN;
- 	tot_out =3D LZO_LEN;
- 	pages[0] =3D out_page;
- 	nr_pages =3D 1;
- 	pg_bytes_left =3D PAGE_SIZE - LZO_LEN;
-=20
- 	/* compress at most one page of data each time */
- 	in_len =3D min(len, PAGE_SIZE);
- 	while (tot_in < len) {
- 		ret =3D lzo1x_1_compress(data_in, in_len, workspace->cbuf,
- 				       &out_len, workspace->mem);
- 		if (ret !=3D LZO_E_OK) {
- 			pr_debug("BTRFS: lzo in loop returned %d\n",
- 			       ret);
+ 	cur_out +=3D LZO_LEN;
+ 	while (cur_in < start + len) {
+ 		const u32 sectorsize_mask =3D sectorsize - 1;
+ 		u32 sector_off =3D (cur_in - start) & sectorsize_mask;
+ 		u32 in_len;
+ 		size_t out_len;
+=20
+ 		/* Get the input page first */
+ 		if (!page_in) {
+ 			page_in =3D find_get_page(mapping, cur_in >> PAGE_SHIFT);
+ 			ASSERT(page_in);
+ 		}
+=20
+ 		/* Compress at most one sector of data each time */
+ 		in_len =3D min_t(u32, start + len - cur_in, sectorsize - sector_off);
+ 		ASSERT(in_len);
 -		ret =3D lzo1x_1_compress(page_address(page_in) +
++		ret =3D lzo1x_1_compress(kmap(page_in) +
+ 				       offset_in_page(cur_in), in_len,
+ 				       workspace->cbuf, &out_len,
+ 				       workspace->mem);
+ 		if (ret < 0) {
+ 			pr_debug("BTRFS: lzo in loop returned %d\n", ret);
  			ret =3D -EIO;
  			goto out;
  		}
@@@ -236,46 -252,21 +256,24 @@@
  			goto out;
  		}
 =20
- 		/* we're all done */
- 		if (tot_in >=3D len)
- 			break;
-=20
- 		if (tot_out > max_out)
- 			break;
-=20
- 		bytes_left =3D len - tot_in;
- 		kunmap(in_page);
- 		put_page(in_page);
-=20
- 		start +=3D PAGE_SIZE;
- 		in_page =3D find_get_page(mapping, start >> PAGE_SHIFT);
- 		data_in =3D kmap(in_page);
- 		in_len =3D min(bytes_left, PAGE_SIZE);
- 	}
-=20
- 	if (tot_out >=3D tot_in) {
- 		ret =3D -E2BIG;
- 		goto out;
+ 		/* Check if we have reached page boundary */
+ 		if (IS_ALIGNED(cur_in, PAGE_SIZE)) {
++			kunmap(page_in);
+ 			put_page(page_in);
+ 			page_in =3D NULL;
+ 		}
  	}
 =20
- 	/* store the size of all chunks of compressed data */
+ 	/* Store the size of all chunks of compressed data */
 -	write_compress_length(page_address(pages[0]), cur_out);
 +	sizes_ptr =3D kmap_local_page(pages[0]);
- 	write_compress_length(sizes_ptr, tot_out);
++	write_compress_length(sizes_ptr, cur_out);
 +	kunmap_local(sizes_ptr);
 =20
  	ret =3D 0;
- 	*total_out =3D tot_out;
- 	*total_in =3D tot_in;
+ 	*total_out =3D cur_out;
+ 	*total_in =3D cur_in - start;
  out:
- 	*out_pages =3D nr_pages;
- 	if (out_page)
- 		kunmap(out_page);
-=20
- 	if (in_page) {
- 		kunmap(in_page);
- 		put_page(in_page);
- 	}
-=20
+ 	*out_pages =3D DIV_ROUND_UP(cur_out, PAGE_SIZE);
  	return ret;
  }
 =20

--Sig_/4T=H+b6AAkcmXFR+Ay4mzf0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmF/LIUACgkQAVBC80lX
0Gxnzwf+P418XoJxRpiq6hvfCNv29Wi9sOMlVWqG03dGT90FmJ3nv+wCKjHwlaBl
VHPdS+YY3V2brE6s+zsNwzQwSi/2sKvH8WoEAqUAcNPbUQMz08EWrqfVtoxGczcC
1nXDBTNl+mkc3XLREPRat9Ijj+Jg4CRjVKR9C0pyWw8y5sC9T/hWYI4x5nerNe+V
owiEyf/Ocg0W5hhUKeoewrbr8tsmFZlTD0fezdiylJ4LtRwW2zh9/GSz1T6CMvWr
kpNVzetw8wSBfjUhdwKWCywUUzwYG+PymixCvvoSyUY+UIhpNOLrSpzFBUf8rWUV
mRng09mIyp/hPCennqDcB+KIDnz3jQ==
=9r1G
-----END PGP SIGNATURE-----

--Sig_/4T=H+b6AAkcmXFR+Ay4mzf0--
