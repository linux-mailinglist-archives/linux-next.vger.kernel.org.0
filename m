Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 731F51A718D
	for <lists+linux-next@lfdr.de>; Tue, 14 Apr 2020 05:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404475AbgDNDQp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 13 Apr 2020 23:16:45 -0400
Received: from mail-db8eur05on2073.outbound.protection.outlook.com ([40.107.20.73]:53952
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404224AbgDNDQp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 13 Apr 2020 23:16:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXqlkn+tY1VlsVijldd5Qz/wiT4cbwWia4Bk5JA8oQ8BUBIWUcIuta5XKWNzoVcrAePVWF0+yVaA86FfTJOCapgGB4vTc++ByZUPNXCv8UhxQduVNt96HdwkRec8f0DwR0irUoWbzhj8vv6WNqYO8ty2vGyYuhVEbr3YdmZLUb2ItZl3aPq+BWVSZnPkEgm/CxlF9c3RqmjIms+TsEzAftSzeKXl8GSYnX18EOU4n8ORwnmNk+51dchzaCaiLrJwzE8YwwxwWOdJ3ixNtqfeNtHgBD2AX/nw2Qw+HdasIo3YQaVbg6NUV9jGuMaAknVO/YovZjLyvGPmPOu0uTCuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzLWLEkYNjAu+FApb1h2p8/fxeE8p246Cya6mfyl158=;
 b=HenW9e41qqx+XGTO477vBXeCzaisLPE6NgqW9D9d9qQlC30aB7cDxDv9QxpLDwlWtiajcDZYhePSMUyQCpCcEf9HRkFSrloIPLfHSqzKv+977bdBsSuxR0/3i36RGq5Q2/0GYbxsM/LdnSfQeHjdHYkJ1sg9/shO2IsWlRQ4TWaySWBX8YWPLLgz93IBXQq4Vm8Jt9XGeIEhs71OvphP5XBBOfvOOMfPw4ji2cHigLVtiA1FRT9XW4SLi77LbSFrOCouXM7/IA92H26d9z6BNbWO9ZhDQlKZvFhi2wYa3qg0W5fmlPV/pwC+Dltd9sByRC5oWLyr+U7+mw5KYmPzGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzLWLEkYNjAu+FApb1h2p8/fxeE8p246Cya6mfyl158=;
 b=SB6euQ09wDzaYAbIHUeGIZul2s59bBktdplowuLMIgTSbKH8c0fTj+bHl7rIKKehj9dd4jEnQ7C12n+n/nmXEh/T491/5/xlbl0dG94bGck6h0kg0g2it4OGcbUSEqHzhrQi12VRubgGPm1d8fLQXYtdiya5ORmgOvJGhkn0NZs=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (2603:10a6:208:70::15)
 by AM0PR04MB4483.eurprd04.prod.outlook.com (2603:10a6:208:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15; Tue, 14 Apr
 2020 03:16:41 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2900.028; Tue, 14 Apr 2020
 03:16:41 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     coverity-bot <keescook@chromium.org>
CC:     Oleksij Rempel <o.rempel@pengutronix.de>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: Coverity: imx_mu_scu_rx(): Memory - corruptions
Thread-Topic: Coverity: imx_mu_scu_rx(): Memory - corruptions
Thread-Index: AQHWEa+QTs1dLZYHR0+S1Xns5J6QEKh38plg
Date:   Tue, 14 Apr 2020 03:16:40 +0000
Message-ID: <AM0PR04MB4481A4AEAC88B46732FC744A88DA0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <202004130921.01C9D700D@keescook>
In-Reply-To: <202004130921.01C9D700D@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b6129529-0734-4a62-7345-08d7e0224071
x-ms-traffictypediagnostic: AM0PR04MB4483:
x-microsoft-antispam-prvs: <AM0PR04MB44832E5CBD3122F0E39835EA88DA0@AM0PR04MB4483.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0373D94D15
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4481.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(136003)(376002)(366004)(346002)(396003)(39860400002)(316002)(5660300002)(44832011)(66446008)(64756008)(66556008)(66476007)(76116006)(966005)(66946007)(71200400001)(81156014)(86362001)(8676002)(6916009)(4326008)(52536014)(8936002)(83080400001)(2906002)(45080400002)(9686003)(33656002)(6506007)(7696005)(55016002)(478600001)(186003)(26005)(54906003);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iIrNMXQQZY40eW+0CxZvshFqRirOT9tRoQMhjxopHGiRmraOI/3++5nc8JVbYdleq17lUV0iK/UdVfjg29nQMkAy2J7lq8MpUPkt0Iz4LgTV+7Hvv/jjEB5vwjFpdekRggXKoFTPjSC0p5g3rM1L74yeQsdouf4YBKfl7n1Q3T3l1GBfUEK8h4kZBfVHZS+QMvG0WLJx7kuIACyU4iJXPrheDpULZKcOb7Nqq+rG2qQHtIYBSJpvCwbYZdoQ6QxZiAQEXemDwBAATdss4xZVU778H9sQy6Femnvw7UzCeDPnblp0eFMaxsUUSZNEnYXofdNqYcfrnKH8H7aX/ythSOlW/uXHYePssqShYZZiHSPA0dKYPSU5gf/cllBdv/KY0yK8sf7f5aMMH9Avq5klthZ03XkRGSL8Pewt48fitjqL1if1DGSXRC9KIBTvw0n4ARNMRQTJihPp0B4ly3G1NKHOlrsK5ZEvr6TaT5n/OJvY1Wy3mgHenOL9lJUeOftpzitHvIYpI+sOYtFG9y2y0Q==
x-ms-exchange-antispam-messagedata: eQ1KmRYHyLMsHapSBDF56fGdewIBBnyDOTM6ntmy+xX+FKCR9QZECT82pMZcya8MG7+6JgG6rZcDNXkngyiqkMZcNjODYbcGEo/Ddn4+9TE6KPy5g3ROSvpFD8Zl+z/4pSFhm+fxxk/Y6BYs5fnetg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6129529-0734-4a62-7345-08d7e0224071
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2020 03:16:40.9322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXtoCrJAG7s3nwHKzrTlReYzbjSoK0V5DXx4IJBrsZgK6XsBafUHvSfLhviHd8DpNDXn/jdjRDHdNj62wz5Bcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4483
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> Subject: Coverity: imx_mu_scu_rx(): Memory - corruptions
>=20
> Hello!
>=20
> This is an experimental automated report about issues detected by Coverit=
y
> from a scan of next-20200413 as part of the linux-next weekly scan projec=
t:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fscan.=
c
> overity.com%2Fprojects%2Flinux-next-weekly-scan&amp;data=3D02%7C01%7C
> peng.fan%40nxp.com%7C2fc3fda23e3b48113d5308d7dfc6b2a4%7C686ea1d
> 3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637223916798332770&amp;sd
> ata=3DNve1Fh6M3qPosrnqIYyipoE8Ytp3iu55FB0uymJS6uU%3D&amp;reserved=3D
> 0
>=20
> You're getting this email because you were associated with the identified=
 lines
> of code (noted below) that were touched by commits:
>=20
>   Thu Mar 19 15:49:52 2020 +0800
>     0a67003b1985 ("mailbox: imx: add SCU MU support")
>=20
> Coverity reported the following:
>=20
> *** CID 1461658:  Memory - corruptions  (OVERRUN)
> /drivers/mailbox/imx-mailbox.c: 214 in imx_mu_scu_rx()
> 208     		ret =3D readl_poll_timeout(priv->base + priv->dcfg->xSR, xsr,
> 209     					 xsr & IMX_MU_xSR_RFn(i % 4), 0, 100);
> 210     		if (ret) {
> 211     			dev_err(priv->dev, "timeout read idx %d\n", i);
> 212     			return ret;
> 213     		}
> vvv     CID 1461658:  Memory - corruptions  (OVERRUN)
> vvv     Overrunning array of 8 4-byte elements at element index 31 (byte
> offset 127) by dereferencing pointer "data++".
> 214     		*data++ =3D imx_mu_read(priv, priv->dcfg->xRR[i % 4]);

There is no issue in the loop, it is just the check should not use sizeof,
it should use sizeof() / 4.

Thanks for the report.

Thanks,
Peng.


> 215     	}
> 216
> 217     	imx_mu_xcr_rmw(priv, IMX_MU_xCR_RIEn(0), 0);
> 218     	mbox_chan_received_data(cp->chan, (void *)&msg);
> 219
>=20
> If this is a false positive, please let us know so we can mark it as such=
, or
> teach the Coverity rules to be smarter. If not, please make sure fixes ge=
t into
> linux-next. :) For patches fixing this, please include these lines (but
> double-check the "Fixes" first):
>=20
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1461658 ("Memory - corruptions")
> Fixes: 0a67003b1985 ("mailbox: imx: add SCU MU support")
>=20
> Thanks for your attention!
>=20
> --
> Coverity-bot
