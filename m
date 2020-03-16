Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D252218638C
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 04:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729444AbgCPDKO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Mar 2020 23:10:14 -0400
Received: from ozlabs.org ([203.11.71.1]:34271 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729384AbgCPDKN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Mar 2020 23:10:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48ghB93YrQz9sPk;
        Mon, 16 Mar 2020 14:10:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584328210;
        bh=Knue5rqiLe1nXMX+fyKsUbWZ2mKqB6wfYMP000sIv20=;
        h=Date:From:To:Cc:Subject:From;
        b=PXb2qVMM+akhCIquVAFaSr4kIb4zPZUKQL6a0o07ytAj19YJ/qEgE9Pp2jZm+yKFF
         RaFDFzQqhgvnsURV63OOMs4OLErI6MVMAfM6NZzUuflXDN01s2PeBrlEjY2Xixesxe
         LBMzFRqe9d1gioFkNbM4/wSvz98I3UToGLfmfFn/t8tzfrdh8TywEXRNkNypKQZVLS
         tCNtJkukowZaw3pYFeZBlAOyKOAxEelqMrWAQA97DyCoeqaLmtQJnYVD5rpjvPLY1A
         AT59uyoJ7mgBz0PoPli0bK2bjDMRziXErni/RUH62rgPWNltJqu5e3rcO2WGaxQVml
         WTLUvMHQ2+S3A==
Date:   Mon, 16 Mar 2020 14:10:04 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Colin Cross <ccross@android.com>,
        Olof Johansson <olof@lixom.net>,
        Thierry Reding <treding@nvidia.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: linux-next: build failure after merge of the usb tree
Message-ID: <20200316141004.171649a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j=EfkFvgnu7ybbMgR4aLewO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/j=EfkFvgnu7ybbMgR4aLewO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/phy/tegra/xusb.c: In function 'tegra_xusb_setup_usb_role_switch':
drivers/phy/tegra/xusb.c:641:10: error: initialization of 'int (*)(struct u=
sb_role_switch *, enum usb_role)' from incompatible pointer type 'int (*)(s=
truct device *, enum usb_role)' [-Werror=3Dincompatible-pointer-types]
  641 |   .set =3D tegra_xusb_role_sw_set,
      |          ^~~~~~~~~~~~~~~~~~~~~~
drivers/phy/tegra/xusb.c:641:10: note: (near initialization for 'role_sx_de=
sc.set')

Caused by commit

  bce3052f0c16 ("usb: roles: Provide the switch drivers handle to the switc=
h in the API")

interacting with commit

  5a00c7c7604f ("phy: tegra: xusb: Add usb-role-switch support")

from the tegra tree.

I have added this merge fix patch (which may need more work):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 16 Mar 2020 14:04:20 +1100
Subject: [PATCH] phy: tegra: fix up for set_role API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/phy/tegra/xusb.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index d907f03bf282..25223c350e66 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -596,11 +596,12 @@ static void tegra_xusb_usb_phy_work(struct work_struc=
t *work)
 	atomic_notifier_call_chain(&port->usb_phy.notifier, 0, &port->usb_phy);
 }
=20
-static int tegra_xusb_role_sw_set(struct device *dev, enum usb_role role)
+static int tegra_xusb_role_sw_set(struct usb_role_switch *sw,
+				  enum usb_role role)
 {
-	struct tegra_xusb_port *port =3D dev_get_drvdata(dev);
+	struct tegra_xusb_port *port =3D usb_role_switch_get_drvdata(sw);
=20
-	dev_dbg(dev, "%s(): role %s\n", __func__, usb_roles[role]);
+	dev_dbg(&port->dev, "%s(): role %s\n", __func__, usb_roles[role]);
=20
 	schedule_work(&port->usb_phy_work);
=20
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/j=EfkFvgnu7ybbMgR4aLewO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5u7gwACgkQAVBC80lX
0Gzbnwf/Vpdc0s7iO1BA2KP7C4N8nNGMt2T70e+tG3Dd98koC7/AwQh39vtfB+BY
c6RGutLRKu/43ZCJDSHVUPJeJ/oGN2ErmiffqoBGs0S8iWQ7b1bwnRoRF7iYhseC
OducQfFHb6NYGKud6y07DArvoyrspHL5qIAGEyCvekSGkUbfgXXeAoKCEsRUaCmM
uKjpH6M/lZf9klQz7/1FzD5XDKI3SzLk1U1/XuH5yLVW0ZlfwcJil0JL7kdYewHp
boCYWRv8Z4Gtxy+JxsnQLQcMbvJIurFjiODQO0Sgd2GtyoPS4vht27noZyeNqfg/
ZkzI/VrsT6CP+KRZhB2jPuqWyRmPgA==
=0thF
-----END PGP SIGNATURE-----

--Sig_/j=EfkFvgnu7ybbMgR4aLewO--
