Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A3A24F2E3
	for <lists+linux-next@lfdr.de>; Mon, 24 Aug 2020 09:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725850AbgHXHBy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Aug 2020 03:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgHXHBw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Aug 2020 03:01:52 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4E1C061573;
        Mon, 24 Aug 2020 00:01:52 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id p37so4121556pgl.3;
        Mon, 24 Aug 2020 00:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=0zrV+CngMOhoULdpw/C/2MOfxZLOIh5Q40JHaANvzKE=;
        b=Emngsf7uI/mwcI/x1V+pb/qwNVd8PuBgm1QYQU3Y6qPKeAwtd22GOSE9OJfQdajGWV
         iQwaaXBWyej2k2tTn0V9kVCS0q+Hg5pPoFl80y8/GYd4ZPBppfTl93lFVqqh00+2gNLP
         hYk/4/wD2dzP1oHDZy4plLdc+uKfLDqB1+1Hr31pbpKOStimR43YcKbgtN+1R46HHM6x
         6de8akFHe8JwTjHKTIUrzjCI6320CarAMAdkKZmvRRKejduMBbbZ+DQfDS9XPrfa5sjs
         UARXEcLVxpdC2Dfui3p46OQbFf2LklyItTpqZDa5+el0alad8+ySFp2vAPviVm7OsDVP
         KfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=0zrV+CngMOhoULdpw/C/2MOfxZLOIh5Q40JHaANvzKE=;
        b=dqGLeBg511ou5SR01LITTcJh6ayU9f1a78Y/lhFPP9OvuMnRzV628IfQzFH6iDvDl+
         E2Sd7jO78i/0utzI+khHvsBKG9mAWBPme1Z6i7IJeLdV80cEv+WVmRbPF+EQSFOTbsvu
         waJNrvn46Yo4bVnO75QVvTTOMuCOlzs0RwDFKkvNtDQfWm4P2eqyD3P4SgKMy4CQHBEt
         JKxGs9le0uZFegMWbeIplHQCXwJOIVEfPBCb86cMh0wWzN9O78K1XvvjSgJURTMW6yFp
         WHqboqPLX3KNXmwQswx42D+7asZYj2o2TBSxZ6PLY6/YSO7BxowBtB79upmG6C7/835U
         tqog==
X-Gm-Message-State: AOAM533r2Aw2AnLqFtsMzXa1U0krpegA39ora1rCDPykvgt7PtpN9hw6
        6aj14eBonTtyjAyRqHXW6mM=
X-Google-Smtp-Source: ABdhPJzjfI/8BrR22q4cvETsVuCnk7AMqOjuVfibV6FoP6omGJgWAutyVPLt8b9ZQphvgSa7eciqHw==
X-Received: by 2002:aa7:9f92:: with SMTP id z18mr3153579pfr.260.1598252511953;
        Mon, 24 Aug 2020 00:01:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o38sm8506730pgb.38.2020.08.24.00.01.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 00:01:50 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the hwmon-staging tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Kitt <steve@sk2.org>,
        Alexandru Tachici <alexandru.tachici@analog.com>
References: <20200824102858.5554a2b2@canb.auug.org.au>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <3c308474-932d-a800-fc65-5d8e412cfa2f@roeck-us.net>
Date:   Mon, 24 Aug 2020 00:01:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824102858.5554a2b2@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="V1pIFd9W2l3G2AuVUZfwNfMyUYLDg2sDz"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--V1pIFd9W2l3G2AuVUZfwNfMyUYLDg2sDz
Content-Type: multipart/mixed; boundary="8IOyuIs8tBuUOaiqDTZ5ujYsv8eDUC8mX"

--8IOyuIs8tBuUOaiqDTZ5ujYsv8eDUC8mX
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/23/20 5:28 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the hwmon-staging tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> drivers/hwmon/pmbus/adm1266.c: In function 'adm1266_probe':
> drivers/hwmon/pmbus/adm1266.c:478:31: error: passing argument 2 of 'pmb=
us_do_probe' from incompatible pointer type [-Werror=3Dincompatible-point=
er-types]
>   478 |  ret =3D pmbus_do_probe(client, id, &data->info);
>       |                               ^~
>       |                               |
>       |                               const struct i2c_device_id *
> In file included from drivers/hwmon/pmbus/adm1266.c:20:
> drivers/hwmon/pmbus/pmbus.h:492:73: note: expected 'struct pmbus_driver=
_info *' but argument is of type 'const struct i2c_device_id *'
>   492 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driv=
er_info *info);
>       |                                               ~~~~~~~~~~~~~~~~~=
~~~~~~~~~^~~~
> drivers/hwmon/pmbus/adm1266.c:478:8: error: too many arguments to funct=
ion 'pmbus_do_probe'
>   478 |  ret =3D pmbus_do_probe(client, id, &data->info);
>       |        ^~~~~~~~~~~~~~
> In file included from drivers/hwmon/pmbus/adm1266.c:20:
> drivers/hwmon/pmbus/pmbus.h:492:5: note: declared here
>   492 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driv=
er_info *info);
>       |     ^~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
>=20
> Caused by commit
>=20
>   9832ecffd8f8 ("hwmon: (pmbus) Add support for ADM1266")
>=20
> interacting with commit
>=20
>   d46dc459db38 ("hwmon (pmbus) use simple i2c probe function")
>=20
> I have used the hwmon-staging tree from next-20200821 for today.
>=20

Fixed. Sorry for the trouble.

Guenter


--8IOyuIs8tBuUOaiqDTZ5ujYsv8eDUC8mX--

--V1pIFd9W2l3G2AuVUZfwNfMyUYLDg2sDz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl9DZd0ACgkQyx8mb86f
mYFrhA//Z8xz0+JuNoGIUlrazcN5bDvFscvYxnrqVPyDVlu8a+BlN8EGqduJVd9X
ZwpiWdOy4MbmzvdHGWncwi4pb9PoFGpr/IABo3Z0XL1YOoEq6WfuQrL+HQ7hh5Z8
vmY/t37+uWtqHQgThjuKAlHmOM7km/qkj8MXYv3mpjZ9ANlrTSpPMDOo3FJS/whY
f9oV0EgtDhRzc39sYWTgBrvbhyaF4GbRR2Lpbn69REB5ti8IhNaQRHS4039NVhmy
Y+2hRSnHFqAM6FVIphE8i50YHYVkP8pwbFDVma4AuuQ6kmGKAkc9nXicQ9ITgoJT
AaLoOZV405VQmlTYSTwF+BQRgPGogluFGEXzrW8/LHo9IQCAUCh/cNwXSQq/4mkT
0Xxerwr8F2BKsFVT4/ybrScHUq3aruRW4n1a7JyhW7Ul8cKBQndMVSMq+pkhMAAa
Sz9LSGhCQEsmO93CTLvj2Wf1KRbYlkfTskFl5P372dECAPnyXBXUkVjUPf9tFB9L
s4WpnOk8g2W313v+2rABvCCW4TVpDko8ST50mBCrMxNPrCnCCQlQaBLAMOOw7V8P
KRSeGCQkqVCNrTZH8irmdHyDyVkJt3t5SOvX7q2GZb3XUffauCl3C3xoWboD4CRP
WsOGA1b5g0tuq8yfg8+pPrDO79hV/wd6O750zB56XN3p/UZcGsc=
=KiuN
-----END PGP SIGNATURE-----

--V1pIFd9W2l3G2AuVUZfwNfMyUYLDg2sDz--
