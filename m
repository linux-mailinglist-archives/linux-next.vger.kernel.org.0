Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02345158636
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 00:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbgBJXjq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 18:39:46 -0500
Received: from mga14.intel.com ([192.55.52.115]:31399 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727452AbgBJXjq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Feb 2020 18:39:46 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 15:39:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,426,1574150400"; 
   d="scan'208";a="405758508"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by orsmga005.jf.intel.com with ESMTP; 10 Feb 2020 15:39:45 -0800
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 10 Feb 2020 15:39:45 -0800
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 10 Feb 2020 15:39:44 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 10 Feb 2020 15:39:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHwHbWN0GVJkaM4rURYTKtNbSaiHyTN6uXHvkzp4NnihmAMhRlQcyDj2SMEcvZwThicXFDzjW1JmTVAAK5Z22A1hGb8XzUQa3kLgaw/Tqe+zJd+UeX442/vh15b+fY4eM5ByM84n2wD+NtH4bSC057vU0XflyKSaqBMSECYN7wjXjQbTbJkJgQ57Lk/dKKTKQto5kCysL5LECbSHk9/bm+E9f7mthaWzJJzfJplXt5+SCOyLzTqKIBgcCCFxt39Yk7iIwkAXoYXaa5F+5zDby5H8wnBf7lP37SvcAZxwnrl00QbuPww7zgsDo0VcdgMa2v2WmEurEwiaNN69RdRfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ksd/Dekrt+jOU+6rceBoWandTi4hSz9a5CsR1Hn37M=;
 b=GwLX33teYUWCl/wwODuzkqL77DnHVUqG6xX/ntwPcAhpQaVZsaLN2LhsKZZuD6lNlHIDCmpkHviPR2OwywMoy5h/BS2NCVgdscr/mSre4IlR4ezG/zLf56dM1D+oJWNimJ4Ar63on3/3DWy2PoaAXDJZQAt9coejC2G/AaJv4KgseHdVTX/Xc6cd3oik8EN1GK8VakX5w+pbv0mrAiNCgrSB9vnXCSpCBZ6XHsiCvn8d33XI/qgEwwH7lyeuVd9zJIrnMWwR/+G061qBY5bPf9eM5VeOQGFvy7uNY2O+vyJ3rFAwHJ+B3b7U3VjvGZCro0hxJbUYIYoNYCHVjUD4Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ksd/Dekrt+jOU+6rceBoWandTi4hSz9a5CsR1Hn37M=;
 b=q77w4mrloZ6+hzOvHW/Ht10I6ozucJIpEVK3DdLucV7DrNyggxyrPW2CL9QzXWolns3VCwR5YaoCVt9Hw1Iy8Mx7PEoSWbDznc6nA/kKpjYLl83ISKD/fQenrgp2B5JYM966FHqSRvm/PfeQ/MOOB1xTB5E5FIH1iZLQkYHi5sQ=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (20.178.239.225) by
 BYAPR11MB3511.namprd11.prod.outlook.com (20.177.224.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.24; Mon, 10 Feb 2020 23:39:43 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::e963:3a31:c5a7:6204]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::e963:3a31:c5a7:6204%7]) with mapi id 15.20.2707.030; Mon, 10 Feb 2020
 23:39:43 +0000
