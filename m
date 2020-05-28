Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303041E577E
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 08:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgE1GWV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 02:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgE1GWV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 02:22:21 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EB63C05BD1E;
        Wed, 27 May 2020 23:22:21 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49Xd092Gn7z9sSF;
        Thu, 28 May 2020 16:22:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1590646937;
        bh=629MSPhHF+Qav3O/mRS1kD6JZN5Cr2BemX3ADrv1Wrk=;
        h=Date:From:To:Cc:Subject:From;
        b=MfsFqGgjwa367mRMxGv/9D6E0dhWNGgRAVK/e4BaT45dtyo2+6vsh8M75DelHHGHM
         7cTWivWgd5DLxJyV1z2f6P/aw1s45XKgV34eqwdqoC++0p7+x+4ddt9YShS8U6w3nz
         7hUkeCHkjd0TV1hRSNp2AgernRPgjpEBaj2PShc3eBKFB36vZEV3IUx6bMX9FRwild
         iQMxf+O4vuJcduxqH0HPtv80zSOTsy/JWA+0qDnLY9Z4T6QyvQ7vgVV9IsZSTI607n
         NkYiBtFaUtm2I/qsG3l26pMoFNBRCVltdCJxGvaN9D2jL6ppVwQI+8O6WBWhdK6ORV
         tSN5xqsEOaGSA==
Date:   Thu, 28 May 2020 16:22:15 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Felipe Balbi <balbi@kernel.org>
Subject: linux-next: manual merge of the usb tree with the devicetree tree
Message-ID: <20200528162215.3a9aa663@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/3vZuWlHWNFvmOkWX=eeyRBv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/3vZuWlHWNFvmOkWX=eeyRBv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  Documentation/devicetree/bindings/usb/qcom,dwc3.yaml

between commit:

  3828026c9ec8 ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")

from the devicetree tree and commits:

  cd4b54e2ae1f ("dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings")

from the usb tree.

I fixed it up (I guessed, taking most changes from the former) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/3vZuWlHWNFvmOkWX=eeyRBv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7PWJcACgkQAVBC80lX
0GwbGAf+LlyXFd1Cnvh8G7uCCS8QpF5UcrqklncoPKY4BOSMHyONLIT02THHgmQ3
IEvTFY4Sl/XBh2o2BEmQ7idZ9LZi7Oidr6RqKcEmxrTUrL0Kk/g8AMs7wZ6bZjTZ
CaMmNmEzwgTbSEnf35f+s882C0SHkc/iOcyba5l236tVQfS5qTlaoHSAOy7b8y0o
Ykw9yZF5kCS6V0dH/WAsu/DRTQhjj/fXpsUefBhMbOy2/JRRyXC+E/LAT+/sTg4p
Fy2flrWCTXHSXe/KezLXoQ5eYzd5uWCG/G1YXwD5/iv4D3O8yZOG42d7TbPLZ8QG
xfb2pWI7TxilRKAM/RFwlaU6IMT/0A==
=eqBq
-----END PGP SIGNATURE-----

--Sig_/3vZuWlHWNFvmOkWX=eeyRBv--
