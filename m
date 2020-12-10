Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D377F2D5798
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 10:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgLJJyr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 04:54:47 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:8016 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726209AbgLJJyr (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 04:54:47 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BA9nRpP028467;
        Thu, 10 Dec 2020 01:53:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=bha2qnQS/JqI2wcVzr0sJPFAgLGw/X4bXk5GD16p0RE=;
 b=CbywxqQeVnOJPu1HtX3ngrz3l9AYbP3y6EoQtZQrc6Z4hCo7lsnCTBtbtHFj16tfdW8J
 uBZY65ZHJM0cgwYAfPp+Tyi8wygm/X8d3Aaf3Etwe3gDjlKTzqMArBs7Ssde7R7JY6VM
 QwyoakRinGePqhafA9NzK4UcjwoI49+kyfTyaUsUIJ7vMhBJypFIDgXvGKOOBBvTITTf
 oYg1P36Sksq24fO58/ro44A6NKlc7ECj2Rc6S+XFQ2Vr6i2vao7/JwleCtrLya3iyYv/
 KfTxlp183suGXzx/T3IdHs42KLKq8XjGc1pI6dLjVVDXuYDVk7Z768JQYoWRoKwgZQz2 FQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
        by mx0b-0014ca01.pphosted.com with ESMTP id 3586p491wn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Dec 2020 01:53:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmO9qslgSeGicnYA2LNj8j36F4qd3qTV0R5D7cU7jma20A2hOBS5OkNqFnTV5O6pCZ4lWQl6iePHqaK+AFG17kVdng7pOr+yn71kkQE4U5u3mdW7D6E1F5SY1KURvI4PUVZMSLnQDV7GsFKCDZDuRQpJ+q2LzKSH0DyigmMVk/w+r0UPHTjQCrbXuEYkfx7WGg3UdwC/4ktR7TOb8GgFiRJuHOdXMgGcjIL9zg77XlOrlHYZQUuWpoCBsYQkA5cIG4aYtH/QUNeL39cYWBcfsg6cAs1x4qgb/9yQDDA9N3WIjbsNw4JkJhUyxDcgWO1iEqc2rN83x6Rj/vo7rU2T7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bha2qnQS/JqI2wcVzr0sJPFAgLGw/X4bXk5GD16p0RE=;
 b=Pha0W9MIDBmt161o98VlbqESYr7tAV50bKd40XevRUTMtLCfmWTMBoJzg9q31O9h80FjVNSoPw3Gib9h2e5w6KXkhfRoX5ABsFQRvbHxHSCgDyw5MJ4wylsvJSV59DCwDYGKKRgVtRqaxtpWhQZM7ElT7RgIq4TROZ5VihkkdFP0f/FioaPdNRuQICsFiDpfC7XSU/4bnyCHK69HQAv+B0ReqrjvI249D8t2RZxG12qmVmekaShMPmWt2spATR6BHTx4y1gD+yuj3es5r9tug5m7w6ADRScOPwS/SGx27dIr/QnOfyb92MLGVOLzyZbBgWvUm1aTqXXN9TNpvy0D3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bha2qnQS/JqI2wcVzr0sJPFAgLGw/X4bXk5GD16p0RE=;
 b=zK0TzcgEbZD1eXKoKgKlZ/KYRAGsAemaQ9uZN+m1EmKufIo9lmphyhcv5+NvaxBLjWmkBXtjdU81c8Y608ELgK5aCsjKr+xUdq4rIUv2qWfw1LJwgBEWObxKctPvuKBry6NJiQKVPs6MneMrQG9gcBPeHw2AGZCZyut3ONw174M=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BYAPR07MB5688.namprd07.prod.outlook.com (2603:10b6:a03:a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Thu, 10 Dec
 2020 09:53:42 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab%3]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 09:53:42 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Peter Chen <peter.chen@nxp.com>,
        Randy Dunlap <rdunlap@infradead.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: linux-next: Tree for Dec 9 (usb/cdns3)
Thread-Topic: linux-next: Tree for Dec 9 (usb/cdns3)
Thread-Index: AQHWzo/azlCvSJB/Aky2bACp1E8uPqnwBkKAgAAQFvA=
Date:   Thu, 10 Dec 2020 09:53:42 +0000
Message-ID: <BYAPR07MB5381DD2499ABD871C0E4B118DDCB0@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20201209214447.3bfdeb87@canb.auug.org.au>
 <7e4ff29c-9fa8-219c-a17d-e9be9a2a92ab@infradead.org>
 <20201210085147.GB2388@b29397-desktop>
In-Reply-To: <20201210085147.GB2388@b29397-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctOTNlNDQyZDMtM2FjZC0xMWViLTg3NzUtYTQ0Y2M4MWIwYzU1XGFtZS10ZXN0XDkzZTQ0MmQ1LTNhY2QtMTFlYi04Nzc1LWE0NGNjODFiMGM1NWJvZHkudHh0IiBzej0iMTkwMSIgdD0iMTMyNTIwNjc2MTk5MDA4NDIwIiBoPSJqeitJVnZRZnF6dFdVRTRsTHdJbklNUFQ2Y289IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f04948e8-4546-494b-5f9b-08d89cf17a16
x-ms-traffictypediagnostic: BYAPR07MB5688:
x-microsoft-antispam-prvs: <BYAPR07MB5688E6E01DBEFB0085B6D2D1DDCB0@BYAPR07MB5688.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l41dy/CfoMn5VUuD4wh3D+FatRoDrPUAehHyFovEmfzMrZ9LvFB0JxGb5ghj56mcd6o0XiNmnNhFtbIpGi/iJT7HwlrsjW9B9qpzEp73yofCEIUcJSCli4vHc1EVoj3j4eQEgPVw2VTh0s8ITwYBEY5yzwBKhmVqJizVZonJ7UdauPhKGSIoBfPq4R7XENkMpoz6ZuQwkM77VxU+I8Pd89EN0c7Nkh/b4tJRWnhwfuphPtG2Fju5SOy9V2NLHQeG7bM6MvzM/eQ9mFzCb3nvQVVkuNZYh65jJU2X2yWKXkmVjGjF8vopq2y1qWdD2SE5rDOI285CROTw52/qT+ylWnhngSkRsxCaNf9wISJDu2QfLxQ/6pfZe0huYAvf0DNM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(36092001)(76116006)(66946007)(26005)(54906003)(64756008)(66476007)(508600001)(66556008)(33656002)(86362001)(110136005)(8936002)(9686003)(186003)(83380400001)(4326008)(8676002)(66446008)(55016002)(53546011)(71200400001)(5660300002)(2906002)(52536014)(6506007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fsJiANIELdMSz8pI87WtE6RpPa93bVwnIeWs49l9zg+LBaBStHsJ/ARDBuM6?=
 =?us-ascii?Q?0WB4EE4k9De4Dg1EF1+LvHw0BFF2ALOBguhXWcx96Rhc2yEHRJg+KBBNyT3T?=
 =?us-ascii?Q?GLXbM2pFFNU2k6+FZCIy7sPFkqvMsXzU7pUySE3nYy0HfOeWBqOZtD2KYCiW?=
 =?us-ascii?Q?e9RTVndIzqrfyYfgVQkkDcsUwVAnYUOrtk7kKgsOVgwN4PAIBgzcZVH4wlr+?=
 =?us-ascii?Q?rteo+n40gUvyWbtcb4VVDU/SXjQeO0dKk8Tb899oCh3YwHRzRlDqAxvUHUr2?=
 =?us-ascii?Q?AHXhI+3ziGWwdh2l9SgoKkCZKXz//+fX+rWYbyDWGhsEWSKVJpwZEym/SPq1?=
 =?us-ascii?Q?KxySHjjwghj25QSVEjvZZ5XkKh30anDsF3PEBsYqf3EzcLE0mdfZtxwD66yu?=
 =?us-ascii?Q?QrMLtJyEzd3mNwrj7lTzOdbDJwg06EF6Z8niCV7488qANVxL7M4P487dUOBH?=
 =?us-ascii?Q?z7PSqGME3/7Wmr4RHudR0p9FsdDlqOz5SquBVd7PlogXlLcCJQjdAuuMfxX4?=
 =?us-ascii?Q?wzYgLz1A43r1m/Ams/18Gvq2e/GsrFlTJCRAlRloVO7oK9ikg9N2DpMFDI7r?=
 =?us-ascii?Q?BUC6JwBAYn8xQVo7nCK/zv7nBp40K+sQ7CpI7Xw47s2YA0wx26qWCFUEVyWA?=
 =?us-ascii?Q?+pckgrChqPs2PtnDBDUM/NT/YJwOK6SVC7diE4wlHDH+Mz/DwFlbea+stcUY?=
 =?us-ascii?Q?fTpTMI+Lfv9SdDP3q9qnQdtBayaJylpwQZKiVyYvsCZh1+6+L9G8qS96YqxY?=
 =?us-ascii?Q?vcbndWBx7vbBLCO3x0gnTjE4vAGRqUZSvPVxGVeM56xKEEmF0R3YsRyBuhLq?=
 =?us-ascii?Q?IrmRdOK/VRI7swo6+IEkfTQoLVLo+4byv2/KPFLV+gd93tuv/Wt2/AU9Ki7Y?=
 =?us-ascii?Q?ptjfrKZZbQt5UYztXr2TB5v+d8WrjKw8Y0Ceo8qEHFI5Pjh5DVYC5rSKTE+b?=
 =?us-ascii?Q?eZnvhM96hXGipTcIa+9LJpSSPdgNyjFx//hWZ8Pug3M=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04948e8-4546-494b-5f9b-08d89cf17a16
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 09:53:42.1093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UjfG3LVeKmvLsHt/XQqFRAWQdmHI33KxJhl6OPTGEURQ/T/Mm+R2GbeuzsnsqopaefE5UJEEkpvLHJl08WrFe1fKoKJBwaDXDVE/J1Ef6bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5688
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-10_03:2020-12-09,2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=663 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012100065
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org


>
>On 20-12-09 16:58:16, Randy Dunlap wrote:
>> On 12/9/20 2:44 AM, Stephen Rothwell wrote:
>> > Hi all,
>> >
>> > Changes since 20201208:
>> >
>>
>> (I don't know what to do about this one -- seeking help.)
>
>Add Pawel.
>
>Hi Pawel,
>
>Add old cdns3 logic, when the CONFIG_USB=3Dm
>If CONFIG_USB_CDNS3 is M, the host will be built as module
>If CONFIG_USB_CDNS3 is build-in, the host will not built due to
>USB=3Dm, so USB!=3D USB_CDNS3 at below dependency.
>
>config USB_CDNS3_HOST
>	bool "Cadence USB3 host controller"
>	depends on USB=3Dy || USB=3DUSB_CDNS3
>
>So, it has no such issue.
>
>But after adding CDNSSP support, the configuration relationship is
>much complicated, both CDNS3 and CDNSSP could choose host file,
>would you have a check for this issue?

I can recreate this issue. I will try to resolve it.=20

>
>Peter
>
>>
>>
>> on x86_64:
>>
>> ld: drivers/usb/cdns3/host.o: in function `xhci_cdns3_suspend_quirk':
>> host.c:(.text+0x9): undefined reference to `usb_hcd_is_primary_hcd'
>>
>> This reference to 'usb_hdc_is_primary_hcd' is from hcd_to_xhci(),
>> which is being built as a loadable module:
>>
>> int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
>> {
>> 	struct xhci_hcd	*xhci =3D hcd_to_xhci(hcd);
>>
>>
>>
>>
>> CONFIG_USB_GADGET=3Dy
>> CONFIG_USB_SUPPORT=3Dy
>> CONFIG_USB_COMMON=3Dy
>> # CONFIG_USB_CONN_GPIO is not set
>> CONFIG_USB_ARCH_HAS_HCD=3Dy
>> CONFIG_USB=3Dm
>>
>> CONFIG_USB_CDNS_SUPPORT=3Dy
>> CONFIG_USB_CDNS_HOST=3Dy
>> CONFIG_USB_CDNS3=3Dm
>> CONFIG_USB_CDNS3_GADGET=3Dy
>> CONFIG_USB_CDNS3_HOST=3Dy
>>
>> Problem is mostly that CONFIG_USB=3Dm and CONFIG_USB_GADGET=3Dy.
>>
>>
>> Full randconfig file is attached.
>>
>>
>> thanks.
>> --
>> ~Randy
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>
>
>
--

Thanks
Pawel Laszczak

