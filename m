Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED6B318ED56
	for <lists+linux-next@lfdr.de>; Mon, 23 Mar 2020 00:45:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgCVXpH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 22 Mar 2020 19:45:07 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41352 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726872AbgCVXpH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 22 Mar 2020 19:45:07 -0400
Received: by mail-pg1-f196.google.com with SMTP id b1so6222531pgm.8;
        Sun, 22 Mar 2020 16:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=sqzObIbIkBueTNMlSCGt3kSiTIsEDDoCPbQcgdiSsZ4=;
        b=dhP3Vv6I1CwnP8tht3rHRj/6HjsthJruA822FsEXfDjSpY4zDg8Y91d144uEs43E42
         3062T/h085TJEb976KBBoIghe1AvB5Ge6NZswZPnOBA53DCzXw/LVsCc+YK9JATRJPZS
         Oz3CriebTdxB+pHp5cCUzAmQGCYtH7n3ZmfZimAIs3x/ZV+Bf5/THx5MiZGmtoGT4DvI
         e9357YxsuLqiCSI8inH4G2F9h+gyvFTIVIQoCAt9ASdbmw5isO34bkURY+Rbgycywb3m
         zdkBLfgXPCoVZ58XRV8r+9XStJ5m3cfP2JLWWvDYkUPF13TZFnhmdYpclx2ok6HDuEKL
         aaww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=sqzObIbIkBueTNMlSCGt3kSiTIsEDDoCPbQcgdiSsZ4=;
        b=nee6XcEFFPedfwk0ixsUNG5BE/tHEQyAvg3CIzz4lErVShU1nxfDvxOO3xScMsrAN/
         yFnYZwe03JrTY1Lrwhqq7yr8zjBBVrif07j2M1g2oAcc5yucJFNzQahsgMPEvUs2tBG2
         L4M65zvB19c9S5DCTYJUwlBk/rWXw0JH3ewPdEMAjsprU4dObnq1IbPADmwTKLDrl5ZG
         wzKJ+WBjDGWkGK/MyTzBtdimsZftfTCe2qp0+Z89p7VLB4tekBdH5eNcle64O4UkL+km
         l+JAKP3f3c0bqHYgVNlsDsvL/b1LNiURhZNm4lLEBG6o2MUtnk9BtIABhKNFM160ZAv9
         /mjQ==
X-Gm-Message-State: ANhLgQ2OCDKDQvaVAQCMxGqJQqF/kiGUoS9TbTV27MvQq7f9rWVY0P2u
        GG0ffnkTyd7dEvwPZW6yT9Q=
X-Google-Smtp-Source: ADFU+vvqxSmhiaaPUVkXnwnBHaEIaLBQ3EccVygrN/7IGAelCaa5QCJCjb0Ef23ZNBAuvXsRtOzpJA==
X-Received: by 2002:a63:214c:: with SMTP id s12mr18719427pgm.296.1584920705610;
        Sun, 22 Mar 2020 16:45:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l1sm10715135pje.9.2020.03.22.16.45.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2020 16:45:04 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the hwmon-staging tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Grant Peltier <grantpeltier93@gmail.com>
References: <20200323103753.09474a57@canb.auug.org.au>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d49b3ff7-2150-e128-2d56-4330e4dc7f01@roeck-us.net>
Date:   Sun, 22 Mar 2020 16:45:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200323103753.09474a57@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="sBxJOQ45IfnqhGWLhtiQSBnbwSvt5yzcx"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--sBxJOQ45IfnqhGWLhtiQSBnbwSvt5yzcx
Content-Type: multipart/mixed; boundary="XadjSwFipHZ2aPXV4nzO38yA8TJpCQYV2"

