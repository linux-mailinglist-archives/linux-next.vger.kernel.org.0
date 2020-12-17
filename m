Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3626B2DDBC9
	for <lists+linux-next@lfdr.de>; Fri, 18 Dec 2020 00:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727140AbgLQXNi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 18:13:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727134AbgLQXNi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2020 18:13:38 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F885C061794;
        Thu, 17 Dec 2020 15:12:57 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxnpW4rRZz9sWK;
        Fri, 18 Dec 2020 10:12:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608246773;
        bh=7HcfKgnudq/jly4dAIbd/Z5KDczfCvyRwxJ/u4JukdM=;
        h=Date:From:To:Cc:Subject:From;
        b=APN8Hq1zP3jxTVZnB+/l9+TcMAuHxVESWeuvwrBzL6ribXhSmNiuhFqRCJ7GrJQ7O
         6N1BwQVpNJuRFektXniqXJUcx1swjHLGHHHdzkBmfurUTACqPkjgCyRvvfwSyf8mkk
         QNm0fxNm3RyIaeFw847ncsO6cvK0WmnpoSR8r0aZkipbeL57ZQ9driLOeYAPTTs8IL
         7eLID2bTRIyGu7SBAGnu4JE2D5TlBBsFo2nyp2o2UeAFXCwNakIfhq1R6mzKg6bkNo
         H14m6z9iiPuvYcFC+q/38E9gYNcy1ZwWYZNCAAP2WbsihglpsmJ9odh2YHU+Hv7mzv
         CY/ZO3WrNKilg==
Date:   Fri, 18 Dec 2020 10:12:49 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ext4 tree with Linus' tree
Message-ID: <20201218101249.20f29765@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Et8CIw6xaACmIlc6aVCJEDz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Et8CIw6xaACmIlc6aVCJEDz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ext4 tree got a conflict in:

  fs/ext4/super.c

between commit:

  8446fe9255be ("block: switch partition lookup to use struct block_device")

from Linus' tree and commit:

  8e6f04c5e918 ("ext4: use sbi instead of EXT4_SB(sb) in ext4_update_super(=
)")

