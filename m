Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC926AD3EE
	for <lists+linux-next@lfdr.de>; Tue,  7 Mar 2023 02:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbjCGBcN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 6 Mar 2023 20:32:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjCGBcF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 6 Mar 2023 20:32:05 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71BBD5D456;
        Mon,  6 Mar 2023 17:31:20 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4PVyZt0Nmvz4xD5;
        Tue,  7 Mar 2023 12:31:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1678152678;
        bh=ywg8C2FgT2G2NSOznzujNR6UIlLOW0CYkEK4MbPbt/g=;
        h=Date:From:To:Cc:Subject:From;
        b=tuaCQRxlc87tf6H+6qFhd1GVwEA7KQCfmb5JkG9Tuo2Y+v8MaPLn5XIGxDhI2qFC/
         4bwxKZirIu6XN639zmIa1t1UieJIltNgrlHlg/KtRIQhiIFzmm+m1KnJq7b93j+CpO
         m4VaS2M45XVecfEU48j1PhHTUcyuBMav6o4I65LPe6wgA64Wm4mhF2s6G6VKKPT8ZG
         xIaAaihR7Gwm49WEoxp/tKO09Qkn0SLYXHpw6K4rQElkX4uvYtGPwOhprPUyUn56pY
         QI1F7fIPz4YW3kfIeWiCAFSf0JNhk1exphxLr8/gkD3dn6BzKXJX6RBX3T/ODpRGD2
         OXxqSwlYx9/QA==
Date:   Tue, 7 Mar 2023 12:31:16 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Johannes Schneider <johannes.schneider@leica-geosystems.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the imx-mxs tree
Message-ID: <20230307123116.5f511aea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/_+=hh.+urERihKyFulqKAFN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/_+=hh.+urERihKyFulqKAFN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the imx-mxs tree, today's linux-next build (arm64 defconfig)
failed like this:

Error: /home/sfr/next/next/arch/arm64/boot/dts/freescale/imx8mm-evkb.dts:22=
.2-7 syntax error
FATAL ERROR: Unable to parse input tree

Caused by commit

  c288f420e3c6 ("arm64: dts: imx8mm-evkb: add support for i.MX8MM-EVKB")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/_+=hh.+urERihKyFulqKAFN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmQGk+QACgkQAVBC80lX
0GxyRAgAm3q7vrXE5CVZibyW/C2KmdsreC3mp25plIU6/Kbl4X3tTo7hQsHwjlAc
Iw3j9NAd43yeHAXHwfBGN99TcAY1NV4BRd+iniSlotccZ5qUbtUOan/YTTOaaCeF
TPMy/mOYQACvb0RUeqdbdUg9Ail2iSHB90G5kvkkeGBZe1BGUBWBaXFY6L67j95t
foCv6n2ovrTJOMcxzfimc5yR1+WRIQfcUJgmHxLGj798Ft1Dw2YD9djX8EMSwHTM
ywSh5389eimX2bKksRDDEWTT59/Q4M0cYlVj8+Wby7MXbnGBUQc5RpaZOQkhmoID
swtL+mfH59ulQJzobDR4pHyJ+ap9mg==
=bn01
-----END PGP SIGNATURE-----

--Sig_/_+=hh.+urERihKyFulqKAFN--
