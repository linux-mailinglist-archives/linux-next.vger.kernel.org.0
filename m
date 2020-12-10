Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63552D623C
	for <lists+linux-next@lfdr.de>; Thu, 10 Dec 2020 17:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391325AbgLJQm4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Dec 2020 11:42:56 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:50228 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391229AbgLJQmw (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 10 Dec 2020 11:42:52 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BAGPWPk032225;
        Thu, 10 Dec 2020 08:41:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=EMdNfPyz6y6IXbgvcwgQAr1u/2ZyOeyKYyfLivSheB4=;
 b=XIyqbAXV8VWcmGQLSFSsR7ecSmXrpJO4LhZkX64LNqaHnpTK2w9rchgH1QClRVVafefK
 TlnvycIz9KldrHecSQlx4hluykK86cXxwg9G+hupBypoZXaPaEN88F7BktiEKiewq2J0
 wjFi8+s3sgN8HDfsB0EQlZrVQ648G5vo5OCr7DW9beIqDvKQbreKD0MuGv72yYu7FzCA
 O57+4e82JuSLqCcrsbRb9fhwqyGropnUW1LCGi5yY2cWLk9Fdo3yZdKP0mpLnSk+DFSm
 tRtb2S6Gbn0reCLDJXodaK5BnSr7FJK2wOz4CMcJw3JOzbTXtPzXaMoHP0ZsVcF6K0/Y zg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
        by mx0b-0014ca01.pphosted.com with ESMTP id 3586p4aa7m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Dec 2020 08:41:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eu+nRZB/vCu1YJYwAHH3Z+3p6r8LyVgfvVqSoOSbvqu9+UaaTvQkr1adCFSfKwBCEmyPOzzQsZZySIGhX58MSJqVxrdVUyXpGQ8frtqzHacWPmD5weZy24tm7K8KSLHV6wtGcPPDtHBZwQ5o+yDaVEbUrBMV1VnllRwC3ETBg0LkHzBxiStN6nh7wcYUMMUxO7qu5CVK5RUEvRLSFIcJmao646bGqQYMUvNq2/d8eq4fah6fWz7N/EH4wJQoXddIzj/SSwQwAuV7P5r1BRxxPSJJCtWTeYdMijvzWI5SUQ+1YnErFepFGqVTFpt0E9kSZ2YUJ8IpWf8Sjz1pi4SZ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMdNfPyz6y6IXbgvcwgQAr1u/2ZyOeyKYyfLivSheB4=;
 b=QTROKBTZurwY5mPNj6shWhfu8TWt6rOejwzSV1/KXf6so2zNTjA+u3Bms+3aCHmePb4H93SiAqMqaxxIbsWPMsZIszD7qZSoubFAF9QrVT1DhzAbcgAA0HqnxDTRak4QonRyevguPhfft0zuc7RR5GCtmPZFh2b00Wx+39hAHSugKHaTSzk/ItDlkiPIApOj7mRYVuu/PtSCsoZzrSg3IHB3ZDbIpeqXKNz+JDx76Jt1rZE9oFmemGWJH+M9N3dZyowG5i77UaDM8iQRtzYWaCnauWXFpNA5XwSvzVSBLxq/fV5XspDsauIcppfwNZ/5qgQO5dg9C7jPsoWwfMNsgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMdNfPyz6y6IXbgvcwgQAr1u/2ZyOeyKYyfLivSheB4=;
 b=P7kM8gzGIKKgdWfbL7zOLK3fsqT1+xsJXJ/OyB5IiqtVeMChNVDDMYeCyggpPeeOMy9flnfwFMNL8+4CdUrDyEfwzgqFCD4YNwJ8OJ+CzJC9KsFn9C0LIAnL5FZs2q6SjvjIKmF7A3JCSzX+LV86kwJnu9AuQcPjvzJvwBaVCv4=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by SJ0PR07MB7520.namprd07.prod.outlook.com (2603:10b6:a03:28e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Thu, 10 Dec
 2020 16:41:37 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::b09c:4a2d:608f:a0ab%3]) with mapi id 15.20.3632.023; Thu, 10 Dec 2020
 16:41:37 +0000
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
Thread-Index: AQHWzo/azlCvSJB/Aky2bACp1E8uPqnwBkKAgAAQFvCAABVCAIAAXUug
Date:   Thu, 10 Dec 2020 16:41:37 +0000
Message-ID: <BYAPR07MB5381A434B4F8A73AF83E2CBADDCB0@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20201209214447.3bfdeb87@canb.auug.org.au>
 <7e4ff29c-9fa8-219c-a17d-e9be9a2a92ab@infradead.org>
 <20201210085147.GB2388@b29397-desktop>
 <BYAPR07MB5381DD2499ABD871C0E4B118DDCB0@BYAPR07MB5381.namprd07.prod.outlook.com>
 <BYAPR07MB538137E487C30D74D5F9FB65DDCB0@BYAPR07MB5381.namprd07.prod.outlook.com>
