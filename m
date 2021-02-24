Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9403D3236F3
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 06:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233998AbhBXFjZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 00:39:25 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:7923 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbhBXFjQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 00:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1614145155; x=1645681155;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=fTAe9Qq/YKPIFbE2YtI31XWzE1RbFMe+VOLFrLdf7k4=;
  b=Jixl53Kz/ndNSuMe5//pinkhNhUY6+cYMFFHS2P38bwLX9ekMhhxFJ3D
   7tUzByBN6kQuBQqY96O5OTHR+R8d4MctcrFQLWr7mSP0Aosf2HQZPnwBw
   Ds4AihgYEIoNoK1DUpIlx9EgbEGiyMIkxDQqHb/Qwh4pHVzq1PuG2yP1j
   N1ezDHgxaznSG5Lp8ICrqWYPF46PWy38DWDBUEu8MzG/ijRQU4WvyntOR
   oGU5hjq9nFLzF480lusQjjIKeVW3x4R2G/jvnov+I0tLECIPfyHOlo2gn
   w8ITSAOnEDXvtAWvBRMrqlHELh0U8R5PzNBWIFOvGeySlq5xUtOJ9gsjf
   w==;
IronPort-SDR: 4fakP/ReQmJDTu2LUP5ImQr5/5w/qMKVCArzsbqzrEIa3i+S+dTPkyGUln2dRdJyK/kerjRvy9
 b3NdSf3SWTMazx9fIzYQnRFsxybpwmnooPYBvGKNXVPgukYyU/3UmHl1KaRNqa5avK+1GZizi+
 rEVORIStqLk8sYjNvbeLmQgvy0pfbut/vfEGhASscWvHophI2IIgq2mwFpYp3gqwApMkmPNR3s
 yUFGhEOi7ZvbMeaI5/UEt47vrQ4kXnqgGZAIelB5SJ7mZmjiGhgVVqJkXNCz0+9yEntMCoIgiS
 A+c=
