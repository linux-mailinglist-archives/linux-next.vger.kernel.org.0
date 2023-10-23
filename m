Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94AEE7D4305
	for <lists+linux-next@lfdr.de>; Tue, 24 Oct 2023 01:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjJWXEE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Oct 2023 19:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjJWXED (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Oct 2023 19:04:03 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6954ED79
        for <linux-next@vger.kernel.org>; Mon, 23 Oct 2023 16:04:00 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39NMIqAE009053;
        Mon, 23 Oct 2023 23:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : references : cc : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=qa0U7DEf3LFvPppBkOHFTwAov4caDpJz8/mbba+9jcs=;
 b=gwhKftJ+mINVr9bOv27n2YnAmaR7scZ5FexOukfmA7AjXbc6XE7KrzQi+6J9A9GboMbZ
 WxGGf/E3DOC7VQaqrudkh/RnflRPeFWcuc7Gn5oKUfKFRUEZQJXTzF+HWWejz+5IhmI2
 ZDOElL5RHIAyA3IDA854huyVYeZpxzo2H0ZyEG0RtVU7MsewfRppLIl84vmeM3YlvkFs
 dWM6IK+H6AQE76fvmfZyeb35DOo8/IRJV1NcAaCYR2D7S9ctePji5IvO7TDbompTlpqA
 o/59K5ZB+/nDk2cB2yzn2qggXYKIyL8K5zxasK+fUkAMX7eliJLhgyNaY2EyyPc2evaL KQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tv52dv860-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Oct 2023 23:03:55 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39NLGqHk031101;
        Mon, 23 Oct 2023 23:03:44 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3tv53b4cd0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Oct 2023 23:03:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/S9Entkt4CiR4iwNYEPk9nT61e49EmO7gejeytktdWr/c7KrrK7vv1yqu2uWStFCwzlBIwr8R1k0vEVMPO8L016GfzMrrWwWtMaxNmpfro3z27AmupwKqLrtBYdQseYJAQb8+PjsaqMo7zdCr7miiqpVkUzBU9BjO7DTx35WkrS4tQa2Hz6CEkunOhTiJSBaBboZSi0Jh49zyWi95o+0SM1MsmUTO6uKoLc+3eFA7ktP+9BBtR1GiGSYXSqzTU2Ulq/YUmTV5IOmrPVL1aig72DRDH7ScEHbxnGh7i6oFygKkA6eEC5c9fpxAAKBEv5SE+TK/MypS+8wwl507OcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qa0U7DEf3LFvPppBkOHFTwAov4caDpJz8/mbba+9jcs=;
 b=GcEIDITB3w+i8jI5i+alTtl6tYYGSGVd9h/mR714OAyRmOVQ3bNnKeEKg41MRNdB2N10kgZ6HuGivRTJkqjBWRIJ3zu9yGQI4bobgAXzgXojIdO9AIfNNFQ7abvWMhfZUO3tLNyPZJwaaDxsYY8USGTT+5OV7zXS1X7FuHrMVP3Xqr5Z+H0I/BtUMrMijiQQ3cinsSxEj1OVYYYX4wMl1EG1FYWIVYH/bx46AjAWVHdXus3lhK+c97EIrSHAIKayusiahnDZLmDu5LpymidG+kuN0Pq5Wtnixg+0RhwBphQDHVd+aD09EPgAQ+bzpQA1wThwWS33Z5FyzIYdmnrplA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qa0U7DEf3LFvPppBkOHFTwAov4caDpJz8/mbba+9jcs=;
 b=O4rs5iHBGuN3xMJ34bqU8raT7gySvg/+xsgAXeELl66lT6LLUpDOVa2jm3/06jiflpiQiG/4p5DQ5Kdnghbkp+mHYpynZSG8EV6fAcxyG7ONr4n+p/HfW35JG7SV9AExocZxFP3BF7oaauG6Cty8Tq2LjpHXsb4OnseMhXROF3o=
Received: from SA1PR10MB6519.namprd10.prod.outlook.com (2603:10b6:806:2b1::8)
 by SJ0PR10MB5858.namprd10.prod.outlook.com (2603:10b6:a03:421::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Mon, 23 Oct
 2023 23:03:41 +0000
Received: from SA1PR10MB6519.namprd10.prod.outlook.com
 ([fe80::77bd:3721:8a42:ecab]) by SA1PR10MB6519.namprd10.prod.outlook.com
 ([fe80::77bd:3721:8a42:ecab%5]) with mapi id 15.20.6907.025; Mon, 23 Oct 2023
 23:03:41 +0000
Message-ID: <b4913f84-8b52-4d28-af51-8573dc361f82@oracle.com>
Date:   Mon, 23 Oct 2023 16:03:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] vhost-vdpa: clean iotlb map during reset for older
 userspace
Content-Language: en-US
To:     "Michael S. Tsirkin" <mst@redhat.com>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>
References: <1697880319-4937-1-git-send-email-si-wei.liu@oracle.com>
 <1697880319-4937-6-git-send-email-si-wei.liu@oracle.com>
 <8a3ec6465bc150fba804f34d456115c4f8a29c70.camel@nvidia.com>
Cc:     Dragos Tatulea <dtatulea@nvidia.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
From:   Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <8a3ec6465bc150fba804f34d456115c4f8a29c70.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR16CA0034.namprd16.prod.outlook.com
 (2603:10b6:208:134::47) To SA1PR10MB6519.namprd10.prod.outlook.com
 (2603:10b6:806:2b1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR10MB6519:EE_|SJ0PR10MB5858:EE_
X-MS-Office365-Filtering-Correlation-Id: d61819a4-3fcf-4db7-1c16-08dbd41c4cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rDlgBcjid4hWYOkrktFGmyO8H4dN7cM24YL9N0qcIB0iqRCAPWIZKwHcneCe6T1xsFAspgcsjV+ufXQhImGGbWZQJwe34i3QgLtHZvBLuWCBSSungG5V2KSpUIx8lJx4eoElwKorJRW9MZr/ncFYShFbh3cGLqrtQiMMQ4OWw4m/dO5WKZZ6NPlY3vdmu6TFj51+qgXXJxVGsz0VSu6qFfH8bZmePPlTGQJCwcPBkLxkcsYkhP/8xOrGWTJ/xY2SUlWbGiy83X7Buy3OI6GwXhiDpGsaHd/iWNcTRgdJkN8aOXYD75kei4ZqyvIiDpvEGMwf5QH7xwwPrt46Ksrv5CPkgxGwz/5ePSGQys/tHcB4uIvKUA5R5UPS2Jm2okU1qzpwKoJpa8xqSMtRhrqumXoluJNFYA/IH7toIAIlFEKTBffV1W86+9yR6VVyxvmJ95BZcobv9kDlNBnFYrFNC21dtY+ozCKK7P/hmkQ/F3scw7+5+e4cX+zmSdeUNHznyIhg7fZB6lz/AVrzu14iLmjX9TfWu1yvcNfg2dmivuQ4KZq+qDaKI4CvujI9pUxBCLF/UIdw5WZoCZvT68j8Rrsp5Ko9065L1d/uKNsoOfdvI+UlEHdKCZ+khYECmbW0ud37A+DyXxyp48r8kMuKnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB6519.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(366004)(346002)(136003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(26005)(31686004)(4001150100001)(38100700002)(2906002)(86362001)(41300700001)(31696002)(36756003)(5660300002)(4326008)(8936002)(8676002)(110136005)(478600001)(6506007)(36916002)(66476007)(54906003)(6666004)(2616005)(66556008)(316002)(66946007)(83380400001)(6486002)(53546011)(45080400002)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K25VcVZQSDBqNVFQZWxEUHJKQWhMNTlMMXRyUHdnUGsra25KODFPR1dUenZW?=
 =?utf-8?B?KzdaL0V4NTRmdThkOGZ4Z2JFWXJ6RC9mUGs1V1BMQkQzT0JlSjg2N09mUVhN?=
 =?utf-8?B?c0FuQ0xvVGZvdjNlMHBHNlNnR0gycHlRL1lvUk9oR0dGRXNrb1ZnYmowMGJr?=
 =?utf-8?B?R0gvai9QNWMxS2t6OTI4SmI3WXNqcjJwZ1hpRWRZaVBoUUpnMEt1ekcwTldl?=
 =?utf-8?B?S254aFZqM3RCVVJRZHdLNFB3RWd4cnBIQ0FXY3ppUGcwQzQwY3BuY2Ric0pF?=
 =?utf-8?B?YWExL2RBUEg3T2FoVlBGV0NUR0Z2T2VTZU52WFdvRzVwSjU3b0N6K05uQWIr?=
 =?utf-8?B?SnlSL2F2T1haQVFzTDN6Yy85bXJuN2pQL0I3aFl6ZjBhYldyVU5qZHUyWW1G?=
 =?utf-8?B?SStraHNmdUpTbWVxVGsweVV3VXhnUHdaV1Z4VlJaQS9uQU1IdUVsLzBmdS90?=
 =?utf-8?B?K2lkWC8vTW1xeFhyQnlUOUI2ejdXdG1VQTJ2K3UyQjJrNDJ5K2hJVll4NFpv?=
 =?utf-8?B?eGhUSnYva3g2Q01zOWlxaHBYbjZGdHhsZ0hWR2k3ck1QZ3RYZ3E4U0lKQlIx?=
 =?utf-8?B?VWQzZzcxR1ZpdTJVRUVXWjNLeml5Njh1OTBRa0RJdkFITjZtdXNOUmhMUEp3?=
 =?utf-8?B?aStEWjc1cFNRSDl5MmY2ak80L0tVbkw4Z2RBZTJHVEx2emp0TWx0Tm1iMGMv?=
 =?utf-8?B?WW1jaG1HZDRMcEpCOXZ4THNOQkR4b0g4YnZBVmt3RFB0YzRvUVBtV1RxOWYv?=
 =?utf-8?B?cXZKN2E1eUdWQmNaZUozRnluVmNqc1dMZHNIbHRBYlIzMmZiRFhhSjUwR0JB?=
 =?utf-8?B?SDUzck40bi8zejdlQWVCQVB4bnVYTURJaU9LWHZmSy8zVk1uSzVCMWFFSm92?=
 =?utf-8?B?NURMSlU3aDFtS29Fd0MxQ2pXRnBKT3FKWDNzT3luWHYzWEZrQWQ3MUpyZjlY?=
 =?utf-8?B?eDRyYnZLaHRBV3VLQUg3Z3lrMm1iK3lSTVZleVZyYW1OZ0hxUWk1Y2c5azBu?=
 =?utf-8?B?WHZMNVNEQklNOW1KS0s2ZUNFZlJwNEVLKzllWHExUCtLL3R4V1VXUitsU0Ri?=
 =?utf-8?B?U1grbU1HWW91V0ZtR0hzbnBTU3gydlZiQnlMcnZwa0NvR0RQSHRTYzRjT01k?=
 =?utf-8?B?cjRVMjBjcCs2NVlxSjNJc0RUc2lOcW5NYW0wYXNZRk04MC8vUjlwLytuRExv?=
 =?utf-8?B?dmdNOHlhWnBGdDhNbWZJWk1yRWk5VUk5N3FNdkNSNHlMN0xHeVZOWjlCbHlW?=
 =?utf-8?B?d1dwT0NrL1U3OHpDUmlVRmp3UHpJSnU3LzNoUEZwS3dzdzI0UHFGVmhBSG9y?=
 =?utf-8?B?ZFFKb0JjOHkxeGE1NmpyWmtkamx1S05YRmM3c1RSeEdTTUxwc3pNek4xTjZw?=
 =?utf-8?B?bVZYbGtzNnl2YXV1SUtBMUxHYXZqck5sQ0FUUDN0VmZCSjNSV0llVytDTVNh?=
 =?utf-8?B?SE5uQTduUXlrbUJTV0hzb3JvQXkxZkd4Q0J1cEJxeEJrYitIK3Q4TmhYM1lP?=
 =?utf-8?B?RnhKaGJ4TWtzS3ZndWdRMlpzQ3FTV2E4dmNsbFZvZnlIZnBtYkRCem5obFZD?=
 =?utf-8?B?VkZWTmZJTnQ2S1ZZTXhGdHZkc1FhRFVRZ1VnNWNMcktiMUMrV0hRVjVyN2Jr?=
 =?utf-8?B?V1IyNzFQcFJSZlJ3ZlhhTVpld2ErWXp4ckwzWjlQeTROMng1WHlWYnlPUG92?=
 =?utf-8?B?YVpWYWxWVnRmM3FHazRvRVozSEwrQUFCMFFFamJ1a3VVOC82U0NKWURHZUpS?=
 =?utf-8?B?YzZSazZMRS9iRFd6K211Uit4eENHSVlMRC9tcngwRjVGbm9zSVlRc1hwVDhw?=
 =?utf-8?B?VlNZeEl5MTlJRit4Z0NOc2ZSbm9yOEQvMmx5OUI2YmlyMnR1dit4STVGV1Y0?=
 =?utf-8?B?NVlkQm5CQ0xNTnY4MS94L1RUUEtSWkJmVllzcFF6ZHlNUHdrdDBTdXlEN01t?=
 =?utf-8?B?K1czQUE3Q0xOb1pOeVUzSzVmUWpYNVh6VDA1NzR3SmlTcTdPeFJiZzFqNFl2?=
 =?utf-8?B?RnROanNESnVxMTY2dmFmTVM1UldoYkZYVVMxTCtjM2YwNVdmTGd5eWQrTXpr?=
 =?utf-8?B?dC8zcGorTXRackRhRmtneVBMVmdQTXh0UU5PdGhWTTBpV1lEYWZTbzJKQk5D?=
 =?utf-8?Q?4hUg4etWVhUQxQ1NWkSOmy6fx?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: J96e2ZKaImHiTc6cnO/jKH/MYAj7VKnmY5iMEids+VKbnGAmfHyLEkGU3Vw8aiW+pmepVJXiX/g/u6sgNmgzsI2FTmpXJ/T4/GTBGfxTYqBK4jFva+XlD+La6t++xzteVeCHDIvQup1Caq+PIjdatjWsHtJgizd9Mj4klyOjUMZkJfYtgQ88fTmZdVmOJ5K70vhE7WHs4/EVE8umtC2ZSDK6OkNwaqJ/vdskVcw4EElKe+G/+jpddvaysersevjLu4YQ8XGw9Y6BN2KI0vX0yFnksDKLXDidI42QnLJPWUjeP7870+7v1t/a5zHzWxVW2L5B6VRGJxvZNSbkBQDm+8t/ETnTcFKgjLQi+5hCPM4gXnc24b+bJcCP724KUHogM/yggtPVUMBa8DPWbbL/2srUOOV0q7rLCln0TVq7ApkbVdhI5AJenFo8JT1wdRMaJYppnUcbAAQa/E+pBuTnEjv4qmTO/RwmhFjV7CEzDzaEr+WlotnyAsCO9em6GsWZNjd0ajM8W4AoArHPO7lSnYDdiS31+qiG34T0vgkkPQ4TrfMoPr/5Kgd7gK5yyBpKMwPxBkfM7kFhPYlczP3vhXx3t9dcFHQnWpwfZbCTFq8K1u0qNL4MaojoTv1n7Uxi7kxwv8Tdl2COUJL+vYvrWwgw9SG8syPaW7Vizz36uboXfc8DZxMJG+u5T5WmeAEcK5wgGuhDJ+qw91huDH9JuR4G5jxbkbtkqZNJ+vHkaeNjBtepSOvjoRfxp4YWdnJJxvC+zo/R2R3t0G1ysHYMYMQ5VCokobBVO33l71PXEQiR/6jmEz57FlxPLLBYeyYKn+LO2rGCHZtCbZDj5EN4OmZrGybNz/AXAMop6yGqbsc0XsI5RXiMqP7cY6f3X6KA1bCa7j/fiC0E1ufCiNdYnw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61819a4-3fcf-4db7-1c16-08dbd41c4cd0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB6519.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 23:03:41.7211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/n2achXOhaCZtRtBfSnTNRC6l7nPEBpAyLnSY/W5ghGB0wG/UUbbLzW6nlNF+NtWCOQX/CG4uWAb6sFtiIXTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5858
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-23_21,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310230203
X-Proofpoint-ORIG-GUID: _80jug4inR2aQ670AKqJyuwy9s1ZkMnS
X-Proofpoint-GUID: _80jug4inR2aQ670AKqJyuwy9s1ZkMnS
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

(+ linux-next)

Hi Michael,

Dragos reported below oops for which I have a fix at hand (having it 
fully tested), ready to be posted to linux-next. Please let me know if 
you want me to respin the original patch series, or you would think it'd 
be fine to fix it on top.

On 10/23/2023 11:59 AM, Dragos Tatulea wrote:
> On Sat, 2023-10-21 at 02:25 -0700, Si-Wei Liu wrote:
>> Using .compat_reset op from the previous patch, the buggy .reset
>> behaviour can be kept as-is on older userspace apps, which don't ack the
>> IOTLB_PERSIST backend feature. As this compatibility quirk is limited to
>> those drivers that used to be buggy in the past, it won't affect change
>> the behaviour or affect ABI on the setups with API compliant driver.
>>
>> The separation of .compat_reset from the regular .reset allows
>> vhost-vdpa able to know which driver had broken behaviour before, so it
>> can apply the corresponding compatibility quirk to the individual driver
>> whenever needed.  Compared to overloading the existing .reset with
>> flags, .compat_reset won't cause any extra burden to the implementation
>> of every compliant driver.
>>
>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>> ---
>>   drivers/vhost/vdpa.c         | 17 +++++++++++++----
>>   drivers/virtio/virtio_vdpa.c |  2 +-
>>   include/linux/vdpa.h         |  7 +++++--
>>   3 files changed, 19 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
>> index acc7c74ba7d6..9ce40003793b 100644
>> --- a/drivers/vhost/vdpa.c
>> +++ b/drivers/vhost/vdpa.c
>> @@ -227,13 +227,22 @@ static void vhost_vdpa_unsetup_vq_irq(struct vhost_vdpa
>> *v, u16 qid)
>>          irq_bypass_unregister_producer(&vq->call_ctx.producer);
>>   }
>>   
>> -static int vhost_vdpa_reset(struct vhost_vdpa *v)
>> +static int _compat_vdpa_reset(struct vhost_vdpa *v)
>>   {
>>          struct vdpa_device *vdpa = v->vdpa;
>> +       u32 flags = 0;
>>   
>> -       v->in_batch = 0;
>> +       flags |= !vhost_backend_has_feature(v->vdev.vqs[0],
>> +                                           VHOST_BACKEND_F_IOTLB_PERSIST) ?
>> +                VDPA_RESET_F_CLEAN_MAP : 0;
> Hi Si-Wei,
>
> I am getting a Oops due to the vqs not being initialized here. Here's how it it
> looks like:
>
> [   37.817075] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [   37.817674] #PF: supervisor read access in kernel mode
> [   37.818150] #PF: error_code(0x0000) - not-present page
> [   37.818615] PGD 0 P4D 0
> [   37.818893] Oops: 0000 [#1] SMP
> [   37.819223] CPU: 3 PID: 1727 Comm: qemu-system-x86 Not tainted 6.6.0-rc6+ #2
> [   37.819829] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-
> 1.13.0-0-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
> [   37.820791] RIP: 0010:_compat_vdpa_reset+0x47/0xc0 [vhost_vdpa]
> [   37.821316] Code: c7 c7 fb 12 56 a0 4c 8d a5 b8 02 00 00 48 89 ea e8 7e b8 c4
> e0 48 8b 43 28 48 89 ee 48 c7 c7 19 13 56 a0 4c 8b ad b0 02 00 00 <48> 8b 00 49
> 8b 95 d8 00 00 00 48 8b 80 88 45 00 00 48 c1 e8 08 48
> [   37.822811] RSP: 0018:ffff8881063c3c38 EFLAGS: 00010246
> [   37.823285] RAX: 0000000000000000 RBX: ffff8881074eb800 RCX: 0000000000000000
> [   37.823893] RDX: 0000000000000000 RSI: ffff888103ab4000 RDI: ffffffffa0561319
> [   37.824506] RBP: ffff888103ab4000 R08: 00000000ffffdfff R09: 0000000000000001
> [   37.825116] R10: 0000000000000003 R11: ffff88887fecbac0 R12: ffff888103ab42b8
> [   37.825721] R13: ffff888106dbe850 R14: 0000000000000003 R15: ffff8881074ebc18
> [   37.826326] FS:  00007f02fba6ef00(0000) GS:ffff88885f8c0000(0000)
> knlGS:0000000000000000
> [   37.827035] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   37.827552] CR2: 0000000000000000 CR3: 00000001325e5003 CR4: 0000000000372ea0
> [   37.828162] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   37.828772] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   37.829381] Call Trace:
> [   37.829660]  <TASK>
> [   37.829911]  ? __die+0x1f/0x60
> [   37.830234]  ? page_fault_oops+0x14c/0x3b0
> [   37.830623]  ? exc_page_fault+0x74/0x140
> [   37.830999]  ? asm_exc_page_fault+0x22/0x30
> [   37.831402]  ? _compat_vdpa_reset+0x47/0xc0 [vhost_vdpa]
> [   37.831888]  ? _compat_vdpa_reset+0x32/0xc0 [vhost_vdpa]
> [   37.832366]  vhost_vdpa_open+0x55/0x270 [vhost_vdpa]
> [   37.832821]  ? sb_init_dio_done_wq+0x50/0x50
> [   37.833225]  chrdev_open+0xc0/0x210
> [   37.833582]  ? __unregister_chrdev+0x50/0x50
> [   37.833990]  do_dentry_open+0x1fc/0x4f0
> [   37.834363]  path_openat+0xc2d/0xf20
> [   37.834721]  do_filp_open+0xb4/0x160
> [   37.835082]  ? kmem_cache_alloc+0x3c/0x490
> [   37.835474]  do_sys_openat2+0x8d/0xc0
> [   37.835834]  __x64_sys_openat+0x6a/0xa0
> [   37.836208]  do_syscall_64+0x3c/0x80
> [   37.836564]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [   37.837021] RIP: 0033:0x7f02fcc2c085
> [   37.837378] Code: 8b 55 d0 48 89 45 b0 75 a0 44 89 55 9c e8 63 7d f8 ff 44 8b
> 55 9c 89 da 4c 89 e6 41 89 c0 bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0
> ff ff 77 33 44 89 c7 89 45 9c e8 b8 7d f8 ff 8b 45 9c
> [   37.838891] RSP: 002b:00007ffdea3c8cc0 EFLAGS: 00000293 ORIG_RAX:
> 0000000000000101
> [   37.839571] RAX: ffffffffffffffda RBX: 0000000000080002 RCX: 00007f02fcc2c085
> [   37.840179] RDX: 0000000000080002 RSI: 000055e439b5fa40 RDI: 00000000ffffff9c
> [   37.840785] RBP: 00007ffdea3c8d30 R08: 0000000000000000 R09: 00007ffdea3c8df8
> [   37.841396] R10: 0000000000000000 R11: 0000000000000293 R12: 000055e439b5fa40
> [   37.842014] R13: 0000000000000000 R14: 000055e43792fd00 R15: 0000000000000000
> [   37.842626]  </TASK>
> [   37.842884] Modules linked in: vhost_vdpa vhost mlx5_vdpa vringh vhost_iotlb
> vdpa mlx5_ib mlx5_core xt_conntrack xt_MASQUERADE nf_conntrack_netlink nfnetlink
> iptable_nat nf_nat xt_addrtype br_netfilter rpcrdma rdma_ucm ib_iser libiscsi
> scsi_transport_iscsi ib_umad rdma_cm ib_ipoib iw_cm ib_cm ib_uverbs ib_core
> overlay zram zsmalloc fuse [last unloaded: mlx5_core]
> [   37.845437] CR2: 0000000000000000
> [   37.845778] ---[ end trace 0000000000000000 ]---
> [   37.846205] RIP: 0010:_compat_vdpa_reset+0x47/0xc0 [vhost_vdpa]
> [   37.846730] Code: c7 c7 fb 12 56 a0 4c 8d a5 b8 02 00 00 48 89 ea e8 7e b8 c4
> e0 48 8b 43 28 48 89 ee 48 c7 c7 19 13 56 a0 4c 8b ad b0 02 00 00 <48> 8b 00 49
> 8b 95 d8 00 00 00 48 8b 80 88 45 00 00 48 c1 e8 08 48
> [   37.848240] RSP: 0018:ffff8881063c3c38 EFLAGS: 00010246
> [   37.848711] RAX: 0000000000000000 RBX: ffff8881074eb800 RCX: 0000000000000000
> [   37.849319] RDX: 0000000000000000 RSI: ffff888103ab4000 RDI: ffffffffa0561319
> [   37.849924] RBP: ffff888103ab4000 R08: 00000000ffffdfff R09: 0000000000000001
> [   37.850531] R10: 0000000000000003 R11: ffff88887fecbac0 R12: ffff888103ab42b8
> [   37.851136] R13: ffff888106dbe850 R14: 0000000000000003 R15: ffff8881074ebc18
> [   37.851741] FS:  00007f02fba6ef00(0000) GS:ffff88885f8c0000(0000)
> knlGS:0000000000000000
> [   37.852464] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   37.852975] CR2: 0000000000000000 CR3: 00000001325e5003 CR4: 0000000000372ea0
> [   37.853585] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [   37.854192] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [   37.854797] note: qemu-system-x86[1727] exited with irqs disabled
>
> Looks like the patches are already in linux-next so I guess we'll need a fix for
> this.
>
To Dragos: thanks for your report, I will add your Reported-by from here.

Thanks,
-Siwei

> Thanks,
> Dragos
>
