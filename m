Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D53973700B2
	for <lists+linux-next@lfdr.de>; Fri, 30 Apr 2021 20:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhD3Sqj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Apr 2021 14:46:39 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:44786 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbhD3Sqi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Apr 2021 14:46:38 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13UIi7Xt058676;
        Fri, 30 Apr 2021 18:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=XgcLtG7UZRFvH8UOKVyWvOtRnD8dIyzFzS6cg9DEccI=;
 b=qmOtO6AEkzGLYyUOARWkNacfIEdkeyTlqXLP3nUg1dIVMs5tvbsSoWi8HUkTUI3yyN9L
 q3jIwo47PdUTNrhaUL3rcw+N9ua7Y6DiGL26OAmYV0Y1v2gBxOYinSDwpGsAsllM21j8
 /ud4/WhDEE0vtZvRF6Q/2iXmXZ9d6WwCXWqGd+Ics5uaviC3Mu6iqil0jiMFy5zGDYxn
 7uAj48Kdgb94NKzJhWTnjsu3LeS0/l2RXjTnWWNsxZmRMnOfXWb07lK0NFi2m7xLdi3K
 htSS4RjaRtAkjAKTjjIfGI42IAPNNIcIquoqWWR2BRnKDtx0tlnQTVY/aNHLXooGSNxa YQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 385aeq8ms4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 18:45:29 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13UIix3H033514;
        Fri, 30 Apr 2021 18:45:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by userp3030.oracle.com with ESMTP id 3848f2uwnu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 18:45:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gix0Alv9z6ckaSK0tdUBGfwTlB7vjYHFa167RzHbWCZGvsmul82LRSy/sF6/fS7/jsdYANu1xtJBV9IRuprFqjbRQVw/6dRbOZVFlH+bEIrjqDrdkyToNzRC6/Fyj0poGuRNrzZlmQnGl9Kg1U21L4Jsr1uK2a8GgdaCSFPXGw6Ld3RfBoTZqOju7+yFS5Iiy7g0iDD6roh+N2S4Y0QOhB5BLtu7PJmRaeXY5ER+WUTtcZC7cPzM/ivP5rpcnphxawnEQZP2AM8TdRZAQRupYl8s/3LD/SRf6uZSgMYS0QZWqpYDT9zNrNZMVP4Fy0ZL/7WFKYnqVQaA9KffkwYlFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgcLtG7UZRFvH8UOKVyWvOtRnD8dIyzFzS6cg9DEccI=;
 b=TPZgKBQALxBbxfRk9t6RoPIrvP/38N1wZEzblfOUfFcgtq1ZVcaeuqg9aZ34N1YVacy21Jl6i/wgUFVQAovhkK3S2vFKh3Kz5KBd8fB4NURcOBnlknIDAiFeXsXllYW/Lj8owGaXj9jsH0jgGA8k7zHF4DY6qjTFkXGSbqiFjjVAcwKM5dPkf62n5wbBvE7/c7z71i79ll3qX2PWN19aJMWD0p23aw9iBDzm27P+qxmHm7zzFRrGlihK9IEfoY1b0gWOnzCr0Beuwzp1HKpDATLPr/7J4o6CO2rcoTREjVkvNBbYI7YmNdfcKfr8YCdqkHdbCpmNe+Fch3oW7lv/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgcLtG7UZRFvH8UOKVyWvOtRnD8dIyzFzS6cg9DEccI=;
 b=UgPoqh5uM13/HYAsVE9gj8uLGzqOaw1oHOXhuNVgZhP59sPPxESICqCnG3AD79S6yTUO7D+53+xiedkQUPU+u+2Y+5FQk43DSRjt8X4VWUyxXPQ4jfDVCUQdsp1UrpnvwgtYxLpZwtZ8g7EsuhiYq/z86KUk+nGQ108wd+dYaG0=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by BYAPR10MB2919.namprd10.prod.outlook.com (2603:10b6:a03:89::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Fri, 30 Apr
 2021 18:45:27 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::50bf:7319:321c:96c9]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::50bf:7319:321c:96c9%4]) with mapi id 15.20.4087.035; Fri, 30 Apr 2021
 18:45:27 +0000
