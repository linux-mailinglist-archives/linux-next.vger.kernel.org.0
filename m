Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83984610620
	for <lists+linux-next@lfdr.de>; Fri, 28 Oct 2022 01:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235854AbiJ0XIE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Oct 2022 19:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235771AbiJ0XIA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Oct 2022 19:08:00 -0400
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 963ABB7F57;
        Thu, 27 Oct 2022 16:07:47 -0700 (PDT)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29RMnCn7026609;
        Thu, 27 Oct 2022 16:07:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-id :
 content-type : mime-version; s=s2048-2021-q4;
 bh=y0fZlGem3feIO+Zv/2dUQvzQryT0KToKm9vocpZDyiw=;
 b=Vg1SZda0DX6poJtmVNnLWG+4QV1LruPtXgyFcH+EQW5cAne09h8h0p7D3n3V8BmUUyxt
 I2wRDuqwV3c9JY98kamiOTwavny10NwZbP537cj4VPQDwKhNVHshQxQmb9jI08GnNw8Z
 HtxApEHNoodKV26CpfCdKsjvwqJfNdujzyLAyoaYpkE5rautuq0hmJhv9RAM08swJLok
 JlvLkVokKpoym9jY+EoJV4jK5HoJSLZk7inSMIwjpzxvSjcyHWDIr2cb+hSEFzVr/ulG
 4zl6HEEw651ga0/Kve55b0GLsO70UYF7cw71+4CwSTIdQq6J/QS99BoM4yw337/rObkm pA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
        by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3kfagypf89-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 27 Oct 2022 16:07:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HN1cm0c5WYWxzttOzQUl2pOVl91JgQEX0QncYR9wzUJS9vOli4/tWF0l/DNjO33XLXgnF5d56W7RdBcvGkw3QxT3sq/I4heSkYhlu5MaaLCaXLHfrgoLtgvOUThfikLhzwh0mf9eXRFa7bojH+EuRd0O608A/4Io/nKfO7yjyCp922uOjxR2MGBqqL/3jkHUhysvOhe8zo9O4G4tp3v23kc7YIv4bhQ/eRCYkmXDn4MvtANQZi0Uwely6DZEUIgXAz0wPF2W+IRecEV8Q6EX0ZHEAYimiyGNO0nZd+5SljQBLilsYWLw6bQFcCEUJ1QqpuZ2LWVEezkVgd1qJLk3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVOANqHz1n69asR0XNBBpngVEABz3LlqXM1uiMV2scM=;
 b=dYwPA99biJTRWh1UMsAmvdBRCth+M4gEc7Y4thbM8zLmgyaXtifEdcvK+YtGBs2d0D0fVpGu4OnhmNlOjBf8nDU05BtGbYwq4FxQ0+rB6vbKa3a6IqE7kTUWaxKsTN02nWbx9+pALwutehnffGrlAFzdDMWqtkYxhDSdnOywQ/BS8++zbdp8nAYI+aV0hoBciQCvmaIPa4nqxkACafMXq3TET6ZoBYuJ1LEcTn//V7LgbeAudKvT9LOz8tJFKe03rPN0B85hXCGeLYTYXbhLMHTzCSr3tLLIVuBWrLI+JQKqaP5/Ce/VRIEJT4yn5W38ybx3bYGrDI9zT8t2JEw+Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from BY5PR15MB3667.namprd15.prod.outlook.com (2603:10b6:a03:1f9::18)
 by DM6PR15MB2682.namprd15.prod.outlook.com (2603:10b6:5:1af::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Thu, 27 Oct
 2022 23:07:42 +0000
Received: from BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::e984:e908:9944:5068]) by BY5PR15MB3667.namprd15.prod.outlook.com
 ([fe80::e984:e908:9944:5068%7]) with mapi id 15.20.5746.028; Thu, 27 Oct 2022
 23:07:42 +0000
