Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B9F3236D6
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 06:27:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbhBXF07 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 00:26:59 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:49478 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233585AbhBXF05 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 00:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1614144416; x=1645680416;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=5CQ/b9GQclOAKfWOFBcqNurRiNH/6sUnBhH/xlQMt4c=;
  b=pLRYtBS6VBDEItH3sr/QQKMLz1uRQU6Rdf1FLni0JR0t1lKzN9MBkzLX
   YmNcXUvZD2vBpNhFgN9vPRh2tVyztSPT/EZXOm+DnOQrQUXGFNK1viNgX
   PM6L2oJTr4X+DM2QF5+hsve1jr2qG/0vRFlWlNej1c2HEOBQ8hBDyVx0u
   kQoU7mmGSxBRz6v49imh3VkYzgQ07otgNny3SmnvSo1X0MY7jIJ36TB9C
   bocU5TgAYoP72O/fu65qZ5vulzXUFOW9vo/23W1tp7DtR3JUlhF0JtJHl
   mT9A+9qduPzS4QFG25CO5SksvwUF6ABO4XHgShfZZrrZaFgd786dj0ZT1
   Q==;
IronPort-SDR: oxHJWItd9exxrIy8ki+6b8gzcrQFEynPLqFj2Nna1tc0Twk51i01eW6/8KAgHQesq8rfIMcJzK
 wbrZK5WDp5hPVVwHueXJNDm7HLv26OfyMsihECCS+CI0Tmfu39C6D7jpCdEZYPQJC3jQ0hg5Rq
 RMFfNODLxfbvzZpDRauMsGfQIq4Q5kgGUl44LHnTu5hgbyEX9Puprl2vjIi6tGOjV3U+kp+UN2
 wUh20bLN+tjk3gQQSZb7aGQqAYUGjEtod0I7hib9pYgZyudkBZmp8iEm8T3qukf2ydE6VqTzwl
 fKA=