From:   Chuck Lever III <chuck.lever@oracle.com>
To:     coverity-bot <keescook@chromium.org>
CC:     Trond Myklebust <trond.myklebust@hammerspace.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Coverity: frwr_unmap_sync(): Null pointer dereferences
Thread-Topic: Coverity: frwr_unmap_sync(): Null pointer dereferences
Thread-Index: AQHXPe5P1KlTurzIc0qj5wtiLqlNpqrNZhsA
Date:   Fri, 30 Apr 2021 18:45:27 +0000
Message-ID: <B431253D-E874-45BA-9303-79C7FA950D1B@oracle.com>
References: <202104301126.5A1D9706E@keescook>
In-Reply-To: <202104301126.5A1D9706E@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [68.61.232.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a52cf20a-76b1-4757-f218-08d90c081f47
x-ms-traffictypediagnostic: BYAPR10MB2919:
x-microsoft-antispam-prvs: <BYAPR10MB29194A19C424E79694542400935E9@BYAPR10MB2919.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lew+ZJXXaSnrT88q3/Axx4h0QhwFtPK9KgOkdYP3vKPJLNi2wiDtTQEaMtBtbO0o3CN9i5ARvUY/mNnxBzlsNN3rsUihZDcQtuUhbbfQaojjv8smmXgd1I/WX/xPQNgLrhkhtomd8MltyjtMTQBbkj7gCTXLSETU2nAcjRES0yK49S0pfmKaOVFMHH4NIijImSUPpNccEYsiLR/52PiAvSu64jO38CYv1pnOpIYj16sYbOx828jkZnDmSNmWCj0b+35+fTmoFMjL9cXiB8y2JKHF9CoNp5woCJD9Hp5L0JsIOrxUiGv3zkieUXDdG2aFa7Xv+7lPtIJmdpm31uelPobIlyjJxIrMpP5guDj021dVlGUxnA7voiG23XLEHJwGpktmXwhai6KMyp2QXaFv6s4r3RrH1ZhUpohkpyC6Ak7IDjt8K6tU+y4+6b+FknBMtdIb+gHctkz0Dx4rZJJKGZUTjXWWVw+hEeMYE3ekkekdNkBy0bKVwEOZg/kWxrFTM02OmMJidG4vEeNrEAhG4w7RiSyZE/Mu0aTkdGkjfyHs6DwgoRCUcSVoALi+4Oj2Hto0uW54fiLprJ8ySU+7m9+7h4oXH3STBZRknl44G8V+ABNr7fkpb8MJM42OhQHhX7mf8Runs+GCtjLKqLhYkFvxUz5vnd7G4dCqer+TTrPtXRMJjtDbNn8Bs/WcyI5vpUStK4g+1yhUpqAIo5rz0LRwoq32qwtnpQftHdDCahs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB4688.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(366004)(396003)(376002)(346002)(83380400001)(71200400001)(86362001)(316002)(54906003)(5660300002)(8936002)(33656002)(2906002)(36756003)(186003)(4326008)(478600001)(966005)(66556008)(66476007)(66446008)(64756008)(8676002)(66946007)(6512007)(91956017)(26005)(6916009)(6506007)(53546011)(122000001)(6486002)(38100700002)(2616005)(76116006)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+Hn4m8MgIrm5ASacIKxD14utP3aknD+Z8zUqI60i4gITq51MBF4HKjcG5Hp0?=
 =?us-ascii?Q?1WO3Ft1Rotf3KyjpaA4BYmhs3OynssgVtduja5DErBFvHhsyY9gPzOeQsYs7?=
 =?us-ascii?Q?ZgdkwAEEJyGHCPRLEHR6WZOW0o9H3rHf2u6NYoiWrANmkTnkQ2F612gUcTpy?=
 =?us-ascii?Q?3q2rkuIaOxW+5/US8lQbMwskbEbAZ/6a2PS478pnU/Px9SXor7kg5sMUBVVo?=
 =?us-ascii?Q?W2uQTU0OTp8tEq3fOSZoMcIP/4nEwjFGdRA57vxvgCUqYlkUI02NJtmZQKwF?=
 =?us-ascii?Q?SD6w40PpS+bkb162bZIImoq1Py7nUYntVWfWEID9sgHzZEJXopFVTpXhhwuV?=
 =?us-ascii?Q?WqL5ZPaa32GIur++FQR2t3hVV5kKQ5ker9MOzVU17wm2T7IdRFUsDKBmvORc?=
 =?us-ascii?Q?9f9JKl3MwVEwrFNLr2Alu28NbflkODHC14nytkxvjHG2j6z3jmouH+mZfM24?=
 =?us-ascii?Q?88i+1C75mUfMCLtcAlVyKZQi04Q7wECCtrjtdsMLyOlTEE0WlMvo5GFyefV3?=
 =?us-ascii?Q?gUQsnAnY4i0k37pyxXLDf63iggMeG9gvkO2VgifgV6lAKQVH4V3CN2uPoPsX?=
 =?us-ascii?Q?5YfRbpbC5i2z/2PrmUC8pvPKoUIWu+JJfwXxElKqMnlJCWgYDP99FPPJTgKC?=
 =?us-ascii?Q?ZWgKLS6lgpvm1jxg3mDwLu2s7CmQHUprRVgupLS1Cy+3ZJDzQga910IvTE+z?=
 =?us-ascii?Q?hJ8VwV4WwjEvAsh+bPNuzTzc0RC1kBYcnOgV6IeYPZcutyoQrpwoUPlv1MGi?=
 =?us-ascii?Q?Dtl05FYoDVRV/Bo105Pt3/rlKAmcZUNi3fso/nNnR/9okbZZ+eyQ2nmI5WEe?=
 =?us-ascii?Q?4YFOuQ6jVD0gBIpGwrPulwYbdCIJRhgk0gmmJ90FDBAOVZN1K+Uyes5Bdvod?=
 =?us-ascii?Q?3+3AoRJC4lZLVa54ZYF1AkGtE2UizrZuqENY7pRE0ftxMl9On6LWZZTMCM1A?=
 =?us-ascii?Q?MQAiWQzMF8wxlu3knkzsyd+YQ4fs+n820MCNFiOGLCWsCEkdozAtOXiZrX07?=
 =?us-ascii?Q?ieQDyB42IO9ejCCH3/3L9t99x8KVcc1RD9Y9SF20qApPa7pRrUJmqmwJHBZI?=
 =?us-ascii?Q?PJXKHAKagxhkjx2egIhfETMJuro0MOEqhvhyZ8vUtkiPD2jEKxUHbupu6IRh?=
 =?us-ascii?Q?/BMSYlKhR+IBOgj1+eDAB0tFZ7Ji99mYn4xfiMhuDoBczPIxlJ2utue9unZg?=
 =?us-ascii?Q?7kZg3gJvVzUMvw7ErQkvN9lF6+6UdJHNalc2UNxyM0DJaxFoxkZzcdZBG8bt?=
 =?us-ascii?Q?feZTTXViZZ6AzxaM+bLUvN+zD4ZEAEOdLNHPH7XcrE+A8RDB6COHayDq+zUu?=
 =?us-ascii?Q?PD9tQDhEoIXjJwVuXrd1fJCE?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <18D40155D89E7E48B74E50EEA5F7DE7A@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a52cf20a-76b1-4757-f218-08d90c081f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 18:45:27.2143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hYP7WltpMojDhk1HIk/Hp2DxOTOGGc7R+EqSf9Zg9Sdm5/6rjQxF/rxZSucppO0WlHBIbDIDv9cRZzEjxubXIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2919
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9970 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104300127
X-Proofpoint-ORIG-GUID: eY71z0rkLkzjdxYOSIIuHOYoxnguSZxk
X-Proofpoint-GUID: eY71z0rkLkzjdxYOSIIuHOYoxnguSZxk
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9970 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300127
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Apr 30, 2021, at 2:26 PM, coverity-bot <keescook@chromium.org> wrote:
>=20
> Hello!
>=20
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20210430 as part of the linux-next scan proj=
ect:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>=20
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>=20
>  Mon Apr 26 09:27:06 2021 -0400
>    9a301cafc861 ("xprtrdma: Move fr_linv_done field to struct rpcrdma_mr"=
)
>=20
> Coverity reported the following:
>=20
> *** CID 1504556:  Null pointer dereferences  (FORWARD_NULL)
> /net/sunrpc/xprtrdma/frwr_ops.c: 539 in frwr_unmap_sync()
> 533
> 534     	/* Strong send queue ordering guarantees that when the
> 535     	 * last WR in the chain completes, all WRs in the chain
> 536     	 * are complete.
> 537     	 */
> 538     	last->wr_cqe->done =3D frwr_wc_localinv_wake;
> vvv     CID 1504556:  Null pointer dereferences  (FORWARD_NULL)
> vvv     Passing null pointer "&mr->mr_linv_done" to "reinit_completion", =
which dereferences it.
> 539     	reinit_completion(&mr->mr_linv_done);
> 540
> 541     	/* Transport disconnect drains the receive CQ before it
> 542     	 * replaces the QP. The RPC reply handler won't call us
> 543     	 * unless re_id->qp is a valid pointer.
> 544     	 */
>=20
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter.

Sure, not my proudest moment here.

The sole call site for frwr_unmap_sync() is this one:

net/sunrpc/xprtrdma/transport.c:
606         if (unlikely(!list_empty(&req->rl_registered))) {
607                 trace_xprtrdma_mrs_zap(task);
608                 frwr_unmap_sync(rpcx_to_rdmax(rqst->rq_xprt), req);
609         }

Thus, in the current code base, the while() loop:

net/sunrpc/xprtrdma/frwr_ops.c:
514         while ((mr =3D rpcrdma_mr_pop(&req->rl_registered))) {

Should always terminate with mr containing a non-NULL address.

Seems to me the frwr_unmap_sync() code before fdf5ecb1934b
("xprtrdma: Move fr_linv_done field to struct rpcrdma_mr") has
the same risk -- frwr can be NULL if rl_registered is empty.

I'm open to suggestions for improvement, but I'm not seeing this
rise to the level of a pervasive and high impact issue.


> If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
>=20
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1504556 ("Null pointer dereferences")
> Fixes: 9a301cafc861 ("xprtrdma: Move fr_linv_done field to struct rpcrdma=
_mr")
>=20
> Thanks for your attention!
>=20
> --=20
> Coverity-bot

--
Chuck Lever



