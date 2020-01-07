Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E07CB131DEB
	for <lists+linux-next@lfdr.de>; Tue,  7 Jan 2020 04:24:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgAGDYU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Jan 2020 22:24:20 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:55261 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727377AbgAGDYT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 6 Jan 2020 22:24:19 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47sHmJ6g0Fz9sR1;
        Tue,  7 Jan 2020 14:24:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1578367457;
        bh=poCI2cN3Flh3Fw5GP2FaHzixm2h9ceYsCEGfZCUUo1o=;
        h=Date:From:To:Cc:Subject:From;
        b=hbqhD5F2l/dTcZbyO35wu+/vfZ6aXrt60JUgUp9prjedf9qEU/qPD9NjcJkyYLg7S
         mxZeJWwCSrTDsQ28+YKhVU/+3+amPSWO+c/OfCy7wH+BOnQ5h0gV2VwxmH7+Mlhqev
         p7AB0SkiF8XRl58ACXjw/I5fC4wZbaYHxOIqP25rOy2IHk01tzeI/OVU7NJdxsBAHs
         SI2G76g7BpxVH5iYBDf9dbctOrRiSs3qPHiQ9GKzKrdUBBsg18mW396zlyZIA1dAFM
         e2CqLRCot7JNmwNzKVF694kUMyG003RzfdhSu6ynnilTJ2Gk+09YQnA+NYveABi4Po
         e0ZnWb+Fuh4Vw==
Date:   Tue, 7 Jan 2020 14:24:15 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Kishon Vijay Abraham I <kishon@ti.com>, Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: linux-next: manual merge of the phy-next tree with the usb tree
Message-ID: <20200107142415.4a35fcdb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EodVVjPqEcOteuKkAFTMeTy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/EodVVjPqEcOteuKkAFTMeTy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the phy-next tree got a conflict in:

  drivers/phy/mediatek/Kconfig

between commit:

  203b7ee14d3a ("phy: Enable compile testing for some of drivers")

from the usb tree and commits:

  6ee054e3a2e9 ("phy: mediatek: Fix Kconfig indentation")
  1544133d48c3 ("phy: Enable compile testing for some of drivers")

from the phy-next tree.

I fixed it up (I just used the latter version of the file) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.



--=20
Cheers,
Stephen Rothwell

--Sig_/EodVVjPqEcOteuKkAFTMeTy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4T+d8ACgkQAVBC80lX
0GxBXgf+P+PBi8yS21wNVwquW4Pf2fGLdcQ7qic4NdGwaz0JPHu8O5GdPDCThP4u
xpWC8Y+nwiOJ0j2uv79p21OIXnIQS09mGPauh9OdjFP0/3PVYqRGqqRYVk9CE3Zh
LdxrR/XszKalvJCEkyoUFMUQBO6qc3GHX959K8750MbESLpK1yOEFTIgYS7GQjyF
u11fx1+CUQORotQ62EXlJXFkKBEIKrrw4zvQTe4iZXpJNE4xsZjKqamZjbLCsQar
REPT94SB/LV439TljEZLleW0omRJxYRIqUPD2OBQSDSez/Hm7EZaMYVUU75AS/bz
P0JnxUsjQhChb2lWzzH7ljwEa8AdUw==
=aMWr
-----END PGP SIGNATURE-----

--Sig_/EodVVjPqEcOteuKkAFTMeTy--
