Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D32135BA32
	for <lists+linux-next@lfdr.de>; Mon, 12 Apr 2021 08:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhDLGkw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Apr 2021 02:40:52 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:59627 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbhDLGkw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Apr 2021 02:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618209635; x=1649745635;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZgOCHXIWSEncYqAx6Z17d6hDapptO+7l+x2XF00u1wE=;
  b=tYd3n2YtQzbBaE9+FJ1yzCleWP77Vfem56wvz1jOwxQw7IdFDe80coCJ
   CSorGc8DOeqegY6yJyIdM8Nv9zg8tYO4liIKADp+8h9JfM3DgT1pPzL0f
   fMdGMvYy18B27CThF/+7YcFspeWddZhxQVJTlzvQsnJSfuCmmJF9i81kX
   xnW+4ARuqtq8pF4Wz1dBVD7jjc4C0HewZVrmxmKhZXNMyy/7x+zcF0HB+
   ttl27S9OYE76bS39RCgab99gRVhaDZ0lDOL8vwS96u6xhm+eiLjY4XGUK
   3qyd8j/Dlt3nlDLVfKUhrprV3IBCX/xS0g5abk0gKu2TCBLl1C3SrXwm8
   A==;
IronPort-SDR: WeAEd0k98nU9pVhJW6DCwGyeJKn3K11l8bQgKqgcEHZKAadSTGh5qO4Rex7vumwx79llx5qIeW
 cgUpwNyeRvipdOjVTM+q+blKB7xuGwhWuIk8STlr3GW2q2bKoJ5ggZpjX3D0pJd2uAnzsJDpTz
 nzz3NuoBHj3tQugw+wA7dIL7tVnpWCuouI+SxGFcWw7FVtWdbk/WkCGDcew1c3oPihoPW8VAF9
 iKb016V/UjkWKTmb0yu3NNXfcPLQ16EKEd5u0aB5WjGUmsJZR516wre/1EKEFKTSfq6nFZVJgB
 62w=
X-IronPort-AV: E=Sophos;i="5.82,214,1613458800"; 
   d="scan'208";a="116635761"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2021 23:40:34 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sun, 11 Apr 2021 23:40:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Sun, 11 Apr 2021 23:40:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oGK5PC/5jWBYk+XUl9JsGhYgOqmcMp8VE50yyVxb0bC+o9qmW+fZvmH3cwg5vZvP0/qav2M8gm6GLYfTki+uHHp+RYRTp3ioXEcbgt0E3sinItf0+K0/2vNhereHkOMuJZDDDl93uJjwVrcGv22uBs+Dx+dxn212tUOc8In4r5Mu7PVgGimf8UWad6GNkifkd6ZBVVMq426+yf+PhY0QYOAtjTqGMZ1sEXwmKMx6rYK/9XH5jFmcy9yxwAEPcEkdn+U3KSEPFDKZK4LRqsS9MbAEhtUemAty4fV3k5M3gFX74QwUhM6In8iueQ31oltSedVl+WEF1SvT4HdZZXed3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ7Py8D9b1OfBpzH6k4Igoji4sE7m5EllITlIogsXcU=;
 b=C5JiKFl2F7NCS2fO112pIV8tJYwxjzSdXanPp/qoPoRzKWKWqj/nKqmjloXxREgcKw8CIINcZ3fyo3KZuq+FE6kwJhYTsDUAZTBUhlHkKbuUIeK2ItEysxvFvbmVQY4txPGJAu6f2p6yGg2iJnES1tmYJUZaLrUDo9fOXyE+fCkVqeIRdGv8r8sZujf2AxbQMwH47xf92K9QEyyifVsiajWNVFKi7HunilzyjI5IICfED8hhWRlG+qqLsdUozuVRTUAmXteyZf7Xz/dr5n2DlaDDraprQ16e17h6vFk5top4gETQL3Usl7rJp8KyPUr/1NKvtlVTl6yxYYtt5By3WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQ7Py8D9b1OfBpzH6k4Igoji4sE7m5EllITlIogsXcU=;
 b=TKbqsz1X/2YrtZPnmSud/Q5oADRyaKLduyHyrmfnc2nAdFWlwjimRSyfhVu6HVXmh1ktsObQIwR07op8snixZcLfgpQmjUS4PU0sf1qBQWASAZ3tX/tu06XeNkuCcXV6PYdAumuwSOPcN1KnuL89vaOT4cKUpcnwle0LUlZ1J2A=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4701.namprd11.prod.outlook.com (2603:10b6:806:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Mon, 12 Apr
 2021 06:40:33 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::49e5:8be7:95d:b6a9%4]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 06:40:33 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <sfr@canb.auug.org.au>, <linus.walleij@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the pinctrl tree
