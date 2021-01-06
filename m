Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF322EB716
	for <lists+linux-next@lfdr.de>; Wed,  6 Jan 2021 01:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727765AbhAFAu7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Jan 2021 19:50:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbhAFAu6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Jan 2021 19:50:58 -0500
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5583FC061798;
        Tue,  5 Jan 2021 16:50:18 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4D9W48100Cz9sVk;
        Wed,  6 Jan 2021 11:50:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1609894216;
        bh=ZHqcfIHyx37hc6pokPiTH2NSvWKQKsdRwbvzEu4LyE4=;
        h=Date:From:To:Cc:Subject:From;
        b=mDC+HLTHkxyntsV7o/P+4JildYgx64ahqdLaDw8q0IkJcat5Ne4tpkYx/Creojvho
         dhHHbHb0YMOBCZMXTwXGRM8Ys14k6wc9Bwz9jsePyTM4L41o+ku1VTC6cxN0JatcCb
         b7mN6bwx/IAAX1nLk8Zin4RwUmgKz4kzSExSuQvaRtxFHagBOcKBhskucn2ulS3Q2Z
         3fz2mcg6RII6nClq+vY5zLtRAaqCb1LiSYOddF1VDjKvQJ+LDhiRSp0H3wQ58WIsFA
         5XSfwhYV+q6OzaKW2T4DHcBaT40SoG9UYqLQHHw0KQdcxcEfROulmsk5KVEXR0ppfE
         RqY8NtNtn3GXA==
Date:   Wed, 6 Jan 2021 11:50:14 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <20210106115014.28009565@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sMGKAeMBI4PpbVfHyvqzYlO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sMGKAeMBI4PpbVfHyvqzYlO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/dwc3/gadget.c

between commit:

  a1383b3537a7 ("usb: dwc3: gadget: Restart DWC3 gadget when enabling pullu=
p")

from the usb.current tree and commit:

  77adb8bdf422 ("usb: dwc3: gadget: Allow runtime suspend if UDC unbinded")

from the usb tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/usb/dwc3/gadget.c
index 25f654b79e48,85736dd6673b..000000000000
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@@ -2146,8 -2212,7 +2213,9 @@@ static int dwc3_gadget_pullup(struct us
  			dwc->ev_buf->lpos =3D (dwc->ev_buf->lpos + count) %
  						dwc->ev_buf->length;
  		}
+ 		dwc->connected =3D false;
 +	} else {
 +		__dwc3_gadget_start(dwc);
  	}
 =20
  	ret =3D dwc3_gadget_run_stop(dwc, is_on, false);

--Sig_/sMGKAeMBI4PpbVfHyvqzYlO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/1CUYACgkQAVBC80lX
0GxYkAf+MGHIk9/DHFfknZyzAb+3/f1mNz0Qx4QuqNLF8T0Z9134MZPbtF70WD10
WBHjgyJtqYC2ZyhPgtvtst60kngYOEp1NLOSMu9qHVivno9JX121cTdfR/+KiYty
2HiRdD9vakP4OYOQfN4Hm8IWmOG3xFXP+mT4ZmOXcQTVpTJ8UbwD6kK4hAQ7qgTO
cYnRkY+N/9FTQikICH96uYNzJlRAqjlrsal+M3KdWJptCRT/Ad/mVx39kw+qRYLv
FL6miiNI8CWg2b2+w09F8ogma3pP8EzXnMfLEvw5tIqbkPe71NEzNZ5xQegxl3O7
04tkx/qaMKU0oJhkcbrsiyuaqEuoEw==
=f4qH
-----END PGP SIGNATURE-----

--Sig_/sMGKAeMBI4PpbVfHyvqzYlO--
