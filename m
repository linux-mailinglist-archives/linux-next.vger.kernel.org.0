Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 161BE16396F
	for <lists+linux-next@lfdr.de>; Wed, 19 Feb 2020 02:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbgBSBi1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Feb 2020 20:38:27 -0500
Received: from mail-db8eur05on2042.outbound.protection.outlook.com ([40.107.20.42]:6120
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726655AbgBSBi1 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 18 Feb 2020 20:38:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nd1GYMLTvFXLXakO/wVBSMDG3NE3NweCYBvxgHZJfXpVGtnG8ITvh4GphotpL/yjpASzCyU5KaTWwsmPjSQUXnwbUzNyhUonpSCHLtI1dBgrq6zfedsZS+mUNAW0ZoX3rSHmYT6cfOVd2zYiG/U3TLf2e4yufDco2A290POSM+Aadcc8fhWCkp5mYYfEZeHGJuH7VUkPQ25U4H7ZB01kB49/0T5atzMaPJmIytcn6ca+Soy5LgIUIF0LMLugfJo2v12/NDAhNFto9DD8ezwLh0lUGwPsGAqD0rQFq/OH1hNJxXZpcZ5LfIQ0FA1Ds79b/jqyAhh2jelQLlgiXfwE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlgiymNMb/ANVUXaZ9VlSNhtV8XPnnztkpjfScD2ap0=;
 b=QEYF7t+cWSpN3MNtUJ0xSBlsGqE/Ncr6nG+aYB3wLwqEiMWLULryPLnyTcIaP5eRbp0XazpCCw9NlALXiGNN7fl7jGAS6T4jDbNItStyUSZINSUOtdNov8qof0DpO056HCn6HMYVRXGt9FKRhOhbE03sFy5o0/r/PxywXiLWj3pWh64XK4Yg9jP4wPeQzl3QlzjWqFSP7VgwaIGjn3TzepfKPr2G3n/M9WeIYIkyFfPeiYvwanLRxoY39WCtVcRHY9b54UeG3vX0cor6ZOyOMRvmcVk13z7wyYpVN44p2aeah1W2VTaRv08AzRUClTA/S6lsXj9ILditEI8wXVODHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlgiymNMb/ANVUXaZ9VlSNhtV8XPnnztkpjfScD2ap0=;
 b=f5uYRN493pWyhKk/20NQLhF/BSzFaogvJsbeHTSF6alPMPsYiS6ic+P7MVQ89u3kF9MO3WwCXQ9bVcJ497zIxEKk0drvChuIKeSaM9shPQ+JVlDKl3vWzg6viW183sYDwLeNWSmkQtlsa9ZiEwiztxJhYfYtD0bY1FxnXAZww/s=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB6829.eurprd04.prod.outlook.com (52.133.247.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Wed, 19 Feb 2020 01:38:23 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2729.032; Wed, 19 Feb 2020
 01:38:23 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: msm_hsusb 78d9000.usb: failed to create device link to
 ci_hdrc.0.ulpi
Thread-Topic: msm_hsusb 78d9000.usb: failed to create device link to
 ci_hdrc.0.ulpi
Thread-Index: AQHV5WzkVJE8dMSG/kyqd9L7w5nl/aghv7IA
Date:   Wed, 19 Feb 2020 01:38:22 +0000
Message-ID: <20200219013824.GB8602@b29397-desktop>
References: <CA+G9fYtnwFVPQxgHOU2Bi9y5+q4sSsww47yxK+_3ZAQ9=kyhUg@mail.gmail.com>
In-Reply-To: <CA+G9fYtnwFVPQxgHOU2Bi9y5+q4sSsww47yxK+_3ZAQ9=kyhUg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c92b6b69-b529-4554-fa75-08d7b4dc6855
x-ms-traffictypediagnostic: VI1PR04MB6829:
x-microsoft-antispam-prvs: <VI1PR04MB6829EBDCC1FAC930200946128B100@VI1PR04MB6829.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0318501FAE
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(7916004)(376002)(136003)(396003)(346002)(366004)(39860400002)(199004)(189003)(66946007)(4326008)(44832011)(54906003)(66446008)(64756008)(8936002)(66476007)(5660300002)(66556008)(91956017)(76116006)(316002)(1076003)(9686003)(6486002)(33656002)(6506007)(26005)(6916009)(33716001)(186003)(71200400001)(2906002)(53546011)(966005)(45080400002)(86362001)(8676002)(81166006)(81156014)(478600001)(6512007);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB6829;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6D+tG11GDQdv8Fe/V4BNrROLilMeFU2wwocU+cu9faQCawPmgL5nnLw/T0Q4sHzAQ9uP6It8Z1ApzIdcTxQqDvMtkRra4TjtgUBSvOhXWCQLjJlAJwx8vaog54WgQL/iC+RMYN3DxMdbgsJF/hLuvQCiFvNupAv5YigUtG79jFemcvl2AD4Dg7nrn9hI4N4YY7bW0cHA7TGwxTFKXGU3ZzTpFtdrgTNQ9Td31iQnbnPwA2/Ie8xvVmHy1ilYfPGcbwnyRX+i6B15V0+i+A7tvOm+TnRyiTLBPiB0pLIculmJbPmbKVBa/lal7/Sm9PrFRfnSj15+ZvMTNMtW97zeSs9DjdTIb0oJ21FPdjznRClK5//Jsr4J4xP2LIC5X3XsK4e+fC6CBjnG9Lyf5SZFFmsEvZ7t5h006NXLEe+qIO66/6XzKTXiRtfyuWqzuMrx1TR4q/PZVYTPXNGhZyulclQNid3JwrqTa7Q/IAmZ5suVBnNosuBDGgRrE6hJjD1GCMPfPSypFXMxzmnnuHUNkw==
x-ms-exchange-antispam-messagedata: d8b5/wvWK8JBTtU4dxgG7InAqymcKRVWZqcAfH9TNE7DlTA9JLEnOgGbgI43PaHchPQgfdqth+cFPG059GtUOmIIeUMaOrludeAgugjIc+zy948/r4kKqaSVLd9Dflklj5Gvwo6bGqvYWScY+xc9Dg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6F6CC9E77586C543AB3C1BF83E9C451E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c92b6b69-b529-4554-fa75-08d7b4dc6855
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2020 01:38:23.1535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ziG1n1kVD6D34gKKI/z3oxeWK6iXncI4vUHPWjJlfh0XVnCVYzb/t4wL/7tMH2MsIqaVHpDlv2zmaN0sLhYxHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6829
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 20-02-17 14:02:57, Naresh Kamboju wrote:
> arm64 APQ 8016 SBC ( Dragonboard 410c)  device running Linux next boot
> failed due to below error.
>=20
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd030]
> [    0.000000] Linux version 5.6.0-rc2-next-20200217 (oe-user@oe-host)
> (gcc version 7.3.0 (GCC)) #1 SMP PREEMPT Mon Feb 17 04:27:31 UTC 2020
> [    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
> <>
> [    4.439291] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.448891] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.457879] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.467331] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.475636] mmc0: new HS200 MMC card at address 0001
> [    4.478895] mmcblk0: mmc0:0001 DS2008 7.28 GiB
> [    4.480629] mmcblk0boot0: mmc0:0001 DS2008 partition 1 4.00 MiB
> [    4.484719] mmcblk0boot1: mmc0:0001 DS2008 partition 2 4.00 MiB
> [    4.492247] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.502611] mmcblk0rpmb: mmc0:0001 DS2008 partition 3 4.00 MiB,
> chardev (234:0)
> [    4.506949] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.517901] random: fast init done
> [    4.521420] mmc1: new ultra high speed SDR104 SDHC card at address aaa=
a
> [    4.523400] mmcblk1: mmc1:aaaa SL16G 14.8 GiB
> [    4.532843] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.539131]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14
> [    4.542309]  mmcblk1: p1
> [    4.561843] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.573481] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.585283] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.592622] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.600074] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.607204] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi
> [    4.614679] msm_hsusb 78d9000.usb: failed to create device link to
> ci_hdrc.0.ulpi

