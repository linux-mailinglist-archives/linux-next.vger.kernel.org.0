Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8CE21F9AA
	for <lists+linux-next@lfdr.de>; Tue, 14 Jul 2020 20:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgGNSmp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jul 2020 14:42:45 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:2364 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726817AbgGNSmo (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jul 2020 14:42:44 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 06EId09K005947;
        Tue, 14 Jul 2020 11:41:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=kbLe7dtgqMkRwol2xBSO9NZKxtxkfMMB9m+RPAvAAwY=;
 b=eZhQG++fkhcqk3+NWN5xFRBD5GOsqH08WAtI693miNo79VvDuckRrsiIBrP1dEXXhk+5
 wwdUkMGh7+G2Rxb5BlAH8YUJt1AD1Gofs4laD3fr/uut3TPQiBuD3LdsVL5CKfXz+/2J
 zDrsPOEq97pVT1nr2al8t+YHuEuCYK6ka9c= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by m0001303.ppops.net with ESMTP id 32793m74kf-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 14 Jul 2020 11:41:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 14 Jul 2020 11:41:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ve2qerEsmRXUYmTAKi3Tf0VwofXTT321tPbQZwZhMCBZixOJyuaJHBZlK5O70bZ18AZ7JX+JkvPN1FRSDCIiaL4TwEaYLGPV3PDAdSd38EGcsJS9MX45TfMHlvW5SnYfb1zH9pAZ6k/ESU51eDWOl2cUBOzsJe1JZLiYMjElcNhXB0Wks7h4b2CzgN3cq1b7GXgLVCf11hLH9zYJXuEjeS4oTB2ItoBIC5pstGX5Tg13X7TG/THlNMG3Ce7mITDXOztiTDxU2Ollobf+NKFO7P//UpE7qfx1b2d5NTTcbbiUhApNqLFbxn1Ddv7ihelSyGwexLGcNqI/IN80MTtPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbLe7dtgqMkRwol2xBSO9NZKxtxkfMMB9m+RPAvAAwY=;
 b=LgtV7YGRa3Ha2rSyeNbvE/THYRnEyj43rJ8J6Cj9NjLXhn8eLOBC8QHBzCgEq8AQ2LS0HR2oIL14D9konIkMioZ9Fy4lhVJHt44UoWUr5j8qHr85ibfm9K5i3/8hljCKc8/ZFKdCesoljXIwNr9EbTyWIqZt03TZX6TwUPdBD6bZPsNopnsZxjjmskCCTxFvnw3BKllf/O1yHiPXaB0JITney/AUuFsq0FbQEyrj+nqMFrG6FiaJhKcBvOC7IN3aD/4OG5pE7fKvERYqwNfyv8uGxyoJfFf9rInEf84CgMlKFrVSis7RiLWYTuWtFb+AoBNiQLXskVH8UppIw4aE4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbLe7dtgqMkRwol2xBSO9NZKxtxkfMMB9m+RPAvAAwY=;
 b=KJNbwq6m0eF1o6bRs++8VpouiJV8EhmTxr/fb9uCFwZMbrPSdM1kN8EwztWg5HzVw5LemQWBOaBd9+MYJfoNNH/Mn6nH0ZpjvL5p2jkaqB2AIfP85HHh0u1/kovdEdHVl9jEdQ9rRms1qsCJu0f0kUoQO/+g4Mgfni2uY56GR2I=
Authentication-Results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by BYAPR15MB2518.namprd15.prod.outlook.com (2603:10b6:a03:157::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Tue, 14 Jul
 2020 18:41:40 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::48e3:c159:703d:a2f1]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::48e3:c159:703d:a2f1%5]) with mapi id 15.20.3174.026; Tue, 14 Jul 2020
 18:41:40 +0000
Date:   Tue, 14 Jul 2020 11:41:37 -0700
From:   Roman Gushchin <guro@fb.com>
To:     Bixuan Cui <cuibixuan@huawei.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
        <john.wanghui@huawei.com>
Subject: Re: [PATCH v2] mm/percpu: fix 'defined but not used' warning
Message-ID: <20200714184137.GA491030@carbon.DHCP.thefacebook.com>
References: <20200714134101.80534-1-cuibixuan@huawei.com>
 <20200714225311.7aeffffd@canb.auug.org.au>
 <6f1a8c76-d6d7-1a2c-8b0b-26a4a31f1a19@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1a8c76-d6d7-1a2c-8b0b-26a4a31f1a19@huawei.com>
