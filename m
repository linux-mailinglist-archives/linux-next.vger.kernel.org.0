Return-Path: <linux-next+bounces-3069-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D25B99347B2
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 07:47:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80833281972
	for <lists+linux-next@lfdr.de>; Thu, 18 Jul 2024 05:47:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F13C3B78D;
	Thu, 18 Jul 2024 05:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="OYV9o3Fz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E08620;
	Thu, 18 Jul 2024 05:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721281621; cv=none; b=HxK7MM+mtlsPj0L2WpaMhKQ3vM+BrBL2ybHSBAlY7u/c6WQ9YW08ZxrxOek0pE/tJMgkDi2dgluv9RGXKcv9pRCJT/mTbKkz5DhOohemjzRjcEhNyCgtGAlIHo7D9m8KfxLtf9Jk/ndI5xJr1MggqdUWEJdmfk/8dR/P0M45FAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721281621; c=relaxed/simple;
	bh=044W7QNR0WQV3UbF17rYJuj0Ec7oUF/S4lPrMOoA8OM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hrnHBSIkUrZ599hptwTnrs7hgVrKNNa9eirjrjicZJUPstx3aeKAFFSD1SSncr18J0xvB4gyc1vHhpj8bBAOsPGALxQ7a+vLX4oQahgwGZj6q1fwsCj/1kI7nvU6kDuk0RURUs04/P83linKmoecxLz9U332ZH0QQGWcymxm2yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=OYV9o3Fz; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1721281612;
	bh=gVn3lQjCqqSEPi7Kq1mBwXST1YHHzL6Q1cYJs7bUygM=;
	h=Date:From:To:Cc:Subject:From;
	b=OYV9o3FzLRRRGZ1z0Yf+GffkZrh+3QeGjgVm8TOIvkDG54ZXEOUAPT9iyLEHDkbLE
	 wMbmBfH/66UKsWeAhF9tg1Fd/Y/f7umvzBR/smLuXNj5QXH2H4ajbtv/DHz6snBq1E
	 u3BbULDA3dJxxDIUNGgbc7ZqSYQCtKjN5Z2fMhKmQdGYgrjVLycAoaBih7s7R9sqfX
	 3pvu6Co7WR7cekSn5CqkO2Sb0RqGZBtP8JoawD6IESw3O/A5F/VgTj0l2VjN9Npg4h
	 q0UQu79DLzPLtrNMDqA8T4dZd3E+0vMcJlNwIou0/SaFOys4HREZPDP2t/MaPXGN4r
	 mPhfTiqHEGATw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WPhdS5n9Jz4w2N;
	Thu, 18 Jul 2024 15:46:52 +1000 (AEST)
Date: Thu, 18 Jul 2024 15:46:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Kent Overstreet <kent.overstreet@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the bcachefs tree
Message-ID: <20240718154651.28bc7b48@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eRZQ.yn=ozD/TM65gsyXFYo";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/eRZQ.yn=ozD/TM65gsyXFYo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the bcachefs tree, today's linux-next build (s390 defconfig)
produced this warning:

