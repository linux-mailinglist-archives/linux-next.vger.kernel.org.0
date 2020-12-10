Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53AC42D5927
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 12:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgLJLZX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 06:25:23 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:10096 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388301AbgLJLZX (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 06:25:23 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BABJUoQ020307;
        Thu, 10 Dec 2020 03:24:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=lfQvnuV9/hET3e6h6dEP6kwexHQzECvSPFsQM0SjgWw=;
 b=D9rY+AOPfNNBG86ZNf6cgtP3EDtdMhL7wvY3ym/FfuLbvGVW2cvG/Zesm1Ql7Xur6dSZ
 THBhqQ5RBmzkPkKmcuLRyOLLh0spyWHVukFtO2JkKNF57fuCeguET5uX6h2vMneRvYXD
 vxDWd7hxUITWThnXpqM4KTzwPLmBorXLcTw6MGQqsreTwYuTCF85Wg2LTZpf1/GVJZem
 5/5yYQubqojuz9WP99lsDCGx1UXy3mGRZ3hfwhJWmhwGbTvHSUanaBTtMZM520mkMdle
 wvrPJbdqE8oUyXd7CiIB/ekCpSsJDK8NsH5atwZI2Hnju01BsrK5YRZDeg2ohA1zVEcm VA== 
Received: from nam02-cy1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2053.outbound.protection.outlook.com [104.47.37.53])
        by mx0b-0014ca01.pphosted.com with ESMTP id 3586p49920-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Dec 2020 03:24:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akRilzd6uyYDYlyGPvR/LDCR5bo/Aw4b8HQcdSU1DA+RmIbQNGv3ruj0DqXRiKObvnTUXHRnvvynrRdpgEKHM7mDqqAg4NSH34IJzvH3aoldeD6RJsetCml2zYYPByOfsoQtDIsaBOQeKxwGu7ki/vh8LFrMXNuGnKeo/xNQfaNTdYmXn8sewkhp1WrNt2l3Ir8Wn30xhjQHuVxtxEuZMI6pJlxkVDfGm/ONA5tUBf7sfyk+IQ5Zy3T3qCzYWRylGWnO3O76NmnDy0p+gerA6Q0vGjRysJVyrQMxwkPph6MWNOLnoCuXda+MbcnD2xoy6+l95ooDXL+Fz88XbpMFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfQvnuV9/hET3e6h6dEP6kwexHQzECvSPFsQM0SjgWw=;
 b=AchJ9dTwInA+xe7SZ1rplN1BDUguMAtzq3hJ1aHymAby4Alppm6Ej84MKmksWgsu8mvLiAchUxg9/Zxrkw6PR7OOeSOeMMp2C/nIWzs989r0Df5KEaekHsOzACG9Xd+3qVUECqzUUSkWmwgZvoI8FBrti3f4yn/nByIHjN6NNM0WXTFk0BLYL+Bfp1Bv5qNhsRe16VGMof9Wm3edfOActgO8fs8C/xv49+Tzmm8YsK8fvNdORhx0i0Kk2JsDd+RDLzBQMApooaxwIBV5dhNkZSQfCu+disnPvqxWUiqPY2iScaizROCZRz4EcHKyWeUsQHxg5rcruNcE/Kj7coQzPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfQvnuV9/hET3e6h6dEP6kwexHQzECvSPFsQM0SjgWw=;
 b=SJwT+ZaF+RsQ5/itcJup1zS7nah8GDGmKcJU0jO86HtXJ8uEfAFyE81W1rczkFrrQ81XFczouWqxgcY4e7XvL2eBuoa4b1x0+l5Nwvtqb1/bkYuKQ7MOnK9Bd7lrZISDmikn+o82T8c33pwsu/jvKYNKvkxbOBWwdQVBBAwNfRQ=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by BY5PR07MB8149.namprd07.prod.outlook.com (2603:10b6:a03:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Thu, 10 Dec
 2020 11:24:10 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab%3]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 11:24:10 +0000
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
Thread-Index: AQHWzo/azlCvSJB/Aky2bACp1E8uPqnwBkKAgAAQFvCAABVCAA==
Date:   Thu, 10 Dec 2020 11:24:10 +0000
Message-ID: <BYAPR07MB538137E487C30D74D5F9FB65DDCB0@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20201209214447.3bfdeb87@canb.auug.org.au>
 <7e4ff29c-9fa8-219c-a17d-e9be9a2a92ab@infradead.org>
 <20201210085147.GB2388@b29397-desktop>
 <BYAPR07MB5381DD2499ABD871C0E4B118DDCB0@BYAPR07MB5381.namprd07.prod.outlook.com>
