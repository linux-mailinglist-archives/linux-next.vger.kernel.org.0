Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D639440161F
	for <lists+linux-next@lfdr.de>; Mon,  6 Sep 2021 07:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239229AbhIFF6y (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Sep 2021 01:58:54 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43083 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238941AbhIFF6x (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Sep 2021 01:58:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1630907868;
        bh=te1bo8gYeMFqnOEhpDNKd3lNEWiP8ZFa/W5V1jGv6jE=;
        h=Date:From:To:Cc:Subject:From;
        b=o4PbTf/NWXmFdeBzJEzz07VAVFQO01TJ5x5wtnkKQxp8GaIwhmn5qjdqSUzUdvMlm
         wKwnu/U02x3TRxaVW/FQXSoulgs/OO8hUpZw3xYcFMHPA7khCqEh2OJHByJdZJU38b
         kAPxV/Y6uONq/AvnkznFnPN2GJ3VFQlsoJa3XZh2vf2qTRQNnlwT2t9yXG9yLeN0ar
         tQDlWnaLLYOKVOf+G/UtRtMRUNEz6cTXGN6Kz2v86RnoLzgmwzRFEe+tIvJ4Fk35EB
         nTiZHXcDyYAnaj69YkmQFXWjJowpjvbsVqewJF25TZDq5M2C7xrer1BfbNRyViOIm/
         eU1AiINGGwO9w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4H2yNq6GFLz9sRf;
        Mon,  6 Sep 2021 15:57:47 +1000 (AEST)
Date:   Mon, 6 Sep 2021 15:57:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure in Linus' tree
Message-ID: <20210906155746.57127887@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rcMaQ_UGYpx5z44R6F2Vy+v";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rcMaQ_UGYpx5z44R6F2Vy+v
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Building Linus' tree, today's linux-next build (sparc64 defconfig)
failed like this:

<stdin>:1515:2: error: #warning syscall clone3 not implemented [-Werror=3Dc=
pp]
cc1: all warnings being treated as errors

Caused by commit

  3fe617ccafd6 ("Enable '-Werror' by default for all kernel builds")

I have added this patch for today (I guess I could have used
-Wno-error=3Dcpp).

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 Sep 2021 15:47:02 +1000
Subject: [PATCH] don't make the syscall checking produced errors from warni=
ngs

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 scripts/checksyscalls.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index b7609958ee36..fd9777f63f14 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -266,4 +266,4 @@ syscall_list() {
 }
=20
 (ignore_list && syscall_list $(dirname $0)/../arch/x86/entry/syscalls/sysc=
all_32.tbl) | \
-$* -E -x c - > /dev/null
+$* -Wno-error -E -x c - > /dev/null
--=20
2.32.0

--=20
Cheers,
Stephen Rothwell

--Sig_/rcMaQ_UGYpx5z44R6F2Vy+v
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmE1rdoACgkQAVBC80lX
0GxzkQgAoCZNABSqB5RHZJjEKc0fRN35uOGZawBlQ6gFsIydoR8Z0KHjt5t8USlY
+cACaoJgWkEuM4PhA8w/uTXR7ihZk52GYxXiwnMIAJ+pUlyNdiNe2jIH7JDY2V9u
+hZ7inND8r9ZbqXNe9ojlrkEVlfjjVh1gBPHtSVRYv/Db3SBpKTVnk/hfYExU7jQ
SDt1Or/cs3e7S/RzKzMefKlxMtBW+dOS8QUPacXzEgjIuwGYNR0qLu+feIhTiqLl
Satigni6O8ABCH+gOqY3B3S3gdnVcObz+6uifCGxqVrr9oIztcaU2+18ORth0YTC
6njINE2ZS7qX0FbOl9/kGxCDyN5cvA==
=b/bS
-----END PGP SIGNATURE-----

--Sig_/rcMaQ_UGYpx5z44R6F2Vy+v--
