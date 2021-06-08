Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B10039EB3E
	for <lists+linux-next@lfdr.de>; Tue,  8 Jun 2021 03:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbhFHBNc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Jun 2021 21:13:32 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:50252 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230272AbhFHBNb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 7 Jun 2021 21:13:31 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15819DA6010658;
        Mon, 7 Jun 2021 18:11:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=C+9Ri3l48p0GqLjitPHxlYZ9VVaEGTddYfyaZDYaKgE=;
 b=jQ2P+4dd3bUiEeatNkmDlgfYucHTn/WbJigFmRVp+TghzHj5/eWSVVVI9WnA+nhoQjbm
 BQn9lvH2Ic8V+KJ2tjCZR3RFfnpZjWm+kVQgRHpbmeIEP2YOVUjQICSB90KAPYyJjz3Y
 vwMLE3RKO8PTVXVUyozoJw9/m4RFGgARclk= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 391mx0kr54-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 07 Jun 2021 18:11:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 18:11:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NBEVpvyoZyRRMYQQUe7OVegUUGPLXeY+jAHHnyrxMrUOfqQknj5J6rnYiBFenEG2AGRk29sAIF+2FbAZ3ItY0pEEC1xBpckvWUjeo9N8xhWeHeU94OZhyM0Dp7uetiShfvxUDmF9JO1pwWePFICKGeMqeyOSoGWTCKO+8xyUqDPlsDpmnNCCP9pscw2uKO3Z7X2Ub65uljyT++E4mNVPlV7iMEDmpMr6GUmAyExvtTFK9U4uGiNH8Zw2C4XNssqG8ddqEHYkaJZ59CXeYf+UfCLeQ5HtDqZEnp7D1ir8JpZSd6XhWD+0UVa0g3DTIOQX251wTtKjUifgGpb/JrjeBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+9Ri3l48p0GqLjitPHxlYZ9VVaEGTddYfyaZDYaKgE=;
 b=BKH/QBD+e6tUhLs0tqmRtkqBtIXB9LOZnc8ceLvVUWpYR57lchiIsYHusVhUVTMWoXZe6Pl7uJRl+ln1nPyO4BYJrCJA8MS4YGbUFe4++wP7dT/RrmLzk4/Ck9RmFqkfXg2B3nZsW9U3fUmiqYUKTPoS/5WvnIXAJVE8GgPYd/rUoy8xyrY6OaXpDQxzuJel0teieBknbGrOAHbVfbAINr/NLtCrUg9aljvSCPY+6KIygtlHOaan2aWMoVl2wOT5oRGPzvpwWUEFaPfb8eFk5bLiBSUydh2JqfWgHBB1L/Lvk+lUld7Hvc83yp0shKfmeMR9ylKkz9K+FtHJaTYawA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by SJ0PR15MB4357.namprd15.prod.outlook.com (2603:10b6:a03:380::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Tue, 8 Jun
 2021 01:11:12 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::dd03:6ead:be0f:eca0]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::dd03:6ead:be0f:eca0%5]) with mapi id 15.20.4195.030; Tue, 8 Jun 2021
 01:11:12 +0000
Date:   Mon, 7 Jun 2021 18:11:09 -0700
From:   Roman Gushchin <guro@fb.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux-foundation.org>,
        Ingo Molnar <mingo@elte.hu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Waiman Long <longman@redhat.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 percpu tree