X-ClientProxiedBy: BYAPR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::33) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.DHCP.thefacebook.com (2620:10d:c090:400::5:771) by BYAPR05CA0092.namprd05.prod.outlook.com (2603:10b6:a03:e0::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend Transport; Tue, 14 Jul 2020 18:41:39 +0000
X-Originating-IP: [2620:10d:c090:400::5:771]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99bc5337-b1a8-4674-43e2-08d828258c16
X-MS-TrafficTypeDiagnostic: BYAPR15MB2518:
X-Microsoft-Antispam-PRVS: <BYAPR15MB251885BBA539591630536AC0BE610@BYAPR15MB2518.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yNGnAG3qTFinUAEb6ksjEuYRGu73KUdMD+H9+oD0p/czAdqvX8rJ9+cyEJEpf+IzAJpo/g3VtOBKVOKH0so5nbDbM2mfGGA6eKBwltXKF1qX5vq0wAWAIxpqlIOPEaUClIeaiMhONpN67Lmi8y2Hf832NKplueiSwwT2t/UZ01+v8mNluajVCoFWbBIWYVgaQQ93UGyfeIekaQ9ahFsz4gbWKkHOlTDYw0N3Y17MX7gepf2n74kqO4tg+QGhkcwnRsJtzs2DHD15Lrv+iqh1hz6CgllKETjHWXs4gH7iYf9zyn16mFoauAmZgvftWDrh7mzu9ULLkfesRJ2iH6BSQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB4136.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(346002)(376002)(136003)(396003)(366004)(2906002)(6916009)(7696005)(52116002)(86362001)(9686003)(55016002)(1076003)(478600001)(186003)(16526019)(6506007)(8676002)(4744005)(5660300002)(33656002)(66476007)(66556008)(4326008)(66946007)(316002)(8936002)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: R49rMveBgQmey3cLgVJYB3aFKa0F7a9nv3fummYP6SD5hE3XxKsMbdyLHW+RuJogriXYtBIIcCWx76PsQ9709oLdA6/9gpzBQYvXZupfaIKuPrs+GnluEWsgfJImgFNIWnzw/ne7dRSvzabw5IWqZz3yg1jkEVSBQDaCGmsO+NXcm0fbKF6Ds4KOxP8HkFZabJB5IUt9/57JCDX4F7tlEVt7EJUF1UWXcbzOuVJqXdbM+ywdgPqX5BTCZebHgGd+eiODl3gT/wlDljShG64V9aclzIEgztu/+SVGgabol2Y+ON7lKoRJJ77DzK8j6s+OBipnxqq5NFxsdRB0WUR2cqCPUmn/IISo+i6zT8MIeDa01C3ZvhJ20Mcm8unhO0odzQv59CQl1rO6QqTyyhJ8YXGxWFOpYvM5TZR+Wmgr7me/DI2/09xamMM+qLdeIWJwv/1p2ypRDrn7EmgReueGbRian7Mf6esL8NrPXRCe3mRosZbmfbK1nTnfbuQUqESP
X-MS-Exchange-CrossTenant-Network-Message-Id: 99bc5337-b1a8-4674-43e2-08d828258c16
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2020 18:41:40.3624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQOpeaNr3OFAS2D9g1m7/uSupHoKeu29JCEx1SqFPms2EURW/Qe3mo7nj/VyQLIa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2518
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-14_07:2020-07-14,2020-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 suspectscore=1
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007140133
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 14, 2020 at 09:46:18PM +0800, Bixuan Cui wrote:
> Gcc report the following warning without CONFIG_MEMCG_KMEM:
> 
> mm/percpu-internal.h:145:29: warning: 'pcpu_chunk_type' defined
> but not used [-Wunused-function]
>  static enum pcpu_chunk_type pcpu_chunk_type(struct pcpu_chunk *chunk)
>                              ^~~~~~~~~~~~~~~
> 
> Add 'inline' to pcpu_chunk_type(),pcpu_is_memcg_chunk() and
> pcpu_chunk_list() to clear warning.

Acked-by: Roman Gushchin <guro@fb.com>

Thank you!

> 
> Fixes: 26c99879ef01 ("mm: memcg/percpu: account percpu memory to memory cgroups")

The "fixes" tag is not valid: the patch is in the mm queue, so it doesn't
have a stable hash. Usually Andrew squashes such fixes into the original patch
on merging.

Thanks!
