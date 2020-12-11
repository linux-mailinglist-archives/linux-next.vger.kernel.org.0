Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 297112D6E38
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 03:50:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390979AbgLKCsi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 21:48:38 -0500
Received: from mail-bn8nam12on2086.outbound.protection.outlook.com ([40.107.237.86]:8521
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390955AbgLKCsX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 21:48:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhCrvq6MwFqYREHZJWfNN1GURcZt3xxIRq1zlIzI4AA3sBcKV+iP90d7f4LqQHcTB86UG+g68W1eC+dosMuPyYbK+1BbTLo4xJRDdpI4qAGe6PfWEV1rWPXa8wNCMXXY4zwEyYYpjdRS9XQRknYSytMCGL/y0UfZ+KqSiJxBzgPAgQ7GakXAj7v9f/nsvE5vKaTQOH/gWm6jPZG4RhsuN+KQ3sGnJQq0ULj3frCiTHvhhJK6NdYgLHRBDz2zol2L9u30GQOlGEnkCRluVgJ+B6DKYOd9SVJoAacRg26/dFikHfzAtyjoqrntWYFqi2hXcYRhYBXxq1nbRPA1n9bqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xlES/P+SaQDGeIL9Sb2W+S5CUpAXgVjuzYnA6132s8=;
 b=Ax/jRo0ZPcdoQ4JO+UhlpJZOC6ZKZZuv4Yms1Z8/eqDH7Tcb99eyCkESrlP9DmIV/s2DF2Sxka5ytra2RIjyJ3hykqRkwHyqFn20fk4qegVYeVSlbcX2v37UXZqCIUVYEvZS/OLMTV1GqSinbCPGQeTeNrSymRgnz6u/iUut81K2dk/T0lW2at2URdguQdjdAEI1WSyC2ceg8T3jlCEeI7iTBG6/Za85jtGPgK0TT7ymquuWKnFtU3wNozzNbKtc2RDcmD5YDfDEQtI8C6226P8so8NO9hsNShqSf5SQczp2xI+UH29nfikXiU70DIfGytJuuGXzP4HnlxL2ixSc+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xlES/P+SaQDGeIL9Sb2W+S5CUpAXgVjuzYnA6132s8=;
 b=1LCxBf+Ag3hi0RbAXLbpC7QW/NtRwlLSwoFiX16flFJAzz/mYUI5CGOxhG9pLvv6xnansuik0vbB5ChHEc00tBQFEpDqpqCTLCMHh/N4xF5HWJCkcMfP+f1ELEv8Urj4NWerzKriUfUNGOB+DGgIyzBNo7QlDMEZQ29xIUpoTCk=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2767.namprd12.prod.outlook.com (2603:10b6:805:75::23)
 by SN6PR12MB2639.namprd12.prod.outlook.com (2603:10b6:805:75::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 02:47:31 +0000
Received: from SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec]) by SN6PR12MB2767.namprd12.prod.outlook.com
 ([fe80::d8f2:fde4:5e1d:afec%3]) with mapi id 15.20.3632.021; Fri, 11 Dec 2020
 02:47:31 +0000
