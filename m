Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B3A0359581
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 08:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbhDIGcR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 02:32:17 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:42939 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233346AbhDIGcP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 02:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1617949923; x=1649485923;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=WXjhkB5BxWwEvLdGeyAZKsBsV7fskwi2cuNsaGK7NDk=;
  b=E/CzbH9yjI1a9v4TLFRxMD+qLSzhLx/AWGBvc34YUuSs2dlbsO7JOzGg
   iy8rDuXIIFFM7ojIVnvCc0lxNcdcPbfIMaTUSPmehoz6RbFCqw+YbXOEV
   vgNHCGCiEPsb/Z27LG9rmTD4mIJQ2KcKcuLh3uLYWcqqUmx19EAq0trg9
   SxilX+Qr3oKx629ZQI6fZfT6jROrVfIjOplSW+oWvZlUkybkcbAFjLuLz
   AULFgMg8Cy1DUp+GWycNHGh+zl94uS1lTOVsI1wFYeSeKPzxhsvh7ei8L
   Rlyc2tzC02ZU8LKEkeSudultZ6NA6vzSE2t6uBZp5lmUgTY1ZT7BAjOuT
   Q==;
IronPort-SDR: i7LjSk0r57sEcGR+u0ONmay1roinrCUQD8Z5/En2vQHOy/eeaL/fsW1tFJNA/AwhigENG/ZrCA
 CxVG4ShdxDbnheBZIWMC9TqyT5nMPYgmb6r9a+SNstGXQ1XjjCmVYgbWMLj4AqQDV3rqBZsoN0
 L5ggVwYr8KXi+KDz4p8HplhhMFz1ZNHsT16j1KeXDQAAT2KACtlFx7tBB5N8SyAXbO/f0nzIwS
 G+Hinm0qsnbrawcZWaa6ULvFcb9N2nU+vCBkUzeXIdy52McHU22IJKtUL3wUD0V4F1RvPUrf3X
 rAw=
X-IronPort-AV: E=Sophos;i="5.82,208,1613404800"; 
   d="scan'208";a="164276396"
Received: from mail-bn8nam08lp2046.outbound.protection.outlook.com (HELO NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.46])
  by ob1.hgst.iphmx.com with ESMTP; 09 Apr 2021 14:32:00 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Udt5o8dPX1RtMhcqL6AWPsaT1Y02w8aC0cvT0FOGXrxpK2RLVEC2CAY6PUnjoWux3LCXmsLp9xnvz+6e/dh0gMR37OGHXZ17I2tW6E2+AcfpROTbh8WC2dxaVWvo/GhFoZhnRDYOLzqzZBBoKLiPfe8T+rOXrwUrkHhQajaclQ9yKPKsuR0P6+5+dpZdUu53kbUp2C+VjtXiZMwvCAOP2PU209+jJPfUCKMefux7QQaa1pzNG2/9MqN4dKx91EFyFDX+bxyz/HhyfEWdKY7ZW7a+XT+gvi5zX1l/UluSEcaeuY4h7fM7JuYS+RtWhWTXagdzQozrALXoo+jyvQAXjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARJlvSMJ7Fi8KKeYQH7ks22K5X3QktLT4AQJcSxeZpk=;
 b=AKJxxb1ZvJ7TYXdcUltXgk3ikqp5ptsxJG19/U7KMMQirieNovG/1VD7+KTUIBGf0EN7Fxzx6QgCnSsTDYh1KawUS8eNRjqdWaJwXKAu3tNGLiWqCDncDaO8WV+2yscdg45Ao08YGR19AXQv5OFpu6cLr4ywp4UGuoOk8nfxPVWa1LTPQwTqPstGHXV4Kjlarzol00HS23wng6+46N97f/zjryCOVb+bG/inXAqn79KFTFmYHUvNFsrlt7Yy94ZWrYn9ahl3hMfcKnjooQezqXKIWHw/8ULwV6aaWrUDDZzqHZlfQlqcM3azoLs1490c507iGRS5wUyjmp5BkyhL9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARJlvSMJ7Fi8KKeYQH7ks22K5X3QktLT4AQJcSxeZpk=;
 b=pToyF8z4iANGd9t0j3JibHPoCWxGbOgYQsNdv14R+KgHdVbAW3AivtHcjLIK8jojm7wuG9GY1zTgyuHvmfSZU7MGLIR6C4nvj7SIl/VUBH4IXSZ7GxwaS6zDbfaa9pmPKjkypeGWbrzTqGGL1mxy0CX4urE/0G14KbqamnLxnfk=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BY5PR04MB7122.namprd04.prod.outlook.com (2603:10b6:a03:222::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Fri, 9 Apr
 2021 06:31:59 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::c897:a1f8:197a:706b]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::c897:a1f8:197a:706b%5]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 06:31:59 +0000
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
Date:   Fri, 9 Apr 2021 06:31:58 +0000
Message-ID: <BYAPR04MB49657BEEB8988BBEF3C4429486739@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <CA+G9fYtNAEwCk1WkA_25FVUrR0QJ2vt2Dh_w+m-QOSjb8f5TBQ@mail.gmail.com>
 <BYAPR04MB4965A95A5131664085CDD8B786739@BYAPR04MB4965.namprd04.prod.outlook.com>
 <CA+G9fYt30EZOv2mUOf+xGh3R3A0SMJhvVtHFwZuKyBgB75UTTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16b9738a-f046-4222-353c-08d8fb212da8
