Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3E013047B8
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 20:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbhAZF55 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 00:57:57 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55103 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727097AbhAYJoM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Jan 2021 04:44:12 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DPQ0f22stz9sSs;
        Mon, 25 Jan 2021 20:43:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611567810;
        bh=TKvlSRsstD9csvjNrMrpEVFbR7nj0PeMBVSeIXOnVaw=;
        h=Date:From:To:Cc:Subject:From;
        b=qgF+Gofy3eYFArE4yXSkTQoFzBXfkbBQlLJjZzHS4z9Ywpir3GNxSNpbkhT/II3hW
         lIEhzR9tw56dqUZ+DW9hwERSYkYyrS5WJvfEcGnk9RKJ9QMp9SM8T1iivflr5Xj72F
         usOtoOwRy9nI+5qN6TFWDiLg5YJpR1bOZhLrkyow2GMH5HvCWM9pI9Gz27HCwPjfi0
         fQRLtkTO40zKz5tx/HRYQDSF1V8miebqQoaLg/wYr86ldYbBe4b+KbdNdshXfA4eZ9
         ti+D8ay47nwUFdkn7QukmIxjgls1do5mAzx/jNT29AphMMBOkQOpK48v4JcjJLobSj
         XSE1AaPs5zBSQ==
Date:   Mon, 25 Jan 2021 20:43:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Bijan Mottahedeh <bijan.mottahedeh@oracle.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the block tree
Message-ID: <20210125204329.22a4964c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8b+VE46D+8rlMXcYXUCHCs/";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/8b+VE46D+8rlMXcYXUCHCs/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  36962a1e4186 ("io_uring: create common fixed_rsrc_data allocation routine=
s")
  5bc97865b3b6 ("io_uring: create common fixed_rsrc_ref_node handling routi=
nes")
  b2315a2cda1f ("io_uring: generalize io_queue_rsrc_removal")
  a63c1259317d ("io_uring: rename file related variables to rsrc")

are missing a Signed-off-by from their author.

--=20
Cheers,
Stephen Rothwell

--Sig_/8b+VE46D+8rlMXcYXUCHCs/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAOksEACgkQAVBC80lX
0Gzp9Qf/anHqnbnFxmIosUkRQv71WbRxuec6DuwHAR6pxHLJanH7qD4LawyiShT+
nPKqiYQV9vGGNRY0hV3NeilSIt7ymEnrvs+p2j5XfWvFGl+r8Anj+9mGWeV/phKX
LQ6u0Fr3joOrZgrlIfn+tOh9jx/bjaKToblseLo3xptKVwmYPcTvBrhO93s9hH8/
rOE59PnP7qcPXBh27eqmyBtUD1RagcTOFsxG5C6NYRy36SLmuEFEeXxUcc6yqGiY
s6nwZ3VWrBkK5znxkv9xuGOJjaq8dbaG6x2M8ijhGYb4vtKveZiLisuqnowK+GEb
wIOtGZ3BLc/FC9GBbuPowV6co4wuwA==
=WWbZ
-----END PGP SIGNATURE-----

--Sig_/8b+VE46D+8rlMXcYXUCHCs/--
