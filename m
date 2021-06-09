Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694BD3A0864
	for <lists+linux-next@lfdr.de>; Wed,  9 Jun 2021 02:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbhFIA2J (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Jun 2021 20:28:09 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:46613 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234990AbhFIA2F (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Jun 2021 20:28:05 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G07FG1nZcz9sW7;
        Wed,  9 Jun 2021 10:26:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623198371;
        bh=pl3AOWhvROigPTYFQ/g6KGGpHM5/xYck96wanPzXANM=;
        h=Date:From:To:Cc:Subject:From;
        b=qFBV7k6B4P1S5QOQP7XDiVfjhAvZ11Q04YpAmY9m3AepPQwqr+pja+YarkuXO0aXp
         55yneG3h5ubLBKzsv4fjkw67YSJy+joH1G5QieTUDvTi1nYPoDgOAguifQJyTJ04Hk
         og5PxZ8hQbH2t/peaRZiqWtwsmCIhU2HAdRXZZ8Qn1LzICW5zLBcguXdMYdwmLp/CP
         tP0g17K/c9HI3MOh+c/9be4AoQLolCYkAsEV44I39Ct1dRlhHSq4DQgGtYjmwc8TzE
         qyKsVj7jzkjdjN3Nwyh3UJwfofXwhsGEnBp6m6EIJCqgthYe++jRLCTMrdC3FcodYw
         h7T8iNF4lAmHQ==
Date:   Wed, 9 Jun 2021 10:26:08 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc:     Jisheng Zhang <jszhang@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        Vitaly Wool <vitaly.wool@konsulko.com>
Subject: linux-next: manual merge of the risc-v tree with the risc-v-fixes
 tree
Message-ID: <20210609102608.5582071b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/98tfuBKAYllB/MvOUzwnlvO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/98tfuBKAYllB/MvOUzwnlvO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the risc-v tree got a conflict in:

  arch/riscv/mm/init.c

between commit:

  8700a6b6fee2 ("riscv: fix typo in init.c")

from the risc-v-fixes tree and commit:

  010623568222 ("riscv: mm: init: Consolidate vars, functions")

from the risc-v tree.

Note that 8700a6b6fee2 supposedly fixes 010623568222, but 010623568222
is not an ancestor of 8700a6b6fee2.

I fixed it up (I just used the version from 8700a6b6fee2) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/98tfuBKAYllB/MvOUzwnlvO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDACqAACgkQAVBC80lX
0GwN1Af+OFsLhLCug6E2yjqN93UeaoQjN+GorRWE4ROdOkXqPoZBIgc2etpU+Yto
k+y4QdkCTcBi6VRXOBR1cKs/wiIsvewEpBpweqyBeH+0guogSCcE+sR71XTwHCw0
pOLFRszkYo5MTT/ReiTqKFIyQ2D7Fj0TkLg4hiL8QdJGdGKWGTmLY9Pa7RpwnKYv
4RGm77Lf4hXg0qmYaWOAN7+iG15sEVkIpJeGu89wJg5onqbhEST0RGadpleCFIEN
nACirCY6+y5HsTAfot/2xdhZNs5kNjW2kcnYaDPF88t4vhzCcgScpwe+dTL1Cq1p
j4uMI7VRNgKSeIqifIZLAdokLyt/fg==
=vt0t
-----END PGP SIGNATURE-----

--Sig_/98tfuBKAYllB/MvOUzwnlvO--
