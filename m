Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB54A2DB9F0
	for <lists+linux-next@lfdr.de>; Wed, 16 Dec 2020 05:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgLPEMO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Dec 2020 23:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725274AbgLPEMN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2020 23:12:13 -0500
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D10C0613D6;
        Tue, 15 Dec 2020 20:11:33 -0800 (PST)
Received: by mail-ot1-x344.google.com with SMTP id d8so21674605otq.6;
        Tue, 15 Dec 2020 20:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=27qOX8z8TmEFB0Hmv2U9No8zkA8PF5YKLMwZe/IGays=;
        b=a3v9sEUjccLMDUe6UWvIs0gDHVLLgnX59eewHe5Sn4bHlVlXloZBco27hk6VMiG9sY
         yuGOc8Z5oJdzwojy5CutpPvj2Wr2wcLLqs3oFYOPim5Dn3piGjZDR2Z6BB/A7dhymP6m
         yBalaZPlB18oYuMqJuY2AB3E4US4YrdVy7ZXGIaGSPFIAsuEFe8qy1kv1hvqOaR7vEKt
         VzZKkdBeGxT0zxkCfsWXcICcCVfqjA6c6CwfZC7vku6QE4FTts8qCoQc3yD3maot0H5W
         r0AbAzl2U0IVAqr14bl3bOJbKO+WY3LhTcU41mk/rpgp3DnPNHVnDfJfBwpFDacwV6il
         cdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=27qOX8z8TmEFB0Hmv2U9No8zkA8PF5YKLMwZe/IGays=;
        b=MNeLJs7Ia0aqTnUZtLfjAeX9b298o++JOL+uz89SQTUojMjGKAccNxAJyKibydcZ16
         PHjgpezJgPjOi6uszpi4IiHwObQxHuJ7pHslabVBnCYvfsdK4a7Jjj5FvGBhvFITUVAu
         B84/5XdWJtYjsvbXx7F2gj/4FloEUmdZcZoqytGxiQydgnUWF1xsi4UMvGlqhDcixymZ
         gvt0kO8yo2TNDY3dsU52T5HGwYbzcgFv0Ho+XVZ/YRUMKvWNv70S8VzIst9gz6RSzP4P
         jfP6T2BOi7MN3Nk5MducWn6whWbtbStencJFiXyV7CSvNlPcQkeDsTcSHBLmFR1Igm9R
         wikg==
X-Gm-Message-State: AOAM532CURJkYTIRxcIF8uaOZsUL9PJYTPkSqgSpekFNH7dchpRuEuqz
        FcNQ0mgat+hFV5CXNODDGqGvFipWlUY=
X-Google-Smtp-Source: ABdhPJw2tBHtuyuh99kwFQM8sZSwOXzbjlMON1OjZYtreDgZ5S+/LiG8Ylf1D6K920Vt4qyFD0rlYQ==
X-Received: by 2002:a05:6830:1be4:: with SMTP id k4mr24751686otb.271.1608091892898;
        Tue, 15 Dec 2020 20:11:32 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v123sm166461oie.20.2020.12.15.20.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 20:11:31 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: linux-next: build failure after merge of the watchdog tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wim Van Sebroeck <wim@iguana.be>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201214162129.79efb225@canb.auug.org.au>
 <81ec0eee-0f22-b8ad-5a71-1690d4c4ec27@roeck-us.net>
 <20201216135608.4e7a72e5@canb.auug.org.au>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <aa69afba-c9a8-0c64-d097-6b32c3f0a133@roeck-us.net>
Date:   Tue, 15 Dec 2020 20:11:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216135608.4e7a72e5@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pqY1Zvo5sFhRSv2Mae6uexEeqzeX7LCIh"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pqY1Zvo5sFhRSv2Mae6uexEeqzeX7LCIh
Content-Type: multipart/mixed; boundary="bNdeIeKVeLXOj1pnuurWHuf4tq7T4ipD7"

--bNdeIeKVeLXOj1pnuurWHuf4tq7T4ipD7
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12/15/20 6:56 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> On Sun, 13 Dec 2020 22:09:55 -0800 Guenter Roeck <linux@roeck-us.net> w=
rote:
>>
>> On 12/13/20 9:23 PM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the watchdog tree, today's linux-next build (x86_64
>>> allmodconfig) failed like this:
>>>
>>> In file included from include/linux/device.h:15,
>>>                  from include/linux/acpi.h:15,
>>>                  from drivers/watchdog/iTCO_wdt.c:48:
>>> drivers/watchdog/iTCO_wdt.c: In function 'iTCO_wdt_start':
>>> drivers/watchdog/iTCO_wdt.c:280:17: error: 'struct watchdog_device' h=
as no member named 'dev'
>>>   280 |   dev_err(wd_dev->dev, "failed to reset NO_REBOOT flag, reboo=
t disabled by hardware/BIOS\n");
>>>       |                 ^~ =20
>>
>> Yes, that should have been wd_dev->parent. Sorry I didn't notice that =
earlier.
>>
>> Guenter
>>
>>> include/linux/dev_printk.h:112:11: note: in definition of macro 'dev_=
err'
>>>   112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>>>       |           ^~~
>>>
>>> Caused by commit
>>>
>>>   9c612b338fdf ("watchdog: iTCO_wdt: use dev_*() instead of pr_*() fo=
r logging")
>>
>>> I have used the wtchdog tree from next-20201211 for today.
>=20
> I am still getting this build failure.
>=20
Yes, we'll have to wait for Wim to either drop the patch or fix it up.

Guenter



--bNdeIeKVeLXOj1pnuurWHuf4tq7T4ipD7--

--pqY1Zvo5sFhRSv2Mae6uexEeqzeX7LCIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl/ZiPEACgkQyx8mb86f
mYFbGRAAmEIEhvJGRYfxxTui/qWg0v2pVaqEGwt1uEPqzyF8RouKQzul9wAma2cB
b2qNCQagdMrTMyNK5zJ15998LdGTu9SBgOLgv/f8I6j7hZtgyqGCW71xDgRNnNdS
SKKuqhJy0GIBmijJUOgZuss3DPdXYWD/v+ddF/OkaTrVNUi1L15/DZx/aJUX7rwu
Xq/EcMNNPyyRL1z8mCsl97BEE+IfN4zxeFSDr1U4+sZmxMEEkvWjAtJWAKLUjeF3
kJienEinve4C7n5aa5DdTGlX32Pj+/hp7FjJ+KkLscLKQh7T3YLLbKqyFaLQIggB
Gsnzjr2ca8ROhIMfQ1HtzM6Kc+ERr7OVZ5hzNLd64sXwV1+rN+p7abjXd/GravrQ
vxHxCknPro6JvhtCvcCk5sbiKKmI6idWLT7tKqWjO8kX02s074BnAYZNRBreYSKX
++ssF8I7TvX6UUseIJiEevvGaozKHrUqQLnTQ2L19XdzTadJYtGkXqtVVINesQUG
cUcr1+3Vl1MYJOhfrmWcNXJT9YNFZd6CfMahyjXhAZ9io8aXTU5wUEkTRJGyKIGj
Ni6/0rlQ5Bw8POhJI6ZdpKZIA6nIyBNOV9Fq3c7j//4Cp/YvvZWBayQyP55H4V1D
5DYjiBiGDoxDySwfnKnquk6xiC2ZOCFU2qlVoZe81dzVbK9//no=
=MxmE
-----END PGP SIGNATURE-----

--pqY1Zvo5sFhRSv2Mae6uexEeqzeX7LCIh--
