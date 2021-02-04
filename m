Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE86830FDD0
	for <lists+linux-next@lfdr.de>; Thu,  4 Feb 2021 21:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237398AbhBDUO1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Feb 2021 15:14:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238757AbhBDUOE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Feb 2021 15:14:04 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECCCC06178B;
        Thu,  4 Feb 2021 12:13:20 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWqVj15Dgz9sWd;
        Fri,  5 Feb 2021 07:13:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1612469597;
        bh=h07sYeplS3f3x2hUDW4Pxy6UKXS9aLvMfHBp7r4v65g=;
        h=Date:From:To:Cc:Subject:From;
        b=VK80ZRmg7r7F71IlUSgi4cjEdwjdKVciA2l/DVvx6bB/BNMG14AkLiTbItJvnSyeH
         UcdQinIs0xhZPS1T1KknEMI31bAgogAb8MG46cxIRTpk/7+d35mhuzSzgA5iTuahYh
         6j8DFuXnQyR4z2odbkwXzR2w//DYmPfRgJhkfbdSvAQISQcVUVfxZm+dSbWKu90LXG
         xU85PxjqL/GVkSOyB5aMYN3GzjtwsBemlNmMGL1hrWtzbpwEtOVfmEYwuxL55MTX3w
         duwU8cJOQZDPlltjltie2U0N1p2VBpIqptJ2QArK97FG72mU1pPVuiY0gMXsuqT+EW
         rEsP8cRt+Hf5A==
Date:   Fri, 5 Feb 2021 07:13:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the block tree
Message-ID: <20210205071316.04bf9bcb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/a5L2sQ+iLHOX+Em9kUqPaKj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/a5L2sQ+iLHOX+Em9kUqPaKj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8a0c014cd205 ("floppy: reintroduce O_NDELAY fix")

Fixes tag

  Fixes: 09954bad4 ("floppy: refactor open() flags handling")

has these problem(s):

  - SHA1 should be at least 12 digits long

Fixes tag

  Fixes: f2791e7ead ("Revert "floppy: refactor open() flags handling"")

has these problem(s):

  - SHA1 should be at least 12 digits long

These can be fixed for future commits by setting core.abbrev to 12
(or more) or (for git v2.11 or later) just making sure it is not set
(or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/a5L2sQ+iLHOX+Em9kUqPaKj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAcVVwACgkQAVBC80lX
0GxjYQgAm7qWW1I7aBH+4jKvaAT3j5TFtb/7nC43omjQ6ovpiP8UG+jyItI/vPYV
9AqR0l53OQcr5Ne6aW9WFhmmK2guYXpDNFYuS9aiTwQ1rlQngyKy6dAc5FpdEkR9
5WocJHGrO48m3QPbWhH0d6+NxDFQ5WenqOBqigX2H2voi88iHtiBK/eHo7cUgW3e
l2FaIHYaUrsNWMtvujAj3iYwPBmB2ezokb01C3fZVlsiO3F+e6psu7+H6eMw3iYC
6UCo3JAqmNXghOksDOOmxLGG/4TILl0vxfIhcAXleEjARoLPKSaNs9u2k74mwPZY
5ZMzPYeJhV58zGPSpJYfTfOF9YI/sQ==
=W8Tv
-----END PGP SIGNATURE-----

--Sig_/a5L2sQ+iLHOX+Em9kUqPaKj--
