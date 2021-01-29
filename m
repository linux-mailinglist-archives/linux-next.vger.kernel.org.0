Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EAE308633
	for <lists+linux-next@lfdr.de>; Fri, 29 Jan 2021 08:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbhA2HFN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Jan 2021 02:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbhA2HFJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Jan 2021 02:05:09 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D513C0613ED;
        Thu, 28 Jan 2021 23:03:52 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4DRpGX1Mhgz9sSC;
        Fri, 29 Jan 2021 18:03:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1611903828;
        bh=M3esjzDBnaZfKGmyv0dzvJQsk2dW78rBUnb8P4/r6lA=;
        h=Date:From:To:Cc:Subject:From;
        b=W6JtCSX9csF2Z20DLl1hsSywZog3j/4vaikdl5adfJva9XBigLX2Hzj/KG1hAH6Ya
         Hz2VPnr+Zb9Fcz83UD1Rdge9uCkD4Xk1wkKXTkJPRGsTAFKw6Tv6s+6ACPUC994/8C
         lY2gtlwWNo22LTtdUB2Gqy64Tl1rz4L6Zlh33tOGscg5ETmRLHtjyXNY3Os3sXhF6A
         TjgNyicYY9g+CtAQQt+XitrXFi2Ul7dDrYsW/EZgRs5saNm1+kKMYtJ/ij4BgfTmga
         C/jy6dOz+4avq8Sm+RjzEfQ5fYP7zcGXKeYWAlu+fuXxDi2QB6S49qnpuHD71H5tg6
         yT8MHT31G1Y9Q==
Date:   Fri, 29 Jan 2021 18:03:46 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20210129180346.4ba597a2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sD4USp_sJaXjmjHrEOSj.ih";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/sD4USp_sJaXjmjHrEOSj.ih
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/max16601.rst:94: WARNING: Malformed table.
Text in column margin in table line 39.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
in1_label               "vin1"
in1_input               VCORE input voltage.
in1_alarm               Input voltage alarm.

in2_label               "vout1"
in2_input               VCORE output voltage.
in2_alarm               Output voltage alarm.

curr1_label             "iin1"
curr1_input             VCORE input current, derived from duty cycle and ou=
tput
                        current.
curr1_max               Maximum input current.
curr1_max_alarm         Current high alarm.

curr[P+2]_label         "iin1.P"
curr[P+2]_input         VCORE phase P input current.

curr[N+2]_label         "iin2"
curr[N+2]_input         VCORE input current, derived from sensor element.
                        'N' is the number of enabled/populated phases.

curr[N+3]_label         "iin3"
curr[N+3]_input         VSA input current.

curr[N+4]_label         "iout1"
curr[N+4]_input         VCORE output current.
curr[N+4]_crit          Critical output current.
curr[N+4]_crit_alarm    Output current critical alarm.
curr[N+4]_max           Maximum output current.
curr[N+4]_max_alarm     Output current high alarm.

curr[N+P+5]_label       "iout1.P"
curr[N+P+5]_input       VCORE phase P output current.

curr[2*N+5]_label       "iout3"
curr[2*N+5]_input       VSA output current.
curr[2*N+5]_highest     Historical maximum VSA output current.
curr[2*N+5]_reset_history
                        Write any value to reset curr21_highest.
curr[2*N+5]_crit        Critical output current.
curr[2*N+5]_crit_alarm  Output current critical alarm.
curr[2*N+5]_max         Maximum output current.
curr[2*N+5]_max_alarm   Output current high alarm.

power1_label            "pin1"
power1_input            Input power, derived from duty cycle and output cur=
rent.
power1_alarm            Input power alarm.

power2_label            "pin2"
power2_input            Input power, derived from input current sensor.

power3_label            "pout"
power3_input            Output power.

temp1_input             VCORE temperature.
temp1_crit              Critical high temperature.
temp1_crit_alarm        Chip temperature critical high alarm.
temp1_max               Maximum temperature.
temp1_max_alarm         Chip temperature high alarm.

temp2_input             TSENSE_0 temperature
temp3_input             TSENSE_1 temperature
temp4_input             TSENSE_2 temperature
temp5_input             TSENSE_3 temperature

temp6_input             VSA temperature.
temp6_crit              Critical high temperature.
temp6_crit_alarm        Chip temperature critical high alarm.
temp6_max               Maximum temperature.
temp6_max_alarm         Chip temperature high alarm.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

Introduced by commit

  90b0f71d62df ("hwmon: (pmbus/max16601) Determine and use number of popula=
ted phases")

--=20
Cheers,
Stephen Rothwell

--Sig_/sD4USp_sJaXjmjHrEOSj.ih
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmATs1IACgkQAVBC80lX
0GwXLAf+OUNnPmK1rmQJQm2+WvRjPfw0gnMWxP5J7/u0106zv7eUrQo8Qri11RAh
YBbcVE6Z12n9L1ZnceB8GVXf6p9o3rY3a4zieYaxdesbxN5fNIQecYGQ4FreGU9d
kxapULfeH+B1OJxbF8K0QULR3bqatdDXuFuFx0piWxE3xGAzHzCSMd8JAvzCrC9N
himQrEKvV+eo5vI+gUv00Z/eLfcARQMYTOMFBiFUOkXU2OsxnIAMCFE2CkFB5Spk
dvtQVFNHeiMG/qxe5KXPWkeJtKPmyrMECExq5Hzo5kH7VNoRPwUSJAY0J/tQAxhY
kisVRZiJWtQ+rV3aoaU2/Q+HkozIZw==
=4OTY
-----END PGP SIGNATURE-----

--Sig_/sD4USp_sJaXjmjHrEOSj.ih--
