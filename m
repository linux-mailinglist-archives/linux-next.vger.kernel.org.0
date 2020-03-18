Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00863189FD5
	for <lists+linux-next@lfdr.de>; Wed, 18 Mar 2020 16:38:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgCRPiH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Mar 2020 11:38:07 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:7308 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726911AbgCRPiH (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Mar 2020 11:38:07 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02IFJwiM017450;
        Wed, 18 Mar 2020 08:37:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=facebook; bh=CAzbwRkXKfrD6chlcncK8YEiXpc2PgNkEbrScmawcpQ=;
 b=ISfCgnD0FJSyClMFJ0e0W2EaWmMB9Nr+OhiFt8euUgHz169mBF3w2aCF4pZ0ZSLaO9Rw
 Niu1W3bvEpOEl/Tb1gPUc+i/lSNCT069yMnG0g772n8d3khWLHSJOOehKHLAtMzdRXUz
 2CtzZOb4Qhyz65XLWTC5mWRkWVum36l/zSw= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 2yu9avk4bv-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 18 Mar 2020 08:37:45 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Wed, 18 Mar 2020 08:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j9Lt3ZeQLmRgw8L8arBaI7P40u8/75S+WrrC5oUNDpoc8MPWfjACCRdOkMTgA6VXjHlQ6jAod4WNOxNhozNqvvD6ttyKFGNNpzEMogncPZYAFKgpFXoMT9ZobTQJ0mS+2zclFbzKA1+W/oVTfQJjRH5+ZLRRohCKeG8/CHZokf2AUanq46kRFk0naH+XKmNgoOsx0NDv9IQ6tNLKekEFl4jvZ1WpxCADMdbm3lhVUVhSa8/yiCfSSSoDieK9iLra9vXztUacBxgPUaBsMvVicaMja2j1Kc14F2YcsQz/AA25yHg0RLlQTtSX4CiRV6r1fOK+7J1U8vowHFO7woF43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAzbwRkXKfrD6chlcncK8YEiXpc2PgNkEbrScmawcpQ=;
 b=Jb7+U95q2bKRNiJUkHx+n6FnZIf1Q5xRNXWTgDqTtYs+seazJ0Ae52VYj6cp6KkoIFuLfCXJvrCZmGqUYHxwbmdC2CRLBatgcu9nLMh7hXJrqAe58VmZ8Tz0zwK468OVAA4xPDSv4w40VYFFUhani7CrVCi4ns0bcAlzzFz1/5s+qM5JU3/+B3Dm1F2shfbigUMYNO0CXzxbVoIJh+/CWU8Plwo2aHgT0xqIjOGHJ20/5XqmsDanEOq2Gq7kbxcegu2KYag2UJAUXFD0frMh/eoiLtRo1xFp1nF0kkEX9xkn7DZsGZMllwAoXyTuYRrU0T2i28umRuHQLjI7I/hGmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAzbwRkXKfrD6chlcncK8YEiXpc2PgNkEbrScmawcpQ=;
 b=JcwhZtqY8YSPadjIzyb+AYMHbA/DpPnzd0a+PhAExzRbuO+WhDkaOytaooyq/8AITDRaw2UuGXrBgAXZWZhO9/NE1e+jtvX1XRhuIqI7Dyz7ByQ6R1RZm+zUsFAMyJ9rVb/1kXGkooOPelScp0aK7apMp/+Ef+fqy0jnMGdfQCU=
Received: from BYAPR15MB4136.namprd15.prod.outlook.com (2603:10b6:a03:96::24)
 by BYAPR15MB2262.namprd15.prod.outlook.com (2603:10b6:a02:8c::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18; Wed, 18 Mar
 2020 15:37:42 +0000
Received: from BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::a0af:3ebe:a804:f648]) by BYAPR15MB4136.namprd15.prod.outlook.com
 ([fe80::a0af:3ebe:a804:f648%6]) with mapi id 15.20.2814.021; Wed, 18 Mar 2020
 15:37:42 +0000
Date:   Wed, 18 Mar 2020 08:37:38 -0700
From:   Roman Gushchin <guro@fb.com>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
CC:     open list <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        <lkft-triage@lists.linaro.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>, <andreas.schaufler@gmx.de>,
        <js1304@gmail.com>
Subject: Re: mm: hugetlb.c:5449:62: error: expected ';' before '{' token
 for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL)
