Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1626621CECB
	for <lists+linux-next@lfdr.de>; Mon, 13 Jul 2020 07:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgGMFYt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Jul 2020 01:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgGMFYs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 13 Jul 2020 01:24:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD59C061794;
        Sun, 12 Jul 2020 22:24:48 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B4sXX4fR0z9sDX;
        Mon, 13 Jul 2020 15:24:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594617886;
        bh=JLMrLsEFZFAdmvA4txh24SkbKNk+Xj+qzEtYAUIFtUc=;
        h=Date:From:To:Cc:Subject:From;
        b=sA0I0YtvSMhmE8SOA7Yh2tCmHmV4g4KpBfqo4rblBVRgNADwvjgCHP4yNibGpBJH+
         yXOuOqS97P1naQUy56kJvulZOkUG6cpW/AjLsDNDvX4Jvs11IeXRkQWpFVuM2s/XER
         yNloHjnb9TvY/7bQRxc3BYduxEj2ZTzhpOPLqnrM7Wq2A+j+x2T34TpE+sPIiJNIhG
         jZbxB2pvqtgO906fwdydFYcGtwr0yRCuotMa2BlrnNXM72VgrMO+JMF2Xw+cYXLCkG
         CuXrrSxENfm2VBfaV59d6i3I6XrBiSyU+kqdFOAG+S4X/Ksu7iS6V/IXrIW+Ltm6ve
         RF2Wd+qm2kb3Q==
Date:   Mon, 13 Jul 2020 15:24:43 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jiri Slaby <jslaby@suse.cz>
Subject: linux-next: manual merge of the tty tree with the drm-misc tree
Message-ID: <20200713152443.12a5449a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/haWNAIYhOEWfM4Dw6SlggMf";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/haWNAIYhOEWfM4Dw6SlggMf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/video/fbdev/core/fbcon.c

between commit:

  fcf918b96662 ("fbcon: Use array3_size() helper in scr_memcpyw()")

from the drm-misc tree and commit:

  28bc24fc46f9 ("vc: separate state")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/video/fbdev/core/fbcon.c
index af9f5ab96f74,86fe41b1deb8..000000000000
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@@ -676,8 -676,8 +676,8 @@@ static void fbcon_prepare_logo(struct v
  		q =3D (unsigned short *) (vc->vc_origin +
  					vc->vc_size_row *
  					rows);
 -		scr_memcpyw(q, save, logo_lines * new_cols * 2);
 +		scr_memcpyw(q, save, array3_size(logo_lines, new_cols, 2));
- 		vc->vc_y +=3D logo_lines;
+ 		vc->state.y +=3D logo_lines;
  		vc->vc_pos +=3D logo_lines * vc->vc_size_row;
  		kfree(save);
  	}

--Sig_/haWNAIYhOEWfM4Dw6SlggMf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8L8BsACgkQAVBC80lX
0GzyDQgAhscNOpxmGNkv4WeNqnKFiLiF64IREaN7Eq/NRR/Pc7wLupLwkb/WUpID
yxY1NvgGr16W/J5ovPJEN1PnbOTtm/R0WoVp51tYHWD9BFwowrhtxLyX+ukRlSCN
NE8yC+wH7BzLQJR8uPdonWKdg4kVKf7Yc7cGtYPajJvCHy/Zru+Z7Bi6djmQTx+M
/G7/+MlVr3945SyWh3LTv+0/koHi4QflMMnSENQrG4n672S1Pk02NuMI2SmYEVTZ
O56BcypkSGXuSz+Pl7c4ZPsMusponpNNdVa1EXGL1wHO4EMvKhKR/T9D4OkrUYwS
5VL9bF24IDfGLEmWpM6pL3DLbISRkg==
=B9WA
-----END PGP SIGNATURE-----

--Sig_/haWNAIYhOEWfM4Dw6SlggMf--
