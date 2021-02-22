Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C72E32218D
	for <lists+linux-next@lfdr.de>; Mon, 22 Feb 2021 22:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbhBVVgW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Feb 2021 16:36:22 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:49044 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbhBVVgO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 22 Feb 2021 16:36:14 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MLTC3E061728;
        Mon, 22 Feb 2021 21:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=hAFhIx2kngc/M6zNV82QnYT1XBYLOMX4rrxffDVVAI4=;
 b=X2kDivsOrrmsm4OX3pkYHsHU+uQclsTQfgv5yHUn9sM3uh3+Tym2R/+9JB4/UOQqvWfn
 mAZzLY1Zzw14FIM5urxQPUFLKVbZ2MRc+nxvP9CBa72aNxVL6QCN3d93x9oDTDb23hZd
 w9XzM5aBJB98KAdZQlieexF/jNg0fQZcodeZ7hXSM5z00yMY5tEJ+NfZmqViWDPKsE3i
 S1hPkw1dYdsn6BICH8VvLnzYb6pKFi55TzaP0zjIa/Ht/QgZ5FG57hjYAsAG1mJCRNx9
 Y1NEny1KkvtgSXZanwa1dpiEjvZXHbx+OxDmeYSXjiTO2L8daCngAOqlf4+rPvn8ecMP gQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 36tsuqw8h5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 21:35:15 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11MLU4Ix191981;
        Mon, 22 Feb 2021 21:35:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
        by userp3020.oracle.com with ESMTP id 36uc6qwbaa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 22 Feb 2021 21:35:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WDoOOJstQ9lIVPpP36PP+wTQaS2Io1P0InIxB23OugXS2fuP8PuURwIYDCOO9qcD84H2Tc0kStWo/HeOsWTwbHPLQ0UkRPWMCGX/JA9LQ2Fs6vLlj0NmGObnZ70Qq5bdJhkB74Nf85o0V3wTcXM23Fwc2UMhrmjUwaHG0svofH13ux2X1Oaxms8b/3w0hK4icRhlzob6h9QgESlIFmAD/vlBBxOUb1Q5jrtkcTTA9ku4GpBjlgpNqkLPFdBwcFW8afTuCNBqf+ts6gNwEi266jxrQyJ3H28YPZr4XL4B95afoTtaWdPR/Tbj5MteDWN5pKmkyY79kkuUoieHLgJskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bz+m45cZDaeYO9W54f7RQDYDSUfROw74PVqzpglE9bA=;
 b=WU1lQ1QuTpErfvJh3SLMPoql7x9JR0Ltzeb57ES41H/qg2LX0tNMHUyw55tjbe9CqsyNklWQ1qS+Jr9Pyl4JTjDv/+OnggAJYSnDFV21EvYVx0KMn2lJtxe07w6+hL1If1sXkrD+5RXRzZZSZq/H7pOj9JcsUQM/KEPJ9mflfrpcibJgxCLV3OO1QGXSmNgFIKhTWAW5qScxRAd9t6ryu8V8Yv/PiqF/jm/tXuUyN1lI96lb8peBf0yrufnMxjsZTYA8Hk7wIat/qCMTwOZtrRRjo9hQAm0eTRNmnWefn/Hepae5y1zld+uLOyBpa8Qa5QmJKCLkNPL0jVG1it4dPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bz+m45cZDaeYO9W54f7RQDYDSUfROw74PVqzpglE9bA=;
 b=u8LTV8tgXeksvU5sA03APNqWw5oMLAtLUvnGQtnRXpxVS227/pArqxfybzSEIR7yflZTTi9AZyI+G26c6ZHWrQDykmo+AVtXRh6xunNkfKDans3GHeAamFYjGvqAwdR2Tnr2ydgRw2rdMy2SAS6TgfY9wmt9477scM5Vct4ZLSA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3288.namprd10.prod.outlook.com (2603:10b6:a03:156::21)
 by BY5PR10MB4243.namprd10.prod.outlook.com (2603:10b6:a03:210::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 21:35:13 +0000
Received: from BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721]) by BYAPR10MB3288.namprd10.prod.outlook.com
 ([fe80::f489:4e25:63e0:c721%7]) with mapi id 15.20.3868.031; Mon, 22 Feb 2021
 21:35:13 +0000
