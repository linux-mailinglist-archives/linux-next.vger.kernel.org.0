Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E89C412DE4
	for <lists+linux-next@lfdr.de>; Tue, 21 Sep 2021 06:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbhIUE2D (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Sep 2021 00:28:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231200AbhIUE2C (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 21 Sep 2021 00:28:02 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AAB6C061574;
        Mon, 20 Sep 2021 21:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1632198391;
        bh=+PBDC0P4KwvNTy0H42V45rTn3V9b78K5HdyAefj24v0=;
        h=Date:From:To:Cc:Subject:From;
        b=eZNPjbXXUZliFHIXxdI3n3s3kVxLwWX3TVbY+r6vEFYAqMrd8pSDPrzJwSoFxYNPN
         N3pzxj6bFx/lNomJS0SqF8W5KAO+O53DpLrmjh+GU3Bejr7BNFvtijYpckoWhl1Cke
         WMOXbcslq0cGvLQMyKenAFpNUmzsPaOeEAMvUsgNvGb4MlRtFJ6IBUk5mra1ed2l1u
         KnbbBrz4yAcwqBjovhOjP6dxQu5QHzkOk0FEEQHh+BMaSsvm7Z0jpH7AlowoP6WkNK
         FULUtN5C6mlFYquDjzWcc59j4kmvmVLGLXVRauX1StEkUDUP1g6LtvELIWgTpJMl05
         wA/Q0hs9vVuaA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HD7fb2jR0z9t54;
        Tue, 21 Sep 2021 14:26:31 +1000 (AEST)
Date:   Tue, 21 Sep 2021 14:26:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Matthew Wilcox <willy@infradead.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the folio tree
Message-ID: <20210921142628.75ba9ef2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/S=exEv8ZCExDvhYH5xqItvt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/S=exEv8ZCExDvhYH5xqItvt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the folio tree, today's linux-next build (x86_64
allmodconfig) failed like this:

fs/9p/vfs_file.c: In function 'v9fs_vm_page_mkwrite':
fs/9p/vfs_file.c:557:6: error: implicit declaration of function 'wait_on_pa=
ge_bit_killable'; did you mean 'wait_on_page_locked_killable'? [-Werror=3Di=
mplicit-function-declaration]
  557 |      wait_on_page_bit_killable(page, PG_writeback) < 0)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~
      |      wait_on_page_locked_killable

Caused by commit

  be8f72914261 ("mm/filemap: Add folio_wait_bit()")

interacting with commit

  82766b47b26c ("9p: (untested) Convert to using the netfs helper lib to do=
 reads and caching")

from the fscache tree.

I have applied the following merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 21 Sep 2021 14:18:06 +1000
Subject: [PATCH] fix up for "9p: (untested) Convert to using the netfs help=
er
 lib to do reads and caching"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/9p/vfs_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
index 4b617d10cf28..68d05b2aa290 100644
--- a/fs/9p/vfs_file.c
+++ b/fs/9p/vfs_file.c
@@ -554,7 +554,7 @@ v9fs_vm_page_mkwrite(struct vm_fault *vmf)
 #endif
=20
 	if (PageWriteback(page) &&
-	    wait_on_page_bit_killable(page, PG_writeback) < 0)
+	    folio_wait_bit_killable(page_folio(page), PG_writeback) < 0)
 		return VM_FAULT_RETRY;
=20
 	/* Update file times before taking page lock */
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/S=exEv8ZCExDvhYH5xqItvt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFJXvQACgkQAVBC80lX
0Gwc6wf/d6iNJ6T20lCiyiTYAb/3/Mgz5rgpa6sDu79Hl/DfUW0La9afVK+bqVDz
yMAnRiMnXWVOVYFI3khg4kM3/gaCvXGBcc7IBURdS9SvnG6lXQroiJxnM8Xebq4G
45Oh/HdVifDEfstrt4ts+Y5hJqNGBBm8fxKkIWx1hmVn/w0ZrChe7wK9Wil7VVzB
JlTJXv5qPtXRWrelVjTx9nC3gh5cT+k/cstBdMhd/t1sdgTPwXEIY4lz7c/Hd2a4
ARJzgHm6B88S1fNx0vHCeKV/rKooJlKOUUcifoHaNDQbfvFsDkCyf0xn8KALjJxd
kydIxrs6R4doMtqXYk0K/uGZQuJcTA==
=/oJV
-----END PGP SIGNATURE-----

--Sig_/S=exEv8ZCExDvhYH5xqItvt--