Thread-Topic: linux-next: Fixes tag needs some work in the pinctrl tree
Thread-Index: AQHXLyaIcdFR4d1r7EetPDmFk+uQ16qwbysA
Date:   Mon, 12 Apr 2021 06:40:33 +0000
Message-ID: <0ad4354d-3ff9-f1e6-dac5-d5aa83a95d57@microchip.com>
References: <20210412090026.3af852f3@canb.auug.org.au>
In-Reply-To: <20210412090026.3af852f3@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [79.115.63.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3630d6c8-acba-4cd2-30cb-08d8fd7ddf57
x-ms-traffictypediagnostic: SA0PR11MB4701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR11MB47011E23B64E5D772B9C15A2F0709@SA0PR11MB4701.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:58;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u1gb7+FadUzTPxLA1rBMR0YNqi5GPnIKOhAV2t+7S4U3+8YRnJU5luaPvPn7sCWlOa3GiritFvFf4WtItYFap4FmpVg0DMhZ/OO+RhZ80KQiP8YZAfsMNrt0cPBIaD8wNOCSrNc941f8nzaAKd5/7SIEBaZ+pJ/ME4BKYwHYxIdyPdYCy/SLeqfxEHmp8kjYSWRfEr7ALYS7FvEn2Fid1jgeTaKoAnJ9eGHByEGYPikhsOj8yH7QtpZjk4l62OP2zT5W4ugFs07LbSVWfQ5Qt37oenB7xAVCPdXmdsmTHO2mYF9Yb6Ajvb1Tc5hhtjgY2/XEuForj9M4Fpa9hsGto/4QVgM+p3jmtgL6bp/R3ZKdZ4lVzLuLhmaIfPN+WX/nCgZ/afD4vuE3CUS+3Gke5x/5Vdb48UoPhRIlFjSnf9q9+hm9CX9G92p/LWZ0G92L5uxFQpt9B8fgt1XIF8HNm08LtKr8ZNmRSb10mEJ/YcV1RrdErV6dGX5BJ0av9FB6kFZq9K91Ik8+n7Xk7UBGdrc4zM2vjijCGb4jXBv5Eb1SiQ7JHAcyjFOmPsbF8x8zuJVPfooox2bRZ36XiHvBuwael4xhVoy71V0N6mC1/MjV7nDN9nd558e7Ba2l/XTEMQJTKAE423WIkcQeALihwQFOcaD8fd5RmwG4lCsmdS0c0xOXPof1DwUnLaxLluqY
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4874.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(136003)(39860400002)(346002)(4744005)(54906003)(71200400001)(478600001)(316002)(53546011)(31696002)(186003)(91956017)(6506007)(38100700002)(6486002)(2906002)(2616005)(6512007)(66446008)(26005)(8936002)(31686004)(36756003)(66556008)(66476007)(8676002)(110136005)(64756008)(66946007)(4326008)(5660300002)(76116006)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?xgV1zV8Xijpo+5t56QywLdC/X+0o+osmAza58WCBKdDnY90DizSIcyW5?=
 =?Windows-1252?Q?AeR94FUWUpL8rwT1i+OG48Hpsi3VL+CO5DECKKJxOuf/AjiDrEAIlIet?=
 =?Windows-1252?Q?2fZ3X+c+cVmBG8QzwoUX8WHXug3/rXrP+JE725NXC5C8ja+XCApMqHzp?=
 =?Windows-1252?Q?Rhf6rMvIcPAezLeue1AXQWN91B4ERCZfSUMEX+0R9NCnsSjoCUWQS/py?=
 =?Windows-1252?Q?J1i2OiO97F0aBLaolTV79F3r61uJaxbwgh9iq/i6ZKJhDNqTaHwa2gWn?=
 =?Windows-1252?Q?XeKXoRdF8saACajvZ02e81i3BRBXaFwYMzOEyO0dwY+39FWO9Kzo0fkZ?=
 =?Windows-1252?Q?+ZJskprxcoTgb1ES+zgSzwKgcom11AY7jYgYSAA2tM8QxyBm6whmDpwn?=
 =?Windows-1252?Q?5EVuGHXK6ww0Ejd92fI4G4J9AXJ5bWSN+GrolGFspt4HIF+lSm9k1cKM?=
 =?Windows-1252?Q?umUOg6k+/V+blZvPyPz0b30fDFdOlX8qcVc4PiSzw/nOYdRgQ6DjM5VD?=
 =?Windows-1252?Q?f414s5Lm7zN4E2RY6KdSzUo7niseMIqPLLwhYVlKahGr3Ky+C4aj3L1f?=
 =?Windows-1252?Q?yDdyLQFtLdxdCr+qlLNXfohNLGOmJzl4UrWOQwnL2tKAmLuVq3dedAhA?=
 =?Windows-1252?Q?ijwKuVj4y/Vq1HpiFPp6A9izgov4iB5eKJZFeBvkacteMABIJBG57Twa?=
 =?Windows-1252?Q?qDhwZogS0cZQ7YyOb9LZEKW7zmOHP0MaiFlItoyTrUfWojKl31KlUzTG?=
 =?Windows-1252?Q?3cb8vTC0J01njlikNS56lase8p8upBzQ1zE4WGZaWwDxpSDFLHQOT1O/?=
 =?Windows-1252?Q?ChOmVJ99RIAe3FtPDMRM/wDoXK/zx66ejPeBK6dHUnnrFkffexUwaPu6?=
 =?Windows-1252?Q?4IAtD3lr2EyqpCxoXhnr5uVs5Tle2h80CH3elL5v+phXlL+/X3F2uuNb?=
 =?Windows-1252?Q?yK7F4sos3bj1Jk0gq1m+FQVBjeNx5r9C+b+dy0oxgFgYLuQ5Av8bN/wh?=
 =?Windows-1252?Q?BmG2ECjHQseTY8XSFYOWtdRvCnpE0Xi6J3On+20pdQX/U8z/MPuh2YeN?=
 =?Windows-1252?Q?s5g2+yg8P6gZEnyDoR/tP+vXmvcIyZ92whlJyZSEz85O0/kFV/a7qS69?=
 =?Windows-1252?Q?+eFgfAj1YWFv7tz/cwm/zy+m4yfShkN3CS2wiEvdorOSbXFmmoUycaMP?=
 =?Windows-1252?Q?GUh+G9La2ZLjZTxavANUBSurjPZFnhBUU/EuoDX9lmgrD21lRPd82AfJ?=
 =?Windows-1252?Q?lYzTrvNZ549tgj2oTsR+kxbE8mbOuqIOM5fiwA1DyuIN4rN7z0v4dfTs?=
 =?Windows-1252?Q?vYn7bv20H4nCG3eU2wof/d7ZoLyMkh9h7BhKGM1VFioZhfneBavWybEZ?=
 =?Windows-1252?Q?jT+cxMd8QfAt9SQyrGf+PdCAxMb20pifNk4=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <00DF01712BEC9042A75813B9355C1C47@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3630d6c8-acba-4cd2-30cb-08d8fd7ddf57
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 06:40:33.1542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpGiVkhjhZXEbI7nMtUtOpaJX97iF7KOU4osq6n13PdNR2ZRki5lKUI2IFW+9OLV+vxNc4a1ZqwH+nIHs8gumU5F9L25zGeKUkv0Aocag6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4701
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/12/21 2:00 AM, Stephen Rothwell wrote:
> Hi all,
>=20

Hi!

> In commit
>=20
>   2cfebcb2a22f ("pinctrl: at91-pio4: Fix slew rate disablement")
>=20
> Fixes tag
>=20
>   Fixes: 440b144978ba ("pinctrl: at91-pio4: add support for slew-rate")
>=20
> has these problem(s):
>=20
>   - Target SHA1 does not exist

oh, yes.

>=20
> Maybe you meant
>=20
> Fixes: c709135e576b ("pinctrl: at91-pio4: add support for slew-rate")

You're correct. It seems that I used a vendor branch when looking for the
fixes tag, sorry. I'll be more careful next time.

Cheers,
ta

