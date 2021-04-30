Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7743701E3
	for <lists+linux-next@lfdr.de>; Fri, 30 Apr 2021 22:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235571AbhD3UN0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Apr 2021 16:13:26 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:40068 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbhD3UNZ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Apr 2021 16:13:25 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13UKAA4K188823;
        Fri, 30 Apr 2021 20:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Cs+DO95Ww35QuP45JQ3lmbq/yZlr/YRlWg4Dr3Kphp8=;
 b=GEzHaYqW41LEsi4DfQd8LYDmop2iLk576DkqzXGF15NiLXDtTLns4lbr6jLlALqGRWBI
 L6/REpXWyKxmb2VuOHkuxqxa8moSCBzk/+s5BGWcN8HV8aO2ajIDaakvjOneXESsxpyV
 K/0lpSpHn+ZDS+o4R5q5kHWbTKlimhKMer4AwVBZNQpkvPZAN6AT34Yhc1ufDhMLpJJj
 ZvQARz6rXVSaXT+6M8lLtlJ3YfWXKZDYcviBXoNi3IQ2HZK5V/QYMbvwSLAzIbk972NC
 ZtuszPJa4YXWRSwQIsMTCdTK/yCQPSO1UbsEcsEzN9jbRMW7C937ZwO7XIAOhpSMAYpN hg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 385aeq8v8u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 20:12:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13UKA1QC023980;
        Fri, 30 Apr 2021 20:12:17 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
        by aserp3020.oracle.com with ESMTP id 384b5cgkp1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 30 Apr 2021 20:12:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4kOr0j+Cb80BcKPolfe8fc3cauiMb6IYufhpEE1sQMaIL5xGTfP8WrD6WMgof0jc8LBtiOHB1stnZ0pAqtzHUGSg1B3IWNs61lKpR5VeU+gK/VCuyGF7kVoNIgIVTmsiU4izHd1Gcw8ElfP7b+YEu171K2LAbnJaGsw4noIci83nFulINLuejyZkRIoIUgPNQv7G+lTXsPBSC2X7boIJ35TeizEkZY7prnfpbyIbA743kJzFja6HQIPjNzX9jfUCfryGRIz72Qm9h0OMdU37zv4qXkHde4c6dnXrfpR+zeGkRTyEwQgMunsKQuY90uGcXHZbOQSY9RnuM/wjZLBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cs+DO95Ww35QuP45JQ3lmbq/yZlr/YRlWg4Dr3Kphp8=;
 b=CGSPGhdoNKYX0UA8GLBNwpXcjPF/sBIrJcvdpvY9YqmkgeACSb/6y7t5PNXqAnhSPANGUfx0T3FXjTfR5wHtV1igzbKS2ttp9fg+WZ/aP7/cmLN8xYx51zaSV5o+TE6RikE62/GLRlal8rXZ5SeXSCKIt8KE+EL9lhZk5URipySaHqmKHC9lzRl85XgODW+0zUuTkU4fldVz4QLD5iLkbBYhrLyGZZSy1GSeVl9GqbHRHVAz9956syZ8M7w0xumu7QnnRLc6VRCg+oHftfwNb+vCL0Ts6SVZijQ/yrHZGKiXdeE4hd0AQzxJaH6QlSZkCjj8q5VsAxwWcnBPY274Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cs+DO95Ww35QuP45JQ3lmbq/yZlr/YRlWg4Dr3Kphp8=;
 b=KgSv5s0ODqY2VH/1bUvfy9ZpqoCJNOcpwMOhntadCOdczZUrC2c7/j0JeXOPa6fY9YzKGK7OcxqRJQbfxQqs/6S8HeZ5nCjeMeZZ8ezfEMfJAA1nOZ9OkoDs+Yn0OlHVaWxr6ryrzEF1s7p31Z4S9qnbhTKnmOUSUtTgY9KnlHI=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by SJ0PR10MB4669.namprd10.prod.outlook.com (2603:10b6:a03:2ae::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24; Fri, 30 Apr
 2021 20:12:15 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::50bf:7319:321c:96c9]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::50bf:7319:321c:96c9%4]) with mapi id 15.20.4087.035; Fri, 30 Apr 2021
 20:12:15 +0000
