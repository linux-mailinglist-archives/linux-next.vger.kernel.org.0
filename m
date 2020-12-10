Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A1F2D55E1
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 09:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388264AbgLJIxJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 03:53:09 -0500
Received: from mail-eopbgr40069.outbound.protection.outlook.com ([40.107.4.69]:18870
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388255AbgLJIxG (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 03:53:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eP9in2/ZD2G9iliIq3P76wx+5E5QDHnoBoA6nmiibNqeARHIYlQPKiv/T69VZJJjZKsXqO8+iWmX6TaLKIb/ao1H6SYz0q/Y6Wx+tU8+LtQsIf6+W1+i3cYHZX3S8uR1XXMvlCgsN46LnnBTzb2Zn0b9CSR5qSjewVRkrPMHi3XQw0kdhaShS8EG2H92Uav9EZ90KAj2y9xz0YIMKnmUBxdRPcJQBhF0Grz4L0SY1qfucbBrUDqz5bJ5hMV+iZTGQEftsITPQ1pQK1FJpMKD6NSLOmuc/tYfrqrdXDhhiVJPQqvxi47/QVLEF3heyUHU9hoeu+30Ga7+OfJLTXQjOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3diIQ7OXgsD0qHTdIuJcPmUaeGVV8QJrCCfA0QZeuw=;
 b=IBXjjmslsYmtlgHWU7H8WMqHep6RZQzpp65RyP/ADvgihZhFLZE3bxUOn8BJ0GMFSzphXkJtwTzQOfZW+9E6MgK29xcG20wNlSOOqgT2CS8Kpk3774iJ9FLZl/VwRGvsnpBGYmEW+AHrKD4RQE7jtqDfxTujhYTM7c3/AB2iq+Isem7vI3jO8R+i1SHZJX4Z4L9btnbcpCvZKhChYkEZLA8Q3TiY+5TMI2chfih6PIHpJW5ZHwFSxjmAqKkOBbAl+/wwUj3KcwuWn8PvAT4EWOnJdpkZmvRAnJRODSXrncy8ro+miyRuN5lnyuLqGJ+1IED4mpQGQlMdQxs3rPfpFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3diIQ7OXgsD0qHTdIuJcPmUaeGVV8QJrCCfA0QZeuw=;
 b=MfgUYIkHBr2yKxF6o7IYwIaus2oa3bX8pSdpJYBrUmLZbB7XYKwo2bgj3zpUPEaLsIQvoD0cWB26pvFrn+uQEeRZ8YC5bk5E3r030iZ8fxrLMqNAWBVaxrRlmZON0h36h7sJu1Qg2wSxTumMbdwvroE+Ag+DtkxW9CmFHakZRyg=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR0401MB2373.eurprd04.prod.outlook.com (2603:10a6:4:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 08:52:17 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 08:52:17 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Pawel Laszczak <pawell@cadence.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: Tree for Dec 9 (usb/cdns3)
Thread-Topic: linux-next: Tree for Dec 9 (usb/cdns3)
Thread-Index: AQHWzo/azlCvSJB/Aky2bACp1E8uPqnwBkKA
Date:   Thu, 10 Dec 2020 08:52:17 +0000
Message-ID: <20201210085147.GB2388@b29397-desktop>
References: <20201209214447.3bfdeb87@canb.auug.org.au>
 <7e4ff29c-9fa8-219c-a17d-e9be9a2a92ab@infradead.org>
In-Reply-To: <7e4ff29c-9fa8-219c-a17d-e9be9a2a92ab@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 01418c52-f242-4178-930b-08d89ce8e5e6
x-ms-traffictypediagnostic: DB6PR0401MB2373:
x-microsoft-antispam-prvs: <DB6PR0401MB2373542A4038910E4F21389F8BCB0@DB6PR0401MB2373.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NHj1bjzY7bu17sh4zGYR9rO5H+r27z1eceVHrXsnauGKg7ZQuEvn1Ty4GRo0FHp/+471jNg6LIOWqbqlgKvWUuXF1Ua8VkZ2bf+c3UNMLv6HX+BixDHDITip4alVKicsjaQaWFHMQf4K0+yG2YY+Lr8Aid5crIj4FxtlVrZj/BotBb5RxZd50l+kERujqdBlqCDkUb5RhOT+9i8hGEAbYMUocnMDr0hZEEyOhBgFACZMceTKwEhtlon8J31KAEmyyNEilZIqmZvdt5G0koPZssLTUfCaV0sgiyhVdRrfQka2JsvZtMpA4XyxcYRlkugGETvUjQJKmvvGjdcNVDLxvg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(33656002)(86362001)(478600001)(6486002)(110136005)(54906003)(5660300002)(316002)(26005)(9686003)(6512007)(186003)(83380400001)(64756008)(91956017)(76116006)(33716001)(8676002)(66476007)(66556008)(66946007)(8936002)(2906002)(66446008)(1076003)(4326008)(44832011)(71200400001)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MAg0AWawjYYH9hiXQXkxODGuwGa9KKYTMTnD3MXW1FLAVOWO3yuQI2Pa8YYM?=
 =?us-ascii?Q?ZTSEQBHtReEZmEu0K5bOnoiZwreG5afW9LCfxpG5XqGrTl9duw+q0gJvoaqQ?=
 =?us-ascii?Q?F0XLrmHicbyHRR3EacPcl0TiD6WP//6UyZnBKl/8jyub9rJfHxsqYN7kEGRR?=
 =?us-ascii?Q?xmjtBqTk2NpmRq99XKi1yDl13sV9+mKBycr+1aLgFFSlgjVi4LYr+q5dtGbt?=
 =?us-ascii?Q?PPTGPMGfaGUsJGECiKuV2IoBMH/jsXlhSgokQZ0urqbYQymbELGTCC/jzVvw?=
 =?us-ascii?Q?WBGjgLrBjAqmmMc5aXja3jICYgt/4ZJknR2YSbsLqFqleY9zZAXZBD1rNF7O?=
 =?us-ascii?Q?rByjsluPFF5wfLALxIf+pvXQI8K8slG0MYYWQrOXY+4vp11E23Z0SjpyFnsC?=
 =?us-ascii?Q?tVUHMQkkjTS+RajRJFpoDObIH4qxPt+5hEHZMJUN25Yf3Y7UQ1r3cbB4n7IX?=
 =?us-ascii?Q?DCRjQAVLqlQPBk8y13zL/AhY3pJPk/ieziBAVuDdQB2+CavpaaNJEf3o2pm+?=
 =?us-ascii?Q?zawJsd8VH4Bz1PqbigiDRwlEtu/FxBFvCj6h6QYTmK7lTQxH5pZPyZP0aCxx?=
 =?us-ascii?Q?3bQuZjQA2ofm0PKsDlxCQDqyDhY7qNHT9UMXylH4bzkxhuI2vgLcnxdwx7D/?=
 =?us-ascii?Q?uneKUpo6O8FxsqJwCDXPjh0fhJwpksZyLT3c2eFraOYzy5F8Oiy1IVnBrLOP?=
 =?us-ascii?Q?WcGFnqhOCwqJ9Db9VCyZuLJtO8rP+83++mcPgldsD9dnSkDOXJjNJJpStPxx?=
 =?us-ascii?Q?MNFY96OWkMFV0hMzkO7cXsrVX9Xz7fwkcmaJ4Zi1foO3laGMobHvQkvOqKRz?=
 =?us-ascii?Q?jKihFSlOlz0cAm2e1PaarqWQs+f0zjFRmvqtHyHpngFo/y91dSTkWbtwn3kf?=
 =?us-ascii?Q?bBO8QNwGg4uxqfANlK2yPL5qL+rpHdTdBcFEoAOdgJmukAcyNHBDxMp/e8fO?=
 =?us-ascii?Q?TxiK5Uc/BblQdtcHC44zDABhHpzgiGZbQfc1J9ErQ72Ai0j0Y8qAF324DkSK?=
 =?us-ascii?Q?cBiT?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9C7F5C2A6B36F540B5A9B226245087D8@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01418c52-f242-4178-930b-08d89ce8e5e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 08:52:17.5747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JB5Z7IEFSmHbwDFUPJEiXdnNlIC/VWoSnSnPUBcv+ahRmNM9xWInaxpiQCVgFAP2/87OY0JPKISYTNUqsCM4BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2373
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 20-12-09 16:58:16, Randy Dunlap wrote:
> On 12/9/20 2:44 AM, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Changes since 20201208:
> >=20
>=20
> (I don't know what to do about this one -- seeking help.)

Add Pawel.

Hi Pawel,

Add old cdns3 logic, when the CONFIG_USB=3Dm
If CONFIG_USB_CDNS3 is M, the host will be built as module
If CONFIG_USB_CDNS3 is build-in, the host will not built due to
USB=3Dm, so USB!=3D USB_CDNS3 at below dependency.

config USB_CDNS3_HOST
	bool "Cadence USB3 host controller"
	depends on USB=3Dy || USB=3DUSB_CDNS3

So, it has no such issue.

But after adding CDNSSP support, the configuration relationship is
much complicated, both CDNS3 and CDNSSP could choose host file,
would you have a check for this issue?

Peter

>=20
>=20
> on x86_64:
>=20
> ld: drivers/usb/cdns3/host.o: in function `xhci_cdns3_suspend_quirk':
> host.c:(.text+0x9): undefined reference to `usb_hcd_is_primary_hcd'
>=20
> This reference to 'usb_hdc_is_primary_hcd' is from hcd_to_xhci(),
> which is being built as a loadable module:
>=20
> int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
> {
> 	struct xhci_hcd	*xhci =3D hcd_to_xhci(hcd);
>=20
>=20
>=20
>=20
> CONFIG_USB_GADGET=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dm
>=20
> CONFIG_USB_CDNS_SUPPORT=3Dy
> CONFIG_USB_CDNS_HOST=3Dy
> CONFIG_USB_CDNS3=3Dm
> CONFIG_USB_CDNS3_GADGET=3Dy
> CONFIG_USB_CDNS3_HOST=3Dy
>=20
> Problem is mostly that CONFIG_USB=3Dm and CONFIG_USB_GADGET=3Dy.
>=20
>=20
> Full randconfig file is attached.
>=20
>=20
> thanks.
> --=20
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>



--=20

Thanks,
Peter Chen=
