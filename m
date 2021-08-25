Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D3B3F6D7C
	for <lists+linux-next@lfdr.de>; Wed, 25 Aug 2021 04:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238021AbhHYCqO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 22:46:14 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12526 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237739AbhHYCqN (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Aug 2021 22:46:13 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 17ONrlWA030422;
        Wed, 25 Aug 2021 02:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2021-07-09;
 bh=C+PZH6b4poOjOTWuqwf+dWfgCHD1bRyr+U9S4AAf+dI=;
 b=mXJ+tgFpn+PAgnuZnXQaGy32bD3oxDukJdO9DjW43ZbDNYo0I+Id0AviT/dRCGWAWfsc
 EK8nUHBt/paA/bVJG5leDOnAWFZea+btgNtZF5qkLSsuSA/XBqQITBXEEOFS5g2eDVT6
 uk7UgZr+I6mPgRphhRTOY+ehe8Y6H68pV4QvAMWMhuDrZMzbU0L6Bg1P5J5ucermZmoM
 9pp51R0/LuKI8QK8K4+5UQIuRIaAKb8IuuMEpHEzz5yf4xJfSLPu3uyRfVvpTOdHq//Y
 znULHvb3E2qMW0t9+Ky2LFDqpDCSU9jNe0lQQA9moMXH5nEt2stRMtK/LeEFT8/7pryc 2w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : message-id : references : date : in-reply-to : content-type :
 mime-version; s=corp-2020-01-29;
 bh=C+PZH6b4poOjOTWuqwf+dWfgCHD1bRyr+U9S4AAf+dI=;
 b=APxbBRlv8e8pkt4H2PTREO4JhGlOcMV1OFBztFPsPM4SY/3rFQ3dZBqBUQpfO+4xUnE6
 1QnVA3Ue/1SVJTZbiga7yWF12v2QNzKphsgy1dWOfG4cLwDGMYNvmbyY/H73T05ufzw3
 2FSfEwGPSPXW8tx6RYPmbtSAqyEJMVDeN3b4m1DVNZc3pjHxbk5g6V0UXMomDaQyHk/D
 q08RhFmk5jYTWbhWbeequXr7ixoCje/bIfroiau+OEW6Bd2liltpl/b0Xk0eARGvuofj
 8mKjen92k52ZXSMVSan1CaT2CEQQeX8mfejRXHhrSVzp38IndtaqvjVXDYHqbg2qvhX1 KQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3amv67agsk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Aug 2021 02:45:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17P2fZJj042293;
        Wed, 25 Aug 2021 02:45:11 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
        by userp3030.oracle.com with ESMTP id 3ajpkyeqcg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Aug 2021 02:45:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IS4Q5E1X+ebKKNTKL9kUkYKNKjFoWdh5pX0tfKiw0r42J6iFIPvXN9wsI76qya93XGGUJmfLdcq3SBluZf/JXMPchEMF7Z+/2Jofp5RHGn+41ZuFN1VoXi+ctI+uj4L61LWjbxcao7d9gUH/caecPwVXnLLKs2Cr3ZNJW2EaGT1M3hXdpunrAQkgRILOyym8u92yaOuy8teHy+xlOdZ/qxV13+CqnOuDWOckP1E3WgGjUZl+svDsyY/78TK0a1fLkUi6HrN27XkyfACTI/SCrEoHPfP0AJURexOGuUoRXClQxgkhvZdeA3OtxuBWkd2lVjAnTyU5ZgUH0m4VXV6Lkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+PZH6b4poOjOTWuqwf+dWfgCHD1bRyr+U9S4AAf+dI=;
 b=FOOoib9nIvRNZbcfaM1Q30PC795DmvJLfN7HSQJT8b7gzEaUbchf8/DduNtGPFnFPyrLAC5sMsGcf5oHGkYp2W8crEhxfJoGXvvAA8JT+sIiaXu+ktlUWfLn3YhiaUrvXTqA2zF5EwiM6ngZ18mW+Gx7QZrNAVa0VzmN7G0urc9Yd5ql248AyRfzbkjqT4XKWuNpdVY4D9PumDC7WvNKXXO0uodyfltkJwL9SwM5BFlV2g7ymyZypQDVIekdpWhjpFTktKusf0+vYxF3GJ6cx4JYAdLTQ64iGxsEA9gQfXVKnKJha1VGnbTWe94T55uohHZEXgXk846uuwJ3kTitRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+PZH6b4poOjOTWuqwf+dWfgCHD1bRyr+U9S4AAf+dI=;
 b=rRhONw2kW2IPowWFuPFoYJKPGuCYmOTwfdFCJQZE+wdMBVq/ok1seHFo6VBpYY3ujOfGjXVdl8Z1KHLT5itQgBDrQc3ye3lmCU2E6FfwCls+ehX1H1Io6yEvfStS+kO/AyHimO5xn6XOlAAdfFahXmTf1TGg1wiuWTI1719jrMQ=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=oracle.com;
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by PH0PR10MB4552.namprd10.prod.outlook.com (2603:10b6:510:42::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 02:45:07 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::c0ed:36a0:7bc8:f2dc%7]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 02:45:07 +0000
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Martin K. Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the scsi-mkp tree
From:   "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1y28qb6c1.fsf@ca-mkp.ca.oracle.com>
References: <20210824163435.429d389a@canb.auug.org.au>
Date:   Tue, 24 Aug 2021 22:45:04 -0400
In-Reply-To: <20210824163435.429d389a@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 24 Aug 2021 16:34:35 +1000")
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0180.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::35) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ca-mkp.ca.oracle.com (138.3.200.58) by SA0PR11CA0180.namprd11.prod.outlook.com (2603:10b6:806:1bb::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 02:45:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63ae3ab1-25d3-4209-f17a-08d96772595c
X-MS-TrafficTypeDiagnostic: PH0PR10MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR10MB45520AF8D7FBF3660FEDD9328EC69@PH0PR10MB4552.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PTYECeOkSKQTBqz27So9e68YDxNvtMwg6fqd1NYgrtLzkfgmaquYqcPfEm8h6P/sYuwRjeAB6wyRmWt2LWmpIIEhsoeYctFkyqj5LaJaj+dVmgpSLQ5ZR25X85WqbeV60MSkz2Ire8oJIWAkqiEg0n8d3vubPjO1lNBJ4rCbW3PzBLgtjWAXLTtqJKBkl82wVbDXAi+4doGiXk/Rxd4c90bGYHaIRMYLZSCgFNdP4fQgZN+BShlx8PDNIqga7KbEFDgeDUfg4uxWvuDp5j7tmSDN8urTvA1quq2Gnd/g+m4pwe/H9F6BCe4LkF1v9Ll6J2Prs42gE2+nm0ofQyEfnf0zp3YcvB8KN/ZxdLhZ2PwxAFy8qsUmVhE7JuCuEL0Dmuq7p4ydx6mJtRcSPkGF+UR4E7uS80BRAkcVZkz+OU4udoePbeOUe3vgOQbmHn3mIcfai1MNSrjE8xM1xgUKa1MLeV0TiaR8HlGh/KCOytGFRxwWhkp21jjnscjjGcF/CbieqYJol66LYg3XKNaMjWQ7OSF6CBJ6vwldpdj7I4FdWuwpAhfsmiWrtTJImKTighpVpJ9T2MKi1oP4KWyznLY6s+xpylxicjU46yvCtUN9XGOH+xp9DqIQPR45y8Z9AdqwjtWIjxAhIoUqQcysujcvIbFmy4XNUb/zu20YKUSsmlAgcNmEcqRJZR3AaqdGjk1ryXIvLe0VTA0/AuRmqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(396003)(136003)(376002)(346002)(66556008)(478600001)(5660300002)(55016002)(86362001)(66476007)(66946007)(186003)(4326008)(26005)(558084003)(956004)(8936002)(54906003)(2906002)(36916002)(52116002)(7696005)(6916009)(8676002)(38350700002)(38100700002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MRtIJNpVcHN8VaeJzzPjz7lyyDrTKquqMxJXPC1JPZxcVgTNNEQZa6psnyWv?=
 =?us-ascii?Q?Z6DLWJK4L3A/zDygazbzB7nLBdeXzv45HP4FgKRj5ytwUPbyOoCHUj4BQSHM?=
 =?us-ascii?Q?b7nPfTLpNRBxAyHmzC0vVmCz0fg2+6ZZPc6bEyNqHh2f0dEizD0BkmmZmENy?=
 =?us-ascii?Q?RFTokXW3jsDYSg3tuUPQrCF+UVd8HUnaSvBgJxjmp65FlsspsY5f4zrR2ODC?=
 =?us-ascii?Q?P5+4bXcD/H76NG/MwmxzUleG1I7qfwHzRVKgJ0oMZCCoWse0qI++T+ZXb/ST?=
 =?us-ascii?Q?Dh27CND/rlRYefjKnec8d+KnVEIimfyY8FANi7dr1dM+Th3SdsfA15Ni4eGN?=
 =?us-ascii?Q?J7CB1SfAR2DrYls7Kzg7Se7DKsbZKKeEXk4gbgVsT47+BpciQSCuwsx1r4hV?=
 =?us-ascii?Q?ubfiYH84KxkAUWmNVe34mhhEbyBgLQE2rusyh2ZJ6+++PXcQyZTApJPxAg5O?=
 =?us-ascii?Q?JX6yhipGI6arMncUTPoXYuAfFPmAME98NwCsanWhcf3lEsrkWc1bhPRKKz+x?=
 =?us-ascii?Q?5fHBxy1B2ccfnZShpWmp3LJ4gYqhveXB1FQ+ULv31WGIMG9Xp2sdUMdhZoxS?=
 =?us-ascii?Q?LQ9FjnqUGqIMw2KpdBko9ECsXv1RjFfFC2Kg+gsSC1gi/aThwCjzKK+DyNbc?=
 =?us-ascii?Q?oEgliwC7HTox+71wM0kiviXU4buFHaGhyibfrLHomsfJ9VB9H8T9imSQT2TT?=
 =?us-ascii?Q?e4PsNgp15fO4KSqcD6gBaU/aFHxmti36ZP01TKfrK3J7B4VEIJ5mQhSg+G2n?=
 =?us-ascii?Q?zGZb42k6CCoALlnfbYnkIM7/QF20nnqQu6/BhCv6zYb1EUvJRUA+6UoMXelW?=
 =?us-ascii?Q?otCBUUWc9UD91fMR8Mve1ygOh/0JrCR+8tNom4y88Y+PbR0szDzWoGsEbTB/?=
 =?us-ascii?Q?kWtieNBUSY2/dt54cYP5141ig7kREv0jnocCzL/0I1HG8cuI35AQkzJPnjI1?=
 =?us-ascii?Q?e/5v26nPAXY1fjChuTOBksu6YrgL74j6m9AQsQ90UXEpQCiCgPLT//5Rw+v1?=
 =?us-ascii?Q?uqyzZPaacav0YVWmbspM15EHQF8o18Ryp5Biz9PNJwcId/yG0xHMU4ELxpj5?=
 =?us-ascii?Q?87QvlFU8UnsB6qEpu7zmb0DKI15uKBFx/d7PRGEpfpev7aQJRuRbnEN+LEek?=
 =?us-ascii?Q?W/LLQgYvTa9eoqkkkOooYg99N8oruF3ilURWJluwkbHA2ShHWddXguocZBMJ?=
 =?us-ascii?Q?LvoVLd6I4sVYo5KKCSLV8sMZaAUoHQe0LLckOyyt1Lgv6WCi5aKO7yL1IxXs?=
 =?us-ascii?Q?xrlFh+trqf/66RVozIi85nzLL7Qxt/44hbfRgrsc2juUeON61wiT2zMs5sD9?=
 =?us-ascii?Q?u230WJF4H3mLJzn8vOdt4aIv?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ae3ab1-25d3-4209-f17a-08d96772595c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 02:45:07.4942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o70fYf3tS5tBntO8WBXUQWql1lFDTpPxBUw0cfAwCmiE97Q2ujBGytejDI7KuRQXqvCbGUBnD+UjFRtJ1iEdwy8k7+IhIsrDdM6nfe90Gkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4552
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10086 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250014
X-Proofpoint-ORIG-GUID: HBo_1sVWreYSOyXfIEBoOoGcWIcApZuM
X-Proofpoint-GUID: HBo_1sVWreYSOyXfIEBoOoGcWIcApZuM
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


Stephen,

>   Fixes: 55f4b1f73631: "scsi: ufs: ufs-exynos: Add UFS host support for Exynos SoCs"

My validation hook didn't catch this, the regex wasn't expecting a ':'
trailing the [[:xdigit:]]+.

Tweaked my script and fixed the tag.

Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
