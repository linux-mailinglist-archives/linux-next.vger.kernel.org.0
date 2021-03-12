Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1C733847D
	for <lists+linux-next@lfdr.de>; Fri, 12 Mar 2021 04:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhCLDvC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Mar 2021 22:51:02 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:38669 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231925AbhCLDuu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Mar 2021 22:50:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DxX081kmqz9sVw;
        Fri, 12 Mar 2021 14:50:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1615521033;
        bh=IuC+2U3aNF87JM+VQTbvV7aYqweloasr8GYE9TO6TQQ=;
        h=Date:From:To:Cc:Subject:From;
        b=JACAYHhR9pGPgnN1ee3l5vmSbc4tMmrvcsZ5XQbrgejKyBZgCwXl1rKyILwNdo5k3
         FDGq4DApCcU7yG5kMvoH/Q3zDxwAjbiTXMTVc9SHvvFwK5uZXgQBGNZjNtSUhC9djM
         gmssOghsD3u/214kLVv5xpc0AX+Hg3/njaUwD9lU9NP9aZhgbDvOfFHEfKjwO5/TT4
         1P7t3T2eTpBYz8NY1jriM42/vzm8GHIxPoUrf0sZzBO/TCZGAJ4WwihsCEIydYtiEG
         YWHb6DTkuWKfpSb2x1byZA7NKRvXCoVtrY5vOD2tiQ6gwVERJA5f8ODEPjjRPK0ZLb
         loixXw6B6bucg==
Date:   Fri, 12 Mar 2021 14:50:31 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20210312145031.5df91293@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zivSj1oXugxEb1IXXtudw+G";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/zivSj1oXugxEb1IXXtudw+G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/ir36021.rst:34: WARNING: Malformed table.
No bottom table border found.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
curr1_label             "iin"
curr1_input             Measured input current
curr1_alarm             Input fault alarm

curr2_label             "iout1"
curr2_input             Measured output current
curr2_alarm             Output over-current alarm

in1_label               "vin"
in1_input               Measured input voltage
in1_alarm               Input under-voltage alarm

in2_label               "vout1"
in2_input               Measured output voltage
in2_alarm               Output over-voltage alarm

power1_label            "pin"
power1_input            Measured input power
power1_alarm            Input under-voltage alarm

power2_label            "pout1"
power2_input            Measured output power

temp1_input             Measured temperature
temp1_alarm             Temperature alarm

temp2_input             Measured other loop temperature
temp2_alarm             Temperature alarm

Caused by commit

  0be9fee30ff9 ("hwmon: (pmbus) Add driver for Infineon IR36021")

--=20
Cheers,
Stephen Rothwell

--Sig_/zivSj1oXugxEb1IXXtudw+G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmBK5QcACgkQAVBC80lX
0GyoNwf7BRekxOYHNxZE7vy9XHNfZ0VmSCiG97OC9t5wvBjSZdmfDMYAOVRIz62X
uyYLXjecIQwek1/M5SuBimfKIj1wx5LAxo+z8mFPzSD818vz3wZiVxdxDnPY+0si
F11vJgQJY12m6WUJKdCft9c2ZrRgXi9Jqn1lVOptlE+2C9R/Aahxep7SWJvrZ4GI
U8KDo/tuy3/rOCOZUEe+c4Vd9VJMP0h+KoCMt73miQDPC9uEFMC0UJ7xeO1RjVxQ
ze/KwwZJuamrDfvemNhcBUk+APvF4raOCbQ1oQba3zL9m/DwUXP5N1lTfT6uPJnA
XNbgcbvr8ejZ/YU88SQoSYnEEL3DvA==
=WYzS
-----END PGP SIGNATURE-----

--Sig_/zivSj1oXugxEb1IXXtudw+G--
