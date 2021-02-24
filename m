Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC0DE3235D7
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 03:42:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232725AbhBXCmA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 21:42:00 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:56758 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhBXCl7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 23 Feb 2021 21:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1614135150; x=1645671150;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=MCLM/IEBtWAuA6VWITIRwnTKfliqixCIEXNKPqwfhzQ=;
  b=JmVAAp+hV8wLelaK3hN408uzULEnQ0SDLhiP93X/miNGhyU5xmWSzNJ2
   uxtgYoaO+KrioFS9q1L6OOyFi0aBvJb2cle2BCvbDt1Yr7qLDvLl19Me1
   1C4IvyHAgTT8kXD+tKUuJf8hl28GoxnSfEZ4KaeLyjILoHra02Vs80bh8
   3FB+qptvncWng2kkpzbbn4YKrbgcAxiaDb46jtfFQ5s/CpknPnQCQa/a2
   7Bs/Zfb9U9JKBeiopFElQK3s7gQWp4tAEP833QWztgIOuKTcoyiG0vCxz
   ryAgYgwEG6BIoe9Vci38RTaT5LU9MXxMquWx/olu4raQhWjPwA0YhFMGz
   Q==;
IronPort-SDR: XjJh3sKpsLLq9dyyxtZ1fJ0qBuY+ua/SiK72NIqaKd66MPiRD2zaCCLW1fTzG6Re87H0TCYMug
 KJxXFpdnAR0EKtxbenYT2MMfH13VI7kpaWgsT2mNPqMdwM0tQNot9R2/p4G8TOSi4sk9b5ScGM
 HiFMmN2IAgN0wni96rIhY2kmLUeco/edCY6Dl8orOX2qS6mHl7wyaK+VTgRwKiOKnUjRSu/zhJ
 u2t/KDyW7ahhhV/KYHfHkbLeabevCc5bbEYH74mUALVSOTdczP6nuc4eumQIXIwpWlnAy7AT1c
 U0k=
X-IronPort-AV: E=Sophos;i="5.81,201,1610380800"; 
   d="scan'208";a="264857677"
