Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 974F9EF599
	for <lists+linux-next@lfdr.de>; Tue,  5 Nov 2019 07:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbfKEGoK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Nov 2019 01:44:10 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:60709 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725806AbfKEGoJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Nov 2019 01:44:09 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 476g9z1QDxz9s4Y;
        Tue,  5 Nov 2019 17:44:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1572936247;
        bh=b0Ga47Ax8Y7xOpExvAHWnQerxtk14hVpJtCTaaSDDT0=;
        h=Date:From:To:Cc:Subject:From;
        b=JQ7GzksH4pxkQ28viYzNjkvya4x8lSl+nADpxEWw0ohWXjmJQBxbU6RSvuR6dyV2h
         vYg6cizzoPxmVg2k5mhMcW65VfrKHT9kOqrK3T7fa/FOtD7Ol9brThOeGfLHey1XU1
         LV52FLDbKFklmu15VSvnQupPTHa3U2X01xXW+WHvMMm/Y1IomdiPtcjwjDgpapFVtT
         P5iARVlNDyIVwrA10EM5HQv/JqNXcvbVfOcSf0z2+dPUElq5Qd9eF1xdOKegKfTTOR
         92TRJd7IWw90/y+DGqoi+4fYOnQCTzLleenayafK2bl1GUEsjMVTj0xfkEUg9dHLC3
         PI2+zn/0bF1Xg==
Date:   Tue, 5 Nov 2019 17:43:59 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: linux-next: build warning after merge of the gpio tree
Message-ID: <20191105174359.01cb034f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/d+lfL/e60i29VWLFnTtazd+";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/d+lfL/e60i29VWLFnTtazd+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the gpio tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

WARNING: vmlinux.o(.data+0xbd3f4): Section mismatch in reference from the v=
ariable bcm_iproc_gpio_driver to the (unknown reference) .init.rodata:(unkn=
own)
The variable bcm_iproc_gpio_driver references
the (unknown reference) __initconst (unknown)
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

(and similar for x86_64 allmodconfig)

Introduced by commit

  6a41b6c5fc20 ("gpio: Add xgs-iproc driver")



--=20
Cheers,
Stephen Rothwell

--Sig_/d+lfL/e60i29VWLFnTtazd+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl3BGi8ACgkQAVBC80lX
0Gx/iAf8DYzvs4wW9xPgeiLqINADraZp4chlJa+kORO9W/C24CbmqOtHVLzDLgrc
35De+OPi2kS0K1ElPeicbrJBqB/GpXrUjzBICySnEI/9+hdz74V4A3BDrOHAHs0W
lToL72UpUBg11RSkHaZf2cuQ+e4AvkDCJ8jIsH30OAdpnX3r7qNQCl3M5aZCx6CU
rhOh0uZ5ebajbw8cSCzbVcFpWZlPWFtSTLxpL/hSurnd4E1sZHYQhnDXstkjmn+p
wssbckI+2yNlFNCfQDKWyWqqmWXTqzj4L9BcsBC18j/D7ehT333mXgq++nCj0FgS
dd/BXe05uO9/+j3Rbx1yEDo5E9ATvw==
=e7+3
-----END PGP SIGNATURE-----

--Sig_/d+lfL/e60i29VWLFnTtazd+--
