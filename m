Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916F5224283
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 19:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbgGQRro (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 13:47:44 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:6170 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726232AbgGQRro (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Jul 2020 13:47:44 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 06HHlYcC011245;
        Fri, 17 Jul 2020 10:47:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=ismwuUsenhx6tCs9S3sjoVHVjXmpL8GD2doGKWKGjWY=;
 b=YJ+rsBT6wY0m8c8H658GEv+K5ieS7MmK5VdOXZmFxKx2jjBeccMkJoIsBoMzoU6Jueq7
 pJG/XyeKSISmNTEETcJjWaOKFiP5U3l9EZPmYaY9tidSf2w/Ppww/EbC3Y9eEvRbuujz
 2MAV8fYFBgENmlm8BIPHvzM9zlhagAlmyuk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by m0001303.ppops.net with ESMTP id 32arerxctf-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 17 Jul 2020 10:47:34 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 17 Jul 2020 10:47:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JnVs4nkmQl48iIFmXRSR6BGAEB1f7yxO/BlEWv+0POpw/to9BOMjhF56JwaUiwkZclXYy7v0hxP8Abr1E1un4IsiB2CtKyRBDS8QK3gs+P024S/2ON5M09Qq55MM3bZ3Sh0Il6Ot2pxI8P45dEPt4lPPwMFobY4rz1BtMoofx32Exx1gcbDP3YoFPTLsjWM7erh4VGHH/e7eldHMjmux5mnB+RDGGEUV7iXraqPDmiLtSc+v0lH0fY2Yu4HVsO+lkM3OAgQNif+LJkcB0Sz6HlSlhb1fDj60JIrl+zC1KS/ezn6TnoBDBhN+peVo4i2+2JcLK9h5mLsDgnLFDwyEBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ismwuUsenhx6tCs9S3sjoVHVjXmpL8GD2doGKWKGjWY=;
 b=MC+xg4agbOI9hoO2+mN4ryayqLRH9R8DBDrVDyBbW5lAVIzTdayicLfUkQTEAUOY+/PUgk+kdRlp7MeFvz3E2vuAjUGfpy8zP7+06Ulo4aGhVqTa9YsQQfsrdnvSqCfCpt1y9EzxzrvuX4L2NnQfh1xT//z6SIdAxfsAt333IUDg4h1mfLT9cqHKNuVkCsbGvCU/um5v9lpDTek8oXsbxVXvC4inenGRi9UxmwZh5kwiRU5PTOQhkN/g45qXtD0VwE3iPY7Cz8dbuwnsMNjIm5nz4ogRommQCVyBYrjln9vGz8hw4rpe2wwQUxStTx9u51xwp6ZG6Ymk5Ds1xw151Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ismwuUsenhx6tCs9S3sjoVHVjXmpL8GD2doGKWKGjWY=;
 b=QqKhkp/ooS/IJrBTQzqSx9al+DXkKeiyczWXVN4azEwnqKhAY5PW7H/RqVqroVV62OLsJw9XPNx+NklR2L6DrSecNgJdOpDlCDzOdzNP6UX2cVJnZppIGnYYslOBtWSjet2AWl4bO4lEIueb0ufhChnEaj5CiU+AmSeYVvwi8a0=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=fb.com;
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by BYAPR15MB3144.namprd15.prod.outlook.com (2603:10b6:a03:fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Fri, 17 Jul
 2020 17:47:08 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::48e3:c159:703d:a2f1]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::48e3:c159:703d:a2f1%5]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 17:47:08 +0000
Date:   Fri, 17 Jul 2020 10:47:05 -0700
From:   Roman Gushchin <guro@fb.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <20200717174705.GA55916@carbon.DHCP.thefacebook.com>
References: <20200717203127.00db2444@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717203127.00db2444@canb.auug.org.au>
X-ClientProxiedBy: BY5PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:180::41) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.DHCP.thefacebook.com (2620:10d:c090:400::5:bef8) by BY5PR13CA0028.namprd13.prod.outlook.com (2603:10b6:a03:180::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.9 via Frontend Transport; Fri, 17 Jul 2020 17:47:08 +0000
X-Originating-IP: [2620:10d:c090:400::5:bef8]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ca2caf9-1504-425c-32df-08d82a796d42
X-MS-TrafficTypeDiagnostic: BYAPR15MB3144:
X-Microsoft-Antispam-PRVS: <BYAPR15MB3144BA5CA8B7397B8B26298CBE7C0@BYAPR15MB3144.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:586;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQWk/VVyBWfPoSqn0gUT09Fy/tZrS8+S8RXBIaHnhkxDmp6x45FTbpR51dNTeLH5f2MwGbzYkQ9Ma+xUGNKGgDijfxFEr3VWjKxowEs5xJNETY7EJJZ1mlA2BMC6lbn/If4kiGgcTJTHStNxZYTpX2YeRM9OgrrGKSuiYufkaTcNLDoeZIeGJBYuW3llty9NYllyPPyFTyA5cDdR6hxsbrmbcZX04cKBZjdIpEYe+lfp5YpDkPm4xQgcNkNGpueXKv/EqRtgZj+pp+PWJ2Fp2uocSj6lTrA5TtO6SKKoHzvITeZJe6VFxHbYjBXnnMjyMNeE6uWhxXgZb6VeTBsRmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB4136.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(366004)(136003)(39860400002)(396003)(6506007)(86362001)(6666004)(54906003)(110136005)(9686003)(5660300002)(55016002)(83380400001)(8936002)(16526019)(8676002)(2906002)(33656002)(478600001)(186003)(4326008)(66946007)(52116002)(66556008)(316002)(1076003)(66476007)(7696005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: G1QG2W4gZltnulqRcisa0LtFqSH7/IRk2ljY/tlqxaZMl2IzNRYCsg5PAEksEaQYrGgvJU9451iEPtgXioQsTXF1bjOKWVV7+bSefkewHmEUXNYgJWlYawN9dEtQjycJej+PRvoLpww5x3mGqCXo7DkF0lMqYucNObSu61JwswjFoSYApKv3YWHihYxT7GFD6H6cCCbtGnfSYrY6VwOrhxAG6le/douTDYp9d0rHk5qjMw/dkP8piyg7xLn95dgH8qS0XlmqxSH4L61lDvU5bLoOoQoEAw5YFP3VZ6tjLTLoUiwR88QKuFrK4aJ/3RaUJQlLg3H+PPSQM7kYVFe3cwXmUlWJ/2zmB+3FfRjviDlaO5c/+//NnmQU6dInABbcvybZmEBgTQO2t/bqhH6hE+bbiYX2DVplwKoNSvItAloKAnC6JNZhfOzqMBODBvUbgej6KFwPOXq/y/lDALtxqB9R/xBFjTheIuPWsaimKDRczvOuKBxA8z13qdBXqj0GPo3RlMcDp7Zi68hw3MhuJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca2caf9-1504-425c-32df-08d82a796d42
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB4136.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 17:47:08.7538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ji0HF7vllLezDvvFYqGL0offLy8XnbYHrJHdolEhvWVia10eGMZ/7GX0xAXV5FOj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3144
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-17_08:2020-07-17,2020-07-17 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 bulkscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=1 malwarescore=0
 spamscore=0 phishscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007170127
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 17, 2020 at 08:31:27PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> mm/vmstat.c:614: warning: "MAX_THRESHOLD" redefined
>   614 | #define MAX_THRESHOLD 0
>       | 
> mm/vmstat.c:172: note: this is the location of the previous definition
>   172 | #define MAX_THRESHOLD 125
>       | 
> mm/vmstat.c:614: warning: "MAX_THRESHOLD" redefined
>   614 | #define MAX_THRESHOLD 0
>       | 
> mm/vmstat.c:172: note: this is the location of the previous definition
>   172 | #define MAX_THRESHOLD 125
>       | 
> 
> Introduced by commit
> 
>   5f6bac149e10 ("mm: vmstat: fix /proc/sys/vm/stat_refresh generating false warnings")
> 
> The preproccesor directives look like this:
> 
> #ifdef CONFIG_SMP
> #define MAX_THRESHOLD 125
> #ifdef CONFIG_HAVE_CMPXCHG_LOCAL
> #else
> #define MAX_THRESHOLD 0
> 
> So I guess the second MAX_THRESHOLD was put after the wrong #else?

Right, I missed it. Sorry for the inconvenience!
And thank you for pointing at it!

The following diff fixes it.

Andrew, can you, please, squash it into the
"mm: vmstat: fix /proc/sys/vm/stat_refresh generating false warnings" ?

Thank you!

--

diff --git a/mm/vmstat.c b/mm/vmstat.c
index 8f0ef8aaf8ee..08e415e0a15d 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -168,9 +168,12 @@ EXPORT_SYMBOL(vm_numa_stat);
 EXPORT_SYMBOL(vm_node_stat);
 
 #ifdef CONFIG_SMP
-
 #define MAX_THRESHOLD 125
+#else
+#define MAX_THRESHOLD 0
+#endif
 
+#ifdef CONFIG_SMP
 int calculate_pressure_threshold(struct zone *zone)
 {
 	int threshold;
@@ -611,8 +614,6 @@ void dec_node_page_state(struct page *page, enum node_stat_item item)
 EXPORT_SYMBOL(dec_node_page_state);
 #else
 
-#define MAX_THRESHOLD 0
-
 /*
  * Use interrupt disable to serialize counter updates
  */
-- 
2.26.2