x-ms-traffictypediagnostic: BY5PR04MB7122:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR04MB7122B14C96BE5889F8514DA986739@BY5PR04MB7122.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: grTTwTbMVnUK9qHYI+DbCSKgPTBsWEsGdSzCdsYnX2EgwzlDrtxtxmDD8ttaAyzfSwc4L+YVfem+DJTDGAxDwACTszLIXw0cvMfnCg74bQlkQRrf6B3+6fGUFhSq//7Xbt3j6bqO1/FRkAy+NnhZY4R1cXaJQMI2CIPgWqWUurtwJB0OmwO1DE2qWu+8i3jHksR4MTxLzpCraBBIfnKDqRgrEGxG4uRGIGF18ab0IBAhdkBhRdc59ZVkKfsZPI44AvfHcWCuRV4ug5oVx15qnaKQHMacyXGjRD6x/cxrTGjmMSS4EzAx6hT1tLEYfvnUD3gx9AA6oRUZeywG2d4YOB70qaUSnkBOsSYsooAy9kqUm33CURadyjLxDK0TQ1d/56Ztw50M3iDdIcMxZJpF++JICu1V4crsIuDU1qnJ6kiCvA3WX/1PqDoS+/WPhfiXoHfLQhCU0t9fDMs9JoNwsuAwP01o+qMdKGrm+1WapbCkgoxfGoPaG97xHfVUkFRdk7TYEhY1UnBEAQiDzXKcbV7gnFiqmazpYgd42IjqfJZPmqOpX/K63s+5p5JrH4XNJ4jkjmKVGkSJIyA5vmnjsIzByYYndRVM+6+VwB1XKf+3DZRvhAfyNUeR8BqPhzj61bevOu77bT+AcUEtRlVGTiAV8iWho3hNZW68vGM+UyY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(66946007)(66476007)(66556008)(66446008)(64756008)(7696005)(9686003)(54906003)(76116006)(52536014)(4744005)(5660300002)(83380400001)(316002)(71200400001)(26005)(186003)(6916009)(478600001)(8676002)(55016002)(8936002)(4326008)(86362001)(33656002)(53546011)(2906002)(6506007)(38100700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?eStye1os33OaylbWkQrZzmkmZ37tSEdezuVFPzX8FdbRvI6lrw219gMXKAOB?=
 =?us-ascii?Q?0ueSBofFyu6tO/UDLzcQq+267qTDCxGqApW+ZyzfSlgH90Lo1BS35VK8ztLK?=
 =?us-ascii?Q?6TBUNcoY1JHorqx/MplUMoMbwidNxwHz8WX4k/EgR5lUbBgOdNcGi/YmceDf?=
 =?us-ascii?Q?UEPzVY2ybH7GOb+xDl54KKOizYEwN824yT9SttLTvmR+Xp13aARcM85yjmew?=
 =?us-ascii?Q?CCPlr9BtPDpALNBH+jtQM0xxhy5k0wL+rU9pcQi6OxL9iknKw2Zw7XHzALet?=
 =?us-ascii?Q?fHTZWYBAq5on2s7XU+gk8wgSBi2MpllswMClqO9ULpssVe75rrIh/wKL6vBZ?=
 =?us-ascii?Q?6pfN4xq96jrDcuLfolVqtt8FWOoHBb612IUors19Dfc9Ndy2SjiRat6gghA3?=
 =?us-ascii?Q?/W1f45w8C4+zqobhRh97kvq+oYscUNjoCVTjbtiziHIgymo1OdWbqDaRewpL?=
 =?us-ascii?Q?FoIUB4XzziF9DvLzJgdl6z+nuVQ9iA6P3YjUXKSTBR7cwap3ONQwCzwQh99r?=
 =?us-ascii?Q?349+9PrEX89kk5zyB8FMcf7aPEUPxhSu3iWRK70STMRU6MeP/CU3TiPzn/1m?=
 =?us-ascii?Q?iNX8P+MBbqG7clLvzmPEHJIm2MRdhPaz9sc1TKTDiZfFML0DRfnxqKc6YNaY?=
 =?us-ascii?Q?d8/qbNIrHYngiIrguVbfayOogGLjc4Fi4QB4rAD4/tZLRVPuuenf6Zu/yKxh?=
 =?us-ascii?Q?efgVsytaWZW2MmNkW84UErenovHG4kRJLPhVeckGWACwSqV4AQMkloQ3woUq?=
 =?us-ascii?Q?xB72VE1N2p7ptjeCEAt5NIWL9hoIOKphPKE9Ws96cZWkgkqjIXETLjsTeFWX?=
 =?us-ascii?Q?BbXWt6ZAqMyyPggF4rDb9hdHXFbg+hjQCS6TnuFy+QoB35tKSRZszv603po1?=
 =?us-ascii?Q?lkVLW7PXOxmy3CE/N37fkzmupkJxY9XWTaDjrdQWEVehEkKOjuxQA/oakXLi?=
 =?us-ascii?Q?NIj4614o2rgGqfdDuQm2/gV8oLOgtm7fLE4tVStNwzOQnmgz/+7+lRhdtJ7x?=
 =?us-ascii?Q?0m+MkZWGIK6rtnuxd63ExnkS5yY/C8ln4QCmwVGl80QvONioL1HXMv/8NPk2?=
 =?us-ascii?Q?wOg2ZMz0e3ZMxFAdMm/dHA4v5u5INTgWkmUZZONL6Y+i4b1Gs+pqrD4ra5nO?=
 =?us-ascii?Q?X3S1+QR0ewcB5ktlcSAo5HeajnLfHmrKaYLogDXAOuTHSiYf08/Qk4U5l3dx?=
 =?us-ascii?Q?+98vQmkTlweZMD26c5VuXJyKyJ2Q52Lw1oSlyE7Tcv48y4u/ygfVt9vsKZck?=
 =?us-ascii?Q?cRcQVktYMI2Oq0/HE8Li6CYHnck+XyqpLTziBOtolcDjCF31NXSzuvL2G8qh?=
 =?us-ascii?Q?miDpKnxEMO30ECZ52jkx+bNnbKB4qdrPXh1selJ+fjlUWg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b9738a-f046-4222-353c-08d8fb212da8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 06:31:59.0236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3izmQu+oCRAZAr4+TbN/iLYhxDnvRa6N7rXCtUOBuPk3EHzc2rnV7tkKHSugQSZmG1BUC8wPgcvvfAoxBcMtq6FjMEt/kKkZMsXF37x/Lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7122
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 4/8/21 23:24, Naresh Kamboju wrote:=0A=
>> bio_offset(req->bio),=0A=
>>                         GDROM_DMA_STARTADDR_REG);=0A=
>>         __raw_writel(block_cnt * GDROM_HARD_SECTOR, GDROM_DMA_LENGTH_REG=
);=0A=
>>         __raw_writel(1, GDROM_DMA_DIRECTION_REG);=0A=
> Thanks for your patch.=0A=
> After applying this typo fix, the build pass now.=0A=
>=0A=
> - Naresh=0A=
>=0A=
=0A=
are you okay if I add your tested by tag to the official patch ?=0A=
=0A=
Or you want to send it as a reply to that patch ?=0A=
=0A=
plz let me know...=0A=
=0A=
=0A=
=0A=
=0A=
