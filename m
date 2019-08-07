Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4167484EEA
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 16:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387928AbfHGOjV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 10:39:21 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:19896 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388190AbfHGOjV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 10:39:21 -0400
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x77EY2PG007767;
        Wed, 7 Aug 2019 07:39:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=CZLCIXm0lzKIapCSMcVoxQb6gZk0W1dxHHjKD0Lsor0=;
 b=JHfd9vMP8yMy6ABhpYAKIhqwk4O8mPmPIGUQ2pmtVXcTFbz90AXo7De2GNy0eNTjauU/
 o7T012A2n3vlu74BxbuIB3Mhml4v04EsamzlTn3JImqEUp4mnimSgckCntZvpDRYWQP1
 yNYEgdebIs/LIdeXdSp4JNeMXqOvZKDMoTE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 2u7y8b8ax0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 07 Aug 2019 07:39:10 -0700
Received: from ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Aug 2019 07:39:09 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 7 Aug 2019 07:39:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ok4xqSEBEAgBmHyNvZSMNcfKljrMhWqr3tZaqakbuDWqRrcQrUwh5DHVXmdCnluxeLpylPrn7uNaT8+i9MsZoXdg8taXBijaLdH6WP4ur5TCb2eI+fM9Xed0uqIwY7O+lLQxu5JWhrUTzMUBgCiWJvVNHwZ6OOPkzu3T3jtd+BuJmLLD7h30uKRZyle2yG6jq8VPGn72CCnHDmktpWE/gVMd84mHDCuaLrS+xJg4Ubia6+JvR2uqap9KgYGfrZDbokdHMUycRoukRdbKmNO+FPcqIocUh5hfKC0Ju73sFjd+LMdWYeJQU4XpQ66Y/dvcOnhR3tqlL8Rpy8FQjb3DsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZLCIXm0lzKIapCSMcVoxQb6gZk0W1dxHHjKD0Lsor0=;
 b=Htv079Gdu5HHgrFSKc3JzLIctWQyRuszfsLofzIcw1cv5whF3mCLk7wFndQemWcLsYm5FI3zUPaQNWSOkUiIf9/wW0qu9mvWnCAEK6LDpPWoW2Cr5IQK2XAh7Gx3bzLCuTGIe9c13gnOKn5MAlcMQznWAkIX/AP9Z0FPtI8Y1nMrh2Khs+yItgTIjuqfUyjdiPgvogsnVpp7gPFi5LmTw5JpE1Flkpz3Aom0ZSa5MW4kdeSMadYjXJS9NjsYMUQ/LTZzboItbpmOxQXLEhZ4rzSLfJgxvrw6RZnzt5klmjx89CS4T/qvYlLRZ3lB3nmTLQPMEZP+crshQeFQdSActA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZLCIXm0lzKIapCSMcVoxQb6gZk0W1dxHHjKD0Lsor0=;
 b=NQQ3zu7lQdPsev7sfwklnnIc9kU0QfoSLUL2CsjIdTndr/pQCGPhBb0vBfZXYLJEtVHddKf/aAKrXYZptUwoQJRQ+Rq9sqHGlluKKhx+T9uqh8QfepDXoW9beH6fuq3U97Ih4xH8GmjCdnoVLBUQYawNpEwyNihup3lU8DUZcHk=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
 MWHPR15MB1519.namprd15.prod.outlook.com (10.173.234.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Wed, 7 Aug 2019 14:39:07 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::79c8:442d:b528:802d]) by MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::79c8:442d:b528:802d%9]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 14:39:07 +0000
