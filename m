Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1EC58558D
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 00:13:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729344AbfHGWN5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 18:13:57 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:42714 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727213AbfHGWN4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 18:13:56 -0400
Received: from pps.filterd (m0044008.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x77MDfc4024749;
        Wed, 7 Aug 2019 15:13:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=b+mkcmAMK+p1QmNiXe4tnWB1Z/QmxzsGmdN8OtVzb/8=;
 b=E34fzmjvKB9C85vVF3XU/TsW3fyvBJT4qHOWk9rkL+o6O6mK3dVdR49ceoBgNf3JzERO
 rqFFazJOv0hGdKtuQHYGoFcEyBdmno79VH+LmM9RqEL5kyUDY/Mrf8FHPsDQVHrzoJqm
 ImIRPdR+hVwNKcsMwhaV6LcZiRobMU2U+u8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 2u868s8745-4
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 07 Aug 2019 15:13:42 -0700
Received: from ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) by
 ash-exhub201.TheFacebook.com (2620:10d:c0a8:83::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Aug 2019 15:13:35 -0700
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 7 Aug 2019 15:13:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LY7JYw5kyjFYF+4p1Fg+Kcb35/avXpFTWoG4MuYx3NH1iehTtjJxgqZQnv2C8F4jgIYyvPzozijD6ho42dY8vHuFh0hi0ywTkp7UVfSmo0Ka4nnYvjIB0CgvOrKKkM2TvysDqdaj3l79I+Sa0AS03dRR6rExxcIj54icvXT/KXlON5BOMbpAnOl+9GegaRHyCdgwHFxUS19cEI4SzKxazRcPFYY36evFcc9r2+3J22xm8Si8HE5CoRbNcaAI6j/fOnSaiTCrZ3aDefS9NPSk48Aeci6+g4ppslm2I5hUrh+FcdFNqUVE6a7Fo2E6kNnprikNa5ak9KwmTPEgThchgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+mkcmAMK+p1QmNiXe4tnWB1Z/QmxzsGmdN8OtVzb/8=;
 b=feuycNk7tOHbOdQcLp7Etxhlvg2t+x5aVcyqDiEwQPzREfi++pfI3/LBh8CMZF7VR2JJoxxWW07U1eaaQPZZZXOkSH90+fcv8+Vokuk+zTwKgYEU2yRoJeJ2o0K09rJp5G9z0ty3PZl8aop11XcLY4Y3QveRMu8pnOUuK7ztae6E6dKpVJKbgS6NehFdPP2rZks6GwBN7nVSek42Os/OdMpprEdldUa4YvD4i5/8DzvPzemzrdB/RP+yyaGJCe3urjatQITWODSrg2IpMD+ZNPQz94he9NG2w3FJfDQbdG4HH9rCs1edt5GlPLBkf5BybBjntIRI68uUxgbeQREEKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+mkcmAMK+p1QmNiXe4tnWB1Z/QmxzsGmdN8OtVzb/8=;
 b=Ptv6DaxzKvOwL93AElYh5wE5J40UF9yxXOIN8Se0GDaBkOUwWuxwU7eSvwVimr6NY7dJos1jUW+kMBSsyEreQmoRQn/d4mC5BTynIP5FoMwHOSwRxVpm9MIrf4Tk8LUGlYgTnewarn4tKSFNtok20bDssGrd111qtVnwIave/SA=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
 MWHPR15MB1821.namprd15.prod.outlook.com (10.174.255.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Wed, 7 Aug 2019 22:13:34 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::79c8:442d:b528:802d]) by MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::79c8:442d:b528:802d%9]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 22:13:34 +0000
From:   Song Liu <songliubraving@fb.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
Subject: Re: linux-next: Tree for Aug 7 (mm/khugepaged.c)
Thread-Topic: linux-next: Tree for Aug 7 (mm/khugepaged.c)
Thread-Index: AQHVTTJXJMBKk+9UcEyVbeuM3CTH0abv6HuAgAA1cYCAAA3aAIAAB8iAgAAMwIA=
Date:   Wed, 7 Aug 2019 22:13:33 +0000
Message-ID: <4CB11692-DD66-4381-91DC-709C9B812B33@fb.com>
References: <20190807183606.372ca1a4@canb.auug.org.au>
 <c18b2828-cdf3-5248-609f-d89a24f558d1@infradead.org>
 <DCC6982B-17EF-4143-8CE8-9D0EC28FA06B@fb.com>
 <20190807131029.f7f191aaeeb88cc435c6306f@linux-foundation.org>
 <BB7412DE-A88E-41A4-9796-5ECEADE31571@fb.com>
 <20190807142755.8211d58d5ecec8082587b073@linux-foundation.org>
