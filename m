Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747BB1CF398
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 13:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgELLre (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 07:47:34 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:45305 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726187AbgELLre (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 12 May 2020 07:47:34 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Lwyq36ZFz9sRY;
        Tue, 12 May 2020 21:47:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1589284051;
        bh=Ih5FmVCFlhTL61oOSWHPmSDk2Zp5FnEExRA6NXjU/u0=;
        h=Date:From:To:Cc:Subject:From;
        b=lk0T19RfkireTXlYhPw82uKOpCerEeeZP2LtqqfbW6PmDZ2PDDlgOkpe3kiT8nRj/
         pYcsmOB1GXUWuD0z7qz+OBKK0ys5rRyV9jRZfeasxS9LV+v+MUQL9L6MHXRBiaEpjC
         ksq/MhvbuEzfkosD/y0RVWBAyNrhVKRQSYn0Uf9nO4BddKE6Gb7Ip0O1tnAvKPDX+W
         q0oq6ZpErjIozY574IAww567oaqS+HlngKdT38EBVX3UckWGJIrnIW2J2vB4sWML6Q
         q+OTxNDAxokTkV8JhQ0DbGnAH5apqHbbcm/rHItsaYRscWUthtI7rRWeORGypCUaoe
         ErFN3UY1VyUTg==
Date:   Tue, 12 May 2020 21:47:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Minchan Kim <minchan@kernel.org>
Subject: linux-next: manual merge of the akpm tree with the notificiations
 and fsinfo trees
Message-ID: <20200512214729.2c8a255a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/CzuV7zU0s1LhMXp=c8xq.DU";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/CzuV7zU0s1LhMXp=c8xq.DU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got conflicts in:

  include/uapi/asm-generic/unistd.h
  arch/xtensa/kernel/syscalls/syscall.tbl
  arch/x86/entry/syscalls/syscall_64.tbl
  arch/x86/entry/syscalls/syscall_32.tbl
  arch/sparc/kernel/syscalls/syscall.tbl
  arch/sh/kernel/syscalls/syscall.tbl
  arch/s390/kernel/syscalls/syscall.tbl
  arch/powerpc/kernel/syscalls/syscall.tbl
  arch/parisc/kernel/syscalls/syscall.tbl
  arch/mips/kernel/syscalls/syscall_n64.tbl
  arch/mips/kernel/syscalls/syscall_n32.tbl
  arch/microblaze/kernel/syscalls/syscall.tbl
  arch/m68k/kernel/syscalls/syscall.tbl
  arch/ia64/kernel/syscalls/syscall.tbl
  arch/arm64/include/asm/unistd32.h
  arch/arm64/include/asm/unistd.h
  arch/arm/tools/syscall.tbl
  arch/alpha/kernel/syscalls/syscall.tbl

between commits:

  42036137fa9b ("watch_queue: Implement mount topology and attribute change=
 notifications")
  9321bb26ce55 ("watch_queue: Add superblock notifications")
  51d01aee410b ("fsinfo: Add fsinfo() syscall to query filesystem informati=
on")

from the notifications and fsinfo trees and patch:

  "mm/madvise: introduce process_madvise() syscall: an external memory hint=
ing API"
(and a few followup patches)

from the akpm tree.

I fixed it up (see the tree) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/CzuV7zU0s1LhMXp=c8xq.DU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl66jNEACgkQAVBC80lX
0GxG8wf/RjsXNWMBkgYFkJtCjCAksvzqFXyKz3LoVx+3ce8fUnVr4em5iZPdQ2Ju
770w13dPxlY16W6WLEVxy95uWUdtZ3GEqUA+3rKU0q3hUrikmE30QV5SyHul5Zrd
qygg/G1I92L44Ak1/JFMgHZSpAg/fWzq5ggVqgKZWensFprt92MWIfCzZiaesn6w
UEFGwru7VhS6A9GT71QBL72HXlLIWOqDCu9Bq64HkAT6hz/Et8h+oTC6khS1PzgE
MpI7qGbm15mynPbXIrG918VlCMaHTRLDPC8rupKd/q7F27uwL8hHJnhCkZ+Fw06k
Ef2n56hyxg0rYMZFo0j36ajBmvUPew==
=3PjF
-----END PGP SIGNATURE-----

--Sig_/CzuV7zU0s1LhMXp=c8xq.DU--
