Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66EB62F72A1
	for <lists+linux-next@lfdr.de>; Fri, 15 Jan 2021 06:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbhAOF6M (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jan 2021 00:58:12 -0500
Received: from mail-bn8nam12on2071.outbound.protection.outlook.com ([40.107.237.71]:31845
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726019AbhAOF6K (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Jan 2021 00:58:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnpaYpt8/CKGctsMMYXLAHA5HuhHC5bOrzm8OQMazIV+7dfzBgkiltU2I0OJjfwIDxhLNKMocT7yCIQ+mt0Muy9ADRUmbWYwHPHrbDHu4v/7jTwXromuCnWn56866lXpYUdelLF/DGjfCsq2MiUXwp/7rCZCzugYYeRmAQcygZbnamnweH6vz4BJ89++5fd8nIZ0Vic+pzS7zdTFRRemzYapnLLjRVsC8bjHhrjaYCDRC2WK3Au/L9od0Tb/XBd76iaB1FUq1WQGhWu4xnKr6S6hImEoBRTKbRZIc+M2iUvdTkvEPvblBSNAlidMWR91rBvtsJRwiYfoXYv1WvSDhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COMr2QaFTWJYDvTkQB1gDxmJa3bWnUTyGwQv+Am0Eh4=;
 b=aT94Bw2AFAa8vPETGAij5rq52+/XtTEk2VZnGx77Fl5OppiwQG4PoszUuxT460hv9L+ymrrsrxccQBLHrdPCHPNezSdRVCj0vw63lB5wURDkI5GUNRmxs7atxW2rVcMQhXhXQd3iUNJ+cc9hLF4U3SAzKiYYgkSH/VAJpt2kEtFspOFQnkL7j2kEy6OvZAOb5zDJ4bncg6rembc/xT5vAZIzaqRAX9czefDyN6CvDXMcZPi80AzPyxyPFMqs4+8ag/TcsLu7VKviJ0nmP7q1tr5Biap/XRBgQ4+y65oLts6Gt4Ulrbu2Yu3zVA2HjvYLpVvqcjQqGCh/q/h72R31FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COMr2QaFTWJYDvTkQB1gDxmJa3bWnUTyGwQv+Am0Eh4=;
 b=urdcENpui4XTRWqWi0mNeRBbNCPXSz0iG21ecemhIt4ga8dxSJHLBouk7sE0HiVoBhf9MPfY9AW/wtlQFj95vvRht/bQIrA6YJ8Bzgt9SJvUYWSD9E2XUYvYCzakxv38DSOALbNrZS87wRzxVk5JLkHeADO+9cadp1sL0VW6lEA=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR1201MB0237.namprd12.prod.outlook.com (2603:10b6:301:56::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Fri, 15 Jan
 2021 05:57:12 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 05:57:12 +0000
Date:   Fri, 15 Jan 2021 13:57:03 +0800
From:   Huang Rui <ray.huang@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
Message-ID: <20210115055703.GA1258199@hr-amd>
References: <20210115163505.4132a5b3@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115163505.4132a5b3@canb.auug.org.au>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR02CA0210.apcprd02.prod.outlook.com
 (2603:1096:201:20::22) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by HK2PR02CA0210.apcprd02.prod.outlook.com (2603:1096:201:20::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Fri, 15 Jan 2021 05:57:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f309083b-e44b-4637-430f-08d8b91a66f7
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0237:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB0237BC81B1EC9C36409DC190ECA70@MWHPR1201MB0237.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O35hEfDHiZofTRAZm3bC/A/VIIl+JnqSb62yfsogIhXXcDBhDdqs39oTbA/12vVvVJrXgXnVkzTPzA3GyZ2mDdVmqcljT12X7NAYHKJpvFRd8h3wtw0iNhxpLACuWQlOhq7X3Q0iwzr7ckXUsTtEXg3CKWfsTyR4ZHVk0QWcFXLOMFpEVyNIpbxwM2BqmLSymHXsnsh8v3sqM5ZuUoeV4x3C/U8UwCcDauvjPml4ayB+xjjlnZpxfOq0CoEulWe554hmNXMEAZHzNvI4DSqv7yLS4+HpyDStBt9/J54oC7EsAjKxHq2x6RWGn9jxOAX03yJrySJREs93R2Aw61dZpA6mfaklFMzFQVFppp9GiuSLLXHHd1hsRR0sOf7B6GnCMKVIDQzvip5QJXdUgBMcbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR12MB1248.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(6666004)(33716001)(83380400001)(316002)(478600001)(5660300002)(2906002)(6916009)(6496006)(26005)(54906003)(186003)(1076003)(16526019)(66556008)(66476007)(86362001)(55016002)(9686003)(33656002)(52116002)(66946007)(8936002)(8676002)(956004)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TP3aRVw059dW0syJ493zNoKexcVH98nT8JyPb1KyNlMB3AJWHYYlr88lbZOW?=
 =?us-ascii?Q?1WxQQib1n8WH88Ao8xowVXpW2re8eQqGmyyLqDECGtA8ZSu7QiV4jb6fuRPp?=
 =?us-ascii?Q?gJf09cmuXoAF23xXvhwmTdEYtpV+MSj4QrPVMj0y/roB3+I0XM6LFdKTdrdi?=
 =?us-ascii?Q?4pgHGhEKDAe8I3ihRSX/QDPCMMDsHMf1zPYPdhTP23fe1IGFOvk9TV6NN1E3?=
 =?us-ascii?Q?qR63p1Ivb+BKAftnKBuY0cjXxg79CgzDVy+CbkU7c8uusY/+I21Pk2ncpBIE?=
 =?us-ascii?Q?iJRplJ8Uk3NGyLogxz7h4mev93YxNmyRa3ORKjoHCgIh9i7o6anHOOQGsqfM?=
 =?us-ascii?Q?KwQujMzLsIXi3nq6VvFyWkkqR8JMZfIC1Q+Z8I/Oa+XizE+U122g1d1YVdf5?=
 =?us-ascii?Q?as84Vo81IfR1RgDrlZ9u/Bf1hdc6NSi6Dt9w1FJlL9AtjFhxuv7vqezBWcST?=
 =?us-ascii?Q?HR/+cfwsL06F5PnKUQ7NF3VRLdAWRePPJIQOWDbEmyb8mn6Sd2oC6Z665iVn?=
 =?us-ascii?Q?oTy3p8wLmrw3WvErt0xJb7i55hyjXZbJrNYlT4WgfXGLdczuv8p5A5gOZn0t?=
 =?us-ascii?Q?Av2i0tOoheayBUTG55vMXsLHbUWKzzGfgxkvVre+x2IFFvnVu/xZ+riSHkA0?=
 =?us-ascii?Q?QrrZWTXkhDMGmsH08bOG/OGx9WnJH26j0Z++YZ5393EPZGkHndogvcqzYqo1?=
 =?us-ascii?Q?/l14aDCcYsmq7ryUV1aHoD/2vGDUdq6MrnUDSvEcU4JoaOAD27EXcaAA4qTR?=
 =?us-ascii?Q?2ix0LKx2OaXJF5aQe1PAFHblrrJP/LQsoYY97to5M5b9DsNu6rfkc75IjCbv?=
 =?us-ascii?Q?WHmieLSznLV+UbNrADtjWXq/G9TeW612JGdl7Y15MXRD+ulc4dD97OJ/0If4?=
 =?us-ascii?Q?H3mZcWiZQ6FFIr2wSjesJWHxdy1hhTttbhHEaaJGH7z3fsahwUJs4M84xWJo?=
 =?us-ascii?Q?0DiNqsWQ5AnGFKZaygahqQdbLTx9YOuAcOujnXC68Dqy9JygFJIlkEkqJ5hc?=
 =?us-ascii?Q?gQXH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f309083b-e44b-4637-430f-08d8b91a66f7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 05:57:12.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7BONT7bEL56wYHJOI4SGl4PhcXa1pHVD7KwJh7Tcxprd3P2i4KlBA5pFXrC+lIdAXi3UNZC/q/JeGbViu9prQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0237
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 15, 2021 at 01:35:05PM +0800, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the amdgpu tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'vangogh_get_smu_metrics_data':
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:300:10: error: 'boot_cpu_data' undeclared (first use in this function); did you mean 'boot_cpuid'?

Ah, vangogh is an x86 cpu, let me look at this issue.

Could you share me the config file you tested?

Thanks,
Ray

>   300 |          boot_cpu_data.x86_max_cores * sizeof(uint16_t));
>       |          ^~~~~~~~~~~~~
>       |          boot_cpuid
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'vangogh_read_sensor':
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1320:11: error: 'boot_cpu_data' undeclared (first use in this function); did you mean 'boot_cpuid'?
>  1320 |   *size = boot_cpu_data.x86_max_cores * sizeof(uint16_t);
>       |           ^~~~~~~~~~~~~
>       |           boot_cpuid
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'vangogh_od_edit_dpm_table':
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1460:19: error: 'boot_cpu_data' undeclared (first use in this function); did you mean 'boot_cpuid'?
>  1460 |   if (input[0] >= boot_cpu_data.x86_max_cores) {
>       |                   ^~~~~~~~~~~~~
>       |                   boot_cpuid
> 
> Caused by commits
> 
>   517cb957c43b ("drm/amd/pm: implement the processor clocks which read by metric")
>   0d90d0ddd10e ("drm/amd/pm: implement processor fine grain feature for vangogh (v3)")
> 
> The only thing I could do easily is to disable CONFIG_DRM_AMDGPU for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


