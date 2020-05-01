Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3381C0E04
	for <lists+linux-next@lfdr.de>; Fri,  1 May 2020 08:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgEAG2U (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 May 2020 02:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728126AbgEAG2U (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2020 02:28:20 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C4DC035494;
        Thu, 30 Apr 2020 23:28:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 49D2PV2wdvz9sRY;
        Fri,  1 May 2020 16:28:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1588314495;
        bh=+6zGHVLBDm8OMq9izXUH0HEXdRVFmb+OdCmJ924v04I=;
        h=Date:From:To:Cc:Subject:From;
        b=oNTY4uf7TEa7GSv31yzyjr5i6Q2Ubjzyh208XR2cZQDjWmXMqihLr/Q8Vr265e3h8
         /AYPp1PKztiNH4R177WPSTAG6dw0Kg2/3Nfoed8OvlIRMnn6EFfA5OMD7m2jCCBYvI
         wgB2Pw70p2ATOxL8dPnSqECdxU07pFiRkkw11zH1pfk/s7fA24RHWibraiL4nQWAzn
         Mf2QLk+bYj2BSmu3wBaWt92H/kn88tEcH1gBeZ4MFFfdrTq0Af78pk/S8nBArSBwGv
         rAD+O6nunbZ9ReBFeVkFnIK3w74Q3Yx5X3EAh2UeSyDdhk0lqw8/ZyIO/z/8z9vQTj
         bKKVy4PXX6MKg==
Date:   Fri, 1 May 2020 16:28:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
Subject: linux-next: build warning after merge of the char-misc tree
Message-ID: <20200501162806.155c44ed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DQNGNWiRCxR3bIOK=SwcCK3";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/DQNGNWiRCxR3bIOK=SwcCK3
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the char-misc tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/crypto/xilinx/zynqmp-aes-gcm.c: In function 'zynqmp_handle_aes_req':
drivers/crypto/xilinx/zynqmp-aes-gcm.c:137:5: warning: 'status' may be used=
 uninitialized in this function [-Wmaybe-uninitialized]
  137 |  if (status) {
      |     ^
drivers/crypto/xilinx/zynqmp-aes-gcm.c:87:15: note: 'status' was declared h=
ere
   87 |  unsigned int status;
      |               ^~~~~~

Introduced by commit

  bc86f9c54616 ("firmware: xilinx: Remove eemi ops for aes engine")

--=20
Cheers,
Stephen Rothwell

--Sig_/DQNGNWiRCxR3bIOK=SwcCK3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl6rwXYACgkQAVBC80lX
0GwLpAgAmDVxisEwJNpj5crC7mj9fw/t3NGKhacau4tdRoUVeFfBVPtLeIyWE/TI
DZGlcU19lEi8qY777QxkjIBEvaRzpB1CDXTWxn6XB2xqyvFjGdYaJQRpIMpsOf/z
rGXd30meVdo8jDyj4SqfIZo5tnOYYZs0EBhys7hY09pPKNweT6bBoXpElW6FyRhh
Iaw67ykg6TQcDH+B3OvrxAEVf8ClGrIKgXn1UW2XynOZrFncnjVWv6DxGIBQi2Dm
5gNx/Fs+88yiDN2nWJiOkuiFx9IAmhQ+z2lAXgSBZEMcT1z+7A6m8xUKdrEXg3sG
4imutAhgxjjKO8riXZbIBbiS65toJQ==
=rYjJ
-----END PGP SIGNATURE-----

--Sig_/DQNGNWiRCxR3bIOK=SwcCK3--
