Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861214170AB
	for <lists+linux-next@lfdr.de>; Fri, 24 Sep 2021 13:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245723AbhIXLLb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Sep 2021 07:11:31 -0400
Received: from mail-eopbgr1320130.outbound.protection.outlook.com ([40.107.132.130]:63664
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S245717AbhIXLL3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 24 Sep 2021 07:11:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxkR5hhnbV9cS6gXykIPLxnlcIxc7Kt6i9TW0/d/WQRUxa9j68HSf70Bq3Kr0KDzvBiPQ+Q+rbot9jgdqJ4+2b21+4/uPrZF0fLPqFNF8ldwU+/jdvoUNgJw8kNSE3cGsQJV37LbrYc/ZMjujQ83Yz9ZJoBB3ZAAcga7BvpqPEZGsA93oKAQPWPIVjIF21SomJi6HXQRCNVR60z1c0rGkS+k2XFnhM0UKbdJOelbi246eal7cEOXGOLm6K2oGogHCQ7QV92j0QMZAPfrSBBgKITRC++vEBxevtysEwvaXNJRD6dHAcb/pWRZEqjn3pbkPw4WS/K/QQb1kUzSyBNtww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2CFdIexfS0bEwIYfdSh+0haE7usjeXyqrYuBRzjbCI=;
 b=Xk/ZEQE/TCPHpmHN2f55anE4nNUo8VVqYabU6+OYAP8tIgS7kzppIcZ/XI8wmqQXkbvGK9TKa9CoHAptPBjuD9uws4CWh8bcaw3317YSU4qRzwHfj9YLbHZ9mtWhFwO0FnWKVFDMacB8ANrNoY1B14zen02GCmamXe2ZacK+74BXFgwL+h608GFVav9Z7BqpFrIu6wMxbqWhFP0nvLHVIEZ+TNw+2087LBOO5y7gzXlin7PzWa9xEX9rD1tixMLnnKYwsbV0OHE1ETyOj8AvTNA5V3DSUbQzXBJNfQANwjvUNnO/iKv9fKmBDYtrQX8k4oLM/BKBeitIFUf94OcP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2CFdIexfS0bEwIYfdSh+0haE7usjeXyqrYuBRzjbCI=;
 b=MfFOymTSI1WXP4K4bCpqyGdOuiGvyZc5CThTUVZS4eYhqmP562VBavmw/43VHTnRuvIymFqLLdozL9tcLAVeC3whd7LekZYuQb95pLCh3Y63jQ55Oj4n7iOzrNiIP3+CV59DYf04M3jTdBjsD4R4QBBgDSR++F86CB52yHIuTyI=
Received: from PU1P153MB0187.APCP153.PROD.OUTLOOK.COM (2603:1096:803:19::23)
 by PS1P15301MB0043.APCP153.PROD.OUTLOOK.COM (2603:1096:803:11::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.6; Fri, 24 Sep
 2021 11:09:53 +0000
Received: from PU1P153MB0187.APCP153.PROD.OUTLOOK.COM
 ([fe80::f4b7:b8b1:979a:d151]) by PU1P153MB0187.APCP153.PROD.OUTLOOK.COM
 ([fe80::f4b7:b8b1:979a:d151%7]) with mapi id 15.20.4566.009; Fri, 24 Sep 2021
 11:09:53 +0000
From:   Srikanth Myakam <smyakam@microsoft.com>
To:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "dianders@chromium.org" <dianders@chromium.org>,
        Atin Mukherjee <Atin.MUKHERJEE@microsoft.com>
Subject: Linux Next cannot build on Ubuntu 1604 and 1804
Thread-Topic: Linux Next cannot build on Ubuntu 1604 and 1804
Thread-Index: AdexMth36IvvE6aESzefe9hI96a8Fg==
Date:   Fri, 24 Sep 2021 11:09:52 +0000
Message-ID: <PU1P153MB0187B57518188FCDB102025CA0A49@PU1P153MB0187.APCP153.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=718d506f-9435-45a8-b335-4358d4e03e41;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-09-24T10:36:10Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28044f9b-318a-480a-b33c-08d97f4bd58d
x-ms-traffictypediagnostic: PS1P15301MB0043:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PS1P15301MB0043F4E71F6590ACFD533F20A0A49@PS1P15301MB0043.APCP153.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Dk//qI+UBsAnknIF6LosP45qdtzPwOKXA4qxvdEOhgoSQAXruaUEnjaVJeMt/w5I6/2ydgsJdXr5xkCJaeBXTpyhNoCBbl0cEvY+H6HHyt59ZIsv7q8+9iXRdp91dPJZQ+OJ3wfShVr37+34OA5aeuzHDx5wz/68YZKxPUIuoc/NinwMXtaPdmhPOJjgESV0vgv8cWQCHJ4tMsaritqmKuGh+JSBaMvOYfLL1kYlNpNO9bykL9A0+aXaEhZtRliJmYeRC/CpJVfoCHghnRwXTgErhnJeHYDnPJES+rlUbe5VBn+y5CphmmhC/02jcmoKDE0vEt/4dmlSEXZSKTlTbRSRj0FpgQFepiDO44Mq3Mr/KBUhnX/jwdold7s2A7vAQArOAZVg93xx+MVR9kMhlAs2lM7ZStxnZzuZqnZ+J7U+PfzR9FmGy7xy+K2Wr4bMKYrlhzgQZvCsJmaZVvDMQ2kdvSV42l3TL3GIzC5y+l/LCfsy3awopR9OBeUd3mCeH4n3RPMUVstGR4wQhXxbzWcA+/TGO/DPrqmjtZNow/wSTex5HKKFOfZQeMIFOhOUccxcp/7kf4LY7yFpBNZpvftXyQOPrqZneWhay8rFDHB9VXdbzqQz82Viy0BYgMRzlH3cUYG8C7sKxwJhJgjAUIm4Wcu5gnrF+XbSI0/urwRdZnXtP3DhleW3oGvBXIZlCLkmfP5KCs35A5BFL4hrg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU1P153MB0187.APCP153.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(54906003)(71200400001)(508600001)(52536014)(38070700005)(186003)(86362001)(8936002)(66946007)(7696005)(66556008)(76116006)(8990500004)(107886003)(9686003)(5660300002)(316002)(110136005)(66476007)(4326008)(33656002)(966005)(55016002)(82950400001)(38100700002)(10290500003)(66446008)(26005)(122000001)(64756008)(2906002)(8676002)(82960400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?voMQFque4deTCLlHZatm3swJdTWRjCFMIN1NIIF4EPtyM7KMP/zlasbDNXA9?=
 =?us-ascii?Q?+m3ehw2R0g28eEU2YTm1uPzeJhzltldLDceXrQM4vUsQrbUTGshkC0RwvlBv?=
 =?us-ascii?Q?+8XtR36y6MD01w0a9aedN4kIXaMMKFHKSPkixI75aVl8S7RLN9WcDjq95ziU?=
 =?us-ascii?Q?KbhqscsWMy2sl5zClrp080ErxczSHt9SA4kCTe9girx8w3WZF5xpXJ1UKQxE?=
 =?us-ascii?Q?azs9oEZEAZnin+zJWibwx/U1WzlcztMNjEs/QH3p1irJsO2MXqIJN8qYMLYD?=
 =?us-ascii?Q?dwfFUuvhuXCmiUZ6LDyHtvOoYh+3ftnATDys/ei+28k/+WmrDilwoVP9yO29?=
 =?us-ascii?Q?SeumGIYczHwASS3p9z1+lt0pXAyjfy4qs/s5xeA/+o7ImiiWFM1+gF01eZZB?=
 =?us-ascii?Q?DU8ZRSiNVg00YN1NRVKzM4eF5kiR7vnI0z9N54l9Y4qrjq9KayQ/ReE/XSin?=
 =?us-ascii?Q?oGYXpS0jikNERxRb9NMMylxxHn8zBFwCmi3NGB7yvHHTJVoh0qyFZwNNxpqz?=
 =?us-ascii?Q?3W7C/CFggDSpxvUE5K+lzbIRjoi1njrNhcGs5vT9psmYCou/HiwjFujBFnwx?=
 =?us-ascii?Q?ECSBQA/NBFHg137/CXN1gVYy6WJmtLQfavJkxlmuO0Pc8E5TbOePiG/DmfID?=
 =?us-ascii?Q?BUV3sQrwfe03ewOkI1ATPFwFnzm68zyFUddkSENJ6gANAy1OsH4VDFzDRfTt?=
 =?us-ascii?Q?fM16gCIGCcQhuL1YR7h9+aJIICql63MFZPTeqphNpLRoSj7pnkfmUKRu02UK?=
 =?us-ascii?Q?+J0iVbww4jJDGDD3HyiGTWhKRoFTLUvNLViWyPcryneljokg217b8uFFF4Yf?=
 =?us-ascii?Q?cbVceKS1Y/U7SxgJpjByM4084CB0jHbTfIwzVJHxFgqd4Yz9FdLrdH52hzCz?=
 =?us-ascii?Q?Gm8DN76Rj5apb3Lu3Ywg2F8jAi48m6tirSbnyRS6fEAub6k7w2jHLZGa/161?=
 =?us-ascii?Q?B/FORMRlZLxHBM/7mt/TxeBGNf8NT+e51zUVEXhTph2Lix/IB2vbBGThFBVq?=
 =?us-ascii?Q?mIhptNYunzPFgl2bcWMcm1FBxNzy2l4vrYgJ6Aa9xuNeF0JV79d5rkVobhq9?=
 =?us-ascii?Q?hRHrH8iFoRhWcqs2osc0eswgxFJ7QFkzxYYNObfpYyoiVjCYBoKw1HlVSvio?=
 =?us-ascii?Q?iojmCjd/hXXxIEAU9VaVIE3Fk5nFLlsAuoBdylLloBWZ2LZz2+SmmBaKQP2N?=
 =?us-ascii?Q?iMmJxODcWutvmM+66zLG73VCD58haIQEDkXtrHsIjNVbv7Sq5Cxu2rHboyHi?=
 =?us-ascii?Q?tvk3A1Cfftp2iRZA/iyZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1P153MB0187.APCP153.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 28044f9b-318a-480a-b33c-08d97f4bd58d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 11:09:52.1849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WOKowfTwDUNrDYmhsvLA9iL4ZQXwWJDJOE1JAaYWjNbXyEKck1COSO1afrNrbcoiwz8GoIlcTLnXoatNsDdfmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1P15301MB0043
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

We have a pipeline to build Linux-next daily on Ubuntu 1604 and the compila=
tion is failing at building "drivers/gpu/drm/drm_edid.c" starting from Sept=
 15th.

The error text:
drivers/gpu/drm/drm_edid.c:120:16: error: initializer element is not consta=
nt
  EDID_QUIRK("ACR", 44358, EDID_QUIRK_PREFER_LARGE_60),
                ^
drivers/gpu/drm/drm_edid.c:120:16: note: (near initialization for 'edid_qui=
rk_list[0].panel_id')
drivers/gpu/drm/drm_edid.c:122:16: error: initializer element is not consta=
nt
  EDID_QUIRK("API", 0x7602, EDID_QUIRK_PREFER_LARGE_60),
                ^
drivers/gpu/drm/drm_edid.c:122:16: note: (near initialization for 'edid_qui=
rk_list[1].panel_id')
drivers/gpu/drm/drm_edid.c:125:16: error: initializer element is not consta=
nt
  EDID_QUIRK("AEO", 0, EDID_QUIRK_FORCE_6BPC),
                ^
drivers/gpu/drm/drm_edid.c:125:16: note: (near initialization for 'edid_qui=
rk_list[2].panel_id')
drivers/gpu/drm/drm_edid.c:128:16: error: initializer element is not consta=
nt
  EDID_QUIRK("BOE", 0x78b, EDID_QUIRK_FORCE_6BPC),
....
The issue is observed on below environments:
1. Ubuntu1604, glibc version 2.23-0ubuntu11.3
2. Ubuntu1804, glibc version 2.27-3ubuntu1.2

Seems like it was introduced by patch https://patchwork.freedesktop.org/pat=
ch/453876/

-
SrikanthMyakam

