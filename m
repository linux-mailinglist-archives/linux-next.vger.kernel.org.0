Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC36042714F
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 21:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbhJHTTU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 15:19:20 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:27314 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231342AbhJHTTU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 15:19:20 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 198IZcKE001315;
        Fri, 8 Oct 2021 19:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=lxvLKyFw2c5cr7vCvNx4noLzzLLaZBTaYPhtk0CGnz0=;
 b=bQBgZb2I1vEn9EHv06ORAQfKNGLY2h+EjAVoOw8Wu/ax02ncW2ahhIRbMc+TgVb0EYZ3
 P/v2srJWTj2bUZnXLp1rNuiNx0k/s7wMWGnhlFqIvEZUzdHTONg85v2Xo4ONJce/Ijaj
 OhkCLl2Bwq1bSjBcMAYngJaUNen4+hdtGqf2sD0Vhc1g+P3GdE+GD8g8YHvT4w2Q9iJ5
 91PnJkSa3XiXh6Q730YjlFBwXBuKDS8FVJpx93LJUvtEPO8tN1y/cuD53NivC10ykwzv
 cYyR8HKrIGEbyFRR/7Too8AbgL3OWZZyzJX468Beb71kNkMUvARfNC40Cl/D0Q7mVXtV 5Q== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bj1ecss18-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 Oct 2021 19:16:51 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 198JGAJw164855;
        Fri, 8 Oct 2021 19:16:50 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
        by aserp3030.oracle.com with ESMTP id 3bev7ydh2y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 08 Oct 2021 19:16:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTw5s9Hk4oM//QFPQiG+xduKvzMiUnjs4WU/IYU+Wqh74y/HQLbB1C7Vgxc87QRU3GzUlST1xYvSVJe9fefSrMFb3lgRyC8tw+RH26xkqy39qCX7evCMSCfwJIr6zxjZuJLI1Ibib+6Vwhep+skM+qzSFOOmtyWKSs1KDyosKTF/2qfyNOCPTqFE72d4OC3PWfUsOtrNxBe7XCRbVuHm0TuRZ/RJksKuPobxYSmQhwiTY74TL2FlHdCS2rwRzOPtczSIPNDDJXbZu7SlqJyhHtxcdrzGiodJUPXqj5qY2KabCzN3o0nH7+k21UxG/cW8t/8PuQtcNUK1X8ufCvxB+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxvLKyFw2c5cr7vCvNx4noLzzLLaZBTaYPhtk0CGnz0=;
 b=VHkAObKNBC2fql+eQfshiaViDvbZausssL+qqbgptfzDPfuJ/5zklG8MNyH0rkJTF57pXIvL6QxGHqI6y1y/EKVkti2XzDzp41tsDlpESewGIjYlVS4ebqySgo4bkNaXdaYI26nXg+woxN6AzEXNkXEifYtx0WSq0YCuN1Pub6RFFxL/k1geSlOPZyG7o2PyFOuZTroD/Xu3y5YfPPOn3XYCrrTH3E36N2+nqIWXjbdT64fiQn9AT8BlAUh9nK6gV2TRpfpNikMwTDfBlnlqsnhofY6sYf2F+cvBwbde1Vg2Ciw2tTAbXhg8z4GByRxn9bBMsEkWuniXO+jNsRRYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxvLKyFw2c5cr7vCvNx4noLzzLLaZBTaYPhtk0CGnz0=;
 b=DyJx+GjteBFm2SNoP3+RkzDXmWqIRv2YIRejmTfq0UQ/OqKef+gJADs4YXAobntWnPLMOn/NqO9Y+pv7LTYfF3EPNtGfyt5IzkAd4JEXihNtGOFEwpj+jFWN7eBosAwA06m5irdnK8EMueBGkexjPxPBSZAuHivv6foN1949PXw=
Authentication-Results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB2856.namprd10.prod.outlook.com (2603:10b6:a03:89::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 19:16:48 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::dc3a:e374:2d22:9bd9]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::dc3a:e374:2d22:9bd9%4]) with mapi id 15.20.4566.026; Fri, 8 Oct 2021
 19:16:48 +0000