The chipidea USB code hasn't changed recently. Would you please bisect
which commit affect it?

Peter
>=20
> metadata:
>   git branch: master
>   git repo: https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-nex=
t.git&amp;data=3D02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84db0208d7b=
38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637175251927547718&amp=
;sdata=3DHy52nqOnn5nPgLcgSgWWJciwVy73MnHheNAqOi8tX4g%3D&amp;reserved=3D0
>   git commit: c25a951c50dca1da4a449a985a9debd82dc18573
>   git describe: next-20200217
>   make_kernelversion: 5.6.0-rc2
>   kernel-config:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fsnapsh=
ots.linaro.org%2Fopenembedded%2Flkft%2Flkft%2Fsumo%2Fdragonboard-410c%2Flkf=
t%2Flinux-next%2F705%2Fconfig&amp;data=3D02%7C01%7CPeter.Chen%40nxp.com%7C4=
e1721d16eb94d84db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%=
7C637175251927547718&amp;sdata=3D7tuNCoQH2Fu5yDtcfE3D%2F1SDGQg9wSyKKPO8ufmQ=
g1w%3D&amp;reserved=3D0
>   build-location:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fsnapsh=
ots.linaro.org%2Fopenembedded%2Flkft%2Flkft%2Fsumo%2Fdragonboard-410c%2Flkf=
t%2Flinux-next%2F705&amp;data=3D02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16e=
b94d84db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371752=
51927557710&amp;sdata=3D%2FBbdDiwFV%2B7z01ayzHuKl%2FLMIa6Qv%2BjajgywkhsVrJY=
%3D&amp;reserved=3D0
>=20
> ref:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fqa-re=
ports.linaro.org%2Flkft%2Flinux-next-oe%2Fbuild%2Fnext-20200217%2Ftestrun%2=
F1223296%2Flog&amp;data=3D02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84=
db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371752519275=
57710&amp;sdata=3DhXhbx%2FMJ6BDzQkYMUZrc8uRmiCb2YfLluvzjg6uaZ%2Fw%3D&amp;re=
served=3D0
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fqa-re=
ports.linaro.org%2Flkft%2Flinux-next-oe%2Fbuild%2Fnext-20200217%2Ftestrun%2=
F1223301%2Flog&amp;data=3D02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84=
db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371752519275=
57710&amp;sdata=3D5zrDqvPVZcgrFEogBjes0NG1uRv7WJnEeUiGUqe%2FB7A%3D&amp;rese=
rved=3D0
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fqa-re=
ports.linaro.org%2Flkft%2Flinux-next-oe%2Fbuild%2Fnext-20200217%2Ftestrun%2=
F1223310%2Flog&amp;data=3D02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84=
db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371752519275=
57710&amp;sdata=3DTWixPlJuzES7AReilcm%2FG4pWTYVy3ku6zetEVmeXB6I%3D&amp;rese=
rved=3D0
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fqa-re=
ports.linaro.org%2Flkft%2Flinux-next-oe%2Fbuild%2Fnext-20200217%2Ftestrun%2=
F1223308%2Flog&amp;data=3D02%7C01%7CPeter.Chen%40nxp.com%7C4e1721d16eb94d84=
db0208d7b38405d8%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C6371752519275=
57710&amp;sdata=3DqSxWLfIWM047jLKjahfDC6luxI9kYr5xPhErkD%2BxiaQ%3D&amp;rese=
rved=3D0

--=20

Thanks,
Peter Chen=