Date:   Fri, 11 Dec 2020 02:47:24 +0000
From:   Ashish Kalra <ashish.kalra@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Borislav Petkov <bp@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the swiotlb tree
Message-ID: <20201211024724.GA29231@ashkalra_ubuntu_server>
References: <20201211130208.2cf1e813@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201211130208.2cf1e813@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: DM5PR1401CA0014.namprd14.prod.outlook.com
 (2603:10b6:4:4a::24) To SN6PR12MB2767.namprd12.prod.outlook.com
 (2603:10b6:805:75::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ashkalra_ubuntu_server (165.204.77.1) by DM5PR1401CA0014.namprd14.prod.outlook.com (2603:10b6:4:4a::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 02:47:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ec4250bf-a881-4a9a-d249-08d89d7f1af1
X-MS-TrafficTypeDiagnostic: SN6PR12MB2639:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2639165338D3512867DD22988ECA0@SN6PR12MB2639.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:64;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iARiqy2zOA3hcpwt9gQGpux4btPhtZmsqJgIo9JCteQUU4Df42nU836bEXOkd2ZZq3qHGfot5CH07Jb00uEYWyCQ3uEut1qBDp+Rfw2IG5UHRMxfevKGAz2tTnjYjCXUTnUD5PTcTqcHS77B4t3Y+SqG9kE7so7iZJVVe+dPsHYT2X2ZXBwiULZYa1SuSyDZH9lAc0d74PZSSGG5OdUJupgcxP7asjAPltxUW0F6kdA5coTd5DVK0JvsY4+iqX2Uwqx81WhBOpDPbq2ds4ClPSv0G7+XMGUEYDIRzjsvR0X3THjfi8OWlHuHFL9JUZqwYNRpV43M0lgNjV8Yor1d2vkjkfKyfL8Nxs2UBAxDVDM9I2gd8aaYbwwtKSifm0dR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2767.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(366004)(6496006)(33656002)(4326008)(8676002)(9686003)(186003)(34490700003)(52116002)(6916009)(83380400001)(33716001)(55016002)(1076003)(2906002)(6666004)(956004)(8936002)(66946007)(66476007)(5660300002)(66556008)(16526019)(86362001)(54906003)(44832011)(26005)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uQT3CEVx3/+zs0RbLbFgL3EJE+lcQZ9E5UzaOBCHXXh4Da42Jo3Sz46kDgcP?=
 =?us-ascii?Q?553pQSDUNUq/nHZGqoDq4o3gQoxIB8MpSiHVhkRFYG7/thDwv69yJpqlFNqB?=
 =?us-ascii?Q?DclduGI4pE5uPBLFN7OY46v3w+UyaSTRqBHmrcaJYByDaBddyTCGEZnjc2Ap?=
 =?us-ascii?Q?4CpzvO9MG3FWfnSwHT8EBWGUyyZ0JEXAjgxjoAUUY4wWEKCJfJcff5GOy5OU?=
 =?us-ascii?Q?S/KWxVoYCWMFoSOc+CJ7tEajgmQ5cWZKetYDv1UVmG7MfmLrcQ68j1vtEDBI?=
 =?us-ascii?Q?5wNtMJnqLz3Z4HtDWUy2bqroY7XJANG3bMkostG7GsKaSDfNzqnc1VNFKCvI?=
 =?us-ascii?Q?oxruXTTeU9ACPJY0I55fLfLj2wanWcHcGceqFoSJicz4EPqz8r28nI8DNjZO?=
 =?us-ascii?Q?WK4tB1XAFrxEOxOdtaArUJ9nkcLcPokeZJdhpaO+660hgOk7lAdP6WlQFuBS?=
 =?us-ascii?Q?9cZGOFdtOw3d0qYOqto8RRT1voEMgBhoI8pUUBenCFI2jQ/AScq/MUvvCoW7?=
 =?us-ascii?Q?oZ45H7DJuhKo6pt9UxwVT8ife8vt7Dpdy2hSzKLHGBFeCyQMmusJdet68Vmi?=
 =?us-ascii?Q?Uq0IP7jby5+PPbpxKyPcO04qzay8R4yMzIgh1KBj1h4J2mz5unZzbB8rNFvI?=
 =?us-ascii?Q?dcVLcQ9n8AIc4PalEs88P4UHttPPER4VNj/IjgyPEDnhIo+WHgg1R0/5aM9q?=
 =?us-ascii?Q?oYbnLa2eDrOPwzOvrK0EM1/m2wH6NuPk2I6R1WGrFBYh4GJVhrXyBl19K3xa?=
 =?us-ascii?Q?D+hN73rQARcvU9c+DB330HWelESpkFKBmM8D5yeXpo0OJ0M7H/FNPopXv6Lv?=
 =?us-ascii?Q?sYeoO72BUhV/RnrrknGzcqOkL7mhCKwnQO016JrDebv5hAGO3S8aOkm80i9g?=
 =?us-ascii?Q?kjyhssDjWaJSrkI/Q2I6hVRbFTH5iJAlqFR8p2eLuT1XpweVIn4tBLdJER6z?=
 =?us-ascii?Q?rQkkVkSB5ASCSn6XSM/F5txT8+ezNwRxN89CrVT2T7SF4J+XDoGYotu8s6kg?=
 =?us-ascii?Q?N0Zj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2767.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 02:47:31.0498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ec4250bf-a881-4a9a-d249-08d89d7f1af1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eeqRGh7TXqJuRvwHSkCpQ3nT39v4m8rvrlj/tn902Btszl+T6xnFl/DzbWfdkCPrxFhbxzycJxoHHrgydPMtDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2639
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Posted a fix for this.

Thanks,
Ashish

On Fri, Dec 11, 2020 at 01:02:08PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the swiotlb tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> In file included from arch/arm/mm/init.c:24:
> include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but not used [-Wunused-function]
>   108 | static void swiotlb_adjust_size(unsigned long new_size)
>       |             ^~~~~~~~~~~~~~~~~~~
> In file included from include/linux/dma-direct.h:13,
>                  from arch/arm/mm/dma-mapping.c:17:
> include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but not used [-Wunused-function]
>   108 | static void swiotlb_adjust_size(unsigned long new_size)
>       |             ^~~~~~~~~~~~~~~~~~~
> In file included from include/linux/dma-direct.h:13,
>                  from kernel/dma/direct.h:10,
>                  from kernel/dma/mapping.c:17:
> include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but not used [-Wunused-function]
>   108 | static void swiotlb_adjust_size(unsigned long new_size)
>       |             ^~~~~~~~~~~~~~~~~~~
> In file included from include/linux/dma-direct.h:13,
>                  from kernel/dma/coherent.c:10:
> include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but not used [-Wunused-function]
>   108 | static void swiotlb_adjust_size(unsigned long new_size)
>       |             ^~~~~~~~~~~~~~~~~~~
> In file included from include/linux/dma-direct.h:13,
>                  from kernel/dma/direct.h:10,
>                  from kernel/dma/direct.c:16:
> include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but not used [-Wunused-function]
>   108 | static void swiotlb_adjust_size(unsigned long new_size)
>       |             ^~~~~~~~~~~~~~~~~~~
> In file included from include/linux/dma-direct.h:13,
>                  from drivers/of/device.c:8:
> include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but not used [-Wunused-function]
>   108 | static void swiotlb_adjust_size(unsigned long new_size)
>       |             ^~~~~~~~~~~~~~~~~~~
> In file included from include/linux/dma-direct.h:13,
>                  from drivers/remoteproc/remoteproc_core.c:27:
> include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but not used [-Wunused-function]
>   108 | static void swiotlb_adjust_size(unsigned long new_size)
>       |             ^~~~~~~~~~~~~~~~~~~
> In file included from include/linux/dma-direct.h:13,
>                  from drivers/of/address.c:16:
> include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but not used [-Wunused-function]
>   108 | static void swiotlb_adjust_size(unsigned long new_size)
>       |             ^~~~~~~~~~~~~~~~~~~
> In file included from drivers/mmc/host/sdhci.c:23:
> include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but not used [-Wunused-function]
>   108 | static void swiotlb_adjust_size(unsigned long new_size)
>       |             ^~~~~~~~~~~~~~~~~~~
> In file included from drivers/gpu/drm/nouveau/nouveau_bo.c:31:
> include/linux/swiotlb.h:108:13: warning: 'swiotlb_adjust_size' defined but not used [-Wunused-function]
>   108 | static void swiotlb_adjust_size(unsigned long new_size)
>       |             ^~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   79f748d1bdb6 ("x86,swiotlb: Adjust SWIOTLB bounce buffer size for SEV guests")
> 
> Forgot the "inline" :-(
> -- 
> Cheers,
> Stephen Rothwell