Date:   Fri, 8 Oct 2021 15:16:44 -0400
From:   Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: contact/tree changes for the swiotlb tree
Message-ID: <YWCZHIk+QpsDb7Y8@0xbeefdead.lan>
References: <20211008082637.78598d36@canb.auug.org.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008082637.78598d36@canb.auug.org.au>
X-ClientProxiedBy: BL1PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::7) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
Received: from 0xbeefdead.lan (130.44.160.152) by BL1PR13CA0092.namprd13.prod.outlook.com (2603:10b6:208:2b9::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend Transport; Fri, 8 Oct 2021 19:16:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42ed21c9-7df4-40b6-2e94-08d98a902cdb
X-MS-TrafficTypeDiagnostic: BYAPR10MB2856:
X-Microsoft-Antispam-PRVS: <BYAPR10MB28560BB2024053488AFBF16089B29@BYAPR10MB2856.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: awPgHMUZgbGJu8hOlap0zh2VuZP+NRZgrox+98lH9wQmSZ0azFIHKwSey7qM1ou5Szf/r/kgUntWEvuYKchrLil5vhiX1xmcOkm5Paqc2Not5Wyr6rwc84K7SF5an8XnHpANBTwj593pDJ9kZ4bxERadKtg415PBatJmB+IgFVM3XZmeXMnWf2gDsjKGYErVIDw0SDD7SbHyiNeDlu48c0rFYWbZSgWJ19KoYPTWAmMi/vcyh/amyNT9eEjO9mi/lyJfkpkNCefURsFjWcDhZtKdQu5MYbA4HdrFLQPVx6LlghDMmuaL3OpOwBom9LfJaJe/N/JmOZJYC6WtO+RFnsQtQWLdEiSF09Vn3sarU6kuzj+55GIuABCnn8dlkYXGhuGR/+gVlHfd6MpEcVF3KT3Id2rDaUT3og3EEfti430+5jpYyaD9VHTyf87BcS31X3xHIi24n8lb55AnYvdSDQ7TxSCURbx3Ogn6UstTgDbMTD3BlB6m9ehoRhszjYbJ9i1u5eGB0cTXJ0pacQTHDkPQD6nLGWKYerx8z0IN+M4uTIPiZAza4nypir39ygKLXKT0ovHPcQsyZknyTE+a+VkHR8Ha5glaSGxAcTUKLdZjHdNgVC3Y1DMGtfBI5m7GJXU+SAJHAN/bIp9/V4SebW23b/dxzOcqtU/rFa7Fo5lMQEKRh8BxOMNCzydCUKV7oeZ3NGgPkZd+tKP5qaLsX1FSGJVX5wrTEujT8qwWPzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB2999.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6506007)(66476007)(26005)(186003)(8676002)(66556008)(2906002)(54906003)(6666004)(8936002)(66946007)(508600001)(7696005)(52116002)(36756003)(38350700002)(38100700002)(8886007)(956004)(83380400001)(6916009)(55016002)(4326008)(4744005)(86362001)(316002)(9686003)(5660300002)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SkhzjkjiH3qsNU6eoJx/aBGXoO3UTgLCLbVk7Kfh35cSfNySrM+6zgh2BRlP?=
 =?us-ascii?Q?YF9sMXgG1Wo6WPSdC4bDnSBmcZPiISjuUrQnoiyXs5z4v+VLNox/xD4g4XFJ?=
 =?us-ascii?Q?JxifDeWMVtbpfIsqDrlMLaSsi+SeWplh0pEEM+va14n23PZZ5v/6N/Ocrsys?=
 =?us-ascii?Q?8CO9RD4nM6XNjsjD7oqo+c1WTQfKzwtGfEHKvBgQbMoSuw9lKdpN7U9Glr76?=
 =?us-ascii?Q?+SV7PzfJyf1KRa9iAQ4EJ144asT9k19LvgHJTOLdAMB5lovTw7sKGQq+mgRs?=
 =?us-ascii?Q?eKXqcLTdVWGH5LNsUNdHt5xjGSlkdAevbYq2MXsCdM1492N/S3iWdCnbhM3t?=
 =?us-ascii?Q?70ncJ9LsXXaGjHXAtegyr7Ng6k6kwLrk/Dkg8XcsqhjeOuOiNaReoOUBCIYX?=
 =?us-ascii?Q?A49EJVZr5Wih0HCHOmGdH103QT3b6nbSgqcgvzUQwapUlGQAyY4uvjEUBGff?=
 =?us-ascii?Q?TG3M1UdFi8dSmaC4TEMQjoKYnhKogrCaBCAHNnC+qqtj8RTGfMRBEKeXQGng?=
 =?us-ascii?Q?Mvvybs1uG49bhng8LRMcv8UTD3AI8zgMqLgbpqn4+K7vgdYESG6qL7JL+JGR?=
 =?us-ascii?Q?N4q5U/gJhPAeoj/pP19MyX3thfRBFWzK25O/a1qdGNUEYZu1gb/Lsxe5v2+Z?=
 =?us-ascii?Q?pJCPUZOPJ+oQAgW0z0VFogoRbhWG/M9rVcDYE3eYoBk7B/RKy+i4gMOtPvYp?=
 =?us-ascii?Q?ZqooU9R5Z45fBjNoEVFCR5v0+IenNu0DM9IgrOHfwQb/x4A41M97/byMaYpW?=
 =?us-ascii?Q?4+V6laE/x8sjRVBKdNJ+DPC80YqtpCEmT+9azx6YoRmA1asnSMob1FiJg4f7?=
 =?us-ascii?Q?D98u4XvmEimTKsIsRtPXUQGrzJB6HT7yuMNza6FfIVsSm2WR5dmk4+HpNxtN?=
 =?us-ascii?Q?u8fh+BNeIY80qSC7n7yM0tBpXe3IGQD5bau0rqW8Z0zDUIPdXl83gTlVqzHU?=
 =?us-ascii?Q?GJFaLUFJngbxrifswr0cLxScls3wNNGRL0KCcjnL+/qjyoPd0yt08OtLEtAl?=
 =?us-ascii?Q?4cy0lOuBCq6VxdrlY6gWLSop2XLt+w6e9mESbECzrLcx1KZEv/DApq8bMcID?=
 =?us-ascii?Q?n9/bWWheVP1gO0ysrmDuGnDfKGltjR/9ueii0t8Fqz8t6WK+/0TNfulp1zXI?=
 =?us-ascii?Q?aKctC5w8wpnAhgOM6dcYjYlIFy6d6O/FTWCgIZHkJyaEeoQijvOF4qHMLlM2?=
 =?us-ascii?Q?ZegQps7CGKIOgZ8SZiTJWUw4aS4T834Ad+tgDuSBOaOXMq/og9cJr6FaYa2v?=
 =?us-ascii?Q?hV7bRaLYT7eIyKm409ygHL+T/iiKaK608YIm8iu0kt9NnQYUYjVXbIT2zHsx?=
 =?us-ascii?Q?f/gDpey4ZDxN/uWeda2jdDHc?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42ed21c9-7df4-40b6-2e94-08d98a902cdb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 19:16:48.3760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gw11egNEETcN9A7z8IQsPj7lgQJfvCdRt9PhfeFHtZVbniPg+VykPbToAMaPeDsP8O3gpRuA8RfHS2pg4o+6lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2856
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10131 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110080108
X-Proofpoint-GUID: JxFXw5nbov3OdwOtvik2YwfJ7Sab5C-9
X-Proofpoint-ORIG-GUID: JxFXw5nbov3OdwOtvik2YwfJ7Sab5C-9
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 08, 2021 at 08:26:37AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> I noticed commit
> 
>   c4800765c0ed ("MAINTAINERS: Update SWIOTLB maintainership")
> 
> in the swiotlb tree today.  I assume that I should update the tree/branch
> I fetch and the contact information?

Hey Stephen,

Yes please go ahead and drop the swiotlb.git tree from your excellent
system.

Thank you!
> 
> -- 
> Cheers,
> Stephen Rothwell


