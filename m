Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3907732212E
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 22:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230382AbhBVVQz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 16:16:55 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:55327 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbhBVVQx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 16:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1614028613; x=1645564613;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=/gaumhe9Fq8kfUlaBPNykPDrataXb7E3OJMiduE+1Fg=;
  b=bUFCh5/IA6+ulMAlTZTUUjSH57us1GpkIyAPZGo55Qgc1v4yH3IvBrEg
   Iq72ADe04OZ/c+1lKPgAAc2HzUc6Ls3V19j5DZFbivrQA/gqHy2s7QqFB
   7DeeenMzWXz1mU7JX924Aa0nCnLt0otjZq4yD8o1fk2G2UOmHGeP1/ZPC
   fYds2qdQ+PJZ6wGQdyehb4iVoFzd2GlLjj6wYfkcSSpx8ZS99o2XXSz8b
   sswgyhMQCjRhCyvhpLX7XHGfdc0mq7DpR0lsqOLXmqI/nIHvYO8XnYfPp
   u2ky84WoYr0+rFAa8agDWL5T60DMtB8b+voOaLeuEePFjd5GG+aYMlAx1
   g==;
IronPort-SDR: 2uD+0w2w3hSVwVLoCkI/6hGF37qeEkQFD71rvtMTtjOz/KscBOqnY3rE2F3Q8V2ZNr5CXlmOhb
 QyGjn841V1ay60wG81t5BxLFZRdU6vj2u+bDSu+CHu5bc8Ko462u0rEEUTT4Zf+L9oGfe+x2rL
 vKUAElHQE+o8yAOXLrAKRLDPEvvBZA45u9cRgzAYZ1kPUM0t08KSD0rg4eswARjaiSl+9/gXKR
 3HSfDDOoerl+5LPVCKmEhYmylXf7usi1RdaL94AsPsGVEyRqiya9UzPjiG6W7Yvmppj0JWrowl
 uF0=
X-IronPort-AV: E=Sophos;i="5.81,198,1610380800"; 
   d="scan'208";a="160544788"
