Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C9AB3D1CD5
	for <lists+linux-next@lfdr.de>; Thu, 22 Jul 2021 06:12:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhGVDb5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Jul 2021 23:31:57 -0400
Received: from ozlabs.org ([203.11.71.1]:47061 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229779AbhGVDb5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 21 Jul 2021 23:31:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GVfDb1fBRz9s1l;
        Thu, 22 Jul 2021 14:12:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1626927151;
        bh=oQqH6wJKuA7MrcishEzfcEWbl5nuubL1NZA6WTnkiA4=;
        h=Date:From:To:Cc:Subject:From;
        b=LR91xj7pbGLX8EKXeWO9zGvysp7kYhp96Y/vmwYJIiAiKBjfWmpQFlxW7893YB5ou
         g1CNW2QTM1uOOvGrr4hxOHKurnWdO6Wxo67SIxWp1qbAZeMNdGzl2+Kjb8arOmcEnb
         YxV78rcQk7JNFM0yYLATq2AdXIO4q803QUJbKX/4r0exUem7tZZuv/w1ZrajVJiX6w
         odv0Js76uomuv+N76US2LxFABML3xlQ25fXbajv4gszyZK0EqAmDc/njO4r+kLwS1Y
         26yvsA2NvnPuyz76nzDl7/E146vno3VMZekizVxwL/8J79PfLgG3bD0VUjsZjwOLYI
         MrcsAuC8/RkBA==
Date:   Thu, 22 Jul 2021 14:12:28 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linyu Yuan <linyyuan@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <20210722141228.57a92e94@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6_UOKw6Fnaoh/zIqedxn.lQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/6_UOKw6Fnaoh/zIqedxn.lQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/dwc3/gadget.c

between commit:

  40edb52298df ("usb: dwc3: avoid NULL access of usb_gadget_driver")

from the usb.current tree and commit:

  9f607a309fbe ("usb: dwc3: Resize TX FIFOs to meet EP bursting requirement=
s")

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
index 45f2bc0807e8,e56f1a6db2de..000000000000
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@@ -2585,16 -2771,51 +2771,61 @@@ static int dwc3_gadget_vbus_draw(struc
  	return ret;
  }
 =20
 +static void dwc3_gadget_async_callbacks(struct usb_gadget *g, bool enable)
 +{
 +	struct dwc3		*dwc =3D gadget_to_dwc(g);
 +	unsigned long		flags;
 +
 +	spin_lock_irqsave(&dwc->lock, flags);
 +	dwc->async_callbacks =3D enable;
 +	spin_unlock_irqrestore(&dwc->lock, flags);
 +}
 +
+ /**
+  * dwc3_gadget_check_config - ensure dwc3 can support the USB configurati=
on
+  * @g: pointer to the USB gadget
+  *
+  * Used to record the maximum number of endpoints being used in a USB com=
posite
+  * device. (across all configurations)  This is to be used in the calcula=
tion
+  * of the TXFIFO sizes when resizing internal memory for individual endpo=
ints.
+  * It will help ensured that the resizing logic reserves enough space for=
 at
+  * least one max packet.
+  */
+ static int dwc3_gadget_check_config(struct usb_gadget *g)
+ {
+ 	struct dwc3 *dwc =3D gadget_to_dwc(g);
+ 	struct usb_ep *ep;
+ 	int fifo_size =3D 0;
+ 	int ram1_depth;
+ 	int ep_num =3D 0;
+=20
+ 	if (!dwc->do_fifo_resize)
+ 		return 0;
+=20
+ 	list_for_each_entry(ep, &g->ep_list, ep_list) {
+ 		/* Only interested in the IN endpoints */
+ 		if (ep->claimed && (ep->address & USB_DIR_IN))
+ 			ep_num++;
+ 	}
+=20
+ 	if (ep_num <=3D dwc->max_cfg_eps)
+ 		return 0;
+=20
+ 	/* Update the max number of eps in the composition */
+ 	dwc->max_cfg_eps =3D ep_num;
+=20
+ 	fifo_size =3D dwc3_gadget_calc_tx_fifo_size(dwc, dwc->max_cfg_eps);
+ 	/* Based on the equation, increment by one for every ep */
+ 	fifo_size +=3D dwc->max_cfg_eps;
+=20
+ 	/* Check if we can fit a single fifo per endpoint */
+ 	ram1_depth =3D DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
+ 	if (fifo_size > ram1_depth)
+ 		return -ENOMEM;
+=20
+ 	return 0;
+ }
+=20
  static const struct usb_gadget_ops dwc3_gadget_ops =3D {
  	.get_frame		=3D dwc3_gadget_get_frame,
  	.wakeup			=3D dwc3_gadget_wakeup,
@@@ -2606,7 -2827,7 +2837,8 @@@
  	.udc_set_ssp_rate	=3D dwc3_gadget_set_ssp_rate,
  	.get_config_params	=3D dwc3_gadget_config_params,
  	.vbus_draw		=3D dwc3_gadget_vbus_draw,
 +	.udc_async_callbacks	=3D dwc3_gadget_async_callbacks,
+ 	.check_config		=3D dwc3_gadget_check_config,
  };
 =20
  /* ----------------------------------------------------------------------=
---- */

--Sig_/6_UOKw6Fnaoh/zIqedxn.lQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmD48CwACgkQAVBC80lX
0GzMTwf/YpgKsMMiBhl7w/+3brRHsYRMeuVh9TTD6FnW6J3ofJhTWunMK5E6eWs6
+luGUXI7Oqc+YIYtoOWhBCAAw7R1kiLA4DnQsOmLrAA/yA4A3Xo50dt5wWAK5Hyd
0Gt2B80N6Iqguj55VSQ4cDYGcTcf7u5PIJzKS4tdnMG4Tf2hDAuCXALRNpoKUxVt
BJVINNx8hldVPXoQXTnxvQA13qoPzlBRyTeKTKmVitolHeReuEFU4kuhwIbsRHlJ
8eK7CfBEpcJfb1osp1rIWW0QLMJf1ifufmGcBByqXYIqmzT5qnLScxedROo2PFk/
XNCdWHDA7JnwgDLCnrdS+XXIVpKHzw==
=HQv9
-----END PGP SIGNATURE-----

--Sig_/6_UOKw6Fnaoh/zIqedxn.lQ--