Message-ID: <20200318153738.GB22501@carbon.DHCP.thefacebook.com>
References: <CA+G9fYtk0jCB1M=MeYP4SshXjyyhLJbHuSzpOkq0OPVjSRpqZg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtk0jCB1M=MeYP4SshXjyyhLJbHuSzpOkq0OPVjSRpqZg@mail.gmail.com>
X-ClientProxiedBy: MWHPR22CA0053.namprd22.prod.outlook.com
 (2603:10b6:300:12a::15) To BYAPR15MB4136.namprd15.prod.outlook.com
 (2603:10b6:a03:96::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from carbon.DHCP.thefacebook.com (2620:10d:c090:400::5:6aee) by MWHPR22CA0053.namprd22.prod.outlook.com (2603:10b6:300:12a::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.15 via Frontend Transport; Wed, 18 Mar 2020 15:37:41 +0000
X-Originating-IP: [2620:10d:c090:400::5:6aee]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d00b56d-5fe2-4f54-6ac2-08d7cb524c71
X-MS-TrafficTypeDiagnostic: BYAPR15MB2262:
X-Microsoft-Antispam-PRVS: <BYAPR15MB2262429158483D5104848949BEF70@BYAPR15MB2262.namprd15.prod.outlook.com>
X-FB-Source: Internal
X-MS-Oob-TLC-OOBClassifiers: OLM:576;
X-Forefront-PRVS: 03468CBA43
X-Forefront-Antispam-Report: SFV:NSPM;SFS:(10019020)(136003)(366004)(346002)(376002)(396003)(39860400002)(199004)(4326008)(52116002)(7696005)(8936002)(81156014)(8676002)(81166006)(6506007)(7416002)(6666004)(33656002)(1076003)(6916009)(478600001)(54906003)(86362001)(16526019)(316002)(966005)(66556008)(9686003)(66476007)(66946007)(2906002)(55016002)(186003)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR15MB2262;H:BYAPR15MB4136.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;
Received-SPF: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZAjAiUdnPLnX+rXrtlibR668E05bRSEj97nE045VcbmGlS4Fd29ra+roFj8Tu/igLwqF26Cp8NiRD5/r0q5twRO/UpbdoYKrmcdySVN9kr70oYmbm/QY59Wy+wMlWYRvOzQZ/zW3YUZy8/TedkugoADp3tlOOCo5N7TkOpI1telR6ME1ACgd4kfy/vIjhZi9Y7u0JClPD/jkwkbeDU6K9otM+JtEdGdzZmZvCRjQBmudUPesw5W5lec2o9Mcq4QIJMXbu5K54kwjMxAFXlnRKJpqL8ymI35C13STKg6ZGacqKJhvX9Orba3geGQj4c+CWRLnTitBalBeBGpUIqy9wlFWhYzVzGF6D+R6Vx05Lo4CyTEfX6d3d+29l1A4nMKf164eZr810eudKYt3JuyAnEQ7iqQvxG4thOeTpWZZ3DjwfKIluFQDGcZQOmZckM7jVXSVHrlhEdw63+H9New7cttrcxJ5UV4DWLz0xKNZSsY6n2qG4hSgyyJUaVvW4kPkLl8ZkQZ2woP4x15L2Gmbg==
X-MS-Exchange-AntiSpam-MessageData: 4QGcPfo2RidKv4VtKOQFTgr7kXR20UOXyh7fbkORHNXhw69bxQsrR2sIVvVg6uUal9QSPsoaWLYHZAADMkIzwg3arQI8Zn3bo2YpzYa7JeK2GR4srPsY+mI8vS0mbB0AfvKm9hfOQOxJfmLvF8KMfi1PbK6Xuug3qGfoGoDZC8S+TGbB6ihVJ+lNjGhKOPOB
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d00b56d-5fe2-4f54-6ac2-08d7cb524c71
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2020 15:37:42.7342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFedVGopw7InH+9kisDGrs9fzkY03E3r9b30QJw60VBqqQMkDyySzPWVw4zYeVRN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2262
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.645
 definitions=2020-03-18_07:2020-03-18,2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 clxscore=1011 adultscore=0
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=759 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003180073
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 18, 2020 at 08:03:09PM +0530, Naresh Kamboju wrote:
> Linux next build failed on arm beagleboard x15.
> 
> Build error:
> /mm/hugetlb.c: In function 'hugetlb_cma_reserve':
> /mm/hugetlb.c:5449:3: error: implicit declaration of function
> 'for_each_mem_pfn_range'; did you mean 'for_each_mem_range'?
> [-Werror=implicit-function-declaration]
>    for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
>    ^~~~~~~~~~~~~~~~~~~~~~
>    for_each_mem_range
> /mm/hugetlb.c:5449:62: error: expected ';' before '{' token
>    for_each_mem_pfn_range(i, nid, &start_pfn, &end_pfn, NULL) {
> 
> config:
> https://urldefense.proofpoint.com/v2/url?u=http-3A__snapshots.linaro.org_openembedded_lkft_lkft_sumo_am57xx-2Devm_lkft_linux-2Dnext_718_config&d=DwIBaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=jJYgtDM7QT-W-Fz_d29HYQ&m=36B2rBvL7m63G1ffiQY8uKTRD5-t1fCOMaiubLFeCFI&s=wvwNdQn_ZM2uS8WDrAnK3MNOjgdZH17_m0W6nU6B6jE&e= 
>                                                               ^
> full build url:
> https://urldefense.proofpoint.com/v2/url?u=https-3A__ci.linaro.org_view_lkft_job_openembedded-2Dlkft-2Dlinux-2Dnext_DISTRO-3Dlkft-2CMACHINE-3Dam57xx-2Devm-2Clabel-3Ddocker-2Dlkft_727_consoleText&d=DwIBaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=jJYgtDM7QT-W-Fz_d29HYQ&m=36B2rBvL7m63G1ffiQY8uKTRD5-t1fCOMaiubLFeCFI&s=ziWfEC6V94C4hMva9LMHYjbVQiDIL0PqFolj52WtAps&e= 
> 
> -- 
> Linaro LKFT
> https://urldefense.proofpoint.com/v2/url?u=https-3A__lkft.linaro.org&d=DwIBaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=jJYgtDM7QT-W-Fz_d29HYQ&m=36B2rBvL7m63G1ffiQY8uKTRD5-t1fCOMaiubLFeCFI&s=KkC9c04y9ZU97zV5xpwJ4tHeoFRdC45JRuzeGbqb_Gs&e= 

Hello Naresh!

Thank you for the report!

We've been discussing the issue for a couple of days, and I've proposed a fix.
I've just resent it to linux-mm@ (you're in cc), so hopefully it will be merged today.

Thanks!