In-Reply-To: <BYAPR07MB538137E487C30D74D5F9FB65DDCB0@BYAPR07MB5381.namprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctOGZlNzkwNjktM2IwNi0xMWViLTg3NzUtYTQ0Y2M4MWIwYzU1XGFtZS10ZXN0XDhmZTc5MDZiLTNiMDYtMTFlYi04Nzc1LWE0NGNjODFiMGM1NWJvZHkudHh0IiBzej0iMjk3OSIgdD0iMTMyNTIwOTIwOTQ1MjQwNDAyIiBoPSJsQ3dJVEVqNzFnOGRSSDdHRWE1TUQyejZ4bEU9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0486cc9b-7ec4-4cc4-ec76-08d89d2a768c
x-ms-traffictypediagnostic: SJ0PR07MB7520:
x-microsoft-antispam-prvs: <SJ0PR07MB75205B089F76FEC44679656FDDCB0@SJ0PR07MB7520.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FEAMwPtbwbrONMmhI49xe+oO9pVTmNa7yZc8Y2XsKF14t3XnhHXpCSlZCSvf8VOCdclEoXzZ+6Rs6t27x2ChgkKKv1GFEkCgX2RtU9GHJOFXS6EuFeWNjCCmwB78m0mGLHxGchQ1Rg/qQJe7v3AdYli/nWtAXjS2145o8Mgn7+/hW0IF5DfQ9YuoRgz0QIlfysqq/QKIaHEX24MzOWVKcc+XW76u//MIomwc+KX6wAcZnVCNQEAhFU1X+VqygWMyI7TMnVjQ1KLb2hGuQXwICwpBOoM5ZPbFwAeqGxywX11tn5fanp6uTVB1c6nrh7fKI1pGpBMu4VL6k3vDTJLoZc7SakPehk2zwXr/rXg0HdTq07hZE61+2dd22IbmIbm5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(36092001)(6506007)(66556008)(53546011)(4326008)(55016002)(2906002)(7696005)(71200400001)(33656002)(8676002)(86362001)(5660300002)(64756008)(66476007)(9686003)(8936002)(54906003)(110136005)(83380400001)(52536014)(26005)(508600001)(76116006)(186003)(66446008)(2940100002)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?OJcg4TT2BfIjrgNB8E4sNijrXk13G0yHSkWQjWTIOsD2LcPQzH652GLxM7ON?=
 =?us-ascii?Q?os1uWyGwjX3xZZCvbP0sGQErG7D/n3C4adRyT5H377jKTjYladQFfCB3Hw55?=
 =?us-ascii?Q?WYaUSui7ScWQJoNMjQVsd5sYPqijYes2Aoy7ouLNVFzprXk0ToLHQGdwCjrS?=
 =?us-ascii?Q?ND3sVnst5yWICZp3i9rD5FyncgbNNHWM6H8Z1+Yl6why276UWhEgq9dj0Ne4?=
 =?us-ascii?Q?E8+pfnkrTPvLFIKm3udBh85Ehxkz0H9WI4Zex/sDOv7Bi2TjveWr9X4uq4f3?=
 =?us-ascii?Q?Cc163i/4O7VncuGmtzLfpBbd11EE1bGQWGKMh3NodtmqiIf5nJRFygEYVWRP?=
 =?us-ascii?Q?hoHH+M2H5IWsTPW+YXY3JF4Lo/jajLQbuFxwaRGZDGOKz2XGAvjNJ4e4MtZI?=
 =?us-ascii?Q?RMDaXaZ9lUAt9y3f3zIKoz1HXJIsjnINpTrRdxXmLD5GyDXRYcoAT29HK+Bm?=
 =?us-ascii?Q?glnAOG2nwj+1cZjLXXOEyXq7djfyRQVx/4XQx2H/GFd6Iprj/fg+Un9oZbYN?=
 =?us-ascii?Q?j3mbWLi/Aajy7HH4ljsB5GUfUmIngxoqJvYesUsutbBkGi5bAXgUS05P5SkS?=
 =?us-ascii?Q?15jUgwb22GSoO8U5AmTQ402jF2HGZxXQGJ+D+sF/nSw1SIbMeHZAAya8GK9I?=
 =?us-ascii?Q?2kyHz3mxmhZQieg/OrF/LmimtVmlk0YaffbV9gctYWD2rELGzZrJcFz36cDz?=
 =?us-ascii?Q?tYYzu9eVfC7ia3dhRKogiBp6VluMAEBdEJa3stOYGNnVctqOclqZbTqAkar+?=
 =?us-ascii?Q?jru21yw8IdtietM+9guNfgE++/T/ru7JxEax5ALU0uMCEH2caPLduS/OZzrE?=
 =?us-ascii?Q?zbr5x/8xsgLzWZDSK4HT06B9jBJRBOsO9iblto3kXMSiflihd1nkow5Yae2m?=
 =?us-ascii?Q?dk4BVXGKm3EyC+iFPId7PWARRCVnb0AfDVkmI7myKDOfBfT1L/RP+rVU+htG?=
 =?us-ascii?Q?gYLBpdWyG1nWPU7DAljUh3QQSXraDjjpSvqjplyBMRY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0486cc9b-7ec4-4cc4-ec76-08d89d2a768c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2020 16:41:37.4880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxGDGK43m05ZD3Es4KhDhMcnUZ2dBTxJztI8dxTxyIuBRXhvoIlsABJ2QIHb0M1n0Mm6sVxMPzl5/bYDxIaVP632zB69qnxlxwPclH3ain8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR07MB7520
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-10_06:2020-12-09,2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 mlxscore=0
 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=592 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2012100105
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Peter,

