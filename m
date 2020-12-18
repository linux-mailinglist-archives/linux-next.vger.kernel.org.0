Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1E4B2DDE41
	for <lists+linux-next@lfdr.de>; Fri, 18 Dec 2020 06:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgLRF6V (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 18 Dec 2020 00:58:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgLRF6V (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 18 Dec 2020 00:58:21 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF6CC0617A7;
        Thu, 17 Dec 2020 21:57:40 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CxynZ4J1kz9sWQ;
        Fri, 18 Dec 2020 16:57:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1608271058;
        bh=498ODTwHQKUhl5bzlWX6RgY+YdPsO2G85JyYlZMSVes=;
        h=Date:From:To:Cc:Subject:From;
        b=a0SjO8lktncDn5/CCsunBf4f/hKZ0/TytMW5F4b4emej1qUxtmejFD15f2qA0eDHx
         ZL281ZOQQ1j/qqtXfWNuAKjVVzRSIRLN/3NF7pKyAP2O5I+vcAByPsXokgFV1KXP9L
         ilkm+UcaU4yqnHx3g7ykW8KPG201FronKdaU6RX71ZzD0tldBgdOXargepUVP8xwdC
         p+7ErbCBwMxxv2ZaHUEWb7KsicrOLRJZKHDWsD4XRlFtemnhQKj3ja0DZnETa5bQts
         kPGA25fbOppcDrd2taIqT6DWw3ws7SWxtwp4TIhhNBzApGcubTFe5/DlfgOrPov0Yo
         0anh9L2TsARRQ==
Date:   Fri, 18 Dec 2020 16:57:37 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Steve French <smfrench@gmail.com>,
        CIFS <linux-cifs@vger.kernel.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the cifs tree
Message-ID: <20201218165737.0759162a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IV.rauSjuWok3/xVAc74t3I";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IV.rauSjuWok3/xVAc74t3I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  ee04fe87f4d0 ("cifs: Re-indent cifs_swn_reconnect()")
  2c6dd2f9742d ("cifs: Unlock on errors in cifs_swn_reconnect()")
  fb2356b3739b ("cifs: Delete a stray unlock in cifs_swn_reconnect()")

are missing a Signed-off-by from their author.

This is the problem with the mailing list again :-(  The
author has been recorded as

"Dan Carpenter via samba-technical <samba-technical@lists.samba.org>"

--=20
Cheers,
Stephen Rothwell

--Sig_/IV.rauSjuWok3/xVAc74t3I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/cRNEACgkQAVBC80lX
0Gz1yQgAg/ALVBix3UPfsjgKJxdAt+t9550IHEMW2fJcT3RrkZluj+VURJQvVEON
EM4mLd5OSmTQBLqKfwynYGtZ1i3jy/cJBjYs+NnnGKbMYI7w4jJx00BDhYApelCc
+Po8O2k2CTAcPJ1HqwlXAXMZIvOUCuEpJqDsYApLwJnSGLVUmg2OFd6Au9YOg4hf
4/poaTF47WtkaZsvpIGMZcrC5pnvs/bXbKJiNoWF4xwRl6ZKMTGhFJnBLILrt9a8
xyKygCeMGkSCAFox8WdhMh+bwhKEJszcJGGs+wm/HLkfeiy251vdxBJtgER7OP/7
DXp4SACbs1ImQBYJfApbSs4USwGmTg==
=sAxD
-----END PGP SIGNATURE-----

--Sig_/IV.rauSjuWok3/xVAc74t3I--