From:   Chuck Lever III <chuck.lever@oracle.com>
To:     Trond Myklebust <trondmy@hammerspace.com>
CC:     "keescook@chromium.org" <keescook@chromium.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "gustavo@embeddedor.com" <gustavo@embeddedor.com>
Subject: Re: Coverity: frwr_unmap_sync(): Null pointer dereferences
Thread-Topic: Coverity: frwr_unmap_sync(): Null pointer dereferences
Thread-Index: AQHXPe5P1KlTurzIc0qj5wtiLqlNpqrNZhsAgAAGpACAABGcAA==
Date:   Fri, 30 Apr 2021 20:12:15 +0000
Message-ID: <84662251-DF84-4827-9D89-293BB2340433@oracle.com>
References: <202104301126.5A1D9706E@keescook>
 <B431253D-E874-45BA-9303-79C7FA950D1B@oracle.com>
 <08aa80f9bfeb1b48daf804aa2903d6217e599fa4.camel@hammerspace.com>
In-Reply-To: <08aa80f9bfeb1b48daf804aa2903d6217e599fa4.camel@hammerspace.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: hammerspace.com; dkim=none (message not signed)
 header.d=none;hammerspace.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [68.61.232.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57b76744-7f4f-4ad6-9fbd-08d90c143f84
x-ms-traffictypediagnostic: SJ0PR10MB4669:
x-microsoft-antispam-prvs: <SJ0PR10MB466950F4E9A148BE2C681AFD935E9@SJ0PR10MB4669.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sSytVQETae8SzeWJ0hlL/aYA1wiqo87aMdP8rcl7k8pF2mN6wwrW3wRtYPGAwRrNdO36NUBZPrXCoUzpBNc8dTcNjY4wxOQUvV3GV3exZUjV0bqO02i+iYp24X02QZjiVJszxvKYnz89hQ/wtC5qc3mZuVfNmonsFBodEep9n0yOZh/fLSuaLOAVqYr42K5SoWiFfXIfDHBfTfYMMlu58EBun34PJnRO1eT1P7IzAz1t7HVZ6znyOEl6okrGyzNMTNCP8LsiYxkIUCp7lV/gHXNSz9it16Dn6RYlluVleT1dr0qGhye3u9mpiSxuXqwHz9GiL9m7cAp5gjtR95otkFB9nMDEuOWk76IxHOV5oZ4CmQZHl4mXxiYEGrGxdmwl3Hy9f4Hgj2rrJGYxBhIcjzcriSl+bgkJxNJfQbilbsvWADNHMd/XKJA4BKb17QuhzkvyW5w+XQ7kE9ihUx/KWaXEOME9lsaPef8ZQDOuidXFfsa2gMR5TXXpDNMeS/U3nu7aYW+fQC3Z4ol5jqfJ+XjDn8w2KoIP2xeyDNHR023bMvzM5aOH99FdlIbksw9RjpZU6gx9p/K73/RkyZBdBJ7nvjt7TASrOhsXHWvIfBCwouEyQrJ/hK20BGAdF0x2Z1TUFRvLyJo59eV5VBUf7PQu/e2bZdEalOdVrU+HdEZDv1KeMNQ3nB4tFJD4nCDs7MIW2v7VhZuWfonGjGqWKuoV/7ZeYizALwrc9FF5pmE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB4688.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(39860400002)(346002)(136003)(366004)(6506007)(66556008)(66476007)(6512007)(8936002)(2616005)(66446008)(36756003)(2906002)(91956017)(5660300002)(26005)(6486002)(6916009)(966005)(478600001)(4326008)(64756008)(38100700002)(54906003)(53546011)(86362001)(186003)(83380400001)(316002)(8676002)(76116006)(66946007)(122000001)(71200400001)(33656002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ypuWaJo2D0ycEScnBraiUDtpfhh9OXfgfE2nnUxPwI/AFH9g4mTXTZj6I8Mb?=
 =?us-ascii?Q?xHkM0FfTxJL3k34fDEpM2zkrP2BA5OeOhP5d9S6rj2f8Td6mzO0cbk7UjbcD?=
 =?us-ascii?Q?9/MQi6vlMTUfhEdfHlW8tIXzUb9r/72sUAlC4Rs8xE6u2vbNMnTdzQCCc8ZC?=
 =?us-ascii?Q?d1VeKFCc60nH2qKeskKRGfiTEAXzRdex5J3CibaF7njROlp8+SFiuB67VVFt?=
 =?us-ascii?Q?bErGwOmsrp8oLEq0fCsyYRPYlzvm/SVWiGo+IYp/2wiz0NUzIxZFf2zkD54j?=
 =?us-ascii?Q?DWbhXmHcC8qenDaRCv4ZKA2tnc6Qc42sBCX4V+FGnKPNidJnv/X7n1BRsoL3?=
 =?us-ascii?Q?ld8XBlEqOI3EU3YD6WcBuSajaIMDYEusMhyagl7OIiZUNLo/GGVXU7R751oh?=
 =?us-ascii?Q?5WhiJWRU/GYGVW71824i8dcAC/hMD+gImNJmXjpVWTHg0l5QObQSnR1XnDV2?=
 =?us-ascii?Q?AKtmEOkx04fPz5Kw5Xc0Ymr3GoS5bq5gr2mBgB7Q2PQ0uUBuTtgeqj49oyHH?=
 =?us-ascii?Q?aoHxz42NA2nMeJq+nKM4Ph/tND+qtTaWCHsNDdUXxLbPJAlBUqYemhJLhlbV?=
 =?us-ascii?Q?u66K0kHwK9cCdGl2AP2jkmyqQZIx31zLhdnQKB3/2yOOOdws4dTri9mdBWmZ?=
 =?us-ascii?Q?P55IO7zyD2WanjRx0XQLgH7wpLB+Nitp0Hb+vNfhGmldGXXz5v8TIktpj3Rw?=
 =?us-ascii?Q?lE25d0TlQ336sTnAi0SjfoiPFs1EYpKvf9YYUxqVRBctg0bWpqnbrAYumFBP?=
 =?us-ascii?Q?l4Dxgm/MbTG5Gu6rEiSCQjW+VYK1oRegJeushD4AOIN4zKA83LWCuT7rpD8x?=
 =?us-ascii?Q?dt1MrlknHIQcVw+uiBwHx3dm1pG3GG8Hq3JZ/08V1jc5WvKM0ceA8lTFZ+uB?=
 =?us-ascii?Q?hYxIaezuGLqtUHav4zByEm81R3RqUboaj3vtwbkXpefIyl3tkR8o2yR9uaPw?=
 =?us-ascii?Q?9nKpPVjiCz+nwDfTrpuhp3CmFbKa2TjtcY2A01AQ3w6N8Oj8ip9nr9BMw2DC?=
 =?us-ascii?Q?MGqxV6rH8zmDAHbI8+E5stTELw99wju5gUHcIXsvg8zBxtobhfNQH6HjfpIr?=
 =?us-ascii?Q?srTAAvwmnMGZawdYjSEFHuP187ryxezv6s/wcy6jk6So3Fscc24cnv6Hy113?=
 =?us-ascii?Q?tsWW1RZ0SjlT/aZN1mT1llFD4BxfpKR107fEhlIfUl6taHs8XlL9BUukARNE?=
 =?us-ascii?Q?EUlA25U8eOAvlDL8o7eWlGiI9TciodDzOIzy5VibGixedmVD8Djra33oqSUf?=
 =?us-ascii?Q?YUqFJ8lde5V79fjdjQGXlIyQEBYqDo5cUBYwPkxkFrsKF6xwp3x51UCDVfea?=
 =?us-ascii?Q?aJwvuRjbFezC67WT7ALSq3C0?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CAFDDC129EFB1C4FA9406DE2D31E6012@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b76744-7f4f-4ad6-9fbd-08d90c143f84
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 20:12:15.2518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxzgL0fWrep1FQK7ejXt7FLtqLL/oiSeSzwjila3miNpNlB80199aJCC6LgquOM2govuYCKlbrannsyloDjFZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4669
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9970 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104300140
X-Proofpoint-ORIG-GUID: 1hWWymk092CY4wzS1Fz1N_KS_AxBTS9n
X-Proofpoint-GUID: 1hWWymk092CY4wzS1Fz1N_KS_AxBTS9n
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9970 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300140
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Apr 30, 2021, at 3:09 PM, Trond Myklebust <trondmy@hammerspace.com> wr=
ote:
>=20
> On Fri, 2021-04-30 at 18:45 +0000, Chuck Lever III wrote:
>>=20
>>=20
>>> On Apr 30, 2021, at 2:26 PM, coverity-bot <keescook@chromium.org>
>>> wrote:
>>>=20
>>> Hello!
>>>=20
>>> This is an experimental semi-automated report about issues detected
>>> by
>>> Coverity from a scan of next-20210430 as part of the linux-next
>>> scan project:
>>> https://scan.coverity.com/projects/linux-next-weekly-scan
>>>=20
>>> You're getting this email because you were associated with the
>>> identified
>>> lines of code (noted below) that were touched by commits:
>>>=20
>>>  Mon Apr 26 09:27:06 2021 -0400
>>>    9a301cafc861 ("xprtrdma: Move fr_linv_done field to struct
>>> rpcrdma_mr")
>>>=20
>>> Coverity reported the following:
>>>=20
>>> *** CID 1504556:  Null pointer dereferences  (FORWARD_NULL)
>>> /net/sunrpc/xprtrdma/frwr_ops.c: 539 in frwr_unmap_sync()
>>> 533
>>> 534             /* Strong send queue ordering guarantees that when
>>> the
>>> 535              * last WR in the chain completes, all WRs in the
>>> chain
>>> 536              * are complete.
>>> 537              */
>>> 538             last->wr_cqe->done =3D frwr_wc_localinv_wake;
>>> vvv     CID 1504556:  Null pointer dereferences  (FORWARD_NULL)
>>> vvv     Passing null pointer "&mr->mr_linv_done" to
>>> "reinit_completion", which dereferences it.
>>> 539             reinit_completion(&mr->mr_linv_done);
>>> 540
>>> 541             /* Transport disconnect drains the receive CQ
>>> before it
>>> 542              * replaces the QP. The RPC reply handler won't
>>> call us
>>> 543              * unless re_id->qp is a valid pointer.
>>> 544              */
>>>=20
>>> If this is a false positive, please let us know so we can mark it
>>> as
>>> such, or teach the Coverity rules to be smarter.
>>=20
>> Sure, not my proudest moment here.
>>=20
>> The sole call site for frwr_unmap_sync() is this one:
>>=20
>> net/sunrpc/xprtrdma/transport.c:
>> 606         if (unlikely(!list_empty(&req->rl_registered))) {
>> 607                 trace_xprtrdma_mrs_zap(task);
>> 608                 frwr_unmap_sync(rpcx_to_rdmax(rqst->rq_xprt),
>> req);
>> 609         }
>>=20
>> Thus, in the current code base, the while() loop:
>>=20
>> net/sunrpc/xprtrdma/frwr_ops.c:
>> 514         while ((mr =3D rpcrdma_mr_pop(&req->rl_registered))) {
>>=20
>> Should always terminate with mr containing a non-NULL address.
>>=20
>> Seems to me the frwr_unmap_sync() code before fdf5ecb1934b
>> ("xprtrdma: Move fr_linv_done field to struct rpcrdma_mr") has
>> the same risk -- frwr can be NULL if rl_registered is empty.
>>=20
>> I'm open to suggestions for improvement, but I'm not seeing this
>> rise to the level of a pervasive and high impact issue.
>>=20
>=20
> Chuck, I think the point is that you can't ever exit that while() loop
> _unless_ mr =3D=3D NULL. So calling reinit_completion(&mr->mr_linv_done)
> after exiting that loop will indeed Oops.

D'oh.


> So will the call to wait_for_completion(&mr->mr_linv_done).
>=20
> IOW: I think you need to save the last non-NULL value of 'mr' inside
> the loop.

I think following the while() loop with:

   mr =3D container_of(last, struct rpcrdma_mr, mr_invwr);

Might also work.


--
Chuck Lever



