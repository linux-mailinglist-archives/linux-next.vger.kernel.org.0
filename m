Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8597833C68A
	for <lists+linux-next@lfdr.de>; Mon, 15 Mar 2021 20:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhCOTKS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Mar 2021 15:10:18 -0400
Received: from mail-dm6nam10on2125.outbound.protection.outlook.com ([40.107.93.125]:50720
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233112AbhCOTJx (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Mar 2021 15:09:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krvwE6ev8IeBMOAAg512MxzULc/zqecPyq+jauqeQrFWcOqyQPVa0IJOUznhpIJefbtUjcZcwl3ZcbjJJi3tr/44aDy9laD11zeeBZmk2y9KLCjjFnS2xfSjP+DihzXQ5EauUQ49Y1wPOZbeTv2kf7hwIR3tjMQhlRbyeXv0FGH4thPLB/MHSNsNVYHznbUS0fYALAVjO+MyqJqMsdbtscbMKpAXS67vjyVvVkI5NF6n/ah6dtHcsaNoKej7pumbdS7rKTde5eN8iAw2Oss6P74JhDPuWKc7+lN5NKbJdIB17dTM635TgsYR/dlmsOojBJvRflSMOakj0N55D8IHLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeodEtCJkTalrKDDNO/gEa6gZnHQNV5fKkEVFbn/Osc=;
 b=WOcMVQfUBMSCCtGM1kCk6icmZHK3v95nRfan7CwhFM1Cx9SLxvFlooeE6CmjND05u0KFcL7oXbsqkXM9I7ZODFXj0vSjxPQw2mU3Me23WJWbzMxslHwJjuLkTM/6EX4XS6T1AgHkj7NPMwa2sPIBqzsNXuFV+L7m3lKllUd6XD00663yhiw+IP1HChehvxvUn7D62UHcRf4P1lq8pZNbze5ILd0vWfIImxHwp5AoTl/fWbBeIurwNPC9ffT2iKaxTOUjWVR1QeWryrDpshDcmgd99d3aiTF4q14gkkMtiwpGpFoJGYTN98FMnhh2Gl0bUAE3FDwsdC3cg0crZtURbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeodEtCJkTalrKDDNO/gEa6gZnHQNV5fKkEVFbn/Osc=;
 b=KTMwnF5lruwajIVCZ8vwx810AYb+lMr5FYkwC4SKnbyYzjx4uHpYXWV68mOdkxhX/0GPRIPOY7HGuKu9wTkxaSePgKJkwDxKSh2eTtlm6aqUsUzhEGVnAKBj8M8oaR3Bt5ncTYK/ckqbNMV3WSkpM0kGDMzpAEbkaLYsL9XIK4Q=
Received: from MWHPR21MB1593.namprd21.prod.outlook.com (2603:10b6:301:7c::11)
 by MW4PR21MB1924.namprd21.prod.outlook.com (2603:10b6:303:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.2; Mon, 15 Mar
 2021 19:09:50 +0000
Received: from MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::cbc:735e:a6a5:8b9c]) by MWHPR21MB1593.namprd21.prod.outlook.com
 ([fe80::cbc:735e:a6a5:8b9c%8]) with mapi id 15.20.3977.004; Mon, 15 Mar 2021
 19:09:50 +0000
From:   Michael Kelley <mikelley@microsoft.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Wei Liu <wei.liu@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
CC:     Borislav Petkov <bp@suse.de>, Juergen Gross <jgross@suse.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: manual merge of the hyperv tree with the tip tree
Thread-Topic: linux-next: manual merge of the hyperv tree with the tip tree
Thread-Index: AQHXGUw2HXFLF0nxy0Ol2pz6PV60caqFaq4Q
Date:   Mon, 15 Mar 2021 19:09:49 +0000
Message-ID: <MWHPR21MB159300D8C1C2DE9F47253097D76C9@MWHPR21MB1593.namprd21.prod.outlook.com>
References: <20210315143505.35af617b@canb.auug.org.au>
In-Reply-To: <20210315143505.35af617b@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2021-03-15T19:09:48Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=f07da129-79b9-4afb-bfe0-5b8374eb076f;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=microsoft.com;
x-originating-ip: [174.246.49.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8ac5fbac-777f-40bf-1001-08d8e7e5e81f
x-ms-traffictypediagnostic: MW4PR21MB1924:
x-microsoft-antispam-prvs: <MW4PR21MB19246D898556871CBB04C8DDD76C9@MW4PR21MB1924.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZRoBHU6hVZgmug+nnDB+pr8WAoxS5zhDtx43m1SJnVOSNUBNcNGQJXFml1UWHEiMz7JqphAGkWzuw3zqwBOQ1eyHShYoFlqoUZAZI4YBL28EdkSc4ZBlB1i1Wrrwo1CZDFGLdrmkIgVD9BEqt3tD0qzCxVBhirKLEdrfxsUwq7MOD5xOA3Cz28qz2vdUyi0Lr2icyh3P5TMNzSr357Bd7K/Iuxz4vqbbPxqSuBVak10gr+UW3cbfrdAMMVVzJq7RrmMFlmnsLxS1VEKXQGbCWlVaW7sunatl/L8LlpwX3IerqlDuLTlN2gySLi9OYGryV/kdUIfwSW+pFnMj5mQ7tpJVQcYdEYLCBR8QAqIi6ibGH5FzzHghGxC+RHBTC873mqKYc4EyLVv8SdfOpgrHHS/58DYghsrNvnFjMedu8TYcc3RuCz3LKiPEgoog8fcAm8NfHMD4+EwZ8MP5TFNaFeE6Oon1yIBRSLAoLGm9+++6aXoaixKxSrl54/YgI8rMaT9ODX6i0qRUnY84StMUtyrcX2vnUmwhRF6Ewrq4TcKAcJHzkGFX6n7vXXtETzPP
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR21MB1593.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(55016002)(4326008)(26005)(8936002)(316002)(71200400001)(8676002)(10290500003)(82950400001)(52536014)(82960400001)(110136005)(66446008)(8990500004)(66476007)(64756008)(66556008)(5660300002)(478600001)(9686003)(76116006)(53546011)(33656002)(7696005)(6506007)(86362001)(7416002)(2906002)(54906003)(83380400001)(66946007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9I2FE0Wd1wpjszkmOrrBKZeWHhfCWAoAbJ1asLeRIPSw3MU/2y/3GNiib0aE?=
 =?us-ascii?Q?7jB+FGwJK6NeMIV/Dfe82Q5PbEsuhlyXTykbV1coOn1W9Z2Uef+0BglQzjaK?=
 =?us-ascii?Q?MSZ5SHb9rkX4RJJnFOxSNpUxR/0HVrHe+yA5tKu38vwoYUTIj8dUAAKuapaH?=
 =?us-ascii?Q?rosQ8C77+rd2rjGEMOVxQekopJU8mFYDPrIXwykG2MgRM5508iJ7DQKy3gCW?=
 =?us-ascii?Q?nlZY1zg4rDHjoCsHgw/XXm5tUycQ0lORA+iAUq630dK7U/DQf+RovR5Hl3WS?=
 =?us-ascii?Q?QbApF3brO/Bu2r4c6vja98R+J/uFaFFs+KO/3xhSq9RU82qgzPGL3Or4YIpO?=
 =?us-ascii?Q?oEF2Wm5dC8jguUOBedO/PSOqHoXUHh0uKR52vU7sr/GSGlj9MWib0sSh5lgA?=
 =?us-ascii?Q?BkaK7M3doRcyvoDb7jLjP1EWDNBBEI9YdNIALpvQ/vrD1ZQ6mbt6SWkuj5+B?=
 =?us-ascii?Q?ECkdfczsUD8njANzgYYi+TIBWvZm9nE1IMf6vCuWBMeZAqs5x/nmB4GNJTN7?=
 =?us-ascii?Q?cbNFLiiJnPNa6M2q5NqZL4NK4cErVkdavmbBujM8asNvzf8Kbi603SLr3Htv?=
 =?us-ascii?Q?DFEFTAZQ/HyLo7VCrc1j9mqemwhCz52ywtYhHHF7yzRpohtun43GNv7jH3VT?=
 =?us-ascii?Q?xO9BktAQAJw7oKB2H/J4OkYmxEf1Fs74K/ymvwuMFs7luHNuYCzuiPfU6zoV?=
 =?us-ascii?Q?rOkhfDKdbSQo0umSQVnrsFGr+Uv8XfrTCYQdYVzI7PMv40Mnk1x3h4wE4GA6?=
 =?us-ascii?Q?53LJoFRgoIvjxwbPUTl9+tWdPlBMfAjEh4EjvUh08kqw5OQ6ClEYeof70QWR?=
 =?us-ascii?Q?2YueFJU+bWIDCxdW7fPBldyQq/bb917fOXhWZoOdRrv4YNR2nHCstJr/h4EB?=
 =?us-ascii?Q?h0KiBJ05aW89gkGnVBnmGoi3vKhdLVHinEEhQZGULwM4Fos6euBNTH1ElKLg?=
 =?us-ascii?Q?3F5Dc/nJhqOvcKwsX0H8yYvXmnxT7zyoLSv01xmCC70GRna+cqcKEFhT3Yoy?=
 =?us-ascii?Q?96mdgDtLY249XgTLM5/MTOcRtH5xsonkIk1Ezp9AT2RTpZc0Elb7GpKsCTEy?=
 =?us-ascii?Q?7xKM5rMgmpUhMSbWAuCCOmSdOo5ENCro/vrA1M/kQTCLQ9IIHEftjYK/+HHx?=
 =?us-ascii?Q?0ujbbDyFg1WDc8H1dJgWOl6lk7jm2HHObHyumgGyeWfioz3qE+QoqeRbkAFQ?=
 =?us-ascii?Q?0DOuhtaHkOF920IhHhSkxcWgwnTqEhcWDWOL4hBbcjlAsfzKrM7aYNP6B9ow?=
 =?us-ascii?Q?UlFVbjO0A2dddKZkqqZnRbyGnSg9dMXVrASeD6fW4Vo+SYxWdcW2ihWnDk1H?=
 =?us-ascii?Q?hg5LphN3dLNgbVr1BZUWZOOJ?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR21MB1593.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ac5fbac-777f-40bf-1001-08d8e7e5e81f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2021 19:09:49.9832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QvK/wOIT9vpWf1dsvowjm3W1hjms/VlvhZu8eoIkwbGaho7FzmqZ7RQIQSKRlOHP+PVQFP0eRpJMVCOucJB1gKMBNWoXdtNSeZq8wKGORB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR21MB1924
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Stephen Rothwell <sfr@canb.auug.org.au> Sent: Sunday, March 14, 2021 =
8:35 PM
>=20
> Hi all,
>=20
> Today's linux-next merge of the hyperv tree got a conflict in:
>=20
>   arch/x86/include/asm/mshyperv.h
>=20
> between commit:
>=20
>   a0e2bf7cb700 ("x86/paravirt: Switch time pvops functions to use static_=
call()")
>=20
> from the tip tree and commit:
>=20
>   eb3e1d370b4c ("clocksource/drivers/hyper-v: Handle sched_clock differen=
ces inline")
>=20
> from the hyperv tree.
>=20
> I fixed it up (I used the latter version of this file and then applied th=
e
> following patch) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 15 Mar 2021 14:31:07 +1100
> Subject: [PATCH] fix up for "x86/paravirt: Switch time pvops functions to=
 use
>  static_call()"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/clocksource/hyperv_timer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clocksource/hyperv_timer.c b/drivers/clocksource/hyp=
erv_timer.c
> index ce94f78eb851..1348afc6efbf 100644
> --- a/drivers/clocksource/hyperv_timer.c
> +++ b/drivers/clocksource/hyperv_timer.c
> @@ -490,7 +490,7 @@ static __always_inline void hv_setup_sched_clock(void
> *sched_clock)
>  static __always_inline void hv_setup_sched_clock(void *sched_clock)
>  {
>  	/* We're on x86/x64 *and* using PV ops */
> -	pv_ops.time.sched_clock =3D sched_clock;
> +	paravirt_set_sched_clock(sched_clock);
>  }
>  #else /* !CONFIG_GENERIC_SCHED_CLOCK && !CONFIG_PARAVIRT */
>  static __always_inline void hv_setup_sched_clock(void *sched_clock) {}
> --
> 2.30.0
>=20
> --
> Cheers,
> Stephen Rothwell

Thanks.  That's the correct fix for the conflict.

Michael
