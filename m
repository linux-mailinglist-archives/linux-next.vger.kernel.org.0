Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5748F8B23A
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 10:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbfHMIWB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 04:22:01 -0400
Received: from mail-eopbgr750079.outbound.protection.outlook.com ([40.107.75.79]:53262
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727843AbfHMIWB (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 04:22:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M/0YQdjI9jjSMyd25GPDXLHH6S9PXToHUshvru04gwTlVdfHTffezadRHEbC/nfXMFZCs6OFPetzIc/QVnTystz+F0wkS3PV9cCCkVWibf4VseTVZmhBQhvmpVjoz1nh5cRfpiEeavg+SIvWViEAaL+FmioKTx2v9L3URPrcePBgWzKZcjS4rJFqf5+7I1I3cOLFoswdbdEwdZCZWu47PjM2/4kEfJ7Bjw7IV06ajWMBDJ87KQF2LgrwFi3uBNqbiNVJu+dzE5qw6nv32A4y7dzv5ESaRnfvgURL5c39B5fPES/uBvelIcrw0Td/obByohueJeV7McBXj152SknJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrrW87bKAxVvrnNI9msYJgICUSa3pkHzJ7yzrJ00ukk=;
 b=E8pPV98tlZUEioh/g9efH6xsZtKStoKNkyqruFazn5x/rkhrPqW+yPE10kylhimK+ZbIcsu8tJENNMach0oPhK9rGZ1+wC1u9bSYW2sFL2ak6v148hESDiNbqkg8HAb433hNsMlSWSBIJubXpeA+TDmeOU0vlce0tAxigUgxuHdOGMULiSobq576oRh1lK8TJdyGD4pGzTEnjdpK0lQJnEmK7c9azr12u7JYfZDHH+lZvJQG30JpTq4ZgoApj4RSh8AqXYR/oCGvA4tYYAKWYf6F4Tf1gPp4QoSdXuPwNkJvmm6T7+refrUSLlKComlPLRrMwUg6XAz4weW7T1E7gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrrW87bKAxVvrnNI9msYJgICUSa3pkHzJ7yzrJ00ukk=;
 b=sr6MT00xgiSIa9w5p51uohwLvDdZs8MnhJp25DdK8dGqBjV3+b0JLoedXXeCFpyB3Mh0oP/lC5WK8v2HouzXBUHkazz9QM4TYg/gpdsd23u4aogmpRexr/R78dSWoahncwhaLrdfELnvPAUH9nn1f9gBjDxGPYuWzJdjwgKooQU=
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4047.namprd12.prod.outlook.com (52.135.51.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Tue, 13 Aug 2019 08:21:46 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2136.018; Tue, 13 Aug 2019
 08:21:46 +0000
From:   "Huang, Ray" <Ray.Huang@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Liu, Aaron" <Aaron.Liu@amd.com>
Subject: RE: linux-next: build failure after merge of the amdgpu tree
Thread-Topic: linux-next: build failure after merge of the amdgpu tree
Thread-Index: AQHVUa6bZMdy/WsUYUCu/Ny9dlvsh6b4vJ9w
Date:   Tue, 13 Aug 2019 08:21:46 +0000
Message-ID: <MN2PR12MB3309141545B644DCA7F144B7ECD20@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20190813181038.2c6aafb9@canb.auug.org.au>
In-Reply-To: <20190813181038.2c6aafb9@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c485216-3e45-4415-447a-08d71fc74823
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:MN2PR12MB4047;
x-ms-traffictypediagnostic: MN2PR12MB4047:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB404717F8AFFE834FE65D5E31ECD20@MN2PR12MB4047.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:525;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(136003)(346002)(366004)(396003)(39860400002)(13464003)(189003)(199004)(53754006)(256004)(14454004)(74316002)(14444005)(8676002)(54906003)(86362001)(5660300002)(11346002)(305945005)(4326008)(52536014)(7736002)(110136005)(71200400001)(71190400001)(229853002)(446003)(2906002)(316002)(66476007)(55016002)(66946007)(486006)(66446008)(64756008)(66556008)(3846002)(53546011)(6246003)(53936002)(6116002)(33656002)(186003)(6436002)(76116006)(81166006)(66066001)(81156014)(7696005)(26005)(99286004)(25786009)(478600001)(102836004)(76176011)(6506007)(8936002)(476003)(9686003);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB4047;H:MN2PR12MB3309.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WgfaBn7VC7Dl1P38/qZxLR8im2c5rZXg4z4G7JFjR0ew9ogXdnI52clPUxmTT9QLRtw4GRSa250/pL1Onwrl+V3h8NUnXjqSVnzz6VFyKjUMMjYqYKvc42CNQ7LlT6SxiUlVS9JVrm3PLKGmawvGpQ5CSVCHnIuXd30NiCPZENQWg8ovZmBAlKiJdEliQJBA36HmARW2CeuIdc4FthHotBC9bOWSKEgNqeuROvd4kSV3d4mAi8P5maIN6myzFx5g7LiRifOqbGrIurgeex2UduHmte6v1mQTaioB/F/Ceacyq3pUMWNsvnBOVRJ3rvlnUFBZyigQ0vvBplDlLU0C5roPRJ7UT8yfTm8ZHocfkGuwBt6YMKf0ivSlcbjDbWXDgFLHUl2BSOnwb/Q7TAm096wStI9MWMA57PJQTaft4r4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c485216-3e45-4415-447a-08d71fc74823
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 08:21:46.3609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4047
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Tuesday, August 13, 2019 4:11 PM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel
> Mailing List <linux-kernel@vger.kernel.org>; Liu, Aaron
> <Aaron.Liu@amd.com>; Huang, Ray <Ray.Huang@amd.com>
> Subject: linux-next: build failure after merge of the amdgpu tree
>=20
> Hi all,
>=20
> After merging the amdgpu tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/gpu/drm/amd/amdgpu/psp_v12_0.c:39:17: error: expected
> declaration specifiers or '...' before string constant
> MODULE_FIRMWARE("amdgpu/renoir_asd.bin");
>                  ^~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   6a7a0bdbfa0c ("drm/amdgpu: add psp_v12_0 for renoir (v2)")
>=20
> I have applied the following patch for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 13 Aug 2019 18:03:16 +1000
> Subject: [PATCH] drm/amdgpu: MODULE_FIRMWARE requires
> linux/module.h
>=20
> Fixes: 6a7a0bdbfa0c ("drm/amdgpu: add psp_v12_0 for renoir (v2)")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Thanks!

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/psp_v12_0.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> index f37b8af4b986..b474dfb79375 100644
> --- a/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/psp_v12_0.c
> @@ -21,6 +21,7 @@
>   */
>=20
>  #include <linux/firmware.h>
> +#include <linux/module.h>
>  #include "amdgpu.h"
>  #include "amdgpu_psp.h"
>  #include "amdgpu_ucode.h"
> --
> 2.20.1
>=20
> --
> Cheers,
> Stephen Rothwell