from the ext4 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/ext4/super.c
index 830c196ec069,f53e69ec858d..000000000000
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@@ -5499,22 -5493,76 +5487,72 @@@ static void ext4_update_super(struct su
  	 */
  	if (!(sb->s_flags & SB_RDONLY))
  		ext4_update_tstamp(es, s_wtime);
 -	if (sb->s_bdev->bd_part)
 -		es->s_kbytes_written =3D
 -			cpu_to_le64(sbi->s_kbytes_written +
 -			    ((part_stat_read(sb->s_bdev->bd_part,
 -					     sectors[STAT_WRITE]) -
 -			      sbi->s_sectors_written_start) >> 1));
 -	else
 -		es->s_kbytes_written =3D cpu_to_le64(sbi->s_kbytes_written);
 +	es->s_kbytes_written =3D
- 		cpu_to_le64(EXT4_SB(sb)->s_kbytes_written +
++		cpu_to_le64(sbi->s_kbytes_written +
 +		    ((part_stat_read(sb->s_bdev, sectors[STAT_WRITE]) -
- 		      EXT4_SB(sb)->s_sectors_written_start) >> 1));
- 	if (percpu_counter_initialized(&EXT4_SB(sb)->s_freeclusters_counter))
++		      sbi->s_sectors_written_start) >> 1));
+ 	if (percpu_counter_initialized(&sbi->s_freeclusters_counter))
  		ext4_free_blocks_count_set(es,
- 			EXT4_C2B(EXT4_SB(sb), percpu_counter_sum_positive(
- 				&EXT4_SB(sb)->s_freeclusters_counter)));
- 	if (percpu_counter_initialized(&EXT4_SB(sb)->s_freeinodes_counter))
+ 			EXT4_C2B(sbi, percpu_counter_sum_positive(
+ 				&sbi->s_freeclusters_counter)));
+ 	if (percpu_counter_initialized(&sbi->s_freeinodes_counter))
  		es->s_free_inodes_count =3D
  			cpu_to_le32(percpu_counter_sum_positive(
- 				&EXT4_SB(sb)->s_freeinodes_counter));
- 	BUFFER_TRACE(sbh, "marking dirty");
+ 				&sbi->s_freeinodes_counter));
+ 	/* Copy error information to the on-disk superblock */
+ 	spin_lock(&sbi->s_error_lock);
+ 	if (sbi->s_add_error_count > 0) {
+ 		es->s_state |=3D cpu_to_le16(EXT4_ERROR_FS);
+ 		if (!es->s_first_error_time && !es->s_first_error_time_hi) {
+ 			__ext4_update_tstamp(&es->s_first_error_time,
+ 					     &es->s_first_error_time_hi,
+ 					     sbi->s_first_error_time);
+ 			strncpy(es->s_first_error_func, sbi->s_first_error_func,
+ 				sizeof(es->s_first_error_func));
+ 			es->s_first_error_line =3D
+ 				cpu_to_le32(sbi->s_first_error_line);
+ 			es->s_first_error_ino =3D
+ 				cpu_to_le32(sbi->s_first_error_ino);
+ 			es->s_first_error_block =3D
+ 				cpu_to_le64(sbi->s_first_error_block);
+ 			es->s_first_error_errcode =3D
+ 				ext4_errno_to_code(sbi->s_first_error_code);
+ 		}
+ 		__ext4_update_tstamp(&es->s_last_error_time,
+ 				     &es->s_last_error_time_hi,
+ 				     sbi->s_last_error_time);
+ 		strncpy(es->s_last_error_func, sbi->s_last_error_func,
+ 			sizeof(es->s_last_error_func));
+ 		es->s_last_error_line =3D cpu_to_le32(sbi->s_last_error_line);
+ 		es->s_last_error_ino =3D cpu_to_le32(sbi->s_last_error_ino);
+ 		es->s_last_error_block =3D cpu_to_le64(sbi->s_last_error_block);
+ 		es->s_last_error_errcode =3D
+ 				ext4_errno_to_code(sbi->s_last_error_code);
+ 		/*
+ 		 * Start the daily error reporting function if it hasn't been
+ 		 * started already
+ 		 */
+ 		if (!es->s_error_count)
+ 			mod_timer(&sbi->s_err_report, jiffies + 24*60*60*HZ);
+ 		le32_add_cpu(&es->s_error_count, sbi->s_add_error_count);
+ 		sbi->s_add_error_count =3D 0;
+ 	}
+ 	spin_unlock(&sbi->s_error_lock);
+=20
  	ext4_superblock_csum_set(sb);
- 	if (sync)
- 		lock_buffer(sbh);
+ 	unlock_buffer(sbh);
+ }
+=20
+ static int ext4_commit_super(struct super_block *sb)
+ {
+ 	struct buffer_head *sbh =3D EXT4_SB(sb)->s_sbh;
+ 	int error =3D 0;
+=20
+ 	if (!sbh || block_device_ejected(sb))
+ 		return error;
+=20
+ 	ext4_update_super(sb);
+=20
  	if (buffer_write_io_error(sbh) || !buffer_uptodate(sbh)) {
  		/*
  		 * Oh, dear.  A previous attempt to write the

--Sig_/Et8CIw6xaACmIlc6aVCJEDz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/b5fEACgkQAVBC80lX
0Gy6LAgAkFJlqN6FmMp8wQePiI1n+TNfLk3MS2yUciQ9sapnohTBCArYrxHJY6Tb
O00ZpUwub8CyJoK4eW31JsLKjmop9juIz2Eh/EMxYr/4QSiPagBkRLOyj1lIiuTD
6NL+LXCCU1pzD0bpULYeSPeCE1fylgxPlgfWsmih9cfHvA0SRWeaETB/jvVHXQ9T
46+5NQ2DpBoJ443ovMzyZbIyvWQhHkxo6MH3jBQitci2D5E2UQ0ePB0teoDfT3J3
82y/OvcpVUuz4XE18wOrwslkX+fCfG5MYMcTB1HCA91FlfkYf5vjOVfqnnI4NRbc
EFwHUVSrVioFKqK8HW2I/h+/Z4lpSw==
=qjif
-----END PGP SIGNATURE-----

--Sig_/Et8CIw6xaACmIlc6aVCJEDz--
