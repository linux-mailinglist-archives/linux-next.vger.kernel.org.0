Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48E4F34E592
	for <lists+linux-next@lfdr.de>; Tue, 30 Mar 2021 12:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbhC3Kil (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Mar 2021 06:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229633AbhC3KiL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Mar 2021 06:38:11 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74ECBC061574;
        Tue, 30 Mar 2021 03:38:07 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id k25so16036190oic.4;
        Tue, 30 Mar 2021 03:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=tYI/A8xZFqfEL3vlEbiBDN0fqgPdkBzIVS2DT5ANUHA=;
        b=Xx08/QcfB2NYycui7+XTVsfSO38c4ecS/Cca0Nhaj5AACQLfktw3RVoOb2hoUMX+aO
         nvCS/JFt3PDpdeS1Puzf+Ahy3dnkvOPwBPNAvflYev1oYEyL3jTfbMFtlKNCHbMO269Z
         uJkpq7O92M4w8Z6eDXIT6C80MEJpUQE7GQGtsR8ZaYClKXjpq3ncOFQtkeyN9EF3zMLP
         xu8zVruDVgnG7RWXkgBm4mX0/j37w4OtnZTonFcg3rtQZK39tsiaCtHbKNkXYGT/SVkV
         tCRPiEwAs88Vcs7Q5BI3sdMiGXxZ6TFVG1ZBt+UrsMSqh4qDdMLg808AxQpNsKCONopy
         WZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=tYI/A8xZFqfEL3vlEbiBDN0fqgPdkBzIVS2DT5ANUHA=;
        b=UWKANdKoaK4taPUfSOoGpxJVLhprDZ6Hzv2qI6jpNv6Uno1ej+YfL9xo5BQUW6HUD6
         Sm/791KQY131z7WQL+6/RvErB6bu5Lgzt6y6TfEeJLYQJ3W97+k/3kI05Ug4DGbMfoqM
         yBenVaUelxtCvsaSrzJu8QR/ZCO4dWmlRRWqrWiSzdsR7yWnYAKcajVYRR5ineWw2bNy
         069rVXHQHASkicUFYgbq+F3VV6e3TWURBkR7Aino3kuT+7H8TQk4Vnf7LT6Ast3AyvK3
         CcREby0OoR/pWmmOiBKCkkVbN/VWPpkltNoO491cEyAQPmyynvthKYMLvKBJ5h53EulF
         bwZQ==
X-Gm-Message-State: AOAM531CAvhsYttYqNQlhcpulCDrT56XylYkEBbXrQAhdlKbl473RFQE
        t7NQInkauAlnxfPK+5bO/uQIvtFJtAE=
X-Google-Smtp-Source: ABdhPJy8kLundeuogKFR2GinrT13Yxlo9Ot1HtepJ3IXphPzlKL6nWjOQMCQvxUMLuT/T42XwIXBXA==
X-Received: by 2002:aca:35d4:: with SMTP id c203mr2739600oia.10.1617100686629;
        Tue, 30 Mar 2021 03:38:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r10sm5109717ots.33.2021.03.30.03.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 03:38:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210330182758.3a28068f@canb.auug.org.au>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <c53866f0-61e6-c9e4-eced-a9dd8fdc341b@roeck-us.net>
Date:   Tue, 30 Mar 2021 03:38:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210330182758.3a28068f@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="XI9gMVC9p2bEc04PmyHcAmbyd0gaac6Ks"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--XI9gMVC9p2bEc04PmyHcAmbyd0gaac6Ks
Content-Type: multipart/mixed; boundary="bQfBamDKWE6bSifB1IdRDY2Syw7hJL5Wp"

--bQfBamDKWE6bSifB1IdRDY2Syw7hJL5Wp
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/30/21 12:27 AM, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the hwmon-staging tree, today's linux-next build (htmldoc=
s)
> produced this warning:
>=20
> Documentation/hwmon/bpa-rs600.rst: WARNING: document isn't included in =
any toctree
>=20
> Introduced by commit
>=20
>   9a8210575cde ("hwmon: (pmbus) Add driver for BluTek BPA-RS600")
>=20
I fixed it up.

Thanks,
Guenter


--bQfBamDKWE6bSifB1IdRDY2Syw7hJL5Wp--

--XI9gMVC9p2bEc04PmyHcAmbyd0gaac6Ks
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEiHPvMQj9QTOCiqgVyx8mb86fmYEFAmBi/4wACgkQyx8mb86f
mYFn8w//bhS+iwAK5750XKzBME0lev+Lzpeq/prRMfSLBWFaetD/It6+K6LnR7JP
qMrxe0NErooi6px1yPLfKNabgfYx4mh+aXUz0tbVOjKh2bhwLCG1WjXzITYgHX64
NqOV2xXOgledWgrMLb6uYFNfZBT0yqw+DDPgGWrbTapwfdwAZQSqBgs8GbWU1J7w
A8/hc/nlz8/M52W+dHaxP2k/oBRGLYFIt43U8k8Hg89qqb+t8TjjH5vaxstNoM9w
9F06uMLbWle7gH/2TUSHZSEaTvg+6TAW3TA98v53McrJvIyu5JpNJeRNOlh7I628
jxojAN1W7B0Ch/cBx4hznW0uH7iSs/91EJbK9xpoqbAjee1uuEPCCNuBtFZUKHk/
QzsKMcHSEEz4/OlTvVFTJLMKbtI5g4kTRpJwcnbUs9/dX9xZ/Cse9VLejPZf7U1h
txAefHrTzSWZ8G9VA+PXwiedPH5vETJ/gM0JZ4jYIMa022WCi6CGdciYEfpRCTQ8
uNExfukvc6bZ487Fg5snKW0HhtX/qHWRSQmdeoEcIdbs17hkK29xVzH+3t3HacHg
hxJO+c3jlSM+bVbuQRO2+NGPFHeeMrJZqWICqO3ysVHbRZmsbb+Tkja1Wc33C5RH
LgxRPgwWJ19bx3V6tAZPiSgMXBumysGW3vn4mT/eWewxGJLxpW4=
=nY5h
-----END PGP SIGNATURE-----

--XI9gMVC9p2bEc04PmyHcAmbyd0gaac6Ks--
