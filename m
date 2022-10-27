Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7158F61003A
	for <lists+linux-next@lfdr.de>; Thu, 27 Oct 2022 20:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbiJ0SbA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Oct 2022 14:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235534AbiJ0Sao (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Oct 2022 14:30:44 -0400
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A351FD3D;
        Thu, 27 Oct 2022 11:30:38 -0700 (PDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RIKIZN016652;
        Thu, 27 Oct 2022 11:30:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-id :
 content-type : mime-version; s=s2048-2021-q4;
 bh=zcmEevQxhl8YB9qTku2rGxO4AZ2Sei7mnKnvhNVPaqM=;
 b=btMEWniFayoTMQdgxeA+AfE91NQJtR4ZwsUkzBa1SKAkt+10DK4mAlAxaFkGpZMNb8hJ
 nWi9AP1RCHIU7mUQTXCVq99SZxTk8h0cmhQ8fFt4r1gKfuCpwI6k7kvkAZ77vMbUJ7hz
 QrMIb+x58Chzoo0BR8CIm6i1go8mOkvXwwEIkOaxLkHLocXPsu5bva7r8NmHy7dR0AgL
 2SMbqnVlmI8MysnJStQeGjEtvTb7odZut0e6UmWnIY8qmlPvzUW4TRr/qK2Rv/lSe7rb
 ABRwMQRXRkCif1vEEiVTcU75ZCyBep4QYYuUEfnn03s6VpQSGSo7pBmb6xBeuEJeCsH6 Pg== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2047.outbound.protection.outlook.com [104.47.74.47])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3kfagym0fk-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 11:30:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6uVN7kaovQgTnTnr6PwFQOa+0B+sZuGYL2Bh1t3iudrOAQnZcwj8KsnXtaVsT3FfTkchXbbr3hORQ8YQeDWoB875p/rHgoOOtZbILTMZpLW5EmCBlVDRUW9z4nINDlTB6KUBPS8I1aIejFbhPIrjJYzVOuQJ8wrNVS0fsXAG/oxAXmP0gJg1itOHie+ILFEOKWj/RE+lyinkAR3waEm6FG6IiR9KiXsW6sTmQjVC6WYfwiG3zWZI8d1bo5FSknQA1pQQ2VHYHztqpror/E7U/EQW7lpyA4Z9ybSpoQ+3MxsJe5dhGeFgEVYpzRbpCv5pUjXakGcAw+NX/jQe/geUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f//V60UtEIrNiD+z4Dg198+tcBwjkwgZhoH8tcxduBY=;
 b=XprlI2XCF0Hw/AT9XmIdWBUZGOW+AhCsjEDc7F7iozlBIhVGvQQjiVyKeuslALib4eEXRqSdltym4888+HV9YdSzzicUkoLDyIGtH+tEmGbKfuKAo2lqI/F3XtOwJImbGq9r3/FVhejRlmiBerGSWLG5U7dlMNX/UZWTd1IoTy84+SpMOHnvVhrkgLdffU/TE9+4r45i8OeULdqatvOGlFYhlk3TzHgfFebvxaKx+GMMfCWrbMc4MyiKfbbSc5baJmDmnaDp14hfY1DGU475AN+rcfN+l+BvmlE+lJe1Kb95Z5AKLhbJnrNrpTh5muD8E9SKKXbB0ycA/aqnAq5CjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by BY3PR15MB4946.namprd15.prod.outlook.com (2603:10b6:a03:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Thu, 27 Oct
 2022 18:30:35 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::e984:e908:9944:5068]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::e984:e908:9944:5068%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 18:30:35 +0000
From:   Nick Terrell <terrelln@meta.com>
To:     Jann Horn <jannh@google.com>
CC:     coverity-bot <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: Coverity: HUF_buildCTableFromTree(): Memory - corruptions
Thread-Topic: Coverity: HUF_buildCTableFromTree(): Memory - corruptions
Thread-Index: AQHY6ZfjrBQeIoCIEk2Lwfl5zQJx6q4iQOgAgABQTwA=
Date:   Thu, 27 Oct 2022 18:30:34 +0000
Message-ID: <A8DD8E13-36E8-41C4-B1E9-3367F96A0FFE@fb.com>
References: <202210261704.A5AAF0C@keescook>
 <CAG48ez0LRubkXO8aX3VwcF5isZ9z4fKTg48z4Ptr=4d778NcZw@mail.gmail.com>
In-Reply-To: <CAG48ez0LRubkXO8aX3VwcF5isZ9z4fKTg48z4Ptr=4d778NcZw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR15MB3667:EE_|BY3PR15MB4946:EE_
x-ms-office365-filtering-correlation-id: ace90052-687c-46fb-c96b-08dab8495678
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hzv0OHF4ysZH4UWhT41i7fCPkz3HdPaloVUoF6tRpmxyTURh9yvPZXo2K+Sg+N99jYUGbqWmzsUjAXmzZAVsGYlN7avHmwLboUfEwAIP84c33SwZdIRfBOSrjiYK+83Wfm8llja5uvF9djksPtVshtK6SjA/GsbqKtB9sjRbRvRCHFHy0STKQ8/cXU3GM8fDrriuzcazGPCV3vN3LIpu7JH0nJPOn30V4ZrEX1n04gOoWdo7orrqppzyYKgz0EFC7G0wcNAwJlWFcxiTDi2LyoVGr3ojWpwFW5YJpRfNiI1RdWX2YCCOmyblqOzTnn1+zG9IiYpB8RnYIXJN4Q2gfmJx1AwbffPWD/wg6UZYT2M9XBVOVvZRVKAMHtpHcX3Q1Jm7tmz4PcTX9BO+xr0r56Uy7WnQdcbTeEAi0wDf2vW1tibZj9sNFSxkFXBFOGCQCvISZZFUyH2au0wET4bmmQK1cf3v0Fod9C+4g6WFrLqjnM/TROykI3Yoe4bPHg82SePAn8usn3HfYTY9BCwOtBts3wUmprPoTL+6z9rMbo4qfJU9sdWilr8d9euk75qtEWB8BvwLxL1+fU25ikhiyctAmOqRoyim7X621DiAyBca2X0ThTIziz08/MBBi0AOjNcNZXzfmlVlKY88SIGNjtiTtYegxjbxu7TFD5tKtS6Bl1IeSRlfpuproNG8YZi+E5gXKiyonXzVR9/OZ+bPOZCkRpO9bxrVQlolwZC+7t2Rpn1Awlg52nR+2wA+u/Iv3ujYI55yLs5Kct23fXmoLy4jp7p7b73ZP5SHhs/8Vds=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(366004)(136003)(451199015)(6512007)(83380400001)(38070700005)(186003)(38100700002)(86362001)(122000001)(2906002)(8936002)(316002)(966005)(478600001)(6916009)(6486002)(9686003)(66476007)(66556008)(66946007)(76116006)(53546011)(71200400001)(4326008)(8676002)(64756008)(66446008)(41300700001)(5660300002)(54906003)(6506007)(36756003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tlgvXTdOSLPwGK5MPHFmZfPGLlQGuXO2M3K/hv5SLWpALTklYxNEHVO0JKhw?=
 =?us-ascii?Q?z/Mju8LtAkIQJBDlz/T4IQ8nAGJlSAkjw1+iUKhjlvv0Ex9yA1EYqVVV/JUN?=
 =?us-ascii?Q?5H254kZsyk4jN/1HwNMcgkV2HBMc+DB2WbkT4shZRlyBWBo+Wriyft841uLZ?=
 =?us-ascii?Q?p+YH0f6H/mJSHMGtXN1v4wp1ZmwezztcMUVH6MzV+tln78PN3Eypxn0vA45s?=
 =?us-ascii?Q?SlM5CYC8mm2Kmbl16oSq/CpWe/VY218058bLHjcljywcASKyHwglM+wZCfda?=
 =?us-ascii?Q?fUsWZqkIa1jMrdQg7iUmT/kN26v+q9fPiQpH8VdyU3VSoW4glhuvNpHnSrsu?=
 =?us-ascii?Q?7BFvLE4a/x1/fVH7DpHrqrORizObulft7Q8E3fpurbFNI2E8reoGGWdP9QEl?=
 =?us-ascii?Q?8tvzFUSPrhuxoE+UhB2LpIC8oHFG4UoPTodbcStUU17emg+63OYzFss8Osos?=
 =?us-ascii?Q?UG/qAnGFv127Qo9p2Z7+4w5L+eqoa8EiM69Yxu+Gs3gTPgFU8dkeDvAO6Hjh?=
 =?us-ascii?Q?t8V2yaho8HU/BbE3lMCx/DKIgDmUYgrM8t6Ffbt8E4lZFeezUHT5ZgN6SYuH?=
 =?us-ascii?Q?5BDjlG2pGaLYj3wLQd2lX3Awle0oWo7hjWV0iaAYHPPlzlynLslMGNHoD8va?=
 =?us-ascii?Q?PPGwCjfwZG4YUozu7oXEshyZ+S/8/Oi045Jm2A25QjPX/buwDp8ZwfM8Wa1F?=
 =?us-ascii?Q?GRN5ndSEL5smsUJj7czsUyVQiphVC1lHwqH+kLDsvl84gBvTyTtDQ1Y3D73A?=
 =?us-ascii?Q?HqpbNpey/rLkqcJVPT1MwsjS6MUEe4pBFv4xmnmT7NUuRlLV4dtWhseaNfUy?=
 =?us-ascii?Q?Hd2yiWIit03Sx4kTfxOoPMjvirm3K0pu8uugljKoUI0JjJJrSbj/yqUofcAr?=
 =?us-ascii?Q?Yz825eMKwh0m1mtERt7wPjsrYu6+p7qZOvKZeXreWxEg0zY/HrFRlJHRwQ3+?=
 =?us-ascii?Q?gd/8Q0oDGNRQnuxXiViudihjP+ITRQu7mvyMnwVKo13yi1DHWXh8zp4Iugju?=
 =?us-ascii?Q?znCue+SYkq4YQE823n0MdvpSCy1I+dKBHWVTOtZZ5vYOZGo6d5zYfFx+uqsl?=
 =?us-ascii?Q?6yDmtj5mH+UVhqP4kLoEsuj4TzpHh2w41GyyBaTsq77Vf5Bm1cholYx8zQEM?=
 =?us-ascii?Q?a9IKhos1CtRx2EIxKfiaePgWYzdyYsbuLJSnjUlpCRZBnV0+Xp9RnqLutvRl?=
 =?us-ascii?Q?t1ifJhyM8qaWZAtDh3y9a/IrlVUXfKOzaPsdpBnL4skphUhWVtbGFieyG/TX?=
 =?us-ascii?Q?LP6TEqcUMjcJk8IZx+YTI2PkqUXIvQRNUCQQgOSmPrwUZ3hSnVT+e1qTIVG8?=
 =?us-ascii?Q?5VQ74ux6hIrrUhwPQUsmM+hm3Ge251jPn7cwqP/s0uaK2PNAR81pF8VGw6gJ?=
 =?us-ascii?Q?SJPOKiWd2N7mZGAQcCGWShPk0SwZB/UwHbE1lCptYSQg59b1zaCbjKm+6X4d?=
 =?us-ascii?Q?ibcvkP3/dY4rKTv7V2s0ZrfhxRE4UgC/ESIIGbIK9hXzNytEV74jczUUIFRf?=
 =?us-ascii?Q?y+GQ/WFBXRYTeTqmudUlhDeoJU28KehRGGRu8fqG3+0MABTG0PGSYLkU4ni9?=
 =?us-ascii?Q?lnqUijG3ncaGt/wFlrojldYSOknf8j+pa68lAxMU0eg8RdkPUuDvY4B1GtPX?=
 =?us-ascii?Q?bAF/T+XswthbI5feJ/9/yiI=3D?=
Content-ID: <663B4E332812E54C8FC3E5D9A6ABD6A8@namprd15.prod.outlook.com>
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ace90052-687c-46fb-c96b-08dab8495678
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 18:30:34.8601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sn4TNfnSDBwUzFa1HWn7CoGIQaKskKn7iqVu6lrhK1+iLdDHZ8OCXjpxsG6Vr82cr88QwfXPeOWpwJl6fYm33w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR15MB4946
X-Proofpoint-GUID: VFdAHu6soYQ4UWO7Tgf1cobhvMjM5clo
X-Proofpoint-ORIG-GUID: VFdAHu6soYQ4UWO7Tgf1cobhvMjM5clo
Content-Type: text/plain; charset="us-ascii"
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-27_07,2022-10-27_01,2022-06-22_01
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Oct 27, 2022, at 6:43 AM, Jann Horn <jannh@google.com> wrote:
> 
> !-------------------------------------------------------------------|
>  This Message Is From an External Sender
> 
> |-------------------------------------------------------------------!
> 
> On Thu, Oct 27, 2022 at 2:06 AM coverity-bot <keescook@chromium.org> wrote:
>> 
>> Hello!
>> 
>> This is an experimental semi-automated report about issues detected by
>> Coverity from a scan of next-20221026 as part of the linux-next scan project:
>> https://scan.coverity.com/projects/linux-next-weekly-scan  
>> 
>> You're getting this email because you were associated with the identified
>> lines of code (noted below) that were touched by commits:
>> 
>>  Mon Oct 24 12:12:32 2022 -0700
>>    2aa14b1ab2c4 ("zstd: import usptream v1.5.2")
>> 
>> Coverity reported the following:
>> 
>> *** CID 1525550:  Memory - corruptions  (OVERRUN)
>> /lib/zstd/compress/huf_compress.c: 673 in HUF_buildCTableFromTree()
>> 667                 min += nbPerRank[n];
>> 668                 min >>= 1;
>> 669         }   }
>> 670         for (n=0; n<alphabetSize; n++)
>> 671             HUF_setNbBits(ct + huffNode[n].byte, huffNode[n].nbBits);   /* push nbBits per symbol, symbol order */
>> 672         for (n=0; n<alphabetSize; n++)
>> vvv     CID 1525550:  Memory - corruptions  (OVERRUN)
>> vvv     Overrunning array "valPerRank" of 13 2-byte elements at element index 255 (byte offset 511) using index "HUF_getNbBits(ct[n])" (which evaluates to 255).
>> 673             HUF_setValue(ct + n, valPerRank[HUF_getNbBits(ct[n])]++);   /* assign value within rank, symbol order */
>> 674         CTable[0] = maxNbBits;
>> 675     }
>> 676
>> 677     size_t HUF_buildCTable_wksp (HUF_CElt* CTable, const unsigned* count, U32 maxSymbolValue, U32 maxNbBits, void* workSpace, size_t wkspSize)
>> 678     {
> 
> I haven't looked at the other warnings, but from a glance this code
> looks fine to me. Coverity is claiming that some symbols can have 255
> bits, but we just went through HUF_setMaxHeight(), which enforced that
> no symbols have more bits than HUF_TABLELOG_MAX.
> 
> Heuristic checks like this are likely to generate lots of false
> positives in compression code, I think.

Yeah, the warnings in huf_compress.c are definitely false positives.

I'm checking on the others.

