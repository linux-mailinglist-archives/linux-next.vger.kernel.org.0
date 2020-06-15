Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0031F8BDE
	for <lists+linux-next@lfdr.de>; Mon, 15 Jun 2020 02:18:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbgFOASj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 14 Jun 2020 20:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727954AbgFOASi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 14 Jun 2020 20:18:38 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5AC5C05BD43;
        Sun, 14 Jun 2020 17:18:37 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id s23so7058421pfh.7;
        Sun, 14 Jun 2020 17:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=HeRg0Ac+mHDReRJhAPUw4er+UUsg4sIRY6elmlIlPbo=;
        b=fXVFNnwf+iGDNV7IsoMtvEX9DL1qJ+bNadA54Zz4PjaHKiL91JukVdX8wXL858nj3k
         tCdcNS070Xkn9xigN3eqRJt2O8QYTrnhpK7MGCkclhW19NajZt3bRyXrWUDneI344kEI
         EVZa66/fri3drEeFXPjeFQhhVV8Zl47e+VmI7ZhuXku/xB7RXSJEQ4lQOqaunHEnl9r8
         ZjShz2mO5jxOsQFooUzDMO72Ng5oaaP/4DDAo2UUKKOgq+piSvOWEbojKcz41EQ4qn8l
         pMeYEbcSw9bH5FEBXnIR7uzOtiYRtJxRTiOKftK+qt5MoskHP4nB8u5d8KYglRQFrGtt
         t1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=HeRg0Ac+mHDReRJhAPUw4er+UUsg4sIRY6elmlIlPbo=;
        b=qW/gshSZ8aylGcdaON6le4vHnY0iGN34sQp8ZSTelA9LVUIs1hwdya805l0IjiOaJD
         NoveAES0nOF/INot6lz4mj9TXQUkceca5r5Rsp47ZGJzevh+tDdUh3dhIeGhN1a2xdGd
         Iwh2OMTJBO/ODbUTJt/c3reE9bBO1qJd+trozpyezuOcL2pmud/cegckkWs2bvSkCt9x
         /HghlJyyka+YJojQtl9BCbDAl9RE5cdBbHxL2WJMUO2uB9WkwQQ3YJLJC5ufRBK9SR5Q
         kdM/xxmqUA0K/OF1tQG2gwkgJb5xFxXzmOVkLOjNmGpGnYIh7H3LHYcZhEJOWHxtrhfO
         cYdA==
X-Gm-Message-State: AOAM531hiXbjgrx5RFEeonpmv3C9GQBLBzXjq2Ql9QN9lpWXIMsAu6AR
        Al4PNaJgfJrlHNDgkU0CnI4=
X-Google-Smtp-Source: ABdhPJxirjMauaoGrtyFgo1IklAOQSPk2qnbKfxxwgoKbD3hkPoPxDrjY9zXnDSyMxLTMhZicfTxtg==
X-Received: by 2002:aa7:9910:: with SMTP id z16mr20150568pff.53.1592180317301;
        Sun, 14 Jun 2020 17:18:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i7sm10164447pgr.86.2020.06.14.17.18.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2020 17:18:36 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commit in the hwmon-staging
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Manikandan Elumalai <manikandan.hcl.ers.epl@gmail.com>
References: <20200615080852.1aa4d860@canb.auug.org.au>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d8358bdc-f8cd-162e-261d-a756974b4e92@roeck-us.net>
Date:   Sun, 14 Jun 2020 17:18:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200615080852.1aa4d860@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Q8k3qnHMX9iMEdj8wzPGA682xitmwJID8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Q8k3qnHMX9iMEdj8wzPGA682xitmwJID8
Content-Type: multipart/mixed; boundary="KgaW2r8bK6bDRLqcsbEsgpZ34f0XkPlnF"

--KgaW2r8bK6bDRLqcsbEsgpZ34f0XkPlnF
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/14/20 3:08 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   3c1c958a118e ("hwmon: (adm1275) Enable adm1278 ADM1278_TEMP1_EN")
>=20
> is missing a Signed-off-by from its author.
>=20
Uuh, yes, I completely missed that. I'll drop the patch until/unless I ge=
t
a signed version.

Thanks for noticing.

Guenter



--KgaW2r8bK6bDRLqcsbEsgpZ34f0XkPlnF--

--Q8k3qnHMX9iMEdj8wzPGA682xitmwJID8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAl7mvlsACgkQyx8mb86f
mYEwXw//YL/mRS/+XIHL16lS71+5zK20GRqQgh8Sab6vCN+LlhBnhSf08DUu1Pwp
c6dPBsdvAwuMEY8rDPvpAEKtTpnotqZKnrhB9Mn913rqrEOsPcMELvhqfS7XSHe5
MaxlZQauZq6m4ynMgQmR66Ie/dMAT692dEWmnjnQrN37b9E5UwgNaymXTZg7sP0M
weOFxt3wRw65o0eHLsMeXpCJKz58qHUBITyHGfjKHDSdH0NhrU0sk4x7EHWWSQny
p0GmawxAVJkjp0m6stGKejufPHsv7rFDYR8tR78+BUeGDZU9r9/6N+IzxbGG2h7O
1qbA1kkel01V8jBuO7wNVCT5V4rTxxemES1tiD0GL5TwS+0lg1ymxHR9sD2yYUwM
JNQU1BoRFav30gtm0I/fgoUH78mzp70WZ7Yq1GwO694ykb4SfXfBkl2MnQ0gKwoD
sFCWmiqnn7Wwxf2VIZAQXR4irtg23+6N4R95k9UqR7bTg82/bjWuFeMJ0Pky36UX
Vu+sFTA1KGnX+670JeXSW55/5YU8t6eOcq6FFe1RnHKAPw/pR4WusOfLnO4X8J8a
UOYuJNkCrqGp7YIV0ocFsrXIRQ8odb5jBByZqmJEgLYfOgGt6rptpNaKPH4LlEpD
/hPWtosTmm5YsfwQ6Cbzmu4cIcHRfhNOtwdHLX1iSH8yK7poP0o=
=7dIo
-----END PGP SIGNATURE-----

--Q8k3qnHMX9iMEdj8wzPGA682xitmwJID8--
