Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F20C176938
	for <lists+linux-next@lfdr.de>; Tue,  3 Mar 2020 01:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgCCARX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Mar 2020 19:17:23 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:41309 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgCCARX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Mar 2020 19:17:23 -0500
Received: by mail-wr1-f68.google.com with SMTP id v4so2111972wrs.8
        for <linux-next@vger.kernel.org>; Mon, 02 Mar 2020 16:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=GNrdUp5rMqCqZuTT3KubyD9ogYIPRzkkAJONI6Nj+Ds=;
        b=ZwID/TX56ENybqWy243ixFPkA0ytfBAGwhHhaXAf0o6nX+QNERRStB3XjpwUzSKBaD
         1BprUIYjGpXBdAhTCZ6yG/dc8TpZLImjRLgSN7wrXKnHDfeD/FQwAiba9e6sG5JCALpj
         XUx3KJP/fMEnnoiXU9pG5oRMOCWCncw8/wJlAqTHjO5wNyVGMYFkmJ3O5mgj+gRHrguR
         FEQMDot1JdVYWpF6KQ9GagmF/CYJF+0q6o3sMA8m78mzvs+W/SCLUksRe/IsS08H2rBb
         IBUuxbt4TPvJtglAA5FKaV1Sivokj078vIooHLTbZ+7anRN5WmKGnFwMIVOsGjYjAhFY
         nfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to;
        bh=GNrdUp5rMqCqZuTT3KubyD9ogYIPRzkkAJONI6Nj+Ds=;
        b=JLtFVhPo4vazStUIhyx/dDHIHH2okEgPujNCnaTa3iEFp3iewcvfE+OcNcW8sRQCGf
         ZyOEOUtVABzOJuHWiPZsbpG6zOHALyBxF4wLxgz6Wzc3bo0hzExvbTlBLFmlElUM/Unv
         ybbIkv95nneOR6F6lVroVZ48z7EGBMNycvDI0i5rIA927kMf4gyKMPp9bgy5f0+Xge16
         AWvO/xhignp5WA0wqQiMUoLkg4bL/g3/UEh4wBkjfizTR/vXCEvcDNaCycKodwMouyx0
         fbBw/xGYwJo9WD2Z6cW1AHcQxZVYvgdlMrUVOF4P3o5RCLN2DvE4F3BACJK0IUY9DLZx
         yyCA==
X-Gm-Message-State: ANhLgQ1rVYF6cMnZ1WeTphpTBSRgoquVytaPs1ME0XTAU1N9Z2X8BbK4
        LwQJ/crnEkVD3lo8Z6LpJSRFBw==
X-Google-Smtp-Source: ADFU+vuvv7wqhAjBTMQ3+IA86c2WAI22mK8WypSok+8fuaKlNXOjF8aPv8ZYM+F5ZDsTszmHYjHdeQ==
X-Received: by 2002:adf:ee4c:: with SMTP id w12mr1917929wro.310.1583194640534;
        Mon, 02 Mar 2020 16:17:20 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:995:2d3a:cb24:4f79? ([2a01:e34:ed2f:f020:995:2d3a:cb24:4f79])
        by smtp.googlemail.com with ESMTPSA id e1sm16146115wrx.90.2020.03.02.16.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2020 16:17:19 -0800 (PST)
Subject: Re: linux-next: build warning after merge of the thermal tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Anson Huang <Anson.Huang@nxp.com>
References: <20200303104223.73222b9f@canb.auug.org.au>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Autocrypt: addr=daniel.lezcano@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1459d133-3e6d-0152-60b9-baf9510e3ad7@linaro.org>
Date:   Tue, 3 Mar 2020 01:17:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200303104223.73222b9f@canb.auug.org.au>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BwVWPmqI1h99r6hZLtEjs3WB6rClIFLFG"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BwVWPmqI1h99r6hZLtEjs3WB6rClIFLFG
Content-Type: multipart/mixed; boundary="PXKy1X4KpXInVq8HalPwq72Tr00OcnLgx"

--PXKy1X4KpXInVq8HalPwq72Tr00OcnLgx
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 03/03/2020 00:42, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the thermal tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>=20
> In file included from drivers/hwmon/hwmon.c:22:
> include/linux/thermal.h:382:12: warning: 'thermal_zone_of_get_sensor_id=
' defined but not used [-Wunused-function]
>   382 | static int thermal_zone_of_get_sensor_id(struct device_node *tz=
_np,
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> and many more the same ...
>=20
> Introduced by commit
>=20
>   0629521dc9c9 ("thermal: of-thermal: add API for getting sensor ID fro=
m DT")
>=20
> Missing "inline" in the !defined(CONFIG_THERMAL_OF) update.

Fixed, thanks


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for A=
RM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog



--PXKy1X4KpXInVq8HalPwq72Tr00OcnLgx--

--BwVWPmqI1h99r6hZLtEjs3WB6rClIFLFG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRuKdf4M92Gi9vqihve5qtOL396pgUCXl2iDgAKCRDe5qtOL396
pvzzAQCL0gyIIeJoDtLplo2SXlzfD9hq+GcckrLMIFCYRNvu2AEAibAdAeAkqcsY
nG3HrzKddT9QCQkQAZgqhhlO5iBMKwM=
=mVyE
-----END PGP SIGNATURE-----

--BwVWPmqI1h99r6hZLtEjs3WB6rClIFLFG--
