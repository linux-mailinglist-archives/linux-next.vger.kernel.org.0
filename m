Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A204A8005
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2019 12:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbfIDKKA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 Sep 2019 06:10:00 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58977 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726528AbfIDKKA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 4 Sep 2019 06:10:00 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 46Nfh30l95z9s7T;
        Wed,  4 Sep 2019 20:09:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1567591796;
        bh=BDpKG3X1Zx+1VEa2ayRW84C1/Z2abJbdoRgSEZObzXc=;
        h=Date:From:To:Cc:Subject:From;
        b=PhmTOOulcTWedCl8xCPMFBfoWO4ziFKArLOqPtSqIf6dfKBwLEBnJLnVJ0VfOfJ1A
         Y8MvP0jx/LE21TZCLcYWUsINj0py1uxWZnQ33nzBf/q2HgctP8JpTsceOEPjjQfdI2
         jvoAqhOnplMoMd2Mh3yUR1wU9BztGTfacYvQLTsaP/lnQ/2TJqZ7/LRV+I0jyPHehM
         JDp5iStSYXREYiDKGnM1BhRuRXLp097+CGn4u9nAVZ8K/BZLSTHjyt1aq8wC5XNIkL
         n7az/PWPpK7MP07AMffbhCJ7rgXPItCOvUxEC4RBboiFNMooBYOUAWWpDw89/wLCBt
         wGL03ggAzkbpw==
Date:   Wed, 4 Sep 2019 20:09:29 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Saranya Gopal <saranya.gopal@intel.com>,
        Balaji Manoharan <m.balaji@intel.com>
Subject: linux-next: manual merge of the usb tree with the pm tree
Message-ID: <20190904200929.00cfb98a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7+AVZsp_crtAvikF==gzmFR";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/7+AVZsp_crtAvikF==gzmFR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/roles/intel-xhci-usb-role-switch.c

between commit:

  d2a90ebb6553 ("usb: roles: intel_xhci: Supplying software node for the ro=
le mux")

from the pm tree and commit:

  2be1fb64dfeb ("usb: roles: intel: Enable static DRD mode for role switch")

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

diff --cc drivers/usb/roles/intel-xhci-usb-role-switch.c
index 7325a84dd1c8,88d041601c51..000000000000
--- a/drivers/usb/roles/intel-xhci-usb-role-switch.c
+++ b/drivers/usb/roles/intel-xhci-usb-role-switch.c
@@@ -37,12 -44,9 +44,13 @@@
  struct intel_xhci_usb_data {
  	struct usb_role_switch *role_sw;
  	void __iomem *base;
+ 	bool enable_sw_switch;
  };
 =20
 +static const struct software_node intel_xhci_usb_node =3D {
 +	"intel-xhci-usb-sw",
 +};
 +
  static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
  {
  	struct intel_xhci_usb_data *data =3D dev_get_drvdata(dev);
@@@ -147,20 -167,12 +167,22 @@@ static int intel_xhci_usb_probe(struct=20
 =20
  	platform_set_drvdata(pdev, data);
 =20
+ 	data->enable_sw_switch =3D !device_property_read_bool(dev,
+ 						"sw_switch_disable");
 +	ret =3D software_node_register(&intel_xhci_usb_node);
 +	if (ret)
 +		return ret;
 +
 +	sw_desc.set =3D intel_xhci_usb_set_role,
 +	sw_desc.get =3D intel_xhci_usb_get_role,
 +	sw_desc.allow_userspace_control =3D true,
 +	sw_desc.fwnode =3D software_node_fwnode(&intel_xhci_usb_node);
 =20
  	data->role_sw =3D usb_role_switch_register(dev, &sw_desc);
 -	if (IS_ERR(data->role_sw))
 +	if (IS_ERR(data->role_sw)) {
 +		fwnode_handle_put(sw_desc.fwnode);
  		return PTR_ERR(data->role_sw);
 +	}
 =20
  	pm_runtime_set_active(dev);
  	pm_runtime_enable(dev);

--Sig_/7+AVZsp_crtAvikF==gzmFR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl1vjVkACgkQAVBC80lX
0Gz7/AgAmTqmsoURHX0krQpnNFikKhjGPJMOn85YKgoXLha4XJbZ8ZdQ0Ui24xFM
Wr+ATUqdAuByABYi+7W2cqrYLndlgekS4LQ92wdtXAh95Ff9vm7ffZDlRpWFz5qr
SUVcG+CANtY7h1lmHo1ir4XuNi/oZ9AkPHaORvtuMaoNIOOTBdNebbpRctaOhgya
/9/dFrDftks9ERiXuooJXz9Ty1bZhUsKOjIW0UFCQlBpiZsqV9ve5f9PX/TllehW
e+Ov98Tgw2AwyCxBOLMEIgE0IgII/9n0Z7nMwKFFnLnjPfFef3Bf5fZCj1PEe6Ah
6gSbm9SRIjPd1CymMlqDTPE1peZY+g==
=jWUC
-----END PGP SIGNATURE-----

--Sig_/7+AVZsp_crtAvikF==gzmFR--