--XadjSwFipHZ2aPXV4nzO38yA8TJpCQYV2
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/22/20 4:37 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the hwmon-staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/hwmon/pmbus/isl68137.c: In function 'raa_dmpvr2_read_word_data'=
:
> drivers/hwmon/pmbus/isl68137.c:125:9: error: too few arguments to funct=
ion 'pmbus_read_word_data'
>   125 |   ret =3D pmbus_read_word_data(client, page, RAA_DMPVR2_READ_VM=
ON);
>       |         ^~~~~~~~~~~~~~~~~~~~
> In file included from drivers/hwmon/pmbus/isl68137.c:19:
> drivers/hwmon/pmbus/pmbus.h:466:5: note: declared here
>   466 | int pmbus_read_word_data(struct i2c_client *client, int page, i=
nt phase,
>       |     ^~~~~~~~~~~~~~~~~~~~
> drivers/hwmon/pmbus/isl68137.c: In function 'isl68137_probe':
> drivers/hwmon/pmbus/isl68137.c:199:24: error: assignment to 'int (*)(st=
ruct i2c_client *, int,  int,  int)' from incompatible pointer type 'int =
(*)(struct i2c_client *, int,  int)' [-Werror=3Dincompatible-pointer-type=
s]
>   199 |   info->read_word_data =3D raa_dmpvr2_read_word_data;
>       |                        ^
> drivers/hwmon/pmbus/isl68137.c:203:24: error: assignment to 'int (*)(st=
ruct i2c_client *, int,  int,  int)' from incompatible pointer type 'int =
(*)(struct i2c_client *, int,  int)' [-Werror=3Dincompatible-pointer-type=
s]
>   203 |   info->read_word_data =3D raa_dmpvr2_read_word_data;
>       |                        ^
> drivers/hwmon/pmbus/isl68137.c:206:24: error: assignment to 'int (*)(st=
ruct i2c_client *, int,  int,  int)' from incompatible pointer type 'int =
(*)(struct i2c_client *, int,  int)' [-Werror=3Dincompatible-pointer-type=
s]
>   206 |   info->read_word_data =3D raa_dmpvr2_read_word_data;
>       |                        ^
> drivers/hwmon/pmbus/isl68137.c:216:24: error: assignment to 'int (*)(st=
ruct i2c_client *, int,  int,  int)' from incompatible pointer type 'int =
(*)(struct i2c_client *, int,  int)' [-Werror=3Dincompatible-pointer-type=
s]
>   216 |   info->read_word_data =3D raa_dmpvr2_read_word_data;
>       |                        ^
>=20
> Caused by commit
>=20
>   96c72647bc37 ("hwmon: (pmbus) add support for 2nd Gen Renesas digital=
 multiphase")
>=20

Weird, 0day reported build success. Or at least I thought so.
Anyway, fixed.

Guenter


--XadjSwFipHZ2aPXV4nzO38yA8TJpCQYV2--

--sBxJOQ45IfnqhGWLhtiQSBnbwSvt5yzcx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl53+H4ACgkQyx8mb86f
mYG3FA//eb+Jwk1Jy5bjg4Yc8ezzG/2CjihQuNqVgAGdMVncKUbBrTrV1Mx7PZ9l
5Rx0NCmZj+C6XHlCCt5+7olQTuiByR70DKTKlmn0+X2tlEp98QoiP8r+6G0qyxFb
aMF076RPNzwKqR78wJ8n4v7E9yIA1N6Z4Vjnpzgn3fkEV60occ79bh6YQQlO0Fsh
rX62kYK1CK9ob0Y8SQQzLf5b/boxW1zlWVYXZqnegjricPBDSN/lUiam719r/WD8
m91TO8jIIhP2Cl6Js8psEen/G2RSVzyJgFTjppUrlruzpABoBAg2q3jdQZ32lMsr
L2yVyG9N/xUABH1WfD8QzJISSy+yNiY6ZDYq+nMj9HKLp5E5a91fVyvesDvzyH63
ILWBiQreGMnQd51HLriwtmXDpum91SdNTHccA43HZoPk8DXDPBXVs1SbBoBnATNx
I2sNQfNt5h9WqiW4Jg4VgYfcxnKB9TBL5DBngmClhBN/VJclRk3g6H9e4Lodig2E
O0y2X/9oCJtOFZ4T33+skSyxTXS07gxZVeZRHCBLSKuGlft8qEbpkwssSuX3wIq+
UXKugqSW9dAbiJTpOlwXgGdUEcZkOFBdmJsBbDUTKCLOOPTpHoy6Gl+QBUp1OCvz
YA/OP3yaYg9KBaKr1ZAVunf+mqHdSwiqRF56Ur2PTk+LUdGqat0=
=uWZb
-----END PGP SIGNATURE-----

--sBxJOQ45IfnqhGWLhtiQSBnbwSvt5yzcx--
