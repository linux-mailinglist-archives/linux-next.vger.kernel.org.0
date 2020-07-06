Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BADD3215206
	for <lists+linux-next@lfdr.de>; Mon,  6 Jul 2020 07:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbgGFFGR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jul 2020 01:06:17 -0400
Received: from ozlabs.org ([203.11.71.1]:37569 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726879AbgGFFGR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jul 2020 01:06:17 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B0YSQ4LJzz9sSd;
        Mon,  6 Jul 2020 15:06:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594011975;
        bh=+P6CzuzagNLqnv7bkCxZZnaYcN+J8CZvRoDRy8miNUA=;
        h=Date:From:To:Cc:Subject:From;
        b=lNHFZmTqt1OopzeyNrlOzxRqrrWxt9cv0fStzB2ZN0fAbs6lI6aYULZz5IuTirO9/
         NtFy8iDFnNX4w+lPSbD6qNwDM+QtiHr1GTZeqe8tvplpq6H3X+RFLRptj5slYD9aMo
         /6AG0dx4ElzjXO4567EdfbMbQhi8iE2IpdI6741GEM8okLvco3mflXpRdGUVwBBkEE
         11fxNiYc3GaXwxxtQFbUwL9AFTHkvxs7XLbJDDXBsZRuxx+bvz00LR7M45q5XclZ1w
         C3JTmnjudZD0OTEArxbiM+1vGMzLylqA+8YMuM2uAcbVqNLo0g5HGes6APeXie4L6P
         vKqblhOu+CNUw==
Date:   Mon, 6 Jul 2020 15:06:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Christian Brauner <christian@brauner.io>,
        Guo Ren <ren_guo@c-sky.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tobias Klauser <tklauser@distanz.ch>
Subject: linux-next: manual merge of the pidfd tree with the csky tree
Message-ID: <20200706150613.738d3c7c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yQJgGAujdHmtY33QuZaSUCH";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yQJgGAujdHmtY33QuZaSUCH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pidfd tree got a conflict in:

  arch/csky/kernel/process.c

between commit:

  29adb883aa77 ("csky: remove unusued thread_saved_pc and *_segments functi=
ons/macros")

from the csky tree and commit:

  714acdbd1c94 ("arch: rename copy_thread_tls() back to copy_thread()")

from the pidfd tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/csky/kernel/process.c
index 3da63cf0bfde,28cfeaaf902a..000000000000
--- a/arch/csky/kernel/process.c
+++ b/arch/csky/kernel/process.c
@@@ -30,7 -30,17 +30,7 @@@ asmlinkage void ret_from_kernel_thread(
   */
  void flush_thread(void){}
 =20
- int copy_thread_tls(unsigned long clone_flags,
 -/*
 - * Return saved PC from a blocked thread
 - */
 -unsigned long thread_saved_pc(struct task_struct *tsk)
 -{
 -	struct switch_stack *sw =3D (struct switch_stack *)tsk->thread.sp;
 -
 -	return sw->r15;
 -}
 -
+ int copy_thread(unsigned long clone_flags,
  		unsigned long usp,
  		unsigned long kthread_arg,
  		struct task_struct *p,

--Sig_/yQJgGAujdHmtY33QuZaSUCH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8CsUUACgkQAVBC80lX
0GxOaAf/XoXZSfFBUeg59SzT1cshCipuYfdhFSdRXa8/VwKc1gTT1gXyvA9/Rj+D
xFC+Zo5n0QamAHvDOQirTefZVE0OPvajBHw2vT/BIuQXFXqSOGsH80PAFdqZLCAH
7NaIEToal8TJS1PtBBWMoUWeiAnm7qRrUZL0xdF+ZDE/X9htd9uwYojKgwnt/ofW
Ftofd54/Uzt+vWmF92miTZkeSRgmeZWUJzCatXQ1rSTX6zqgEpeOEmvlE2k5ftyR
GbpA6XApn/7P6vv2rnkzsMrvPexZIIuqBMcdCamaj3H9WiigMlOFRVNbjJ6v+DBp
DUkXj+/t/S3ull6Nz/Guw9vhTKj8Qg==
=05yj
-----END PGP SIGNATURE-----

--Sig_/yQJgGAujdHmtY33QuZaSUCH--
