Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3C84359049
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 01:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232800AbhDHXYi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 19:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhDHXYi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 19:24:38 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C4A9C061760;
        Thu,  8 Apr 2021 16:24:26 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4FGcm26ZC1z9sRR;
        Fri,  9 Apr 2021 09:24:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1617924263;
        bh=3F3p2L6weF/6tTdlNbk2a0HNQXSobvHpBRo2CIga39A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=pSp6IE5DtHK5GJoN7Lgn8qaAgnVDNsLjFT4H9PvWLZOvfPHG2Brl2tyWexFwdOoLC
         SIdE/aQC1RviuJgJm6gZ7WlDPWR/aTBvV6BTpfavAOYFPC3cu5+MkMSldADJSUfEMr
         ZAspEX1wk+i2wSMNnC6l1WZB+QPb9hzxP/0P6RjPd1kvmpjiMyWfOFOE2982OL7m5N
         jEq387sqi1YYJTRgyC+mw3uRT2fyDbuvdOrNMRkQ8KffauKt0yVAUvxU0xXQ4rCEnF
         VHn02hRY+ffJXTV8YsYd/y+PEAGvPxvJhF0ExG/MRXbtT5M3Jt92GzrsX1HnCEispf
         0FQQxvSBm5F3w==
Date:   Fri, 9 Apr 2021 09:24:17 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: build warning after merge of the mvebu tree
Message-ID: <20210409092417.36b22630@canb.auug.org.au>
In-Reply-To: <20210408095612.71e8c56e@canb.auug.org.au>
References: <20210408095612.71e8c56e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AqARpw3nz5goyADtfkTalj9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/AqARpw3nz5goyADtfkTalj9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 Apr 2021 09:56:12 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the mvebu tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>=20
> arch/arm/boot/dts/armada-385-atl-x530.dts:171.14-199.4: Warning (spi_bus_=
reg): /soc/spi@10680/spi-flash@0: SPI bus unit address format error, expect=
ed "1"
>=20
> Introduced by commit
>=20
>   c6dfc019c239 ("ARM: dts: mvebu: Add device tree for ATL-x530 Board")

This is now a warning after the merge of the arm-soc tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/AqARpw3nz5goyADtfkTalj9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBvkKEACgkQAVBC80lX
0Gx1Rwf/ddxYMhbAkS44hyw4ExbloGAw5IMIUA9kLTORLT+HufiK7UzkLxEJNqL2
LoTn0nmT4TYwoEr9akvT9zgHrymdQailHUWtfJNhBSo7CfJx6skxhJ8BYThBmdIE
L0Dm5nTJ8CvmIv4LrHa6e5nuZhzjayQQPt24HAmmD5k5sGtppA0NfmHDq6+ppbYd
vQMaXAaXLrkDlVDM44Fl71xYXe9iML0Yh3k+3JprhdErpQPVAADTCYDtKXy74l6b
qEphtKY89zfZHfhbHgDKQj2f285i4tQIJxxHo379O93jDQOPcXJnqqvAf289C8b3
JB0havBPruIW5977F7kHDMkOc2InBw==
=ClRI
-----END PGP SIGNATURE-----

--Sig_/AqARpw3nz5goyADtfkTalj9--
