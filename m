Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C002D305115
	for <lists+linux-next@lfdr.de>; Wed, 27 Jan 2021 05:41:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239331AbhA0ElI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 23:41:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405312AbhA0BpK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Jan 2021 20:45:10 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A36C0613ED;
        Tue, 26 Jan 2021 17:36:22 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQR5b2ZCjz9sBy;
        Wed, 27 Jan 2021 12:36:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611711379;
        bh=ctNf9ukIvFwLv4opdXxhui5bZlsS3oKjSMWrXNOtW7M=;
        h=Date:From:To:Cc:Subject:From;
        b=VJjyUMu18y43dj8nU9r09x1HGztXubtnd9TslRefbVMihe36ZxSUivuauyvCYVsYs
         pRQlWqe1QexgtsUw0TG9NLJsKfv1CBtB5gik+Va5qgBvKF/VkL9ZWbIaVOVHlEHImu
         tQeiPrBujNKulftVkVLksP1aXrCUSZWiBsYpHKL8ot+cjUwgxnB1/qKP6MJlVVici2
         gyRxT8y8YT5KSjVky7Nbd+bRFySBPkMJMdbLXqrT0kZzbbyiNz5yRfpFlOn4qvHf9M
         az4Ve6FhvsL2bxCxYeOOJlY8Zjhy8UOe1amw+UaGDqlcqhiEnICIfNS3kWDKiHkskF
         wsmLZF1kfWgKA==
Date:   Wed, 27 Jan 2021 12:36:18 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Sterba <dsterba@suse.cz>
Cc:     Nikolay Borisov <nborisov@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the btrfs tree
Message-ID: <20210127123618.3d2c6469@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/nfHCSSGLo9BWrp5rQ9kWbhi";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/nfHCSSGLo9BWrp5rQ9kWbhi
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the btrfs tree, today's linux-next build (powerpc
ppc64_defconfig) produced these warnings:

fs/btrfs/file-item.c:44: warning: expecting prototype for s size according =
to filesystem options(). Prototype was for btrfs_inode_safe_disk_i_size_wri=
te() instead
fs/btrfs/file-item.c:82: warning: expecting prototype for Mark range within=
 a file as having a new extent inserted(). Prototype was for btrfs_inode_se=
t_file_extent_range() instead
fs/btrfs/file-item.c:110: warning: expecting prototype for Marks an inode r=
ange as not having a backing extent(). Prototype was for btrfs_inode_clear_=
file_extent_range() instead
fs/btrfs/file-item.c:354: warning: wrong kernel-doc identifier on line:
 * Lookup the checksum for the read bio in csum tree.
fs/btrfs/extent_map.c:402: warning: expecting prototype for Add new extent =
map to the extent tree(). Prototype was for add_extent_mapping() instead
fs/btrfs/extent_map.c:603: warning: expecting prototype for Add extent mapp=
ing into em_tree(). Prototype was for btrfs_add_extent_mapping() instead
fs/btrfs/extent_io.c:415: warning: expecting prototype for Such entry would=
 have(). Prototype was for __etree_search() instead
fs/btrfs/extent_io.c:1609: warning: expecting prototype for Find a contiguo=
us area of bits(). Prototype was for find_contiguous_extent_bit() instead
fs/btrfs/extent_io.c:1646: warning: expecting prototype for This range coul=
d start before(). Prototype was for find_first_clear_extent_bit() instead
fs/btrfs/extent_io.c:4260: warning: wrong kernel-doc identifier on line:
 * Walk the list of dirty pages of the given address space and write all of=
 them.
fs/btrfs/delayed-ref.c:81: warning: expecting prototype for s reservation()=
. Prototype was for btrfs_delayed_refs_rsv_release() instead
fs/btrfs/delayed-ref.c:130: warning: expecting prototype for Transfer bytes=
 to our delayed refs rsv(). Prototype was for btrfs_migrate_to_delayed_refs=
