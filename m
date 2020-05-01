Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFAA1C10BB
	for <lists+linux-next@lfdr.de>; Fri,  1 May 2020 12:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgEAKRb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 May 2020 06:17:31 -0400
Received: from mail-bn8nam12on2088.outbound.protection.outlook.com ([40.107.237.88]:51271
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728119AbgEAKR3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 1 May 2020 06:17:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQAPy9wnoR0fki75Ccwv0vMsibyI2Odzmx5lwNg7t16Qb4bB9Bb655jezpSkpbkn1egXpz1enN0VdOqxPBuqKkpRjEuDPiAHYJL0YrK6cln9KBk7oNR7SsxR4xQq7hLedoiAm9sA+DhLHdFiM7WSS7LntU4CYGyfR7bNVqmuqUPuq5T3MrH7llmhcnIjBrZIr8Z4KdNYGHBiDeulaBcKnwWzwylMHlOwFBpZvm+LEAFvTXCSAPYKosNwGJUS88ZMoCOy0YLcG5nlhT1ecaNx2c9xNX+w0wOqi5UrlgJjwb00taUKprlxCiqB98seka7Sz75Y75PXAni6lsOabrAS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LzIl2lNKNTYSaF3G9TwrJ3SbEV5Lah76+QBemFfm20=;
 b=FMfb1kYWB7rCAoZLmSgdRopQ9VJIeFDDZb9MLj5vKqqt+Oi2OULR1n/V9hFgxNPquBrCaO8CbJHNJUvSXea67No+GiZOIuXN5rir0eyaKq0RC7oPIVLM+5JAEZbWE0++KehV9PSvpYMylv3gSyf1lQwyzsKtD3XjHsQ+rl1Ddf2RxZI5gcOBtSF9EpJ2CBvyPoQiym5ThoE4KwZprpUG3VrbG9GdXjpiyJRRLf+AGobk7ZssWV8E6HrXpTzvGyJolAvuefnBA48sbNMQe3oQ5KNUv5Snxaqw3q4+q8T7Udhk0trpuWdgzfgGJxfHAd6cQLklAkuFL/xf26ENxDF5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4LzIl2lNKNTYSaF3G9TwrJ3SbEV5Lah76+QBemFfm20=;
 b=QxjdcS8jo/m8OkJd8PouyJaPb1oSLb/udKAaVgPLlTj5TvJ2iNOIJInbEdhOVPRVvT5earV+AZcnyTL78cZD4FAyKOL7CiySwWAjoz78sTRvqs1eEBH/hUflJ/8Nl3O/ulMw+vxdJMeSsnp30EUFfXMqxB9NktWF+czlD7mYFms=
Received: from BYAPR02MB3941.namprd02.prod.outlook.com (2603:10b6:a02:f8::18)
 by BYAPR02MB5736.namprd02.prod.outlook.com (2603:10b6:a03:119::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Fri, 1 May
 2020 10:17:26 +0000
Received: from BYAPR02MB3941.namprd02.prod.outlook.com
 ([fe80::10b5:a33c:e9c7:6c0a]) by BYAPR02MB3941.namprd02.prod.outlook.com
 ([fe80::10b5:a33c:e9c7:6c0a%7]) with mapi id 15.20.2958.027; Fri, 1 May 2020
 10:17:26 +0000
From:   Rajan Vaja <RAJANV@xilinx.com>
To:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>,
        Jolly Shah <JOLLYS@xilinx.com>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the char-misc tree
Thread-Topic: linux-next: build warning after merge of the char-misc tree
Thread-Index: AQHWH4G2altuXUaUlkqQcFuutK4Ug6iSy/gAgAA4OWA=
Date:   Fri, 1 May 2020 10:17:26 +0000
Message-ID: <BYAPR02MB3941A306B8435DD8B09E62CBB7AB0@BYAPR02MB3941.namprd02.prod.outlook.com>
References: <20200501162806.155c44ed@canb.auug.org.au>
 <20200501065526.GA886609@kroah.com>
In-Reply-To: <20200501065526.GA886609@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: kroah.com; dkim=none (message not signed)
 header.d=none;kroah.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7fbf77ef-92df-4839-aeb2-08d7edb8d8d3
x-ms-traffictypediagnostic: BYAPR02MB5736:|BYAPR02MB5736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5736DD14FE3A743C46E0497AB7AB0@BYAPR02MB5736.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0390DB4BDA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: APZErLztcviZUn5JyxYr1/5VcWWmFTUH/s0KW+OUj+zksAr44pRa821tWmcjDhF4X7wkITGrrifpVi6+HiOVrBxjc1E50GTv70Z1DNUisxmE0Pw5DUmj2RJBy8n/9HWE16X04bUTS1KwJBgxaAy8/cJegqjwAZ4w0bVCUsNLfNAgvULs9pCnSIDKSey37D51CRiqvXsdKAwlg1K5Usn0h2Ubtw0/Gy4bFNll6Ek9s7Q1XHEi4YbK5QQm3Pb3twMT/QDVa6Vgrw0dxoT4a0Pq1Dq20+B9jjLt0/wXXXqdxaoXZnKUJQUwTV9HZ2hLYj1IyMHycyRLP7IN9WZVWF6Mqi9lDxGFSfXCQGHQ0SDIxwQVDMb3NgqUHd+abVh8SJPGWQdhGksLttAWj1DxSTDWIhVtY1PZnmHgCFBtc5NDmAz5MGQfQOnlPk4gIEytCw3t
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB3941.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(110136005)(54906003)(8676002)(4326008)(8936002)(316002)(186003)(64756008)(66476007)(66446008)(66556008)(66946007)(478600001)(76116006)(26005)(6636002)(52536014)(55016002)(9686003)(5660300002)(33656002)(2906002)(53546011)(6506007)(7696005)(71200400001)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: WDqKT3asVLIcMfQE8KguvwKixLajWV2KA3puQjmxCewHDkHmj0JM1oJcPIW1pQHTBhB1wHDqgFCTsW8jrDC+F97MuRQovRAHL7SH0kFBXWI+f0n/Exkey3wpQCKT6XdH6N4Dme/bmSlP4Wn9CEIxUHK6ZjpcNGFcvEe8cM8IKB45eFadBiQQIu0d0CaaxMt9VCTd9DQ4jLwcI62OGoo84113CTr1JCYaQewbQq6PH4pyw7zuXdy048mnc6nishBMDR8y5mw1cGS/ZUYoXBiLRqyVxL9ZxNuHXAjAIEwyQPgU8OWpqhyEflcsaMaNWA3Ooa80xGO8m5W3vtkvd/tbcWnKqzSSmsA0hiGuue3iZff6HQpnipNcLbKOOX9C9uKKu5oeb7LpcJewOFRlMOalu2uOgQLvRrPbFPTYOBVevC+skKZ+HtzUt87yoN08Rw3Ey/5jUtu6VWI2fDuX6bpxyNOG6uxsWASGage/vW/2lXBfdvmznuj/1q0uePRcStL0eAc4Et+ZjnilU1Csn7+VZfhdRChZzbxB0/BC1QFToTneb+2wdHyAWOjSKype4SpdRv3jhmLZuCzrygZdtpbNQdYIBXtwBYWMnaqbR7MacXm2Ob7hrRiu6F8Ad5FgrxEi96Qlt7O1VmTryEwaQtZVtV2p1C424Y1rBnTpvJdOEGq/YWRQ/nD+YY2RX2EzE+WSOwZIOvPgNFGXkwjOusQsbWZfSlwY4532kKQr/dDNK2ZdL/BDfqZh9NxcppXMtWBYerOwSD7dy8ru4jTvzNJrM2b0ItWowCPcbZo+eQXkeGU=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbf77ef-92df-4839-aeb2-08d7edb8d8d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2020 10:17:26.2182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qW6Wq3u4yMC/f0Uh0rMGDAJhWnlFA4giF/lT0gvMuGjPbJdiNtD9Gaoa+r6zfdrck3VHnEmssD7uTotfQI2gxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5736
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Greg,

Thanks for notifying. I have submitted "[PATCH char-misc-next] crypto: xili=
nx: Handle AES PM API return status" to fix warning.

Thanks,
Rajan

> -----Original Message-----
> From: Greg KH <greg@kroah.com>
> Sent: Friday, May 1, 2020 12:25 PM
> To: Stephen Rothwell <sfr@canb.auug.org.au>; Rajan Vaja
> <RAJANV@xilinx.com>; Jolly Shah <JOLLYS@xilinx.com>
> Cc: Arnd Bergmann <arnd@arndb.de>; Linux Next Mailing List <linux-
> next@vger.kernel.org>; Linux Kernel Mailing List <linux-
> kernel@vger.kernel.org>
> Subject: Re: linux-next: build warning after merge of the char-misc tree
>=20
> CAUTION: This message has originated from an External Source. Please use
> proper judgment and caution when opening attachments, clicking links, or
> responding to this email.
>=20
>=20
> On Fri, May 01, 2020 at 04:28:06PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the char-misc tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >
> > drivers/crypto/xilinx/zynqmp-aes-gcm.c: In function
> 'zynqmp_handle_aes_req':
> > drivers/crypto/xilinx/zynqmp-aes-gcm.c:137:5: warning: 'status' may be
> used uninitialized in this function [-Wmaybe-uninitialized]
> >   137 |  if (status) {
> >       |     ^
> > drivers/crypto/xilinx/zynqmp-aes-gcm.c:87:15: note: 'status' was declar=
ed
> here
> >    87 |  unsigned int status;
> >       |               ^~~~~~
> >
> > Introduced by commit
> >
> >   bc86f9c54616 ("firmware: xilinx: Remove eemi ops for aes engine")
>=20
> Rajan, can you send me a patch to fix this up please?
>=20
> thanks,
>=20
> greg k-h
