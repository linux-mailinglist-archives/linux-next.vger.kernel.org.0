Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71EDBDF6F6
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 22:44:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729388AbfJUUob (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 16:44:31 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38733 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbfJUUob (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 16:44:31 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46xpXW6rdNz9s7T;
        Tue, 22 Oct 2019 07:44:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1571690668;
        bh=qm1P8LTT4eYbr7BVmaZo/OSaknC3h1Ftk2rAkJEMlTg=;
        h=Date:From:To:Cc:Subject:From;
        b=YLCH7qZog4PnQGz/8JuCawOUVSd2c/GaT6xj+bO6Lk9oQdakQ7cosuuPEMYvocaJt
         I6h4OdxltOF3sbAVuP+yTzlV0zzCmrAkrleplHwf6huJi1dtPdcrDjKNfIwdRXWN5w
         2fGqrEqSCFmqwgtJOkRk0TktLKfmTdcpgA40SbI1nEDEjWNm6FjFhiC3zU/Un/f16V
         Lv+dKHDY0G6dpba6FZSfhC27HGStDHyh3xldssezZvbx5kZQlai/ImiHZqh6BxVV1O
         QschLpk/JqVXpTSzY5oLCvuL64d+oe7x5qjOQzL/C/Fs0B+waNa4evFJGSdA769ZeQ
         OVK6kavS2pz6w==
Date:   Tue, 22 Oct 2019 07:44:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Al Viro <viro@ZenIV.linux.org.uk>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guillem Jover <guillem@hadrons.org>
Subject: linux-next: Fixes tag needs some work in the vfs-fixes tree
Message-ID: <20191022074426.2c0a2485@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/L+cRic7rAwxHAquDYAWFSSz";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/L+cRic7rAwxHAquDYAWFSSz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  de80166a573d ("aio: Fix io_pgetevents() struct __compat_aio_sigset layout=
")

Fixes tag

  Fixes: 7a074e96 ("aio: implement io_pgetevents")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/L+cRic7rAwxHAquDYAWFSSz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl2uGKoACgkQAVBC80lX
0GzFDwf+I666QXxb/lRXidXT6rctJN1rV3ZBH8q8dVH1EhfKlkBSLsroQaCFQjyb
FCOoD0BOAN9qfQJ4OZISTaleJ02Tkh25SxiZ7FhC9ZUIkx56rC1OVWl2w5oQxkd5
QOfEI6hgCka/XTHBLfCTkeNZ1Dztj4CcQS/SxBHQj/4nstPcCZOscR2o74zWVKRK
/u/SegXmjKwPcxF/zDaNa0WAycQ9OHits1JV7h9hX/r28KLol0OzZh3MHPUtuX9s
hVuks31Hp1TD/kmwrCUpi0bBblTi17vw4crfaPX8gu1dGFS8N7lMaFsS9Fj5K43X
TdiqVaJ/5nVSRR/PA48YXIPqkxhMYw==
=AG7V
-----END PGP SIGNATURE-----

--Sig_/L+cRic7rAwxHAquDYAWFSSz--
