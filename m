Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8BA2C7C2A
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 01:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgK3A4t (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Nov 2020 19:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgK3A4t (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Nov 2020 19:56:49 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD280C0613CF;
        Sun, 29 Nov 2020 16:56:08 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ckmxx258Wz9s0b;
        Mon, 30 Nov 2020 11:56:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1606697765;
        bh=36ET3LSHNwDNcj7GEXWe+H5SbuHJV6aJ/T7X7PISdg8=;
        h=Date:From:To:Cc:Subject:From;
        b=jok88u3nl97PK1qaTom9+Tr7uuexfA06qJrGKleZzj8IdiO00pyjGBb2vyc3n8Yci
         /FOSrtL6IlQe4D0OFoPEf102yyqh9s6Y4EXIJMI2bxltsxVt7/XuYfzC0e6YHfgZSn
         irHNO7r3bs1T0/cOnXc9ZmiRdPC7XNYbXUm8Njt2NzDECCAPDkfXMZ0z+yVZqlxOm/
         7y0mDt3HYcXdBXioc7sPlCBWpOEF2ufW898HGYYS34BebsNggKyt+FcF/nJnbuY5FU
         BleEmELthuAXpkytNHC59/dEXFi9a4KvftXfOZExJ/UNHbLNS40/4EWXzQpyE/jy+d
         36PYvIPqd4y7Q==
Date:   Mon, 30 Nov 2020 11:56:03 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Barker <pbarker@konsulko.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20201130115603.48e91a19@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ASlRxEQNmSMbvpUsBEAbTvS";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/ASlRxEQNmSMbvpUsBEAbTvS
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

drivers/hwmon/pwm-fan.c: In function 'pwm_fan_is_visible':
drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-Wunused-va=
riable]
  167 |  struct pwm_fan_ctx *ctx =3D (struct pwm_fan_ctx *)data;
      |                      ^~~

Introduced by commit

  439ed83acc19 ("hwmon: (pwm-fan) Convert to hwmon_device_register_with_inf=
o API")

--=20
Cheers,
Stephen Rothwell

--Sig_/ASlRxEQNmSMbvpUsBEAbTvS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/EQyMACgkQAVBC80lX
0GyzTwf/dizWLUoSMPAOiU1rousOP2XzIQzybegIrFncWJk+DLZ+evvokYf/F/dB
DeBLtfcazNS4Fd1IOT32QMMjT6wAVPtFdvBcLNRIX22NF8Kqh7DuTos8XhWh6Vho
NH0pxWJMCMpI1NxM8F5X8mHvJabPOAnWtx6nygsy/5h/XvfjhbxXatExQqiNpEFb
stCGRJogaejetcoeOBk9vX/fApRihC8rHL2vVrP4frvUtyfpBH6plDChUno0//ll
1HCmOEW1wPyjnHQI242k0lMSpZezVPG89hR+KAuQ8tLsnXJXSnLdhPZ4a9hVOfK+
5dcmtT63GiyPonyLSYnXEjZqlQtrug==
=FyTa
-----END PGP SIGNATURE-----

--Sig_/ASlRxEQNmSMbvpUsBEAbTvS--
