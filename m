Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12AE511DB70
	for <lists+linux-next@lfdr.de>; Fri, 13 Dec 2019 02:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfLMBDL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Dec 2019 20:03:11 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:38898 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfLMBDL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Dec 2019 20:03:11 -0500
Received: by mail-wr1-f68.google.com with SMTP id y17so4780984wrh.5
        for <linux-next@vger.kernel.org>; Thu, 12 Dec 2019 17:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=Ge6D6KKpXmCkkH1g8AIzF5heK6DQXtvXVzAMLWr/zgo=;
        b=DZdizT6XU5lrg29AzW8QfhWGXplF4O4iVQ1bB5rcZcA2YqQ4BLoi4W83PouctsbPgL
         XKYIlNn2ZqEoHpdA+v0cEttCbTvHT1xXpsiooTeyq3VyDQoun7vGZufuWap1cg7RkoO6
         F3WJZGWZQ0b8rczbKQ18NtqMmtI6lRAgZSYSAjRKLKpL/wPU+uteBJ2fnDpekKIO/EVq
         VcSMPiq8VqXQyDQWWNTu/Uz6HuaCRhf3oxqBO5j7zHZseneaNFyTuy0DEbzPiKG76hK8
         6cL5O/bvGNH0z58tf6rLWdQgiG+KzXYkxCFo99zEFXkeCBHQymFnXVB4XKpE3apWlPuE
         R5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=Ge6D6KKpXmCkkH1g8AIzF5heK6DQXtvXVzAMLWr/zgo=;
        b=dTUtwg7M7YZb28zVY2SmegRgtZNpX9qeA7mMeZfMkO7CrauLqDehioLSRMn+MZIKYA
         kPWjYosTMbla7AKmGHLItnQkpcNdGNjP46o6Q5ktmFkZyljtKYprHEQo50/wYqGhb5qf
         dgYfs+vRg7LMkLe7aZMQ1WfjCL8EP1eI+aZBvcPo/X0FgrcgOQTWw+L2mtZW22J6iuZM
         KdtDO+C58l5Jmf4SKriM2fvwWKIhLhQtKcAnUqomtwkl5F8e2iuBcIOczgjUgsTy1ZrL
         Rc6KEYbmFL9uafLuqMrLQL1daWkTNSHu/h95wy7lGoywDPGiwjmhGPGahEx/yiOe/sMB
         Ygcw==
X-Gm-Message-State: APjAAAUV9d4xC/hl78q+Y7s3TjpRDLpCRpsMUsWjYwXWtkkV0ktu5b8R
        P7WfgMrTsuH/oNEFTOEXSMr3aw==
X-Google-Smtp-Source: APXvYqzlrxc+P6sBwB+qGrVRAmK26PNAOxlktfQl8w85J/rrmJiKnLKYb4c0uc+fSSoS0TFf/fAL8g==
X-Received: by 2002:a5d:6211:: with SMTP id y17mr9332004wru.344.1576198987797;
        Thu, 12 Dec 2019 17:03:07 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:7810:4d25:def1:739f? ([2a01:e34:ed2f:f020:7810:4d25:def1:739f])
        by smtp.googlemail.com with ESMTPSA id o7sm8086712wmc.41.2019.12.12.17.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 17:03:06 -0800 (PST)
Subject: Re: linux-next: build failure after merge of the thermal tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
References: <20191212095020.523c1fbd@canb.auug.org.au>
 <20191213091430.383a5f3b@canb.auug.org.au>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e792e206-6ed8-733c-bbba-55f5a0b52407@linaro.org>
Date:   Fri, 13 Dec 2019 02:03:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213091430.383a5f3b@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9a7IhTlD54ltQbh9wgPgj0HSpFqsRmIJY"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9a7IhTlD54ltQbh9wgPgj0HSpFqsRmIJY
Content-Type: multipart/mixed; boundary="6Y4h70V8cP1EGJVjF2SqZYNuuMRMzLWx4"

--6Y4h70V8cP1EGJVjF2SqZYNuuMRMzLWx4
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 12/12/2019 23:14, Stephen Rothwell wrote:
> Hi all,
>=20
> On Thu, 12 Dec 2019 09:50:20 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote:
>>
>> After merging the thermal tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/thermal/qoriq_thermal.c: In function 'qoriq_tmu_probe':
>> drivers/thermal/qoriq_thermal.c:247:20: error: 'SZ_4K' undeclared (fir=
st use in this function)
>>   247 |   .max_register  =3D SZ_4K,
>>       |                    ^~~~~
>>
>> Caused by commit
>>
>>   c98030e5440d ("thermal: qoriq: Convert driver to use regmap API")
>>
>> I have used the thermal tree from next-20191211 for today.
>=20
> Today, I applied the following patch instead:

Thanks for the fix, I'll fold it with the commit c98030e5440d in order
to recover the bisectability.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 13 Dec 2019 09:08:24 +1100
> Subject: [PATCH] thermal: qoriq: using SZ_4K requires linux/sizes.h
>=20
> Fixes: c98030e5440d ("thermal: qoriq: Convert driver to use regmap API"=
)
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/thermal/qoriq_thermal.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_th=
ermal.c
> index b75d34e07da5..874bc46e6c73 100644
> --- a/drivers/thermal/qoriq_thermal.c
> +++ b/drivers/thermal/qoriq_thermal.c
> @@ -10,6 +10,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/regmap.h>
> +#include <linux/sizes.h>
>  #include <linux/thermal.h>
> =20
>  #include "thermal_core.h"
>=20


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog



--6Y4h70V8cP1EGJVjF2SqZYNuuMRMzLWx4--

--9a7IhTlD54ltQbh9wgPgj0HSpFqsRmIJY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRuKdf4M92Gi9vqihve5qtOL396pgUCXfLjSQAKCRDe5qtOL396
plXwAP9kdndGKsyVl6uyAy69JdiN3duSpB/BNiW3Iga06VMRwwD5AXG95g+V1B2g
Lb+WWzSdfNcnHqo9qElLLMZISlBimgY=
=KxyE
-----END PGP SIGNATURE-----

--9a7IhTlD54ltQbh9wgPgj0HSpFqsRmIJY--