From:   "Kammela, Gayatri" <gayatri.kammela@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the drivers-x86 tree
Thread-Topic: linux-next: build warning after merge of the drivers-x86 tree
Thread-Index: AQHV4GrsCj3weAEyq0u7VgUuIBAcRqgVFVfg
Date:   Mon, 10 Feb 2020 23:39:42 +0000
Message-ID: <BYAPR11MB3624DCEF77C16D4B603D9ECEF2190@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20200211103530.41d1e6ed@canb.auug.org.au>
In-Reply-To: <20200211103530.41d1e6ed@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=gayatri.kammela@intel.com; 
x-originating-ip: [192.55.52.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dffb1556-0b79-47b7-a1bb-08d7ae82810c
x-ms-traffictypediagnostic: BYAPR11MB3511:
x-microsoft-antispam-prvs: <BYAPR11MB351154EEA07EBE9C1D7CA7F6F2190@BYAPR11MB3511.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:55;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(346002)(376002)(39860400002)(396003)(366004)(189003)(199004)(71200400001)(4326008)(76116006)(5660300002)(52536014)(86362001)(66946007)(66476007)(64756008)(66446008)(6506007)(26005)(53546011)(33656002)(9686003)(66556008)(110136005)(54906003)(7696005)(2906002)(55016002)(478600001)(316002)(81166006)(81156014)(8936002)(8676002)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR11MB3511;H:BYAPR11MB3624.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AJSboXsPIGf6er7JfE8BIuZi1/tsHQBpqrpiQ014cQkOahBzLozlZG/VjPX45QOtmVOXHOtE+svQc/WeN5eeIGeKGBxaFsV6UWg8wtDulLA6hSq48UAuA/uJJKF/mF1IBrNED7PDce3HZlVxBvTMQMX9zql0s160NbEMmsx/PwxNVoMJggXxed4I5jC0L9cLbaqwrRj+stP/jmFkti1uyz42p187gsUWxtOmxmXRXJFuhTeisIpGEMnaRO1lntrbevpZJlhAJj21obeprtY6ScRW8f1BI0nV/DdMW3Zc+6R1Mwau4jv7r6DCHvkqBCAYUvVJB+9M/F8guSFOlu9bZfHKpI5IJ6ZEK4WyI+CBJNRlmiYRC1gxkpd7Vcl1RYmGZVvY54VkYXOorLodllZCCGcsQz+pJOjc3Z/2ozMaKtc6ohlNLFaPCXngmwOu8F2K
x-ms-exchange-antispam-messagedata: rtpNEgO1NKCP87dOB5R0zdTwO5WYnFkgks5EUM3r+jLetXFQCEiztQsD0gV4F38NMWxw0TnvaoTuOVBGeK04vHV9xIlZKP1NmamdoNwLmYpihDm3TnZ8R94mhzWK0sVTSZTbSwd+FE4e45bXfvjkgw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: dffb1556-0b79-47b7-a1bb-08d7ae82810c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 23:39:42.6346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BXdtvu7zcAryfONr/OgNzbYOQaL9Rkmqc0QNi7emLUh5xVLink58R58k//vfHq6czaBA5EUln9fNAnUuHM+m/OUGH6097dc1DbSrqccTdqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3511
X-OriginatorOrg: intel.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Monday, February 10, 2020 3:36 PM
> To: Darren Hart <dvhart@infradead.org>; Andy Shevchenko
> <andy.shevchenko@gmail.com>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel
> Mailing List <linux-kernel@vger.kernel.org>; Kammela, Gayatri
> <gayatri.kammela@intel.com>
> Subject: linux-next: build warning after merge of the drivers-x86 tree
>=20
> Hi all,
>=20
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>=20
> drivers/platform/x86/intel_pmc_core.c: In function 'pmc_core_resume':
> drivers/platform/x86/intel_pmc_core.c:1329:43: warning: passing argument
> 4 of 'pmc_core_lpm_display' makes integer from pointer without a cast [-
> Wint-conversion]
>  1329 |   pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset,
> maps);
>       |                                           ^~~~~~~~
>       |                                           |
>       |                                           char *
> drivers/platform/x86/intel_pmc_core.c:978:30: note: expected 'u32' {aka
> 'unsigned int'} but argument is of type 'char *'
>   978 |      struct seq_file *s, u32 offset,
>       |                          ~~~~^~~~~~
> drivers/platform/x86/intel_pmc_core.c:1329:53: warning: passing argument
> 5 of 'pmc_core_lpm_display' makes pointer from integer without a cast [-
> Wint-conversion]
>  1329 |   pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset,
> maps);
>       |                                                     ^~~~~~
>       |                                                     |
>       |                                                     int
> drivers/platform/x86/intel_pmc_core.c:979:18: note: expected 'const char =
*'
> but argument is of type 'int'
>   979 |      const char *str,
>       |      ~~~~~~~~~~~~^~~
>=20
> Introduced by commit
>=20
>   2cf128fbf321 ("platform/x86: intel_pmc_core: Dump low power status
> registers on an S0ix.y failure")
>=20
Hi Stephen,
Thanks for reporting the warning!. I have already sent a fix up patch earli=
er this morning.
> --
> Cheers,
> Stephen Rothwell
