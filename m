Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57A43C95FE
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2019 02:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbfJCApX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 2 Oct 2019 20:45:23 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43925 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726411AbfJCApX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 2 Oct 2019 20:45:23 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46kDnC6RpSz9sDB;
        Thu,  3 Oct 2019 10:45:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1570063520;
        bh=jRTOajq986cWcmFtVUQ4PMeTlohkfc8VNsgeLWIw0Mo=;
        h=Date:From:To:Cc:Subject:From;
        b=A1BGquUd3xSLm3IiMz8LolMo7FD/MiRL0xtyLtQuwBDDwcFk2PWldUa05l8r70/kq
         VDXpaSbI3Ow0mZmGFyNT44GEpOl4VyJ7+LNcNt4qctENweoZ4b2Tb/6w1M5lrLsIdI
         p5MnVOva+TQ4y7hTKqgVtZ+N3jtjYL05d+XSGmNKzszd1o20EEOyaII8snFxeqD3RM
         GV3K5vbUm1vSC56FygeILOJdrWt7SpPJewxUxQzgVMw/zJ8M7tXHONvuG1iSx5jD8T
         ZNjSgQY/NkRNerwxbVxAqVS+9N040V8ZtY5X1YPYMr+aA7/iA7972vehDXCIaQ3r4L
         hHTlZo6wq6ZnQ==
Date:   Thu, 3 Oct 2019 10:45:19 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paul Burton <paul.burton@mips.com>
Subject: linux-next: manual merge of the keys tree with the mips-fixes tree
Message-ID: <20191003104519.4f607d28@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QGTZrhqjkaq1aJ2OlBHvkpX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/QGTZrhqjkaq1aJ2OlBHvkpX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the keys tree got conflicts in:

  arch/mips/kernel/syscalls/syscall_n32.tbl
  arch/mips/kernel/syscalls/syscall_n64.tbl
  arch/mips/kernel/syscalls/syscall_o32.tbl

between commit:

  0671c5b84e9e ("MIPS: Wire up clone3 syscall")

from the mips-fixes tree and commit:

  e711c800fdba ("Add a general, global device notification watch list")

from the keys tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/mips/kernel/syscalls/syscall_n32.tbl
index e7c5ab38e403,2ba5b649f0ab..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n32.tbl
@@@ -373,4 -373,5 +373,5 @@@
  432	n32	fsmount				sys_fsmount
  433	n32	fspick				sys_fspick
  434	n32	pidfd_open			sys_pidfd_open
 -# 435 reserved for clone3
 +435	n32	clone3				__sys_clone3
+ 436	n32	watch_devices			sys_watch_devices
diff --cc arch/mips/kernel/syscalls/syscall_n64.tbl
index 13cd66581f3b,ff350988584d..000000000000
--- a/arch/mips/kernel/syscalls/syscall_n64.tbl
+++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
@@@ -349,4 -349,5 +349,5 @@@
  432	n64	fsmount				sys_fsmount
  433	n64	fspick				sys_fspick
  434	n64	pidfd_open			sys_pidfd_open
 -# 435 reserved for clone3
 +435	n64	clone3				__sys_clone3
+ 436	n64	watch_devices			sys_watch_devices
diff --cc arch/mips/kernel/syscalls/syscall_o32.tbl
index 353539ea4140,7b26bd39900e..000000000000
--- a/arch/mips/kernel/syscalls/syscall_o32.tbl
+++ b/arch/mips/kernel/syscalls/syscall_o32.tbl
@@@ -422,4 -422,5 +422,5 @@@
  432	o32	fsmount				sys_fsmount
  433	o32	fspick				sys_fspick
  434	o32	pidfd_open			sys_pidfd_open
 -# 435 reserved for clone3
 +435	o32	clone3				__sys_clone3
+ 436	o32	watch_devices			sys_watch_devices

--Sig_/QGTZrhqjkaq1aJ2OlBHvkpX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2VRJ8ACgkQAVBC80lX
0GyhSwf/dOODCbXBNkjOdgrDs+LHCM2xGgAGjJ/5kFLF5eNycPLJRngo7qfKPAHS
PACA+3wy4Px52CKqFaG3ImoWCT9yRUh1NkxU5frD8SmDj4mIfXE69E3JTBOYbJFt
ALahodmh24KrlfUMdT9aN6gbh0kSDNV9/fsZENdtwW7sO7mLSUfn7SAzn+zEVyOn
SRZ8eIodjgTKvoO1saW4WWZfD5kty88G+Gc/8oetLhNqv1E19eboCrBPv1TkDBVh
oOOyvE0JTTH/q0I4BeihecjtqncACNK+jRPU0bJ4LH05GaSUBNxTFQsKP4kOF0u1
Awh2HXk56nmA5dMzlJW+9gq7b8HioQ==
=a2qp
-----END PGP SIGNATURE-----

--Sig_/QGTZrhqjkaq1aJ2OlBHvkpX--
