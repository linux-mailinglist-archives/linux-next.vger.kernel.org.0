Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE81B359488
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 07:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229846AbhDIFbT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 01:31:19 -0400
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:47936 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbhDIFbS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 01:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1617946266; x=1649482266;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=2JW68HvdMV+qe5Rev9BEf4qf2kklKOWIH/VBnEA3WxE=;
  b=c6vZDPQlCJAftctJbcRNLwQ40YV04gFjbWxrw8yKz/FnUtUVxcsFUooS
   Z/p65AVhpgaBspVIIr7P7ducFTzxNiBB7e0z5Ajh+jCQXObza7IHKzCI2
   CG4NAiXjVpAW5vrzri1FxVfjKvt3Gp9pXTPh3o2LneMkpH0vAc9hPuSuL
   JtkOzjvtScK/7WwhHzi6HnXSRa3lM0LJr6G2ROsTy/lOHJ1nZ2Pz6aUzi
   vNc+Z8W54lQDlAO18Jph3o3jFKxSfop7lIDh07Jk1+ABsseKL+b7V0pZ7
   Xwgdl7PkM2CuBfRzgFmA3EYvwIf770Rhms5wwJhUbbzTEyIQytd4lTFzI
   w==;
IronPort-SDR: 5+i8oE1UtP0w6CYf0++7ItM82RrvoI0kMjpwEVj6sxQ2XywqCO91eTA4vtLq088qWqvTzPyBFn
 v9MtEQcaQvu9cvR69lMh+8U6Nz/gSFUBBbx8BmOJaSIDHiG7ox5SdclZU6WfXBXEXB7mLiwhxZ
 g7EGf/GjR2sJw5b8D4Ef6g2GvMHIdol+mB0prwI2mjKRBWR6yuhV4E15UUaboxPefscKKTPiNt
 Qg7nwWhtZq3Xu8kibqfdSkIixNMojJNwVNLKeqJoEVMx7HE+gA6PCJ5ehq+cBk5u86Hztw5VfK
 If0=
X-IronPort-AV: E=Sophos;i="5.82,208,1613404800"; 
   d="scan'208";a="168771831"
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
  by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 13:31:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2m8ncQYnoWNselJHK5whb0lrz0yaz8EOj2jr4TrA8dtaD8UOiscz9PtG8hqloOHl6b5zz/CxTtSiwQGJrFE+VlneD0mHwai5N7hiI/F61ZwrrXztHNoHzv/hp5lcP91hpJ7FLoTHhbaqCT5cC+suwkUwnF0WQV9imHSKNefSaLReWPu9Zjbreo3L7T/w4Ub4t8C7fGjSJDNrK9WpiwbA9I0WBUey8aC8PF2ZKHFJRRnuwTS7kC4ZJgRFPt8RLi+QsfdPmN26vGhgYR2brtk82gtezeyCzX2Mn1ig1qDDbycRiyVPqPrLML7/0hvE1h6f3RE1lPahWO3xIRNZtECHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crbFUqHEH7l+/eyvaY+YqJEy5WiJhwg/NjN/D7CWZ7Q=;
 b=bLG5Ohi+EmoiH/4prQ94iQHzDWpyl0B2p1GoI7JC2v3w5FLvuW/9xC9s7FVke5dV1Sby2fiuj6Z9XD2yiqnrVBlZAWddD9mGfdR2n/u4deqoghj+rkUGjMrD9x+ivFshUiKpKcOPE/QIYY4bJEdOu7hQ9dZt68PpK1cB50GpW7EhGW5E4L1eW7iPCnq9BV19jCyEAdXhH7verOIjBZQDgA2R+r9KisVWEFMxVtRG4XBDT6HEDDvEC28NLZ2gaU7afpSoEYkabkl73CFZtCYXHZr/EV9Hc4vD9Dtrc0H0LEAZXs7ugA+NAkhiEozk3Mc0dfSMChv9fdaocHPniZwFCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crbFUqHEH7l+/eyvaY+YqJEy5WiJhwg/NjN/D7CWZ7Q=;
 b=aYzMlpSfCR1TW7pDT3Cp5aiC8W/8bWNpGximCXVIBF5C6JUDKYNTAGibPuBpJFSd6sr11KzseiBv3FFEuf/WxYGcOnMOGAo1e6NniTfE14+FX9tIr7jg3gZLcnfuOGtCQiGxPp3NKaZbLf6BRPbVRyk221NgxdSU3AGgf06C12s=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB5591.namprd04.prod.outlook.com (2603:10b6:a03:101::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Fri, 9 Apr
 2021 05:31:03 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::c897:a1f8:197a:706b]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::c897:a1f8:197a:706b%5]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 05:31:02 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        linux-block <linux-block@vger.kernel.org>
CC:     Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
        Hannes Reinecke <hare@suse.de>,
        Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [next] drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
 (first use in this function)
Thread-Topic: [next] drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
 (first use in this function)
