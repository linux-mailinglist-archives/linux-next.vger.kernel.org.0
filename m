Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF72B2D3ECC
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 10:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgLIJbR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 04:31:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728446AbgLIJbR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 04:31:17 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C5CC061793;
        Wed,  9 Dec 2020 01:30:37 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4CrWxN6j47z9sW9;
        Wed,  9 Dec 2020 20:30:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1607506233;
        bh=mTSVImBbfPaUvkMd2Y893xa7mukCBGI7gtact0vehVs=;
        h=Date:From:To:Cc:Subject:From;
        b=HEg3j+ZAYi42MQn2m87wPE+IM4jq18mBU8roHSkwyptQUgLLxoju85Sa+g/k6/1EG
         rIOcKHGelVRAuXr85NHevfpkbRDKcWooTwhm9QhdKLnS8Nt1cWklyuDeY6o/z7hGS5
         zCIs0issQM7hlR/iCmtqrGJvFzxjwvCH8ATCFPDcnc87LfTu7yyWB5wldnq3/FI9hZ
         dBLVmwNGTTdhMhrQZ+LGd/FvpAzNo2bquJS1QYzl1rE358tL2Sh46Hd7mrtoFqxyP8
         Idiu4QEhB0RMSpddZPalTGDFspRXRZ+FiakuZ28NAzxRZkUUaFP5eYmA73y9svTfE2
         w7/RXBv8NCfqw==
Date:   Wed, 9 Dec 2020 20:30:29 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Dominique Martinet <asmadeus@codewreck.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the kbuild tree
Message-ID: <20201209203029.7f2a8db2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zwh5n0TTdrbMrv4w7dKnt04";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zwh5n0TTdrbMrv4w7dKnt04
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the kbuild tree, today's linux-next build (x86_64
modules_install) produced this warning:

Warning: 'make modules_install' requires depmod. Please install it.
This is probably in the kmod package.

Introduced by commit

  330029209513 ("kbuild: don't hardcode depmod path")

Unfortunately for most of us (?), /sbin is not in our PATH ...

--=20
Cheers,
Stephen Rothwell

--Sig_/zwh5n0TTdrbMrv4w7dKnt04
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/QmTUACgkQAVBC80lX
0Gw8yQf7BgY3a/Re1tDwCsbNgdMdg0B4UFU3Y1C6rjyqhVyU7Fv8HoBED9hek7vC
6ibbVWnBcDs69tHbitZbIW+bNHmH3rKTZA2hecioPM4qtuEwDeT+PlSWFBrQuAQR
a9lMZaYJ59GAVcPOzFutBCzag6rzCfB+pn2WzsB33sP53YAVao4LsPH7GaVSA7tr
eyvp9B3g8Qp3s/so/Vn/qaO2KROVxp4RNmb37cmYURRbzVyWVFC3damKt/LKvOjh
+fCd0m4n4h3HVpwwmsgqD7lYtSeGM6XYzgyixkHzI+/lleuObXCnaPermnuYYq2q
msglke4xVGkoo0g1o2vdN4Qoi9Tb7A==
=VOl0
-----END PGP SIGNATURE-----

--Sig_/zwh5n0TTdrbMrv4w7dKnt04--
