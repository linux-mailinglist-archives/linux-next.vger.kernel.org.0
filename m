Return-Path: <linux-next+bounces-5009-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD0F9F8A07
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 03:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FE847A2973
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2024 02:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E169E134AC;
	Fri, 20 Dec 2024 02:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VfUxAR/E"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6D6259494;
	Fri, 20 Dec 2024 02:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734660664; cv=none; b=BYLfgxk246LAdLnD5WLtL60oG7nGi4Ym69fG3bgwOmDJc7t33PPekdmYy6qhtmPnaPpqgnPAgkeLHfVfxz0bTgYmO+q7Jmtyt4o3w18LTOc0Gmfg3y+9NWJj9JueGFD64e4dtrulba/gPxJU2zSOsWqZJ/o42Bn46Wub+KwkLAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734660664; c=relaxed/simple;
	bh=yvXcrqfLAEeOMmwnp65nZg6Oqt6GkZRJJ04ICdzuiHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qVCEia6FCmRQaznD1EbVv1SH2XuyvgRd7Hm3ZkW/2P+N1XK2ljlHNoYs3o6YDC3brZQMjRP1IlOXBbwIN/AyGZPKpEpakguYVpicE4Y2QtuP/Y8Uc3ZYLfzt1RvxQ0HoyhEM9tC/QzBXAEkCmJzlfm5ObxNyMMwt3LtlwnK2WGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VfUxAR/E; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734660651;
	bh=uINIwQUrhjeGTeNUhPp1/QA9zM/u2zZUa3PtEpz4Vnc=;
	h=Date:From:To:Cc:Subject:From;
	b=VfUxAR/Elvdj84Fb1gzsqtbW6dEoT4Vol1SwwczJmZz8AxMJX77cirbto+ZJQShL7
	 fTJbgobrmzSEHZwQt/29Nq8AEnB8CLkmpeQneUuYDPj5G1JHFuv3Jc88soCcO8IbAX
	 Sv+uWsIWnsXovawoqSkVza3ysy8GU9yjKzJI6LSKO5wXjgZDDiLuREJQDL/HaAwViF
	 DcLKZMhtUbQfqb1jzJn5wSuTTDzvTtDy5X9/hxNINrn8sSmu3S8MAl5byQOn5UE5hd
	 /DQM2yVpU4rTwKwp9XgZ5numo8FqBsDBNTBhT9IR8vY6D4fKoIHgMo9r+54BOPL0XN
	 EV4UybrB7WuRg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YDrVg147hz4wyV;
	Fri, 20 Dec 2024 13:10:50 +1100 (AEDT)
Date: Fri, 20 Dec 2024 13:10:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the block tree
Message-ID: <20241220131054.7f6e7959@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9UEKTBo3GQ2ZSd.Cvc=sM5n";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9UEKTBo3GQ2ZSd.Cvc=sM5n
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (x86_64
allmodconfig) failed like this:

error[E0425]: cannot find value `BLK_MQ_F_SHOULD_MERGE` in crate `bindings`
  --> rust/kernel/block/mq/tag_set.rs:55:38
   |
55 |                     flags: bindings::BLK_MQ_F_SHOULD_MERGE,
   |                                      ^^^^^^^^^^^^^^^^^^^^^ not found i=
n `bindings`

error: aborting due to 1 previous error

For more information about this error, try `rustc --explain E0425`.

Caused by commit

  9377b95cda73 ("block: remove BLK_MQ_F_SHOULD_MERGE")

I have applied the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 20 Dec 2024 12:43:38 +1100
Subject: [PATCH] fixup for "block: remove BLK_MQ_F_SHOULD_MERGE"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 rust/kernel/block/mq/tag_set.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/block/mq/tag_set.rs b/rust/kernel/block/mq/tag_set=
.rs
index d7f175a05d99..00ddcc71dfa2 100644
--- a/rust/kernel/block/mq/tag_set.rs
+++ b/rust/kernel/block/mq/tag_set.rs
@@ -52,7 +52,7 @@ pub fn new(
                     numa_node: bindings::NUMA_NO_NODE,
                     queue_depth: num_tags,
                     cmd_size,
-                    flags: bindings::BLK_MQ_F_SHOULD_MERGE,
+                    flags: 0,
                     driver_data: core::ptr::null_mut::<crate::ffi::c_void>=
(),
                     nr_maps: num_maps,
                     ..tag_set
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/9UEKTBo3GQ2ZSd.Cvc=sM5n
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdk0i4ACgkQAVBC80lX
0GwMDAgAlwYBsrL4DHnP/ssTjVq13fCGkU7H6N1aE59SwGe00gRMdXerqcyVwHrB
akJ7K8KHWo/UAWKsUC+XBlrNFaQZfgoU8DuX9nNUxW8KmbF+eaqv0FXU2SSNruJD
dg7hxDWuR9X4aM3rdYtsorQyBtG6rJEUPBT40Qi5INRmp1pa57Sxx2btpQHZ9Du8
1K4ZnX7BOzemAY+KY/ZMsozm3y9d8nw8K2eLxwtyDxjYcKHIbRX1FoiMLKeQZiqa
69sRVCFrueiu9dvfxucGCbxV5Dpgdi8o97kW6xBK64xdbm/znN9LgKPm8zMxEf+9
XzvBmSFBL9ZbEFtmvHocAOxiia/0fQ==
=jA8o
-----END PGP SIGNATURE-----

--Sig_/9UEKTBo3GQ2ZSd.Cvc=sM5n--

