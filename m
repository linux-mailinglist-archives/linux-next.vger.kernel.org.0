Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EEB7189FC5
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 16:37:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgCRPhQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 11:37:16 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:45464 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726776AbgCRPhQ (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 11:37:16 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02IFFTc7016755;
        Wed, 18 Mar 2020 08:37:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type :
 content-transfer-encoding : in-reply-to : mime-version; s=facebook;
 bh=KDrkWS+043x96sLDXdoncbyUSUAGOpKfbJ0+4DtRykc=;
 b=pknIHKQ8HEzBYil/YhWHVv0vbHMShnGMURhlGCNaivnaeuf70S+QyIfKbGvNZpoRQvaY
 iOujgGgTAxp8398M4tD5A87rVVd3dx2o3yOWoF3F1s1mngWxdVx7sk0vyhHiZmLfQC/L
 5MuDqHYVIZf/mhejLZIf8k6BiW0OpuXOCgY= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 2yu8x3k69k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 18 Mar 2020 08:37:09 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 18 Mar 2020 08:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J+CKUyyIRsWAF6w8cmxvb6Vi9AL42nzeC/qi5BlTzgeRk4sl9Vn5yAJ6uES75QVD17oqtxPJ8Qwm3GZWnCm8pDxMlzbozHlOifJpo8rK/ulUvTXBMPv5Dgj6nXGr05o4qryAf7wEnBav3y5pTQquNPe9DJl6bHTNk4HuICV+tMXJ7flR7zLP/vwfh2fbsdFtSY9AYY7oq+AuNr/EPVxFJvP8asiIZohM8b11cDhSVWRuFImZpAfJa44b8bWYOxuKH928oZ4Izcj3cUV0NksdTy8cJb9G27v4EH/v+eUhznn/SDJvwgsnVS5iMDmz6b5p3lNhA8t+kJLTfPDpdFtzVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDrkWS+043x96sLDXdoncbyUSUAGOpKfbJ0+4DtRykc=;
 b=n7LHQqH6vR3slN1zwJL2mTbQAjmJefEVPOhs3qWmCL49IUHzYJu+mTCpPcjTVYkGdli3zDlcsIVy3ive7h7PZVwkZeg6Kgv/3/ztIyIP3h9wplh6wKqky1SEd/gLMBe3GOY8k4rul7qXq7kVOjoTPjPHntpFm6lOKKqxnYv3huKMlLKuZ/D9BRGmiuZXi5F/ZwlC8ueTzOYBbmsFJ8SR/JEvFU+qZZdjdP+gSJhe2vTcI7epYfDOTi7Clj5+SQBO/+QTHxc6mqcevpSgbx8hroa1/CBWL/uz+SWIlYeA9ntxJXusBOxxGkSPNbym2R06AzpcWTsBm7ecM14QkHYX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDrkWS+043x96sLDXdoncbyUSUAGOpKfbJ0+4DtRykc=;
 b=gl6OEm5fdlRYoZj1ytqnIoGssZnABIhfh04h3a5K/K9flBqQuz2K06YvaHngmzTaICAMqm2am+rPEhhVJN9LMMfMu/6gM3atnDWAiaf1nyGWQWZfobXAwo2S82IH1aI6OtcMZEqi4J9zJcv1/tOXtn3vkkR9yZ3uvaxVYz+Z6jw=
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by BYAPR15MB3191.namprd15.prod.outlook.com (2603:10b6:a03:107::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15; Wed, 18 Mar
 2020 15:37:06 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::a0af:3ebe:a804:f648]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::a0af:3ebe:a804:f648%6]) with mapi id 15.20.2814.021; Wed, 18 Mar 2020
 15:37:06 +0000
