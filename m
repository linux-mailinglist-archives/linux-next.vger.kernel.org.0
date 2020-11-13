Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26B092B13C9
	for <lists+linux-next@lfdr.de>; Fri, 13 Nov 2020 02:20:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgKMBUy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Nov 2020 20:20:54 -0500
Received: from mail-eopbgr20071.outbound.protection.outlook.com ([40.107.2.71]:46990
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726005AbgKMBUy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Nov 2020 20:20:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQXcLGNIf1dKfEISX/+KyFkE7o4WVDnDxjZigR6vJvGaONBYN5cvF85flun8FkhnSyfs+dtCTvDt8ShIxa4m/qSmOQ+0FGG1MS5M3u6+W5YWVfj3hKRLhEl50FyJroy3L1gxl3D0Kr6B0tQuKZht4KZqjPkF+TFVx/Tg5FdwhN1xtLYpiOk69o3rcxc4tvO/3xT+YFxHebHOvl1Uq8sVYfeWbfolRgT/xNBi7jSOxaWgg8V64pRUEf/HQ2We2orRyk8ntWWRdPwBIhl2r/AfwvIMEvITqCrKLhEf3NqcDg9UlXrHmN+B0Rpl7nPGxz18X+0gqvW8LMca4Lg96q2dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpGe9GTOn7Wyd0kwBlIk9C73L3u3wBl4FspzRSFY3dk=;
 b=EaOvhdHnyUNrzcaP29V8fDI4EmQL0PxSLVZprHJJoZiieQ5xvbcxlMhqsfxdPAe1xB1LT47Wds89IHqKFD10lgtY831O0P7h3TOb/zNj8L/RYViWDSS9gGx0d308xQrFZ7bqvFy2I1tAvMqcEZgcvgtoW3vbjpyqKMii8szcmXQQAJtTuUnmEb09Hz/LuyfynlzEBya75n5w/M8AOhjr0n/J4tR++mRhC0NJSsFTrVmrbQqMh8ggb0mFMWtKAA8OTX9OT1FNgpb+cB+wt7VkyhOoWFyTbWYR15bt2YY9Hb1EUykybxNn4kt88r64M1xLvQDloJd8icHNvryDwv1Dzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpGe9GTOn7Wyd0kwBlIk9C73L3u3wBl4FspzRSFY3dk=;
 b=YUcHePFE+nNzQhPDWh/qXPmbG2K2Sv04dqB3HctD72mgxCsxLiyKp7KaWy7yJfo0tzc5MjD+VzhJgWq1lICE9LUcqFMWzz/s2vw/Mm0qYtY483JykZ9EGwHVtFeRmRAt6iocR2sGS1IWTvbAqjjVe1uX4z+T/rBpE7h2N7hlwsI=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR0401MB2376.eurprd04.prod.outlook.com (2603:10a6:4:51::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Fri, 13 Nov
 2020 01:20:45 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 01:20:44 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: RE: linux-next: Fixes tag needs some work in the usb-chipidea-fixes
 tree
Thread-Topic: linux-next: Fixes tag needs some work in the usb-chipidea-fixes
 tree
Thread-Index: AQHWuTajWC+N8wpv7EaQ3cmiIgcva6nFQy2A
Date:   Fri, 13 Nov 2020 01:20:44 +0000
Message-ID: <DBBPR04MB7979F255D713A1539F195EA28BE60@DBBPR04MB7979.eurprd04.prod.outlook.com>
References: <20201113075838.53122e1e@canb.auug.org.au>
In-Reply-To: <20201113075838.53122e1e@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 52ba3449-a1f1-467d-fa21-08d88772583e
x-ms-traffictypediagnostic: DB6PR0401MB2376:
x-microsoft-antispam-prvs: <DB6PR0401MB2376254B9F6FF374DA51D3A48BE60@DB6PR0401MB2376.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KdSHr+b4V5vKkH4g1gqrQDjhsk+cb1/L9GZfqI8a1fbvXbD0JcjZtgR/fTAOp2lbwukWdzLWzCinmxmJr5mzF4fFHdGK6CyhZnu2m7JRp00xYZOsl+nSgZdVatp5lNpHSfwbUcAa6Keu9qntwK7c47qd3GWT8JVNYesk7gD36q9A/dBSkGo2rGLV/wZyQuH6/1+bAZCyvdtDSo9QFlAVxJ7pLMKJaofGVX6Q8m1FhSxAay5pNBLS1u3dmbQDXCWBeGxPFwhd1GSgB0kvLzPraxdvsSg6ERM52HER/uLuIcSjzI99RJa4ypbSMml5GW2b
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(366004)(346002)(396003)(136003)(6506007)(33656002)(2906002)(44832011)(71200400001)(186003)(66476007)(26005)(7696005)(55016002)(5660300002)(9686003)(86362001)(4744005)(66556008)(64756008)(76116006)(66446008)(8936002)(52536014)(66946007)(54906003)(478600001)(4326008)(6916009)(8676002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: jTMv0C9c2hQxa0gaqlwiViMvLmssdeXLVGpaSG1b1qyw01hJpRi3AaYtmX4qFz+DXIsopXAECpyZeaxjjfuXjd/T65NnuwmWQ4UiUYGG+iUzsNvXYfL4pI/XGtrZMJjOWoVkiIQQXZ9puHQ+BiZkccNZG2UvhCn1ffgd5naz+hMUAlBIojXKFrQ18BcaKmjaju9RuV3PxKCnThdF5E8/+CeXpE+z7Xt3Nqy1Ww2k/rIkEiNq0azjvUA7qxT0WYjascuyjWz/XupjB/l2w/sfyjgRCmagYdGbQKUv3o0BPRL32KbFKONiDKy7883Df4OVRRq2B0c0weyq1YmnJ2FSYjUxQpD9C4cnOKsbCjqmEjgtfH+1mO98ErMiBZq8N+tF+yg2xfkDDF5yM1fQhA4RbUZcaGW6spNC5sIZdnHsGRZo3pJx4adD5I2EdT0h5tniqB9DzyhZlPPrGesEMWEWJ7jjKcMwoeb0zlIiaM5McKXApBetlUanXvib7hF2phjbHHmeg/7C20i2+lC3a5TEdlnj8Pb0DmOyT3mtUz8DmsS8MRta8A/jyowZ4uhi+8djKtT6oPTRcf7WZKI7dNZ85SH71vND6f9lO0lv1KthP+JGg4cLYWJDb+RuhJ++NkQV8zrRyyX2OD0AQwj0WAen5w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ba3449-a1f1-467d-fa21-08d88772583e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 01:20:44.8473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YYIZkMYuHy4xXVnK8V7ULNdbHjRREO+mNjAljr6usGvkPbQ5RGzf/pZ33GmT/hpyf/9xBz67J3XW9KL54cGjDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2376
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

=20
>=20
> In commit
>=20
>   3d4ee0b42f65 ("usb: cdns3: gadget: initialize link_trb as NULL")
>=20
> Fixes tag
>=20
>   Fixes: 4e218882eb5a ("usb: cdns3: gadget: improve the dump TRB operatio=
n
>=20
> has these problem(s):
>=20
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>=20
> Please do not split Fixes tags over more than one line.
>=20
> --
=20
Thanks, Stephen. I fixed it.
I wonder if checkpatch.pl could report this issue?

Peter
