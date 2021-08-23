Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2A1D3F4281
	for <lists+linux-next@lfdr.de>; Mon, 23 Aug 2021 02:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234004AbhHWAUZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Aug 2021 20:20:25 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39841 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233168AbhHWAUZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 22 Aug 2021 20:20:25 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GtCYB02lYz9sPf;
        Mon, 23 Aug 2021 10:19:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629677982;
        bh=Znd04vRQhYwSBPri6CGqyHLt6wX44eDiWVuNCfUz8AI=;
        h=Date:From:To:Cc:Subject:From;
        b=A4L4wDGV5n5P37Bk4VE+Nc4pHt90+yXcTsO+D6lOWuF4iQhz5OqmiQmaYFJdKpqAj
         sOKz1iiKdaNOpM6G4bjjQaKjyFboseJooraj1MvyzFQou6FI2VC/BoL2QXvQl82spa
         +bjSMFDPLVUxZIiRZHdwSyje2f30KCnjyQG0dC+clVPfD1kHKpphn4Qfx9ia6xDrWO
         JEhtipgJJlYxjWhNsGsgAFANDTETRnCzvvbeAsFrhWsxx7ka6+ko5CuMarB/jV/4iS
         uiDtf7rbEl2ECyawbUy/5gsTAtACShs21HxwdXQSQ0GGN9EjzfO7IPxNY7Okm3dDVs
         uxGlkNpv9kDZw==
Date:   Mon, 23 Aug 2021 10:19:41 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jeff Layton <jlayton@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the file-locks tree
Message-ID: <20210823101941.20ba89c3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mp5L+Cc7nwMA.7lRipq.Sf4";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/mp5L+Cc7nwMA.7lRipq.Sf4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the file-locks tree, today's linux-next build (powerpc
ppc64_defconfig) produced this warning:

fs/remap_range.c: In function 'remap_verify_area':
fs/remap_range.c:102:16: warning: unused variable 'inode' [-Wunused-variabl=
e]
  102 |  struct inode *inode =3D file_inode(file);
      |                ^~~~~

Also from the arm multi_v7_defconfig build:

fs/locks.c: In function 'fcntl_setlk64':
fs/locks.c:2509:16: warning: unused variable 'inode' [-Wunused-variable]
 2509 |  struct inode *inode =3D locks_inode(filp);
      |                ^~~~~

And from the x86_64 allmodconfig build:

fs/9p/vfs_file.c: In function 'v9fs_file_lock_dotl':
fs/9p/vfs_file.c:322:1: warning: label 'out_err' defined but not used [-Wun=
used-label]
  322 | out_err:
      | ^~~~~~~

Introduced by commit

  3efee0567b4a ("fs: remove mandatory file locking support")

--=20
Cheers,
Stephen Rothwell

--Sig_/mp5L+Cc7nwMA.7lRipq.Sf4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEi6Z0ACgkQAVBC80lX
0GyrQgf/auGTfsi/pkhfdsLN9T2FWqHaCNL+gv9mNo86ihUiVZp1x+z0v/f7WM9b
td/zEHIAn+4RoeS0ZHOWdmD6TOBpAxku9w5hqYOPY89m2uG8nNG8nld7PfO/EQD4
djerQ/NJJZsR+qfqazqiMojgsYD4srAGBHjzL12jJxF5DH5zlchZ9cblLzqdWKFn
rEPrzqWa0CjVypbFsEbVZFPng2tb/X4bLPen/7kGs+/A4AeCJkCO+o2s2tuObUWS
Xfwwz6gEJFVGVmR03XXHXL/BXKgq5WQOzNe1yIFnqvYMJM23dnVLy4WyFN3ce7Tz
HbWqMHm3R8vaTPA9Xdsi2BryUYqj7Q==
=ESJ9
-----END PGP SIGNATURE-----

--Sig_/mp5L+Cc7nwMA.7lRipq.Sf4--
