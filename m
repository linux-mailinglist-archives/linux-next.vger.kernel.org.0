Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F12B228F64
	for <lists+linux-next@lfdr.de>; Wed, 22 Jul 2020 06:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgGVEtz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 22 Jul 2020 00:49:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726147AbgGVEtz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 22 Jul 2020 00:49:55 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E7DC061794;
        Tue, 21 Jul 2020 21:49:54 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BBNL73gDQz9sPf;
        Wed, 22 Jul 2020 14:49:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1595393393;
        bh=KtYiC6cb1/nWjvWk5MwcjnpTN7SZ1LgyLW40FdeZs8A=;
        h=Date:From:To:Cc:Subject:From;
        b=Zto6XPkNAKZJ7fw1giNAPs7SGcBtHmNSvBXrrbq/FaXCUjKvMcP9uyr5Zc6G5hFMB
         SEFRLy06SSO5kaWRgh1Hjxos4M3dp+DOp4iRfhyqBUYzX2ak1UV/+QhjAGlMKSqoDc
         iKV7yDgHWQ+w3rPE1duOWXjs6Ec1YlxaXftFxJ5ZhF1VNbEqm9f999uaBli1bdD9l/
         IqRfKgcsru80laty+6oaw71TEoDgoD2rt9TOmw1korcnN9yOvCtGJLT6zt/PfNsW5D
         mLjf7o9+4k1YHShQvsGepFpsWiLzfAMX1X+j1dUMURTnedF8xaikQHkxUnyH9l8WWi
         bDdC5StvulWyw==
Date:   Wed, 22 Jul 2020 14:49:50 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Derek Basehore <dbasehore@chromium.org>,
        Jingle Wu <jingle.wu@emc.com.tw>
Subject: linux-next: manual merge of the input tree with Linus' tree
Message-ID: <20200722144950.220b44ec@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IdEgtprhHnijhSJwrL=X7ZF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/IdEgtprhHnijhSJwrL=X7ZF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the input tree got a conflict in:

  drivers/input/mouse/elan_i2c_core.c

between commit:

  966334dfc472 ("Input: elan_i2c - only increment wakeup count on touch")

from Linus' tree and commit:

  04d5ce620f79 ("Input: elan_i2c - add support for high resolution reports")

from the input tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/input/mouse/elan_i2c_core.c
index 6291fb5fa015,4b6e2dffc0ea..000000000000
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@@ -951,13 -997,12 +997,14 @@@ static void elan_report_absolute(struc
  	u8 hover_info =3D packet[ETP_HOVER_INFO_OFFSET];
  	bool contact_valid, hover_event;
 =20
 +	pm_wakeup_event(&data->client->dev, 0);
 +
- 	hover_event =3D hover_info & 0x40;
- 	for (i =3D 0; i < ETP_MAX_FINGERS; i++) {
- 		contact_valid =3D tp_info & (1U << (3 + i));
- 		elan_report_contact(data, i, contact_valid, finger_data);
+ 	hover_event =3D hover_info & BIT(6);
 =20
+ 	for (i =3D 0; i < ETP_MAX_FINGERS; i++) {
+ 		contact_valid =3D tp_info & BIT(3 + i);
+ 		elan_report_contact(data, i, contact_valid, high_precision,
+ 				    packet, finger_data);
  		if (contact_valid)
  			finger_data +=3D ETP_FINGER_DATA_LEN;
  	}
@@@ -1019,9 -1063,14 +1066,12 @@@ static irqreturn_t elan_isr(int irq, vo
  	if (error)
  		goto out;
 =20
 -	pm_wakeup_event(dev, 0);
 -
  	switch (report[ETP_REPORT_ID_OFFSET]) {
  	case ETP_REPORT_ID:
- 		elan_report_absolute(data, report);
+ 		elan_report_absolute(data, report, false);
+ 		break;
+ 	case ETP_REPORT_ID2:
+ 		elan_report_absolute(data, report, true);
  		break;
  	case ETP_TP_REPORT_ID:
  		elan_report_trackpoint(data, report);

--Sig_/IdEgtprhHnijhSJwrL=X7ZF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8XxW4ACgkQAVBC80lX
0GxnaQf/TwesPieTBCj7wlbkGDAbfxseJTjpbun+8/qAM0QA8EygGVFMEmZ40HEJ
9TT6zgLu+CfR9/1E4Y42kPcprsRo/W3fyxCWmKI2O0nGkFlDkcT9wS8GF1AZaKP1
p/tOL18iRtjxpE8M+muhBxXGJTtzEhlidR0ZiL3v/tKHgqjK4emd0/GpgYwuQ4QX
9JmMd28/BVVhMO+vLFHztPyRC4GjSZFDDR/XDm0x1hl4w4T/6hoiTRHkE1/5zhg6
ljM0C8e2YyAKRwTd6WEPlscH9wGBE2wYGSUyv5rJA+4iDzzaXeLX3DD7zbCkxql8
IWyc3VyNztgwjsAF/TsRqEIs3zKGgw==
=shGj
-----END PGP SIGNATURE-----

--Sig_/IdEgtprhHnijhSJwrL=X7ZF--
