Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2E9429A07
	for <lists+linux-next@lfdr.de>; Tue, 12 Oct 2021 02:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbhJLAFQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 11 Oct 2021 20:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhJLAFP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 11 Oct 2021 20:05:15 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190ACC061570;
        Mon, 11 Oct 2021 17:03:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4HSwq40LFtz4xqP;
        Tue, 12 Oct 2021 11:03:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1633996992;
        bh=gB89dn2qCWOpeT87X7TCgqp2JJ6phnH05D+Cb2xpK3A=;
        h=Date:From:To:Cc:Subject:From;
        b=bX+QI5lNCmRzbB4opLVZQB8ZPRzeFugVp/QvdyFki/wk05SS5ZFwucvdcvf8jpzVB
         Uwo8LF+wVw3Xjg1a8SxEYBs5TNf2L/VK4cB92bq1E0X1dPqkPbUJY2tl+h4mTkBsPp
         Bw/DDVm2asRNZqP8UeIpZVOF8BhLV2uMYPWOlYv4VYTTu9h8jyZOM9zsBTYibfMeYt
         WmxIyfOmpRFbHv6zLTr/IU0wY559bDNnPwaPBOBXoG03uajmjgDwMloic42LGAekRF
         XFHI7XiI49via2Wr+kwn0hRcH27fZ+jom0Opy5Z9uAPOB9q+9ZiYIiCnnmXI4Ryi5x
         P81KUFYnlRuRQ==
Date:   Tue, 12 Oct 2021 11:03:09 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the arm-soc tree
Message-ID: <20211012110309.17d51c3e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yWm6qW9lQrkde2DvXwd8lWO";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/yWm6qW9lQrkde2DvXwd8lWO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the arm-soc tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

Error: arch/arm/boot/dts/sama7g5.dtsi:167.3-7 syntax error
FATAL ERROR: Unable to parse input tree

Caused by commit

  9be4be3ed1ec ("Merge branch 'arm/dt' into for-next")

I added the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 12 Oct 2021 10:37:29 +1100
Subject: [PATCH] merge fix for missing semicolon

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/boot/dts/sama7g5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama7g5.dtsi b/arch/arm/boot/dts/sama7g5.dtsi
index efcaa6ad7533..f98977f3980d 100644
--- a/arch/arm/boot/dts/sama7g5.dtsi
+++ b/arch/arm/boot/dts/sama7g5.dtsi
@@ -162,7 +162,7 @@ ps_wdt: watchdog@e001d180 {
 		chipid@e0020000 {
 			compatible =3D "microchip,sama7g5-chipid";
 			reg =3D <0xe0020000 0x8>;
-		}
+		};
=20
 		adc: adc@e1000000 {
 			compatible =3D "microchip,sama7g5-adc";
--=20
2.33.0

--=20
Cheers,
Stephen Rothwell

--Sig_/yWm6qW9lQrkde2DvXwd8lWO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFk0L4ACgkQAVBC80lX
0GzT6QgAlUmVQ8R7OjNvAHceuRUQ4TbMvp9oH1d9FRi+PipBaEPAb7zpzqkbngJo
hgWEl1PI7ALiUAj8KatvtJc0nrH2bnC6eco14lpdp0udE3J48Ev4foBUkvbf7vRo
LRgRS4LGAB0LrkGmFQSczOtp9M+R3D4izvBgeBVUrNFCS/3ag2da4QKVJe66NCZI
+RtNqkeEQn1ugtnUojkScoSdrZLRLPZMz7oSNA0/h8jVNKu06fKpZyPWzgi8Ghki
p03FEDLc5kGXC3n0f50vDNZNk0JsH1uRtGFY/+MEQIgYmk5JBGhaftbJxOB3K9kO
lI7H6yLpzwltDzrlRSPmWtbzWDTN8Q==
=9y4p
-----END PGP SIGNATURE-----

--Sig_/yWm6qW9lQrkde2DvXwd8lWO--