Received: from mail-bn3nam04lp2051.outbound.protection.outlook.com (HELO NAM04-BN3-obe.outbound.protection.outlook.com) ([104.47.46.51])
  by ob1.hgst.iphmx.com with ESMTP; 24 Feb 2021 10:50:50 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjYtU5+KgmWjhyGOC6U5O20c4Oxv03xF29RHeFgTuvItOq3+GZKtVOrcvcJnWXQNnuzBUTyE7Q4du1VBDu806HGRYiaHbBpo9UVkND9kzBGUb+62rl49WFEPo+GPIjlNRyHew91H/ZvGubJpTEG3vR6HhiwYf5GWs9hOEblQ4W2yVjDuFgwLByDzcSx0L4we7A3HXVeS30ihXBiQPZ4uHtgkL35SZeuJEL5P5IIB1yo7Cnki40jlrqklM7W05b0oQpBQac10EBBNqpU+5Ca+ICqPBA/9qJeMRWfycDadTPEKqJx+3wSHnFuSsfeyzGCsvCUvqEgqa5pU+L3Iz0VvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5BlBXw6xW98LFpu91cffafC0M66WA/twqrU7biBGhE=;
 b=Wu2pzP7uRXXMm4F/4P1N/4u04oX+F7KS5sMxjrvi2n6FJPykebZvHp6F+10vEUfIE8o4eB1E0pEtnSDsgUkGtjMJXXiogNJKJ5pXrwC3XLcgJKJU0sJhClCmWzU1+awklJO7/JbkBRKOiOMZYo+bpKNPBTbFivIiol4z1pquJ2sRNmFJ4ot7Bb4VhgMtJbLFk2C1c6hrd3yfUqZufqNmJfEd5pdXJyZL79BHN1ycM+5iaW1b2bpYVB77UoOqlnPVqD0hTxhrmtGB8rClwn+NeBt6OHxwGo+reWQ0J/vbTuxId9mFfsbTPaz6lH0tUwTOQrXxTaJgrpAQ8WXlvs2a9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5BlBXw6xW98LFpu91cffafC0M66WA/twqrU7biBGhE=;
 b=Db+V4iVTo3r1FhLlQnThbI4f9MehXI2AR762dSYpWk5+SdEVCVJHQHfF69074bOPN2ajQVAZRHBeGPksAQ7f/ga979UVUQRbksBn44Z6HKEQuuAyLEXKsQmwZPZ7F8H2ngJMGm9eJFYIRF0cso1QMbkEvBEk8tpGuGqlH2YiGRM=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BY5PR04MB6897.namprd04.prod.outlook.com (2603:10b6:a03:227::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 02:40:51 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 02:40:51 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Thread-Topic: linux-next: build warning after merge of the block tree
Thread-Index: AQHXClUzpjkXmk4Idkajps6jemEJ+A==
Date:   Wed, 24 Feb 2021 02:40:51 +0000
Message-ID: <BYAPR04MB4965BCA8789350BD2D305C82869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: b59693b2-2294-4cf3-a321-08d8d86d99bf
x-ms-traffictypediagnostic: BY5PR04MB6897:
x-microsoft-antispam-prvs: <BY5PR04MB689789A559411F6C900E1E1D869F9@BY5PR04MB6897.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:595;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: txauoHXQZesv3A76L6FhiEZWPauU0C0tZl1yDOvKL4FXLxJ2cIc2pwWLjJG5gXgWMEQi0CB6TYLu6k3sY92Imdxe3+Gc16z6mfjY0FeSAnKc+M3trwlJTW5eUBlwFUoRQNa6oBx6LsTHRoAPFadDv/bVWc2zJ2UdZS4aBKMlpIGVWV59tYNBkge1ciBi+ohYUMLONYF+cdBLOkozstcDt8k9UY3pPlQBTmzviycp3byLCMb28llhYeM8sXVyOl9b9Np8q1jw6m3cdPXbXkBzTydW62f0bjjxajShEp8IWowJXVw21WBMjVQno82Tj/3zWXmvplxMM8i6D5WFeHErW61UpsfiG/8D/4ueoqKBRN5SskH2aHSTdFLx+54CsBq7QaA0x1IeKditWfXJnmMs5RR7Ht+BUFDtw1/UgbWgTqx933NKyjbvKzVdhk1IQVIyCTZNFrZLQcA/JqlLDNjLO3we/16WedWgPV17tuk4bux6X0GX0nwLOdxmr9CBm0wgcIjQNSgbEd0Ry2Z8Ov5sRw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(52536014)(9686003)(55016002)(6506007)(26005)(5660300002)(66556008)(66446008)(33656002)(64756008)(66946007)(66476007)(71200400001)(186003)(4326008)(91956017)(86362001)(478600001)(4744005)(2906002)(83380400001)(7696005)(53546011)(8676002)(76116006)(54906003)(316002)(8936002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?c/RJq2xCjRh1LX0j0NDukFgcfmcQobcB4RlyAEFRhnEDHgCLE4oj7vUqrQGf?=
 =?us-ascii?Q?CQxZgO3d2vQuPtt3tqegiEa/g9NOPyolv3Gnxxj4EiXKPNN40saydAQIwsXs?=
 =?us-ascii?Q?Un6JzvX8IMtz1dXz1DUI4ygc+QKppbj3v4Usbv8rDHK4Kl/OyulkterqSEOv?=
 =?us-ascii?Q?9AVUUH5Wa0xz+HMUF8b61nWUPB2m+Tqc06w8Mtof8g/EbqPTh0pLRiivOe5Z?=
 =?us-ascii?Q?eu0D7nbB9jEmXwhjZE2FZvVNU0PhZDRZS/JqH0m5P1E98lW03lbKSutFmrER?=
 =?us-ascii?Q?9wfRhrERKke1Foh6ZhSwoMxXJDgzy/fYqiclDDKfgPclnm+dvvhhl7DGGcjr?=
 =?us-ascii?Q?wCMSPCQvlTZRoytMCfkUZM/+i/thH1UiaQy/TWgAT2/clBbeMeMs83+BcIts?=
 =?us-ascii?Q?KUxbVLFvLYJZnMqmp03CRoQD2gbftULg/7Dz8P0i9OxaTVulmnzqI64aE86u?=
 =?us-ascii?Q?R8PaIMb8wPQ9CAdZ/MjwH6WOMacPIXforTUQxWGdBLO2cqRHb+vxK/xqegcw?=
 =?us-ascii?Q?9UiaxzGEmXtvkbRZIzLvTmbjuafKnLDBGjXJMCN3pQ121olzA3FO9SSw88mL?=
 =?us-ascii?Q?DsgFKxb26kh7AHHuwqq5V4MFkrh6JGoREak07iDtCb6vuOioguPcD67F0Pgk?=
 =?us-ascii?Q?F5oSqBs4zI8OZExR+XmutiDiXGludMFhjKQfuskZOtAVEbVOva4EKsK+a0b9?=
 =?us-ascii?Q?7eaPGrqUfQ+OC6DpDDrDARv4k+XLQlQOY8vtMxWgTsnOCZAw1AXcG00EumW7?=
 =?us-ascii?Q?JF+M0HxJMaE97spxnN2EKWiS26KvfidgZz0GOEgAezzv2DETsCeUuvpGA+u1?=
 =?us-ascii?Q?FEu9f9GAxlznv6pBTMmN3OmvkghTlqHIDBHZxXWVk9Hzl6hrPBesKEyUed+J?=
 =?us-ascii?Q?W1lPO1wnMP3ElujinCWSBFFUGyN6YtPqM72gKvZjQzEHw5vpOxPCglIziHds?=
 =?us-ascii?Q?IuA74qbX+GoFARasg+mF+SFOWfjtwzLHbIJzXbghDOoDnFB4eNp4Lc0Ty4oV?=
 =?us-ascii?Q?rPe3BMMfHufZRntMlHozhGo7X5PSyrjCO/TpcuVQyccq8UD4dPkAz+UkUsIT?=
 =?us-ascii?Q?tvq1qR5gdVjh8E5klqIb/dH8U4NY3qHNNEaqmGjR8TJE+BtTCipDlKHBFSis?=
 =?us-ascii?Q?xVH6BkzS3ayop8mJdWUrEzZp0J7zP5d6w/rFayzLNZfPj04kKMTHf1sTCC5Z?=
 =?us-ascii?Q?DJB4/GdP5YWVse70PPqQ3AUG3QYvhHWf3yHVyYk8Ph64ru1BkQ9ke563LlP8?=
 =?us-ascii?Q?9NlcR31pfQLuySwRPFNmfa0oRMRxv7C8OzBcnp6BBiSwAlM+O+cu6XMnRzlX?=
 =?us-ascii?Q?5yb6fvWXOLtp6gzRkn9OdlcppCEnAXffoxjgDKVJ7U7YYQ=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59693b2-2294-4cf3-a321-08d8d86d99bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 02:40:51.4413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bo3IGjhfPtlOIQSlIlDcObjVJZohexPHMm6q2lG2MqmPmuhDQF6wOvvQWtszGCXyzEqJnCFSQOLM+oAI4QKBkXZmUfnwi8gbPjD0tQGCwEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6897
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

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
Thanks for reporting, I'll send a fix soon.=0A=