In file included from fs/bcachefs/str_hash.h:5,
                 from fs/bcachefs/xattr.h:5,
                 from fs/bcachefs/acl.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/backpointers.h:6,
                 from fs/bcachefs/bkey_methods.c:4:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_update_interior.h:6,
                 from fs/bcachefs/bkey_sort.c:166:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/backpointers.h:6,
                 from fs/bcachefs/alloc_foreground.c:17:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/backpointers.h:6,
                 from fs/bcachefs/backpointers.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/backpointers.h:6,
                 from fs/bcachefs/alloc_background.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_io.h:7,
                 from fs/bcachefs/btree_cache.c:7:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_key_cache.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/backpointers.h:6,
                 from fs/bcachefs/btree_gc.c:10:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_io.h:7,
                 from fs/bcachefs/btree_node_scan.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_locking.c:4:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_io.h:7,
                 from fs/bcachefs/btree_io.c:7:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_io.h:7,
                 from fs/bcachefs/btree_trans_commit.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/btree_update.c:4:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_iter.c:7:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_write_buffer.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/backpointers.h:6,
                 from fs/bcachefs/buckets.c:10:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/btree_update_interior.c:10:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/move.h:7,
                 from fs/bcachefs/chardev.c:10:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/dirent.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_io.h:7,
                 from fs/bcachefs/debug.c:12:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/error.c:3:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/extent_update.c:3:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/disk_accounting.c:7:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/data_update.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/fs-common.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/str_hash.h:5,
                 from fs/bcachefs/dirent.h:5,
                 from fs/bcachefs/fs-ioctl.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/backpointers.h:6,
                 from fs/bcachefs/ec.c:8:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/str_hash.h:5,
                 from fs/bcachefs/fs.h:7,
                 from fs/bcachefs/fs-io-direct.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/io_misc.c:9:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/fs-io.c:7:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/fs.c:7:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/fs-io-pagecache.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/inode.c:7:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/str_hash.h:5,
                 from fs/bcachefs/fs.h:7,
                 from fs/bcachefs/fs-io.h:8,
                 from fs/bcachefs/fs-io-buffered.c:7:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_io.h:7,
                 from fs/bcachefs/extents.c:13:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/io_read.c:12:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/logged_ops.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/io_write.c:11:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/journal_reclaim.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/journal.c:12:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/lru.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/migrate.c:8:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/movinggc.c:11:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_io.h:7,
                 from fs/bcachefs/journal_io.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/fsck.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/backpointers.h:6,
                 from fs/bcachefs/move.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/quota.c:3:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/rebalance.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/backpointers.h:6,
                 from fs/bcachefs/recovery_passes.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/recovery.c:8:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_update_interior.h:6,
                 from fs/bcachefs/sb-clean.c:4:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/reflink.c:4:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/subvolume.c:5:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/xattr.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_update_interior.h:6,
                 from fs/bcachefs/super.c:19:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_locking.h:13,
                 from fs/bcachefs/btree_io.h:7,
                 from fs/bcachefs/sysfs.c:16:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/btree_update.h:5,
                 from fs/bcachefs/snapshot.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~
In file included from fs/bcachefs/trace.c:6:
fs/bcachefs/btree_iter.h: In function '__btree_path_put':
fs/bcachefs/btree_iter.h:39:18: warning: unused variable 'idx' [-Wunused-va=
riable]
   39 |         unsigned idx =3D path - trans->paths;
      |                  ^~~

Introduced by commit

  9e1156881fbc ("bcachefs: Btree path tracepoints")

--=20
Cheers,
Stephen Rothwell

--Sig_/eRZQ.yn=ozD/TM65gsyXFYo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaYrEsACgkQAVBC80lX
0GyR1Af/dzrULCtElnqpNjIbgiXcfNeZlfxGdDqQprCqmZ+mRCQjsQM8/WPtWiWl
WcngiPf7jlsH+GMouwc9tPcHO7cnQbbxrbjnfzQbZ+qT3FgjcTjCqYHq9lQOA5fU
8rZBeWsP5d/6DmFxjKOuxOeVofeqYV8JeaxWpTwsywsWXwi5Y8we0XrIazFubvZ3
QuJae19oHkdJ65klmnhEL5C1qahQhxtTf3Iqnp04coKdv7d6XhpMiB1VitxTPZRp
BavY8xK2giXbYLJ6loLjndb4e4Z6SUi0SyZW7xR/bRRY8tttj+7U2NECDfpc9c/X
nzQqkyJdxWgSZA3Wjs6WKmwFGD0Z6w==
=5kYw
-----END PGP SIGNATURE-----

--Sig_/eRZQ.yn=ozD/TM65gsyXFYo--

