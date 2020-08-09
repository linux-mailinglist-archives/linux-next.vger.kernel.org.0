Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B741240045
	for <lists+linux-next@lfdr.de>; Mon, 10 Aug 2020 00:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgHIWVf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 9 Aug 2020 18:21:35 -0400
Received: from ozlabs.org ([203.11.71.1]:58919 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbgHIWVf (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 9 Aug 2020 18:21:35 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4BPtqG6GHrz9sTT;
        Mon, 10 Aug 2020 08:21:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1597011693;
        bh=v6D2lxNtiWgNxr32g/QMI0OKH/O0ynYoUjKZUya41Fw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=fWHyD700031bSyQm9Px0xCwiTJQXmlGB9v6Ob4FnMAXZeYyH0qV+6W0SOsALdHFOv
         dTLfTELR3EelwnRRDcGj6ZBakgSPqqH5Un6aXrOjnNauSuZ7e7l8T/A7vzVLWvHWt6
         EqU3FpIpzcexMDNszialVCkpAI70pPsGaaWzcyZs2HqbwRk7XdDIGnxH4NJW6xw3vq
         8ZvcGryxJwd86wWecfWPJI2Oa/PDeX1FVdr/ItZ5hIU/4q2b5PG8uTSdmbd+7FT7nM
         po2rPUNQR6tw0mVrMIPLBzBq+Yn+e7nqBaiYBU8Mk9rptkLG3R/2w7I4AwWlEVzp2Z
         flzQRwTOc8AdQ==
Date:   Mon, 10 Aug 2020 08:21:30 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the arm-soc tree
Message-ID: <20200810082130.5482ace2@canb.auug.org.au>
In-Reply-To: <20200723092717.0f90fd26@canb.auug.org.au>
References: <20200723092717.0f90fd26@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rvb57Z6GKGM6gwSOCQR+vDw";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/rvb57Z6GKGM6gwSOCQR+vDw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 23 Jul 2020 09:27:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> After merging the arm-soc tree, today's linux-next build (arm
> multi_v7_defconfig) produced these warnings:
>=20
> arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /soc/=
apb@d4000000/spi@d4037000: incorrect #address-cells for SPI bus
>   also defined at arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts:225.7-237.3
> arch/arm/boot/dts/mmp2.dtsi:472.23-480.6: Warning (spi_bus_bridge): /soc/=
apb@d4000000/spi@d4037000: incorrect #size-cells for SPI bus
>   also defined at arch/arm/boot/dts/mmp2-olpc-xo-1-75.dts:225.7-237.3
> arch/arm/boot/dts/mmp2-olpc-xo-1-75.dtb: Warning (spi_bus_reg): Failed pr=
erequisite 'spi_bus_bridge'

These warnings now appear in builds of Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/rvb57Z6GKGM6gwSOCQR+vDw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8wduoACgkQAVBC80lX
0GzsgAf+N5QWqeXQfh3gX5KCPzdumETqBV8W4xXawLW10ICD9VAjm2V6Xf7RQz6j
r5N5QtOjconpvFw19AyAVM3Jf9qkmL5Y4RmgR1V8VjOw7Hkm25TCsyXCYDa1OCD5
eHbp3KsKbg4wSl9oa/R8O5peWo4FtrsfmakomIobzt79W4gwODiLRaaAKEo3IVrX
CObtaknnQT+kP4ZeG3U85kmHORN03l8ATwUwzAHGjOg+u9p966xHzWCvYG1TZ5lv
J1WragAqOycsOC46x38cK0DM/pZ+3klKJOOPLDE3pUDPWUdtWpOJYr7oPDXApPq/
nkRAm5fT/ZixOcuj5ye9wFxOMIGw1g==
=Cq5g
-----END PGP SIGNATURE-----

--Sig_/rvb57Z6GKGM6gwSOCQR+vDw--