Thread-Index: AQHXLQAx4caOwbMgo0WKyzWAs7v1OQ==
Date:   Fri, 9 Apr 2021 05:31:02 +0000
Message-ID: <BYAPR04MB4965A95A5131664085CDD8B786739@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <CA+G9fYtNAEwCk1WkA_25FVUrR0QJ2vt2Dh_w+m-QOSjb8f5TBQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a7f8d0f3-4857-463a-3843-08d8fb18aa54
x-ms-traffictypediagnostic: BYAPR04MB5591:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB559180F500653882345BF7F286739@BYAPR04MB5591.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e6mqCAB4uiF6kyhLcRCoXVJLeyQ0egUWQCXndsRnF5TvGSTx9LttNMEkfvcRCFEypqMaWnF/Wg8X4K0pLDP9nx0ilneecgoYbKxak7m0OehGWIbCoW39JS4/jfhR6Q5EFRTlWhGUtQn2/GbrG+y9u4PV0TZkQc2bnXfMWDBjUTZ8pJalV9WqMJA94sKBYhg9RVMR4+4Wa4mVpiQViaekU2j0A/41bThqmeU3gHXLmj21VGuJo4LMVQQre8TSYDY7U76BRJhtHA8j6WCmr4u55dSr/IhCNgjnwIuRsH4mBRYHSEZJXOU5INsoObM1U9fyfob7Ft6oNpWhJvi17OvVxe0Z+8CMtaFwqJcr/MXwwYvL3r+TNAo2cUfd9lZm0wqNyG/dbCnE9b6+xwi5BZ95VQws0ZU7xyBgLX7xvYDCIHAwfhIryG8HqcV/JnaU2iXLWkiTc9wujJkWgN20DUsLzcKWnLXOahn9ugoEJS7QQ4GIAxk2OhuhzBAhHYxGaFpthQhlkMumnLmyabOYGrwj37QPXKZNm4pzHxBdDsMPOf6LzeftxZ277apHnrrb6gtRSxjy9rAdV8DlFOYDnlKNZ1aBQmKDz5flnzwxPbXfs38Z0vsTETqqYw+ghABab/Jag5WlhhThm7h/0vLAJQox2asTwPPK+hI+dj5Mn6R2xjtwpgh+3iBGqqWREPob0SzLNp3H2xfhvxrECuU16qZ1Tx6oX1RsZF1PJa2A53Tdu/baqXiry8D3L3NdOEvw9Q0K
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(55016002)(66946007)(76116006)(2906002)(110136005)(186003)(66446008)(966005)(33656002)(478600001)(86362001)(71200400001)(316002)(9686003)(54906003)(66476007)(64756008)(53546011)(52536014)(6506007)(38100700001)(8676002)(7696005)(4326008)(5660300002)(26005)(8936002)(66556008)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?2o0Dd5RtXKbEVuteEDPpdpJ5eM0O1A++XMn663elsuIaUvX5wNjtWiyIpqGU?=
 =?us-ascii?Q?ecE37vpZLMB6XFP9h4pyk4IALZ9CBz/HBqjUNVIzBMj2I+MjKMv30+bChvhY?=
 =?us-ascii?Q?c09cMMHyl761YUVeJfB8AfEXTDpuUwDjZ0JkBFrCJMlNXhDBEY/JuOWZOmpe?=
 =?us-ascii?Q?HSDgcd0xQ9eTt0hhthHRvE5sLNOqo6kXEZ2wQ9pF7Fp0n3he7f985Ap4n3fk?=
 =?us-ascii?Q?ZWYSIoQg4Fo358uwVZbtPp+MJ66i5SWYCBiGGrgLvdDBlBRaUmBBqMZBS88P?=
 =?us-ascii?Q?SXgoG2gnMnu2p9xA3463QvU9xGR8Z9zjLbGGV+TygPALFJixk0U+/RwXV9Ij?=
 =?us-ascii?Q?eMn2JybFYwwRO2XLmTPxCoks+p1o10BkuDXSvk+DYJWuWBOdq4d4wYaT///S?=
 =?us-ascii?Q?pl+9kViwPM1HCjWJFTN+tMxGJsuYLQj0DoaOGqt8InZuHsWYqnM09fBdg9I9?=
 =?us-ascii?Q?dADZ4JTV3ByEYzogY1yx/jzN2F4yAN62rtDMLfh0jNIeo2QeSA5zvP1iU4bq?=
 =?us-ascii?Q?LjZ1g1bgp9KJCOG17sLYoMZMvXJ/5hdj+TyhsNYYQq7U6j3x8jp5WCOAw6ke?=
 =?us-ascii?Q?G6QH8eIuAcqLGPRSOC6R0abESoF2u3tSJFBy628KPuOMNmlb1r/NebCmUHho?=
 =?us-ascii?Q?YgNtNw2JpFJEGeKKG/XEh5JSpmDR43YNy3zPz24AEt+EKmazBrWSvcatB006?=
 =?us-ascii?Q?mz7z1Nt/mj7BUM1aihjuJs09iVkHmHoVwHhMrBV/npKsi/1a1otcZh6XuZwi?=
 =?us-ascii?Q?oqwq2ab8WzoYGonDBRxrwJSBaNbk1wfe10L7apL8zIyLFY0rNeQzME5tY4mg?=
 =?us-ascii?Q?NXFbzYPLB+wPlvYqhQix0V/IfYSt9PCI1Sgfj/kFtuBvr5wlQRu1BsieCYoR?=
 =?us-ascii?Q?N+XcAj/cckXEHCd5QYj3bQryWtAJwC+hMxa1AOFZFlY/0AWjX/RBROs96uEL?=
 =?us-ascii?Q?/hh6pZNr22buhQmqv5HFLIXW5M7A6zcIeBTFfWWe+Y5AjCXZDxseJ7/HaZsk?=
 =?us-ascii?Q?n4IFteqIp6UEN3kKMhWPryxLrdu6MCUqEMgSmBGm3bvIu0JmCTVlsTttu5lb?=
 =?us-ascii?Q?VdqkS2J8CRbj5mg3s46Q09BZcWRK5D3xv3n14BZc2tKOQIDRUr0et8tHffzF?=
 =?us-ascii?Q?9PLAsEH0RtIhYm4Kp34ndQOBvyqIUKSNGJ0mb66u64NY5lL+yG+xZkM02Uh/?=
 =?us-ascii?Q?7p7msdpsYJE8XB5JD+J99ODCQ+gejCl57YimTcpZhvci5mmemkKOSf409hkU?=
 =?us-ascii?Q?cPrLbPMRnthEYnJn86Pqf3M2fGKLUK6k9pzaHHPgsmfTO+YOovKbKPCARzLt?=
 =?us-ascii?Q?j4z0jnCHix4bR/DrP7u+jq4bOGRRGHlheUdV61Q59S94pA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f8d0f3-4857-463a-3843-08d8fb18aa54
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 05:31:02.6049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9RRvoixiLG2VQ5y4ChCf1/Q4XpWb5IqoH639Nt7uXP3IZe1rh6y3aM9qQp1klc88tYSyhIbciaPRTNouFEsSCmcApih2Fg2phwxujrGUeqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5591
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/8/21 22:21, Naresh Kamboju wrote:=0A=
> Linux next tag 20210408 architecture sh builds failed due to these errors=
.=0A=
>=0A=
> # to reproduce this build locally:=0A=
>=0A=
> make --silent --keep-going --jobs=3D8=0A=
> O=3D/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=3Dsh=0A=
> CROSS_COMPILE=3Dsh4-linux-gnu- 'CC=3Dsccache sh4-linux-gnu-gcc'=0A=
> 'HOSTCC=3Dsccache gcc'=0A=
>=0A=
>=0A=
> In file included from /builds/linux/include/linux/scatterlist.h:9,=0A=
>                  from /builds/linux/include/linux/dma-mapping.h:10,=0A=
>                  from /builds/linux/drivers/cdrom/gdrom.c:16:=0A=
> /builds/linux/drivers/cdrom/gdrom.c: In function 'gdrom_readdisk_dma':=0A=
> /builds/linux/drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared=0A=
> (first use in this function)=0A=
>   586 |  __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->b=
io),=0A=
>       |                                                             ^~=0A=
>=0A=
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>=0A=
>=0A=
> Regressions found on sh:=0A=
>   - build/gcc-9-dreamcast_defconfig=0A=
>   - build/gcc-10-dreamcast_defconfig=0A=
>   - build/gcc-8-dreamcast_defconfig=0A=
>=0A=
> --=0A=
> Linaro LKFT=0A=
> https://lkft.linaro.org=0A=
>=0A=
=0A=
This can be fixed by following :-=0A=
=0A=
diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c=0A=
index e7717d090868..742b4a0932e3 100644=0A=
--- a/drivers/cdrom/gdrom.c=0A=
+++ b/drivers/cdrom/gdrom.c=0A=
@@ -583,7 +583,7 @@ static blk_status_t gdrom_readdisk_dma(struct=0A=
request *req)=0A=
        read_command->cmd[1] =3D 0x20;=0A=
        block =3D blk_rq_pos(req)/GD_TO_BLK + GD_SESSION_OFFSET;=0A=
        block_cnt =3D blk_rq_sectors(req)/GD_TO_BLK;=0A=
-       __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->bio)=
,=0A=
+       __raw_writel(page_to_phys(bio_page(req->bio)) +=0A=
bio_offset(req->bio),=0A=
                        GDROM_DMA_STARTADDR_REG);=0A=
        __raw_writel(block_cnt * GDROM_HARD_SECTOR, GDROM_DMA_LENGTH_REG);=
=0A=
        __raw_writel(1, GDROM_DMA_DIRECTION_REG);=0A=
