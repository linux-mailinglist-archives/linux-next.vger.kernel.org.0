Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FDB334BA9
	for <lists+linux-next@lfdr.de>; Wed, 10 Mar 2021 23:38:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbhCJWhc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Mar 2021 17:37:32 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:57416 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232631AbhCJWhP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Mar 2021 17:37:15 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12AMZ2CH171960;
        Wed, 10 Mar 2021 22:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=SdDO7eGUlLm51DyUSuEnrF6aI8acBu+OK6QZHmkOqP0=;
 b=hvmjGcgy5FKywZWHWd4kGDRJpgfbKYT5YipygUK+y/c15fyFFHqNE4WfebwOFjNdJ7ia
 NY07OOUaZCjrOp8dhT+Moe+HTZATGUc9/27IrO5AvwYbpBiGSWXV5m6xI27RLaEp74Hv
 S2Jwp84ZHkW6bwRnpGf5d+RWfp4ma6XS2G1yPDHHv4+9JOEEvH8SDNFPnjCo888wPV2/
 JS+/eaECQ1JWFYksvwyDYnR0/+GiKwllPMnuu+NuFTXm+8g5wGYBnTP26T51++r1xkQr
 BQ4GgiCUcMmAkOZNhAQaGZz5/s4gXR/YFLNShbgd0X2aIpwhIH6V6Exyq8FKJfG0p0q5 qQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 37415rcqej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Mar 2021 22:36:53 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12AMZ9fN007074;
        Wed, 10 Mar 2021 22:36:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
        by userp3020.oracle.com with ESMTP id 374kgu0y5v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 10 Mar 2021 22:36:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCmJaF7z6nXh7CLBQ7HX20dZadt3AAAb1f09jErjnu11nRMF4o/CHVC8If6tdInPPmsKuqB1k5xUXgxvtFlEo53J/7dvzT1jTTY7BqfkU+T8v7NfZUIkCS5TeyWAsk4x66G2bE8bKCB5Eai5KzcqKFwcdLWZpigfoJYtxKaj+5edPzg9vdTStjpKtIv2u7Wv5qGOqtpOBaXpQWdRESfRFg2OjBMAHSDT+t/P0y+jK7LYv0MwJMOyQ/XPuvywCQzWDevOD2sA9FdhGeRcSnxJ6CfCZXJFFZo2JmLDzAfUeKlv5aqAnvVek7pNTD6UDnuW1yDdAhmOjNX8tm7wpbqzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwVhe/E1KCEm06qgfHg2PdgCXKw8lis8HOAS15VCqt8=;
 b=NCGwiX+eno2FSqqtXOHfkUBWYLjLjZlPTOFYGYD8kcc/IIxTKSdns7xu7D0j2cLpv/VLZc+po88FchWzHZUGqqbCCcDyNw9uZu8FljD+2y/iStXedwCz8mIIVuVBPmcOcwZdKHqUlS0yjc1Pw1rRRnPBDRpCRg8LnhST7w35bBqOR3xUbSmvaQtCeXKCaJvZyj0wTVkEyHVynd2fFIhScW4AG38D+bhw8SkWxL+xhSRrZxSAdiaHJ1d4mYRqYIRLWIhimAMpR/6mTjTq9GQo2pc8LuuzhvtqMC6KWA3J5mmwM1RnR5z6EM1hhThJzqu6x4FUaOYV2+AdQByBQmMBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwVhe/E1KCEm06qgfHg2PdgCXKw8lis8HOAS15VCqt8=;
 b=DV2jk/+HK+Hl/lQZZWgbX7lXE9NjyOYKD8z0RP7+Zy9eIXOuETiCqYy8BDOaeIishUndFtmwF3jjsBbOOFa9r6js3Bs2vznVIgfOl/P7MNpBuRaLgHGE3MyjPxyHzstZSsOD0r+iUhuxOn7t/LWvz/ngh8iWlZoEnm69DXy4/R8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by SJ0PR10MB4480.namprd10.prod.outlook.com (2603:10b6:a03:2d7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 10 Mar
 2021 22:36:50 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3912.027; Wed, 10 Mar 2021
 22:36:50 +0000
Subject: Re: linux-next: Fixes tag needs some work in the xen-tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Juergen Gross <jgross@suse.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xen Devel <Xen-devel@lists.xensource.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210311082354.0f149e1c@canb.auug.org.au>
From:   Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <0577a59f-cf6f-cb26-8898-311e70b93593@oracle.com>
Date:   Wed, 10 Mar 2021 17:36:38 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <20210311082354.0f149e1c@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.45]
X-ClientProxiedBy: CY4PR14CA0038.namprd14.prod.outlook.com
 (2603:10b6:903:101::24) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.74.86.173] (138.3.200.45) by CY4PR14CA0038.namprd14.prod.outlook.com (2603:10b6:903:101::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 22:36:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39d10ac0-9601-4c40-16c4-08d8e414feea
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4480:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4480398CDC5D6380872212448A919@SJ0PR10MB4480.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKtdJYLjPM9yb8ItgmXUr/tHQLXQNGRdl0R1FBrElBcHU5j1q1wTDIqDOxFjw4yKVYUsVq1hPkz3NuDYldk5n1mP13amQ6ahl1tWQdM2rWWd1hALLNlbMDFWO4E3DN2V5KTGIfhOYmA3Xba//roGF+Hatd8nCq1A8Q6hf8Zfol8Gfx6juVIY9gmZsr9xn8kj6wymXf1OeWiqPJOONYjx6gNvwB1ENCFX/amPYEUq6mMKqt7eknqc6matRqh/cUXTaGEEupncAsSw9ZmeypRMaPggMxiTW8bXJyO8wAIn22cfYJJFNf+zKB2zXA/UM0uxYw4ZZrYZTxxwVfBGq+VF+xE+SVdEOGPI1fp+FGc9tZQWIJvWVAkAU8jlP5zgWYehlwThwfC6LMepXom/zagJytKtYg5OJMUCZdE+7IWXPocp01vok7zRyvarodEUYMOpgQlF+WwMz2O1W45ZJYEiydx0isaFEFv3MpFHFvmcEI9m8lt+BTFYDdD5oGPZdk/p9QOkKqTrkFcQnLcRVlGu/ixRPdBrYYmCQY0JO/2vjMOHrCkmA2kTs57SHzSmr9QqZJ8oi6CfHAKOrSB3TSl55u92KiQBdI6wa02ONOgRmTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(376002)(136003)(346002)(66556008)(26005)(66476007)(316002)(83380400001)(2906002)(4326008)(36756003)(66946007)(53546011)(31696002)(186003)(86362001)(16526019)(6486002)(5660300002)(478600001)(2616005)(31686004)(4744005)(8676002)(8936002)(16576012)(110136005)(54906003)(6666004)(956004)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?75wMXsxLpvs1i++uXu5wsjMWKWWfpo3CTJcgrkEkKzAqIk6LrgfBzeEx?=
 =?Windows-1252?Q?hgYnGUlnbLBDdpC/goFHn45iFQ0Ylcgk2GxYJf28G10erNBwsiWuTJua?=
 =?Windows-1252?Q?PXBqYQguqvESiQ04F8+aBhWhSsKZUqyV24eCwPaXYe5ZxSXm/o+Y4PEz?=
 =?Windows-1252?Q?YibaxYTpT+1Gl8COWVlvBlOuKM3//S1bByUTuzENdh5o5b7S/IU4X+Vm?=
 =?Windows-1252?Q?ltAz3VohXIqWgFtg/8JxIE0J7zAg4B29lnIcmHW2rbO1AroRfC299756?=
 =?Windows-1252?Q?oo4ibMGXTnhsIhw0fp7mof3NAmOuLPflU3VB4ns1VsYOkBzz8Z9Tm/tb?=
 =?Windows-1252?Q?I1ATk6CvzDkxvyu3HhiYfMOUuL8v/JHst6jSCmdM0WaxXCUPz+UoxCcq?=
 =?Windows-1252?Q?ZUkY8RL0fVZuCrH10iD/KG67DbUMzAHmbLT4QSIa3DW6UXqbCIpfdhoB?=
 =?Windows-1252?Q?JsK8eLcm2i5pI1s3dntP1TvVmpdLK5pMsEnPVkm/h2CTdeh0826Iho91?=
 =?Windows-1252?Q?qc7jFvTyocdSEsf6gqGf7+rbW0RYcbK3k4LOdbD4avxWoh2bEP8AAL8+?=
 =?Windows-1252?Q?4UFOi4jCk0pMr295YudLVv0g/O5G+Xjx8seMgIf40M20Jeht4WJbf/4v?=
 =?Windows-1252?Q?erFUrk8+qw5JDJWrrM5Zmwuu77jwZdJa2yLqXTG3HIe4bEIJ2Hmzjx0Q?=
 =?Windows-1252?Q?2iURyEMtWfTzPDBigI8FkLciaT4iuvx1wSeFbWs2TiseMK9WTrvaStnL?=
 =?Windows-1252?Q?QsEuwoG5X6PCTtoaqpDiGjgq1h+06RvdMdmfd1gCL3/k8nZya9FvoWD1?=
 =?Windows-1252?Q?g0oEqtWjxJ+Dc/hwOWQqzaFVaIA5dhgag1KuSuBKdT8gHw9cnEIUMA5b?=
 =?Windows-1252?Q?+RP1umtsvlEebMqCVZzobUA9UbhVepBtJlVoMSqLkg4ksSs8q268YYDm?=
 =?Windows-1252?Q?Iy27XEaKg5pItirwUeRjVcz1zu42ZyMgaP3ErUrsmeJSj5MVQf2BlAVJ?=
 =?Windows-1252?Q?19eEFhLIr+KT+K5gCcSLFJWS2/TCHVAynhm5VGepFUKiS/ShD9/g2fa4?=
 =?Windows-1252?Q?LDU6vKc2JkkOaHSiAbKsunv93iC/fdiDrarwUYmWmQ3rYiQHpGigheu5?=
 =?Windows-1252?Q?dI7dykuKap17VeUN4d7ysdMrIMlPZdJNJC2Vq+0gsgEEhO0KXKPLpB3F?=
 =?Windows-1252?Q?hfhrYdOfx85SrUFh4ifcBfKjPyMNflCHrCVywhfiGDZZjMYvUmevmKQE?=
 =?Windows-1252?Q?bYjEMO08Gl06DoJqV4HT1boc1kZrtxjigR8W/tkLgSV6rACQQlr0uIt8?=
 =?Windows-1252?Q?bR6Ads30Bdac4AcrvFd+qbcu1+3X0M82XCShUl5iChqkEkChg/UeY+Jf?=
 =?Windows-1252?Q?wn5VYaMMcMDC94I8k7tS0u9T5oMWYz+HwoR0UA6rc0l3w0uDgO3/hAbH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d10ac0-9601-4c40-16c4-08d8e414feea
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 22:36:50.2336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QDucL0P8vhKlIe49IQ6vrL/tX64tYVXCY/frc5WjQyZWLVjXzoe14cOa9hcMUKXUKEqKkUFDttIEilRnJ1t+n1FMhFHTtEaek+UtBeJccw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4480
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9919 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103100109
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9919 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103100109
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 3/10/21 4:23 PM, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>   1103e2826a9f ("xen/events: don't unmask an event channel when an eoi is pending")
>
> Fixes tag
>
>   Fixes: 54c9de89895e0a36047 ("xen/events: add a new late EOI evtchn framework")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'


Sigh... Missed this again. Updated to


   Fixes: 54c9de89895e ("xen/events: add a new "late EOI" evtchn framework")


-boris