_rsv() instead
fs/btrfs/delayed-ref.c:177: warning: expecting prototype for Refill based o=
n our delayed refs usage(). Prototype was for btrfs_delayed_refs_rsv_refill=
() instead
fs/btrfs/free-space-cache.c:1329: warning: expecting prototype for Write ou=
t cached info to an inode(). Prototype was for __btrfs_write_out_cache() in=
stead
fs/btrfs/inode.c:3110: warning: expecting prototype for Wait for flushing a=
ll delayed iputs(). Prototype was for btrfs_wait_on_delayed_iputs() instead
fs/btrfs/backref.c:1525: warning: expecting prototype for Check if an exten=
t is shared or not(). Prototype was for btrfs_check_shared() instead
fs/btrfs/discard.c:205: warning: expecting prototype for Wrap find_next_blo=
ck_group(). Prototype was for peek_discard_list() instead
fs/btrfs/delalloc-space.c:207: warning: expecting prototype for Release any=
 excessive reservation(). Prototype was for btrfs_inode_rsv_release() inste=
ad
fs/btrfs/delalloc-space.c:378: warning: expecting prototype for Release a m=
etadata reservation for an inode(). Prototype was for btrfs_delalloc_releas=
e_metadata() instead
fs/btrfs/delalloc-space.c:477: warning: expecting prototype for Release dat=
a and metadata space for delalloc(). Prototype was for btrfs_delalloc_relea=
se_space() instead
fs/btrfs/space-info.c:572: warning: expecting prototype for Possibly commit=
 the transaction if its ok to(). Prototype was for may_commit_transaction()=
 instead
fs/btrfs/space-info.c:1373: warning: Function parameter or member 'start_ns=
' not described in 'handle_reserve_ticket'
fs/btrfs/space-info.c:1373: warning: Function parameter or member 'orig_byt=
es' not described in 'handle_reserve_ticket'
fs/btrfs/space-info.c:1373: warning: expecting prototype for Do the appropr=
iate flushing and waiting for a ticket(). Prototype was for handle_reserve_=
ticket() instead
fs/btrfs/space-info.c:1478: warning: expecting prototype for s space(). Pro=
totype was for __reserve_bytes() instead
fs/btrfs/space-info.c:1604: warning: expecting prototype for s space(). Pro=
totype was for btrfs_reserve_metadata_bytes() instead
fs/btrfs/space-info.c:1640: warning: expecting prototype for Try to reserve=
 data bytes for an allocation(). Prototype was for btrfs_reserve_data_bytes=
() instead
fs/btrfs/block-group.c:1583: warning: expecting prototype for Map a physica=
l disk address to a list of logical addresses(). Prototype was for btrfs_rm=
ap_block() instead

Introduced by commits

  5001aa0708b9 ("btrfs: fix function description formats in file-item.c")
  1cf15d8d422e ("btrfs: document modified parameter of add_extent_mapping")
  d0295ba341a8 ("btrfs: fix parameter description of btrfs_add_extent_mappi=
ng")
  b4a01a9a613b ("btrfs: fix parameter description for functions in extent_i=
o.c")
  28eef9969992 ("btrfs: fix parameter description in delayed-ref.c function=
s")
  d89752bbf791 ("btrfs: improve parameter description for __btrfs_write_out=
_cache")

and so on ...

Presumably exposed by commit

  52042e2db452 ("scripts: kernel-doc: validate kernel-doc markup with the a=
ctual names")

from the jc_docs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/nfHCSSGLo9BWrp5rQ9kWbhi
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQw5IACgkQAVBC80lX
0GzYAAgAhUkYI9noLwqdJoxNDgw3PYfPS/UWqvMvumWGorISUpaL2hnu+WjIVUoL
fv88egELLj6YV1JJmymIP38SyN/drL3nTlfdGII47KroOsPJqHOD6WiE9Tj7fsf8
ifcI/4guvlHmQ4AIYL5fL01sD9xaKsW/In4DyXh8yxfvMrtqAJyo/j3CHCtbE66E
/nAntG9afDACQnRNDA+R4nSCUb0dIfaK7ErTmlITn0FQCsNauWwXBCqRLMZw4ZZs
3xWwwf6TVUSN80Kap0dQ+dC8kAIvAe1K7/1k5/wrhQLmNSVEl5MSdlfZi4izd72k
uXbbrlwLaRuvGFNP+OE+484Qcrk/Pg==
=X88e
-----END PGP SIGNATURE-----

--Sig_/nfHCSSGLo9BWrp5rQ9kWbhi--
