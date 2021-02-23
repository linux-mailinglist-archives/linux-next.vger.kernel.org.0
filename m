Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B1A32338F
	for <lists+linux-next@lfdr.de>; Tue, 23 Feb 2021 23:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhBWWCV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 23 Feb 2021 17:02:21 -0500
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:42570 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232443AbhBWWCU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 23 Feb 2021 17:02:20 -0500
Received: from pps.filterd (m0134423.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11NLwquR027193;
        Tue, 23 Feb 2021 22:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=lrcPShDiOLsLRVm7f2mT7mSQKi2zIgg+DRVdubeMRic=;
 b=C7C2hYe6exkCqgJ4JZ9Hu2aww1dZRLcHRsIn2178Lprdtqp9i2T0A+ngGwFqmPNV7Byy
 K3HFX/i2SDHNvqxq7mwhvDJUTahxrR9isrCRWg0G2tLHD4JFstq62kvGBRz8W2g3cNtm
 wKjX3TYM6OqERwHRE4HRyaZ7oqbtwNVmIwb8bxqgK3tcNMLa6u+RK4crQPjfeuHO42GD
 kp4limIh28zGOiwzmEyCl7KUy7SA3iz8AZhNxrU3B9Umdxj5+cJWJvx8SSsPaUG+himB
 dWdxB3T2egPESBKLg6l0G7CnXHRhgtq16RbUGxqqjmFD9Hst/St2YiMr0qleENdFx5s8 +w== 
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
        by mx0b-002e3701.pphosted.com with ESMTP id 36w0fsvs9a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Feb 2021 22:01:27 +0000
Received: from G4W9119.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net [16.210.20.214])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by g2t2354.austin.hpe.com (Postfix) with ESMTPS id 74C89BD;
        Tue, 23 Feb 2021 22:01:26 +0000 (UTC)
Received: from G4W9121.americas.hpqcorp.net (2002:10d2:1510::10d2:1510) by
 G4W9119.americas.hpqcorp.net (2002:10d2:14d6::10d2:14d6) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 23 Feb 2021 22:01:04 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.241.52.11) by
 G4W9121.americas.hpqcorp.net (16.210.21.16) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 23 Feb 2021 22:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMcP6yPmHUD89zmDThDVQijeW+qac2DPDZ/cdMkOoSPM+zE6hVuU3ZTFPOYcKoHikt+nEDVqnTyNKdyaJhSg+mVeE0PIIl/tA38lOxY1jkaHbYqxA4X0qUGBy9S5V24AvbFX+c3WxAefeR+T5KsA5PYw5YTZbStmefR84yftP4zTpt55ptOa5QCi16I4A3eZOhPo8VGpqwHe9yIuLiMWENMSuMdgcBLoYm+ipA0BlMo64RxIf8TH1uCm458xwsRXbvdOewmCKYjymP5asRLeYySoDR1/PEKKapjBdCmzTayM2SVBW9T/VqUzZAHlhhFe5Gf5JRPlgATreZaG6yzuCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrcPShDiOLsLRVm7f2mT7mSQKi2zIgg+DRVdubeMRic=;
 b=bJFtk7oiw8+gCPGErPXxYJTFYrwwc8Z8f86MU61SiktjX6xaxnksG271mCnWh46VKpATAooxDhCCqFunD1qrmzpRoY3hIeVG8gMxh45N9okLVy6QkKVDYMRHqpyX0lLt0UZrzKEKwdFLbza8c1wjQaMxg2cm0jXkOAYnxP5zUdMJbgmASHQgM2zhQpACxWnqqpDZWQOKneP7E6t9rQRz+L0gYZCrdrQKvGoUizn3iV3pvTGdamUqv+38YKxOViX1XsKy+GwPpmMKMMOGk1L7ksHPDB+ASSSb+I4nB6PtUn7GzH7TT9WJ4ubiVxMkt4tqQph9fI0o2S2dEA42ZEg9SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:742b::18) by AT5PR8401MB1028.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7422::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Tue, 23 Feb
 2021 22:01:02 +0000
Received: from AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f177:a85:ecfa:1d4b]) by AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::f177:a85:ecfa:1d4b%7]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 22:01:02 +0000
From:   "Ernst, Justin" <justin.ernst@hpe.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Borislav Petkov <bp@suse.de>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        "Anderson, Russ" <russ.anderson@hpe.com>
Subject: RE: linux-next: build warning in Linus' tree
Thread-Topic: linux-next: build warning in Linus' tree
Thread-Index: AQHXBjjl4JuM7BbKhUeFnMrD5bnN/qpefB0wgAfTJwCAAAB+AA==
Date:   Tue, 23 Feb 2021 22:01:02 +0000
Message-ID: <AT5PR8401MB13000435307B21C5D4D1637E87809@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
References: <20210219075853.0514c9f9@canb.auug.org.au>
        <AT5PR8401MB130092CFAECCDB469375063487859@AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM>
 <20210224085010.28c66ba8@canb.auug.org.au>
