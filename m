Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655BE3C2023
	for <lists+linux-next@lfdr.de>; Fri,  9 Jul 2021 09:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbhGIHpv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Jul 2021 03:45:51 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:15642 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230269AbhGIHpv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Jul 2021 03:45:51 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1697VtWv030716;
        Fri, 9 Jul 2021 07:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=55Z79PBDDzH8Wlg+o+3rPfMDOvPyOkf3aIg0pFkP8K4=;
 b=QDDyb3bW6mfKvrZ4fc7N6Yv92DjgEC0Tp9CcJwEomyvD31ZKVwNssKBulRT10QhQwqhu
 klj8FywnvaNZXlKXdcOEqs9ENKVfKlNzbm1ejXnORX3b6qZ6asUaOOqg8FsWlMUwvGSt
 FjCLpX1H5qWJ7K4dggRI2rXUI8Wk1ODJtUW3RWLwFoGCCEJwh6+u0mY1O9wK60/vpTyw
 bcQ/76sRvNxhKBm5HlHm2hwN7OjOlRpk3l9JB9FYll7GenRFn42Z6eTLmtuX+Fx8Gf2N
 xv6Nb9QEsCw3uly1g9Bb2tQfM/VByKZ++pujbXhee9xhfz2/mUpNkVmnsTnKfNmwtAPN 3g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 39npwbtr4s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Jul 2021 07:42:56 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1697aicp021014;
        Fri, 9 Jul 2021 07:42:55 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
        by userp3020.oracle.com with ESMTP id 39k1p35nm4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Jul 2021 07:42:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGVXA7IrJJBq3TF3tYA6wraSXMuWIhELDdwSiCFuRDo8wQqQzGfUF8TokTsCle3IbReOCjT0ymbBnsTDZsTNqHfqkUDVDFsKSMywPOiVBJD4MvY8SuVGetGijI4PnGJ6/75kuiv9OoIqw0jUyCFrxobHGrR+3rYouGokILBLM5T7tGOUeP2A/XrXLBPeMqybUTMPqLDdvjrUrKrfWEYqEXYSHa/jhxa+MhqDiOj29yTA+a3K6ebKwzVChxxXGt6NPyLM+sqlvvrEVuRem49IuS9Pv1qmE2+XPvlcbof8dySSSRF0hlYTPkWCh04RJ9OvQOMa5bYjnexa7Of/UsqNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55Z79PBDDzH8Wlg+o+3rPfMDOvPyOkf3aIg0pFkP8K4=;
 b=fbqhXb/j6R777eMhl+4UpX7vtPSyHL+JhmsdAURM9I5J+QtRBtFyWeqN+jnsVGVhrClXyg//ZHEk9QuZIiermYQD4rEnNkVE2l+vuz8koD5/cqHjyDy2DYjwKc+XyPOpPGUTtiUlX5/F17NSuPklZFw0Ddk8hCAYwlnsuJEWrDUQJy81Df+wej8p+LaeT0+aKIyGDwo0FtRvyxxlAMdJk4cn5r9kfxWei4E/qf0gbCXDRmmWfVR+/W7aLIWRB+fjgIEDGj3hnvW8Mm1WgSJnBon61myDvP+SsnUx5WJckOZzJgORMV8aZxYex+JYnXH0NDBsJwOTxg9EfiXKP2SFLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=55Z79PBDDzH8Wlg+o+3rPfMDOvPyOkf3aIg0pFkP8K4=;
 b=j3/TOkhrKtEyyFZUjtNjXWQdmGTJOm8nYDAAsLVWC3CxOUOaQbRyAXKrzK1rTCyZJciEcJl+Percb0J3O6dNnndHQOaqbuflTt3iXSYejgUAsgmyfqYFGWRd5tINSbOagaWLvncyh9pOd1NtqgahMudhwvBMY2Ky9Fm0YmcNpJM=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4691.namprd10.prod.outlook.com
 (2603:10b6:303:92::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Fri, 9 Jul
 2021 07:42:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.033; Fri, 9 Jul 2021
 07:42:52 +0000
Date:   Fri, 9 Jul 2021 10:42:34 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the amdgpu tree
Message-ID: <20210709074233.GK26672@kadam>
References: <20210709073711.38cfe6e1@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709073711.38cfe6e1@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::7)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0037.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Fri, 9 Jul 2021 07:42:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85a11a3d-c94d-4dd5-8903-08d942ad2846
X-MS-TrafficTypeDiagnostic: CO1PR10MB4691:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB469133DE8403B77D422555578E189@CO1PR10MB4691.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:23;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R1Q3j93b7xbr813E1c7uy9enZEbaEm8VFY+Izo7OH3c7BxxmUpuRzKvXeovhfvu7KFpiMWVn/NIBywN3bonS2VojQ+wNJYQuO4F+I6VqmROwftbTjZiDphd7Ap0eiGSCTWflZJgqUGXbeC7qrpP5I16CI+STukE2kSbH6Xk/YSse2SEUo1uLSyoVSkdHKAv2JfRY2FYDonwJLGNnyVomGvU4omFWiSx5SmMKDtPyusnqNs2gPPHKAVGOu5zSsCMlcRZwt0pMb3SM+7KbAhq/T40pJRiHW3Qf11W0E40UvDR0a/UvNV5tlp1NOk3JoccmXZdxih66Y2UGOJYjGdcmNvv51Y9XkBrwIKvNwQ3teHok+oVTovJ3svRjY5fg1ffscfm6Iq05eJRl2tuhTgNpRoVBv9uAtstl5qgKcYBLX2Ddv66V79AmnEXwWBPO+46ScNHNfhn16XyDcos4pzyEsmy0s0TkEmwvx6DjDIlvAz47UY0+EYXNNrpdDaIUi5Ke+IUMOFP1wOjmuaptJz6DwHhPq2YHEoi+SK8cee1veaKIKfQlwjx1g4wMdDmY4eKbQTUp0En1Gl/JMNmk4+2PcOWpLbywHQ1t6pgUvdjT9JKgvHL6wQYHgW99g14A0KuNJyofOvHVvqeGGqAHFcqHqPMLzvFXLUSinhd3ZwSYqyKRUcrffTmeKqBN8UuiB1tmRxLGm0aO5oMF7umAOz+F/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(396003)(136003)(376002)(39860400002)(66476007)(8936002)(66556008)(6666004)(26005)(316002)(4326008)(44832011)(956004)(5660300002)(54906003)(478600001)(8676002)(9576002)(6916009)(83380400001)(6496006)(86362001)(186003)(1076003)(55016002)(33656002)(2906002)(9686003)(33716001)(38350700002)(66946007)(38100700002)(52116002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?unr6hp8An9bpAsjpO9NYYKxqevFUWHr45CXi2vCxVbVYXw0BPo2lE6ELgrsx?=
 =?us-ascii?Q?Hz3vGlcs4UiDCDdkrLH5437Xlq5oLfgTQ/0tmQBNsDvw/4F/JT8nd1sbHSuA?=
 =?us-ascii?Q?tRuCnCVKlY5VEG8kS7U88kqwCowcjf/vas8wda8KyQmyJxjVqT9FVSY9Wj1z?=
 =?us-ascii?Q?ygjwv8VNC2bBUjR/MOWg6AA2PWto3TMPJ8IzCVResQV7HujXrSSYcRVB3AxW?=
 =?us-ascii?Q?e2zC1LgfTYux2oc5iRr2vTjHnYm6Kv43mbV6HiDPoSJgS86T3cOpkN82v63K?=
 =?us-ascii?Q?LbWvs7tjHiX/C1Rl+8LDelb3O6bma0hJ19q34X8U6GrZgZyAk8niUfx9Pjxi?=
 =?us-ascii?Q?/HbxMnSxZY9xORqucq0A9x5LEAZQeY+iTkPy5vpb44jEBbmdJ0pdqB8bwGDH?=
 =?us-ascii?Q?EJ8UXuYRaduPrqGvRQd6/SBTETxCUTAAcQmIt1tZUp5fjb9JDjDDgRAaqKbY?=
 =?us-ascii?Q?EPtE2sN17ktIg9+M7Pa0vGaRQkKkLLNd8bjkqdjXv/6+WSTfSIGvdclAUFi8?=
 =?us-ascii?Q?WVqUSQ7OJl7hIs/y8ANSOTrzQHgD6YQRCGWffS5kNu9KLeirggWntVm07XTq?=
 =?us-ascii?Q?3bZDfbo2CIhbz/R2C+EiltWiYQHDf0RJEKbj2/rKDXXxuf+TzEvmN0CyC0JJ?=
 =?us-ascii?Q?hZD3EuHHZg51C053Xs3bJuq7hU6ORaFjxDTYYD9q7Wxe7VdpXqIMUsLVjILf?=
 =?us-ascii?Q?U6ebbBgZ+z9L2VfBLC9ns3jbpWEX8SGzO0qdQM3qm7t9B4Z1XauMgorTiEq0?=
 =?us-ascii?Q?GVbySypa+FmWlhPUBQWr9XEwCTuMugCI8r0RKd/cFhAYnJVsW2PBhqI7tFCH?=
 =?us-ascii?Q?IHsPQBrJzJXNZsTbUI1neoUTtqEDSQCkvQf3b8p8dZM6UFL6YKG36J6aFwmM?=
 =?us-ascii?Q?sBADzpBux+vq1nE8SFARzSMAw3shMN64of8/FIscTzCsApPfwdANALMWmTYD?=
 =?us-ascii?Q?L1iv8K481GU7mwobtpgEQUvf6ZiUBYlEW4FhpCoPIlXvryA6I+rdOYEH5AIO?=
 =?us-ascii?Q?83Cxtm2mwzjo3C2kgd1sDg1RhC6BKDFdo9oU6DA57JEGspfHouixbzRMLhiJ?=
 =?us-ascii?Q?4zNe75xdhUjau9lDlUQPgos4D4OPomzaj0jXAiCAr8p2+ZiR35ogCgdQWIUh?=
 =?us-ascii?Q?hGR2YsAl4lbgC+yrdCdKwfUpkMmZ59hHpoZdQfbO+WI5ALh68L9KgfZ0oKuR?=
 =?us-ascii?Q?ObjAbsgA9jBpWml8MAjdhBxKu/7782CEDoT5NGKtuEXld/neCpEnTteb+FW3?=
 =?us-ascii?Q?yfkq/BlYW6SmafdyfgPxVPAXZf9Nmwp1ssXNddH5HKeCWm2wHWwJoXmg45TS?=
 =?us-ascii?Q?OQ9IAEauoH9xSYhATVx0QodE?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a11a3d-c94d-4dd5-8903-08d942ad2846
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 07:42:52.3531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYpQ9A4A1YBxomkXULEr7MHlY+qxB0kMD6pLfTYrcGC3ObKGRDgaPLwVBfHVJ11EVRsjGFQWpCoznft0MJWwI01P5NYwE6weC5/skQmgw/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4691
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10039 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107090037
X-Proofpoint-GUID: SZeMbd5GYq0SLhXY_T_Y6gsn5WDqZNII
X-Proofpoint-ORIG-GUID: SZeMbd5GYq0SLhXY_T_Y6gsn5WDqZNII
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 09, 2021 at 07:37:11AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   b612f5c36279 ("drm/amdgpu: unlock on error in amdgpu_ras_debugfs_table_read()")
> 
> Fixes tag
> 
>   Fixes: c65b0805e77919 (""drm/amdgpu: RAS EEPROM table is now in debugfs)
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing quotes
>     Just use
> 	git log -1 --format='Fixes: %h ("%s")'

Oops.  Sorry.  I've created a fixes.sh like you say.

#!/bin/bash

git log -1 --format='Fixes: %h ("%s")' $*

regards,
dan carpenter
