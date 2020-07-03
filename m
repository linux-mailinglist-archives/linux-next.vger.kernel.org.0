Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267672132E8
	for <lists+linux-next@lfdr.de>; Fri,  3 Jul 2020 06:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgGCEf5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 3 Jul 2020 00:35:57 -0400
Received: from ozlabs.org ([203.11.71.1]:51967 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725648AbgGCEf5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 3 Jul 2020 00:35:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49yhwm58Pbz9sRW;
        Fri,  3 Jul 2020 14:35:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593750955;
        bh=ibd9L0XmOt6IaGjV+2/7iZmdiFZ8mtSY4WOPsHdRM6I=;
        h=Date:From:To:Cc:Subject:From;
        b=fya6Za8IdB3lWxub0l97ECbk9jRSGHbfFG4sjhpSrzd0MJdpDV6bSAzzStfTJe8pX
         Jp8iAsJ9plYll4F+edK5tlW1bkbtDDZOcqEuoNN0zmbhCWfePj81W8dopT9ydEus+K
         +edwz/b0c07P8RAKiY7LHmswrje5vO5Gd7cFsj3njsWaow3Dc8lxlN46BBqc4HVeLx
         whQclSGnt7G/XD8Bqu2cNb3iUCbBTvcqqAQ9HKJco0OzZkB8xcZzBEIxIcNW3vR+A+
         EhHTZ+1izNeS9BykhUG9Fvecqi1NJnL5qQBAacfY0fngVZ7wceRIqHzSNct6GcejAP
         iC1Jb1fm21YPA==
Date:   Fri, 3 Jul 2020 14:35:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kees Cook <keescook@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Suraj Upadhyay <usuraj35@gmail.com>
Subject: linux-next: manual merge of the kspp tree with the drm-misc tree
Message-ID: <20200703143550.7ebbe771@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6ALruJwvnfOPNuGd51_frTa";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6ALruJwvnfOPNuGd51_frTa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kspp tree got a conflict in:

  drivers/gpu/drm/drm_edid.c

between commit:

  948de84233d3 ("drm : Insert blank lines after declarations.")

from the drm-misc tree and commit:

  80b89ab785a4 ("treewide: Remove uninitialized_var() usage")

from the kspp tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/drm_edid.c
index 252e89cb54a3,b98fa573e706..000000000000
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@@ -3095,8 -3051,7 +3095,8 @@@ static int drm_cvt_modes(struct drm_con
  	const u8 empty[3] =3D { 0, 0, 0 };
 =20
  	for (i =3D 0; i < 4; i++) {
- 		int uninitialized_var(width), height;
+ 		int width, height;
 +
  		cvt =3D &(timing->data.other_data.data.cvt[i]);
 =20
  		if (!memcmp(cvt->code, empty, 3))

--Sig_/6ALruJwvnfOPNuGd51_frTa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7+taYACgkQAVBC80lX
0GwruQf+PtOhCwWIbZGmf6YtZW+vnwSeuRFthaEpVcnZOwasGQQQlsxvRU15ar3z
zRboi1nYhdk95Z5p+W9I72pP28nRumPdkWqJu1Q8yN6a9UMOTqanhm70yOWfC+1y
RyMBaJ8u4BY9eHZeUmevxPEixTSP/zNihJc0Zn3AlZnLcYJQgH4rXWwRM5yput7f
za2cb/yjfAz1H+JP/MYt6uMhRhdSOr0M3mFoxuxkVNACMlp15CogmVddi8O+aT5e
Qmk6W399iJBVMWJRhZqvSYmcbFHsFaW5rTIYQUdJDM/H1Tu49ZgSziPgmbNou4+y
FWeOJR5+J3wPO+YqE+hPyyHqta4iUQ==
=8iun
-----END PGP SIGNATURE-----

--Sig_/6ALruJwvnfOPNuGd51_frTa--