In-Reply-To: <20210224085010.28c66ba8@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [165.225.60.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8e8d3e11-62af-456b-49a8-08d8d84682e0
x-ms-traffictypediagnostic: AT5PR8401MB1028:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AT5PR8401MB1028A5CA642A941ADD30E46487809@AT5PR8401MB1028.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jHJn0UB00S37hwlXhqsq0QUbIAcHLLdnAnIsIdaGgL7QnJoIo4xsEkY9b69Txn1hKZamGd45BpOBCSn7jhgd8QCFdCfhr3WifV/LnHcqZdeZSjGAXSAM+O+xZRg3gVo454n4p9R7Qfp/bKGfYKb2mRr6a4cQViDUR74Ut65iGEorcwn0kTDtHiTqgCSdO7ca/4uPL1d5UAOdxdv1A7Jc82jizNZdviVa/zXlymdGBaRYPcH6ILBMUVpykazg1fMm/TdKPEG4SUSxOvl5krj65twRZtQ3v4AewGAEwwQRLCkhrXlRp9T68TY+xUjWl0+7Yq6r4FTG6yzgXbEHaOgj8lQ7Hd1QLUZIWvDVXoouf4COTFkgTdUtJP5RZOxUbnjE6QP1t9NkeNCSb5H5lUp26l5X3qtpW9JUsBq02eRme3O87MkKf7axkU0iMpXF0qqrFQgIILwmpnF3b5tkWP19nuzuikiTuZGEh4H79BbTQIHLNPGbwlj9kcQl38C4TeAnYNE/MNFZsG7F4OBOdwel1fUNzNJZ/WdK/SkgwLqBYjuOGZBtK7W/znz+vYn2IXR5M8K/LcbzL3HihC3FYMgo0pdl6hcPS2ey8UwJ9kZ8eY0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(39860400002)(346002)(136003)(366004)(376002)(396003)(66446008)(54906003)(66476007)(8936002)(33656002)(6506007)(64756008)(7696005)(316002)(52536014)(83380400001)(66556008)(5660300002)(966005)(55236004)(8676002)(71200400001)(66946007)(76116006)(55016002)(186003)(26005)(86362001)(2906002)(478600001)(110136005)(9686003)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Y2oEjeibOWCc6s2pPqSAUcpjlPnjr/ndF7QL6alQmvXJ0E+jAohmYcPdbBYM?=
 =?us-ascii?Q?APYaa9FncAeBUulG705kd/ne4h0GmsABe18zpFAFwMXFzmuhHb2bt+NCNt9G?=
 =?us-ascii?Q?tOn8qhoGcvWPoxxbFHvw+taPNLZ4DXYjLJ7PgbPHGRHoeW04ShlURtQQimxP?=
 =?us-ascii?Q?KlU8Tt4QiG5NsJWdD7p2tXr7GGXmTYIBQG8luEerT0AOgWFfCTGn5lKdRV5m?=
 =?us-ascii?Q?Es7tOTGmlsPzJZJElniTFwJ/Pl/UF10SCEvsBnConVCUupS2RcTWtoKRcT6R?=
 =?us-ascii?Q?YTHnzj4U9EAFmg07wLuEpKF61od33PnaIclx21Eh5kpzu3lQeUNw19inb60m?=
 =?us-ascii?Q?Rnoik8BMlgikgskjFqM0XPZN5L93vCipCfJzso00LbYcWIcpBMUATxxgPeaK?=
 =?us-ascii?Q?jTDLsqsGKZ7RkVVJOzWcdRQCcJ/Tse0/4qq7ncFdrWY/db4esOrfKezs9ndI?=
 =?us-ascii?Q?Xn93UlFJmtyV1VhmSUr1epJ2X4veDWpGi0YtmPc1lgCL0rpCNme8rJnveJvf?=
 =?us-ascii?Q?KU3Laf/ZAHdQ9HkV7YAXGzw6eQRgKtvcsYFsPStd7DOHT1SB7gD9fSA1IwLd?=
 =?us-ascii?Q?QsHtq6j7o3jHOT6RZrleIUBeIXONFFwW2Y4fiDGPmr3uH2wENAAx3VtXUTX7?=
 =?us-ascii?Q?co1ZlSnzsTvrL1ngT6Fkdci8g8aDohM5OdLwcuwkx9tltQ1EIrYUVtq4WNTY?=
 =?us-ascii?Q?uk00zzcbRSty5Z2oa0RXMamYRD41l7XiL+ONAptlcPw4pLg0CvQWIbC/hphH?=
 =?us-ascii?Q?PLJ8g08fgt9ic0eWUsWaSeX+YkFMYZWAxmyU0EjQK1yJXjwSca+vCSn0Eyo8?=
 =?us-ascii?Q?zzl3XIqMtTRtMYn0ZVl3y3LWivUtL5C2z6JzjvmtTIRqZRiIXwSdC0zw7iCM?=
 =?us-ascii?Q?Z6aN/5cJCxtb4eDqMDDpdPMDaEbTjM/DdaKw+52KqKcXfySNTBNyZC1zjkcE?=
 =?us-ascii?Q?iB2P2z/8wla78ElHUTo+MJqHj1xOJGQTXM14Mdk/RlgeNpPJIWPl4cILvsbo?=
 =?us-ascii?Q?IBNSFnxNtPtCWYDJrYB026XHLd0ola0JOol8d1eHaBPtujNe85JHKnzROAV1?=
 =?us-ascii?Q?Hgywq8ocq/1MejO5fN6GtMRXvVpyKLVhreJjmSPcOBrHeD+CBxGPHkRwpCYR?=
 =?us-ascii?Q?yyzzivbm6+R9MZU4hkAS3oHFfcejZ74oEwv9eX0XlhuYCzeaW71GYTJuRgSL?=
 =?us-ascii?Q?H7S6d49J/USwlDtoh9BVvROPdp6T/GOC/zrM2AAWOFSJxDuEmBgs3k8poHhn?=
 =?us-ascii?Q?Wsns50hFM+mFiH/amyndG75LpbVIy/4SvDPk4Lxg3dis9dWWpooSZfA7h4UB?=
 =?us-ascii?Q?s7FUwXGn1yF1SLppgD2tJKio?=
Content-Type: text/plain; charset="us-ascii"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB1300.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8d3e11-62af-456b-49a8-08d8d84682e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2021 22:01:02.6803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XHMWEIA+Wzmw4pqb5uHLyWCS2vwtMkhfpfqmd6KA5VYpTIdbo7+oO1NzsUSiO1LUChd6YSTyOERq21ew8XeNVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB1028
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-23_11:2021-02-23,2021-02-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102230184
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> Hi all,
>=20
> On Thu, 18 Feb 2021 22:47:57 +0000 "Ernst, Justin" <justin.ernst@hpe.com>=
 wrote:
> >
> > Hi,
> > We made a special effort to squash the unexpected indentation warnings =
in c159376490ee
> (https://lore.kernel.org/lkml/20201130214304.369348-1-justin.ernst@hpe.co=
m/), so I was surprised to
> see this again.
> > Commit:
> >
> > 	c9624cb7db1c ("x86/platform/uv: Update sysfs documentation")
> >
> > is the culprit here. I suspect it was written and submitted before we m=
ade the effort to fix the
> Unexpected indentation in c159376490ee, so it misplaced the first line of=
 a codeblock, the original
> problem that was reported and fixed.
> >
> > The fix:
> >
> > diff --git a/Documentation/ABI/testing/sysfs-firmware-sgi_uv b/Document=
ation/ABI/testing/sysfs-
> firmware-sgi_uv
> > index 637c668cbe45..12ed843e1d3e 100644
> > --- a/Documentation/ABI/testing/sysfs-firmware-sgi_uv
> > +++ b/Documentation/ABI/testing/sysfs-firmware-sgi_uv
> > @@ -39,8 +39,8 @@ Description:
> >
> >                 The uv_type entry contains the hub revision number.
> >                 This value can be used to identify the UV system versio=
n::
> > -                       "0.*" =3D Hubless UV ('*' is subtype)
> >
> > +                       "0.*" =3D Hubless UV ('*' is subtype)
> >                         "3.0" =3D UV2
> >                         "5.0" =3D UV3
> >                         "7.0" =3D UV4
> >
> > Thanks,
> > Justin
> >
> > > Building Linus' tree, today's linux-next build (htmldocs) produced
> > > this warning:
> > >
> > > Documentation/ABI/testing/sysfs-firmware-sgi_uv:2: WARNING: Unexpecte=
d indentation.
> > >
> > > Introduced by commit
> > >
> > >   c159376490ee ("x86/platform/uv: Update ABI documentation of /sys/fi=
rmware/sgi_uv/")
> > >
> > > Or maybe an ealier one.
> > >
> > > This has been around for some time.
>=20
> I am still seeing this warning.

I submitted a patch here: https://lore.kernel.org/lkml/20210219182852.38529=
7-1-justin.ernst@hpe.com/

Thanks,
Justin Ernst

>=20
> --
> Cheers,
> Stephen Rothwell
