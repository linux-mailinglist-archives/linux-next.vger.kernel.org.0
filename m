Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF902D9337
	for <lists+linux-next@lfdr.de>; Mon, 14 Dec 2020 07:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390472AbgLNGKj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 01:10:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727839AbgLNGKj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 01:10:39 -0500
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CACCC0613CF;
        Sun, 13 Dec 2020 22:09:59 -0800 (PST)
Received: by mail-oi1-x244.google.com with SMTP id x13so8999572oic.5;
        Sun, 13 Dec 2020 22:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=QNuR2gwSlNQbEYyM65WZspzacXSES4GUzqp0446hpog=;
        b=dU5tWF0vGqIdrS4VgHo7FnVa6c7ZwGbh1axlbEXCcYsn1XC/qrouph/OKc59L9thln
         lUKKMIwK90UQQPxWIDI5+/Ww/hUfTQn48HxtuiHb9gc9liJBqMewdATKXLcCSIEWSjAB
         hJRoaKn+nwaaH2/ZWL58vEm9nzUffweZYfwP2TOUS9NReyAz6O7TSyUtUizvaGlPf6Vk
         Txm9izX8u5Uk9MZgmOy4fDszctFgcTINyejjWac4qVOW75WRLEau9rBeB1RLIbMj0MXW
         2/r1PVbElv0fLygSE/JNVsKEEbQpaFhyx3B266WgVTa/gnG1UQ71T+fdVHKGcN9mXNwU
         MSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=QNuR2gwSlNQbEYyM65WZspzacXSES4GUzqp0446hpog=;
        b=YuBi6atALCwjZRZvw2Np40feANUK3WHK3yGDK8KGxzudbEF5Y+sPpjSPp33Q+wZ204
         nlYZwoa8Id8IRDO6gtdDsPUgDKXJwaSJh7M5XaOtgLxDwDY3+k50TdU/Ywc1WwOdzN2G
         IWDyyCS4aaJGshqkxi2U90FHdzsBG2GhC7JpsK82GezJ4PPr25HkPxtohjDFvudvM/m+
         m76NQuVCYzqTo70KkZP9qa0Mv/IPot8A+K5Ov+q5pFSaf61XPAbsrMRX/O8hiz1ge3zC
         TRAUssES8jNS5jBommJYNbKbvSXklAzhJXLU2oX8PhlnPX9+xTeSAab4AAk/epUQc9qU
         lD1Q==
X-Gm-Message-State: AOAM532VsBiplOMX18GzEWco2rj7vnNgCBMDXWh3REqcyDFMtEmtFGqS
        3GR6E3+nXIg4GrGuwsXnW2htcPRM0xw=
X-Google-Smtp-Source: ABdhPJyz+CpK8quKEqybPwlh8LLykus2TK9B0tiwexHbJEahuDAXH0ioW2pGRUpbeqFJlj7FoCtasQ==
X-Received: by 2002:aca:53d2:: with SMTP id h201mr17356045oib.168.1607926198419;
        Sun, 13 Dec 2020 22:09:58 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m22sm3764775otr.79.2020.12.13.22.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Dec 2020 22:09:57 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: linux-next: build failure after merge of the watchdog tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wim Van Sebroeck <wim@iguana.be>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20201214162129.79efb225@canb.auug.org.au>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <81ec0eee-0f22-b8ad-5a71-1690d4c4ec27@roeck-us.net>
Date:   Sun, 13 Dec 2020 22:09:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214162129.79efb225@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jg4RY4QE11R3Ep3xOMzv8D5H2iV3dLvpw"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jg4RY4QE11R3Ep3xOMzv8D5H2iV3dLvpw
Content-Type: multipart/mixed; boundary="lFgtxZsTu6UdKxezwWs2NcRvZH3txy9Ia"

--lFgtxZsTu6UdKxezwWs2NcRvZH3txy9Ia
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12/13/20 9:23 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the watchdog tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>=20
> In file included from include/linux/device.h:15,
>                  from include/linux/acpi.h:15,
>                  from drivers/watchdog/iTCO_wdt.c:48:
> drivers/watchdog/iTCO_wdt.c: In function 'iTCO_wdt_start':
> drivers/watchdog/iTCO_wdt.c:280:17: error: 'struct watchdog_device' has=
 no member named 'dev'
>   280 |   dev_err(wd_dev->dev, "failed to reset NO_REBOOT flag, reboot =
disabled by hardware/BIOS\n");
>       |                 ^~

Yes, that should have been wd_dev->parent. Sorry I didn't notice that ear=
lier.

Guenter

> include/linux/dev_printk.h:112:11: note: in definition of macro 'dev_er=
r'
>   112 |  _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |           ^~~
>=20
> Caused by commit
>=20
>   9c612b338fdf ("watchdog: iTCO_wdt: use dev_*() instead of pr_*() for =
logging")
>=20


> I have used the wtchdog tree from next-20201211 for today.
>=20



--lFgtxZsTu6UdKxezwWs2NcRvZH3txy9Ia--

--jg4RY4QE11R3Ep3xOMzv8D5H2iV3dLvpw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl/XAbMACgkQyx8mb86f
mYEukg/+I0U1XpGTo4+Cwzy5fqrUhV3eeBdztAMox2h6xPnPosQbDHZKwwprf22/
7yhJ1o6d631rrI2V2uIb6B3CWR+4mmIwYIyGw7jxHFg8SKdqjIM8OAfRCu6RI9xe
gSvVeJM8NcMQHLMr4ATi0zdc07wrzChXgG7vOPyAviOfjpjvbINU+x1SlEsf/f24
hnfj6wqDuwXPnOnH0VHxL360c2Ouial8KQIHS0RBXp/VjSHWIpDoXhn4E/D+seij
2p+u7bQRYF2kjhh0OlZnD4lCgx/keduplUsge+3jY5wit76p+PH8vk2VPIPR+ypm
WK0c9rdc5OfUwSqIQBlm+lFefz8+kLC5zs/6t1xcCosJ7cqpsp5gYpfPo1IR7UYx
c2afoA1eMmeCm/r6oJI+vTp/uIcwmF9cOYyDE3F3qoEW569F9CId/5VqUaicoKVy
8/ePuKA1nHOfj4vquN1KKS67BZjyqbKMlfrCrVHYDM4/Wk6gCwFwv+N0RC4xMCb8
1YWHusCCLhH5DK2twL+5YxDidxKJmev4fKdAyvQ8m50uHSrNXmN9MOLG25yZ4kFk
vLHTj5128w0UKAAIJ7+A1hAiLXkllS/T3uo3xd1U5WfQJSBrvphixOW7MAFjfuGR
Eos+UvVjvUFLlZtfOhxvxSVgzYTOK6WWV1mNQNyT0DFL0ZAo4Z4=
=5ZLA
-----END PGP SIGNATURE-----

--jg4RY4QE11R3Ep3xOMzv8D5H2iV3dLvpw--