Received: from mail-bn3nam04lp2052.outbound.protection.outlook.com (HELO NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.52])
  by ob1.hgst.iphmx.com with ESMTP; 23 Feb 2021 05:15:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJ64fboEsH7OzYaIGL9fVuI8+OVgkte3z2QQdY/ey2juODG8AgTIJ6XTW86rM1peGZ8CSp7d40s81Qv3IjVOTKYbqbh3gYhBtyZ2RGefckzB5CI7HRDvi439MtiUu4hxiWYp1s2RjeUEV7dexRpDqaQmmGZO86HVuLbQ1G3KaTS+9mOqhvHKYgbbJf4EBiXL5/EEsf6FNplk/zAqtaQ205HQO2ASPbWNUkLMY6j4p/cykaLqOCGwstEjS4xIMFkaRp366TW5TaFrbWUxUCPRd1OKuNbpwCsrw09O7XhoxsgrC4uL8gwU/TYRL6s7jzesdXLclG6/yiDzfLIpaI/S6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgMtjkHNS2n97JMuouRtmQfhgGliGcprpOQtxn8c0s4=;
 b=D5YzRSmivt2GBUv96hFXfAJKQUDmz+XZE4X1HNNtqQlajlX7WBRDRq7jY2Sdg3hUq5dx8XZdNjYtgotUq8YJvJp5pJ349nYuGBBrLnhtHybxtyvVxRtr/h4rNPyzwXjhwiva7ssq+4aZ4yIFiNbUAdzIoUHUhXl5ti5hN4AF2OY2JtUTp6XzKXq+tAeid+LtkseNVgSPNkGgt2f/cr8IU4+iitP82nmxogUqvTr7J/A1uIn/FGGLgRiG9I5XZxsEEgSlxFvYVBuqh/EauhvO+637KiUJVWSdnstkb0w1eV70yEliFyDPvVYx3+5zyT8LT7kYvJ1MvOppy7sZEZdxcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgMtjkHNS2n97JMuouRtmQfhgGliGcprpOQtxn8c0s4=;
 b=BaO8ohVOLSElr2sFJYWnQAIWPKKi7Wf3KF9L1IsQSx4zyRhjoftsc/8duMQ8EvxPGn0v9R6tL0BWE9+G+45c1CeKdi82S3PFF4iHOi2AHVPhwJpX31tiSCC+RGGEmbtOFT21HrDHOQSAW0yDs2uJKRX+fFi/cwhuJld1J3XwQJQ=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB3959.namprd04.prod.outlook.com (2603:10b6:a02:b2::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Mon, 22 Feb
 2021 21:15:46 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3868.033; Mon, 22 Feb 2021
 21:15:46 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jens Axboe <axboe@kernel.dk>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the block tree
Thread-Topic: linux-next: Fixes tag needs some work in the block tree
Thread-Index: AQHXCV3brOp8J7J4eE6Y5aAHI1spwA==
Date:   Mon, 22 Feb 2021 21:15:45 +0000
Message-ID: <BYAPR04MB49658E1832FA995CC6D3EA0986819@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210223080104.5d2cd629@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dd25b587-8543-42f0-3378-08d8d7770526
x-ms-traffictypediagnostic: BYAPR04MB3959:
x-microsoft-antispam-prvs: <BYAPR04MB39598E4A2A7E6D277F7B68E986819@BYAPR04MB3959.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cuuKCMDZM976qZv9k6frMLCeP2RPLQfw37EPL+ycvpt3/iWbC70GzNmAEBk7+AO6gSerimvnaQWEB/9TaBXkqX6ToqM+T5qpORCc/2zbYUDBtsxJ+N/75g5cgUs9k2d3YxelWjE73njory7oIwdjS6ObmOklzxbBJ9hiMC6R/FwgqrJTMgi8+A5KscDZs9I5i/DCtpuUpvnwtKT2Us/7Y2ilMgVATDP42FOj+CwhsRb1PLsv+g+GzTIQ8pa1OTWBU0pbJCh2JOLenGnsMpPStYmlkivXCcJwL6no2u43FI8upX2hl2fIxhu+53Pkb7jJNGOaTLB+TLNoV82upXN41eXBJaoIqcj1MGTghPsby1GlvUp4+FvjCEQPgAYe960bCdmmxG1zgjqDhSSNfOdveWeDks4gnKpcwck64YV/+x7rE+jQMbxz/Eg7QhGidFix6Me7D/StFrs2phzvqMn7NXy6BT8QUP5SZ6JnMnPxvryVFhZATqjT8uwdllYyQlXqBXHUFF34nQ3dJF48zhIGzg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(366004)(39860400002)(136003)(8936002)(8676002)(4744005)(71200400001)(2906002)(5660300002)(316002)(86362001)(52536014)(76116006)(7696005)(6506007)(54906003)(53546011)(110136005)(478600001)(4326008)(66446008)(66476007)(33656002)(55016002)(64756008)(66556008)(83380400001)(66946007)(186003)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?vyK7+Nv8V9CNdDHBqDRjV9EIba3wCPUPDNzzVWvS/yZavVUblA7vPETK4xn4?=
 =?us-ascii?Q?otWNR4CHE7UqT0vsFqVX3n7fYBKYW6yQFDZRYsnEuBRPL9yjR8WyNYCzUIyd?=
 =?us-ascii?Q?mfafrcFkNMegrPF5OP536C5pgxUNkAkzLnpELvNTC6nty05BtYlJYvpLhW2N?=
 =?us-ascii?Q?xV1lZ6u3v4BL9AONZVobsdxciviCzVZuu2aR8Lh6cp2fhNl3yUI12f4BqPgq?=
 =?us-ascii?Q?svtB7BGN4WfC/4i/0rwVVRIj5AnibQzy8K/aFodw1cJooCHqq4z3W6SRtWEY?=
 =?us-ascii?Q?mEUlAzBH4USokjwoY5SkFOcxX4RRyi8ZIODVEHOpOC7Uic1RZBvcSBTap64j?=
 =?us-ascii?Q?/TBgFxEyMlKy17o7QSm66G42Bde1D5sT2zo9iLTFtyfglI6O+4QBQTrE4XSt?=
 =?us-ascii?Q?HA/3iPK5GNyKbwCMgzlNIlZogQa6QxyLWAU2RYvA0Ije0dtmGv5oVwurcoEQ?=
 =?us-ascii?Q?QGUtJmy+GknudJuA0GNWxiXxcw+RPn1Mg5Yap1kTuAm0jgRoqPkXlvlfNayJ?=
 =?us-ascii?Q?7ugEd5O9gZWFxVDNy0n+hExUVxIG+M6KA+JA8ZkI/Fjj7ltX/yRqouya611I?=
 =?us-ascii?Q?VIlSz8tMxDQPUNxFkrUJXx2Gs7PTVFsy+RG8/oazXG2XXTGF4tGR0AtDChd+?=
 =?us-ascii?Q?24Wl5hKiwMNfTXMtKxKtJjqr/iOYK1WjHgpkja2r2AHpCd5L3Ql4e6TajiCz?=
 =?us-ascii?Q?jRpb2/xy+ANxULmLqWQnj6fLZ0cVt42CslhC+rtoWmtfFNYcF4q7uTYkU4W5?=
 =?us-ascii?Q?hY1lKrHIuoirQycuZyfz09Iys6AnjBI1Lof2SNogsuS/Dm29/JA0dMgFJUSf?=
 =?us-ascii?Q?QipEhUTcVnbLwv6CZxH16kbZMYuECSu368zuUUTNArA6nqa7wQWsWr7Vb/PM?=
 =?us-ascii?Q?Lv/vNBgGyNaZ6nfFhBXOAPuWG86bIugIiJblo6sJGP4TA19jO5ENpB1ILzM3?=
 =?us-ascii?Q?+nKeK3Ec7i1v5fp0r++mhJvkEYFDT99oORvNaB4tYN+9I4UR9BXcF05BTBIg?=
 =?us-ascii?Q?GqUe3eEh5UWVicyPJwyUXuvAfrbNu2F1STu2fF68w2ztqn06yg5VZK/Qr7BV?=
 =?us-ascii?Q?g6K51CAVZv8TQasJfc0s9j6/meX6TYnEV4J/dbaw6akbGT3G5hqCU6mog+Go?=
 =?us-ascii?Q?Q3rl835oUAkjYO18UNcoEI+b+d0UaLlV4rIQQWJ6+t95RqI/TACIbAbtA96s?=
 =?us-ascii?Q?ci3A6nGv75ASDR2N3FAd3ogXl7vjOTL1R9MI6yf0Eo5rcNksEewIXCatNoiH?=
 =?us-ascii?Q?CNjcqhZ9xwI/Jo+cwGegTgBRTKNVq4Xbp12O5vOr9MyHd2nbgLRxHxKLgzT1?=
 =?us-ascii?Q?bQOAccocuWq/R1n4YLTn7Jnj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd25b587-8543-42f0-3378-08d8d7770526
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2021 21:15:45.8535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CxsE9/u+HkHyLlW/l4L/jaWJa8YNHvW1PRv8LlQ+tabUSS7NyQ+J7MBLL3h1zk7zv3V/ZUjfHQhezYDzMBU9I1J5aHkalecuhveevBnF6RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3959
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/22/21 13:01, Stephen Rothwell wrote:=0A=
> Hi all,=0A=
>=0A=
> In commit=0A=
>=0A=
>   179d16007236 ("block: remove superfluous param in blk_fill_rwbs()")=0A=
>=0A=
> Fixes tag=0A=
>=0A=
>   Fixes: 1b9a9ab78b0 ("blktrace: use op accessors")=0A=
>=0A=
> has these problem(s):=0A=
>=0A=
>   - SHA1 should be at least 12 digits long=0A=
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11=
=0A=
>     or later) just making sure it is not set (or set to "auto").=0A=
>=0A=
> -- Cheers, Stephen Rothwell=0A=
=0A=
Yes, it was my fault it should be 1b9a9ab78b0a the last 'a' is missing.=0A=
=0A=
