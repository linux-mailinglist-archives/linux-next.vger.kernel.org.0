Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD553E9CE4
	for <lists+linux-next@lfdr.de>; Thu, 12 Aug 2021 05:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233657AbhHLD0H (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Aug 2021 23:26:07 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:5688 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233605AbhHLD0G (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Aug 2021 23:26:06 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17C3Ce5s016247;
        Thu, 12 Aug 2021 03:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=sSGqCs9u3AHvteLlkW6lJS6xRu3cj8MiPu0wo5hrM2Q=;
 b=O9rzN/venW0xYVcKaG9NY8lZgPSrHQm052Ci8h0MJhqvptgjht3Yw8PretwOIpmUDRF4
 om1BE6EXayWFgvb5oE1rY3S4RFcdgxgbb3Wnh7hSMsl1vz3EY07pBj5FYC/IM0dkkhcT
 xq1BX9ssSHUC1FsM7ftYywLKgv/YY61Mi9euK2lP6encOvUI9EJegsQv4MmkUhO+2ur/
 bE86zPDgwDn+ytZH8NZFWSqANmHj1xxlaEWwm3VoUDhwmFN+ikVprYILZXbNVsq2l4At
 OZxIaoHxR496+UNm1OoOYO1/bRWSGrR0wJi8Nu2UywER7gttyUT9hSyvuwIYOYEw3NDG 2Q== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=sSGqCs9u3AHvteLlkW6lJS6xRu3cj8MiPu0wo5hrM2Q=;
 b=EQ5TdL6VnLnxD4jLLBIDZSqbkEey5gckRJy9Idtk9Fxs3rxXr1bXwNnSvBF2V+yQlLbw
 bJJf/HlM6KMxg4mBgMl93tTxp9dm/OBXiNLG7XYTOLHF/uV1N5I3CyfdSFWXNh4yxP9I
 9qsXzZHx/pGlZ9LkdFMhfv0R9jUSjc2uWHZbgJjiRvrNEMZJVBgs9K1y0K52uepeDaeq
 yAisBWARAfCEtfN6LD/WSHcS2wp3pTb2JRhCmmnSWWtxh47/ukcz68/YGRsgslzfVsil
 KyeJ4hky8svf5BC7KsJW3SAienhK7QZcdhixhfLVNmmUmaRXY+hg8oaXgJHMvOkzU5QQ AA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3abt44c8n4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Aug 2021 03:25:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17C3ALW5097370;
        Thu, 12 Aug 2021 03:25:26 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        by userp3020.oracle.com with ESMTP id 3aa3xwe7tg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 12 Aug 2021 03:25:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/SovWiHFXS/4a9fA2hfSps3dKR/MuHzOYRhuaCODV/W+PiVQmrgLQzG1JXPZZ4iEbZPTI12NtJAYkiLfScU9ieXvBOPHw4JXdBfFQaYSd6m5/tTriYHfCmNdGzXYOEio4TEB0j4PIQYFIt4sF+V8Ryt/jlIOwqqKXR9YXCnOWYIgNTzIyFLK98+TaDqZPX4n/je38Tm8DaYBNXcDvLs3hrPASKjUPaA1NCAtHQ8IOgbmlv9OYF+XD/Y7FtSBbhUb3U9mglocjsf8OhxzA9ajakQx1fiWjz5EzPg2ahyGJlRdkUPPN8Yc0uizgLqo42xZGaq8qCBG5Sp9Y+XaiS2qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSGqCs9u3AHvteLlkW6lJS6xRu3cj8MiPu0wo5hrM2Q=;
 b=Vfsozg87Pk60+9evDUcCt4mxyx/sjU5AfFv+3dYX59TDrHzOYgMUivlhFi8L7ML88Oliy4O6aBAVr/WqIkLZxd2b5XJQXUmlyvYWEV7m57WzLsgaPmajDDnbhKv6Ujj/kG7FCBJE+D/KU1Pl47wobQLe3UxlhFr5XEJyRGyMjWfBX1nNHHj2cQHz5bmgwF7dIv+RamGOWLmY9bW37DZi6UgrkG2LPQjGReNueIHWUUMCqqXFwsb5HCJZjM4ceEzGT5WViDnOCQlTqUdKCe51BXgAv6UrWzie1RbgUDzpWcOsnseBW5ZcORGP8qvZDuWWDTQuctQk/+wRzPY5laEIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSGqCs9u3AHvteLlkW6lJS6xRu3cj8MiPu0wo5hrM2Q=;
 b=VhWg1yTiOAner/JN4QJbeoUJNmdItTWfzcQ0T7zf4NpB2EKqY6GgCgaajxucP9UiD015zEaBIXN8Ky5I5U+iNQc2ecV4QzKQttBqf96GDycikR+baZwQ5m0aKQ1mIMpgM3YHiG6z+7euekiNQeWnuDcSj+MgqWIlUa3e9t+jQvQ=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4630.namprd10.prod.outlook.com (2603:10b6:510:33::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Thu, 12 Aug
 2021 03:25:23 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc%6]) with mapi id 15.20.4394.026; Thu, 12 Aug 2021
 03:25:23 +0000
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1wnors5ul.fsf@ca-mkp.ca.oracle.com>
References: <20210811154005.7fbbb9e2@canb.auug.org.au>
Date:   Wed, 11 Aug 2021 23:25:20 -0400
In-Reply-To: <20210811154005.7fbbb9e2@canb.auug.org.au> (Stephen Rothwell's
        message of "Wed, 11 Aug 2021 15:40:05 +1000")
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by BYAPR07CA0030.namprd07.prod.outlook.com (2603:10b6:a02:bc::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend Transport; Thu, 12 Aug 2021 03:25:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9448090f-facf-44d4-33a0-08d95d40d1e1
X-MS-TrafficTypeDiagnostic: PH0PR10MB4630:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB46309D81C8F8E67285314C148EF99@PH0PR10MB4630.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RNEG5rrS0VeG9/s6JoHTD+de9qntKrhfv3qsinlec571L9OnTnNyPBolOA9cIPX14TpNrjnss7l8Kyi2jzVbTiAvqULP5DVcq8ErWhaPGoPkdsCxpOxAazVhTMJrc6Vg4oOfIsPG8T7F3rRyOZwaFydlX+AGacI1EdnFaobouxtn0hAomNkiqbx/LsDUr3i6N9KRrOieH7XLADtgEuCWpS5Uoi7KhkwNuXLiKc7Ef4yXJKnDJl0HKqGWgH7YYM3kjk/VxxY/Mp5zzB5Af9+TMM2npD1SwDtjCXss6C8WDFgXrIEfi8E+xjTvvbgy6KLdu38AjrP6ylqB+f5bjr3ddxc7+/gi86LzsP+CRX2z7oAn09klgsBF+9bm/ZhPTDGG1TPGbvKihQYbjX9gRpph8h7keCeKDkOzoj40Ism1/4kr7HY3A33gTv0k1+wqUGqxZAvDZXSlis08zfN2kKETgcapgeYav23Sm5Ur5QT9EdYCyeZPJ+bpZzvTqMM0OFGWL/vZod3ucc+EwQNjKJldUnn22PnOm06v2rI8pCbtI7NBJYEMiI4PD80bGoDRN/igW0rSaK0MJAYbtF1/efpINR/flWkAl8llnXvK3hotz0V5zm+Weyv2jcZisBKborWV03WVdCe7BxSnhltJ4tCM+W5dNLPPkvYiwP16saLv3xGE8TSji6U0gWh7JvYUfaWd8n+mcjVRTKxz4UlML87mDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(396003)(366004)(136003)(8936002)(316002)(38350700002)(38100700002)(2906002)(54906003)(956004)(6916009)(478600001)(7696005)(26005)(5660300002)(8676002)(36916002)(52116002)(186003)(558084003)(55016002)(66476007)(66556008)(66946007)(86362001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XGQCpUPVXXG+LMdulym3Fc2axo8pgPHw3uSvl3V8U06f1MCvh7JezP1qSuEy?=
 =?us-ascii?Q?1nqJU8LCD7WUEYl09vzj62Efc6DDOZtRvhVosYzQPW3i+p7GAPUM5Qlpz0Yt?=
 =?us-ascii?Q?rTBVaTrjLQ8tqagtvC0EPxpw0oshoDFqGhCoBVLh8IPFEy6qKhfqepLRewun?=
 =?us-ascii?Q?zlzltqL3/paYsU4UWtjI6mOqs6ggF6e/uwL0tVcfCRTU8q/VMrUT27cfVzQX?=
 =?us-ascii?Q?MH9fBczoKyD08FDXEVgUTPx+mNv1h5tAMqBaBYvA5TI8hlfdpWICS3k/RlmK?=
 =?us-ascii?Q?Qv6ZpaRpVRAA6mt27PKlObUNKlvboerwcTDL1yhglgja7avwbIHvaDCDts3E?=
 =?us-ascii?Q?R8WJapC1y2ouzyPy6hLUJpCJ/AJQ1iXYjoowRQ0zJvL+eVFyl+oIhvsFZUcr?=
 =?us-ascii?Q?WTahu9vzl0niCiHM/potwUEChpjxLSvbu1991wZx9mTAK6yCzaIXXFzve+Of?=
 =?us-ascii?Q?NTCTLEhocsIHPLWhYt2Zh6bw+YKtgcgwpqMASTS9jXSzLqOLSbQhcnJVNcFg?=
 =?us-ascii?Q?4anwrp5sTrX7Z7LPHVzm4uFHaBKx3nlFqMU/GqEjkKpPnCOaWpbUEx6aaZVj?=
 =?us-ascii?Q?3ZB5M/mz2LPK38TDsu1Zct+r0K7/7sUqUNl8k5NVZ+9Y9848YS7slLwTAHxS?=
 =?us-ascii?Q?BeksVKHebf5bZgsDBegD/GKDklcB5Y9fM2RwFjWzgczRfKZyHm/bhuVCeB02?=
 =?us-ascii?Q?85M3qNlJGiDflI4EmVllcWbm8LWvJgZ/MJN8EsDy5F0TJ/11J9GDKImlm9ko?=
 =?us-ascii?Q?R3iwqAxWeMtBxjlFhC3lJA2apwWoCpA7u7AuZG10YleRGltnptKaUKqiuYgN?=
 =?us-ascii?Q?oG/PT1fVMVFDLmKGoJ0IFCypRWbnsaRKTRhHcBOrKxdnwbjajsG4zv1w6Ofg?=
 =?us-ascii?Q?S7a/08pdN6SbtN8K3Hj9a++5mCtR8Qbb4V7xL8WeUaRqAAxtpKIs7vnLrFGF?=
 =?us-ascii?Q?VL47Hd5unDCVZksRtSLu98gNbN5e1mINJzuB1O6cEOCl29yItSo5393+a70g?=
 =?us-ascii?Q?eqxYEBibeZDCeQ0TiUw5Y68L8P+umG6W8vX4ZvbhRzVyf+JEg8XAK4Kzkoc1?=
 =?us-ascii?Q?XKlnip1Avw2AqGdWjcILsPHzGlmxa/EW7QJmmAVKO7Q2nuS0/6DULl1jiG0A?=
 =?us-ascii?Q?7hqvIPA7bvLNxD7Ktt9k8pgSewLGA8H/WvfqGpqHfY1f2Mw1yOj8BtxhBtvc?=
 =?us-ascii?Q?qkPtf40pscZNPXk9XrWET7sfCyY3y4JUAVkQpR0rwLkaR65CEbgIkdhuk9xq?=
 =?us-ascii?Q?JAfFaCKeXXSRRVsVdFYtBG/HTWHvKcB37uu/mSljhLj3527/ZFFSEKBeuI+e?=
 =?us-ascii?Q?itkMfn4YV0chhdmkAgCXaCMI?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9448090f-facf-44d4-33a0-08d95d40d1e1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 03:25:23.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G5u0gQZY+Sm+iMB2TTQ0RiZ1l3uN0jNB6qWy8e6xjpflxHTN4Ki5Ub0C7w5o381DefRK/QTQpLyEM0Dzz3CtzKlNtbs+qpkdj5aaIMu1g60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4630
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10073 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108120019
X-Proofpoint-ORIG-GUID: -wrJMpLo4TNhjZ4M2_uARP0yyxgoeXty
X-Proofpoint-GUID: -wrJMpLo4TNhjZ4M2_uARP0yyxgoeXty
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

> Today's linux-next merge of the scsi-mkp tree got conflicts in:
>
>   drivers/scsi/mpt3sas/mpt3sas_base.c
>   drivers/scsi/mpt3sas/mpt3sas_base.h

Fixed this up. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
