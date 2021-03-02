Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E24832BB3E
	for <lists+linux-next@lfdr.de>; Wed,  3 Mar 2021 22:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbhCCMQM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Mar 2021 07:16:12 -0500
Received: from ozlabs.org ([203.11.71.1]:33047 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2360115AbhCBWQx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 2 Mar 2021 17:16:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Dqs0S6xD1z9s1l;
        Wed,  3 Mar 2021 09:16:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1614723369;
        bh=DLwY04KQNuKixfB4C2qdGmuKOut3w4BgkLldlQFT1Ts=;
        h=Date:From:To:Cc:Subject:From;
        b=u85wYIvplOxasrnGCv64R54Rbkl+ZQpfGDv2KhlmGfRmmitqDJPEgdsQsKmD09toW
         rADtu4svUozDNQiz9pUwHlhnPFvJknLgYHxSCK6BGcZY4erPIGANvv1Dp6lSgbod4h
         bDC+2hD0yol3Jb91gX2P2LaoAhdDY9/sblgotTRnLpqbj7d5Bt6jVtHMyZ6FuoyZXO
         KwOlIXDXIkEKHE8eZJ1s23IaFlRYLhz3gQTg8nTrfzsPUz5AhSt/ARbo0DB7Q5sSbg
         oq1+gA6ZF082rns6t3Uo+s9nazr4kLmlgE2d2FG4cFd8c/HRWjSriegqsKVEhbMyMl
         ZzeykNRrKwguA==
Date:   Wed, 3 Mar 2021 09:16:08 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     David Howells <dhowells@redhat.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the fscache tree
Message-ID: <20210303091608.0ad071f8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/owRQP_WNWgrPBh+kVDpGDmy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/owRQP_WNWgrPBh+kVDpGDmy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the fscache tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

fs/afs/file.c: In function 'afs_req_issue_op':
fs/afs/file.c:291:6: warning: unused variable 'ret' [-Wunused-variable]
  291 |  int ret;
      |      ^~~

Introduced by commit

  799fbdf96cd5 ("afs: Use new fscache read helper API")

--=20
Cheers,
Stephen Rothwell

--Sig_/owRQP_WNWgrPBh+kVDpGDmy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmA+uSgACgkQAVBC80lX
0GxzGggAoRROLnbtS6yY62TANWZkFSuzvJsc+sxKo1c5GdAUDXrEIgiDjm6hsyJL
yrWGqs68o8snPc8XIFlvWdWmHA63u4LATLc6Ir7saS76pmgb3qF2p2bT4z8I4gDP
G3oo3eQM8/gGneU5KRm1k03XLsSdnxTuzZ3jNuW6rLBVrlumHgrsupChUWktVlB9
UOIPI9CYIMTFGNap2g2KsL3jGKre1GegnwsEhxWjbfmPeHzfqCgptbh4ZHWUbnE6
KbPFllluVh/nR+SMmu+ICH1+R6tc2vsAo3cpQ0aPzI90luVScUIFejawwpXW8+rX
7bX0GdxlouRuFrOlOVBzOD1VGdC6qw==
=XpKR
-----END PGP SIGNATURE-----

--Sig_/owRQP_WNWgrPBh+kVDpGDmy--
