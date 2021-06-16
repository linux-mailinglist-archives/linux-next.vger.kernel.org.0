Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C86E3A8EF2
	for <lists+linux-next@lfdr.de>; Wed, 16 Jun 2021 04:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbhFPCpq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Jun 2021 22:45:46 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52032 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231494AbhFPCpp (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 15 Jun 2021 22:45:45 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15G2gVWO013889;
        Wed, 16 Jun 2021 02:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=7sZzLAlhyKcmzGowLW8xazo8O0k7wsstvsi5vy7sR5E=;
 b=wJvsR954EdS1yQB0JctlMfKnJVBSVLqdOdOm38Sjlt7BwC5H6OWtBqkkgJX1nNVXLZ9O
 eMVkztaKC1kIqDpDt0JVdlEQIWB2OZApyudv3K3uV45tZZztXuNn3tC7s9XX3rL5/jET
 HM7LzEf2RuXI86vcfGwv+Bvuz4sSAWQ+z/+eJcZP8V9701EElZ8dCF4k/hXmuZbAXboG
 22kKAhhBEHuG5CeLZ5va3k570deV66rysfTBl+0YyAQNHA7Gbwhd4P1ID0hpXdkB6iQ8
 PPqQ4Gkx7oWmOAgPOutr7uz/Tcx9w8Rzu1HIYiBRenAfvvkOqmVD9d+FxDNURJsd7dvA sQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 395y1kssg9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Jun 2021 02:43:23 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15G2Z1ZY172939;
        Wed, 16 Jun 2021 02:43:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
        by aserp3020.oracle.com with ESMTP id 396was4sqy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 16 Jun 2021 02:43:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpNCHXzTPtAD+IDze83j/Cc6L5leQ4xe129GHUTzrD6LfRHFc0UMSIBYp2C5HjaRyPNXdbUG230otH3dLHXFe0jIJPox0Z4awYBVuRvPy3yRa3kywIMUUFZJRkD3Ii2cDc++UyzwmThiSk7HzxF1k/8OWoBDUovGz0Udw/s/xQN1tN6wsQqXaRlRaKFswPauQfFwucAHQXcB2ZkkZgVYpgliR1Ok0Eomusf09YjylFlMUVr2NYZQa/x2lbnaOqPT4FfkyXLxCwMwqO+cZByjXvbtzpCTalQzsr4Zhk3dBDWdY30Uto/f+YtM4Jht7sGJzqOTbtdcgvqI8MBgd1fwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sZzLAlhyKcmzGowLW8xazo8O0k7wsstvsi5vy7sR5E=;
 b=B/Tn+hifxTvY8V88VawGydziNPhPts/x99am9JOHugAjmSspQBzcRXFUBAeq1euMSJNtfOdHIw8OydWFDyr8fUHZ+rPoWbDkq2EdYHJgX+QFGvWQo04xNJ+WuVqMmJclY8s5Lg7NUup8gEeQD8HfKeMn6/s8w6w1GcrbT0I3jzj2mt7dUq0/fzyQEBDAld0zKPjVfRvwJ2tJKlMmkKi6YLoIwAts8L01yE/vFOlIrHREA1oX8GK5HCXPU7uhRltn040lSXw9U3ey3++HW/u9vRSw0PgQ6B5IPP7vsILh+BXh6uCbATCGlxAoVtWPV42527pFJ6l59tyTxuRzcv7yuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7sZzLAlhyKcmzGowLW8xazo8O0k7wsstvsi5vy7sR5E=;
 b=JT5/g50+NI/2Fb3zSTklZ9fNFqukL5rD1q1lgZpmwJj+x6t4YN8iaqoWHLDkeHFvW4bbQWqfJ8NxnZhBtOoasRVxkYdlPwjc9CXsHG2lLSXm3UlwxuLYotiGGOiSo5m6cHX5gpF5FjdvypJLrxwJidz5jJQsF3FhhchhD6QOSpE=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BY5PR10MB4114.namprd10.prod.outlook.com (2603:10b6:a03:211::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Wed, 16 Jun
 2021 02:43:20 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4219.025; Wed, 16 Jun 2021
 02:43:20 +0000
Date:   Tue, 15 Jun 2021 22:43:16 -0400
From:   Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Bumyong Lee <bumyong.lee@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the swiotlb tree
Message-ID: <YMllRMwHdddl8ffl@fedora>
References: <20210616113835.0f0d4952@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616113835.0f0d4952@canb.auug.org.au>
X-Originating-IP: [130.44.160.152]
X-ClientProxiedBy: MN2PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:208:120::29) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fedora (130.44.160.152) by MN2PR10CA0016.namprd10.prod.outlook.com (2603:10b6:208:120::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18 via Frontend Transport; Wed, 16 Jun 2021 02:43:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe8286d7-5418-4f5a-97dc-08d9307080dd
X-MS-TrafficTypeDiagnostic: BY5PR10MB4114:
X-Microsoft-Antispam-PRVS: <BY5PR10MB411433362D85308C63EA1593890F9@BY5PR10MB4114.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xor5JdCNjuEQ5TLJXHwUAZOrMRhnlKCvpQu9uDUvyLVxOg30V6kFO0MX2p8bclhXe2Bxp3IuYgGMCMUfT3XSTVG67hVPfe3TJFW47e1r3Y5dC2fWHoszRwNoUapCshOOg7Of2ED638jYkpZff2mDki8DjJaYlGzYGnBDXvo+TGoYPqW4sZkbeYFkHJTCf/uVPAeBndDl7nJtWlLJhinfpZCRQr5coO7mG4KOZ0e9ssX4uctHr91VVYHoJV5OGaFxZVOPgcCynUgaUjUjpf6DJlJfUcZP50jL8TfmB/UvU+UBFblzBXJNg9yC9mb5JJGLq/++oSSdK/GMbWt9CrlRIkCad3S1s+3ClSYmUS+Q4I81hBYqxsPS3NKl5d4fqfFEc13YT5NfeiZdEHnFHkm2rVmN6mJ8TMr1i2Cl0zARUR+oiYSubBQ9o2NOHD7IaGylstfACrZLBTnN6OXW7n0RZwOxSX42pm/CNpzuSRAKxH2h81oT87lTz8hx7BHy/OEssAKvJ593R5SSw0BkIx8FztQUfoYyMeu89hQ+ZPajqDVYS3qJCxPuXrIV0Qf0+r6YqHESBSHtnH2/JNpvNPx8TL+cVksz7M2AuZ9mQBfyvp0rev/wnhi8Ii/VWr6oiSEZth8zo0gNEFjGrm5wYNzmIEnT/zRPNFteqTciTHtpTEg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2999.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(396003)(136003)(39860400002)(8936002)(956004)(4326008)(6916009)(9686003)(66946007)(66476007)(5660300002)(66556008)(16526019)(83380400001)(55016002)(26005)(186003)(478600001)(9576002)(33716001)(54906003)(86362001)(2906002)(6666004)(6496006)(316002)(52116002)(8676002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PijfHG0mlFJCSApXMOGzW8P8JCFCyWpK4101rzJxaiUfVyihN174pqbCOKOr?=
 =?us-ascii?Q?+pgZIHkPV2b2Zs5rFABHqDUKg7Knf9FbjFTHNuQ0ZE6cssNhdE3yBKy/7/Bw?=
 =?us-ascii?Q?R3QG14A0Yc/htEsyljCN2g9nY8+s1VP1nuggn2sMN6s+1Ig8qBmFkcxqcxDK?=
 =?us-ascii?Q?ux5AFUm+O7VZqk23LL7G3jWhYLVGFUykF0g9mjDWyO+3XmgDnIHVjYkOTjlU?=
 =?us-ascii?Q?KAjhZVOUZ2Tim/X6bLcdNNbbP3OqRzGNcik/1WbZqJc17dR5M5yFOHhiy3Y7?=
 =?us-ascii?Q?LJCreVR7tK1qNDWK2QlfW1rOyVfuQ7y6SObF5lohwCuoZZjjFJ5yD6Nj47t7?=
 =?us-ascii?Q?RexozM0lfhEevLMiJK0Z9t3G4tvowJX0fHN4SrK/CuefNLk9X+XG9pMp0Vj1?=
 =?us-ascii?Q?ObC+hDPPdlg0k29PhzG5vPALZeFtW1AEN6dCfP1c284EOya1txfc/c3hFeey?=
 =?us-ascii?Q?Kam2KsdX/VM0CEEtXy4sRGvynebzbv/jNV5A9uzDDrG3w300YaSO41GLKQM/?=
 =?us-ascii?Q?Y5QYjbu1SqCGh9dl9+wcaZo1zm9VW+CzcZwXFZ/NiWZX6Omz8nIL7YrBCjZO?=
 =?us-ascii?Q?YL+c6wAPhi+GyTHYYQ0LcZ+nY41XOfejyJ39JxiELftZR8UTaS4KdJmlv4xP?=
 =?us-ascii?Q?5FzZG4OjhJsZD/0yv45rpsAKT1SdxXmSPPqe2AYKXOVbupJAoN/yRjtePZPF?=
 =?us-ascii?Q?LHeNtXrUpW7F0fGSfy238IXslo4bJuQ7//gj2vrSuQlASZI/N1nAl8CKTPBT?=
 =?us-ascii?Q?+6AtxVrNSa2VuTAHpexu7faJLL4bNOZvzzBEW2hwWjucXv8UVRcPCbPZ+rey?=
 =?us-ascii?Q?mGQbCjJ2cyZmo3LpcvE2wFLX61ad8AnBCEtyCfZCd6gZKyzbSXDgHC+sLNpf?=
 =?us-ascii?Q?OE7Mswu44ySQxp80vY62R0btL8Sp3VDIxJEJ1V9tr78vvLlD7LGgvjjoAMTW?=
 =?us-ascii?Q?3Hlf+PUznpbgX4x/urIHifm9MCuFTDJEJlcCW7jZYUOVUGTrohg0h0co+Q48?=
 =?us-ascii?Q?Bu2yReARA6f9r5X8HajxMi9U/kt6JAi6g7y+dcvbwhuG/6jTL7+EtWDkRKkA?=
 =?us-ascii?Q?AEa90WdridBZVi31GUmdOSZShidj56MTHfkQBDwNxHc8JGEI3nCoNIom9MrR?=
 =?us-ascii?Q?hBFvYF1WDvtzIqz8QvV/ZrHXpTalt4VKciiTxfSYTgV+ygvAyUGolSHEnFYk?=
 =?us-ascii?Q?zr1watXtqp5q/g/A9Gb7sZNy6nRguGBkgdws0FDqcrrCdpUEnvSGoFPYT2by?=
 =?us-ascii?Q?yeKPGSejVDC0IF4eQATAPn72B21dNGa89+K2yOyzBptSluyFw2jUEkPMriic?=
 =?us-ascii?Q?DvaAUiwmJiSPaB4ZOmxBKGYj?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe8286d7-5418-4f5a-97dc-08d9307080dd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 02:43:20.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5k8XIXwymvzbStLO3lzXce2gIh/aZUyvBRLHUovq5OD7XSrbqecHfDi0DYje5niHb/Wxbmh64t26/VsMwa5glA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4114
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10016 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160014
X-Proofpoint-ORIG-GUID: P9UtaQQ7QXexs2zmdCDwMlWal15ie06-
X-Proofpoint-GUID: P9UtaQQ7QXexs2zmdCDwMlWal15ie06-
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 16, 2021 at 11:38:35AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the swiotlb tree, today's linux-next build (powerpc
> ppc64_defconfig and x86_64 allmodconfig) produced this warning:
> 
> In file included from arch/powerpc/include/asm/bug.h:109,
>                  from include/linux/bug.h:5,
>                  from arch/powerpc/include/asm/mmu.h:147,
>                  from arch/powerpc/include/asm/lppaca.h:46,
>                  from arch/powerpc/include/asm/paca.h:17,
>                  from arch/powerpc/include/asm/current.h:13,
>                  from include/linux/sched.h:12,
>                  from include/linux/ratelimit.h:6,
>                  from include/linux/dev_printk.h:16,
>                  from include/linux/device.h:15,
>                  from include/linux/dma-mapping.h:7,
>                  from include/linux/dma-direct.h:9,
>                  from kernel/dma/swiotlb.c:24:
> kernel/dma/swiotlb.c: In function 'swiotlb_bounce':
> include/linux/dev_printk.h:242:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
>   242 |  WARN_ONCE(condition, "%s %s: " format, \
>       |                       ^~~~~~~~~
> include/asm-generic/bug.h:97:17: note: in definition of macro '__WARN_printf'
>    97 |   __warn_printk(arg);     \
>       |                 ^~~
> include/asm-generic/bug.h:161:3: note: in expansion of macro 'WARN'
>   161 |   WARN(1, format);    \
>       |   ^~~~
> include/linux/dev_printk.h:242:2: note: in expansion of macro 'WARN_ONCE'
>   242 |  WARN_ONCE(condition, "%s %s: " format, \
>       |  ^~~~~~~~~
> kernel/dma/swiotlb.c:355:3: note: in expansion of macro 'dev_WARN_ONCE'
>   355 |   dev_WARN_ONCE(dev, 1,
>       |   ^~~~~~~~~~~~~
> 
> Introduced by commit
> 
>   17eb5dcf1f15 ("swiotlb: manipulate orig_addr when tlb_addr has offset")

Fixed it up and should be OK in the next run. Thanks!
> 
> -- 
> Cheers,
> Stephen Rothwell


