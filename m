Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9B15F502D
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 16:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbfKHPun (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 10:50:43 -0500
Received: from mail-eopbgr760053.outbound.protection.outlook.com ([40.107.76.53]:8586
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726095AbfKHPun (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 8 Nov 2019 10:50:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z/99OX5QMA+tUSE8oCBPsNyeBeOoYAmcCSagkefIW+RWKyATNmCr0cLXm+ZVr2mWGKLGsjGpEIxU1ezDGpkvpmldULRs6+MSlWwQERsGvIt+IUv44EqXDLbbANvmzcRvQlrTJ2yye7rh5VlsioLRXswBxDqLbKNa7DUwVw7mEqBkDib31kNLyZU116Pz2R51PoymG906/57wxfhNCKNwvxiLUJoBZZxIRd1cPmvx+zeA0ny19LUIsOWe6eqzFMoMnfMMYQjbAIcTpLjWgOK/xAfqnayCzk29jRFmZbIGxICj/hTXE/EI+FfjV2FThNCVgvsfgu6AupQ65qkSSXcfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIWqK4JXflbiBXOKlWsKgRZxngJg9J++XMM/0977nLM=;
 b=ZDxHmz04ceSSeU6YX46091CnpSq2bRZYOM2vW0p27sDKYJlfxj92zH62RHXKj77gAj5hhRiQ/2uMhX1xb1vmBLt/lHAs6MhixXJb2FPdS6zmR0J1U+eYiSRXdd6Z8cYGhjluKKGY1re3oTOTwgZZX9P+FbDqUuz+ikFQelF8qmUsQ2MyXWM765xl/yoDyxFu6uboTjAJELuH2YIqXHl0K/wq+mRNwW/M3vBJayLjJJNEAcYJ+SN8rP/huvViIePYU/La/El+pidQLVei4tYgicqlzRo39838KQCGSHKdBbMCnPi/9BlVyOEILeHPSRFxX8LeEhHIXJayaYezQ30R0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rIWqK4JXflbiBXOKlWsKgRZxngJg9J++XMM/0977nLM=;
 b=wrVBw3pPNhzeTHY6AHCvIcUvCd+yy6vp8i4p10T0ysXVeDJ31EQAd4sk/2cx50P+KB7Baz8sQi8s/ar+vfDtLdyeUChTCud6ZIDkB7qerCxoYhogPNv7lYMmk8FzkgoE2mOpfS0QgbJzpB+fPGnYC02T1Pju2qT/PUeExgaRYDo=
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1534.namprd12.prod.outlook.com (10.172.56.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 8 Nov 2019 15:50:37 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::3963:88a3:88f1:4a1d%4]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 15:50:37 +0000
From:   "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Thread-Topic: linux-next: build failure after merge of the amdgpu tree
Thread-Index: AQHVlfXAInPE90oR2UqQph97gidoRaeBbJaA
Date:   Fri, 8 Nov 2019 15:50:37 +0000
Message-ID: <62aed2f6-1775-ae0e-f67c-2ba3f47310db@amd.com>
References: <20191108163110.32c19752@canb.auug.org.au>
In-Reply-To: <20191108163110.32c19752@canb.auug.org.au>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::22) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 465e414b-6beb-4773-36b4-08d7646365e3
x-ms-traffictypediagnostic: MWHPR12MB1534:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1534F80BE1AEA0DF3B8F1095EA7B0@MWHPR12MB1534.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:287;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(189003)(199004)(53754006)(86362001)(11346002)(446003)(476003)(229853002)(256004)(66066001)(31686004)(6436002)(8676002)(6486002)(486006)(14454004)(8936002)(2906002)(54906003)(81156014)(81166006)(36756003)(6512007)(66446008)(4326008)(6506007)(26005)(5660300002)(53546011)(386003)(99286004)(66946007)(66556008)(64756008)(2616005)(110136005)(52116002)(186003)(316002)(102836004)(71200400001)(6116002)(3846002)(305945005)(478600001)(25786009)(66476007)(71190400001)(31696002)(6246003)(76176011)(7736002);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR12MB1534;H:MWHPR12MB1453.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jr0OhhMXfzsurgjZSnQPoqiSsTeyDyA3VoQwKOeBq1bS2OQ3Ie9oUg/0xNs4ySd6Ls13hL0usO4W9NZY4FBejSyeuHd76DLrDCtTi35udWFvDSPGzxLLLA79kJNPXibAHml60xtuDntzek/N1r6B7QwT1gj3ZQ6lUgDJOn06CfpHj29VaU+TKezMxdQtUlnRD9tOEbs1q+TD3s4rHmvKrI7WxR30cB40HUfpWzGoHbKR9fICqPSYc0kLWHjGvP4F9M1Mbzk2+cQPWZEKYNpTrQ8zwY4um2diwSPGfBJgrWhau2DQqR5548rKDaB+ejuJBz/A8BI42uIhSLHtDxSSfiqjW9nB+uWirn4zRcHFyNVz+/euK2tEKv6DBjDsR69LkGdIg5GyGAOqLtdR6tvN2pw7qd841uyx8kbL5dvjlsMMfeLLcuLmuxZoMu/mZiMD
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <7ADB5CBC48BC784C9AEE383366D93C10@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 465e414b-6beb-4773-36b4-08d7646365e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 15:50:37.3222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwrjJFmA6Y2fpKbQN8F9R2GUmgGGs+ScUMzcD3pEhR3x6z455noBpgZeuQN1xJqg2BZ8liMpMjlbFhdGYzOKjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1534
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks for taking care of this. Oddly, i don't get compile error on this.

Andrey

On 11/8/19 12:31 AM, Stephen Rothwell wrote:
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>
> In file included from <command-line>:
> include/drm/gpu_scheduler.h:98:21: error: field 'entity_idle' has incompl=
ete type
>     98 |  struct completion  entity_idle;
>        |                     ^~~~~~~~~~~
>
> followed by lots of similar errors.
>
> Caused by commit
>
>    83a7772ba223 ("drm/sched: Use completion to wait for sched->thread idl=
e v2.")
>
> I added the following patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 8 Nov 2019 16:21:32 +1100
> Subject: [PATCH] drm/sched: struct completion requires linux/completion.h
>   inclusion
>
> Fixes: 83a7772ba223 ("drm/sched: Use completion to wait for sched->thread=
 idle v2.")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   include/drm/gpu_scheduler.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 6619d2ac6fa3..684692a8ed76 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -26,6 +26,7 @@
>  =20
>   #include <drm/spsc_queue.h>
>   #include <linux/dma-fence.h>
> +#include <linux/completion.h>
>  =20
>   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
>  =20
