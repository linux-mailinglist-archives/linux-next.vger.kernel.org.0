Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CCC361816
	for <lists+linux-next@lfdr.de>; Fri, 16 Apr 2021 05:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234903AbhDPDMj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 15 Apr 2021 23:12:39 -0400
Received: from mail-dm6nam12on2067.outbound.protection.outlook.com ([40.107.243.67]:5728
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234751AbhDPDMj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 15 Apr 2021 23:12:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZkx7ALU+L7PalYcf3OeXZf/DR2r+iHY3BEnoECcZ0kXgI3GDuEEWznBsd027rQZYAwuK7fbdZjF2W/3pT3k7kyRw57FRiCBhaxoeNc2WIlU4voPaYuo+ge0s/bTu0Ju+R4E//mY1FJiOlSxizSPoQyErQyN/w2ddCpmXRasCEOOAW8j+Xa1Nrqy6iPISgOibFa3+BcBJ3qnzB2061pAdVAjnAajpgRdCem8eRQOfd1O3//8Py7HwNdCWTvxMTT8t9jAUUgz1VUh+2pOMoVjvco5bfU6ydYopEcd2IcYwesDryI9NzNq6I2g5dFViOLperG5isOKHujeqVzSjxvT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6tMNJaHRWGuxSc68zlGz4gBnMNmM567JSXZwrERuiw=;
 b=cD7tcI13OB90m57XVAsQrwNJ2bgD5U9rTk1K3efIbAWen+H1Vd/JUslQlKtLQZl/WkOlBII2UAcAnscCxQ0PYEROc+aLuco6nLpxsGUHY7kSZTEypN6ndXepiiYqYRd8twphAdKZDc4dTgl93ffhQNm9UjiZrITTpNigPQP6A93xLTlZYykADV1L3GlZqzBXleB7ZO2/+GaY3suzvuOrTqtnoysM7I4SNFRgmPawmg/BGvDg2emZRWe06iwd0NpdFhnuQncPeUCy0hpSriaioF3i2cmC6leAaWTixCgaIwN2bgFSD54uiJ4YRafmSiWKJmxvNHj3PvsdLQShPIYQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6tMNJaHRWGuxSc68zlGz4gBnMNmM567JSXZwrERuiw=;
 b=rzn7iqA+Jlr/Y3I5VBqIR5kCUsneR14zrN6EnlqTf/gDdQfY7tIGWuTo/lHDn/qC8edk4J5+gvDuPOw3lKB+xU6CyXkchP/VLHNc/TSt1jNFunt0bBX1tH8Rn+4QoDEwK92HNsfpL/5c8l+/zEKf7bmSJi7pKrNuXcyz3w1fLms=
Received: from BYAPR12MB3238.namprd12.prod.outlook.com (2603:10b6:a03:13b::20)
 by BYAPR12MB2599.namprd12.prod.outlook.com (2603:10b6:a03:6b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 03:12:12 +0000
Received: from BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::5870:fcd6:b13a:c49c]) by BYAPR12MB3238.namprd12.prod.outlook.com
 ([fe80::5870:fcd6:b13a:c49c%5]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 03:12:12 +0000
From:   "Liang, Prike" <Prike.Liang@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
CC:     "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHXMmnrEXRp0HuUjUazTxShXOxz06q2dQig
Date:   Fri, 16 Apr 2021 03:12:12 +0000
Message-ID: <BYAPR12MB323890BEC6212E401D10545EFB4C9@BYAPR12MB3238.namprd12.prod.outlook.com>
References: <20210416124044.53d4beee@canb.auug.org.au>
In-Reply-To: <20210416124044.53d4beee@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=440bc1ea-872e-4b96-a582-743f7c771b44;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=0;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-04-16T03:02:33Z;MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=amd.com;
x-originating-ip: [139.227.235.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3c4f70f-2cab-4dd9-2a9e-08d900856dcf
x-ms-traffictypediagnostic: BYAPR12MB2599:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2599B8E60EB8FB9CB3808667FB4C9@BYAPR12MB2599.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:23;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZyMQwrFlB5vGHVAHiBYXR5UDa3t2UM7+2JouK1gjMivnn+8zQ8Z802Aa6AS6tH5CVncRyii/Wnohr3P0s57E8PV8v86mq5dFK7Vuuw9W49UM2gTWqJ8WPjJAXzYd8FAZHAZ/wYfhB5c0IYvZ8n4y/dhK2u8wghGXwRxMcGcgjFWdJk/d1XQFg2NZDERwEApnvDbQJdhQGvkqofNuQBralI36eRD2T4L3KFUUQqJj5g1ywZ4yncmskiDQwFXxCsJDSafkglu3oY6oow7xepjSZRe6eDpCHt9rURJlo26/kCMM+F/vDAJiLpMv9+/dz44RLoXIjmmoe7kPhKQWeG5PYz//z/TfL3F1j3iIeqAThTHGc+hg5cG8tbS4kxUSH7dToVDtX6haOWw/0lfca1VpCig+r/jIY00QCzIHPer/Mi7RzbO5b3L61HEYSq06EUdI10B1Q1+pab2nzYDhkVhsAkFwPfqN2eQLHe69/WUKj5Q2ZG43WuOMAgrROle63ssdFwiUyH8k36WMttvupBX8AAt0FpkTddgLJZ2XWEQrl8lmjMYmEtVW3QWgeQHprWWLv0BJhfOVpah6U+NVBdlSGsdnitXRfO1KsMNMdZNeMAM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3238.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(4744005)(83380400001)(6506007)(53546011)(66476007)(122000001)(54906003)(478600001)(110136005)(8936002)(9686003)(186003)(7696005)(66556008)(52536014)(8676002)(316002)(55016002)(33656002)(86362001)(66446008)(4326008)(66946007)(5660300002)(76116006)(64756008)(2906002)(26005)(38100700002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?sRnQHLEpaaEJyPPAX2Nd0bGmnHVuZaBMyBMhzVQcGiXXI7ToW72ZxeXOR3OM?=
 =?us-ascii?Q?ECnUjV6j0aEPLlyoQGGmvCrK8BNtsWGXLKfZPmAs1j1qGWNInqwP9qz+ZlyU?=
 =?us-ascii?Q?8DaXGujyc5H6wJaYdHNVNEq5d7jM3ja41G8nCw3eN8NxP3OEYpfDKZ/75kEy?=
 =?us-ascii?Q?Suv4F+9vJNHfJ3u1f/Z/AawMicpCAC0l5RgDsHj47Z6GZqwBKH7WYRO/Mldr?=
 =?us-ascii?Q?gmZKtGQ9rEONMFvAjfkNWdPkXB6V6S0Qjx/CxYtooLx7aLO47eOtVjXMknbm?=
 =?us-ascii?Q?eWDHjlJKGyTOvVicv/TcV4EegAo0c9Aln0nC3u2Dmev/oUADxfRDuTtx4kJJ?=
 =?us-ascii?Q?ktK8+ELT7sudfDjGR6qvL/Nt4ODzT4o/hDOM0CwB7CFdmP/hj6gekheDe0LC?=
 =?us-ascii?Q?SYeGS8Ca7KDSD1LcB4Qv7OfbKUiawndjH4ZlR/paYb+sSIldywnYGhWAJCsY?=
 =?us-ascii?Q?u7pvoRVsTv84ki2qukRn39oB5/dlIWm1UqFk7TF7zaQNMhIiH6RtXjI03A12?=
 =?us-ascii?Q?T2o6yd8dAUY4Ifh/gSM7hFp70P9vhdJGrDyNbEaxsY7BaeOL1FAjy/HtZr6w?=
 =?us-ascii?Q?dm/K2g5n0B2uynkozdFn3dpVtR8nkQHiKuFdXFDxyChdInTjGfcm68aYeMjx?=
 =?us-ascii?Q?MDRjgh4lLbN7npVB/1EycXWrHM5xAauU1uomic1oA1uEGHuJouz7PM43BObY?=
 =?us-ascii?Q?uao6Iu7K1XoL3Wt9/MPKXWBWC10rXi+GBeubsNoTnVUa3wbf3SDp/QADdNAm?=
 =?us-ascii?Q?bGAF/DqPmMqf4IAj4ses8/HI5oZrnorFVBboN//0UuinwBOJS//v9A9WR7VA?=
 =?us-ascii?Q?iY4tra/hfahayFefg+5YkoNMIgq2rhwRZ1n7trCzEbzwpPKQDolSEf5tk8gU?=
 =?us-ascii?Q?M2ioD1ZkWwuUQ3/T1kHUVKrQW68mrSw7/sh//4x/gHvTUIFHRw1C97lvuNK2?=
 =?us-ascii?Q?ds9qaqgov47V+rA5cFtqW8lOBo6Okdn5OOto+kpFKTlInGIeqfhpzlYkQZdD?=
 =?us-ascii?Q?heWmf3CpjgLqjzX3niRPWhJ0XDB3OLfXYqwvKgmOlvEfn5THa/aIGGlvphPr?=
 =?us-ascii?Q?KZz3wlLGmUgPbC3xYhndfpk9XvHFMylzri6v59ckY7MaddUTFmgWcXbTlwD2?=
 =?us-ascii?Q?bA/K+djE1U8LgqB6dvRvuEB7H7qzctLJVsIgTcL3dp/Bnv64uNcFE0Xc7Q20?=
 =?us-ascii?Q?N9LigZa+Wijuy/MwLXDluqgY7wmPtH8ndJhfMoDJhj2K/WjYeQ9LgrqUIoV3?=
 =?us-ascii?Q?SEEXf8+gbA1jNOgKsxoswJA228lcWf3ddbywzHXoXTfu5O56SMVFFTK//f/E?=
 =?us-ascii?Q?9EmH9TGY2ngCpBgZVWaqrhvd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3238.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c4f70f-2cab-4dd9-2a9e-08d900856dcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2021 03:12:12.1030
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yqgryeKaP/trB7FY0+nkl/hbZdmXyGTaqmhJAcDE3xvV+L1qCSmX7zM7mwPybUOj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2599
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[AMD Public Use]

Hi, Rothwell

This fix solution hasn't locked down and still being discussed and roll-upd=
ated in the NVMe mail group.
Will update the patch once it refined done.

Thanks,
Prike
> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Friday, April 16, 2021 10:41 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Liang, Prike <Prike.Liang@amd.com>; S-k, Shyam-sundar <Shyam-
> sundar.S-k@amd.com>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.=
org>
> Subject: linux-next: build warning after merge of the amdgpu tree
>
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>
> drivers/pci/quirks.c: In function 'quirk_amd_nvme_fixup':
> drivers/pci/quirks.c:312:18: warning: unused variable 'rdev' [-Wunused-
> variable]
>   312 |  struct pci_dev *rdev;
>       |                  ^~~~
>
> Introduced by commit
>
>   9597624ef606 ("nvme: put some AMD PCIE downstream NVME device to
> simple suspend/resume path")
>
> --
> Cheers,
> Stephen Rothwell
