Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2F21863A8
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 04:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729430AbgCPDXP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Mar 2020 23:23:15 -0400
Received: from ozlabs.org ([203.11.71.1]:34907 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729383AbgCPDXP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Mar 2020 23:23:15 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48ghTC5tPNz9sP7;
        Mon, 16 Mar 2020 14:23:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584328992;
        bh=YckoU2FJHhEBGM3DYcWS9rZ8ocZFXiJ8Us337YfMlKo=;
        h=Date:From:To:Cc:Subject:From;
        b=jLjBxAz02i4FoMXnnIwVXTTqcQ4XnpH28MeKgIFh9M2TtBU0MZpss5OtLx63V/HDK
         GQlYQCz9Fntn+iYpO82Wr9VoExVUZO/fY5DoOhQdfKiTYYvm7yDO01bH5ZjwtRXN6I
         W1JuqX9XvnQAuHvAnj1Onppq8XH1PQMAugoeVMVRCRIuRuy95dpqrNC1PRhzOAyduu
         L6GZ/i9RCx+MzVCQvnWHIcf9Hh4YSvPdX0OV2GHNevDBOmCVx80IZAxrTkEe0jJmOW
         WFFlvyw9C1cRGBtXhqA9am3ZbJxhXk6pXHKg8l6R6U9iKCNK3/GY6TgR877vI1IK2E
         kU8RHqvlnoQlg==
Date:   Mon, 16 Mar 2020 14:23:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Felipe Balbi <balbi@kernel.org>, Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>
Subject: linux-next: manual merge of the usb-gadget tree with the usb tree
Message-ID: <20200316142309.19cb3aa8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ch=Gh9hu/coqNj_Gr.lg8x6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ch=Gh9hu/coqNj_Gr.lg8x6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb-gadget tree got a conflict in:

  drivers/usb/dwc3/dwc3-meson-g12a.c

between commit:

  bce3052f0c16 ("usb: roles: Provide the switch drivers handle to the switc=
h in the API")

from the usb tree and commit:

  1e355f21d3fb ("usb: dwc3: Add Amlogic A1 DWC3 glue")

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

diff --cc drivers/usb/dwc3/dwc3-meson-g12a.c
index 3309ce90ca14,902553f39889..000000000000
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@@ -381,6 -408,53 +409,54 @@@ static struct device *dwc3_meson_g12_fi
  	return &pdev->dev;
  }
 =20
+ static int dwc3_meson_g12a_otg_init(struct platform_device *pdev,
+ 				    struct dwc3_meson_g12a *priv)
+ {
+ 	enum phy_mode otg_id;
+ 	int ret, irq;
+ 	struct device *dev =3D &pdev->dev;
+=20
+ 	if (!priv->drvdata->otg_switch_supported)
+ 		return 0;
+=20
+ 	if (priv->otg_mode =3D=3D USB_DR_MODE_OTG) {
+ 		/* Ack irq before registering */
+ 		regmap_update_bits(priv->regmap, USB_R5,
+ 				   USB_R5_ID_DIG_IRQ, 0);
+=20
+ 		irq =3D platform_get_irq(pdev, 0);
+ 		ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
+ 						dwc3_meson_g12a_irq_thread,
+ 						IRQF_ONESHOT, pdev->name, priv);
+ 		if (ret)
+ 			return ret;
+ 	}
+=20
+ 	/* Setup OTG mode corresponding to the ID pin */
+ 	if (priv->otg_mode =3D=3D USB_DR_MODE_OTG) {
+ 		otg_id =3D dwc3_meson_g12a_get_id(priv);
+ 		if (otg_id !=3D priv->otg_phy_mode) {
+ 			if (dwc3_meson_g12a_otg_mode_set(priv, otg_id))
+ 				dev_warn(dev, "Failed to switch OTG mode\n");
+ 		}
+ 	}
+=20
+ 	/* Setup role switcher */
+ 	priv->switch_desc.usb2_port =3D dwc3_meson_g12_find_child(dev,
+ 								"snps,dwc3");
+ 	priv->switch_desc.udc =3D dwc3_meson_g12_find_child(dev, "snps,dwc2");
+ 	priv->switch_desc.allow_userspace_control =3D true;
+ 	priv->switch_desc.set =3D dwc3_meson_g12a_role_set;
+ 	priv->switch_desc.get =3D dwc3_meson_g12a_role_get;
++	priv->switch_desc.driver_data =3D priv;
+=20
+ 	priv->role_switch =3D usb_role_switch_register(dev, &priv->switch_desc);
+ 	if (IS_ERR(priv->role_switch))
+ 		dev_warn(dev, "Unable to register Role Switch\n");
+=20
+ 	return 0;
+ }
+=20
  static int dwc3_meson_g12a_probe(struct platform_device *pdev)
  {
  	struct dwc3_meson_g12a	*priv;

--Sig_/ch=Gh9hu/coqNj_Gr.lg8x6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5u8R0ACgkQAVBC80lX
0GwM9Af/QPpC71d6MIom2jRdVHcxvxySN3LfQoIpAz+REdRJnGvCm+Xgx8GMxrpx
f1NLOSxPx0NSELJtPkm89q0LYGap3QnRfhugcv1x4H4W58oJYy7iIWkNjOYKh0tN
5TlFekBrSe5Dw+gCSgIhVb16ilRZqJnza2wi9mcS1l+hPdb89XK6yy33wQcg2cdZ
/ZCvajVxog9ky0VRaGjqs07zWliq7Y+KFq3G4QsXycEATix7HCxny/5AQPC8xYPf
q7N2f8dBpvdI/8FjKLP/to3E3oAQwOArJV0xLL4s+2g3NorYkbCi4MmeKwqmGKY3
Sa7MerYuWIZ/KqIjTvZzgrCu27uAXA==
=kwyJ
-----END PGP SIGNATURE-----

--Sig_/ch=Gh9hu/coqNj_Gr.lg8x6--