From:   Nick Terrell <terrelln@meta.com>
To:     coverity-bot <keescook@chromium.org>
CC:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: Coverity: HUF_buildCTableFromTree(): Memory - corruptions
Thread-Topic: Coverity: HUF_buildCTableFromTree(): Memory - corruptions
Thread-Index: AQHY6ZfjrBQeIoCIEk2Lwfl5zQJx6q4i3qSA
Date:   Thu, 27 Oct 2022 23:07:42 +0000
Message-ID: <2B7F32C0-2068-4191-AB35-8BA6C3B94935@fb.com>
References: <202210261704.A5AAF0C@keescook>
In-Reply-To: <202210261704.A5AAF0C@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR15MB3667:EE_|DM6PR15MB2682:EE_
x-ms-office365-filtering-correlation-id: b0ff4b4a-efb0-47ec-0e4b-08dab8700d4b
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wTMC76w14SkEqLZDtB94rxRz0xXEoMv8yYk8GlOWjgk3ylacUS//2ECl2bbjmi9kTAqzQVh2B+BU8g5K+XMpIa57D+UjrjdLjcVI+whEwrafFp3Ix1ysKY9kYNxqmZrp7emJrUTU2BVCFFEn46+F61UhypI6iTFDbdPx33OfsybDBvsS4eLstiJFiKuxKKSbd8Q6Ks1odqEmrNXH3SYjVJICQoVVTV8LRGJIwrdqUabfiCCnwSfhdnvJ0uvXnCZrfASmKNdpjmdJ7OL8ttCVHmE2EaEhfqkQAc9AWOScCYs1OOkZA3XGz9c0VvCO1CQ/coDL2MSxEUuY6DrTTL8CrUGMb6tg55iUeEtPQSu6ARcQry6lSxHbRvVdGnNVH+eosyiaW5ynzOn204f2gFa/gj1V5RnAuO6XRvnI7+JPwt99Gn5+GSrXLvINYFILQc7XjFoSqDfpZ/C/BMUCY30JYgnAWBu7MiWYPvTbtuGEI8HwZO+7q7C/+y7lLA8tcVWAatIhxtIW1yO3dCEuZ7FfS888hkNyAzrXadZfN3sOhLnzBJ41uexkze9jy9Tpgxno89VCP/0HwruulRwCDdGMlnj53imJa8BWSZ0nxRk4Gde8C/czvborTDlX9eWsoeQoDK1CijR0nqcZwhM471XNQ6LAJUR680XgDQCKNl+/WetfYLJMBBZyaJxW51aW0d+N4IjWBLLOFo30jkKycm/u0v5UnUBobI1n/GjV+3pgS7dE48z1HGemYLtMb4wk+0OiQWxztGJXc/sS+T0ujNTTkf+bSxfXBW3VF91xPS1Q8zo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR15MB3667.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199015)(86362001)(478600001)(966005)(71200400001)(66556008)(53546011)(76116006)(54906003)(6506007)(6916009)(6486002)(66476007)(66446008)(4326008)(66946007)(316002)(8676002)(64756008)(9686003)(6512007)(122000001)(5660300002)(8936002)(41300700001)(186003)(2906002)(83380400001)(36756003)(38070700005)(33656002)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MZ4OmVQmTSYqVuEEcgNuS8jm6RccUtEiGnPpxtYAypgc4HQEE4vJAus1UG+/?=
 =?us-ascii?Q?hIW84Yxxcs4OGMe4AbkJCpyCjfilltDcOWPUbYmqUyvDcoauKTiEIskINVbP?=
 =?us-ascii?Q?QL4dTukl45uL7sSLNPHvU39YYZT0wfguU6oKSvJvlb46iKCzGqMU0leURkON?=
 =?us-ascii?Q?yqGAGRWRMwcRgWdmZ71Jco+GGF24fdITtSs/Hym2D/58i27RfwuKs2UNjHCQ?=
 =?us-ascii?Q?RROi1abBA7gILkel7D7hYVyiV12rwvLkiSo8rsXYOi3bnEaFjL/FGpTXRZ1S?=
 =?us-ascii?Q?KDZQPICHpauXDgubwB6d7MHaeSLtEkZJnduGhbzcGNH3p3dBzU6m5hRGBU5J?=
 =?us-ascii?Q?B5RIbvj5T28zTQ3LF0m98QWMuywZcQM50lvjQaF8rc/E8Cmd6S4eA2T0R2Ft?=
 =?us-ascii?Q?o75xNIespNFvc0Md9ZL5wtWUP7ZuybgH9bcB1H+g/wczhrVPPCTkSKt7z+mo?=
 =?us-ascii?Q?/2/nnrXf7TgniRDZTeGLXRcWUPY1aLPz5gpsh/BR/2NIT4FmmK72NAySYG05?=
 =?us-ascii?Q?Fsw/l9Zv42HWdycowaocXHqQs9wXeeDejNS00+/9P2iIwRfivBFaMdGY6PA2?=
 =?us-ascii?Q?2sflHqFEvyt32pJDLTOX9uMt906gmWn+nagAApdjrzRHtNMCwLLk/Vy41FGT?=
 =?us-ascii?Q?yMIc+GZXu5XJPPRd3bwtotqopar2k9SR9KJh/ilDgvrYMNzbVVHY3nowwSLk?=
 =?us-ascii?Q?Cb0g1E55lLiRpz2T0CVCkAn/V4xOkvJ2l3q1GIV+3Bz8epE8Avnb6dCp/pN+?=
 =?us-ascii?Q?LCKajQieUCGvHy/I34HsCv85Mhfv2QeeZR8ojqybpRlyreMaodmD4xmZITUv?=
 =?us-ascii?Q?N2NBWbiPTskar2rdmkq7h3MLDDekRjL2Ro1/Bx7v/K3/pgXKlWa+PvDJa4F6?=
 =?us-ascii?Q?gQWugMFIlTI1zU8LqonUHzoVntuFsVXOGuGJd/w+IqFGCqePYET+LiX9mVFC?=
 =?us-ascii?Q?ZEnx+g3PCasZhgLbyIsb2v3uGn65wznviuvcXb0uVoEo8Z0r/weDMt3wTgrL?=
 =?us-ascii?Q?mc9lanZfNoJQI8MPRzgnMM3oLkbttqT5A52iahSxNY5naOVnM9G727N7R0RE?=
 =?us-ascii?Q?YZpa+eypz0cWqu6qOgyQDoIp2oe/CzLQ1qRf72pirezyKv61dXBHiAuoBydw?=
 =?us-ascii?Q?yIy+FV3N3eePxeDWnfWJlH2nZ8Dg1sPhIKf/35a9kox04Fy+BjAScM6nCsXH?=
 =?us-ascii?Q?1kEjj1yYqYdANOh05+ARgkWi8CbHscn3wYp2UCkMnrC/a6V+kDbJCEFbqdrO?=
 =?us-ascii?Q?F0S10wdFXbv02J14fRwbiNDpINfwhr7qP1ACi2Ne+w2qIuUl+8EM7jRvqUSr?=
 =?us-ascii?Q?813k4y1VfmSgPSim4ZsZkXy6F1kCvrX97/5hXyj7KAH+RVDHK6I8KALbH9rD?=
 =?us-ascii?Q?ZsNid13PrlwCsZ0mj/J9hj7n+AhKwIawALIUcIyYA8MAuDa9qMCw46+XxA01?=
 =?us-ascii?Q?s/9qH5hu9mtPO6jbyD7VT7AcR15jBJBWN3IfHAdQYbCQxKwRBDaqaflZoLPV?=
 =?us-ascii?Q?wmJ9oxt7NzMW8vqNdIU9nEa4QE3ON0NKJFxXaJvV8hjB30Exnv/15hIU4r9z?=
 =?us-ascii?Q?vaRceOcLsief12EEPTxbvLtRiTGcGKsHXRWqidyhSSDEZ1tbP0xF2ipz3+Uq?=
 =?us-ascii?Q?KAGbSB8+7q+JzOZcIabjLJM=3D?=
