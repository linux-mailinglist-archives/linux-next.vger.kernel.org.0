Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C6729906F
	for <lists+linux-next@lfdr.de>; Mon, 26 Oct 2020 16:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783037AbgJZPEq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Oct 2020 11:04:46 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:21926 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782994AbgJZPEo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Oct 2020 11:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1603724683; x=1635260683;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=qe+loTY7AHBX/BZTp6z0cpVj7/zqelmM3Ju9OBlzziI=;
  b=I2jC+O9QCJvNBPlrYHKB6Q2o4IIw2xOb69wdTX1HA+RAhPM+Bn/5L4DH
   MqqZuHz8pjPv8FeE7CskE5+TbYB4IPrL+Snv1FnZOd8cAXdVymZ1WCaDS
   Vy72URcyHHT6BCtKQQIItS8XB/n/vk1C1nhdWi5gaGiEMdntWDmKlNZRt
   k8E6IIxl1fh4rJmqpd4I7hK2arAFTphCrjAUsbVZIumAU2aa8r5vHvlHW
   x0iq3sP7YpLkoX/ox0mtPxXYkO42Hnj5k+nEpWQAD7sRfPix50UYKIzi7
   BHFYFoTugO3NggjjQHuekw9Qmz40GG4HlGGkx18hqkSpq5YCRvy8TEhgU
   g==;
IronPort-SDR: xDRC+EQqL0ALuDdaPOprR3rC9mkaBu/sMyD4Xroz5LWo/ZrE/zwIeE2sBJFJuhr7+lulULQ4Wr
 uRK8vMjn5lZ1KZ3ZenL8fIJdbOZAe+c7kKsEs2j5qCOu5efI7rWMDUDZi8eteNWkzttT5ZxrnV
 K/6TXcvsv0T+GwYfOG2WkqrbFxm0RKTgkjiFvhC+PoQG4KKSb7X5k6xEDLoWruwAEdzXd6X6dk
 JoKSql6wmR6S1HnCo3eUianYDiOMjMuE/trj92wLiZiH25YCejGDzMhs390KxyE1PwDT0y+7P3
 Dog=
X-IronPort-AV: E=Sophos;i="5.77,420,1596470400"; 
   d="scan'208";a="260814758"
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
  by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2020 23:04:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGtYnRvEehcimMYMjABYVGbNEl3cp8q7ce0Tbu0rVT71B/Blc39+zYbP17IJ+Wd2NHvGUpGU6I9QyFNrEdVWMHYMhV3nTEOJVtzhcq9UxlNVZWIMAnYj4aIQdC5c4Ar57hxyw1nP/tmll9SADM2PwqJvZuYYXYhzst4mJ7pWjk/5ZI6MAsgFZESZxge8i/YAB0d+4GYgO4LvVYqYkeO7ZGU9kuw4VB7Xd8DekJ01bMKZx6deKiCJirmNPPHf/LFYfOBDJMjHcGvPzbxb+29Ez4JQA86kaYcyJ1D67GgFc3uLd056wx5xcVRLFbt5HlR+dKFwcas1z3UyiuKQvjkyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fjg69ZzctXay5mtQTwBiPj2kmu9dQfQLKHr2sEDyaJM=;
 b=FItdr55nYnPr6wJViYCZBkqVgcr/ZmZEFybJ4JTPE7q4mFT6BDxjToweyo8rVlAOOEHHhBgyNm1p1bGy+6bUImfr5MHA77XYsA26dAJYTW6dwrNsx8o3X00UITMIuzd1jY09kkqb6e6AzLImycxrHjYEdOiu28XPxrs4zA1Lq022E5ZcqTChbFoBqgRbdEO0fqla7cvmIgl24uo2DrCAf9EYVckY8aJXP9/byeEFrjlVeuYM2190Xl1xMONxI1jFdOBvoYuCl8g68Lrc0G0K7L5bwt2wjeC7kpr116i93gvs5kCYGWL3yiUuO0tASzyhrwpF3JOUxf3lMMGtjIz3RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fjg69ZzctXay5mtQTwBiPj2kmu9dQfQLKHr2sEDyaJM=;
 b=mA3K/jEpveiuuEJ1z3zXzXRvTr7jcjtJ6Ve6XTFkQ582jw2BgyvSRaQHf5D5ymV7nPZYz3iYhhedyoPA98BZ3MDivkpjdCfRdvRdsE74ilPKq6MkSMENLDFmtLo777lTIOrG7tpJUhoNk1OD3tJ9T+k4bYmX8zAp4dpJQkYSZB4=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 (2603:10b6:803:47::21) by SA0PR04MB7372.namprd04.prod.outlook.com
 (2603:10b6:806:da::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 26 Oct
 2020 15:04:40 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::619a:567c:d053:ce25]) by SN4PR0401MB3598.namprd04.prod.outlook.com
 ([fe80::619a:567c:d053:ce25%6]) with mapi id 15.20.3477.028; Mon, 26 Oct 2020
 15:04:40 +0000
