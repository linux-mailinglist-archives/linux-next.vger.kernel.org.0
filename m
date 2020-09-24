Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A45F277C24
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 01:06:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgIXXGy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 24 Sep 2020 19:06:54 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:19446 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726205AbgIXXGx (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 24 Sep 2020 19:06:53 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id 08ON2rdQ026803;
        Thu, 24 Sep 2020 16:06:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=HdihU7t6gAf03WJUIU9k9Z3+5vBuZsI/IbIIie5sz70=;
 b=ivy8oR4Mku/U1aFy5Reu9IU/atNzN3It9pzsfUzL55h/CznbAjprUKXxsCz9oBM33X69
 qRt1PPzx4CO5dvshlIbai3DvD+4dlANEvKrcg3+lo+pr5BmQdlpxnW4Y5/8cxs2+kLvU
 5BdTCw598I8+nM6w2MAZ+GBZ7ooLuWaN5MM= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by m0001303.ppops.net with ESMTP id 33qsp7mpa4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Thu, 24 Sep 2020 16:06:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 24 Sep 2020 16:06:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCwbwHwWRFNAdqXtk0eQv5//0tt6smXVfy1MYXlshGBiTcaBgzFJx3zOxErvfsCL4nWIyp3ZZvp5njm3TPI5rdenAoMsLx/z8P622xyVAw0SE8rVTnes/7fu0EI+sVa2348ofIxaccPn9D8h9wVD87t+zdVrwXh07PF/lcOIPG94pLhJp46BrdSjxsvGHk3lfqo0C3qRjdBp3PoFymUWll7pAjzACVJnZQ5JnmC34KPPea3gpaH/78yV55XUk3qqD3LfSJKBP9H3vMD2hBuqHpz2mudFMcKkMdRqivWLXBpWUeWtqt1RBaEIYtAGomey0GzY2tBMYWQ7WU7dVp5/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdihU7t6gAf03WJUIU9k9Z3+5vBuZsI/IbIIie5sz70=;
 b=mPu8YthI1L4bMlPolrsEIAgvHStFBwpg4Ov0EaRiX6hCMpZ2pAXYetYsjwO4MevtQ0fB6ltJU63EGjOCWWt7b98W3eql5us9CtRrJ/xlwIqZPkHQMvcY7wPa1rEfUa94QbK9KOe2kX+suzkRg4CU5+KwdFG7yE840eQJ2ZkbDi6G5Q5tf26GAt989c1TjqrkFd6cL8xY5JMhxoU+7EGVMhpZVLrgf6FrNuBIXtmQ4l4aH+P+qtbROX4u/5jz1d6CU5CLZ+7ipcq0WcZe3pxlnN6rlHDnskJu+939XjTDqqXRAVrS3tSkzR8Q5UkIEsGUAqhsJlRCaHkvnR8riDySiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HdihU7t6gAf03WJUIU9k9Z3+5vBuZsI/IbIIie5sz70=;
 b=ftWKPyDc47GuZFdZGXuGhLrdx4iYAd0AyU5qQiSIK9Ps45amdMknjKU3z87vbaFBkyf3ix+BlSeKWRH05UDT3eFVjHAQ2n2AhnnW5mj9Ucpsad7pUD7m0DtBNQZ8H3MGKqfGIn63ryUn98nXRiWAF2S8LqEh5wURdrGLzJzTPtE=
Received: from BYAPR15MB2999.namprd15.prod.outlook.com (2603:10b6:a03:fa::12)
 by BYAPR15MB2566.namprd15.prod.outlook.com (2603:10b6:a03:150::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Thu, 24 Sep
 2020 23:06:43 +0000
Received: from BYAPR15MB2999.namprd15.prod.outlook.com
 ([fe80::1400:be2f:8b3d:8f4d]) by BYAPR15MB2999.namprd15.prod.outlook.com
 ([fe80::1400:be2f:8b3d:8f4d%7]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 23:06:43 +0000
From:   Song Liu <songliubraving@fb.com>
To:     Jens Axboe <axboe@kernel.dk>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the block tree
Thread-Topic: linux-next: Signed-off-by missing for commits in the block tree
Thread-Index: AQHWksPNDizDa4hwD06UUSdJy9nC1Kl4aNEAgAAAYYA=
Date:   Thu, 24 Sep 2020 23:06:42 +0000
Message-ID: <FDF93DF1-FE61-4F71-ACCC-E3DF42CEF807@fb.com>
References: <20200925084053.7169dd01@canb.auug.org.au>
 <c190a77d-33bd-2213-5cc1-17b5268d511d@kernel.dk>
In-Reply-To: <c190a77d-33bd-2213-5cc1-17b5268d511d@kernel.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
authentication-results: kernel.dk; dkim=none (message not signed)
 header.d=none;kernel.dk; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:cb37]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acf7d515-3f9f-4c17-a9b0-08d860de80a7
x-ms-traffictypediagnostic: BYAPR15MB2566:
x-microsoft-antispam-prvs: <BYAPR15MB256689E0EE3C06CC269C58CDB3390@BYAPR15MB2566.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: agtUrfplhWClmR0WxCUP0w43uBmRXTDRmSSsM1b8YlskUeVFLZGoqlb58JxsiGPrM39B68acuARSTwXch5uRXOFhkUUa/gAtzRBugM61YzxDai451a6sFVvhy1QnH/1D7yjxCqQOQGQgrr8XidYq8OPE7Vjsb+Rvs1KsD9l5UCKGeLHo+aEmZaikXM8u6knr+S+HU8XQyxyemquy/Rje8/GDYF36bIetVhFJ3uyqZ0q5BQaL3ouaLawyqXijIuCTv3pvYMkSJpCVXtligK/5lrzJpcy5LtQsRqrXwZwsUVCtUkkHZ2GuF/VgdyaHnP0a4GOgJXXvDwL/rd9vKYPMuA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR15MB2999.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(4744005)(91956017)(5660300002)(6506007)(66476007)(76116006)(66446008)(2906002)(53546011)(66556008)(6512007)(71200400001)(64756008)(316002)(66946007)(6916009)(6486002)(86362001)(54906003)(36756003)(4326008)(478600001)(8676002)(2616005)(186003)(33656002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 5dtywdq8m1YQDbt+s/QKWC0nuqoZnXzB3f3W33+65nuQJjOoZrTRQwZZbJMPZa/z6rgHHS8R30VvQs0yB7h39/6ZB6cYB1ZE6atpPvUa0c4gDHRc3GmWTxW5twEpn8dE2LrlyKWtbBM20WrrqzUIO5Fmx2bk38h4wKjP/ZetNxiWinavp3VWLB9k9y9bOy7TvhSAPiVSudYnL6XeFG/cdHGqU8hRgDibHZO4qavHa9aFcPzJ4FnciCJ9cuFmDITcFaHneHS2+HKEljZDWk/X6Orq4mSb3VD+syG4sxv4rxqnUYjHgKCWz6PSaceX4y5aVB9QIN/s/T4Y9mbHcqADvjqLeyGJGC/zgMWvEI2jxWyiii0yOw9LBbxyTw+d1TlEvp3NEpjMwFXMAPlbpJGDVV3ERgeD0NBRmOH4zNIR4p3bpInVROIiBpXXfn5+2nFcK9IWnVEH7/a5i5oHkO0XM1bLpEKx7tyGLAEX+tLdttODQmDWJV2Z5IptehXT5XJMbBS2DR7rEFikjG+WooG/tmX59FXHwdFR4MYXdULMWJyggSEsQnCC+OfFuxMwImErGhy4wQkw2yvnvWWK+/hrj+cLJHsEuk4IR5OW6NHRa/pnBpn1U+GY/Iw7OrpEyliNddPFeWdtMmijfmaVauxQTiaxw5lfRcuR4oFqliEzrzLiJmfXLoOtnkZd6CYBpI6v
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8698530A19E1B745BA3635D64C6A2FAB@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2999.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf7d515-3f9f-4c17-a9b0-08d860de80a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 23:06:42.8693
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7fiPkDGS+kr7nKawY7yvZswnrrZgrwMaidCANGG9SmLkx+N945njxDZbKgthqkGQuMbPhcNzYW6ffpyeSe6ePw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2566
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-24_18:2020-09-24,2020-09-24 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240167
X-FB-Internal: deliver
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Sep 24, 2020, at 4:05 PM, Jens Axboe <axboe@kernel.dk> wrote:
>=20
> On 9/24/20 4:40 PM, Stephen Rothwell wrote:
>> Hi all,
>>=20
>> Commits
>>=20
>>  caec515ad9ed ("md/raid5: reallocate page array after setting new stripe=
_size")
>>  6a4b2e201b37 ("md/raid5: resize stripe_head when reshape array")
>>  1df3ccb18cf4 ("md/raid5: let multiple devices of stripe_head share page=
")
>>  e56e7ebce809 ("md/raid6: let async recovery function support different =
page offset")
>>  2b2059f32e20 ("md/raid6: let syndrome computor support different page o=
ffset")
>>  f849daa2c23c ("md/raid5: convert to new xor compution interface")
>>  4737539e07a3 ("md/raid5: add new xor function to support different page=
 offset")
>>  a5a1925b9a1a ("md/raid5: make async_copy_data() to support different pa=
ge offset")
>>=20
>> are missing a Signed-off-by from their committer.
>=20
> Song, I'm going to drop this series. Please re-do it and submit it again.

I am really sorry for the trouble. Will fix it asap.=20

Song


