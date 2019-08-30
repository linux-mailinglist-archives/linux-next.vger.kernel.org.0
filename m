Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83335A393B
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 16:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727603AbfH3O2v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Aug 2019 10:28:51 -0400
Received: from mail-eopbgr00055.outbound.protection.outlook.com ([40.107.0.55]:65229
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727850AbfH3O2v (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Aug 2019 10:28:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MokEq6bvS9JYXbOggyA45HImt4TKMVMI31GmrhENBPz0LarefHdzdfO1vLo69xG4xN6zA3gVCf4jG/EsRl6u+nQIzIgri01Rlhz67efpyIGG41cOVEMbSax6E+fKxQz6CGRi7iP+e03CO4oR/ZHpqzs+fslgGbW+txKlsVSWLxwAs9UbsPy7Ro0akAteep+NQxESFI7r+ri+PS+nPN7d0iiBL0WFUfes/cubpEGaEfilRfzli3aj4m5XBgVVtcleB8O4zS/ZpaZUgxEhKPrdUWsCcVYADluNoifGUoxqAPquTnXjhfqMKJ3pcRwnr31XOnX3sO7z+dr6V8jl+b0TnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJTvFUTN3926L8ICcCta3rZkixpAG6B9Ow1+oAbyWH4=;
 b=Tf5rFd3xJ+E6HTeDWxPmvvB3vFvCKQDEQSHIsROfpd4d638CXbkPJ+WAA2XzVDjJ911Y47NLDf7OLza5xL/h+E8dYeA2syhnRVGdgdpBri3GDuhgC9mx+pcyWSzrpBTIpLqwnwmKVRwifEJBwKfnZoOCzUZw3TaGATz9Fvz4v4/aFYIhCzY9cxoqM9L5ehb+2PGg4IZMSJ0zD3WS2hsQQX7ddHU0hQ2lmbFasHzsAu2ehCOphVhE4y7sMq9u6M9tMBen6pVEUXQuElqla21QnH1uK4eJp3kcHZuJXPKRu5JS1r/MHNfzm+Q+4TgsF933wpZ+Y6sGALr8RcytWnBoqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJTvFUTN3926L8ICcCta3rZkixpAG6B9Ow1+oAbyWH4=;
 b=UvLIj/ZF1M9qbU5xpjnP42m/5r63GedY5/CpP+SHEuVE27L9DaqVZ2hDqFNvZNINroR4pS/UXCKHVr90j9ZGCGeWGEnBsBJs92jsjGl++MhjI/iS4fejrPe6xhBRCNRpgR3RdyStaLikb4d/UA7uQXXZntkgHEyxU5lqJ6gPPvg=
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com (52.135.129.16) by
 DB7PR05MB5161.eurprd05.prod.outlook.com (20.178.40.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 14:28:47 +0000
Received: from DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::8412:26d1:ef71:2869]) by DB7PR05MB4138.eurprd05.prod.outlook.com
 ([fe80::8412:26d1:ef71:2869%7]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 14:28:47 +0000
From:   Jason Gunthorpe <jgg@mellanox.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        Minchan Kim <minchan@kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Thread-Topic: linux-next: build failure after merge of the akpm-current tree
Thread-Index: AQHVXzqd+zDqw1hOT0eH/lp6ykmw4KcTv/wA
Date:   Fri, 30 Aug 2019 14:28:47 +0000
Message-ID: <20190830142841.GA20@mellanox.com>
References: <20190830235530.67c23ad3@canb.auug.org.au>
In-Reply-To: <20190830235530.67c23ad3@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::27) To DB7PR05MB4138.eurprd05.prod.outlook.com
 (2603:10a6:5:23::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.177.133.130]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ec5bd5c-eaab-493e-239f-08d72d565e95
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DB7PR05MB5161;
x-ms-traffictypediagnostic: DB7PR05MB5161:
x-microsoft-antispam-prvs: <DB7PR05MB51611ADD067C24085A610D01CFBD0@DB7PR05MB5161.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:655;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(346002)(136003)(189003)(199004)(81156014)(229853002)(2906002)(186003)(256004)(1076003)(102836004)(316002)(33656002)(25786009)(5660300002)(81166006)(71200400001)(66066001)(305945005)(86362001)(52116002)(99286004)(76176011)(508600001)(8676002)(36756003)(8936002)(66556008)(71190400001)(66476007)(66446008)(4326008)(66946007)(64756008)(4744005)(6436002)(6916009)(54906003)(6506007)(3846002)(2616005)(6116002)(6512007)(7736002)(26005)(476003)(6246003)(446003)(6486002)(53936002)(486006)(14454004)(11346002)(386003)(79990200002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7PR05MB5161;H:DB7PR05MB4138.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +dMq6oC4OqzWdlYWGkinpUqdmyhBEW+OrYEPb6C42uLALV1InOvwu9YpTJiKWWMjsndwTtYMTvVMKi3vJn9ImwYvcaGwqhzDR2YqYgsvULd9ovdFvvjnWBi4ngMeDw1iTBj6okpydbXZiq4luS5+gg0dwK8nJkd4tch+tjenaKwnx59MzO2GPRbg9LjbgCqeNmr1QbnDCnXGIC/1Yb0DPlG8JxIh9QGK2JD9fRUVIu5hcBTilvV4gYycdInby5CIlRnqRCcAZnbxuhR98vojUQTsqFHt04nmYJJNo10r1+VrSuX/FEl1tz5IEeFBDVCrE+goNuerk6GIsGT23LM9n6JXjdiZN99Bi8d8LUxMTTtRiPaA8xrnI4JAsdSUPe0iE75gerw4C95q/ejCy1sp3VJSPvkiKq/6mA+OWC/yppfnR0O2GN2DwfXJ66kx0ltUIPdlIewNsrJdQLPbIF77BA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A1CAFE6F94FFB43ACE93AAE5E7CB69B@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec5bd5c-eaab-493e-239f-08d72d565e95
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 14:28:47.4733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fL1bvtN9EV4L061uVXNZctbaD+8e8Sqf1Denwt7JQCN4xzKMXhmy6UaMSAsiS+hzRw3IXrutbrFQKplzZUq+Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR05MB5161
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 30, 2019 at 11:55:30PM +1000, Stephen Rothwell wrote:

> Caused by commit
>=20
>   1c8999b3963d ("mm: introduce MADV_COLD")
> (and following commits)
>=20
> interacting with commit
>=20
>   923bfc561e75 ("pagewalk: separate function pointers from iterator data"=
)
>=20
> from the hmm tree.

Yes, this is expected thanks

> diff --git a/mm/madvise.c b/mm/madvise.c
> index 7ec7c8f6d5ab..20598df8360a 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -446,6 +446,10 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *=
pmd,
>  	return 0;
>  }
> =20
> +static const struct mm_walk_ops cold_walk_ops =3D {
> +	.pmd_entry =3D madvise_cold_or_pageout_pte_range,
> +};
> +

> +static const struct mm_walk_ops pageout_walk_ops =3D {
> +	.pmd_entry =3D madvise_cold_or_pageout_pte_range,
> +};

These two can be shared

Looks OK otherwise

Jason
