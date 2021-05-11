Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03440379BDA
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 03:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhEKBME (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 May 2021 21:12:04 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:60190 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229628AbhEKBMD (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 May 2021 21:12:03 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14B15PBM014490;
        Mon, 10 May 2021 18:10:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=CUrbNt6uLYSkqOSDWOjQ2wg5zRAaiI+iIyWp6/ixG8Y=;
 b=bmuPMKXGp6CFMUvN7EReJ20T6Ntz1MxyYe1zTUFXo9MPg6y8CEx/DKXEm8I4r7tWVI2k
 AvOcCEY4aDa7FgKDBS53vud3rt4wVlS5GZZ4IwMWXz9y1a+S6rqQoecFvWssucPaR/f+
 Tkm2HmY9DXtjf0Uy+O31OcEFy0JKPtnqE/w= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 38fap71sur-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 10 May 2021 18:10:42 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 10 May 2021 18:10:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ke+8tKnKW/2asO/O2ELwAFWF0BVQ4QjEXtMhqI3m4yJSfMTjDID2qzdEAKNgBXhoIRjdk2nBG+rJbp/9lnt/Kb5qtTL3JI9U4jfKGIKf+P+YYB+PjSnLkou6q3kPY/+z1DjP8n9UCiYUn/H4WlnU2eHEzRELDpb3pd96dXkxV9zWLGSsO954ZxkwOr+pFO1aBKXnJO00EfRD7xLpDLfwn3dNOPMIk8Dprm6NTUEwHfqLKAjhl1Bfx415bljyWa8Hm4/vXQYn4mHQHhY8MRP8JGwmM7RsnZsox6abyvyJl2d0kwpS2t3AlwuFygEdFw6MgMaiB1+dOtdc0thWqGaIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUrbNt6uLYSkqOSDWOjQ2wg5zRAaiI+iIyWp6/ixG8Y=;
 b=ImzxU7ZwSjDOKCzDSJp3V5YYuEFeztXsKGWlUeS9LIywMBgLSGs7SmcVDmogBS/1vxaQtsIhG/mwWKPfXapOnMiAcLE6ESiDAzCgbEIM7ufdkQSjz2nKyrNlj315j1JD2grOhELaq5p4kXGrJ7U29zacavyidcHuXb/UgmY8g31nnuL38e58r0VaIesB3sxRTn0Fp1Pd8+mnqFz4RAx/8gMZTqbze5wxjGq/hJjh482u8Lf6p5ozMKjKvD9N6QoekppUT1N9cIyZk1L4pGRAPi21Rp56MAtGp6Ny378xx2d1k54IzdakviPAlL/943Qm9MM2O6K2osKGu8kgFM+Cug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by SJ0PR15MB4327.namprd15.prod.outlook.com (2603:10b6:a03:358::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 01:10:40 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::dd03:6ead:be0f:eca0]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::dd03:6ead:be0f:eca0%5]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 01:10:40 +0000
Date:   Mon, 10 May 2021 18:10:36 -0700
From:   Roman Gushchin <guro@fb.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Tejun Heo <tj@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cgroup tree
Message-ID: <YJnZjCXe7uPrJxFo@carbon.DHCP.thefacebook.com>
References: <20210511105114.55e90534@canb.auug.org.au>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210511105114.55e90534@canb.auug.org.au>
X-Originating-IP: [2620:10d:c090:400::5:d1d9]
X-ClientProxiedBy: MW4PR04CA0325.namprd04.prod.outlook.com
 (2603:10b6:303:82::30) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.DHCP.thefacebook.com (2620:10d:c090:400::5:d1d9) by MW4PR04CA0325.namprd04.prod.outlook.com (2603:10b6:303:82::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 01:10:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02ebc2bf-0151-4e48-f3bf-08d9141997dc
X-MS-TrafficTypeDiagnostic: SJ0PR15MB4327:
X-Microsoft-Antispam-PRVS: <SJ0PR15MB432706BD198B100B4D52DB8DBE539@SJ0PR15MB4327.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wnX3/ikNgHgMWvsE9aSjPp9lG4+AM4eDyC+TdiFLxM8kUS7+yF1KvGNgFVR8iSOUhFZeJddmGsB/TEMsTJ6z18WUXGvzeG/uKFdkjLUJVUxd2+v+vimtJws7kXHb92+ONCDC4AZpX2vD2JJJB8qAXFr4P96WDrL1IHozpOBiDzzqB2EL4ADG7wyY4O8DjyrBASIQahpSjxNwZOcWnscksy8l5ECkprnDnvIocHR2FUiHLSOMcAr2JGlVTpoGNKRpx05y+eakvfBbpC5MM0V24B7P1MMjENTwi2YZ/6gY4sT5JyBKc2OW+lP4trTH8WaTj1tdysYMvq5H7JOgNXyVSAt3kE6mtP4EaL3BWh487o/CQv5jM60CX2kOkBgE63RAtQvngozb9SJcm8yVwz82kn3POHHyxKNJB3ku4332Lkk9muAiQ3FvOPuuZQu4hgL3YC6xPUWbnzS0zh+DEKgGBupmZOU5sqfEI46UByg13HnOw3ru0M+QoVQkcScF/X39bLrgZmHi3v3KsYkCTiXJzg0gsHGLPezsGdE9EbmH39CU8Fh6EdciWc/2ekagV1yK3pLxjiyMwgWwH8mTe/zOYC1nuy17+DHEOVxmX5Fc5s8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB4136.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(9686003)(54906003)(4326008)(316002)(66946007)(55016002)(478600001)(2906002)(7696005)(52116002)(5660300002)(6916009)(66556008)(16526019)(6666004)(186003)(66476007)(83380400001)(86362001)(8936002)(38100700002)(6506007)(8676002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?945/a4Bes8Qu62gLxrvdA4C2oTsNMRjsn7tDmal9ZIjJ+2nrH+QHfPWanNzN?=
 =?us-ascii?Q?wxxkGEGqPqfF/+T0wT/gNXCtvxIOnUbtfIsFLc+Z8WGT59nuGvG8lmPlALI4?=
 =?us-ascii?Q?IxkpX3WW+ydMreogUx9f5v+hmbm9hY/F3Gb6IzyMkehZi5JsWHLsaj1D1+4N?=
 =?us-ascii?Q?nmgz79iKkZmAcXYWiRW5kOR5RjVdJUkPtwe/7isnwx+3bi77LDhAjxY6OEav?=
 =?us-ascii?Q?6N6Q+i2ruoUa4Eo5DjBPaouNlpkcZJn009q/lYV8+BjI+ouBhdMHaL9/aK40?=
 =?us-ascii?Q?QJhYXFO9k8kjxZSlAHlqa947JZjhfjskRUp+iR9Oj+rQ43FbbB94wDl9593Y?=
 =?us-ascii?Q?nyk8JcGdCoYh1alA4s2Lm4j0/xcrih0rrMAY9TbPYWIDkz3qrvX3PgIn98mB?=
 =?us-ascii?Q?ghZ+kWhZHTP0I53wbxG/Q10KTVFe4vmrAIX2osuGADZOsK5CnhZuex3qfXaC?=
 =?us-ascii?Q?GDThSDRyVC+aXMice7dR/q77BCilCGwSlyKyb2iFUaWBux8F79gFybwv1Zxz?=
 =?us-ascii?Q?czH0RC1JnVqkacHybVjdrhwYmpBuwVkhrhq/4xLhccmxWOTynUBWAyyWJLn6?=
 =?us-ascii?Q?+7+6AQMI/5OIIZFlooFtOhV4Po42HE6c4Zl4UKvvmcOiLN1F4bTvhJdG3v5M?=
 =?us-ascii?Q?IMJ/Zr5AAesa55Nu5PS0STj663drpsdOCHdWorqxavSV/bdzDHH+pLQFVdMm?=
 =?us-ascii?Q?IrZoPLvqBZDgIenGqFO6+hbk3NYOh7ebn4JS12XmP24oB6CmBo+iJJfOyxdX?=
 =?us-ascii?Q?0Co3VVUG2FIHuad9FfIpIt+wnrLyVQFC4rOjjB4Um32hy+hubNRYmbdv/VfO?=
 =?us-ascii?Q?Orc7HWULV8COTVKoZv/4JdSF7AEu2RXs/CtDCyaFxS3fmtI5LeFxEqFgYY5A?=
 =?us-ascii?Q?iwqF7L70zi9HSUPBUKLey5AlPpGcMVDBSfbIlIbzyEBj5IwOp8mYEmw6OL7O?=
 =?us-ascii?Q?o9B2Tx7uabQkEqo8GNWmZNqpo5AoTfKMd7oJ4L+NY2pQdzsV5U/ce0fnohT4?=
 =?us-ascii?Q?Xda2ygE2Ex1bOvZLfvOuoV9C2IQemTL5x4ShGo2cSwyepzpUfpi6KDob5Kk+?=
 =?us-ascii?Q?J0gyFUssZq+exekbwVh1WV42iN/UBRc34VVUkGzkFRabsf7H0oBsqo4VymZP?=
 =?us-ascii?Q?+XOVoI9TxmJDaUOcayvmKhKspXu7l0tWquyymm22zRQJU2EBcfovNoMA2We4?=
 =?us-ascii?Q?4CZJJyfkR4OM9R5N7Pp9HP37+tykX2XGJM9W4idxIkB4AMw6/gy2Ork47Xne?=
 =?us-ascii?Q?Q2fcoCvfysBaSBxWvUYUWf+vzVh57GqZb6LThSHWZ1ESvZTHTntHQoCvBYAk?=
 =?us-ascii?Q?XKNn9fucuNhARbFTpMte2Tz4BlDCpAXTBWUdhTy/1HJAZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ebc2bf-0151-4e48-f3bf-08d9141997dc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 01:10:40.5296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQeeYf4t0mvyjO1gjnPa/epf+2zVsWAsOIjafmDQQTSg12ZyHi6drfe0r2ReVccc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR15MB4327
X-OriginatorOrg: fb.com
X-Proofpoint-ORIG-GUID: noJbrGPCwKUUnHXLK-LN_eJljXWq0Xoi
X-Proofpoint-GUID: noJbrGPCwKUUnHXLK-LN_eJljXWq0Xoi
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-10_14:2021-05-10,2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 clxscore=1011
 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105110004
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 11, 2021 at 10:51:14AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the cgroup tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:

Hi Stephen!

I've noticed this error and sent v2 almost immediately after the first version,
however it looks like the first version got merged by a mistake.

Tejun, can you, please, drop the first version and replace it with v2?
There is a trivial s/task/tsk fix.

Thank you and sorry for the confusion!

Roman

> 
> In file included from include/linux/string.h:6,
> In file included from include/linux/string.h:6,
>                  from arch/powerpc/include/asm/paca.h:15,
>                  from arch/powerpc/include/asm/current.h:13,
>                  from include/linux/sched.h:12,
>                  from include/linux/cgroup.h:12,
>                  from kernel/cgroup/cgroup-internal.h:5,
>                  from kernel/cgroup/cgroup.c:31:
> kernel/cgroup/cgroup.c: In function 'cgroup_exit':
> kernel/cgroup/cgroup.c:6270:17: error: 'task' undeclared (first use in this function); did you mean 'tsk'?
>  6270 |  if (unlikely(!(task->flags & PF_KTHREAD) &&
>       |                 ^~~~
> include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
>    78 | # define unlikely(x) __builtin_expect(!!(x), 0)
>       |                                          ^
> kernel/cgroup/cgroup.c:6270:17: note: each undeclared identifier is reported only once for each function it appears in
>  6270 |  if (unlikely(!(task->flags & PF_KTHREAD) &&
>       |                 ^~~~
> include/linux/compiler.h:78:42: note: in definition of macro 'unlikely'
>    78 | # define unlikely(x) __builtin_expect(!!(x), 0)
>       |                                          ^
> 
> Caused by commit
> 
>   c740aad01e41 ("cgroup: inline cgroup_task_freeze()")
> 
> I have used the cgroup tree from next-20210510 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