Message-ID: <YL7DreSj2Rb+lNv2@carbon.dhcp.thefacebook.com>
References: <20210607183312.7dec0330@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210607183312.7dec0330@canb.auug.org.au>
X-Originating-IP: [2620:10d:c090:400::5:f63a]
X-ClientProxiedBy: BYAPR01CA0068.prod.exchangelabs.com (2603:10b6:a03:94::45)
 To BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.dhcp.thefacebook.com (2620:10d:c090:400::5:f63a) by BYAPR01CA0068.prod.exchangelabs.com (2603:10b6:a03:94::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend Transport; Tue, 8 Jun 2021 01:11:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3a2fb45-98df-46c5-501a-08d92a1a4e37
X-MS-TrafficTypeDiagnostic: SJ0PR15MB4357:
X-Microsoft-Antispam-PRVS: <SJ0PR15MB4357E3CFE059EE97000492FFBE379@SJ0PR15MB4357.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0lXCzIROP4jGgHTa/WAWdKJEk5pCWsy+qvCF3wJyNQWtAdrhkJ23yJsGyviCkVppgQL+kv5rKdFAoWQXYyKXeFB/WVsS6FrjSlYdwoBLmj7gzDTg7PXnA3STHrFuyGIGcZ4SQdOyt65kywoS4SY0ujE+VkQpkdMx54W5aMfhWVRfrYhHin7YpxoJPyqSL1wqAhPEBx6GkhQKqTdHikuwc0GfXWxmiISHXD7rlgubucZX2f031jbwFUon3w3fwWeTeyVbZYWVllXK/MWwP04HZys6PPXMB5zNtjdxhBhEv9mweGfCyOssGecHCqjxkZ0XnhTvqmaSrLysmWop25CIJyVyovbrWYvtYOx1QZ2FxP8VjLQI4IDXa7msrh0KprsuFchX0acoaub+9ayxNZlsIBF11s7uXQ1Ph3Ww6dqxiJ5IK7Tr+Yhn1Mnj61QsHD93F+S8RQi7XIRkQZnk8PDcOAJO9kF2R2msRyH8CziO4IPUDlt7LQxQWaqnVcQlI56crnvNj9SKjmwmh4la5hSqJ3LFRldp2tvAB7pecX3pwJOcEVfba+EIuKA9+/72ip9OJ99I5wH1VZn58fUA2SdIfDEoUXQQ1Erq6ZZRVT8kqmaR1X3vUYwwbnYP4CNGEChnRmQJh+8Uv+ofKRJS4EFGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB4136.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(7416002)(478600001)(8936002)(186003)(2906002)(66946007)(6916009)(66556008)(66476007)(38100700002)(86362001)(54906003)(55016002)(4744005)(6506007)(9686003)(7696005)(52116002)(316002)(5660300002)(16526019)(8676002)(4326008)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D4mFROOOoJKAOGiC67KAW5iOvi3TMKW4PZQz6vPuvhaFNnNQ6kccaHAz5DtR?=
 =?us-ascii?Q?2qqcGTJRunGT5DNAch/NCz0ylHDnfOXD0SzhhUqZ8QGBIyFfmSw/a5rF86vB?=
 =?us-ascii?Q?3H/6Wn+IjycTEo4cg4KFlnsayInwYx3hT08yY3NyapyYyk/c4Ras3gd3zzs+?=
 =?us-ascii?Q?Foso55Nx6VwesttaQKuk8AuD87n8VJGO+hZwdNxjIr55QXq21OFu2eSbxuXG?=
 =?us-ascii?Q?kxtQkUTbzx6JoUhA/8DYd1sBEuxmgLmLEDb4SkRBkwX8n5VZLhcLTZQQgpFo?=
 =?us-ascii?Q?wtOH+2buZEOUA+0hPeqe/Bpi6VX/0nKiyF/tGID5+H0bLnPYUpXuyUJHxoD7?=
 =?us-ascii?Q?7+XpnHxZrW0P7rIPIDx1emeUGm1aZyVi6Gri0QBdcFdPVmOaPu/BSuZGuqJ+?=
 =?us-ascii?Q?3/q1xlopDyuv+fEOKIgI3q+5m2159J1Dt/do6kDGn1gxpsZgTlAPM9841MQN?=
 =?us-ascii?Q?7sGstj+bdR+DASoFQiQZoLG5TPhSkyqAja9Olz6GeG4Drg5hF9uVvu0vU9Ua?=
 =?us-ascii?Q?iX4WZALdh95imSdY52YMC8ERbtfRLaFtBeR8VeDKngHZ+R2mL2jMzzGPA9Ic?=
 =?us-ascii?Q?85PcAUybxB4hzPHR1xW463D5uErxwTfmnNx5pO2pPEQ4+y/2pZDsgfYv8tPs?=
 =?us-ascii?Q?3T2IMQqqq9nkdB16eipoWjY6bs+VYKy42Z6fVHstrq6n8u/jegCzcpB72xX8?=
 =?us-ascii?Q?rlj3ty4BnusaWy697Ya4jwgYuBDSSHgBuNqlGiCuYF99gCMjBkVEAiK1nGMD?=
 =?us-ascii?Q?YccFvrwy9yUpuPJDLUe4VlwYQ8QX8589Pz+y7UJtWO/g4oQah4+y/tyfLpKl?=
 =?us-ascii?Q?UJAyT//x91L/Y3WEunDLLIuXcWdbwKw7aCk4F6Cf1EeMMQrBGih6AzZ2dlbk?=
 =?us-ascii?Q?K0eTwjobOVBqpRh7l3V7pRRra5CyK+ExZDU3SDgsL9NeMsMDsaONv93jlrbs?=
 =?us-ascii?Q?O/vtFJ3uwiVFkrL3ChlqPX9MmQtq2POTIDOOlDPwEKOer4gdShJ/6qXA8tlw?=
 =?us-ascii?Q?qyljr1jIYTmYripOQta+JZJb99rI1suIvpYDqUGP6/uOflIbKcADMGSIKC0R?=
 =?us-ascii?Q?fb7qF/Wb1l9dWzZdQEZ4EMUOgAY8dRaPPMzzTzj9yQ66ZH57i6KotLZbcCyj?=
 =?us-ascii?Q?QLPRYDnkNJFI209KGUH/e43io9U5eJwryyasdLMxDGwt4wxqB6amOPvb9X0z?=
 =?us-ascii?Q?vxH/XKENKtC4MegEnOXRZzM7AgRzM2PHto/budkKCAbytWQOpKsOShe1arXc?=
 =?us-ascii?Q?gFkzlf5txOB7eYzRotA51UTbPHnTwC7UGa7rpLCTMd/RnVLz2KwkmjHQKX6X?=
 =?us-ascii?Q?jGCTjsB61zAFHj/RaVNWlUSGZqVc8FR3pEuIP12oISWoxA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a2fb45-98df-46c5-501a-08d92a1a4e37
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2021 01:11:12.1948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4XG/hvk3x13cQlILX7w7TrR5HWTWcZYkHkSKMVm2NiLMoOh7G2cAITBH6ZFYbL+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4357
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: fP80quQ_MUzVGUjJqZxZAYdd30NJtJ-s
X-Proofpoint-ORIG-GUID: fP80quQ_MUzVGUjJqZxZAYdd30NJtJ-s
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-08_01:2021-06-04,2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=896 mlxscore=0
 malwarescore=0 spamscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106080006
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jun 07, 2021 at 06:33:12PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   mm/memcontrol.c
> 
> between commit:
> 
>   0f0cace35fa6 ("mm, memcg: mark cgroup_memory_nosocket, nokmem and noswap as __ro_after_init")
> 
> from the percpu tree and commits:
> 
>   dfe14954c6e4 ("mm: memcg/slab: don't create kmalloc-cg caches with cgroup.memory=nokmem")
>   3fd971b13287 ("mm-memcg-slab-create-a-new-set-of-kmalloc-cg-n-caches-v5")
>   53270d6d0c1f ("mm-memcg-slab-create-a-new-set-of-kmalloc-cg-n-caches-v5-fix")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Thank you, Stephen!

The resulting patch looks good to me.

Roman
