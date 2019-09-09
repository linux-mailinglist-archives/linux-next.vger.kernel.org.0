Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB63AE15E
	for <lists+linux-next@lfdr.de>; Tue, 10 Sep 2019 01:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbfIIXKL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Sep 2019 19:10:11 -0400
Received: from mail-eopbgr760092.outbound.protection.outlook.com ([40.107.76.92]:12071
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728358AbfIIXKL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 9 Sep 2019 19:10:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EM8CuyEvz1Pabfn+tGa9MwDPtXhEfsQKvsnOZCYUbBhNuDs2VdIMYOnHxhlUvueo7ONH0yTOuv1XOBp3hAaSoe4w2ngbKsiZjj0SLWhbrGUhPUxUngTfkqtkppaVL7M/TorqlNPIMb4eX4CP863oZwhcfPsXaE4eCKX2FaXubVXdkDfVUXsxX72BO6F1f2/cHl7NSA36E1HC8o82idpuclLq+63jNMHXLcjX0qgBqWVczrcNK3Fi/YZ8+XPg1wA0hqAIX43CCEeJTL2YYnBkNReoxgOnFBqSNVX1+zmLYIrw8GsNfu0zi6hOmWOvcetmfgbTWck1sMT8mdpK9lCJPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cOvoSc64Svo78iy+UWfX/FF53VqcpqBA9RqkXLNe6U=;
 b=g613LDkjuF5RZGT7fYqQ0LECYopzjSsHSqb3P0yY/JtaZV5MUmPHRCHeGpiC2ey4SdDPO0HFqzhmq5+RyGVmSw+LwXLEgdW7rbLPeCFWqrRXDMkh06XmPZG6GF0T3ElEjF0jGdnF4wjqu2NDHYwcTZr4kb6U22fKvIkZDVFXRaYC3f6bn0JZAd7ThAp0QqfKb2HTK/FlfwwEwvlAbrqmO6+tqLE8hsZs84NnTtReHzMzTKZsDX2GVU7VwOz3+9E4/K5s8Ht13SrZEpYwr3JovzD0LSHfFxqrexSaL5N+j3XR6HqFbssMSjMte4G9s8c1xt/Wj3QPwzKsyOTAcphB8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cOvoSc64Svo78iy+UWfX/FF53VqcpqBA9RqkXLNe6U=;
 b=GnujReBMXDZyNQUbYegz9RDlq7wMdFleX1SI2nE/oUM+Xs5Wn2efN/lvvMY8cS/PGD/mAAadoq2YjjL8fL1JaKVZB/CvLqta2V6KPpEI4KBCs1jndBbka/HNK30TWDyCJNtgVp4NtVgbvq6cW5OMwkxVWYUml5kKg4WGLSkACsk=
Received: from DM6PR21MB1337.namprd21.prod.outlook.com (20.179.53.80) by
 DM6PR21MB1369.namprd21.prod.outlook.com (20.179.48.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.10; Mon, 9 Sep 2019 23:10:06 +0000
Received: from DM6PR21MB1337.namprd21.prod.outlook.com
 ([fe80::2cde:35d7:e09a:5639]) by DM6PR21MB1337.namprd21.prod.outlook.com
 ([fe80::2cde:35d7:e09a:5639%6]) with mapi id 15.20.2263.005; Mon, 9 Sep 2019
 23:10:06 +0000
From:   Haiyang Zhang <haiyangz@microsoft.com>
To:     Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Bjorn Helgaas <bhelgaas@google.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sasha Levin <sashal@kernel.org>
Subject: RE: linux-next: Signed-off-by missing for commit in the pci tree
Thread-Topic: linux-next: Signed-off-by missing for commit in the pci tree
Thread-Index: AQHVV50BkG1PELIBpk2+r3pdUVtPwKcFTy+AgB7GOCA=
Date:   Mon, 9 Sep 2019 23:10:06 +0000
Message-ID: <DM6PR21MB13377560DB091B7F7C68E5E1CAB70@DM6PR21MB1337.namprd21.prod.outlook.com>
References: <20190821071939.11382b44@canb.auug.org.au>
 <20190821090249.GA28112@e121166-lin.cambridge.arm.com>
In-Reply-To: <20190821090249.GA28112@e121166-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=haiyangz@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-09-09T23:10:04.8914944Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=527cabc6-7439-4a01-9c43-8bc2b95c6996;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=haiyangz@microsoft.com; 
x-originating-ip: [96.61.92.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0383f4d9-a8ac-4a49-51fc-08d7357ada5e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DM6PR21MB1369;
x-ms-traffictypediagnostic: DM6PR21MB1369:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR21MB1369E2D452917EC648E9E27CCAB70@DM6PR21MB1369.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01559F388D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(53754006)(13464003)(199004)(189003)(8990500004)(10290500003)(81156014)(6506007)(54906003)(74316002)(446003)(6116002)(11346002)(66066001)(476003)(486006)(10090500001)(76176011)(2906002)(6436002)(66476007)(66556008)(66446008)(66946007)(8936002)(8676002)(76116006)(3846002)(26005)(53936002)(966005)(71190400001)(186003)(71200400001)(7696005)(478600001)(81166006)(102836004)(4326008)(86362001)(55016002)(229853002)(53546011)(14454004)(305945005)(64756008)(256004)(110136005)(9686003)(5660300002)(6306002)(52536014)(7736002)(22452003)(99286004)(316002)(25786009)(6246003)(33656002);DIR:OUT;SFP:1102;SCL:1;SRVR:DM6PR21MB1369;H:DM6PR21MB1337.namprd21.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4k0USou/CK3Bv+1baFir6w1McULG47vScBbbqNrRbrBNZMdXtv0yGClZn8EVFoRE27H/GgvZpvZMXz/y1VrUKY1rRzCONpMP1wikngCEk4no+H4bQ9tfhDn+DjFswV/C+YHoj0YKDpYUeEC/bbre66I48LToKuQ9FL2uJNYSKMYLlG8gAQoAi6EKruvCoKEUf7Kw0RLbGolV9SBQgROKhfKquHsYv2C92fzfJy55tRE26nq+Liw6sIbEPxQE8HsaA4Z1aPr3pAuXVcVVNBGmAxbTSNz7LYsHprKEVnCbbYUgVMKRm/LuWMWLWcRc5a0tWpQ6k0noB2S0gMn4E6B1axMbeMLWvPQEA73/lFyDiSzPnmNoUOAyzkgHLQvEnvpVoHTUSm5vMlUabzDW0Genus97vJ9BxFtm69k7swLMF4w=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0383f4d9-a8ac-4a49-51fc-08d7357ada5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2019 23:10:06.1394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLCIVlBVCv5XPJjxKv9vBypHHM3xvMYRnKwIeYs3es1L2fG4UQ2BCINSUZO78WB7stofiND9QipU5cDKZ/MohQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR21MB1369
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> -----Original Message-----
> From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Sent: Wednesday, August 21, 2019 5:03 AM
> To: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Bjorn Helgaas <bhelgaas@google.com>; Linux Next Mailing List <linux-
> next@vger.kernel.org>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>; Sasha Levin <sashal@kernel.org>; Haiyang Zhang
> <haiyangz@microsoft.com>
> Subject: Re: linux-next: Signed-off-by missing for commit in the pci tree
>=20
> On Wed, Aug 21, 2019 at 07:19:39AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Commit
> >
> >   c4a29fbba415 ("PCI: hv: Use bytes 4 and 5 from instance ID as the PCI
> domain numbers")
> >
> > is missing a Signed-off-by from its committer.
> >
> > Also, all the tags should be kept together, please.
>=20
> Fixed it up in my pci/hv branch, apologies.
>=20
> Lorenzo

Hi thanks for fixing this, but I found the following commit now has the Sub=
ject line
and commit message same as a previous patch.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
drivers?id=3D87b20a08dcc265959f5c59f18603ea0487fe609b

The correct message for the patch should be the msg below. Any possibility =
to=20
fix it again?  Thanks.
- Haiyang

Subject:  PCI: hv: Use bytes 4 and 5 from instance ID as the PCI domain num=
bers

As recommended by Azure host team, the bytes 4, 5 have more uniqueness
(info entropy) than bytes 8, 9. So now we use bytes 4, 5 as the PCI domain
numbers. On older hosts, bytes 4, 5 can also be used -- no backward
compatibility issues here. The chance of collision is greatly reduced.

In the rare cases of collision, the driver code detects and finds another
number that is not in use.

Suggested-by: Michael Kelley <mikelley@microsoft.com>
Signed-off-by: Haiyang Zhang <haiyangz@microsoft.com>
Acked-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