Content-ID: <41F439F8EB673C4DBADB5CD2367945D1@namprd15.prod.outlook.com>
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR15MB3667.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ff4b4a-efb0-47ec-0e4b-08dab8700d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2022 23:07:42.4904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: clN5p2jc9daV2+NUW5K/wFBzl8MGZSqVHiiSPgl02sw4+Ba2PfsqDPhsKoorT8/AP7cMucPznCeoBsT+AsA6cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB2682
X-Proofpoint-GUID: I7ZwfyidcA7pvV8TQ3p79U1cIUatgyUc
X-Proofpoint-ORIG-GUID: I7ZwfyidcA7pvV8TQ3p79U1cIUatgyUc
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



> On Oct 26, 2022, at 5:05 PM, coverity-bot <keescook@chromium.org> wrote:
> 
> !-------------------------------------------------------------------|
>  This Message Is From an External Sender
> 
> |-------------------------------------------------------------------!
> 
> Hello!
> 
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20221026 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan  
> 
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
> 
>  Mon Oct 24 12:12:32 2022 -0700
>    2aa14b1ab2c4 ("zstd: import usptream v1.5.2")
> 
> Coverity reported the following:
> 
> *** CID 1525550:  Memory - corruptions  (OVERRUN)
> /lib/zstd/compress/huf_compress.c: 673 in HUF_buildCTableFromTree()
> 667                 min += nbPerRank[n];
> 668                 min >>= 1;
> 669         }   }
> 670         for (n=0; n<alphabetSize; n++)
> 671             HUF_setNbBits(ct + huffNode[n].byte, huffNode[n].nbBits);   /* push nbBits per symbol, symbol order */
> 672         for (n=0; n<alphabetSize; n++)
> vvv     CID 1525550:  Memory - corruptions  (OVERRUN)
> vvv     Overrunning array "valPerRank" of 13 2-byte elements at element index 255 (byte offset 511) using index "HUF_getNbBits(ct[n])" (which evaluates to 255).
> 673             HUF_setValue(ct + n, valPerRank[HUF_getNbBits(ct[n])]++);   /* assign value within rank, symbol order */
> 674         CTable[0] = maxNbBits;
> 675     }
> 676
> 677     size_t HUF_buildCTable_wksp (HUF_CElt* CTable, const unsigned* count, U32 maxSymbolValue, U32 maxNbBits, void* workSpace, size_t wkspSize)
> 678     {
> 
> 
> *** CID 1525549:  Memory - illegal accesses  (OVERRUN)
> /lib/zstd/compress/huf_compress.c: 187 in HUF_writeCTable_wksp()
> 181
> 182         /* convert to weight */
> 183         wksp->bitsToWeight[0] = 0;
> 184         for (n=1; n<huffLog+1; n++)
> 185             wksp->bitsToWeight[n] = (BYTE)(huffLog + 1 - n);
> 186         for (n=0; n<maxSymbolValue; n++)
> vvv     CID 1525549:  Memory - illegal accesses  (OVERRUN)
> vvv     Overrunning array "wksp->bitsToWeight" of 13 bytes at byte offset 255 using index "HUF_getNbBits(ct[n])" (which evaluates to 255).
> 187             wksp->huffWeight[n] = wksp->bitsToWeight[HUF_getNbBits(ct[n])];
> 188
> 189         /* attempt weights compression by FSE */
> 190         if (maxDstSize < 1) return ERROR(dstSize_tooSmall);
> 191         {   CHECK_V_F(hSize, HUF_compressWeights(op+1, maxDstSize-1, wksp->huffWeight, maxSymbolValue, &wksp->wksp, sizeof(wksp->wksp)) );
> 192             if ((hSize>1) & (hSize < maxSymbolValue/2)) {   /* FSE compressed */
> 
> 
> *** CID 1525501:  Memory - corruptions  (OVERRUN)
> /lib/zstd/compress/huf_compress.c: 253 in HUF_readCTable()
> 247                 HUF_setNbBits(ct + n, (BYTE)(tableLog + 1 - w) & -(w != 0));
> 248         }   }
> 249
> 250         /* fill val */
> 251         {   U16 nbPerRank[HUF_TABLELOG_MAX+2]  = {0};  /* support w=0=>n=tableLog+1 */
> 252             U16 valPerRank[HUF_TABLELOG_MAX+2] = {0};
> vvv     CID 1525501:  Memory - corruptions  (OVERRUN)
> vvv     Overrunning array "nbPerRank" of 14 2-byte elements at element index 255 (byte offset 511) using index "HUF_getNbBits(ct[n])" (which evaluates to 255).
> 253             { U32 n; for (n=0; n<nbSymbols; n++) nbPerRank[HUF_getNbBits(ct[n])]++; }
> 254             /* determine stating value per rank */
> 255             valPerRank[tableLog+1] = 0;   /* for w==0 */
> 256             {   U16 min = 0;
> 257                 U32 n; for (n=tableLog; n>0; n--) {  /* start at n=tablelog <-> w=1 */
> 258                     valPerRank[n] = min;     /* get starting value within each rank */
> 
> 
> *** CID 1525481:  Memory - corruptions  (OVERRUN)
> /lib/zstd/compress/huf_compress.c: 263 in HUF_readCTable()
> 257                 U32 n; for (n=tableLog; n>0; n--) {  /* start at n=tablelog <-> w=1 */
> 258                     valPerRank[n] = min;     /* get starting value within each rank */
> 259                     min += nbPerRank[n];
> 260                     min >>= 1;
> 261             }   }
> 262             /* assign value within rank, symbol order */
> vvv     CID 1525481:  Memory - corruptions  (OVERRUN)
> vvv     Overrunning array "valPerRank" of 14 2-byte elements at element index 255 (byte offset 511) using index "HUF_getNbBits(ct[n])" (which evaluates to 255).
> 263             { U32 n; for (n=0; n<nbSymbols; n++) HUF_setValue(ct + n, valPerRank[HUF_getNbBits(ct[n])]++); }
> 264         }
> 265
> 266         *maxSymbolValuePtr = nbSymbols - 1;
> 267         return readSize;
> 268     }

As Jann pointed out these are false positives because the number of bits returned
by HUF_getNbBits() is pre-validated to be within valid.

> *** CID 1505962:    (UNINIT)
> /lib/zstd/compress/zstd_compress.c: 2436 in ZSTD_buildSequencesStatistics()
> 2430                     prevEntropy->offcodeCTable,
> 2431                     sizeof(prevEntropy->offcodeCTable),
> 2432                     entropyWorkspace, entropyWkspSize);
> 2433                 if (ZSTD_isError(countSize)) {
> 2434                     DEBUGLOG(3, "ZSTD_buildCTable for Offsets failed");
> 2435                     stats.size = countSize;
> vvv     CID 1505962:    (UNINIT)
> vvv     Using uninitialized value "stats". Field "stats.MLtype" is uninitialized.
> 2436                     return stats;
> 2437                 }
> 2438                 if (stats.Offtype == set_compressed)
> 2439                     stats.lastCountSize = countSize;
> 2440                 op += countSize;
> 2441                 assert(op <= oend);
> /lib/zstd/compress/zstd_compress.c: 2404 in ZSTD_buildSequencesStatistics()
> 2398                     prevEntropy->litlengthCTable,
> 2399                     sizeof(prevEntropy->litlengthCTable),
> 2400                     entropyWorkspace, entropyWkspSize);
> 2401                 if (ZSTD_isError(countSize)) {
> 2402                     DEBUGLOG(3, "ZSTD_buildCTable for LitLens failed");
> 2403                     stats.size = countSize;
> vvv     CID 1505962:    (UNINIT)
> vvv     Using uninitialized value "stats". Field "stats.Offtype" is uninitialized.
> 2404                     return stats;
> 2405                 }
> 2406                 if (stats.LLtype == set_compressed)
> 2407                     stats.lastCountSize = countSize;
> 2408                 op += countSize;
> 2409                 assert(op <= oend);

