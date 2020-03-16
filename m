Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7DD1863BD
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 04:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729462AbgCPDh5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Mar 2020 23:37:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:33147 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729383AbgCPDh5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 15 Mar 2020 23:37:57 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48ghp95sY2z9sP7;
        Mon, 16 Mar 2020 14:37:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1584329875;
        bh=OqGkEgplLcjd9k0OxB0XX6oCQC73DckEogblwhAin24=;
        h=Date:From:To:Cc:Subject:From;
        b=sfF+MakfMEDBwd+kEfUCSnjuYXxN+WSD2m/7bxx+optsTovXDrTODIYYtuU+E6TgG
         VVKaLMXEanzwj4NF2Rie7lxDT+wkI3EuJXKzrd8jfa+QsQzUYN/xWABeaQc7krFK07
         jHU/9u/2g0lCKNs5GP6KYcsrqaFeZ9p8mLHuUgNBaxTl6gq/1LYAKXuDM/Zh2YdH6B
         Eh+QW3eK061ykDe8jEifKxw+2jWe+29Udv0V8LVeqfTSAzTBE0dqG4Jsz8fpho1s09
         3z09OkZMl5ptV/0x+yhQVyu4snY1+U30w54B4P+CPsAu3PlSlWv0g1n6NzgifXajMb
         vnj3hGgXnOeIw==
Date:   Mon, 16 Mar 2020 14:37:52 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Felipe Balbi <balbi@kernel.org>, Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Yu Chen <chenyu56@huawei.com>,
        John Stultz <john.stultz@linaro.org>
Subject: linux-next: build failure after merge of the usb-gadget tree
Message-ID: <20200316143752.473f1073@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/dqdE2jDR+SqDnGIHyN7gx7T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/dqdE2jDR+SqDnGIHyN7gx7T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb-gadget tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/usb/dwc3/drd.c: In function 'dwc3_setup_role_switch':
drivers/usb/dwc3/drd.c:551:23: error: assignment to 'usb_role_switch_set_t'=
 {aka 'int (*)(struct usb_role_switch *, enum usb_role)'} from incompatible=
 pointer type 'int (*)(struct device *, enum usb_role)' [-Werror=3Dincompat=
ible-pointer-types]
  551 |  dwc3_role_switch.set =3D dwc3_usb_role_switch_set;
      |                       ^
drivers/usb/dwc3/drd.c:552:23: error: assignment to 'usb_role_switch_get_t'=
 {aka 'enum usb_role (*)(struct usb_role_switch *)'} from incompatible poin=
ter type 'enum usb_role (*)(struct device *)' [-Werror=3Dincompatible-point=
er-types]
  552 |  dwc3_role_switch.get =3D dwc3_usb_role_switch_get;
      |                       ^

Caused by commit

  8a0a13799744 ("usb: dwc3: Registering a role switch in the DRD code.")

interacting with commit

  bce3052f0c16 ("usb: roles: Provide the switch drivers handle to the switc=
h in the API")

from the usb tree.

I have added the following merge fix patch (which may need more work):

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 16 Mar 2020 14:34:31 +1100
Subject: [PATCH] usb: dwc3: fix up for role switch API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/usb/dwc3/drd.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
index db68d48c2267..7db1ffc92bbd 100644
--- a/drivers/usb/dwc3/drd.c
+++ b/drivers/usb/dwc3/drd.c
@@ -478,9 +478,10 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 =
*dwc)
=20
 #if IS_ENABLED(CONFIG_USB_ROLE_SWITCH)
 #define ROLE_SWITCH 1
-static int dwc3_usb_role_switch_set(struct device *dev, enum usb_role role)
+static int dwc3_usb_role_switch_set(struct usb_role_switch *sw,
+				    enum usb_role role)
 {
-	struct dwc3 *dwc =3D dev_get_drvdata(dev);
+	struct dwc3 *dwc =3D usb_role_switch_get_drvdata(sw);
 	u32 mode;
=20
 	switch (role) {
@@ -502,9 +503,9 @@ static int dwc3_usb_role_switch_set(struct device *dev,=
 enum usb_role role)
 	return 0;
 }
=20
-static enum usb_role dwc3_usb_role_switch_get(struct device *dev)
+static enum usb_role dwc3_usb_role_switch_get(struct usb_role_switch *sw)
 {
-	struct dwc3 *dwc =3D dev_get_drvdata(dev);
+	struct dwc3 *dwc =3D usb_role_switch_get_drvdata(sw);
 	unsigned long flags;
 	enum usb_role role;
=20
@@ -550,6 +551,7 @@ static int dwc3_setup_role_switch(struct dwc3 *dwc)
 	dwc3_role_switch.fwnode =3D dev_fwnode(dwc->dev);
 	dwc3_role_switch.set =3D dwc3_usb_role_switch_set;
 	dwc3_role_switch.get =3D dwc3_usb_role_switch_get;
+	dwc3_role_switch.driver_data =3D dwc;
 	dwc->role_sw =3D usb_role_switch_register(dwc->dev, &dwc3_role_switch);
 	if (IS_ERR(dwc->role_sw))
 		return PTR_ERR(dwc->role_sw);
--=20
2.25.0

--=20
Cheers,
Stephen Rothwell

--Sig_/dqdE2jDR+SqDnGIHyN7gx7T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5u9JAACgkQAVBC80lX
0GyPygf/bbHKNkqtj+vqWCz/ZX500aXamYWTraOd2hNu/v9a6s0mL5UhyRMgBSW0
VOfwC1a5vIsJOA8aNwt8c+yVY+XvZD8R8Wq6bTDcXL2YU99uTW4RBFoZn2va//3V
VaApamZeIZPnUzCpIM4jE+gqjzlI5rVDBzTlluZT6DPNJFJjBAPf2+EfsFowPL28
5RE5X0/tbbKLvcWva/NcmPfR3NmhqZ4wJ0CBb5NtMjQ5dbu29s/Mec1/Ek2JkngM
UM451DBJQeM7ywePXDQCVboPKo75an72B9sV5w6B8E2bJ1FNRfVoKUGKRSpxqhnY
pCG/nWDBOau+tFg12TtI6Aiz+665Rw==
=vbhz
-----END PGP SIGNATURE-----

--Sig_/dqdE2jDR+SqDnGIHyN7gx7T--
