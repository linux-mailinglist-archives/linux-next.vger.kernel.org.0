Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E574F3F58B3
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 09:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhHXHL6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 03:11:58 -0400
Received: from mail-eopbgr00105.outbound.protection.outlook.com ([40.107.0.105]:58231
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231868AbhHXHL5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 24 Aug 2021 03:11:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVo4seRPfCp03sMhxgbzNnfmLJD0LCL673GJjiiBmiFrDLi2gmHXWhMizccB158+/O01WtZANZV8kgWoqSrxjD7+yCfJtWlnlOrh531cG1/c9Rd+ODbXGgi1yNbFHgKw6m6YJqsGGXbG/I69Xss+6/YdAzTDuJ0Tq9HC+gevojLglxXF9DulWlSO1EGRvOdLbmLq0YqyT5y0L/im6Z+xA65+MoP1AD+mpNnJ1s+5iRYItZHxKTvJ26DjYOK9saAs/M2QL/JzetCBUNLtH0zn5vNG2q/+e1K+EqYmkRZu9JAPWvXG1bDsOoXOrvIzoq1nWeGd+5RUZmCSvq9k/Gso8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVQ3t91bbvMjNEyTlIzXdlP2H+4+vX3SaYBiX5U/37Q=;
 b=D0wwk8PR8R2mxgAo77emEiFLBlj8k5Uy9j3rhI1VB3QEIwb0EJ0olk7d/ffgrQAL/QxfEumEKCt3wXrpfsAkKk2vgHTHEsLa875IFqJ1Hz9V5xqD4sbE8PZ8ylCyWGvJiZ4qRirCiCackb2+hruRfbP+AgS3EKdL1qYNF+CwJq4NLuLeaXh0necA02C6w3/whF76SkiRPQ79GMbRVDhcIcdvZvBG0jLNTzG3LN96QswsgRgzGp+gFPFk/GYb3aIXyussnx9c6bJOnFr8U99+WxjOKCmnkxd6rA91GrXEC954qbzqASWEl0MoXWdUqFqrydHrHjteJs4vwZQEJwOnug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=viveris.fr; dmarc=pass action=none header.from=viveris.fr;
 dkim=pass header.d=viveris.fr; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=viverislicensing.onmicrosoft.com;
 s=selector2-viverislicensing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVQ3t91bbvMjNEyTlIzXdlP2H+4+vX3SaYBiX5U/37Q=;
 b=nAPNDBx1h8RDe/FeViMp09ypRKJQSD3Er9GkO3y3xAaLXdQX4FY4/KwsvTLWnIt+4aeUo1vJF6AouypbXtzr9Gbsfppn/6+wUkQMbwm+S4TQTckqedDQURZJiezQDS29TgmDHE+jFoGWZC1w/xKpI1O+b9IGYZfDdGYjdn1JJjs=
Received: from AM4PR0902MB1748.eurprd09.prod.outlook.com
 (2603:10a6:200:96::21) by AM0PR09MB4260.eurprd09.prod.outlook.com
 (2603:10a6:20b:167::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 07:11:11 +0000
Received: from AM4PR0902MB1748.eurprd09.prod.outlook.com
 ([fe80::84a0:780d:1c5c:4432]) by AM4PR0902MB1748.eurprd09.prod.outlook.com
 ([fe80::84a0:780d:1c5c:4432%9]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 07:11:11 +0000
From:   THOBY Simon <Simon.THOBY@viveris.fr>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
CC:     Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the integrity tree
Thread-Topic: linux-next: Fixes tag needs some work in the integrity tree
Thread-Index: AQHXmGzeUGOaW0K2mUWUDOE91FksxquCPZQA
Date:   Tue, 24 Aug 2021 07:11:10 +0000
Message-ID: <a37d31eb-7fe6-ce46-c40a-d30654394b3f@viveris.fr>
References: <20210824081849.75909e73@canb.auug.org.au>
In-Reply-To: <20210824081849.75909e73@canb.auug.org.au>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=viveris.fr;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba43b675-38e0-4ef4-6f35-08d966ce5a23
x-ms-traffictypediagnostic: AM0PR09MB4260:
x-microsoft-antispam-prvs: <AM0PR09MB4260C184C80B97E029C6A18B94C59@AM0PR09MB4260.eurprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JDbLH0+T5TEuNceB2DZEv+/33+AoxYvsUx9QweC4Vn7Stgv+IHLbkbhq7L8Bf3ABvnDI19WSGIKraQWMJJATbIHOSBlZ0x8IHapa/MLxb9W0ijojcvRAJ2aZ1BnwiDhVsC2k/jswWxv2ofB3xjfB9nxpN/rFywGa/mS5rkuJ6ITWtc0V8nD1CyqlXIZnCfPZfcutGGdtgw6oYPaJdAoMoawHhT8Lln98vA5069W4eXnD7wyPURxiehZXVyDBtqqlXp1pXxrZFy01c0KkaE/6CowdDXwUXagbQZa+ZHfItAM/W9d2UL2SUd/hm8J7HoOSacxLCpmAACulkL1qgj5NlQFAGaIAWsSPk27XqC2VZXS+fj2wciW+cbUP15LK1EwcUqDwKVonmTITVazAAZfOVpUUaa3I0+cvLZNysPA2n9y7imD6dyFH8Qzw1odpFxpnOkKVDgr2bPTSfSnix/5vgoRpmiKBNNJsSFm0qt5KQQaXM857pFbCmJ2nHvRlDYauUB1ik3qH4QIty70p8H5vCRAiq2RnDoHaNEVzt0RL6qGLj2VftU8u/qn2XSvwYq3Op+2ejVnib3KuHBTHf8pzb7wkE3VC7dMITu5kx+8mgRhKz0SDOqOYA9Yk8GdnREI9UA+f4LK8JzKrJHiyLQ1FHEkQ8R6k3MYkjFckgBRRsU1XG5tbl65bcCPlssNawBbVVqe+DDUSO2+4iztN9PsA2zThcJWJQ8+See5DtARER9X8HTO2fXs7bepCVQNRhfUo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM4PR0902MB1748.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(366004)(346002)(376002)(136003)(6512007)(2616005)(36756003)(31696002)(186003)(26005)(83380400001)(4744005)(38070700005)(53546011)(86362001)(5660300002)(6506007)(8676002)(316002)(66446008)(66556008)(110136005)(66476007)(76116006)(4326008)(91956017)(54906003)(6486002)(66946007)(31686004)(2906002)(71200400001)(478600001)(38100700002)(122000001)(8936002)(64756008)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?2vIWkF8W3R7Y5sLTiRJgJXH7fA2j/F4rx+rULL2CtdETCH/6cWJQGjs1?=
 =?Windows-1252?Q?EHsws/ekwW+KbGbM34O4eXVSRX3bodBjyvx0V8VLCxi/oQwn2EQ8u2Pt?=
 =?Windows-1252?Q?kaYBRBVD7lrQRHbJk0qcxE+Gd6cMxVdUTlzLGKzmbhKTEtsciO6C+mtL?=
 =?Windows-1252?Q?juxxJbfQvs6Iy4Sx5/yvwpNyGoiOAqrw8FN6LzEuWbHcWOSp3YGpsNfT?=
 =?Windows-1252?Q?A+ni8riORWq7nkxMk+lXUPTErb9ZyEanyDyoFJh+fBIVCBHz1qVN5cXY?=
 =?Windows-1252?Q?P8pUuKdiVeqm27xSUsoRbkoLxm2I6nlhSCaYBifPUAAzsy5EIQGw2bDW?=
 =?Windows-1252?Q?7D2zW/2UvXK60XudeT5IaeTX/Le1efVcIXbuMWr9ewbTK6KqdTi3PN7c?=
 =?Windows-1252?Q?VJQc3011AC76wLtRy+N9dTpW2g4WuKJuWvdCJvG6Vqvbl9YeECdv7qBo?=
 =?Windows-1252?Q?tsYJsJi+PC7YOSLSsDGVTxkjwL8zBzRYw39YsFCjglFYSOr6DSJIAbLQ?=
 =?Windows-1252?Q?1Q4QK/J7P4+aQmvvOXfPg8y/dAVF/qf8p9H/YqDBm6vY6lUpiSDkjQox?=
 =?Windows-1252?Q?iP29r8Ujq7+ilL7ATcsI274KDn9VwRaVyD7q3VBtvH4mFD1QvCdPk8N6?=
 =?Windows-1252?Q?KUzKsQm1XWWPWZ13wbvqiMismHySNXUyQLy1kf7If86lB/8IjlK+VVip?=
 =?Windows-1252?Q?l3efOLHSo+y7m+MH4GOdgXH1OI0dzMoxGHoN3E5KmNX5aK9XHPnnAzls?=
 =?Windows-1252?Q?qj0e5EQEk80VGBcjRMaulTsLET3OY7oMiFlKNdNexmlRGclbd7CTkR1/?=
 =?Windows-1252?Q?C+QqyFxVkGBQluijDS1ilMjf+hRbhUiOq9j9+2dai2oylVqa0eDDfk66?=
 =?Windows-1252?Q?m0veezvsW/gf2OAs6pz27BgB4q3fH0fuVl2fcfa18y3pcZqI8K2VuCRH?=
 =?Windows-1252?Q?LG2jq+TxYxA0CweENNWdc4Ayg4g1T7idHxznSMXI9XLk58gB1ovTp1+c?=
 =?Windows-1252?Q?7EjZwwMcm3b7FuMLXx8MIuIJDUypFGmaLoiIJzSsJY6kBUvPFdiH1uvn?=
 =?Windows-1252?Q?lAc5tKH7ouzIugGsRldKUZuCfUtoRbnhzAW1+ajcKMjqWfci3pRCNEEp?=
 =?Windows-1252?Q?dQtKYZYI/T6n7f+QaMM4C943AW8BuckXv4alV7nV/LlGn2KJWbXeZMMq?=
 =?Windows-1252?Q?e+Ci2Fm27fyQbbnnTqglDpZ63ElapOWJnfVSJvRYRupwKvIKSjzgjIHc?=
 =?Windows-1252?Q?ctr6p3v81j+lh9Q+JAv1Npd5wlvYPsKYRBN6t98mUDU89FHTsZ8WYm2v?=
 =?Windows-1252?Q?/h8whiwPTv2lM2RVOwSEOQWAHnQ5Z0/03lUgqgDWxEtN19Me3WbZes81?=
 =?Windows-1252?Q?/BLCBwm8FiLeUvjefuVea/51Gn3H6aK3IT8G6bXcTFJrlBjKlWV/tmJs?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <703407D5CD889C418B4E8E99B5F9F937@eurprd09.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: viveris.fr
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM4PR0902MB1748.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba43b675-38e0-4ef4-6f35-08d966ce5a23
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2021 07:11:10.9984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 34bab81c-945c-43f1-ad13-592b97e11b40
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 99XNVHtwwH4AFtObM8pRZ7SiM9G0ssZupxWXCsGZqo3fjduxIqjpJwxMP9XrGtghOjVXBnYLVtFoas7lGYxgxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB4260
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 8/24/21 12:18 AM, Stephen Rothwell wrote:
> Hi all,
>=20
> In commit
>=20
>   c594ea470f30 ("IMA: reject unknown hash algorithms in ima_get_hash_algo=
")
>=20
> Fixes tag
>=20
>   Fixes: 50f742dd9147 ("IMA: block writes of the security.ima xattr with
>=20
> has these problem(s):
>=20
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>=20
> Please do not split FIxes tags over more than one line.
>=20

It's my bad, I didn't check the line wrapping when I copy/pasted the tag :/

(btw checkpatch.pl doesn't detect this behavior, maybe this is something wo=
rth adding?)

Is there something I can do about it?
I don't suppose we can fix the commit, that would break the history of linu=
x-next
(is it maybe acceptable considering it is a "staging area"?).

Sorry about that mistake,
Simon=
