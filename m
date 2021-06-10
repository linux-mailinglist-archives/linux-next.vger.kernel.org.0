Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F037A3A376A
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 00:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhFJWyO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 18:54:14 -0400
Received: from ozlabs.org ([203.11.71.1]:43921 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231133AbhFJWyN (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Jun 2021 18:54:13 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4G1K3y5GLtz9sVm;
        Fri, 11 Jun 2021 08:52:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1623365535;
        bh=iUWEZ+yzmix4qIkq6pvo8nFE4B65u9WJ5wdC3ysqTU4=;
        h=Date:From:To:Cc:Subject:From;
        b=dONJqGKltC4QPuKWYjytedZwVACExMkXcBdFqHb1SzXG8RruFlP8AITKGomasU3Oc
         w48gKXo+zK75eEP0CqN7mD3nlOxg8usReOmM4kGIn+C5K3gkPDvXkhXbADG8ewJAF1
         1CNru87r+YGiNPcLld9mnCjlspsLddzI74X2Ovyb3uQf2gt9cvUpDdkW5dmFUmI6Zl
         3lDUxBC26GYyFI02K7zZ2FWXLqrg4j1Wlfn6MVpK1CdCGS8dUUbo/kSe+umbLU3bCb
         IgeJuZrukRUQ3YXlGOrmjM8xeHL/n5S0SjZtPz6jof5qczEFjJHUtv1y9vi3x7xPJ5
         71gFXqvWFsmhA==
Date:   Fri, 11 Jun 2021 08:52:13 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>
Cc:     Joel Stanley <joel@jms.id.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the usb.current tree
Message-ID: <20210611085213.4c8379ca@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/C/meI_7/NtS6n458XN6cwGj";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/C/meI_7/NtS6n458XN6cwGj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the usb.current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arm-linux-gnueabi-ld: drivers/usb/gadget/udc/fsl_udc_core.o: in function `f=
sl_udc_remove':
fsl_udc_core.c:(.text+0xc88): undefined reference to `fsl_udc_clk_release'
arm-linux-gnueabi-ld: drivers/usb/gadget/udc/fsl_udc_core.o: in function `f=
sl_udc_probe':
fsl_udc_core.c:(.text+0x1c44): undefined reference to `fsl_udc_clk_init'
arm-linux-gnueabi-ld: fsl_udc_core.c:(.text+0x1dcc): undefined reference to=
 `fsl_udc_clk_finalize'
arm-linux-gnueabi-ld: fsl_udc_core.c:(.text+0x1fe8): undefined reference to=
 `fsl_udc_clk_release'

Caused by commit

  e0e8b6abe8c8 ("usb: gadget: fsl: Re-enable driver for ARM SoCs")

I have reverted that commit for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/C/meI_7/NtS6n458XN6cwGj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmDCl50ACgkQAVBC80lX
0Gy0cwgAi/DSAqgIEnKh7tudpLOYRw4eZAQkeOu4ecOAPb2CrNJy+gf3KHfKe1EJ
As63hNpUZJGTQMVlqFE44ji8lm+qwUdhhiX9B64soyCbO1YhTHniIC4siXH+yBaQ
t4qwBvc62lra1926LgYDJ/iOsB7BdIQNdfFNvbyd1YMlBs+GrB9jFwL4y8fXSvPn
Vg/Zz2rl6Bqaa0ACQnRfM5ArNubFzmUOpkZYyd/FDS17iNd9DojdYjXXoPnz+TY3
KxIsec4fu+GKDmVzdj1XQ4tZIG1QiW4fY9+AnJVYaKzg/euoRfO4WwLE5iOUYidX
a8qyYe1FkG5JeE6SwObRFxQUyrzygg==
=4Eqe
-----END PGP SIGNATURE-----

--Sig_/C/meI_7/NtS6n458XN6cwGj--