Date:   Wed, 18 Mar 2020 08:37:02 -0700
From:   Roman Gushchin <guro@fb.com>
To:     Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
Subject: Re: linux-next build failure on arm64 with CMA but !NUMA
Message-ID: <20200318153702.GA22501@carbon.DHCP.thefacebook.com>
References: <20200318114109.GA65068@bogon.m.sigxcpu.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318114109.GA65068@bogon.m.sigxcpu.org>
X-ClientProxiedBy: MWHPR19CA0008.namprd19.prod.outlook.com
 (2603:10b6:300:d4::18) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.DHCP.thefacebook.com (2620:10d:c090:400::5:6aee) by MWHPR19CA0008.namprd19.prod.outlook.com (2603:10b6:300:d4::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.21 via Frontend Transport; Wed, 18 Mar 2020 15:37:05 +0000
X-Originating-IP: [2620:10d:c090:400::5:6aee]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f264a5d0-9ce7-4772-5cb5-08d7cb5236ab
X-MS-TrafficTypeDiagnostic: BYAPR15MB3191:
X-Microsoft-Antispam-PRVS: <BYAPR15MB3191AD5B07FC8C8BEE51C09CBEF70@BYAPR15MB3191.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(366004)(199004)(8936002)(8676002)(81166006)(81156014)(66946007)(52116002)(7696005)(66556008)(66476007)(86362001)(6506007)(55016002)(6916009)(2906002)(4326008)(9686003)(33656002)(1076003)(498600001)(5660300002)(186003)(6666004)(4744005)(16526019);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR15MB3191;H:BYAPR15MB4136.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QdB1QbhhUkuJ+Lb7rV8scTCkkzObPxMywIWK63RNuCTJ0KAgw7Z0fRinYnvU1hOhPIKi3g3+bxDJqDtraXUXKO+yl+O7g9kC+et8oG13RRZK5ETexHqrWGtuQIbRT0d3zdMCOD/hkPCWRef24C+7gN4pv56ghmFnm+khBobY9M3uyHGzbFEP/Y4BcHoctA5kNCTPMAPb3gXIsufVZc6sNimCSWK6XR0DePsNH/UStsm3EP98ZBSXXvVd2POqsXphQxxTxwwj+4bAcEk+wxHbLe/2/mrCSoZpH5ICpfbtoXEtlSCIiXwFifuKv16NXtzAKxr4Els/4oDcPsEwCCSqeGsxEum9OUt5e6Y7hKkR7+Qoobf2tEQErR/H8fJuOEuUfkeUfu+xmj8RkPL16i8O3T1M4CFFWXOI+efdu6LBlnF6jSl/l4av3cPa1S+oUoSL
X-MS-Exchange-AntiSpam-MessageData: pohI1PXwvXq2X2LQx4J//MsCw2wBw6bLdKOKh3b2XQAT2DVbjEavsoD0+zRrW5bLWZuTITNM0ABX0r8S84FK8j7ZtuQJOOIpkwX/8p3TFlxs4st8wrGK7W/e7cVgWv1YrOKVcVJ4nRgScyeE0/vVXInfFFzvZFL8W2BtjSMMxEIVnZ71rAjz0dL+2OZcPkqz
X-MS-Exchange-CrossTenant-Network-Message-Id: f264a5d0-9ce7-4772-5cb5-08d7cb5236ab
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 15:37:06.2120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VXsaEysgtpoU+APH0h8tJNEBpMcopEYXg28a7v34XoNJRtNQdhLJ8gJa9a2ngG03
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3191
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-18_07:2020-03-18,2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 impostorscore=0
 mlxlogscore=685 malwarescore=0 phishscore=0 spamscore=0 suspectscore=1
 clxscore=1011 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003180073
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 12:41:09PM +0100, Guido Günther wrote:
> Hi Roman,
> 882d60d2ce725381236a158204d7ec13ff19ab25 in linux-next broke compilation
> on arm64 CMA && !NUMA like
> 
>   CC      kernel/irq/irqdesc.o
> mm/hugetlb.c: In function ‘hugetlb_cma_reserve’:
> mm/hugetlb.c:5449:3: error: implicit declaration of function ‘for_each_mem_pfn_range’; did you mean ‘for_each_mem_range’? [-Werror=implicit-function-declaration]
>    for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
>    ^~~~~~~~~~~~~~~~~~~~~~ 
>    for_each_mem_range
> mm/hugetlb.c:5449:61: error: expected ‘;’ before ‘{’ token
>    for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
>                                                              ^~
> Reverting that fixes the build for the moment. Would making all of this
> dependent on CMA && NUMA be the right fix?

Hello Guido!

Thank you for the report!

We've been discussing the issue for a couple of days, and I've proposed a fix.
I've just resent it to linux-mm@ (you're in cc), so hopefully it will be merged today.

Thanks!
