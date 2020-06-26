Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C5820AAAB
	for <lists+linux-next@lfdr.de>; Fri, 26 Jun 2020 05:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728321AbgFZD3O (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Jun 2020 23:29:14 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:40343 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728259AbgFZD3N (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 25 Jun 2020 23:29:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49tMn33cgRz9sRW;
        Fri, 26 Jun 2020 13:29:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1593142152;
        bh=275MNR0fZ1Gw2vesRY+Kks5hSObkSfpkhivafQ9Mxgo=;
        h=Date:From:To:Cc:Subject:From;
        b=RwGd+9pRyInX9JmBxUJ9YP80wxKvm4OwGV0wNWbhg0zcTRh62fUI9C9rbyj+BW1z1
         AxXel0sx3FkTGiJj/1BW8MtPyUbKK+kjiMweimo9KFKFBhd69r+tGaDWj154KX2oOH
         eLLFe9UWZU1z71/6nXOLZRz/fRF/4uiwraQotz9eAUlKh+cFpPSDGUhj41HlbiynPO
         9mRRPUHzfMNI1pEZ9syBWhy8Ebosh/W2nHeMJpmGQzW2sdCCT2RBndP0uU0/NoUAl5
         9hU3Jv3DIOR8OltEQ+o+ZH5+Tu5Z2baIaOl6s5/d2dJ1PeDPelWXFx8UWBuO5cqlCB
         a6Mq34GeJV8oA==
Date:   Fri, 26 Jun 2020 13:29:10 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
Subject: linux-next: manual merge of the usb tree with the usb.current tree
Message-ID: <20200626132910.73031f1f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Wk_WnxW03q72U0__3Z+Y/AK";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/Wk_WnxW03q72U0__3Z+Y/AK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the usb tree got a conflict in:

  drivers/usb/cdns3/ep0.c

between commit:

  c0e2a0341cd8 ("usb: cdns3: ep0: fix the test mode set incorrectly")

from the usb.current tree and commit:

  62fb45d317c5 ("USB: ch9: add "USB_" prefix in front of TEST defines")

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

diff --cc drivers/usb/cdns3/ep0.c
index 61ec5bb2b0ca,04a522f5ae58..000000000000
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@@ -327,12 -327,11 +327,12 @@@ static int cdns3_ep0_feature_handle_dev
  		if (!set || (tmode & 0xff) !=3D 0)
  			return -EINVAL;
 =20
 -		switch (tmode >> 8) {
 +		tmode >>=3D 8;
 +		switch (tmode) {
- 		case TEST_J:
- 		case TEST_K:
- 		case TEST_SE0_NAK:
- 		case TEST_PACKET:
+ 		case USB_TEST_J:
+ 		case USB_TEST_K:
+ 		case USB_TEST_SE0_NAK:
+ 		case USB_TEST_PACKET:
  			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
  					       USB_CMD_STMODE |
  					       USB_STS_TMODE_SEL(tmode - 1));

--Sig_/Wk_WnxW03q72U0__3Z+Y/AK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl71a4YACgkQAVBC80lX
0GyrwAf5ATcWU5RcJcLVLglDeV81exXrvPgVLHRypJ7LqWeCnszqkY/WVoTjXLQR
A5MS/aZFgSTgn9vWy66DdqFIHf0BnT3lsv1Dh0Wa0tadnIiAzmU2hgf8XoTypN/+
Ka3xStkSKckxlOjnoRZUM5VskctRnf7QCm3GUJE/5NLBL9uZ6ZSc9IA2w7vWUNNM
gMVeoe95k2BjB1qCC8djia8+lui//3tmofKrFiGHM2/V5vi3R3qnx5q1mP7gnXyX
A8o7DZp8BbEeD7jibIgEh5CCG57lw63Gr+to6D8S0sGC8WXmgTC+m5uI11r8GHWu
43FGnk4bppwWkRBUKpCbEbHcIojOtg==
=W03G
-----END PGP SIGNATURE-----

--Sig_/Wk_WnxW03q72U0__3Z+Y/AK--
