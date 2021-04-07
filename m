Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1733578AC
	for <lists+linux-next@lfdr.de>; Thu,  8 Apr 2021 01:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbhDGX4b (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Apr 2021 19:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhDGX4b (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Apr 2021 19:56:31 -0400
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE43C061760;
        Wed,  7 Apr 2021 16:56:19 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FG1WL4rwtz9sW5;
        Thu,  8 Apr 2021 09:56:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617839777;
        bh=MTgfTD37dIIpg7DZz7+hcC+ZtgH6yMpHA/avIuC/Zcw=;
        h=Date:From:To:Cc:Subject:From;
        b=oPH/IbQFnhcR0BrJDtqhNDMzw7vrERMsWfg4Ic4gK07Fe1QnuI0GCLaCqE1Ovl8G6
         m7SoXc3H4nytgfjiJJAPMGfGTvrM3bl/HM9nooK60xr0rD/NVSvH335nupb/nMrn1S
         ZmOUAJcQyXC5xSPS53ui2Dg0wJs6LQgfTc9j8xcGPu7/dp/3cyNWFkdZMOyR6lLan9
         ihgDmQ2PLwqKhDnutG/VqAodlaYqTjTiNShrJWlACRbpMAy9PmdcNiBt7h4ID9z8ES
         zz7Zl69q5yMuDHXy/ZhkABE5MFo47A0wFfOL4A1+OIQNxrD1Sd31n/+SdyrHYhS9op
         jrGctSy5j78Ww==
Date:   Thu, 8 Apr 2021 09:56:12 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the mvebu tree
Message-ID: <20210408095612.71e8c56e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.BZ40aP60LF.KgS6X1tV9Uo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/.BZ40aP60LF.KgS6X1tV9Uo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mvebu tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

arch/arm/boot/dts/armada-385-atl-x530.dts:171.14-199.4: Warning (spi_bus_re=
g): /soc/spi@10680/spi-flash@0: SPI bus unit address format error, expected=
 "1"

Introduced by commit

  c6dfc019c239 ("ARM: dts: mvebu: Add device tree for ATL-x530 Board")

--=20
Cheers,
Stephen Rothwell

--Sig_/.BZ40aP60LF.KgS6X1tV9Uo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBuRpwACgkQAVBC80lX
0GywnggAksjzjfhKSK9pbTfcCSBHWD/bM5mG1UsqBDi8sgfE/dk2PV+oDmivI7An
0PEs6jy6u7yaFEwGgfmD05VHOMH6aHs81Pqq7WSDYe78Oceekij73ZtL17Q192K9
Y8v0LhWW6h6N5Ydl6o2BFNMSOMAA7Bc/sOu8xvV84Zb+TlOKbe6A4DNTS9CwC+vc
U1tcUC/akpHPEa2Tn2qQHc4mpwP53c/LNnipx+mo+0UFjToQhRYThurhFXjrPDGY
bHdC+ou7A5sr4YusTfM1kx2IYggW7BkrFAZlXDvyWDYV683Dt3FLO5uCf/nvwe1p
JeJlUckewCwIHiMwPl4+wuDKxuVcZA==
=o4Ou
-----END PGP SIGNATURE-----

--Sig_/.BZ40aP60LF.KgS6X1tV9Uo--