X-IronPort-AV: E=Sophos;i="5.81,201,1610380800"; 
   d="scan'208";a="165144404"
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
  by ob1.hgst.iphmx.com with ESMTP; 24 Feb 2021 13:38:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PtFtliaar851H5AsabeZrQPtDvYMoA/8kxXPfm9rGPVrPIH64hqOHWcPtdGZWXbVYLznvUZS7pLjvWAS1b0KpM1mBgfCa0gSU4wlieduX8rmWRPGkmiNeipwSMtWVJw/cKfHhwMMPM/5qsOH3NNdpRA98UXh42IaDOsYSH+VheNAbiknfXrv0et1FBSc97zdQH0SZf12Br9SC4g1OrIF0a96yt0vdzvE3kPzpCdSd5XorgTZgUkETQ1d1T+IC29iNDmwi0f1Bs4BkijqXhjCwf0u87QEohtP9xbVux+zaA8fa8blJOQwAo0ZkcJ5IQqMqf10sCzhL2sy7fjm4dai8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTAe9Qq/YKPIFbE2YtI31XWzE1RbFMe+VOLFrLdf7k4=;
 b=RNURQW81+PVkfIB5PJqCzPZBzaEKrzZDjAc0umq0ty7MNRzi1yeTLd+4Pl5uxAEwERtcfUTRQngXZNRyckOyhFuwMCjpApYGUeRnEPbktAg6QaLfjF21Hnh8j6hsUSYSekWJ32pGsM7Mu9YiB9pZ7ZpBF3+5EqfEyOaq8E2k69MJB1EO3CyU+OKU6oFlWj0FhZR69ObmC6IniVKz9ef4Fg+TocKqG4F4smJsfdqBTJ+JMGbaJYsVM5KiJb3TtknC5Fgomb30Eu1rOMlWCo4Q+Em6b17jmQ9A1GE66OTndC3Aufh/2yi+egoGL3J3a3GJVgtj4Ttzreo1kNoWvq6shQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTAe9Qq/YKPIFbE2YtI31XWzE1RbFMe+VOLFrLdf7k4=;
 b=CeDoURqQEUZKbl/RssoRaseOTkAwiwtpYbx8B8eW4nW7qA6kvp4m5ebKdxvn7/ljcezQWGBGR1UB4viR6+ykBpA07oyVYPb06a6q9rgNjwxBY4Oxmf1ngv9ygpxYAODqDgB7nasgR9NaTIlxgtyz0fWDPcH9Wq1g4OP2Cj9ExT8=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB5526.namprd04.prod.outlook.com (2603:10b6:a03:e9::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.32; Wed, 24 Feb
 2021 05:38:06 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 05:38:06 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Thread-Topic: linux-next: build warning after merge of the block tree
Thread-Index: AQHXClUzpjkXmk4Idkajps6jemEJ+A==
Date:   Wed, 24 Feb 2021 05:38:06 +0000
Message-ID: <BYAPR04MB49657DFD56D260A9D58F9E9A869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210224133140.5f02fa0e@canb.auug.org.au>
 <BYAPR04MB49653608E4E792BCC8804616869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
 <20210224163320.2d8d810b@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c5dec2b3-a9f5-4b32-0c34-08d8d8865cca
x-ms-traffictypediagnostic: BYAPR04MB5526:
x-microsoft-antispam-prvs: <BYAPR04MB55261989E21F46D634632A0D869F9@BYAPR04MB5526.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ypg9yG/346vsHp6j8wseF6WKYCF9jK2qLaAy7rbNBCS1TFEZeHyaLei4aL/+OY359czaHp/NKvHWYLe0ucbHDqvLCLhwleL7ZPAm2I5ZdmI817Fc4IZuhA8TwyBp7LR43/FJRr9IlGW42RV8uS5b1mbhY5XtPyg/RCtCWzqg4Yw9pOU9bR7ll9nQic/hSXUFze2cJM2LAwRe4Uk2K2kpIFiqfP8PdrK6s5HBh7waZLHfFUqVifnMIuE7Q7jQvzTt6HGqS6AmYSxJfFZN1wJsyTT7VQ1zGi990uJwf7HXJ3dGXQOLJO7QprJzCO75WMf/fHrpyUAi0sn83WafHIQ8MgIqyLWoHRenwfaM1f/ffv0v0W4byU+e1AO4DWPTl32ASQfYhdk0NmMxwKuv+Q4nG+OvN4IQwufbhBsiqfpMgRZ9qW0tPZERZBMeQLI4bIu4j6GsSYHfA0fYBo2Rb7EupMp465Xnb47HIOilmCdRX3XmiCL8blis0Gq7ql/kJncLXtAuRAJa7jp36+LqHRPayg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(8676002)(76116006)(4326008)(33656002)(26005)(4744005)(8936002)(186003)(86362001)(54906003)(2906002)(53546011)(64756008)(66556008)(66946007)(52536014)(316002)(71200400001)(66446008)(83380400001)(66476007)(5660300002)(6916009)(7696005)(55016002)(9686003)(478600001)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?oRrMM9J91D4W8AGh/I6642/C+N7/OzsiMElEFmJkNzEW7S4JmGI1SO8ZJbbh?=
 =?us-ascii?Q?P/gwqWf0ajMWdc8mut3Ub2H622ECbI8/b78+xQSvaCqBgb5ONM/iRvbTYcUi?=
 =?us-ascii?Q?F7I0bzNsHWBksd4jRMcCx6SKpLSQIXjy4RmhTJtBOX4aQGEwv74pfEjMhuGf?=
 =?us-ascii?Q?coRBN286bE44yjgfsexaxTeVl85b6mNDikoQff8NxNkzN8fac7/hR7IiUYA7?=
 =?us-ascii?Q?MVkRLQ3DWyQB5LxB4S2XG3hNlTBKPhwnIDg17bgZJWOzxTHWp7P4SIgNn63R?=
 =?us-ascii?Q?YDMWZS8D60g6w6Ibp+JW10P0ePmnmEVchsSYB9x/dLwp3cMsWlext6v7AIhx?=
 =?us-ascii?Q?qiKFQiz3DYAVnnAWTBcxxwfh/c8g4WmlIXxrC2PqlRnQyXK89l+28ew6tBeJ?=
 =?us-ascii?Q?U6OSTSx1AYisteqyyNFZQHKOM/Q8kGIARxBKZ7FRWaidNF/LrdJEgU5qP4MK?=
 =?us-ascii?Q?oQRvvJSaD/NT5GpkRB88ggWQXX4UA6F8XKgchH9G4K1pEuJ8z12d0cet9CYO?=
 =?us-ascii?Q?fFOMoC/rKB00K6ezY0Z34aQiWiuh6uxVu0Mwxcwa6S/yjhbUQsKQixLozYlK?=
 =?us-ascii?Q?Zz5ubE6780f4g1iXzPzt/mpHw9MryXBBTKoq0Emuj2ttbsdDj4M+TtQSioex?=
 =?us-ascii?Q?7UeytM4ZQzQUnSrvNNSZ7s8lw19sA8boxvazyrxAQpOYBnuGBg0GbeNK1Hgi?=
 =?us-ascii?Q?CkyzHAwC32E+Fpuc2uy5oarrgOUJrNGXYUf0EAMVQfhs+O4sPnNZdAR8pCuc?=
 =?us-ascii?Q?zm/pHmPWTG/x4Xy0RWBbk9SVaCHEJRUOXHhAvBnILq407XHnIHUK2Ap7wRpO?=
 =?us-ascii?Q?YejQkfjxWklYU5VugjgVO2vMuqnXw1cMVVsJHXk1Fp8Bl0VFBreW9FJH5Tp5?=
 =?us-ascii?Q?c9QdodpAOiMD+ZmefdPv5/1H5ra30+kZUJu7IG3U134tqHiN4e61ICsAzDij?=
 =?us-ascii?Q?t1BtsRlAX6/WZWv5s5RoHksoYdGhZrB3I99HrqIjBOe0xNsc6QgzwwhzmYiM?=
 =?us-ascii?Q?7tSoqEVNCgU50xZthRRcyWIm+BtyhMLGClu8BCTJ9gZhIzOQkeXRgllihZeb?=
 =?us-ascii?Q?FRm2TREHDjwlaPYbnqVLkdLkEk065sOiCmhFTppG2DBmgb97IpC0Jr22CPCW?=
 =?us-ascii?Q?axzV/w4zhztUuhiJYaJuMT36sY1dt6PGl6lBim5WqYcNaG8hIADaipctaVsV?=
 =?us-ascii?Q?PVFokO8xbhvn7q0wdaeVlZvlaoFGS816YyK9Ah6sodtX8/CuEqO3HAqfCLnz?=
 =?us-ascii?Q?f6yx6ctG1MvumCgQ1sDJIYtaEuVdD2s2rG80Ly+qdv1yu3Db9np13sprs16k?=
 =?us-ascii?Q?HiN9GiQLWz8bhZSxRWhgdJW2UaBjvfJE8QodyPgVXXERFw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5dec2b3-a9f5-4b32-0c34-08d8d8865cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 05:38:06.5828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EpKdMKSCYB5w816ao295W6WlDbvS2i6sC2IJPXihsIaahTBDZx4WUViYDdw9n7rbrJvpGEQizUbJFMoqeuq9ijrjHB/B1YVx9c/1KdmEgr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5526
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/23/21 21:33, Stephen Rothwell wrote:=0A=
>> I've failed to understand this warning as rwbs is present in the doc hea=
der=0A=
>> and in the function parameter :-=0A=
> I presume it is the missing ':' after @rwbs in the comment.=0A=
Thanks, I was looking at the wrong places all this time, will send a fix.=
=0A=
=0A=
I'll setup doc generation using sphinx on my machine, is there=0A=
a particular command line that you have used for these warnings ?=0A=