X-IronPort-AV: E=Sophos;i="5.81,201,1610380800"; 
   d="scan'208";a="160675361"
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
  by ob1.hgst.iphmx.com with ESMTP; 24 Feb 2021 13:25:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Csiflhg6onWOMMBo5Ib/nYwhfDqKm6sHAQXwdHeKEKNSbgJ+OkcXuDz+c4ak0gUS23+Nxh5LZvrAwTlAdfCnm/QYMIxY1RmzvFI3LAfQdhgCPVmd4PdB+bGQSdYUTzBUa6njk3tXaiDh0bIQtx8JCzXjnibO7YpoM75BL97YPes/mTaVkNw4UN4LdjjqXjf0ME0u8DvRl7zOdABQ97YGhAYHzwF+JDUyB74BCbstHnR6TNaswmAZkB/4IgZ7K6JwjrRqWHn95ci7qq+2Qi7L8DegZatumquiTS4SdY+Aukg9h5Xml69gemJREuo5dJ+nyalfF47pkvvv2U0CCKqfmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FF2wP4XziHxV2Rd2jzsi6EcHRmYs3NYWzJ2Eu4EKCnY=;
 b=TuSLZbylcJvrUg+ysgnmNyGi1nK1i5LPWNeRX3iZSqy7yD0azOAHu3Ux2L7cm5+lSMJcgv2g1wjkP4iAP/iLZOlHOvSZAJKqdK/UUAJ6zYsjPYIkr8PbmGqxYyTji56qlCJhkOaa9PzdA4IfvRFhTJuh3H1n7IC0dyF5vGGzWSC0qb7kow2N+XNZEEYvmEeleErxiQRXhJ6qjPyBT3i/oBzvWMJv55sXPHwqMEgc0tjocIonQwIHrKtu3HV1m3k/nC9f3GhmLciE2hcFxQirZ/W81PZvlg/dNh9zeIE/EehUT+HcidFvuAaLrgo/G5+K5cYSIhdjY5mhN7yEVP+JVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FF2wP4XziHxV2Rd2jzsi6EcHRmYs3NYWzJ2Eu4EKCnY=;
 b=wnnJSdNqs2hfEKg6FSUcO4NxSdJNzY7xhTMnhcmpD6iWWlAhX4PXDwMzPPAyDih9N4KsZec4dn6Vbm8PIu/0iD71QcSDxkhbU15VWQhf60HCpdbtmR4oZCwWna2OZbtESgd8oDQeVMOI0LC3VM1BAQEdjmYY4+oxHUGy0x5r+mU=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by SJ0PR04MB7680.namprd04.prod.outlook.com (2603:10b6:a03:324::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 24 Feb
 2021 05:25:49 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 05:25:49 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Thread-Topic: linux-next: build warning after merge of the block tree
Thread-Index: AQHXClUzpjkXmk4Idkajps6jemEJ+A==
Date:   Wed, 24 Feb 2021 05:25:49 +0000
Message-ID: <BYAPR04MB49653608E4E792BCC8804616869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210224133140.5f02fa0e@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b07fb1c8-a559-4b4d-3806-08d8d884a537
x-ms-traffictypediagnostic: SJ0PR04MB7680:
x-microsoft-antispam-prvs: <SJ0PR04MB76801663181D9B5A0F00A53E869F9@SJ0PR04MB7680.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e9RVHA6L6X9emqTehJQ1Fwj/sVSsirUV7uYP0QStDE0hBcR2K3lJXHU6mcuKKGHDNaklfWuJJiXvj3H1d5LA9jAfVhwrk3Bu+Z+XUVRkEEONFuWm3a24XnndkHpNGH7sydNigzjM06iO+C3uHIrdjwk/ODeg7LLUH+RzELVSOGMmd1QJIiv8AGdsHLNKVOUneCn7kMoYlkwzhQgjPX8hILp7nMsrzq04Isiz0erKT1m6TN7uDPGHt9l8XgAWi9IIlsaVaZRihxvSjt/4599hWH7wVCdjJpRfAkvU/WBedJU1nOR3OKCyRfMeIJzPvNHqxEiiwyiumFmhaqtwieYiYuR3QNI4NO9dXN3wq1k842uQhMfU42vq4weTmL0V3gmDLoslrv0n2j0aXjtWuy9AhCkVTRaqNIXVabpQFspT/h/0KOXaX05EiT7onAtqhbNwdpH/XspJNvClqAcoCeGOAVfFivlR6nehVCX9EsYZauxE2tKkh34+OO408A9wleFfK0FIn8/v1ceLVlvfredeLL4YWaTUQ5f2o6V29g9sbJxpvvxLj0PhDS6kFD62v7gP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(53546011)(55016002)(5660300002)(6506007)(6916009)(54906003)(26005)(186003)(66946007)(478600001)(8936002)(7696005)(33656002)(8676002)(52536014)(91956017)(316002)(9686003)(83380400001)(66476007)(66556008)(66446008)(2906002)(71200400001)(4326008)(76116006)(64756008)(86362001)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?YcRuK40fZl3EMUV2tXGqJysZGfaDWmdSm8KMyEfpQgk1H6O3Owy7cIB42GDM?=
 =?us-ascii?Q?0nuv6E5YXXDrF9/vITI3Cx2FebocOP4xtEYIJvo6agos/WK/cTrqlPmI2Bfi?=
 =?us-ascii?Q?2+L3Bwh63+FD8w7Dd6nWRLAvp9SXkVrvOa9jwmc+cFrL2y5VGmRQzpjHkbfO?=
 =?us-ascii?Q?9oVQHY44P4Zf1t0tD6RpCq71Z2uodrC3EOJ+poJz//gvFPB3Mp/BRZ8EBYnF?=
 =?us-ascii?Q?yGlG8b8Z/1+roZTy2FptBzwnnwUr6L6kmVO5j8mvfa4tEN8Z1OyK6LBFSxPu?=
 =?us-ascii?Q?6juWCh5ujDXjwVUydXSDxeGC5mV7ayNzD+xdfiGSNqVx8sReYraO5nvL+u3g?=
 =?us-ascii?Q?k/uTlCGA0J17cWdnapygayOfWE2RoQYjPQPGwphlMJBBSPXBTVYnOeJADfjs?=
 =?us-ascii?Q?BvaQsFpufEQ22OwKf52yM9TkoMtKVM7vASpsBKlbvTAsMJ4E5UofrNxE3cFQ?=
 =?us-ascii?Q?sk67dJCPne0xkj/y/daYCswQDSEfuMauFs/GCF7w1EdPMjCAzZPy5tobfDeP?=
 =?us-ascii?Q?F8da90Dp+RFLxB4Bkyi5BbYUJnET55CBgcFCHf1HK0QsY+OqoI2mIt2KcWp9?=
 =?us-ascii?Q?EVi4UrcUgxDE2dByu4T4I7W8rtP1pjD1zCA51eMML/ta0vJplHyBiocW5zxp?=
 =?us-ascii?Q?L+Z79ez0sYeBr2//H3vn723ugl7fvKDdibExAQ9gYEWewDNFjwdCo99QZWOY?=
 =?us-ascii?Q?GO2lWfbau15E6SNtBYXkAZv2UDJnEgyZWDT4TjDg3alMKv8C3eCRLeNj26Vo?=
 =?us-ascii?Q?bVhz/Hq+RTZbxx8GaSX+efPW+L+XkDS2c2jh8srwLBL755hSy8rDWU5eM15j?=
 =?us-ascii?Q?kbypdrh18OBz9HoQzl6Phx4EKvlfmKj9QwUOYAaq3hTmDgDkcdlQwSsnh8kp?=
 =?us-ascii?Q?Pl/FvpnypLcvhcbbRpx0GWaIr9TCsFd+8v95WuRRXN/H6Hhz4K6W79bMvIR8?=
 =?us-ascii?Q?y6qrSU8DpdrU5RYGsTkeLXGeWWKJ8ksY+IxFRGHWfnsFx4X7pmtHFy19kc5g?=
 =?us-ascii?Q?yTfmd9tOwuF+V0gGV/rnorjAtGsP8lsO8opk5MgQuVAG02EAFZ1KrtxRmRGj?=
 =?us-ascii?Q?/rw2QsOnL4JiPIbh1MIE5Ybt07pqo8M1YnJkH1dg4+q/avDHbV/gHHhhALyQ?=
 =?us-ascii?Q?Lef0Piz5LANAgvY5wWK1ZNg5FVo7GNXO+h+RdkZGmpIMJYoxhL6CiYCtPY7d?=
 =?us-ascii?Q?LBaASNw8r+dEnoRj8yFwXgLBkKVjTS7csXbbBp60/eD9gQfywFXN1oTIA2SN?=
 =?us-ascii?Q?UHrqyAN2FEVOa1rQgmD+Rq7KCjNpkzD+A+z2ZowJd4K3eG6iQa31wjljy2sZ?=
 =?us-ascii?Q?mDtCexqkKlInkOK2Ta34zEbmlYN6kLn7D2WB8RnR5kLxVA=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b07fb1c8-a559-4b4d-3806-08d8d884a537
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 05:25:49.0908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eMNQ+ZvV/10YPxPawgaOGFHVMm0hSmkoEDxXo4Ux62Go2jcmjgJvRkTYGzoZfY6HyuvR8LCjyg4q/edoQTLNY1itP13Nl/JtXQL3jRHsMGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7680
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen,=0A=
=0A=
On 2/23/21 18:31, Stephen Rothwell wrote:=0A=
> Hi all,=0A=
>=0A=
> After merging the block tree, today's linux-next build (htmldocs)=0A=
> produced this warning:=0A=
>=0A=
> kernel/trace/blktrace.c:1878: warning: Function parameter or member 'rwbs=
' not described in 'blk_fill_rwbs'`=0A=
>=0A=
> Introduced by commit=0A=
>=0A=
>   1f83bb4b4914 ("blktrace: add blk_fill_rwbs documentation comment")=0A=
>=0A=
> -- Cheers, Stephen Rothwell=0A=
I've failed to understand this warning as rwbs is present in the doc header=
=0A=
and in the function parameter :-=0A=
=0A=
/**                                                                        =
                           =0A=
=0A=
 * blk_fill_rwbs - Fill the buffer rwbs by mapping op to character string.=
=0A=
 * @rwbs        buffer to be filled=0A=
 * @op:         REQ_OP_XXX for the tracepoint=0A=
 *=0A=
 * Description:=0A=
 *     Maps the REQ_OP_XXX to character and fills the buffer provided by th=
e=0A=
 *     caller with resulting string.=0A=
 *=0A=
 **/=0A=
void blk_fill_rwbs(char *rwbs, unsigned int op)=0A=
{=0A=
        int i =3D 0;=0A=
=0A=
        if (op & REQ_PREFLUSH)=0A=
                rwbs[i++] =3D 'F';=0A=
=0A=
        switch (op & REQ_OP_MASK) {=0A=
        case REQ_OP_WRITE:=0A=
        case REQ_OP_WRITE_SAME:=0A=
                rwbs[i++] =3D 'W';=0A=
                break;=0A=
        case REQ_OP_DISCARD:=0A=
                rwbs[i++] =3D 'D';=0A=
                break;=0A=
        case REQ_OP_SECURE_ERASE:=0A=
                rwbs[i++] =3D 'D';=0A=
                rwbs[i++] =3D 'E';=0A=
                break;=0A=
        case REQ_OP_FLUSH:=0A=
                rwbs[i++] =3D 'F';=0A=
                break;=0A=
        case REQ_OP_READ:=0A=
                rwbs[i++] =3D 'R';=0A=
                break;=0A=
        default:=0A=
                rwbs[i++] =3D 'N';=0A=
        }=0A=
=0A=
        if (op & REQ_FUA)=0A=
                rwbs[i++] =3D 'F';=0A=
        if (op & REQ_RAHEAD)=0A=
                rwbs[i++] =3D 'A';=0A=
        if (op & REQ_SYNC)=0A=
                rwbs[i++] =3D 'S';=0A=
        if (op & REQ_META)=0A=
                rwbs[i++] =3D 'M';=0A=
=0A=
        rwbs[i] =3D '\0';=0A=
}=0A=
EXPORT_SYMBOL_GPL(blk_fill_rwbs);=0A=
=0A=
