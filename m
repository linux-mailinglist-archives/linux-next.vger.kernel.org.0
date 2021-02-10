Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 517D4316F69
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 20:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbhBJTAL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 14:00:11 -0500
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:3628 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232880AbhBJS61 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 13:58:27 -0500
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11AIhQBU031326;
        Wed, 10 Feb 2021 18:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=WRwaopX88LoaeJgR20aP82WCS1HpIRKTNy2vX3Jmrt4=;
 b=QuCNeVbTI+HdgB8y6RtZy07HOQh2mpvjPSCAZrlMnwO49By9kUaXkCZi3wTSy3gPscCI
 jMq5AS+xKeBhh3kt2q5xmxGPIsghg6Uarnl/lvXsXTE0ul9H8P3HKIi6G6dYi6g2xWku
 J5b3N7oUG7dVGUO0HmvSxBi6DX3rlZ01F+dHMmeghiEbrZZqED/RN/mtfUyR/+fZ2KI6
 lrZ2WIxOpGZOeHf1iCHmmfJDxbb4UC5DJHThe6e6BrwKmMhWWDUPUfCzf4Iw6ISbdza1
 C846yqB6+kNpbEB68M4PJRnm8iXHEcEnwE5TM4ppZh06pB0x6t/12zwYAoKTx14kOb3O tQ== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 36mbdycpbd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 10 Feb 2021 18:57:27 +0000
Received: from G9W9209.americas.hpqcorp.net (g9w9209.houston.hpecorp.net [16.220.66.156])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by g9t5009.houston.hpe.com (Postfix) with ESMTPS id 1E6CF55;
        Wed, 10 Feb 2021 18:57:26 +0000 (UTC)
Received: from G9W9210.americas.hpqcorp.net (2002:10dc:429b::10dc:429b) by
 G9W9209.americas.hpqcorp.net (2002:10dc:429c::10dc:429c) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 10 Feb 2021 18:57:25 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (15.241.52.11) by
 G9W9210.americas.hpqcorp.net (16.220.66.155) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 10 Feb 2021 18:57:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nxPZRpGMpK3aBF8I42uzt400TBQk5lQo1byWrqFhgY5Ts4xjcW6gJ+ul2hmDp6iIpWJ+GXsgBa0n/VpdpcB0CrXvgScdFScRFgMxjqs8vy5Jf6Hu1/d8egJhCmKFHXoUt2m8iMDSftyJ9Vd9N7ME5E0GizNqBuIoxuS94MZ5tYHOMLzfsFeWggLGxzPzNcfcngAzYGjEydn16q4L8EkkrVRFZF4XFu6arrrDR+mY+92fNFA0j+NY/opk5ojkqocwAoRMdAKXNGySbqVtd9c40AfhjYFdvIlgg1d0lTsQ+qAp10GKcyZlpRXhUJif2wkTQL1m9OAnEt0rXmi6EMhBZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRwaopX88LoaeJgR20aP82WCS1HpIRKTNy2vX3Jmrt4=;
 b=YwTiksU+srEYILrhP6iAwx2qWtq1oYTvOht3IpPPUo0JU3MQw/WgClL8S9raYgXowta1wR7HNETlDFdLMeWojtUR9SeGsuTTKZq7UfUgI4xhlAjtgX8bk3k6PHZAeFaKvCqaEYa0Bv/bmBAfkSLCMNNT3yhFfnx09Cjfp9yzlGrbyOvpEGTHwtFwcmFg8mPgOp3kNrxIwFsqrt8OEClQ3NG7hQZD/j338y186vQfjZFxAZFZjQCFwRzATUPheMWGTRBdE3zXc4kFa0yD884jZLexmKHCxQrl8cYte9oWEk9EwD5Kxbm16ZZZiecCnF4X8MIWIzau+TPeSsF4586YAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:750c::21) by CS1PR8401MB0357.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7514::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Wed, 10 Feb
 2021 18:57:24 +0000
