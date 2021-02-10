Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528C53172F6
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 23:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233454AbhBJWJv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 17:09:51 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:11200 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233385AbhBJWJj (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 17:09:39 -0500
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11AM7w1N008593;
        Wed, 10 Feb 2021 22:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=DP5nvxYm4Pxnun+f2JP9F85KxB0swgZ8ZvJOlQGfTy4=;
 b=h55ogp/fEjboap1uI5VJlGd2mB/ay0G9fOYL3TuXM314YudwQTBGIh/h3P03PLBgBW4y
 eo9tpi+Umb1fU6DvGfnmasatlDA1oa4Fkgr5o+KbfWdGUIm7LhuEejG2eLGjEQr7wJns
 lc1+4B78CWjhi7+EpV1CdQdAyjFz2KcL96LWwr+ld1c7Sm4SDR8CqmsV/InaE2qB9dpm
 /L7tMC/ZZ/vTNcFAz7vnqcQiy4L2p8Y7pSvkAD8FSfm4GVfSp/leZq84C7fcGkyGptz1
 UBbTxAkIYXVDnPgUNXuXID2X+7vDRBX8BaBg27if078RYqWO4H092jphQzkV0hDvUGxk rQ== 
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
        by mx0b-002e3701.pphosted.com with ESMTP id 36mbbq6097-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Feb 2021 22:08:43 +0000
Received: from G2W6311.americas.hpqcorp.net (g2w6311.austin.hp.com [16.197.64.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by g2t2352.austin.hpe.com (Postfix) with ESMTPS id 2AD4EB1;
        Wed, 10 Feb 2021 22:08:42 +0000 (UTC)
Received: from G4W9334.americas.hpqcorp.net (16.208.32.120) by
 G2W6311.americas.hpqcorp.net (16.197.64.53) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 10 Feb 2021 22:08:42 +0000
Received: from G9W9210.americas.hpqcorp.net (2002:10dc:429b::10dc:429b) by
 G4W9334.americas.hpqcorp.net (2002:10d0:2078::10d0:2078) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 10 Feb 2021 22:08:41 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.241.52.13) by
 G9W9210.americas.hpqcorp.net (16.220.66.155) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 10 Feb 2021 22:08:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ie33JIc9FMw9hecyKBbhboJGzngfpc1REE6CMvq7DwjgJ6MbawrxxdXPoqJTTVV0NWZuXC4K+69HtfaNMX+37o7p+us8rrtPkARW7i4UEIaLu6kiXbx3CaFk/jcrYtAZcKn+SCi+4ha5BhN2AAUKYL1mbFd9xaFxZpB5She175BzwgzUWsp6CXHrSSxbiPugR0QBvSN/EyiRU7EH/c468pciwCJIPniymwgMhK6ejYUdFkWCQf0fTRl+yYOF9PbK67rnBv3RPceNo4tCmGn2krstylr4aJA9e+v2kd+PIw1uGJVpGqdMWRkA91kAmcMqVhDOYTT4TecTJ6gTgdUotA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DP5nvxYm4Pxnun+f2JP9F85KxB0swgZ8ZvJOlQGfTy4=;
 b=XyQE1TRWy7XVbQhsN5kcyfAFQfyFpO4KmmBbstVkyEu9+EIJmFPezAWHa5hJIl6ZHtkzvOZrxs5I2imazpxqK3O94oa43WZXiRRIxwVDsGeFNMKjPct0cqsrRsggDnbnkq2LzUufGkrN9rz1io/e/aBv2Lbf/MvfzBri96MCVrk8UmITLViO0KxlXTNruvdUH/P8LpHDv/eA+EwpCLrCa73QyZFFDfW9hxeOQWRpqQW/QAZWwuEQIAVWhrWSiSQwpaRWgtLy9f8f6ADdQuSs+CaRp46NhvHZ7LY85iQxwWtzhVLs7LvR642Mjovo7a3QKlELLbQlQ8BbcK6uikO6xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:750c::21) by CS1PR8401MB0389.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7513::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Wed, 10 Feb
 2021 22:08:40 +0000
Received: from CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d9c0:54c9:95da:29d8]) by CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d9c0:54c9:95da:29d8%5]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 22:08:40 +0000
From:   "Pearson, Robert B" <robert.pearson2@hpe.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Bob Pearson <rpearsonhpe@gmail.com>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Wilck <mwilck@suse.com>
Subject: RE: linux-next: manual merge of the rdma tree with Linus' tree
Thread-Topic: linux-next: manual merge of the rdma tree with Linus' tree
Thread-Index: AQHW/1Kql+xQKgMgsUyVf/ppryA44KpRvYUAgAActYCAABmh4A==
Date:   Wed, 10 Feb 2021 22:08:40 +0000
Message-ID: <CS1PR8401MB082107284644BFF6894DCF2EBC8D9@CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM>
References: <20210210131542.215ea67c@canb.auug.org.au>
 <CS1PR8401MB0821C1E95BE58300FF3B87C8BC8D9@CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM>
 <20210210203641.GG4247@nvidia.com>