Subject: Re: linux-next: Fixes tag needs some work in the xen-tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Juergen Gross <jgross@suse.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Xen Devel <Xen-devel@lists.xensource.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210223080357.4ebd44b0@canb.auug.org.au>
From:   Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <558e9dd4-d9ab-0579-d25b-0d5457f7918d@oracle.com>
Date:   Mon, 22 Feb 2021 16:35:08 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
In-Reply-To: <20210223080357.4ebd44b0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [138.3.200.13]
X-ClientProxiedBy: CY4PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:903:102::26) To BYAPR10MB3288.namprd10.prod.outlook.com
 (2603:10b6:a03:156::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.74.102.77] (138.3.200.13) by CY4PR16CA0016.namprd16.prod.outlook.com (2603:10b6:903:102::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 21:35:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dc62ca8-16df-4522-aaad-08d8d779bc95
X-MS-TrafficTypeDiagnostic: BY5PR10MB4243:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB4243FA6ED9C733C652DED04A8A819@BY5PR10MB4243.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:66;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C5h916aT8NawX1+y2Vg9+T1d0XNCPj8rujNoSZjKxGR4IBQoaZYj3r2D7AdU6VnExirKZIg8M1Zu7z+Z73KOzzCdDYUFq1ZzvroXjcV5PokWVIUOcHahPihAoRt/lgoMzrrLrhSKmFhiE/Zxffnfb2/yZwQ7N4Cktsm3zPJfRZLlYmQIozHUG+PZl6xwF0u03WyIH2+IvA3RMpcgTq8pjRILk/AyiguckKMqInuBEWyWgsLr93VKUkVHJp9JyWVqHV3ckDc+zIIiJJ0mfhjSHWxWco7bhy6p+nBdRETkXo0TYf0vA/GfD6IV4XGdydkC9Hs6cth2ge+AVdjGftuSkgTB+5d7cQz6yd004aIiSGklxLoEdvB8OHX4xlJhW5IJUmScMImNk0vHj0qzYItlrLbETNZ3uP13cS3HdcMNMZL3DxDUf5PEMmDQ+sk8YqSuuTrj0L3nwBMUKC40/DIYv9ttKn0hOQd+EtU54X4FDLZLNHYaYxg/DdrcaPq5psPUU7o2HutYCxz9WKvS4rpvUQ6awidc+tyFtnH7MLTiNOzQAq4iX96eiUflBt9C9WLbbXtgFbnVx2wdUEEaQExLdCNA+nfZtlu2nsSOyKd1C08=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3288.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(376002)(366004)(396003)(346002)(16526019)(6486002)(4744005)(5660300002)(110136005)(31686004)(186003)(8676002)(8936002)(53546011)(6666004)(2616005)(86362001)(956004)(26005)(66556008)(36756003)(44832011)(4326008)(316002)(478600001)(2906002)(66476007)(16576012)(31696002)(54906003)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?LzSlMxj0IUXyejHMotChIwb57qXNCFELXjOSzFNwkVS6iY7ZnZuQ/Fbx?=
 =?Windows-1252?Q?gIiY/OenAgG6Vi/OYpE40YbpaDGKZ7VLQtEaQ2IhjNdJ18p93kdi1plA?=
 =?Windows-1252?Q?3K0a4cLfelvaQYcRO/JjaldHLvL2CxgKi1SwQBU/XWZZLzv6+2fGOPHN?=
 =?Windows-1252?Q?SxHZoCPYR0P8siY7MLxls9BAKUsuyKevSQQsoxWuGl+heCHSEA7mbdHt?=
 =?Windows-1252?Q?td4yqNXSibNpxKpWyFk+oQNVRap4yHL0SjqV8oNrWZ0N0xqNJ1u0mxxN?=
 =?Windows-1252?Q?PtJAWPOReK7NDAbhIIhGmsaTzq7BBSHdkIc0OXzahd5MiTE/k+sjcjI0?=
 =?Windows-1252?Q?5wQK0R0em62+ZBs72pMeE29udfjSex0LL3DRWOQxNqHFjcOEk/JLXWCS?=
 =?Windows-1252?Q?glkB+9f8dOTneVSy1KvPAKEB37CBR0c3RanoAHg3pySMj0kIzGMbGLY5?=
 =?Windows-1252?Q?j4m2G7kfNpdVsfhDwGkV7x/DWPRLIcr06RNoBxBWpsHGOlxnu793oGFK?=
 =?Windows-1252?Q?CoE3TSRqcyzVgGyegKnBhfy6R1fOckNaICRoYYPZcjNdxsEXme3nAxUk?=
 =?Windows-1252?Q?Ff3VzkBTqzOskmCqdJbZM0KHd0cVTmXtsrB6oPBLo+kIvVTJPFstHvud?=
 =?Windows-1252?Q?AW6d9Ynlj17legbk5YDX08wIsuf0LJ/JJvLxTggygXnKjbfAcNr+rCOc?=
 =?Windows-1252?Q?8V3JQUaNbMvRsSp9rjr1dGWZzj5u26kBVACGjVg4iSJZ4rZdBE3X0PyZ?=
 =?Windows-1252?Q?oMLokdFbf7IhqkvKUqKCHeKFL19EOOwFtB0M0Emz4km7fp1+Vk7hQUEx?=
 =?Windows-1252?Q?3N/wwW3OlMy+uY5IqlgCTH+pqr+dY/oOwBv2yqH5msFCRg88zWIPtF31?=
 =?Windows-1252?Q?RmGk8YOfY5cDnLuRR8JyYiwfzt03E60XFyyU0aUWDh+pMitePiL1jaJd?=
 =?Windows-1252?Q?cuSKsn+yBhtJNwzqipJU450rF3F6kTRM7NwgG6rNfAtpM51wPD0om8zX?=
 =?Windows-1252?Q?40sIRxw+AOEJ4gqaS68Qt3iODTVLTxihnwKhhCSSDmtvpgCslqSuHt6u?=
 =?Windows-1252?Q?W/l5+acoU+xDjC9+YKHD0tr7u2c32eqkQiM10r1Nk+N1juWM37M0yQc1?=
 =?Windows-1252?Q?SXMHsDzvIlg2mDAY3xrhk5WHoJAyZ6SWCrDDLWKUuQbHjyeZsipNpeyl?=
 =?Windows-1252?Q?hk9V/ioexP4kA7mDNphlLBn54Mv5cGBSANIPQwZyx62r7fb4qKXp4FkT?=
 =?Windows-1252?Q?kr5M4YCnh+lsiU0mxBoXE+N49yIOCh91nvpVgzHHrE/j0m1VBc5ODCgA?=
 =?Windows-1252?Q?1gBxjA/oPPla+R5SZuaeQ/L8SXtrGhZDfSaKIHXnehMrFvO/kzZlf0K6?=
 =?Windows-1252?Q?cWj5xCOKHGu22urqpi2Pf6PBfRrDiUnXheY5lZk6dmiV5q5a/T/zOxqD?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc62ca8-16df-4522-aaad-08d8d779bc95
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3288.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 21:35:13.2352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QgvGvI28nNvS3043QubzBggqrAIt2nialX8RRozGAyPJu6UCbXypsDqPiUJlx75goEPgY5UOerY9wLfNg9LN6QrAd+f3AWTIPHNoNZiNunw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4243
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220187
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9903 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102220187
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


On 2/22/21 4:03 PM, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>   99bbb6e0b436 ("xen/events: don't unmask an event channel when an eoi is pending")
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


Yes, it lost quotes:


   Fixes: 54c9de89895e ("xen/events: add a new "late EOI" evtchn framework")


Thanks.

-boris

