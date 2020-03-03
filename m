Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA86176F1E
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 07:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726101AbgCCGHx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 01:07:53 -0500
Received: from ozlabs.org ([203.11.71.1]:37927 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725308AbgCCGHx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Mar 2020 01:07:53 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48Wml86YKlz9sQt;
        Tue,  3 Mar 2020 17:07:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1583215669;
        bh=htcy+sOuhkCDBX1e/hZ/ccmsRUY0G7nupbZ9Puci840=;
        h=Date:From:To:Cc:Subject:From;
        b=NIHrBVL9MKaD0sRw+Sz4SOxlS4sESWQhVIPzoXEhQq4GklShsWwSt4BSubLmZqB/w
         OnG8vcYxp7hXZJJWH26469iCzkkfG62PXoRuw4XyTIOErmB6z7jxpOczJWWGXmTJlg
         86oIBQ+ytPBrLtUW63HtlIr5UTnMt07exciUIwQL1aJKITEZIGJO8T1H/h325/y1g9
         Opb1AsGXPYBWEu7+FIm8D0ha/6eAXID5L1K6KGwPjST5W39hnIqm0xFXQvWAjW3ja6
         AniYL/deMT9wFY4EzO2HGQ5iT7EFRjqn18WZH9yQ9Wg8NfXHtrZkv707R5P1bXm90M
         Op5waCsJqoJDQ==
Date:   Tue, 3 Mar 2020 17:07:43 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>
Subject: linux-next: build failure after merge of the thermal tree
Message-ID: <20200303170743.44d4c271@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.ABKbg8wZUtRZQja565fPpo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.ABKbg8wZUtRZQja565fPpo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the thermal tree, today's linux-next build (powerpc
allyesconfig) failed like this:

ld: drivers/thermal/imx_sc_thermal.o: in function `.imx_sc_thermal_get_temp=
':
imx_sc_thermal.c:(.text.imx_sc_thermal_get_temp+0x68): undefined reference =
to `.imx_scu_call_rpc'
ld: drivers/thermal/imx_sc_thermal.o: in function `.imx_sc_thermal_probe':
imx_sc_thermal.c:(.text.imx_sc_thermal_probe+0x30): undefined reference to =
`.imx_scu_get_handle'

Caused by commit

  ed0843633fee ("thermal: imx_sc: add i.MX system controller thermal suppor=
t")

I have added the following patch for today.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 3 Mar 2020 16:52:49 +1100
Subject: [PATCH] thermal: imx_sc: remove COMPILE_TEST from IMX_SC_THERMAL

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/thermal/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
index 478eda79520d..f3f70503df04 100644
--- a/drivers/thermal/Kconfig
+++ b/drivers/thermal/Kconfig
@@ -254,7 +254,7 @@ config IMX_THERMAL
=20
 config IMX_SC_THERMAL
 	tristate "Temperature sensor driver for NXP i.MX SoCs with System Control=
ler"
-	depends on IMX_SCU || COMPILE_TEST
+	depends on IMX_SCU
 	depends on OF
 	help
 	  Support for Temperature Monitor (TEMPMON) found on NXP i.MX SoCs with

--=20
Cheers,
Stephen Rothwell

--Sig_/.ABKbg8wZUtRZQja565fPpo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5d9DAACgkQAVBC80lX
0GxXmgf+Lg/qmVO19QGPlidMSoWW/eWBPnSL+SDpdNt523xmYm/sYEQ/jdUy1G4w
rs36avTJUKxa4PShHjfeU+I2opMQPM6m0hxmcV1dWschxPZizMZidXJ3jDglp0VG
+6Ebvac1YByR8Yq6XExZAK0yk/wk0xoA9B7+4NAQWN4cQ0EABORfGikbz0t9wnTW
v92SP1lzR9P3utTeML/+ZqkDc7eVyeb+/trJalpEqtUyLiZre0pQPlGq7z/1ohM1
C4801Q1tfGtLMpsmoGRN7AkFjvYinOMRj2GH+LisO97qT/ztB8sfEw1XlYVOuTyI
KWyvdQ0YS94DWYIxNYUXq66CEEF+2A==
=bViJ
-----END PGP SIGNATURE-----

--Sig_/.ABKbg8wZUtRZQja565fPpo--
