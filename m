Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D071D26D36D
	for <lists+linux-next@lfdr.de>; Thu, 17 Sep 2020 08:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgIQGJy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Sep 2020 02:09:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgIQGJw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Sep 2020 02:09:52 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF82C06174A;
        Wed, 16 Sep 2020 23:09:51 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BsRQ33Dw4z9sRK;
        Thu, 17 Sep 2020 16:09:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1600322987;
        bh=TmdBztbuMOuTpuG9Y4p4s7EACpR273w2NT17CR0+Gls=;
        h=Date:From:To:Cc:Subject:From;
        b=GhcGTVIXbNve5mPigJrhq1s3cBbO0Zz94lX94mMquSI/OnjHHUwrl79ezPrv4Wn6g
         onescsuSveYZVX8M2P9UBFvafWY+3UrG0/6kwvRPvgZDNM+9CqM0fyxpxQUMdCVu4N
         mQB6sIDX1NldK8wqdZHVGRH5ypsA0jMxGqM3dFV84zwXQ/Vc63B2f2WuW4S8xrHmJq
         rx0RPv+P8Q05L30OYtz/xQ+6EJ3xf/HL0SQJOBjOFwiLyyKWNo4Ulzsqhoq7V0hVpp
         ir+0spveesBRkqYKaxdsF0KX+60MKHswBzqmXG1ZqS3fwsN8ZYLncQVpqdD/OmrJZS
         EgqITFAg8PvsA==
Date:   Thu, 17 Sep 2020 16:09:46 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Tobias Diedrich <tobiasdiedrich@gmail.com>,
        Du Huanpeng <u74147@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: manual merge of the tty tree with the tty.current tree
Message-ID: <20200917160946.02dc6bb0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P0Vvc.GkmmM9s/NVdD=CAf6";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/P0Vvc.GkmmM9s/NVdD=CAf6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tty tree got a conflict in:

  drivers/tty/serial/8250/8250_pci.c

between commit:

  3c5a87be170a ("serial: 8250_pci: Add Realtek 816a and 816b")

from the tty.current tree and commit:

  04b6ff5f25de ("serial: 8250_pci: Add WCH384_8S 8 port serial device")

from the tty tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/tty/serial/8250/8250_pci.c
index 55bb7b897d97,85810b8b9d20..000000000000
--- a/drivers/tty/serial/8250/8250_pci.c
+++ b/drivers/tty/serial/8250/8250_pci.c
@@@ -5566,17 -5618,10 +5618,21 @@@ static const struct pci_device_id seria
  		PCI_ANY_ID, PCI_ANY_ID,
  		0, 0, pbn_wch384_4 },
 =20
+ 	{	PCIE_VENDOR_ID_WCH, PCIE_DEVICE_ID_WCH_CH384_8S,
+ 		PCI_ANY_ID, PCI_ANY_ID,
+ 		0, 0, pbn_wch384_8 },
+=20
 +	/*
 +	 * Realtek RealManage
 +	 */
 +	{	PCI_VENDOR_ID_REALTEK, 0x816a,
 +		PCI_ANY_ID, PCI_ANY_ID,
 +		0, 0, pbn_b0_1_115200 },
 +
 +	{	PCI_VENDOR_ID_REALTEK, 0x816b,
 +		PCI_ANY_ID, PCI_ANY_ID,
 +		0, 0, pbn_b0_1_115200 },
 +
  	/* Fintek PCI serial cards */
  	{ PCI_DEVICE(0x1c29, 0x1104), .driver_data =3D pbn_fintek_4 },
  	{ PCI_DEVICE(0x1c29, 0x1108), .driver_data =3D pbn_fintek_8 },

--Sig_/P0Vvc.GkmmM9s/NVdD=CAf6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl9i/aoACgkQAVBC80lX
0GznaAf+J7Q6fQUti6m2u7v75zIFn2I0XdHaQtCOCKKh1q0OIliavPywDpX7yeqi
kDXATlWrlfnB8EwGXHY1crA3NPtnxCLzxgIjpwGO/fLhvgsUXhnr1QZL8BjmBMw9
45Yas8SALI2OcYDzHBZHnzit+EUd2vYCmdCAEDq2Nb/2L2I5mqxtyYYtKqh7GCvX
yxO4UOQTSx1eFXL8VOnQ5O5ujKIf6CvWX01lMOHOtQDRHFYv1OBWG09H2VE/aMN5
ZJ96aN0wRCSh4QLMPjLcw325eVSWZYWKMsS97qxLA6p6GqFjq7NqWfe7up0Kty6V
5UaKZIOLfRnhjnH/HCe/8TmP4h2iPg==
=Xg2Q
-----END PGP SIGNATURE-----

--Sig_/P0Vvc.GkmmM9s/NVdD=CAf6--