In-Reply-To: <20190807142755.8211d58d5ecec8082587b073@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-originating-ip: [2620:10d:c090:200::3:1a00]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0da180da-3d9c-40b5-f43f-08d71b847ce8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR15MB1821;
x-ms-traffictypediagnostic: MWHPR15MB1821:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MWHPR15MB1821D2F3C1931BE86844E473B3D40@MWHPR15MB1821.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(366004)(346002)(376002)(39860400002)(396003)(189003)(199004)(2616005)(476003)(486006)(71200400001)(71190400001)(99286004)(11346002)(446003)(46003)(33656002)(256004)(57306001)(186003)(36756003)(8936002)(76116006)(50226002)(25786009)(478600001)(5660300002)(6512007)(6246003)(6306002)(6436002)(229853002)(66556008)(53936002)(66476007)(8676002)(6486002)(81156014)(66946007)(64756008)(81166006)(86362001)(4326008)(66446008)(2906002)(14454004)(102836004)(316002)(53546011)(6506007)(6916009)(54906003)(76176011)(966005)(6116002)(305945005)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR15MB1821;H:MWHPR15MB1165.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1ZXJnI8r19hibBQ/Mfai1v1SaCm23NJ4/r+Hu8pIs+7NtOY3jkvk5OwW1fsHBa+4QwGVJ/nFtaTBbJ1ceqM36dNCmJJW87cTcSuZVFbcOZShHfa+zKBYZnllSC99Zakr19nr09aKMhxFm3dtutqlrfVwobQl03xbqMAd0RzlQ3l7Ta9hheDasOkkhNIgwWUEXn2l6HpEnadx6tiBm0e9RAizRrTtvtbjvlj5eJRt1+RzkqoWTIbXKh1rpi1uO2vaM94zlR2ssXjU3F9JIFPfDFfbG0FBYw3EkN7j4b6bj/Yu/8MkzC8ZWSpTW78GS/7REeAbLBlGhQ/4VfEqROGxJ2vIRRPRYSEw802sbZrduVVM75NTE7NXD71lugHMhx06WgOl6465uyk48c+TaBRnrV4mOYzuFlBlWSTmZOVtL3I=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <93A892A987FE3F4DB8947CC1D84E81EE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0da180da-3d9c-40b5-f43f-08d71b847ce8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 22:13:34.0039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: songliubraving@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1821
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-07_07:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=626 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070192
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Aug 7, 2019, at 2:27 PM, Andrew Morton <akpm@linux-foundation.org> wro=
te:
>=20
> On Wed, 7 Aug 2019 21:00:04 +0000 Song Liu <songliubraving@fb.com> wrote:
>=20
>>>>=20
>>>> Shall I resend the patch, or shall I send fix on top of current patch?
>>>=20
>>> Either is OK.  If the difference is small I will turn it into an
>>> incremental patch so that I (and others) can see what changed.
>>=20
>> Please find the patch to fix this at the end of this email. It applies=20
>> right on top of "khugepaged: enable collapse pmd for pte-mapped THP".=20
>> It may conflict a little with the "Enable THP for text section of=20
>> non-shmem files" set, which renames function khugepaged_scan_shmem().=20
>>=20
>> Also, I found v3 of the set in linux-next. The latest is v4:
>>=20
>> https://lkml.org/lkml/2019/8/2/1587
>> https://lkml.org/lkml/2019/8/2/1588
>> https://lkml.org/lkml/2019/8/2/1589
>=20
> It's all a bit confusing.  I'll drop=20

Agreed this is confusing.=20

>=20
> mm-move-memcmp_pages-and-pages_identical.patch
> uprobe-use-original-page-when-all-uprobes-are-removed.patch
> uprobe-use-original-page-when-all-uprobes-are-removed-v2.patch
> mm-thp-introduce-foll_split_pmd.patch
> mm-thp-introduce-foll_split_pmd-v11.patch
> uprobe-use-foll_split_pmd-instead-of-foll_split.patch
> khugepaged-enable-collapse-pmd-for-pte-mapped-thp.patch
> uprobe-collapse-thp-pmd-after-removing-all-uprobes.patch
>=20
> Please resolve Oleg's review comments and resend everything.

Will do.=20

Thanks,
Song=