These are false positives because the fields are only uninitialized on errors.
And they aren't read if an error is returned.

> *** CID 1505959:  Memory - corruptions  (OVERRUN)
> /lib/zstd/compress/zstd_compress.c: 3220 in ZSTD_estimateBlockSize_sequences()
> 3214                                                       const ZSTD_fseCTablesMetadata_t* fseMetadata,
> 3215                                                       void* workspace, size_t wkspSize,
> 3216                                                       int writeEntropy)
> 3217     {
> 3218         size_t sequencesSectionHeaderSize = 1 /* seqHead */ + 1 /* min seqSize size */ + (nbSeq >= 128) + (nbSeq >= LONGNBSEQ);
> 3219         size_t cSeqSizeEstimate = 0;
> vvv     CID 1505959:  Memory - corruptions  (OVERRUN)
> vvv     Overrunning array "OF_defaultNorm" of 29 2-byte elements by passing it to a function which accesses it at element index 31 (byte offset 63) using argument "31U".
> 3220         cSeqSizeEstimate += ZSTD_estimateBlockSize_symbolType(fseMetadata->ofType, ofCodeTable, nbSeq, MaxOff,
> 3221                                              fseTables->offcodeCTable, NULL,
> 3222                                              OF_defaultNorm, OF_defaultNormLog, DefaultMaxOff,
> 3223                                              workspace, wkspSize);
> 3224         cSeqSizeEstimate += ZSTD_estimateBlockSize_symbolType(fseMetadata->llType, llCodeTable, nbSeq, MaxLL,
> 3225                                              fseTables->litlengthCTable, LL_bits,

This is a false positive because OF_defaultNorm is only read if we've already validated
that the max value is smaller than DefaultMaxOff == 29.

> If these are false positives, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make sure
> fixes get into linux-next. :) For patches fixing this, please include
> these lines (but double-check the "Fixes" first):

These are all false positives.

> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1525550 ("Memory - corruptions")
> Fixes: 2aa14b1ab2c4 ("zstd: import usptream v1.5.2")
> 
> Thanks for your attention!
> 
> -- 
> Coverity-bot