In-Reply-To: <20210210203641.GG4247@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [2603:8081:140c:1a00:d91e:2a27:9ee5:7083]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e75cac80-b788-4d93-e8be-08d8ce106c4c
x-ms-traffictypediagnostic: CS1PR8401MB0389:
x-microsoft-antispam-prvs: <CS1PR8401MB0389FD62BE63837F4F245CF7BC8D9@CS1PR8401MB0389.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9H5R560LVGbGqHrItBPpshzsgnRp+oLLWJp9do/Hnl1VdM2us8VRzOWaz4+KeJNZLHAX6EfF1g0sjsopVNtscgInlCrmvhVRjV8QSUt2175j1Zc9806joMHPCSHFWTFFzBiJZfxeyWvSOBAWaqon0aXHiDLOZqEEs0CAKDpz9NSWby5v8l/zswpkFU8SU7SBPARS1kvshMb6cFjKX8oXpulA1ffgJay27W68p1XHxuXcFnoYU6Ea15QZLM8FZlq/DE30zWc/Y1oqgbhrtkxqsWe4ECY28aGm9GXjBezrbGAWTtu/eWLg95hupZsgHoIQZcD74ejIOs8RWPqiie+E33O/6GjzZizFaRZC6u/l50n/O403bQ9OcNLlijRG5QbDvjY5g+DMS+U2pjvbxcE8/vY/3kSUIwBaNbogV9hKoICr1Oj94tsgNJMwT6YO0rsq9icJLsYveGn+DA6+Yu/EENpTC6g2aFgPythU5DaHWUIXtrEh2+DH7ySxmaclVL98xow8PBPjMx4Nqbkl7Ls1hw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(39860400002)(366004)(376002)(52536014)(186003)(5660300002)(7696005)(316002)(54906003)(6916009)(8676002)(71200400001)(55016002)(9686003)(76116006)(86362001)(478600001)(6506007)(2906002)(4326008)(64756008)(66446008)(53546011)(83380400001)(66946007)(66476007)(33656002)(66556008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?sKUwq8Cs33VqLwzOakNg8NGDrWOAi6JB2ZbaLFjEuQLg6yfg8WCMb+B12u/g?=
 =?us-ascii?Q?owsrWIdUJ8gIhD80SbkNbfUR1kCTsBQ7Yl3sg8NrOqUtm9W0vLZfyRoE8PGP?=
 =?us-ascii?Q?USHpTSm3TsmMDP2vobHlhyYb6yod0veSa5fXggj8W+jg9UtJY16IUzuOZM1L?=
 =?us-ascii?Q?bCK/GfroyDs3BjNpvVRm5933NGMcvnvYkRECpQftmnCk9YojqPv3IwdJBzHh?=
 =?us-ascii?Q?D/UDTZoPA2rgrr/fa0HPbE8i3I55so/EXo5hqXaTpXYFNqKpmJtApM1YiP9L?=
 =?us-ascii?Q?Htqr7OP62JjDdyaYPlnr5/CEkawxRgnzs+nEaJEjAdkYBKKeCVER3/KTZBXn?=
 =?us-ascii?Q?1hayMxX/PAOYNWdLnZwmYR8GOYOpsfFdOHFT9iXjiYftrTG8sFov3dokfH0D?=
 =?us-ascii?Q?MiNm32cpIO3SBFrxu5slqovn/bTpV4Xnj5cYV2Pjk3rPEft9JKwRTa/UzZH0?=
 =?us-ascii?Q?p3QEE4lF2YeaVnpInQguydiVAvnJKQ9glwHzKJms8liU+hiE3KeqZZHjSzsq?=
 =?us-ascii?Q?GNDNXWHwYtK+G0eFWrbYlW7EAr0xH/g2W0y8yYSkUo6wPAIEC3mYQ+e+dIPC?=
 =?us-ascii?Q?METfVMkd4ucTvMAS7ffvcs8i/GCcBvAK22r2DUSyOZaVigxdr2Akfl1ww6ty?=
 =?us-ascii?Q?zj1aqavMZaKAB3nlq2IZJE27q6i9GY+GFX3pcFSwKBUsSgelrLkdkdLoC2oO?=
 =?us-ascii?Q?rb9sPlYtEXvZ8wRF+DLpJI0fXygNAc0HfpawUze+STXfwxQWXErsxIE5SK45?=
 =?us-ascii?Q?aaiXzfRMuaCq8lFKscjhCerOl9ijNNTbP3tOBhvcS1vCdm3pC+fV4Xs1U/AE?=
 =?us-ascii?Q?DSBJ/blJWVv4Ns8my5mIs7s/d0OkUCMW6lWCJdygyVKqYgjTMLS/EgngDaFE?=
 =?us-ascii?Q?EdAkEGfK860uCZz09eJYjbr0wMfMu9VphppQ9/xymVKEgMGXtBLx4Z/Ln6DK?=
 =?us-ascii?Q?2ZZKzaOhk9FNBG3gsbhI4fC1gJqM1ojZix2T8FAxq+Xnq8YZwNdVyBZDRnkW?=
 =?us-ascii?Q?xxDCaVIj8G1VEyBM5gTmIQglIonlMzroA5S8O9YqfjKas25CJY+DRZioWuIh?=
 =?us-ascii?Q?QI/sr9LQQfJ8n1Qz6Wog/wUO8OGugdEbh91/BZMM2HytkT7SNcMTYOyiVKqc?=
 =?us-ascii?Q?D8XQG3d7JBIMQ/SXvIiB2dVOCudTW4hclLhPEhM2PYjXhzwbUHfnfHJVO5IL?=
 =?us-ascii?Q?qrINgO/Ag0KMFSiXPPEwzc7JUt7Mmue3PtaO01EpdLDGgA9ePFeBnp6qru92?=
 =?us-ascii?Q?ofvXsbKKiQk91JyW49YHm73NNlO5eSChZkk0mJYDPRlyN8ow16J0jXjf/POR?=
 =?us-ascii?Q?G7KCHDrfX+3brxczSkvZZvY6zhuVq8CTuMM1vg5YyoH0IwPnJpEY6tq7a2Pc?=
 =?us-ascii?Q?bVlx3QnQXe6cUNXsFgwMVY3rs7N/?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e75cac80-b788-4d93-e8be-08d8ce106c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 22:08:40.4083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 54H2jNa2LY/AkPXcv1UHhzCJC+HC0H/u8fP3V56pmmMpgSbcr17OzhXz7RHc08tsbSNWJ+7UAmtscvC3ezaLIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0389
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-10_11:2021-02-10,2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102100192
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Looks perfect. Thanks.

-----Original Message-----
From: Jason Gunthorpe <jgg@nvidia.com>=20
Sent: Wednesday, February 10, 2021 2:37 PM
To: Pearson, Robert B <robert.pearson2@hpe.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>; Doug Ledford <dledford@redhat.=
com>; Bob Pearson <rpearsonhpe@gmail.com>; Linux Kernel Mailing List <linux=
-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.o=
rg>; Martin Wilck <mwilck@suse.com>
Subject: Re: linux-next: manual merge of the rdma tree with Linus' tree

On Wed, Feb 10, 2021 at 06:57:24PM +0000, Pearson, Robert B wrote:

> It looks like f1b0a8ea9f12 ("Revert "RDMA/rxe: Remove VLAN code=20
> leftovers from RXE"") has not been applied to rdma for-next which is=20
> where I do my work. Not sure how it got upstream.

It was sent to the rc tree, don't worry this is stuff I fix up.

Stephen's note is to help ensure it is fixed properly, does the change look=
 OK? It looks like this when applied (I changed Stephen's slightly)

static int rxe_udp_encap_recv(struct sock *sk, struct sk_buff *skb) {
	struct udphdr *udph;
	struct rxe_dev *rxe;
	struct net_device *ndev =3D skb->dev;
	struct rxe_pkt_info *pkt =3D SKB_TO_PKT(skb);

	/* takes a reference on rxe->ib_dev
	 * drop when skb is freed
	 */
	rxe =3D rxe_get_dev_from_net(ndev);
	if (!rxe && is_vlan_dev(rdev))
		rxe =3D rxe_get_dev_from_net(vlan_dev_real_dev(ndev));
	if (!rxe)
		goto drop;

Jason
