Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8446AEC80
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 15:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbfIJN4l (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Sep 2019 09:56:41 -0400
Received: from mail-eopbgr720133.outbound.protection.outlook.com ([40.107.72.133]:29152
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725942AbfIJN4l (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Sep 2019 09:56:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gI98hrprXEmIP/XAZyhiHPVxM2N+rKlpoOlghEdgKld+4x0+6x7b96zebilLixq/TUmS5mNO6NFJiXbexMdAfxoW8i0ONgZz8ZnKZVM9GNohQ6AUVSl+AxZTCXV2+X7KkGA/RDzRl8CbljWMyfp8NwyGiQTReCrn0s9olZS/yVyxjL6SPHLnpvrcXYgX06ECD0wClEmgCtEfkI47cDj20+M1vJQxYQPj+P5p/b3XqvXlBJLHTTn5FnFHNcx5YlfsDpLw9x7UhzlakSggzC1kJIDxYeJAEDuEXlQPLxXKAkGNo3guVnn2nzXDTgoCH4+lvCDJTKKDnDLX2V3UdxJK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBGv4xw31srBF4PNR1YGLuIQxqYHdhm48bi0Ybwg/Mk=;
 b=aGJweLEbLavVf12+WNFoKZC809m+oH7nDE5R1lbP7QVViqb26J8W2eDNj5UzHH8a23Jhx4AtxQUoiea7E5ISGIs0nvWNVroM2wAjYf03IMi8yQ878F/VPjBHPiu9Qe2y8+eF8yU4aU8SmEG/vb1SgzMf/eTALTsEh8FP3YyilWdn5qzag4GpBHayoQmDgXHI81GX2NzBRiML/+Yw7DRkpkMbpq34R8Ik9IW/h/PKkwRIamrqxLQDP8QV2g13V2hz1cWbLkltiXRGN7PyQnYYI8Frcubpi8T3AAEBx3MY0qYgo72KjlVEuwlWN6SNBFAMe8Vej8l5S9iXhxobnUxorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBGv4xw31srBF4PNR1YGLuIQxqYHdhm48bi0Ybwg/Mk=;
 b=CfU/DXc4XnXhh7VMBW8vROjaMg71Sm1wbK7BK21hdplvapm5OCtrGCHDRwuRtcCruYTV0b9MFJS5YAFSfIE8p9yEHgLf4ThFkL3Q1fmpjppchZ/8rlKBxGBTZNnqoOX5ZEHDP+ypl7GXuzu/YnhEL4FBFXGFgSkxbwpzA3pQJgw=
Received: from DM6PR21MB1337.namprd21.prod.outlook.com (20.179.53.80) by
 DM6PR21MB1195.namprd21.prod.outlook.com (20.179.49.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.5; Tue, 10 Sep 2019 13:56:38 +0000
Received: from DM6PR21MB1337.namprd21.prod.outlook.com
 ([fe80::2cde:35d7:e09a:5639]) by DM6PR21MB1337.namprd21.prod.outlook.com
 ([fe80::2cde:35d7:e09a:5639%6]) with mapi id 15.20.2263.005; Tue, 10 Sep 2019
 13:56:38 +0000
From:   Haiyang Zhang <haiyangz@microsoft.com>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sasha Levin <sashal@kernel.org>
Subject: RE: linux-next: Signed-off-by missing for commit in the pci tree
Thread-Topic: linux-next: Signed-off-by missing for commit in the pci tree
Thread-Index: AQHVV50BkG1PELIBpk2+r3pdUVtPwKcFTy+AgB7GOCCAAM4SgIAALEuw
Date:   Tue, 10 Sep 2019 13:56:38 +0000
Message-ID: <DM6PR21MB13375D54A64B2471BBBE62B3CAB60@DM6PR21MB1337.namprd21.prod.outlook.com>
References: <20190821071939.11382b44@canb.auug.org.au>
 <20190821090249.GA28112@e121166-lin.cambridge.arm.com>
 <DM6PR21MB13377560DB091B7F7C68E5E1CAB70@DM6PR21MB1337.namprd21.prod.outlook.com>
 <20190910111737.GA4382@red-moon.cambridge.arm.com>
In-Reply-To: <20190910111737.GA4382@red-moon.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=haiyangz@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-10T13:56:36.9635846Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=dcce0ea6-8a1e-485e-9155-be550f6a151c;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=haiyangz@microsoft.com; 
x-originating-ip: [96.61.92.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4372b6e7-64e3-4df9-8e63-08d735f6b357
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DM6PR21MB1195;
x-ms-traffictypediagnostic: DM6PR21MB1195:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR21MB1195BA2C6D42191B8714080ECAB60@DM6PR21MB1195.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01565FED4C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(53754006)(13464003)(199004)(189003)(52536014)(8676002)(86362001)(8936002)(3846002)(6116002)(9686003)(71190400001)(486006)(66066001)(6246003)(53546011)(6506007)(5660300002)(11346002)(102836004)(446003)(33656002)(14454004)(476003)(6306002)(8990500004)(66946007)(7736002)(22452003)(54906003)(6916009)(256004)(14444005)(81156014)(81166006)(66446008)(10290500003)(66556008)(74316002)(64756008)(316002)(66476007)(478600001)(26005)(55016002)(6436002)(99286004)(305945005)(76116006)(71200400001)(10090500001)(53936002)(966005)(186003)(4326008)(76176011)(7696005)(2906002)(229853002)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:DM6PR21MB1195;H:DM6PR21MB1337.namprd21.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vBPPJOvu7sbFITdt62IQTm0Mu7g7/cS7rkFvmmzvnuI7XcwdmrOnYMnGCDuA2FZB9EGF07JBv8p9qamgWrc/Ds2OzNW+WbgfPck7yWV9QbWbNzzZf0Mst40havL0M/YZ6zig6BVWTWRkurs6FI8z4/kQdrx9o6Za5FzWZc+rz2eTPJKd9SyIV0sZa6NtTcTNuyzFOvsq6sEIk7PJuQ/9t6cMERvJP2Kxx2lLfxN+UWQT10MA5OJ9JG+TdCo2cz7CQGLje4B7AuyYamn7FbXyrpQHRaTPzqWuvwIWFQGjrIZDU9j60IYUhnv8Gga/Ed0L71C1iPd/zzLc6QdCsc5nnQyVv4sKY0wABbuLcfAQaCjyLK/+F1ZdltE5SkBQj/O20b/mTs0aT0eaU2J5DCUiSVdEI2EBR/R4tcA58IOaiFw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4372b6e7-64e3-4df9-8e63-08d735f6b357
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2019 13:56:38.2982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVqN+4Vnks9wE2Sg3rmvV5LQVMD0jy8QUcqb9vRiXSAR5EG+fEmHhbFy8/WhlIm+Z7DSzmxIYfK7+R6AoqV04w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1195
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> -----Original Message-----
> From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Sent: Tuesday, September 10, 2019 7:18 AM
> To: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>; Bjorn Helgaas
> <bhelgaas@google.com>; Linux Next Mailing List <linux-
> next@vger.kernel.org>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; Sasha Levin <sashal@kernel.org>
> Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
>=20
> On Mon, Sep 09, 2019 at 11:10:06PM +0000, Haiyang Zhang wrote:
> >
> >
> > > -----Original Message-----
> > > From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > > Sent: Wednesday, August 21, 2019 5:03 AM
> > > To: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Cc: Bjorn Helgaas <bhelgaas@google.com>; Linux Next Mailing List
> > > <linux- next@vger.kernel.org>; Linux Kernel Mailing List <linux-
> > > kernel@vger.kernel.org>; Sasha Levin <sashal@kernel.org>; Haiyang
> > > Zhang <haiyangz@microsoft.com>
> > > Subject: Re: linux-next: Signed-off-by missing for commit in the pci
> > > tree
> > >
> > > On Wed, Aug 21, 2019 at 07:19:39AM +1000, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > Commit
> > > >
> > > >   c4a29fbba415 ("PCI: hv: Use bytes 4 and 5 from instance ID as
> > > > the PCI
> > > domain numbers")
> > > >
> > > > is missing a Signed-off-by from its committer.
> > > >
> > > > Also, all the tags should be kept together, please.
> > >
> > > Fixed it up in my pci/hv branch, apologies.
> > >
> > > Lorenzo
> >
> > Hi thanks for fixing this, but I found the following commit now has
> > the Subject line and commit message same as a previous patch.
> >
> > https://nam06.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> > kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-
> next.git%
> >
> 2Fcommit%2Fdrivers%3Fid%3D87b20a08dcc265959f5c59f18603ea0487fe60
> 9b&amp
> > ;data=3D02%7C01%7Chaiyangz%40microsoft.com%7Cb4e2f03b09da4454342
> 108d735e
> >
> 081d0%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6370371106
> 95959451&
> >
> amp;sdata=3D17KZvmvtuHz3f0xKh6MwSOja41VerGTpyAO0f7BF6gY%3D&amp;r
> eserved=3D
> > 0
> >
> > The correct message for the patch should be the msg below. Any
> > possibility to fix it again?  Thanks.
>=20
> I updated my pci/hv branch and rewrote the commit log, I will ask Bjorn t=
o
> update it so that it shows up in -next.
>=20
> Lorenzo


Thank you!