In-Reply-To: <BYAPR07MB5381DD2499ABD871C0E4B118DDCB0@BYAPR07MB5381.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMzc5MDhjY2YtM2FkYS0xMWViLTg3NzUtYTQ0Y2M4MWIwYzU1XGFtZS10ZXN0XDM3OTA4Y2QwLTNhZGEtMTFlYi04Nzc1LWE0NGNjODFiMGM1NWJvZHkudHh0IiBzej0iMjgwNCIgdD0iMTMyNTIwNzMwNDg0OTEyNDUyIiBoPSJsODA4TGpwTEhGeE5WY1M4Z0ZaVjZORnhSRWs9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d69aab3b-b380-4f52-3ecc-08d89cfe1d8c
x-ms-traffictypediagnostic: BY5PR07MB8149:
x-microsoft-antispam-prvs: <BY5PR07MB814953F5F1A0F8BDECCF6FD6DDCB0@BY5PR07MB8149.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: me2vVDFHoEqD1zkzcaf3tVDlYt7kMtRoz1mWgZ64R2SQxzXFKb3qmiw82diTq2Ag/YnOLCeQBOg01dQqNB6lP1cBQaZzijsI9Y9q+WM7LOoWhlp3C83XhxrsLtmdrnUO6kZxbQtH0W0OcOfo27TtyH0kfhewk0BMxqH4GYqa2/lDCcYMaAUGMjrCXpd2LBIScQMp9xySb5zkQa6GmT+PaD8e786iihpXS2Yk/QO2wzR0rjooSB3i28UNcBdUwPLuJtZ7U01SdP/Jt/Rxu9ZvJWBiYr/904Qu8aJEHjmAfWuPjiuD3HvjvL1pvIhLsyFcEq4DAqLayrgE5T70ZBy5qIIR9u4bvbXiSY1kHkdEqDIoywYmfpA3/iwndcNq6hfd
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(36092001)(33656002)(2940100002)(9686003)(55016002)(26005)(186003)(8676002)(508600001)(6506007)(53546011)(4326008)(8936002)(52536014)(66556008)(64756008)(66446008)(5660300002)(66946007)(86362001)(7696005)(66476007)(83380400001)(2906002)(71200400001)(54906003)(110136005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SAcGyFeJQyJ7J5jiAM7oo+HLDFlrgBR+r9kwvXZLofO7brlcMy4R1iQmKJaF?=
 =?us-ascii?Q?2K83U9FC/RpRJxr01xoQ9DroXNa/9d9XnmHDEvHbB9+49iB2NzEcR7VcTwNP?=
 =?us-ascii?Q?9T7fqBRywFwgpGujFBhSvcdvF4Ztr8Ypl4u7rz38DflQwVgOjTXUSa7DrlEX?=
 =?us-ascii?Q?UpPYjUfD+NKARbWHiS+rDQD5Cqza+1NZRVpr5ygnhkQ7U8SiWc+bpEslXfsU?=
 =?us-ascii?Q?Lk4pqC6UwdNko6qzPp5dVpodRFujf81Lcc5CdtcByTXbX5f+AQJY99+F01KX?=
 =?us-ascii?Q?Kgxnyl3cXrdeXYlHowNgnLJxOpV0viN/w9QZl4YMAjNtlkD4jxJKrV0Ifa00?=
 =?us-ascii?Q?5gCZ8OnfrAiLncqsy3vMby6VkS7JU7NMuF/JHai19DN4o0U4N1dA+Dn/dQzp?=
 =?us-ascii?Q?D7+N3VymAZNDPtyUGymu064VYsV84UZl4NNDQIo1AW/Gg3zsAtUyX3TBQchr?=
 =?us-ascii?Q?648R0u30SEhcTXRpc45LXsioojaV28kAqq1upYhkicsRyLRk8e381DJ98AmR?=
 =?us-ascii?Q?mYJ2gnMN8U1WsZ5TbveWDtOhQqp4ReCiIkZa/a6RHq+AtJM2PGd9EB82oq83?=
 =?us-ascii?Q?47WGRtfFjhtgt5D0pGTQWW4ihQ48SCVShYHqnmlvQqCaXM6jGoYulhB53Jeg?=
 =?us-ascii?Q?vQkRLqPZpy/JYCeLH3fVi9uBPEh3Ia8L7+K8l87gbL1+P9Tqc+Te63Fx1gt5?=
 =?us-ascii?Q?HuepQ+7Yjkgo89BQC92iBcvPq+tLA/l/oBs4yqyRJCXOs/8+6/D/cqw5ExzG?=
 =?us-ascii?Q?u+BMcPTMEoOeD0PM4OrLJ4c7KWZxHA/HmscPPKIBsKVioa5uHgZBaHajdeb9?=
 =?us-ascii?Q?lk04+Kvec5r+fD593Aui3TMO4RxyAnetpbg5C1iLHKDoqiUIJAnxq0vIvwMl?=
 =?us-ascii?Q?xv5UFWmxICrmNThRZFCL54cccLtbe+P2yTvDpUFXJGOZ+FLXUOBuyKf5fwCB?=
 =?us-ascii?Q?5I2RKfmwpiTco1OhL19xMIiRFCbcAofOgP2v0tcEVtM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69aab3b-b380-4f52-3ecc-08d89cfe1d8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 11:24:10.3742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bS6zUgGaDayWSAKbL3VjkBCow0iqOBohcoemxaBJStGHl/DWd3Iy62CESuzeUhq0QDHDC40d85lSAy0pioMXZAAeoRGYnt81PUVm/k0q1dM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR07MB8149
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-10_03:2020-12-09,2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=607 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012100076
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Peter,

>
>>
>>On 20-12-09 16:58:16, Randy Dunlap wrote:
>>> On 12/9/20 2:44 AM, Stephen Rothwell wrote:
>>> > Hi all,
>>> >
>>> > Changes since 20201208:
>>> >
>>>
>>> (I don't know what to do about this one -- seeking help.)
>>
>>Add Pawel.
>>
>>Hi Pawel,
>>
>>Add old cdns3 logic, when the CONFIG_USB=3Dm
>>If CONFIG_USB_CDNS3 is M, the host will be built as module
>>If CONFIG_USB_CDNS3 is build-in, the host will not built due to
>>USB=3Dm, so USB!=3D USB_CDNS3 at below dependency.
>>
>>config USB_CDNS3_HOST
>>	bool "Cadence USB3 host controller"
>>	depends on USB=3Dy || USB=3DUSB_CDNS3
>>
>>So, it has no such issue.
>>
>>But after adding CDNSSP support, the configuration relationship is
>>much complicated, both CDNS3 and CDNSSP could choose host file,
>>would you have a check for this issue?
>
>I can recreate this issue. I will try to resolve it.

config USB_CDNS3_HOST
        bool "Cadence USB3 host controller"
-       depends on USB=3Dy || USB=3DUSB_CDNS3
+       depends on USB=3DUSB_CDNS3
        select USB_CDNS_HOST
        help
          Say Y here to enable host controller functionality of the
@@ -110,7 +110,7 @@ config USB_CDNSP_GADGET

 config USB_CDNSP_HOST
        bool "Cadence CDNSP host controller"
-       depends on USB=3Dy || USB=3DUSB_CDNSP_PCI
+       depends on USB=3DUSB_CDNSP_PCI
        select USB_CDNS_HOST
        help
          Say Y here to enable host controller functionality of the

Peter, what about such change. It fix this issue but I need to check
It with some other kernel configurations.=20
At this moment it's the only solution which I've found but
it's introduces some limitation in CDNS3/CDNSP configuration.

>
>>
>>Peter
>>
>>>
>>>
>>> on x86_64:
>>>
>>> ld: drivers/usb/cdns3/host.o: in function `xhci_cdns3_suspend_quirk':
>>> host.c:(.text+0x9): undefined reference to `usb_hcd_is_primary_hcd'
>>>
>>> This reference to 'usb_hdc_is_primary_hcd' is from hcd_to_xhci(),
>>> which is being built as a loadable module:
>>>
>>> int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
>>> {
>>> 	struct xhci_hcd	*xhci =3D hcd_to_xhci(hcd);
>>>
>>>
>>>
>>>
>>> CONFIG_USB_GADGET=3Dy
>>> CONFIG_USB_SUPPORT=3Dy
>>> CONFIG_USB_COMMON=3Dy
>>> # CONFIG_USB_CONN_GPIO is not set
>>> CONFIG_USB_ARCH_HAS_HCD=3Dy
>>> CONFIG_USB=3Dm
>>>
>>> CONFIG_USB_CDNS_SUPPORT=3Dy
>>> CONFIG_USB_CDNS_HOST=3Dy
>>> CONFIG_USB_CDNS3=3Dm
>>> CONFIG_USB_CDNS3_GADGET=3Dy
>>> CONFIG_USB_CDNS3_HOST=3Dy
>>>
>>> Problem is mostly that CONFIG_USB=3Dm and CONFIG_USB_GADGET=3Dy.
>>>
>>>
>>> Full randconfig file is attached.
>>>
>>>
>>> thanks.
>>> --
>>> ~Randy
>>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>>
>>
>>
--

Thanks
Pawel Laszczak

