Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797501BBEE3
	for <lists+linux-next@lfdr.de>; Tue, 28 Apr 2020 15:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgD1NTQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Apr 2020 09:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbgD1NTQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Apr 2020 09:19:16 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF8AC03C1A9;
        Tue, 28 Apr 2020 06:19:16 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d184so10679577pfd.4;
        Tue, 28 Apr 2020 06:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=9V8NGb4AZ2RYw4Pj3bOqh3h9Qct8iU5udnsWWNp45qk=;
        b=MB+/7DZ5GSHml6jVwN8/DERad6OKJ63v6w4l3BSwSR6N1WTV6m0b9eyAYm8yMOint3
         j2WLUUuEBvZ4oyvK6NYKg3mAZarOC0x2GORFtjvGsg8zZjgJZv8kPtMfS0fPxNfyFq0+
         px7WcgAX0tfVSHOCCGr63VPIStK41b0g6VtxwdwtzvlAPTyMqFXVHXNqmE5mo8uS/glw
         uH/BgsePXW8yfb3tQTbztGfHxGP6JQnAH/kZOBea5sF0ktg40pz9Df1m9PdJjwa/y344
         r6MdKkShuMukgc1NpdOlzydojqQV1CLFAJPzntEU9W82do+Z++4Bo60fH/YoFJOa7QAy
         YCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=9V8NGb4AZ2RYw4Pj3bOqh3h9Qct8iU5udnsWWNp45qk=;
        b=rrO7MVFCDPYX5akpIHCcNbt9Dh8asRMFuth86XKO3EkL/hHWMYiMj75qCaZ8ZvTynl
         eyGFKnYmzzkWj6Kd+xaBH42teUguWsuZMK++0zLL/RhfAqMjlNkGqloD5zPhwG/cyMWc
         x9YW8YE0T/gmCRXyqjCcv6hgfIVcRqMi2Uj65MgP70nWJ1/tMFFniglSSB4+dIH2XjAt
         G+J4cFGp7RWHyQDEc1kB2RsJMB/9EV1kKf+dZQPI9x1Do0BuXewOpRQ+XpRbSAbc9Spy
         uaIZateDEDTpAkYq5qGEhHE1BqiDH9YmFix8lJOCG+JlSgkzU51+vRgw3sPSPc9m2Mgh
         OYOA==
X-Gm-Message-State: AGi0Pub/1cGA037Ajl/F435y0IF1i6XvFqrPXOR0CBG5oPtdTm8b4VI9
        ri3S/bp1nekmfKrqUwIyWu4=
X-Google-Smtp-Source: APiQypJ6QoKIe/yDx/vlNHJTxE8wVE2LTUlsxM7nsYnXYHvG/46XI/kQkRhdM19oaeyK89tjgKdp8g==
X-Received: by 2002:aa7:83c8:: with SMTP id j8mr17436552pfn.272.1588079955648;
        Tue, 28 Apr 2020 06:19:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e2sm2141037pjt.2.2020.04.28.06.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 06:19:14 -0700 (PDT)
Subject: Re: linux-next: build failure after merge of the hwmon-staging tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrej Picej <andpicej@gmail.com>
References: <20200428163655.28eeeae0@canb.auug.org.au>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9ff86023-9ee1-23d8-1d84-4bb7b984d6a1@roeck-us.net>
Date:   Tue, 28 Apr 2020 06:19:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428163655.28eeeae0@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yPjthReYaDvY0QJpa80gNltCeyxym1HMw"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yPjthReYaDvY0QJpa80gNltCeyxym1HMw
Content-Type: multipart/mixed; boundary="w6zyBSBrSZMhh3lT77tDjdtsIaoplyuvn"

--w6zyBSBrSZMhh3lT77tDjdtsIaoplyuvn
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 4/27/20 11:36 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the hwmon-staging tree, today's linux-next build (powerpc=

> allyesconfig) failed like this:
>=20
> drivers/hwmon/lm70.c: In function 'lm70_probe':
> drivers/hwmon/lm70.c:186:34: error: 'lm70_acpi_ids' undeclared (first u=
se in this function); did you mean 'lm70_of_ids'?
>   186 |   acpi_match =3D acpi_match_device(lm70_acpi_ids, &spi->dev);
>       |                                  ^~~~~~~~~~~~~
>       |                                  lm70_of_ids
>=20
> Caused by commit
>=20
>   02b925a9104d ("hwmon: (lm70) Add support for ACPI")
>=20
> CONFIG_ACPI is not set.
>=20
> I have reverted that commit for today.
>=20

I fixed it up. And I'll have to add test builds with CONFIG_ACPI=3Dn.

Guenter


--w6zyBSBrSZMhh3lT77tDjdtsIaoplyuvn--

--yPjthReYaDvY0QJpa80gNltCeyxym1HMw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl6oLVEACgkQyx8mb86f
mYE9HxAAlINbNCK068e99lAVH3Uv2RTjA3nId0/EeXTfoVbGeAlVfxIk/mwtg1g/
QXy48fb2NMfDqQyfTz1cIUpwC75zhfSuCW/Dmy4I5ZyBGafkEAeS6qNwzAgTvdlV
Cm4kPzBwFDenAl054qdFo8PtSwmyl+RO6EzBwiAqjlD0jG783B2ug/GqXK4HYv+u
vwoxrpBXYtBK7b5s7uuw7lrxGzbcKyAk90Aa2VvbremOWDg0cIrbgeMqH0EyFxe0
TRmfyrHAeKJ68oVozvIirgxWJFoq3viAvTYiw4jAfEjAumXJ1dFevrsLL9WKCL7M
ypjITow/7lKV+HOneEC+r+5qPu4btQBdD5k8vYVJU9ngqdspSX13diRoYZpMAsIk
DI8cQZ3cHVCpuYV2fs/YSxAxcg1rldfUdAW59sYgUm8MPoR2u1GcJiatE7hzgDwT
+LxU1oYqRYBie8Z3sd79fYlO24rqqbqf1ZmaS0kvi5z+iEjBz7RnpsyPHfzb/K8H
h7b3j80AW1PtBzsJmxIK6xReFrHvm8RrxQcwXTmVGNwkpuQFZnkFTGDqATErSP5A
B4qdThxHr67kuJTgIFhRZQn70aUeTDU8RjFAh89MJ9jB/YXwpuNqd/7cRVDYzd7n
6QaEQNkOTUknSvfFIMpUftRXiekGkP48Eof45+J9OJQHMuwwgfs=
=aaJD
-----END PGP SIGNATURE-----

--yPjthReYaDvY0QJpa80gNltCeyxym1HMw--