From:   Song Liu <songliubraving@fb.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Thread-Topic: linux-next: build failure after merge of the akpm-current tree
Thread-Index: AQHVTPFGz58J8esAUk2Rc5LSbmvQQabvwdgA
Date:   Wed, 7 Aug 2019 14:39:07 +0000
Message-ID: <36F5AB83-D816-45D4-BDBB-2D9E1B713AB3@fb.com>
References: <20190807172454.2e887f7c@canb.auug.org.au>
In-Reply-To: <20190807172454.2e887f7c@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-originating-ip: [2620:10d:c090:180::3b47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 211abc35-fee2-43b8-075f-08d71b4500ec
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR15MB1519;
x-ms-traffictypediagnostic: MWHPR15MB1519:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MWHPR15MB1519109646F9A3925B9FC59DB3D40@MWHPR15MB1519.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(346002)(396003)(376002)(136003)(39860400002)(189003)(199004)(53754006)(51914003)(66476007)(186003)(5660300002)(76176011)(316002)(53936002)(46003)(71200400001)(71190400001)(6486002)(305945005)(478600001)(81166006)(81156014)(7736002)(25786009)(99286004)(6306002)(6916009)(66556008)(486006)(66446008)(64756008)(33656002)(6436002)(53546011)(11346002)(6506007)(446003)(2616005)(476003)(76116006)(6512007)(66946007)(54906003)(86362001)(966005)(14454004)(229853002)(57306001)(256004)(6116002)(102836004)(4326008)(68736007)(2906002)(8676002)(36756003)(8936002)(6246003)(50226002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR15MB1519;H:MWHPR15MB1165.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mYW/Azy4LzhZPR0XKRMcDIzund50DsZ5gY3gPKMiK+oaqJEMUCLGc/y0XyQOwbwnnoGQTVA2sXi7HuRAOJ74WlBTliulZ6Yuos/L/A2Flg8uSeQDE8CRBJIcJOKM/d/qx88rvnwQ9bIw1MCAgVCPV/rZN9E4FV2Ou5FaFkXTNtzDJAMuE1Ohle+UKBe72vI2x9/nqVcIA7PjpHUPRGlhElEqB3lhdsKJDy7Ys7ncx2AENodSyQhOTUWPtA1HdXRcHm/xlzk1YHG8me5W3MrseSsmullq0H7Ce6SP3tgkvy/mNwEaPPyP6Plh29swWfitjlIrHtPGchBoD4hd6ARfoN6kVqBn7n3NX3imzY98CH8deoFcPAfEroiaP3uccd+6DhpWBuLP61uM1I1RDOoIFpzf2mPmuKP166HdN7HqKL0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <002F3BD9B3A3B14488CD43D10B7EAB25@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 211abc35-fee2-43b8-075f-08d71b4500ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 14:39:07.7066
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: songliubraving@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1519
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-07_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070156
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,=20

> On Aug 7, 2019, at 12:24 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:
>=20
> Hi all,
>=20
> After merging the akpm-current tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> In file included from include/linux/kernel.h:11,
>                 from kernel/events/uprobes.c:12:
> kernel/events/uprobes.c: In function 'uprobe_write_opcode':
> include/linux/compiler.h:350:38: error: call to '__compiletime_assert_557=
' declared with attribute error: BUILD_BUG failed
>  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>                                      ^
> include/linux/compiler.h:331:4: note: in definition of macro '__compileti=
me_assert'
>    prefix ## suffix();    \
>    ^~~~~~
> include/linux/compiler.h:350:2: note: in expansion of macro '_compiletime=
_assert'
>  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
>  ^~~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime=
_assert'
> #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>                                     ^~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_O=
N_MSG'
> #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>                     ^~~~~~~~~~~~~~~~
> include/linux/huge_mm.h:272:27: note: in expansion of macro 'BUILD_BUG'
> #define HPAGE_PMD_MASK ({ BUILD_BUG(); 0; })
>                           ^~~~~~~~~
> kernel/events/uprobes.c:557:39: note: in expansion of macro 'HPAGE_PMD_MA=
SK'
>   collapse_pte_mapped_thp(mm, vaddr & HPAGE_PMD_MASK);
>                                       ^~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>  9cc0b998b380 ("uprobe: collapse THP pmd after removing all uprobes")
>=20
> I have reverted that commit for today.

Thanks for the heads-up.=20

This looks like v3 of the patchset. I have fixed this issue in v4:

https://lkml.org/lkml/2019/8/2/1587
https://lkml.org/lkml/2019/8/2/1588
https://lkml.org/lkml/2019/8/2/1589

Is this sufficient? Or shall I submit fixes on top of v3?

Thanks,
Song



