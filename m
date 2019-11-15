Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA154FD3C6
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 05:45:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfKOEpA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 23:45:00 -0500
Received: from ozlabs.org ([203.11.71.1]:48885 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726549AbfKOEo7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 Nov 2019 23:44:59 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 47Dm3s3Z3bz9sP6;
        Fri, 15 Nov 2019 15:44:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1573793097;
        bh=2IT7kQyS7HUi89J83sS/Y6EzE36k0O7rOWKgl9xBC/Y=;
        h=Date:From:To:Cc:Subject:From;
        b=UqVjFT6jZefTcgkWnqpQdeeiuapcBnA19gk9Isnfq9+9Na4PP/iutpqH7Jx3nWqEK
         Ty9FMmonrbDj8jfULZ20e/xqocg6QZzo3CeVZ/Kf8QyuSLD9Qug0+s+4D1srMSBicK
         sANM55jy9b8cqYkP5uAhRG5l4AHaC67PhoeP0uDfri5LxvXFQr3m7LkzI8GaxSt0Q5
         ZxsUuR+Oki3hfI3IhKbCfKS9/DfHJL1vhq2Ab1b3gCBQtoPRwVvrw5vIs0EqtibiXo
         zmtoi5q1crRQ5RPGBHbCq4PgWcf0JEzmozL/BImbfqh/M3TLjT9GPAPz4guLXGjsRW
         9wtPdCHq7Ko3w==
Date:   Fri, 15 Nov 2019 15:44:56 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Fabrice Gasnier <fabrice.gasnier@st.com>
Subject: linux-next: manual merge of the pwm tree with the devicetree tree
Message-ID: <20191115154456.244c27e4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RyIrEUa4PrOL3P+S8eK5+Yh";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/RyIrEUa4PrOL3P+S8eK5+Yh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the pwm tree got a conflict in:

  Documentation/devicetree/bindings/pwm/pwm-stm32.txt

between commit:

  56fb34d86e87 ("dt-bindings: mfd: Convert stm32 timers bindings to json-sc=
hema")

from the devicetree tree and commit:

  4205e356285e ("dt-bindings: pwm-stm32: Document pinctrl sleep state")

from the pwm tree.

I fixed it up (I just deleted the file - more fixup is probably required)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/RyIrEUa4PrOL3P+S8eK5+Yh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3OLUgACgkQAVBC80lX
0GzU2gf+PT9N1c5iWBlI7Fz+cTmIEOoRDiTnRPH+F6HNsJrHCA397ENwXZldksVq
+ocghgddSJILnIRUBhMygIDEbwAenf3avYHdWuXjhTm/8uJOwWULbZWx/uEQiUkA
gEkgX437WGv7OsmZMuk55S6bCCVW822ZT4EkNGawgwDRhwV5PD8mYkIkX2tk2O/E
a2qY54g0PztvfiFYV1rv1unvAHv44YVW5Pm1I6JCOCBs8+57vHSXEwjPBGIadOLk
TLuR5imLGueOtddv3eM1eldaSqQTF5M37GA1qc6TEjO9MWhrXGeu6nSCmbF/Vcm1
BP7QAQkFcP4iYSSD7+KcayA1oJcBKQ==
=n2vS
-----END PGP SIGNATURE-----

--Sig_/RyIrEUa4PrOL3P+S8eK5+Yh--