From:   Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        David Sterba <dsterba@suse.cz>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the btrfs-fixes tree
Thread-Topic: linux-next: Fixes tag needs some work in the btrfs-fixes tree
Thread-Index: AQHWq6jqjkQu7S9YM0mR3rT4+xMTEA==
Date:   Mon, 26 Oct 2020 15:04:40 +0000
Message-ID: <SN4PR0401MB3598D1F53CA93C24F85610349B190@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20201027020128.1034187a@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2001:a62:14ff:e901:99c1:aeed:d6c6:6a34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca31294d-e4fa-4d75-f9e7-08d879c07698
x-ms-traffictypediagnostic: SA0PR04MB7372:
x-microsoft-antispam-prvs: <SA0PR04MB7372157E4BF75F2903AD0F4E9B190@SA0PR04MB7372.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:374;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4d2Bpxm6TSu82TEwCsmd+3pPiKVWYabmz1LQ/oHVxSiMEzwp9cvtStKsWwekszm2YcRKKJDdW1SZvWLcGbr7jswI7iAyH2Xkyb1JvpmvxDX8aIi/5wdKkCVGTg3UnJQVyd4LBTlUMHm3ZdDvzrdTec+thIucmfCvdlYzWEaIvPDfN00fJgvM8JMlaMVAkd+Ex5OBhPCcr2soGrOGfztkeHYHv+Q7686i060XgkxVTdvxiEuU14NiMRqOePlQbME9/+pmgtO8AUD0izfUfz1GN/6mjq8+79B3Pi/v7OQhV0VT415/zKKvgheUpigITh6d
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0401MB3598.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(9686003)(52536014)(8676002)(4326008)(66446008)(316002)(186003)(478600001)(7696005)(2906002)(53546011)(55016002)(6506007)(8936002)(5660300002)(91956017)(71200400001)(66476007)(66556008)(76116006)(64756008)(4744005)(66946007)(86362001)(110136005)(54906003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: TvPKZsoZpe3Ydg/UWvNe4JQ/HF0DQ5axOdguE9DVei2jts+aNMPUBYBdnlsNvi3nsklE6bk2Iw90uM59Ugp0Mc2JPTTliLmdAJdljbMZ0gClbSp5Vx2lmXuqgT2klZqZ5DuZP0zW7FfrerXzvH4XkRAr9suWhXrDFyHKWJlqJG3z3ZETxA7xSTLJ9o0DMhb0bepuuBJMRXH7PRYb6XS6AtkbYBZIytVjxgn6HbjfByqZjeZhPF7NfnreBkTQ+sXJH2Jvi5OEikr8MJxbH87j+uECY7quhq18GIIi+xSKV8t77sO2xQVy632VD7rFmAJYfgklNr8IuqGIkzGwZa9J0DRqrnzraht+8O/3+MXhzV2rqHwz4xbOG7haahTQfQNqVBQV186oHlSoFefdqlDic4wE8QVqG45GZzUZ9H2Sesx/wxiG2SYHnRNzg4m95SnKJrL6H331lEjLhDUMAW/pRhCTMFpVQo296OLhQvAIF279m7HNUH3Bij6CJjkdYw93jvPfBJOOKY9CRCwomaezuyYbSkIoRt21+oSMxzibu5IfkEillxH+eEYEMrFixJzvAwIhSlu15XWo08JWVyza4PxvhnVZDESPzj7QZbQaSXGEW4MUDXIHiOE/0y9WDmWotkWrR37tVUoKxO7RisOJHYF251A58PjVTROOZSjUYuv9X1mpVOMrOIM/yYH4TShSF3iFNvHnZEqu6yfvcVc9Nw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca31294d-e4fa-4d75-f9e7-08d879c07698
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2020 15:04:40.2574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pR2jX4GW3raPsDJUq2vS65zcMwIe8btjsax86dy2oLFGV6H3TOWS/2d5WTArjmJQcwi00DBZFFOtk5Tbd4CHdhSxBk2/qa/Ybv7qRmE+RGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR04MB7372
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 26/10/2020 16:01, Stephen Rothwell wrote:=0A=
> Hi all,=0A=
> =0A=
> In commit=0A=
> =0A=
>   ae1a53ee21a5 ("btrfs: don't fallback to buffered read if we don't need =
to")=0A=
> =0A=
> Fixes tag=0A=
> =0A=
>   Fixes: b5ff9f1a96e8f ("btrfs: switch to iomap for direct IO")=0A=
> =0A=
> has these problem(s):=0A=
> =0A=
>   - Target SHA1 does not exist=0A=
> =0A=
> Maybe you meant=0A=
> =0A=
> Fixes: f85781fb505e ("btrfs: switch to iomap for direct IO")=0A=
> =0A=
=0A=
Hmm b5ff9f1a96e8f exists in my tree. Probably something stale.=0A=
