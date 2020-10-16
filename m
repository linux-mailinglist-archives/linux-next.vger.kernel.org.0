Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10EB28FBE1
	for <lists+linux-next@lfdr.de>; Fri, 16 Oct 2020 02:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733088AbgJPAHD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Oct 2020 20:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733087AbgJPAHD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2020 20:07:03 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DBDC061755;
        Thu, 15 Oct 2020 17:07:02 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CC6034TD8z9sTm;
        Fri, 16 Oct 2020 11:06:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1602806820;
        bh=DKC0CaKt+DTeoFw9gdhClrkhzfUDPOAiZIMnJdeLA18=;
        h=Date:From:To:Cc:Subject:From;
        b=KAVy1Sq8HgEUnBFISqkg1pddP8C2FwADM5Ng7joSDEFxqhA3VX8q0ReYwlJj8/w0Z
         Vt9rQ2WYvaejxy96X4Kd28fIwzBYiBa6nZ083Fkvs2tW8R13GKfn+WOSL0cVSlq79z
         f3fyTKUof3zdlspY08vyeS+i47xZqypWmHtNf8Y9ZlKTth0MQ+y3+4uoLSZV3R1pWU
         fRllkiZu/VxgO4bvPS31z947JmDie7CTO90eCJnfRKwDy50aj8R4Tv+z4zfr6SWq9X
         WA3gYuJ7aaIJE0Pcp9F+cMeBs+x0u10AmTpW8pYf+Y3gpG5Np3oRawoYxNWUjQ576n
         KL9Ddxcd7rDHw==
Date:   Fri, 16 Oct 2020 11:06:58 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the djw-vfs tree with Linus' tree
Message-ID: <20201016110658.4ba11bd4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c0lhzCnhhJIPjkvxn82/uQ0";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/c0lhzCnhhJIPjkvxn82/uQ0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the djw-vfs tree got a conflict in:

  fs/Makefile

between commit:

  5287b07f6d7c ("fs/kernel_read_file: Split into separate source file")

from Linus' tree and commit:

  02e83f46ebfa ("vfs: move generic_remap_checks out of mm")

from the djw-vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/Makefile
index 7bb2a05fda1f,7173350739c5..000000000000
--- a/fs/Makefile
+++ b/fs/Makefile
@@@ -14,7 -14,7 +14,7 @@@ obj-y :=3D	open.o read_write.o file_table
  		pnode.o splice.o sync.o utimes.o d_path.o \
  		stack.o fs_struct.o statfs.o fs_pin.o nsfs.o \
  		fs_types.o fs_context.o fs_parser.o fsopen.o init.o \
- 		kernel_read_file.o
 -		remap_range.o
++		kernel_read_file.o remap_range.o
 =20
  ifeq ($(CONFIG_BLOCK),y)
  obj-y +=3D	buffer.o block_dev.o direct-io.o mpage.o

--Sig_/c0lhzCnhhJIPjkvxn82/uQ0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+I5CIACgkQAVBC80lX
0GySZQf/f8AWMX+LbDTXW1yEjJ6Vp4YN/7csUDuoVBr7mVqOuPoEgFTlnwu3kHeS
5xp7D3YEu+njzkun7msYk9iFmNNeoxJju0bFdZy2rzK5Kuud7HHF4dj0SmN4v2a5
mKrQqUp3ltNGBtcxbBFnZOOHthbISmGbPPy9jkAbw6azc5L5YE76wWjwrs+QQKDW
NFSK4Fu+PQFTNo4qoQZHcMK0AUBYc9SFG4MW/lKhdpDKujXmZZUWnbzfxMsrD5OL
MZd7rAr8OeoLO5m0EicwoQMYNnt4I0kF1jXVhB+iBHPUOcid9UImLVAnrSeUK0mc
Mc9lgBf4DE5T3AqjxrD4QxpsJHHIEA==
=b+ge
-----END PGP SIGNATURE-----

--Sig_/c0lhzCnhhJIPjkvxn82/uQ0--
