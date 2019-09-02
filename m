Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80051A546E
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 12:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730702AbfIBKvp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 06:51:45 -0400
Received: from mail-eopbgr10073.outbound.protection.outlook.com ([40.107.1.73]:22149
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727951AbfIBKvp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Sep 2019 06:51:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHM6sLOW4Tcqs6Hdgfjg9VhUi9tfkHbGBQ5SkwPzPlv6i192j66nou+u/NhTTfIxsgsapY6xYjk8mAXBtiEF+pRBgPW1ACYJ2+xkGZRIJEx5jUDOxO6wiT1yp2XEpp1uzBew0sYx2yNa7NlpuRqvDmc2GdSvU9ELHZFVo8exLKndJu1rHrhVYu+x69b7cdKFJZdUELaLqy4atdj8k3dOqadYNZGxcu09Mgd1H6FjGHjBHg8pAPFtCdonxcGq9LOslIulQHDohNWTN8xd3YVOYaXOlJyKizEnrE1G1QkumE+kIeS2Q+yJwJxWnRGblqNU9L6u3ITI8F2YREfeUW78SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcO5bkczUi3nMox/QUG0GSFvMsuShePDGA8isTcSOZI=;
 b=Q0rpiDGuxDnjW4mcJ/78CgFiT3cP7CItiUoLuDeARFOTCLDKwINu6zOLoNuvlunFSH6C45gRqjgl3cOiszuz24dBu1R97MV4gUCot7HTvVp81mJGQBQK36VjzY93Veelp2CxvpztI2qq8vuVZtNkdGIz2/fOEE7SmqcmYsAVmj+qdvi+mfyTtvz/gmzlEKScIQSdl4jnGoeJMrFJdsg+SxYfX/klhA6FM2gY6nhh+68nWgrxr+tfcJ64a9JBj/tvSBvfXSOx3ShDlteNhJA+Tgi2V4rmcl26LJZjyfxoTS5J+uuN9qb2g9K43mNGofLMEMcmkpCLLFCKG3rMshT3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BcO5bkczUi3nMox/QUG0GSFvMsuShePDGA8isTcSOZI=;
 b=Cp7zfrOXW2dY/m0ByoB0t/0ctfKrMRgZrOeZHM16Zw3j7/2hCzxyQntCUzix5wrAAcu77b+AlRG30isOU2PDdncbz1OnBBU5nixyEYecfmQ5C9rQnnGxnVxv/a1qs7z327yTt4VJKrRwpAZiHwbgU8/wS1dvi/eeocHQ86N+Eio=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4895.eurprd05.prod.outlook.com (20.177.51.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Mon, 2 Sep 2019 10:51:41 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::79a3:d971:d1f3:ab6f%7]) with mapi id 15.20.2220.020; Mon, 2 Sep 2019
 10:51:41 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the hmm tree
Thread-Topic: linux-next: build failure after merge of the hmm tree
Thread-Index: AQHVYXw83banRLe5NEK49Gtd2c7XPacYNdIA
Date:   Mon, 2 Sep 2019 10:51:41 +0000
Message-ID: <20190902105137.GC20@mellanox.com>
References: <20190902205017.3eca5b70@canb.auug.org.au>
In-Reply-To: <20190902205017.3eca5b70@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::16) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbe5a7e0-fee5-4a6f-7316-08d72f9388ea
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR05MB4895;
x-ms-traffictypediagnostic: VI1PR05MB4895:
x-microsoft-antispam-prvs: <VI1PR05MB4895307E6076CECD490646E8CFBE0@VI1PR05MB4895.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:612;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(53754006)(199004)(189003)(86362001)(186003)(4326008)(478600001)(8936002)(36756003)(7736002)(305945005)(71190400001)(71200400001)(256004)(6512007)(14454004)(6436002)(81166006)(81156014)(8676002)(53936002)(316002)(26005)(102836004)(33656002)(2906002)(6246003)(76176011)(54906003)(6506007)(386003)(66476007)(66556008)(64756008)(66446008)(6116002)(66946007)(3846002)(52116002)(11346002)(476003)(2616005)(486006)(25786009)(446003)(229853002)(6486002)(1076003)(6916009)(66066001)(99286004)(5660300002)(4744005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR05MB4895;H:VI1PR05MB4141.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: d3riot/RiNwjeaytGDyYmMnq0rdZH+ULEGZXo92/cafTiswQggMjE9/3TGNlKIhppxG4iq4bB9+27+IxWYorX5DbGwm+kqXekmJZGFNPLlLu/j/SqqCUmoH2GHZu8v3kDMAo7Q8vy7G+Wk8fo6ACRsjLuPWuej5PnJS8BkpM7F9ordJsbzyj7k9ZfEM6+GQf+DWledqKiz36XsaxFRbk5cWRl1L9NErYfi7CywPouA6qm7dSfLURdaOk8OXhMsFsXg0IlI1qWZ7CEnkPt/aAxAhd7Z9cANZDmzi+edkAXfg5qY5SUU2eG7zmBdOX0rx+GqnRmIgxTnOiTRI9YNima+3yudBI3Pk5Jdy6LQAQeXW/3eZeYwLQeVf5CMsCOVbvFp1qZCveXxtrDlmV/BjT7Ju1y/QO3FPjVW4LnZKgwCo=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <44EA7FDA20E5394C9FEBE48B1A69F906@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe5a7e0-fee5-4a6f-7316-08d72f9388ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 10:51:41.3131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bBC02oG9qo+zuUZe40noSwKqUgDxFaBrMaIIB290Y3FZ0pSQYW4PvDo9sE1BQIxaF33P7LjzF7xCGVeAcNN5Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4895
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 02, 2019 at 08:50:17PM +1000, Stephen Rothwell wrote:
> Hi all,

> ERROR: "nd_region_provider_data" [drivers/acpi/nfit/nfit.ko] undefined!
> ERROR: "to_nd_blk_region" [drivers/acpi/nfit/nfit.ko] undefined!
> ERROR: "nvdimm_region_notify" [drivers/acpi/nfit/nfit.ko] undefined!
> ERROR: "nvdimm_blk_region_create" [drivers/acpi/nfit/nfit.ko] undefined!
>=20
> Caused by commit
>=20
>   126470c8a58b ("libnvdimm: Enable unit test infrastructure compile check=
s")
>=20
> I have reverted that commit for today.
>=20

Looks like more kconfig trouble, can you send Dan your kconfig? I'll
drop this patch again

Thanks,
Jason
