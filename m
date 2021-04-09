Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC06D3594AE
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 07:35:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbhDIFfY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 01:35:24 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:24720 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233345AbhDIFfV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 01:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1617946509; x=1649482509;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=RB//iWGBfCdKvNRCBErWLT07lYme7D8aTm3lkgvu4M4=;
  b=rZyGJPQYy+jbwEJOBnnmeL8xSBjD4JuhBaG2pnR0wu2bkKRqq3kbCsjD
   dN+uLMm9jKM1GFj5W8v1Lx+99KfINIqBJGPbYS9ebVQt+r/Tug0SnGmxA
   pvtx7HkDesQ93BHAMkN29xahyjb2fVnTYt+I0ywMe+xx2QgIUKBiXagjt
   ig8Ssr90QKR+ute4KRbAn3DseTT/qfBpSdbkmUsdpWdn0c60cbxsZgxTe
   BTQNqxbOGg2LpcV8Q4wC9CMAoNnkUhbvfOByZK7vb+D8G5icf9rSWPnto
   aQ0G2+XtMAx2yFY3XX+NOcW9MpU1nO9y/vcBn9nBvbvEI6KYs5+pCQbR+
   Q==;
IronPort-SDR: mJqPpI43p5gaEnACdtotZ0yYRiXwj9q/TeQIAstLghj7PjMpBZ6DPfHABPQNCTm+x5SxHUolgB
 mQD/IlkiYO5kYVlpw+yzz8a5ld1htnJ78/TaZE9FBosg2xn2CPnbHby8kqyji3CtELGKooetTS
 2miOrwMkbHvDhJ3yihVtpOs1hHxeYYLv7QbWbwtTsyYfPl4138gKISL0vTgew8I7mvJqWYaQCn
 rkk7a8NG+Zl+8pWDyzlISbAJ48YmjBNtrTc7S8ZguczjNr3azeuLS66T0pDPDD30lA7zw/AG0Q
 ngk=
X-IronPort-AV: E=Sophos;i="5.82,208,1613404800"; 
   d="scan'208";a="165143586"
Received: from mail-bn8nam11lp2172.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.172])
  by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 13:33:36 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igJMooW7emRlYbAnNDThJ0JUukWVScXFCRnXXcMVqg8tSzdFqEFT3h2YgdPL7/wQsqW8bm4nqrMW25xvPyHnxw0IF3dG0z8+oNokNaYxlinQ50flnZ1DbY39ySEgobhxXbYtJwbA5BztdgrgbG9IG3a/c04wTiEjLAuR1GacxRXnF2ksnvPjJFfbAvPJ9ic2aTnLeVlKC+oZnJA7UQqVfgH+/G21/Xo31b1KDeAQs0tpw8q9FXg5PcbysgtFHriqGW4ZPHOIshbaybOo0m0bPeu502kQg5NR9VLs1OJD+CmR30936+oqcWetcJa6J7V7wtdnI7x8WHSHZDBzgVc4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EJx8+FvlfNTrWPEeYgplBWey4Y0iw9ZcORxE+ICyxs=;
 b=nmSBbyJgW3wexG3GJ5O+uX99guO04xkXLyuVSa42TApDgAYRiJbDDe2Z6SePpASdFbRVl9rK2g5aWDRaPSFuXMcNnmEidEMYxSZGywDQOh+T5bd+T5muzGWQQW+v0Je1ZAne30RURegN0AExu4B+pFCJBhxBext4QgfnCsIpc0n17XI/4KZoj2VRgyFVoEhNBbYFXC8HBm0ioAgTw32J7uli14jyPf6iuKf8kYsc7vpZpMBfCrsHf9hZtmbxBmAAGcp6jDrTOBBWlFqMUrtc9VIYkt+TnC4fODDV2tIquC4qnNdCBPAXVSFkzuu6Ld8DncmOWG6mpGT2+qVkJoTfjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2EJx8+FvlfNTrWPEeYgplBWey4Y0iw9ZcORxE+ICyxs=;
 b=J1G6tks7pv6Ry5YyfHGxGZWyam+LzJTPrbNDYLrCZDw7+FKCyLFyFuzo8wXAR02LjbS4f7eHEpkEWLOTyBBq/jM6z01OeTNUlfcYR7kyg9pp1pHUIu7aVZNTmU0xse8m3ep80B+OCX+hHi6mH/MxXsaK/Qv6cqtBUadmH6fINzQ=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB5591.namprd04.prod.outlook.com (2603:10b6:a03:101::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Fri, 9 Apr
 2021 05:33:25 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::c897:a1f8:197a:706b]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::c897:a1f8:197a:706b%5]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 05:33:25 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
