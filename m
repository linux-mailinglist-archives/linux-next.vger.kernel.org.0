Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3450417708B
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 08:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbgCCHzr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Mar 2020 02:55:47 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38428 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgCCHzr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Mar 2020 02:55:47 -0500
Received: by mail-wm1-f65.google.com with SMTP id u9so1769387wml.3
        for <linux-next@vger.kernel.org>; Mon, 02 Mar 2020 23:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=w4O56Y1LaLfiO3fLlwz8LeMHX1Bjz7gkL9znIAGDUng=;
        b=x4rMocuOmM7MNgrE+6ds1uBnYxFvlXP7j4kyUDLyAPrDowr9xN6C024jq5BBi6mXl0
         kCgVyuXNminmr6TLJmGeoA3LCunmKaWVvq4R3i3yL0hEz7A/ShXZwFQv9VpvBusOgga5
         H26ErvbTQQTRqkQCSLvaz+0ZKgoa8IsUOk9zzbk4IFzRM9eJd0txQG/XEei3vnJEnLEO
         +LGAZwLYsUkkWN63YFBMPRfvzszt/97eFmCuCWS9mCWFM2dCH85yULEB8Uy30HZ9hPfN
         bkn8za7aPAGFR2URZyRSkuPMnbJN7ALgDTeKkdZM5PSU+f5zZdCNM4exjcNL0ieBg7hO
         6mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=w4O56Y1LaLfiO3fLlwz8LeMHX1Bjz7gkL9znIAGDUng=;
        b=SgP7q1PibVU8wzlfBkRVm9Kw72moC3CETfmgmoII8e6i0JQa5JnQI1SLgvX7A1gldk
         r4yFxYIUyPvwy3z29BoUNPkoRbS0H2b80zYOeOPsm/iHlyrl/F/OpHka+K8CgidUDEGF
         AxsDHNGDEe/w2wpoLoDz2xIA40RtYuvNqfNRDqaxZevmWlosvkku/QOTmMSIYidc3op+
         FYS+VYJQi1L/SvT57So1pLdM69gKuOmK7/5PDqiAKV68jYdW7aqC1wvTVF1utCivr1A4
         KTOZqjLGfX9Ynz3IwILdP+aHk2xYvKxJFYeRiACBzoAE3MtzT7aPJ4w5Cg+4uCMxYyUY
         Q+Eg==
X-Gm-Message-State: ANhLgQ02jnk0HdfWWjduReDvQ+MGmMApqUC8e69AIPU/xFNuAyEj4qot
        SzwPBM3W9nzYmDykTjawr45Niw==
X-Google-Smtp-Source: ADFU+vsHiMRsDnfyifZ2rxH/UJ7+NFrbspVR3fJ83qUx4DzweOhHfG2ATFr/ugzOCOk502x300JGaw==
X-Received: by 2002:a05:600c:290e:: with SMTP id i14mr2854208wmd.24.1583222144698;
        Mon, 02 Mar 2020 23:55:44 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:995:2d3a:cb24:4f79? ([2a01:e34:ed2f:f020:995:2d3a:cb24:4f79])
        by smtp.googlemail.com with ESMTPSA id t10sm32766352wru.59.2020.03.02.23.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 23:55:44 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the thermal tree
To:     Eduardo Valentin <edubezval@gmail.com>,
        Anson Huang <Anson.Huang@nxp.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200303170743.44d4c271@canb.auug.org.au>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <6cfd2958-dc6c-e9c5-af62-592d7706da6a@linaro.org>
Date:   Tue, 3 Mar 2020 08:55:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303170743.44d4c271@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="t3ktYlZuMwe9Zt4T1xlYTfqrmCiKBJclj"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--t3ktYlZuMwe9Zt4T1xlYTfqrmCiKBJclj
Content-Type: multipart/mixed; boundary="TC3QyXys5UBrXconu7zO8FdMNU6XM7FyR"

--TC3QyXys5UBrXconu7zO8FdMNU6XM7FyR
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


Hi Anson,

could be please fix those two errors (this one and the
thermal_zone_of_get_sensor_id)

Thanks

  -- Daniel

On 03/03/2020 07:07, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the thermal tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> ld: drivers/thermal/imx_sc_thermal.o: in function `.imx_sc_thermal_get_=
temp':
> imx_sc_thermal.c:(.text.imx_sc_thermal_get_temp+0x68): undefined refere=
nce to `.imx_scu_call_rpc'
> ld: drivers/thermal/imx_sc_thermal.o: in function `.imx_sc_thermal_prob=
e':
> imx_sc_thermal.c:(.text.imx_sc_thermal_probe+0x30): undefined reference=
 to `.imx_scu_get_handle'
>=20
> Caused by commit
>=20
>   ed0843633fee ("thermal: imx_sc: add i.MX system controller thermal su=
pport")
>=20
> I have added the following patch for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 3 Mar 2020 16:52:49 +1100
> Subject: [PATCH] thermal: imx_sc: remove COMPILE_TEST from IMX_SC_THERM=
AL
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/thermal/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 478eda79520d..f3f70503df04 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -254,7 +254,7 @@ config IMX_THERMAL
> =20
>  config IMX_SC_THERMAL
>  	tristate "Temperature sensor driver for NXP i.MX SoCs with System Con=
troller"
> -	depends on IMX_SCU || COMPILE_TEST
> +	depends on IMX_SCU
>  	depends on OF
>  	help
>  	  Support for Temperature Monitor (TEMPMON) found on NXP i.MX SoCs wi=
th
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog



--TC3QyXys5UBrXconu7zO8FdMNU6XM7FyR--

--t3ktYlZuMwe9Zt4T1xlYTfqrmCiKBJclj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRuKdf4M92Gi9vqihve5qtOL396pgUCXl4NfgAKCRDe5qtOL396
piAvAQDKDP7pwIlE2skW6Fyg1lsvi0snqOzLLSHu8eup3qjt5AEA5MATtwemmQnQ
++cbiAZySrH9773eWFl6oEi54QLOkAc=
=EOEs
-----END PGP SIGNATURE-----

--t3ktYlZuMwe9Zt4T1xlYTfqrmCiKBJclj--
