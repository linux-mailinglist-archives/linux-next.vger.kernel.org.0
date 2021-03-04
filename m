Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E3F32DD0B
	for <lists+linux-next@lfdr.de>; Thu,  4 Mar 2021 23:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhCDWbh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 4 Mar 2021 17:31:37 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:55484 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbhCDWbh (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 4 Mar 2021 17:31:37 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 124MTqhi159591;
        Thu, 4 Mar 2021 22:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=kjqzqw9nggN0SuYNXMzPyv/ychG1swG1wT1YCqxkZlE=;
 b=oDSrXk0Vx3I+VtH+lDniyB9AloOfyzsPqPvJR6K0zyH7VIOCK7IFWLTVnkzOAjx1j2Fw
 b3RbDJo5wNTLyXRgwKOorgND7SCYmip1IOJrpM9ezTPOg5DBwVq77uvUHJaqSaVeJTtl
 0kY9GTJEov1i2V5OZpUqWUNWp5tPf+BD5gTuSjEaXbX6q9QdfLn6mDlRtdVEIAicLq+h
 8NbJWrp+p5X1xRrGxfdCwmA4I/90ITny2zksR0iinMEPmTKlzzv/7LOicvcyv+wF/5Wo
 HpSI/nUpgfk1mvPg5FZY9225KeC3TEqxWGocdlJZrsk3uyn4MnSh49CguvrdndlbUSyv 1g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2130.oracle.com with ESMTP id 36ybkbgtbp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Mar 2021 22:31:27 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 124MUhfe065850;
        Thu, 4 Mar 2021 22:31:26 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
        by userp3020.oracle.com with ESMTP id 36yyuvf1sx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Mar 2021 22:31:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Un2HCOEMyx3CxYzPUF2iAwN94bD2ChlrNww2ngZcia/pN0goNRumqX0oJlcysDmObNhohWUzIxEC6/q47tWfOjQ8Ugirxe9KR1E/erf32gVgSVq4QZxscL4yrQTtxTWZ0tFYWV2LDXQymvjAnB3iMlKDPVmJrOFeP1mt/AfcIJFr8p5OBMs1xNFNdqY1SfNFKVEpiKNSV/ob48Usb/dljCydLUl/Hfm/PY6d+lVFVLCdJRZpL7SVRa+HkpuWwEqYtaFkTTeAVOxyPzobGmgXHK/46zXQVJ7kqQmmZHren5LDwhEd0/lEj3epUoBU4EyxYAJw7AUKXMTQnshPDwEkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjqzqw9nggN0SuYNXMzPyv/ychG1swG1wT1YCqxkZlE=;
 b=T+XMPviyzbGvhWNZZy83PhOE7KPjVBf0Js13rCu3sHAmpqgHppyZ9xiyXgXeGbWDBE0YCt/TICVUbb3Gad+nOEYwnniLH/XCMD2tNaM1c1KPYcisTuqUGTXAGvT7LjLDrcj/J0zUM2r8Tc1z4KaismWOYGkMFtgGNh4N4+yu1z1lh3V4OFODNpyYW8Hg1r7pZyjz4ru4zFLVA4/PQ5E0J7z8NJkSVyhd6nWdxneZ4gts01ZOwes8vX6Zy/mpyw1ZC24VgdpHNKhXxGaHxlb48egMav/a4dAvZkWsAeZCxUBvkA6N8vZx4AwlNt3VSlyE+b4lmXLFbEm5RXylApVsmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjqzqw9nggN0SuYNXMzPyv/ychG1swG1wT1YCqxkZlE=;
 b=COMdUmzlwYWJL71wgHF8zWxLp+lPufKpRRm9umIUSNbdf58JXV65Jv8scmW1c3nYIqaDHk/bXL8leaw0+TqLcwP5K6OeBPNcCxPIh2sv3fl9SlVHBVj+swlSCY7BeBEwMfgYsAzdLmKNWYS83UeSyrinSNllWxpnboXoo5wMeJY=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=oracle.com;
Received: from SA2PR10MB4763.namprd10.prod.outlook.com (2603:10b6:806:117::19)
 by SA2PR10MB4412.namprd10.prod.outlook.com (2603:10b6:806:117::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 22:31:24 +0000
Received: from SA2PR10MB4763.namprd10.prod.outlook.com
 ([fe80::598b:b287:3660:f32b]) by SA2PR10MB4763.namprd10.prod.outlook.com
 ([fe80::598b:b287:3660:f32b%4]) with mapi id 15.20.3890.030; Thu, 4 Mar 2021
 22:31:24 +0000
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Tyrel Datwyler <tyreld@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the scsi-fixes tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1blbyftf8.fsf@ca-mkp.ca.oracle.com>
References: <20210305081233.6b8ad732@canb.auug.org.au>
Date:   Thu, 04 Mar 2021 17:31:20 -0500
In-Reply-To: <20210305081233.6b8ad732@canb.auug.org.au> (Stephen Rothwell's
        message of "Fri, 5 Mar 2021 08:12:33 +1100")
Content-Type: text/plain
X-Originating-IP: [138.3.200.58]
X-ClientProxiedBy: CY4PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:903:c6::24) To SA2PR10MB4763.namprd10.prod.outlook.com
 (2603:10b6:806:117::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by CY4PR04CA0038.namprd04.prod.outlook.com (2603:10b6:903:c6::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 22:31:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9631cfa0-2631-4773-ad20-08d8df5d3dff
X-MS-TrafficTypeDiagnostic: SA2PR10MB4412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR10MB441290FE7A55F0726CDA3B878E979@SA2PR10MB4412.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:883;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LwQ9kVmD/gWcAELGJVgMxqrn8IRn8ucWKgUJjqACv47GlQ01Hb4qYTwt5SexH/u3o1/nBUrFpx+KiAv1MLLLGTPWjiLkYo8x7q8pkJQgPPdHKLJ6d3uAsJ1eGsE7Ebk3CYra8BuwV9ZOh6ByDWjnAxEIjOz9ExpGg8qJ8DoN7mbTlT/U6au8nuwThTpY2z2xz94vdvIYKDERLBEMjFnbQZCM2NUKvGARWBUf7JJsK/ATnvO/eV/ywglkk7lTrkcavrQrWnixAi1TBhI2OIvESWZUVzPnsL+I03guSOw68VCt1aRUaW02OorcVftTn55e+NRJEjE9PMHrG5Exr1cb47EPkCTSYG+1kchMbKOPv54ZtQha6dFPgcpgX1RmIrnLcRDEUBEDoSVd9oo12/p2utV79rg54CWzcSmTO+H+GANm4irSQgcXnFpuf8xx4Rq5IPd/sdj3DY8XeNP4K5OKPS31odJjC1aEj3w+W0eA0AtSsg7/nSBRM/uU8TfpbbyknplaeyNnj7xNnqXgBHdhrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR10MB4763.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(376002)(346002)(39860400002)(366004)(7696005)(8936002)(16526019)(316002)(478600001)(5660300002)(36916002)(956004)(86362001)(55016002)(558084003)(186003)(66556008)(6916009)(66476007)(8676002)(54906003)(4326008)(52116002)(66946007)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cn+626t0HXgrFunTKuSje6Viof8XXfyfZcQyL8dXZ69u2bAWLkVR7PjGtl9B?=
 =?us-ascii?Q?iquBDUPIkr0CWo3AACpDMQy2lHIJNrqQDZkCRVUH7fVHD54oZFkJ+m/QbsZr?=
 =?us-ascii?Q?CQjd0Jd9QwF4CW2UsLi/fqKnUpN4qX6Hc7KYQmYx9ZdbkfnW8KeEpa2lx6uI?=
 =?us-ascii?Q?RBW4mTVBnaHyBaXrOqvhf4fPHP9vKpKGSoHo/35N0wzMS5zbpMfNvyztTacd?=
 =?us-ascii?Q?NoNTfMVHfxJM1iLkNzCIMrzg0BwyAdh4uLBo+qo/ZPlWCS8gHqeSrIR4Vx6G?=
 =?us-ascii?Q?l2tfUnPZNznBsOYBji/Qu77C24BUE1jXskIvenVZ2r8lXbirKBZtQiPy1lxU?=
 =?us-ascii?Q?i1dOe6eoDSJmB+sMrQAP4G242jRqHesq2wEkPLDOunx4XiNzdXtrOQMQ2KKZ?=
 =?us-ascii?Q?uGYXgqF0d++ggCmwegU8Ym8Sp3pNHbR8SMjbzbl4COaKB01zItaJXmLhAlyI?=
 =?us-ascii?Q?8/NWiiO77fIirfckAwb6WHRAvLVMFmDrXb2oz+8G1TH9zhcRAkw/uPXuOxTv?=
 =?us-ascii?Q?Z4InOK8vuUcCo29BUjSWBFi6cSHF5+e12d5EUnApIaeRNsl9vhxaibAoHwwn?=
 =?us-ascii?Q?/kW+exxztPOtv3J1UdX8B9DFGlzTj5g36rO2i/9T2eDRof09wCW+6eA/UG8+?=
 =?us-ascii?Q?inmvumBXtwy2xYHO7R+CisivBfHR7WyZyOa2W1aDrpG5OOjK8AbVxnJxMhxh?=
 =?us-ascii?Q?KotEjB2uNoIWpGifX2LeOr/5IrARI9I0XH6oFst15YxQ+X8ii5GKYJZPms6a?=
 =?us-ascii?Q?zoz++4TBhL9dzLCU4mEuKj9sF3YXU7ad+2OQdDaRI8H2zsV3Eqf4llrdPJ3z?=
 =?us-ascii?Q?FY9p3tpPVv4CPGvG6En/f/qLDZwoSzxKZ5JkO2hjJ0cyOKKLaE+59xgPkp87?=
 =?us-ascii?Q?EZEZETEgQSrCF7iEK2HdVFjnDBvP1XiIup30JI3RQxkSBLQ5lnxV0CBjTG57?=
 =?us-ascii?Q?zaH6kA2VedFWBFP6CUERWg3K2Zd8v8JohKpYRXjGGR/yKFLpiiRSowf6g502?=
 =?us-ascii?Q?pyty7bVJbXyHQn+lISHSzAtk5xLYJGp05HrCVHDOewjhxmaCo5Ecp2yAjo9j?=
 =?us-ascii?Q?AC67fLWCIo5w/gtFeS68G+WnA8sPo7dqKUP6WJRq+DhenwmCivZ7ZaHHvB4S?=
 =?us-ascii?Q?D7Ulrf/8LcLrXrmQbj87uahZEWWsDIX4kbVz2VZvOPru1ElBjga6JAz+M3ao?=
 =?us-ascii?Q?gwyE282Iw85G7shlCumYtnA63LECIS14A6z8TFRvjiNHw1Ov35YPTrpkpe8m?=
 =?us-ascii?Q?R8FtiLYiXQ4bx2R8CKwqhiJoJ0Yzg4uEzT9J6loBo4gPM7CBfuDuNGuNxp3q?=
 =?us-ascii?Q?2bfEStzUJJHCjo3BuwaY8MMh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9631cfa0-2631-4773-ad20-08d8df5d3dff
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4763.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 22:31:23.9487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcHtFr0wKksFf9hS0d9NJgfXUckaAAshFX1qtIyvaL9gEZRoPjyPCvqyj6QqjWmHQfbGZ5BfETzmX4RIq4JoSOx28v6bvpxiiIJd50eirOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4412
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103040111
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040111
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

>   - Subject does not match target commit subject

Fun. I actually have a check for this in my validation script but for
some reason lost in the mists of time it was commented out. Reinstated.

I fixed the tags up.

-- 
Martin K. Petersen	Oracle Linux Engineering
