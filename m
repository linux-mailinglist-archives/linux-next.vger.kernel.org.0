Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B2F35A2DE
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 18:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233687AbhDIQTZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 12:19:25 -0400
Received: from mail-eopbgr1300091.outbound.protection.outlook.com ([40.107.130.91]:2940
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229665AbhDIQTY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 9 Apr 2021 12:19:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrDC+j0E1D/bSDhWbpOPoCNvFp2eITLnjjuNLiL4hDPZo0ntBrSb7PhpBzQZBZHEaZcYyTZQ91qWeR19rWGZvq1hDbWiZy8V59jko7Xg+3BkVOnOEPGC3q/5K9qix+chuUL+JKa9iZ01/9K0N9MRYqgt2lb/AuqsP5F5AhLjD2OJ5TsD5OoaI/iuL7ZMii1oGtW2q9aoNyAGb8d7W0EULa1vgRMInuz7iON7io0hieqaGa3OvtOazw1/d+0VhPZysVklkmTi5uaQQkj8cZes8siXzHKGy5o0h8CoPjJBPwvRnk8OWdA2jpjpxe3InBtyix/k06848pEEOrMWl32hYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUI4C2h7S0Nw/RCo1hw0QNQpf7qImU3q/C1ZCQ/P/bU=;
 b=fbzEMnjxR2GM8ocbQ9sHK1YxXAuuVnt8P6H9xqdSoEoAyMtqxZdU6LFD7TDGY1gLJGZXNqWLoT3tvps05OAjwTfM+N190P3gQgKgIpHkEZmkF/cYSgmqaM7p8g763VPl59kYvRssKu+4p4H1sKbJFFeXRu7BXr1pmZQ+Aj8ak/meutILLJK8P0wi70zvI1Ky7Rwnb6+bgHn39JSmpSUwKa0w28VukxdR4/TulyFMjs5SSLRZ7t2t/rsySejyiyuffd3VFLfwltyMxlABe1TmyKGau9KHPv0d+zbrS5eDmoRUvyH4X+C+HZZbkH4qNAATZChRUIq/9e5N3fRJN32V2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUI4C2h7S0Nw/RCo1hw0QNQpf7qImU3q/C1ZCQ/P/bU=;
 b=bEvw8qo+PgHji7NL3K1oklHwx/LIur7MWlyX7r2FOT1kgy5GaSl4eltiDZNwk0ojmiEKirc1t+/EzEkutg15iERIQ4fpmPYPiDWOzeLN8ZvfnDiysOqk2pQYvbxqL4pLqlL6KLn85avrI4c8EqJJdbUaj5R87+R5SIL04VfabRw=
Received: from PSAP153MB0422.APCP153.PROD.OUTLOOK.COM (2603:1096:301:38::12)
 by PSAP153MB0422.APCP153.PROD.OUTLOOK.COM (2603:1096:301:38::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.4; Fri, 9 Apr
 2021 16:19:02 +0000
Received: from PSAP153MB0422.APCP153.PROD.OUTLOOK.COM
 ([fe80::24d9:ce8b:8c06:2299]) by PSAP153MB0422.APCP153.PROD.OUTLOOK.COM
 ([fe80::24d9:ce8b:8c06:2299%8]) with mapi id 15.20.4042.010; Fri, 9 Apr 2021
 16:19:02 +0000
From:   Shyam Prasad <Shyam.Prasad@microsoft.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>
CC:     Maciek Borzecki <maciek.borzecki@gmail.com>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Steven French <Steven.French@microsoft.com>, pc <pc@cjr.nz>,
        Pavel Shilovskiy <pshilov@microsoft.com>,
        Steve French <sfrench@samba.org>
Subject: RE: [EXTERNAL] [next] ERROR: modpost: "dns_query" [fs/cifs/cifs.ko]
 undefined
Thread-Topic: [EXTERNAL] [next] ERROR: modpost: "dns_query" [fs/cifs/cifs.ko]
 undefined
Thread-Index: AQHXLP5LXQfVY2XqbUK9ec9lTWpxV6qsWVlA
Date:   Fri, 9 Apr 2021 16:19:01 +0000
Message-ID: <PSAP153MB042218315B664B15A59A80B094739@PSAP153MB0422.APCP153.PROD.OUTLOOK.COM>
References: <CA+G9fYu60T=vymv7gA0eaopfNDWXAVT9WRS11Rrk1OfTkrCevw@mail.gmail.com>
In-Reply-To: <CA+G9fYu60T=vymv7gA0eaopfNDWXAVT9WRS11Rrk1OfTkrCevw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=3ffb3f2a-ae17-48d9-8b9c-79424dc5fa3c;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-04-09T16:01:57Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [2404:f801:8028:1:60f6:ca47:5dfc:b1d0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64b05b9f-f174-4162-1a46-08d8fb73302d
x-ms-traffictypediagnostic: PSAP153MB0422:
x-ms-exchange-transport-forked: True
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <PSAP153MB0422D7C13E9E0374AC89BAE394739@PSAP153MB0422.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eY+4AXP3bSyy/6b4jwMdFgcYpp7qOx4F7vhhJT2DJSmJDRMg5jtgb5QX26O/yGIfYq6aZb9x406mzC17+x/X9e648/wn86tjwyHbwEa2iOn6DVzItS+Wh12p+idJA7wrbYWckjboocQDf1MCaKyPnGDI2OFQa4VUnD3C2PJ+1qBOteePcNA+7e1CtCP+vKQkDoBndlMrY8x9soA5XfpDmoM3IzlLDpZVOdnJl4wPjX6FYnPbveqL+MG5zrPydEWa3Xx5EN2GxM02HkoA3Hb4u6HVi6W/GKo1Yacox4daHsFKJaF5q8d1vyqO1vBSsVx+KdpHWCX1zQi/FZetUGY6wonMOS1nP4k6yWwLSVuo+2p6rfX2zOllyuKuIVEm0J04M63L8AhMHPOki+ysafKs9hj8eW/HDZDE3QNzlMmWwvJkc+LTa+zLDUUaTtlYAtapdDHSe0LjS6jC/TcPrHIeBPRWOX1h76m8kkXPopaM5jNQk+a5wZoAaHMI+XwHmMD2W9hKy1pZOuaEDqKlp1ljo75lNnPVIl+46ddNfthigJXSSYlEWc5z6nvfGFqbxNDjY8AKEE81NIglMQj5HWeGOAMUh8xxvLXjYi+rfcvB+FFzjPmcmbgR7fLBBIZMcNYMrVx02oHWPVz6PXafQIspSZIDMKgTTV9kEbD5PJ6+gH8iqm4Bkd8+Qq+yfSi9Ue905XuWBK2vnJVrcLy2xX5xkPie3cNWA9h2eYyIkdd3manhz854+356r2eShXKkcTFb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAP153MB0422.APCP153.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(53546011)(7696005)(8676002)(4326008)(71200400001)(6506007)(5660300002)(9686003)(55016002)(86362001)(8990500004)(82950400001)(82960400001)(478600001)(316002)(8936002)(66556008)(110136005)(64756008)(2906002)(66446008)(66476007)(186003)(10290500003)(66946007)(33656002)(76116006)(52536014)(54906003)(38100700001)(966005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4EhXyxwviPsOBvjeSO/0/DuilNsao26QJO7Dvopk5YLP3XPJqXJx9Oo3Y1PR?=
 =?us-ascii?Q?AtIeAPTDFkRkSDZ2AtM2po4hg38/yztfRER9WNjBjQ5/XiQ8TtJywr04C/2E?=
 =?us-ascii?Q?0jZ+9RP9HrijXARSHIebGZFTagEBfpEMlHCPIL7vnQSDFAtOi1FtvFfkRy+w?=
 =?us-ascii?Q?MlNZgaMRYoP8aXO1MnHpMfV6pug8dNAQdtoJOkZzXyQPbJVkZa7fQPczMDsK?=
 =?us-ascii?Q?A03LaFkkibO5x2WihPloHM66xjvjNUT/Kd39uNNBFpBhNQ9yibbiWGzj6///?=
 =?us-ascii?Q?R490lN15jJRLjjIDLsxymGLLpLrKz2wtoxwUvWiB/83loZD1E7R9Dy6fcVli?=
 =?us-ascii?Q?Lfi2TpnvaSWnNl8boCpyC7pBvCj/BXgwPIX9GTKldHJNJg8YG2lbbKH7S2Zl?=
 =?us-ascii?Q?mxwHLNUJfKwJIX6yWnPyU5G/g+cXi6qjARzGC1rFJE9QSzi/10jl0f0RB654?=
 =?us-ascii?Q?cIkCb3i0hOPOwTpPxctOY7bVtGuGgQLgFeRVDd8kdoxghvVM2RobAblG4IrZ?=
 =?us-ascii?Q?H8rmS9g5C3l5Y+8Ph0uCKQwxwXmOzDA7usIWrAK/6QsE+BxzTPvIpJHpOeDk?=
 =?us-ascii?Q?GCF6h5MSW3wG+EwHbXr1X+oLFhSNivwJr+UOe9QkGdWxBuRA8cjg0K8WXn0A?=
 =?us-ascii?Q?AAAqdOZjw+nQT4CaSaGED7+Y3rWBFCLTPJ4nFgDey/1vKm1uIHPMwcfNP5bs?=
 =?us-ascii?Q?tM0IFNlJupZF+It8pyD1AhYNa5A11PAuCaaWLCoAvTbQwEkgk8AGZpcnKDKv?=
 =?us-ascii?Q?/U35agYTFJjiaoes3nqqqQAKv4ZTWe+uiCOcndGEL/W3S5py3qA6Tly0ZEIX?=
 =?us-ascii?Q?QSLoxkfefBwvOmKz/dy4kuazZ2CLmk9l6T6OH/WETeVVHrwL/8nFmmHT47jr?=
 =?us-ascii?Q?Hf4DPnKW5f7ayymUcZpBy9zD1rzpGrbU76X6/Th7JZrEff9nq2d+WwzeVZIi?=
 =?us-ascii?Q?oDz4/lwOaMrtYsAyeIbbVjaO7/ozRX1cAvlBLOVORZfe+77KjHQJpOXMA6G9?=
 =?us-ascii?Q?j79SeglTgKgaWCcAg5ew1YClM25Hmh2l4Z2qOzKcPY1EIdzK429TmzqU7vyG?=
 =?us-ascii?Q?RcvggX7QpyuOHsullShhpyLjWsCwGMngQnCFb0w540znFAHjnTtYgZqD94Tk?=
 =?us-ascii?Q?gCX55jfyKkZTc8j7YSwYV3sOlw3Uy8AFMw7I7LJmTaCvdzYIqbdFAeo4MEiS?=
 =?us-ascii?Q?RJsioQQgOhIgh1sbYEvnaP6jhe08rNtrVuOIwR6K5B6aY+Vx56j2pzbB3WEe?=
 =?us-ascii?Q?6cVuVlw6Cg1je2scUAWVlpQxowgPUeo9pzgOd2P+URcznHLCag84IbBX+CiG?=
 =?us-ascii?Q?T0D0qYiS9F/mP3hjPokLilVWzyBkUjykk5boMyi0v/RZiSUA3E/+ShVmt56J?=
 =?us-ascii?Q?tibv9Qk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAP153MB0422.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b05b9f-f174-4162-1a46-08d8fb73302d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 16:19:01.8807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TPUMeDE429aEPBy9+BUwBbtdwIM/8ZjIthQN1K5+oAXdI1B4xfEIq0aOvnGh23bNFz4/5KQaBA3IFM3gEPP5ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAP153MB0422
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Naresh,

AFAIK, this has been fixed in an updated patch last evening. Can you please=
 check if you're still seeing it?

Thanks and regards,
Shyam

-----Original Message-----
From: Naresh Kamboju <naresh.kamboju@linaro.org>=20
Sent: Friday, April 9, 2021 10:36 AM
To: Linux-Next Mailing List <linux-next@vger.kernel.org>; open list <linux-=
kernel@vger.kernel.org>; samba-technical@lists.samba.org; lkft-triage@lists=
.linaro.org
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>; Shyam Prasad <Shyam.Prasad=
@microsoft.com>; Wan Jiabing <wanjiabing@vivo.com>; Steven French <Steven.F=
rench@microsoft.com>; pc <pc@cjr.nz>; Pavel Shilovskiy <pshilov@microsoft.c=
om>; Steve French <sfrench@samba.org>
Subject: [EXTERNAL] [next] ERROR: modpost: "dns_query" [fs/cifs/cifs.ko] un=
defined

Large number of Linux next tag 20210408 builds failed due to these errors.

make --silent --keep-going --jobs=3D8
O=3D/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=3Darm
CROSS_COMPILE=3Darm-linux-gnueabihf- 'CC=3Dsccache arm-linux-gnueabihf-gcc'=
 'HOSTCC=3Dsccache gcc'

ERROR: modpost: "dns_query" [fs/cifs/cifs.ko] undefined

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Regressions found on parisc:
  - build/gcc-9-defconfig
  - build/gcc-8-defconfig
  - build/gcc-10-defconfig

Regressions found on sh:
  - build/gcc-9-dreamcast_defconfig
  - build/gcc-10-dreamcast_defconfig
  - build/gcc-8-dreamcast_defconfig

Regressions found on arm:
  - build/clang-12-s3c2410_defconfig
  - build/gcc-8-s3c2410_defconfig
  - build/clang-10-nhk8815_defconfig
  - build/gcc-9-s3c2410_defconfig
  - build/gcc-10-nhk8815_defconfig
  - build/gcc-8-nhk8815_defconfig
  - build/gcc-10-s3c2410_defconfig
  - build/clang-12-nhk8815_defconfig
  - build/clang-11-s3c2410_defconfig
  - build/gcc-9-nhk8815_defconfig
  - build/clang-11-nhk8815_defconfig
  - build/clang-10-s3c2410_defconfig

--
Linaro LKFT
https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flkft.li=
naro.org%2F&amp;data=3D04%7C01%7CShyam.Prasad%40microsoft.com%7C416f80ec723=
a4fcbbc8108d8fb153984%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C63753541=
6728141562%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Dtq6fEaGRA7hNP34bGp9jIZHfzn3lV=
t3tS2mNldC9w9w%3D&amp;reserved=3D0