>
>>
>>>
>>>On 20-12-09 16:58:16, Randy Dunlap wrote:
>>>> On 12/9/20 2:44 AM, Stephen Rothwell wrote:
>>>> > Hi all,
>>>> >
>>>> > Changes since 20201208:
>>>> >
>>>>
>>>> (I don't know what to do about this one -- seeking help.)
>>>
>>>Add Pawel.
>>>
>>>Hi Pawel,
>>>
>>>Add old cdns3 logic, when the CONFIG_USB=3Dm
>>>If CONFIG_USB_CDNS3 is M, the host will be built as module
>>>If CONFIG_USB_CDNS3 is build-in, the host will not built due to
>>>USB=3Dm, so USB!=3D USB_CDNS3 at below dependency.
>>>
>>>config USB_CDNS3_HOST
>>>	bool "Cadence USB3 host controller"
>>>	depends on USB=3Dy || USB=3DUSB_CDNS3
>>>
>>>So, it has no such issue.
>>>
>>>But after adding CDNSSP support, the configuration relationship is
>>>much complicated, both CDNS3 and CDNSSP could choose host file,
>>>would you have a check for this issue?
>>
>>I can recreate this issue. I will try to resolve it.
>
>config USB_CDNS3_HOST
>        bool "Cadence USB3 host controller"
>-       depends on USB=3Dy || USB=3DUSB_CDNS3
>+       depends on USB=3DUSB_CDNS3
>        select USB_CDNS_HOST
>        help
>          Say Y here to enable host controller functionality of the
>@@ -110,7 +110,7 @@ config USB_CDNSP_GADGET
>
> config USB_CDNSP_HOST
>        bool "Cadence CDNSP host controller"
>-       depends on USB=3Dy || USB=3DUSB_CDNSP_PCI
>+       depends on USB=3DUSB_CDNSP_PCI
>        select USB_CDNS_HOST
>        help
>          Say Y here to enable host controller functionality of the
>
>Peter, what about such change. It fix this issue but I need to check
>It with some other kernel configurations.
>At this moment it's the only solution which I've found but
>it's introduces some limitation in CDNS3/CDNSP configuration.

It doesn't work correct.
I posted the patch with other solution.=20

>
>>
>>>
>>>Peter
>>>
>>>>
>>>>
>>>> on x86_64:
>>>>
>>>> ld: drivers/usb/cdns3/host.o: in function `xhci_cdns3_suspend_quirk':
>>>> host.c:(.text+0x9): undefined reference to `usb_hcd_is_primary_hcd'
>>>>
>>>> This reference to 'usb_hdc_is_primary_hcd' is from hcd_to_xhci(),
>>>> which is being built as a loadable module:
>>>>
>>>> int xhci_cdns3_suspend_quirk(struct usb_hcd *hcd)
>>>> {
>>>> 	struct xhci_hcd	*xhci =3D hcd_to_xhci(hcd);
>>>>
>>>>
>>>>
>>>>
>>>> CONFIG_USB_GADGET=3Dy
>>>> CONFIG_USB_SUPPORT=3Dy
>>>> CONFIG_USB_COMMON=3Dy
>>>> # CONFIG_USB_CONN_GPIO is not set
>>>> CONFIG_USB_ARCH_HAS_HCD=3Dy
>>>> CONFIG_USB=3Dm
>>>>
>>>> CONFIG_USB_CDNS_SUPPORT=3Dy
>>>> CONFIG_USB_CDNS_HOST=3Dy
>>>> CONFIG_USB_CDNS3=3Dm
>>>> CONFIG_USB_CDNS3_GADGET=3Dy
>>>> CONFIG_USB_CDNS3_HOST=3Dy
>>>>
>>>> Problem is mostly that CONFIG_USB=3Dm and CONFIG_USB_GADGET=3Dy.
>>>>
>>>>
>>>> Full randconfig file is attached.
>>>>
>>>>
>>>> thanks.
>>>> --
>>>> ~Randy
>>>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>>>
>>>
>>>
--

Thanks
Pawel Laszczak