Received: from CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d9c0:54c9:95da:29d8]) by CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::d9c0:54c9:95da:29d8%5]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 18:57:24 +0000
From:   "Pearson, Robert B" <robert.pearson2@hpe.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Jason Gunthorpe <jgg@mellanox.com>
CC:     Bob Pearson <rpearsonhpe@gmail.com>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Martin Wilck <mwilck@suse.com>
Subject: RE: linux-next: manual merge of the rdma tree with Linus' tree
Thread-Topic: linux-next: manual merge of the rdma tree with Linus' tree
Thread-Index: AQHW/1Kql+xQKgMgsUyVf/ppryA44KpRvYUA
Date:   Wed, 10 Feb 2021 18:57:24 +0000
Message-ID: <CS1PR8401MB0821C1E95BE58300FF3B87C8BC8D9@CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM>
References: <20210210131542.215ea67c@canb.auug.org.au>
In-Reply-To: <20210210131542.215ea67c@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [2603:8081:140c:1a00:d91e:2a27:9ee5:7083]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 99a9e594-4d8e-48a3-8207-08d8cdf5b451
x-ms-traffictypediagnostic: CS1PR8401MB0357:
x-microsoft-antispam-prvs: <CS1PR8401MB0357E65A9304A4B968431FDABC8D9@CS1PR8401MB0357.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U2psn7PfDHXD83NxkXW7WDO+L+8H8RfOOXQ74z3g/OspFAobWvBsoKeSVPHtnhpL4wen2yW7SftMXB7P/YOH0i6kqhVbScT0BgfjufhN/0SyYW7gKcZi1MFIsi7I9T99lE+FI0g0gSBfl9fRp82oofT7MDBDNGUUU6xyCPInfUFm14AERbDrZBlcOQ9eQL/HvkJogjA2rrdBRt5UKUOJbET13ee5jSaxnLeE0WQ2vZlupS1jJwBteoCSDh5tZjZphoW482AeQB8vP+YX/X6VdjCWGZ000YLYefvAbE50Do202KbBE92Sf6s9DzgZC6rS5F+I/nS/XqUuDiIgIkSY0AkZRZsu9L4CeoSzXzx7bFAGpkTq+4SayRV7AUPx1j0rtoafrl3Y4BrFEbwIZabC23/wtYhFGwgUdyzdcFXzhjqT6nqBzYOwzMLaQtZTnKAvBeTpuQ5ahyhTCx4hLBs4k5Cj5DFPW3nAJ96AQBYDPy4aMG4i3ogigo81bbwRhM0tRCnzxlpmglTWvD+jcfpWmg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(396003)(366004)(39860400002)(53546011)(4326008)(6506007)(7696005)(33656002)(8676002)(478600001)(71200400001)(83380400001)(52536014)(186003)(316002)(54906003)(86362001)(110136005)(66446008)(64756008)(66556008)(9686003)(66476007)(5660300002)(76116006)(66946007)(55016002)(8936002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?UI+v6aOBimWnccrXBLPrLzP2fe3fNYs6AJAR6cAkNy1xpAfVd6ebemzLMvR/?=
 =?us-ascii?Q?wULF2VRnjK7KL7cWFQCHzun7iUMjQfAD4+HCV8MNS80bxMn9c1kb9zhB9IMp?=
 =?us-ascii?Q?33c/UwxI72RYX99+KW8x1Jd9g1yQ0nWaT7c7xE9cXRI77faBPSJzqs2E2NEC?=
 =?us-ascii?Q?nvsIBaRrZKPtUleqpB9S+LzGIPiP54/pN+g5dm4nxja+r12PhFmY2Rw1pFiA?=
 =?us-ascii?Q?NNhbklWhORokuwr/FR0CYbbOuCPmqgBOl9R06lMiIBXZGLcxVB45TmEasfxx?=
 =?us-ascii?Q?SXTpXva8DjEsZwlTWaHumMSeGmhy3n5+GaiIkOD5KxX+2dyV14E4GJtITQmY?=
 =?us-ascii?Q?yGvHNxtA2DEg+6JzmVq9ZNCsxgH1g1pDJoKqYaXOaizqGZWngDnZMPyOgtWN?=
 =?us-ascii?Q?JXnlUUiqzxA9pAu8H6jwfejbYjFwBwqGclvcJYKYNU8QYCnlgEUQgGxxvOMt?=
 =?us-ascii?Q?1cXMrVROL8VLTUXmNLQ/XAse3AivHhUE3CeCI4Fwv4+2xwBqi8EX4rnseQez?=
 =?us-ascii?Q?6TqFaJ1DakDbIlgCcFnKK/IYf9fex+pC+7b8WsTA4K8LqruOSsyqlrMCBCTv?=
 =?us-ascii?Q?ZJd0MSYa8lQ+exAot4g8OnVsrUvwImYCaHbhrGfW0F6i2f9L6XOBFY1Yvysv?=
 =?us-ascii?Q?bl6flzMts6PiCuVUk6/Qu/d3ezrbQHC0cw2Bzh/0Fl5vq+DrMxsjBEZGRfNP?=
 =?us-ascii?Q?rBvTNE0pz8by0T5IIH+zquPLCU3iTiRFYT1JxnzEMSD9cFQh6pCYBl/ALVgo?=
 =?us-ascii?Q?97gK/+3f3oZGITZoA/e+AJc4+qgRHfdcJd5dIjKnrPw6FXV1qpMPhJ/cMY8x?=
 =?us-ascii?Q?QXh30jqWE91/yBrHde7LOC2/nJ0Xl/NjAkDSaXRfqrlgoHSIPGLe1/24Lb8t?=
 =?us-ascii?Q?IboIBTRieJu96aPk/QTd+gydDKpVVtYW7e/bHf+nl/OpQH9pilpSZp2Pol+m?=
 =?us-ascii?Q?SeLkH27zdpcmZR1kdyU7Yn36FkLvhUboRnr7u0ilZEMudwCq9eFJeFpdrriC?=
 =?us-ascii?Q?VkaPOyHeLanZs/Wb4TBo2oQTAjoLzzmLFrRs7LKWSdR8U3+x9oIdaAOPCSye?=
 =?us-ascii?Q?0lEE0cXdO29s9IuOwKJkm0Qc/8UKptHwEJ62yQ/zBgJ2Mvu/rtYF/bCo5mIg?=
 =?us-ascii?Q?HU1ptpgE17VLkFIiF01+qxQsOg4ViDYEVMj/VW6VfcWs+J7EeQzdmNJ5CaIR?=
 =?us-ascii?Q?Zlb9W6qUeNOGOjLGlBsK5sOYJKJnKbUdAHm9wb7I3ADC1nhBAEfOWppmxiME?=
 =?us-ascii?Q?AmeCpeglIQZ556h2X1IyuQD1EhnZwCtHKSJ5uyc2Cph8HE1G4Il79u6qVLiH?=
 =?us-ascii?Q?nwuJi/S6P6EWiwi6cdytOh/9sCKT8VEoYRk7qGUG91EapHKRv5mSZNaoZEJT?=
 =?us-ascii?Q?gmoXp2pSd9CIY/Pqt5p8iBQtPmip?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB0821.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a9e594-4d8e-48a3-8207-08d8cdf5b451
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 18:57:24.8067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VI2DMRpzxysAv5LBNdetD+fMYk6fWosXnkePZbuauyXbjIQRA2mVjN3FoR6Yo1E0A2GO3mKd7lg0PSk+Qrq4kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB0357
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-10_08:2021-02-10,2021-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102100168
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

It looks like f1b0a8ea9f12 ("Revert "RDMA/rxe: Remove VLAN code leftovers f=
rom RXE"") has not been applied to rdma for-next which is where I do my wor=
k. Not sure how it got upstream.

bob

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>=20
Sent: Tuesday, February 9, 2021 8:16 PM
To: Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@mellanox.com>
Cc: Pearson, Robert B <robert.pearson2@hpe.com>; Bob Pearson <rpearsonhpe@g=
mail.com>; Jason Gunthorpe <jgg@nvidia.com>; Jason Gunthorpe <jgg@ziepe.ca>=
; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mail=
ing List <linux-next@vger.kernel.org>; Martin Wilck <mwilck@suse.com>
Subject: linux-next: manual merge of the rdma tree with Linus' tree

Hi all,

Today's linux-next merge of the rdma tree got a conflict in:

  drivers/infiniband/sw/rxe/rxe_net.c

between commit:

  f1b0a8ea9f12 ("Revert "RDMA/rxe: Remove VLAN code leftovers from RXE"")

from Linus' tree and commit:

  899aba891cab ("RDMA/rxe: Fix FIXME in rxe_udp_encap_recv()")

from the rdma tree.

I fixed it up (see below) and can carry the fix as necessary. This is now f=
ixed as far as linux-next is concerned, but any non trivial conflicts shoul=
d be mentioned to your upstream maintainer when your tree is submitted for =
merging.  You may also want to consider cooperating with the maintainer of =
the conflicting tree to minimise any particularly complex conflicts.

--
Cheers,
Stephen Rothwell

diff --cc drivers/infiniband/sw/rxe/rxe_net.c
index 943914c2a50c,36d56163afac..000000000000
--- a/drivers/infiniband/sw/rxe/rxe_net.c
+++ b/drivers/infiniband/sw/rxe/rxe_net.c
@@@ -153,15 -152,14 +153,19 @@@ static struct dst_entry *rxe_find_route
  static int rxe_udp_encap_recv(struct sock *sk, struct sk_buff *skb)
  {
  	struct udphdr *udph;
+ 	struct rxe_dev *rxe;
  	struct net_device *ndev =3D skb->dev;
 +	struct net_device *rdev =3D ndev;
- 	struct rxe_dev *rxe =3D rxe_get_dev_from_net(ndev);
  	struct rxe_pkt_info *pkt =3D SKB_TO_PKT(skb);
 =20
+ 	/* takes a reference on rxe->ib_dev
+ 	 * drop when skb is freed
+ 	 */
+ 	rxe =3D rxe_get_dev_from_net(ndev);
 +	if (!rxe && is_vlan_dev(rdev)) {
 +		rdev =3D vlan_dev_real_dev(ndev);
 +		rxe =3D rxe_get_dev_from_net(rdev);
 +	}
  	if (!rxe)
  		goto drop;
 =20
