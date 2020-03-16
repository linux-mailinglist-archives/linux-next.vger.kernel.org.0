Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60F8A186395
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 04:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729663AbgCPDOj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Mar 2020 23:14:39 -0400
Received: from ozlabs.org ([203.11.71.1]:34999 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729655AbgCPDOj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Mar 2020 23:14:39 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48ghHK1nppz9sP7;
        Mon, 16 Mar 2020 14:14:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584328477;
        bh=5N2MgFvt+u4m3pMT4rzBFHd1Ae2gPlXu7fZF/DEo/2I=;
        h=Date:From:To:Cc:Subject:From;
        b=iGg05VAIG2sIlwe19oNPJOgxzikHUYlJHgswB3sPEJD+4OyWRI0DvXOE6h3UYyzCR
         1yoOO9FvcsFC2WJOLMlann/K9FxJ2x0c8fXuLjdat8ce8HiX+06rbdVy9OAs0w2SC/
         z/vEBWdGEXYoDvQ2Sa009SFDGril6oGIEYF7PLjkdhf8j7aY6MsOClnZ5g/R4aYwFo
         FOqBKPyQuyWcgorYHYu93s4XDkLuHUjc//PMLjSo2FqxFEbSQtu3FouocA+A3AwAZn
         GNlDpEZyi5O9bBDHZQQa85jp4cJd/IcJBN6prRq0OA2isjq7fKw4w3N4ZWNdm0OrAo
         X800ptsDP/Tlg==
Date:   Mon, 16 Mar 2020 14:14:36 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Felipe Balbi <balbi@kernel.org>,
        Rob Herring <robherring2@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prashant Malani <pmalani@chromium.org>,
        John Stultz <john.stultz@linaro.org>
Subject: linux-next: manual merge of the usb-gadget tree with the devicetree
 tree
Message-ID: <20200316141436.2113f68c@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JHsccSclAd4l8cAX/NDuV7e";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/JHsccSclAd4l8cAX/NDuV7e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb-gadget tree got a conflict in:

  Documentation/devicetree/bindings/usb/generic.txt

between commit:

  431a30b7d495 ("dt-bindings: Convert usb-connector to YAML format.")

from the devicetree tree and commit:

  dd2d0d1fac2b ("dt-bindings: usb: generic: Add role-switch-default-mode bi=
nding")

from the usb-gadget tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/devicetree/bindings/usb/generic.txt
index 474e74c06522,67c51759a642..000000000000
--- a/Documentation/devicetree/bindings/usb/generic.txt
+++ b/Documentation/devicetree/bindings/usb/generic.txt
@@@ -34,7 -34,13 +34,13 @@@ Optional properties
   - usb-role-switch: boolean, indicates that the device is capable of assi=
gning
  			the USB data role (USB host or USB device) for a given
  			USB connector, such as Type-C, Type-B(micro).
 -			see connector/usb-connector.txt.
 +			see connector/usb-connector.yaml.
+  - role-switch-default-mode: indicating if usb-role-switch is enabled, the
+ 			device default operation mode of controller while usb
+ 			role is USB_ROLE_NONE. Valid arguments are "host" and
+ 			"peripheral". Defaults to "peripheral" if not
+ 			specified.
+=20
 =20
  This is an attribute to a USB controller such as:
 =20

--Sig_/JHsccSclAd4l8cAX/NDuV7e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5u7xwACgkQAVBC80lX
0GxnrwgAnWg0FEc/D17k1v601YqL9c7GdX9Xkcvqy8WB+1Leeg8bJS9LMlDhuy5M
OJiJ7oIOM3dhdTaFW1qPx+QrKd7Vh37kpGmuD6BdLTXTc1Y+rvshgQSUfwb5bSUp
fgWKgD7DnnR5iEnSNK+JlheuTVpb8X5h8gWdca2tya/hrlzZ3kAQh8lvxYTgcIQl
CgIQ78QcaLOwVxcds7icofeAT4kXEjPq/R4iz4BWCc+zS/4reM/g+WuwQkyNmSCY
IWUdC+I+TEMcb16XiQLGXpPn2C/UKERbjbz8fSOMBTpk33on3XrILRPUIc6pkqqJ
xP2rzo3gbAbTUk8tJSUFfqDSSaBqoA==
=59uV
-----END PGP SIGNATURE-----

--Sig_/JHsccSclAd4l8cAX/NDuV7e--