CC:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        linux-block <linux-block@vger.kernel.org>,
        Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
        Hannes Reinecke <hare@suse.de>,
        Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [next] drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
 (first use in this function)
Thread-Topic: [next] drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared
 (first use in this function)
Thread-Index: AQHXLQAx4caOwbMgo0WKyzWAs7v1OQ==
Date:   Fri, 9 Apr 2021 05:33:24 +0000
Message-ID: <BYAPR04MB49659D343D1F52AEC2FF424386739@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <CA+G9fYtNAEwCk1WkA_25FVUrR0QJ2vt2Dh_w+m-QOSjb8f5TBQ@mail.gmail.com>
 <BYAPR04MB4965A95A5131664085CDD8B786739@BYAPR04MB4965.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5bdcccbf-2d45-4a43-212e-08d8fb18ff1d
x-ms-traffictypediagnostic: BYAPR04MB5591:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR04MB5591E34AD8017F6CFB39C52C86739@BYAPR04MB5591.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r/lRVdXpmSYHT2zAV3feGPzBjlMnq9tQeP/ZtaFOx76dsPAT3g1WLq6qvG74et6uqs3bQqBln1W+t+xtF2FIb93fYbv9Avx9egFSZ+bOTlWLG61+KnorhcRaIp1/xGIUxjgSTvhSxeSd6j7p4xw/2VsC4Th3y3r90XYATmoUI9AihFHcC2AziuDXEP0BhfDGv6Z3r1LyGjP4ewFMGvyl2Zwyqm9q/D5lHyHsHBvyZR2kdGLhnUIhfx923KB3HSz7URvfZMRdP+1HT2/k7cZGENZClB10Gdi0hMIM/HeOI1H+Cs7b1nKB6sAKJTO+2Bc16QFrWMWgzLT4QsqXeeFGW6Q5lLAyH0CSUps21AD6kh/i+33E8DJUJTn8ZfK9xX1zE550J3iWfjmQ019FUchZxlfpW0Ny0LOh8s+UnCwzQyxJ5kx0Z02hkWPhSvWZzdYhw9LMBJEdAIobufr/hDhagJBdkc6Ty/T0qzRWUK+ssm+QzceZpm1J3OfYbmMCkwvJdjj4vmXuoWQbzIwGoFsf4FOA9vJMIhOi6ksOWQqdy9fWW5HhGFpvVtoOeEYgvc7+9bN0Iv4eryba/8RjwzR0ES+qdCg5Bs7j6+P1IxOnk2f7vy17U2rZ9oNJFxvhiKIXu+l6GLZv+fr5g4IaWyo60EdesTI2fgLopCExtKiQkWYG/2xOXon6nRB/1VOWNpESurRiiOOKezeXE927V+pzMxyCTLQRDzmZ1bOtvmQ2z6foOT2Lj/RfJhj2YDZ6j7Ff
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(55016002)(66946007)(76116006)(2906002)(186003)(66446008)(966005)(33656002)(478600001)(86362001)(71200400001)(316002)(6916009)(9686003)(54906003)(66476007)(64756008)(53546011)(52536014)(6506007)(38100700001)(8676002)(7696005)(4326008)(5660300002)(26005)(8936002)(66556008)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZPZxYo6JizaGZkFzFEIaifa/EqLKSu+MflHPWdhOZIAhOrUPFN6EpcIG6FCJ?=
 =?us-ascii?Q?4OwMk+4UwykZkR0RbwwRhIxIzzxtjCm5bvAQO9iTQHlZExmyF83j3KSsZmT7?=
 =?us-ascii?Q?BZkJas0M2McydUuPLhvS+cN7j0tXudcMMRu1zOcwb3TC9QFkO3Y2Dhan3oAv?=
 =?us-ascii?Q?CZfGaPqThB3is6Z1xxC4+m76tgwA5J/GTFMDf314ET0WE2BqmFtBVcL9sYH4?=
 =?us-ascii?Q?ibRBR2gu7mqDbOFXmMLGuj0of40OzLutalgtgYNsy3AmLAhYS0kawrLoQliO?=
 =?us-ascii?Q?tbsIym1DMIexyaPfmq5KVC7CG0cLiiaGJ7IH4Sl578+umD/lqcq+3xR8wlpi?=
 =?us-ascii?Q?Y60kkc3wtsxUYwluZ1TJOTniSEIITLfVq6wRQVE6/Fckbh+1breYm97jD0jp?=
 =?us-ascii?Q?8w3ZjZh+xtEdbUSHKoLVyo04ksq+chHrMusdjoNtAENgxKTd9jI/iIEM3G1W?=
 =?us-ascii?Q?yKGtL4nxjAEivHalOY1YD+90kf3pkfUsR7/QKm1g0r6E8oZc18ogAj0iJpRU?=
 =?us-ascii?Q?32NI4cWGW0QGePs+UBtd05aM2mUEwltf7nj87lmfctHzcyie7NkOyu63ceFd?=
 =?us-ascii?Q?6SW3skbgrnH6x8jp9KySPVYzt/MvDyMJh+mm6zpqx4dyxQRe8thdC7Z2G934?=
 =?us-ascii?Q?jkL0NXXuYeHQnktqqBgDMGAdfbM8viqrf2AeBzm0kwzutMRj4aWZ18gDJJpy?=
 =?us-ascii?Q?tR/HC3CdsjKZ2gtL53Y3/SKeaEfJWIYkO3XNYygS5ncsS73XPOjedhVWsSbB?=
 =?us-ascii?Q?09Gefqwu5DcRvBzu2XLrw3DrJqG/VbTJx4QCyeVLP/mhflWJoP4Z72SzyPGr?=
 =?us-ascii?Q?1vX4d+U5c1dMgAp7nk9/YC3b50ODiTFrEV4iC7/VFuebl9oTzS2A1eKiKVHb?=
 =?us-ascii?Q?cdx34M8g5af2R2EvfMZIjz70mkj75UuUtc05OjKDtUWDByzaaBwLkQ8J+16E?=
 =?us-ascii?Q?d7c/7L/dGHYF8YW3762BSHrGFvb4IwLe/G2OipGameG0iNQ/1/KXqtn0dGfy?=
 =?us-ascii?Q?BNb3kCzhuk5RDU4NuPRoP0cbs4nj//qbAJVBAhoWywQ/JCPpKu2NdAnQ5fiW?=
 =?us-ascii?Q?5MIMipstBbQzmM5nfE9Azl6/E90l7lfNDGhbnAyylxX/bX4qidN5gMvIzQI0?=
 =?us-ascii?Q?Qd/L6hdMZVGSmWejrLpNMZ5Hh9I3Vj8jB3AOLnS74lMtp8F+/hWPMtjAhTXT?=
 =?us-ascii?Q?GlZo9l4+acZx6mnL+/bwYzN7UlTqk5NZXBUoHdxA5qKAWwoFX0CCYP9Q2SSH?=
 =?us-ascii?Q?ZGZc4D7apX/ZdlllR6BVZHxrY5oMxMkrt4NbhhMASZQV5LJ8AfjvcWXxWbEn?=
 =?us-ascii?Q?RxaQQCzR4ZxdeUJijDjEVS+JFlj8pANeyoe2gzNTIqUVtQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdcccbf-2d45-4a43-212e-08d8fb18ff1d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 05:33:24.8262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+vOCYRoorFpDyOYqV0nuyp5q+j+TuxVTefcPifENJqDXYQdRP6l1wV12SO0jlktUa+ImZWkwDdU3l4lxg3UdLH+vITJZIWmqGYElF4Ltxk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5591
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Naresh,=0A=
=0A=
On 4/8/21 22:31, Chaitanya Kulkarni wrote:=0A=
> On 4/8/21 22:21, Naresh Kamboju wrote:=0A=
>> Linux next tag 20210408 architecture sh builds failed due to these error=
s.=0A=
>>=0A=
>> # to reproduce this build locally:=0A=
>>=0A=
>> make --silent --keep-going --jobs=3D8=0A=
>> O=3D/home/tuxbuild/.cache/tuxmake/builds/1/tmp ARCH=3Dsh=0A=
>> CROSS_COMPILE=3Dsh4-linux-gnu- 'CC=3Dsccache sh4-linux-gnu-gcc'=0A=
>> 'HOSTCC=3Dsccache gcc'=0A=
>>=0A=
>>=0A=
>> In file included from /builds/linux/include/linux/scatterlist.h:9,=0A=
>>                  from /builds/linux/include/linux/dma-mapping.h:10,=0A=
>>                  from /builds/linux/drivers/cdrom/gdrom.c:16:=0A=
>> /builds/linux/drivers/cdrom/gdrom.c: In function 'gdrom_readdisk_dma':=
=0A=
>> /builds/linux/drivers/cdrom/gdrom.c:586:61: error: 'rq' undeclared=0A=
>> (first use in this function)=0A=
>>   586 |  __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->=
bio),=0A=
>>       |                                                             ^~=
=0A=
>>=0A=
>> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>=0A=
>>=0A=
>> Regressions found on sh:=0A=
>>   - build/gcc-9-dreamcast_defconfig=0A=
>>   - build/gcc-10-dreamcast_defconfig=0A=
>>   - build/gcc-8-dreamcast_defconfig=0A=
>>=0A=
>> --=0A=
>> Linaro LKFT=0A=
>> https://lkft.linaro.org=0A=
>>=0A=
=0A=
You can try following fix and see if the error goes away.=0A=
=0A=
> This can be fixed by following :-=0A=
>=0A=
> diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c=0A=
> index e7717d090868..742b4a0932e3 100644=0A=
> --- a/drivers/cdrom/gdrom.c=0A=
> +++ b/drivers/cdrom/gdrom.c=0A=
> @@ -583,7 +583,7 @@ static blk_status_t gdrom_readdisk_dma(struct=0A=
> request *req)=0A=
>         read_command->cmd[1] =3D 0x20;=0A=
>         block =3D blk_rq_pos(req)/GD_TO_BLK + GD_SESSION_OFFSET;=0A=
>         block_cnt =3D blk_rq_sectors(req)/GD_TO_BLK;=0A=
> -       __raw_writel(page_to_phys(bio_page(req->bio)) + bio_offset(rq->bi=
o),=0A=
> +       __raw_writel(page_to_phys(bio_page(req->bio)) +=0A=
> bio_offset(req->bio),=0A=
>                         GDROM_DMA_STARTADDR_REG);=0A=
>         __raw_writel(block_cnt * GDROM_HARD_SECTOR, GDROM_DMA_LENGTH_REG)=
;=0A=
>         __raw_writel(1, GDROM_DMA_DIRECTION_REG);=0A=
>=0A=
=0A=
