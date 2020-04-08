Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46FC41A1CBF
	for <lists+linux-next@lfdr.de>; Wed,  8 Apr 2020 09:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726566AbgDHHiM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 8 Apr 2020 03:38:12 -0400
Received: from mga02.intel.com ([134.134.136.20]:28594 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbgDHHiM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 8 Apr 2020 03:38:12 -0400
IronPort-SDR: sTOsJkGUNhlc6/FYkKZPMhEVP205b1RWaA3KttztUUzlIx/lAEag3pJzN0bLT6dlk0cQPWHP+p
 9uJa+c3WiDNw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2020 00:38:11 -0700
IronPort-SDR: aGmze9d+MLmdwGqGkaJa36I1p1WJ9Tt4JbHUREwOF6F71h+SJWPaDpLROJKeZzGtpH266DokfR
 HHq2Ew0UzhLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; 
   d="scan'208";a="398125060"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by orsmga004.jf.intel.com with ESMTP; 08 Apr 2020 00:38:11 -0700
Received: from fmsmsx151.amr.corp.intel.com (10.18.125.4) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Apr 2020 00:38:11 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX151.amr.corp.intel.com (10.18.125.4) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Apr 2020 00:38:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Wed, 8 Apr 2020 00:38:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMeaWGnMsCM2lZGAnp15d3ltvCvWVyEYofO//T35+kRluztF01yhaeysT9wSitaMU6Oic3tRtwAMeaWJcQhVRHQwWOrF45QSD07oNxejj9jCHwY/NYI2DZmvDl8wTK4R+YLwL09jCMFqkl8pxjbOTsQ/w3xoBKUq2kqmesxhdvF8xbLhWNUdL6CoiJZzHKA1F/7+pQE2hBM7W/YuSqZgFhuumIDa7cHhxg83QQqPyzsylupQXFuBtR8XSBUZXKPy325mMEi4BIF0IgL3Oqub9F203WqDnWoyheoR6KL9ELH5lc+BGDtO1zl9eF4LY5ofJnn7fzeg6Pmassjepous8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p76omsNfiMfke9/cPsVxz7gfZbkoUJBun2Bm8Xcgmlw=;
 b=BY3s1GtwKZsSNNMcGp39kSr1X+Nx/Ou9DhKA2TPCLWaHTpuMfmpPhLdw7EnAyn1xvU6ImmPYTLE3/t3uH6myo0VsnDBLi77qS8TzZRK+jjxBcNjn6LxOkweU+TH9BmQLTfwVQCYYCeWkyQFLuXQYxVbjCO3OlsoyNA8T24pQGlm8ca3qp9RTdoq4wlVUI9udxdK/L4lGWed+q5DxGQMu2h0wTAn+C6h0BRFhQwHFkIiiommVd0x6esMBFMvmMN8vr/B5cSPJz2YUxgGNy8vw5IBRBS3oGz2obxgDFqAS5HzjDSnu40snPRF4iiEpG0StLd02OoFylIkmIT46ae2DtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p76omsNfiMfke9/cPsVxz7gfZbkoUJBun2Bm8Xcgmlw=;
 b=bMNySggPvRcvEPnFFUe+DIzqXp3PB+RJrfVz57FKeCktvOuTMZuHxwx2jH3C0nnBp65HXPeUerRF5SsYcj9dofLSXB8hHB3ta2OJ3R2hfeuXv4ypK+s3EcRSkr/gCYI74smq1Sdi380BBgorh7M64MH9Fi1BcBtA2NwcaZs3nHc=
Received: from DM6PR11MB2715.namprd11.prod.outlook.com (2603:10b6:5:be::18) by
 DM6PR11MB3228.namprd11.prod.outlook.com (2603:10b6:5:5a::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15; Wed, 8 Apr 2020 07:38:09 +0000
Received: from DM6PR11MB2715.namprd11.prod.outlook.com
 ([fe80::acac:f826:6b48:1a69]) by DM6PR11MB2715.namprd11.prod.outlook.com
 ([fe80::acac:f826:6b48:1a69%4]) with mapi id 15.20.2878.022; Wed, 8 Apr 2020
 07:38:08 +0000
From:   "Narasimman, Sathish" <sathish.narasimman@intel.com>
To:     Kees Cook <keescook@chromium.org>
CC:     Marcel Holtmann <marcel@holtmann.org>,
        "Tumkur Narayan, Chethan" <chethan.tumkur.narayan@intel.com>,
        lkp <lkp@intel.com>, "Bag, Amit K" <amit.k.bag@intel.com>,
        Hsin-Yu Chao <hychao@chromium.org>,
        "Hedberg, Johan" <johan.hedberg@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: Coverity: btusb_work(): Null pointer dereferences
Thread-Topic: Coverity: btusb_work(): Null pointer dereferences
Thread-Index: AQHWDCsSILpBulyMOUiex4FVFfHrVKhte1FggAB9AoCAAOAlAA==
Date:   Wed, 8 Apr 2020 07:38:08 +0000
Message-ID: <DM6PR11MB27158789B59F8C9E1B2A500594C00@DM6PR11MB2715.namprd11.prod.outlook.com>
References: <202004060849.823489FC@keescook>
 <DM6PR11MB2715D200FA424448E05B64D494C30@DM6PR11MB2715.namprd11.prod.outlook.com>
 <202004071113.0643A29@keescook>
In-Reply-To: <202004071113.0643A29@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sathish.narasimman@intel.com; 
x-originating-ip: [106.51.110.102]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 961ebcdd-d95f-4469-1040-08d7db8fc8ab
x-ms-traffictypediagnostic: DM6PR11MB3228:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB3228C1F14433B6C80BAB102A94C00@DM6PR11MB3228.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0367A50BB1
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2715.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(366004)(376002)(396003)(136003)(346002)(39860400002)(316002)(26005)(6506007)(53546011)(76116006)(6916009)(86362001)(55016002)(71200400001)(966005)(4326008)(66946007)(81166007)(54906003)(33656002)(7696005)(8676002)(478600001)(2906002)(186003)(81156014)(64756008)(66446008)(66556008)(52536014)(55236004)(66476007)(5660300002)(8936002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1nu69YreJZdfFXdDZAfJ2j1a50rZTobSyED0kV69hC1zVc3lbu6r6sTlH3K4j6N21PN4tqwCLnTNvaAs+mLNh5q8paFDPbAF8QqMOqss/2DLQOztoj40QpGrcYNlaRSydM5vqmFUAUF8IMgKt/lo7wC9S6NPau+NiZ31MjyiUsHNZBT6EKEERIFDxAAFbrVrozi+QxHkHyCHTiwgVmj1R+SY9w5mj5Et7Jzn7uxGl9/zXIxbx3PRBkbNUQbolWbrLqv3NWrQJbgkmSUtBmkP/aaxM9G8wcOp9kyOKxYWDkqeTo8dch/wufb1p6kbw2DLeRCDtybuKkI8CWjcvHZt/emBvGIP+Hfbl1veA1lmuLXrDBX7/cSkd7Ou9NjKByQj5+En7e3wO/cS7ir20GMXZ37dQxtF0AtQoQQFfIVbBkD8IaSHdaVGHKDPmIMhGzCrZWX1SZ7US54CdPSVIhNCBnGEjHVWvSr4Bp/UNQwPCXw30LC1MYREqTLgH0zX6dfjwnNZGumxUu9OsilC7dJuMQ==
x-ms-exchange-antispam-messagedata: nHklsGAlCN9TGmNkpadzbOAsRmtcH/UxcD3QQRYmTST+I7TP+7SUpWLznQ9HwHD5cjmkQnrLLkL9f2YVXKlKApQfy+TfJF9h+ahXGxtcJHCXSVGv2HcMLE2hUjBFENfnEnm+CFwzFLrNdCwGpBIKog==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 961ebcdd-d95f-4469-1040-08d7db8fc8ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2020 07:38:08.8255
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WBl5ZlRQb5M5tISXK2yo0zVpXKBSDOLaoN9KCuF+juC7vESX5J/09uPA91LE4Gq6KzU2tRN0Bx0A6PZ+mQu5KCYA/twdh8/m3zTvD4YYIJY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3228
X-OriginatorOrg: intel.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi

Respective Fix for this updated and merged in Bluetooth-next.

Thanks
Sathish N

-----Original Message-----
From: Kees Cook <keescook@chromium.org>=20
Sent: Tuesday, April 7, 2020 11:44 PM
To: Narasimman, Sathish <sathish.narasimman@intel.com>
Cc: Marcel Holtmann <marcel@holtmann.org>; Tumkur Narayan, Chethan <chethan=
.tumkur.narayan@intel.com>; lkp <lkp@intel.com>; Bag, Amit K <amit.k.bag@in=
tel.com>; Hsin-Yu Chao <hychao@chromium.org>; Hedberg, Johan <johan.hedberg=
@intel.com>; Gustavo A. R. Silva <gustavo@embeddedor.com>; linux-next@vger.=
kernel.org
Subject: Re: Coverity: btusb_work(): Null pointer dereferences

On Tue, Apr 07, 2020 at 10:54:22AM +0000, Narasimman, Sathish wrote:
> Hi
>=20
> I think this is False Positive.
>=20
> In the function btusb_probe the memory allocation is happened and verifie=
d for NULL.
> I don't this so checking for NULL evey time is required.
>=20
> Sample code snip
>=20
> In function "btusb_probe"
> {
>         data =3D devm_kzalloc(&intf->dev, sizeof(*data), GFP_KERNEL);
>         if (!data)
>                 return -ENOMEM;
> ....
>        INIT_WORK(&data->work, btusb_work);
>=20
> }

This warning is talking about data->isoc, which is checked for NULL in othe=
r places before the call to btusb_find_altsetting(), which doesn't check fo=
r NULL.

-Kees

>=20
>=20
> Regards
> Sathish N
>=20
> -----Original Message-----
> From: coverity-bot <keescook@chromium.org>
> Sent: Monday, April 6, 2020 9:20 PM
> To: Narasimman, Sathish <sathish.narasimman@intel.com>
> Cc: Marcel Holtmann <marcel@holtmann.org>; Tumkur Narayan, Chethan=20
> <chethan.tumkur.narayan@intel.com>; lkp <lkp@intel.com>; Bag, Amit K=20
> <amit.k.bag@intel.com>; Hsin-Yu Chao <hychao@chromium.org>; Hedberg,=20
> Johan <johan.hedberg@intel.com>; Gustavo A. R. Silva=20
> <gustavo@embeddedor.com>; linux-next@vger.kernel.org
> Subject: Coverity: btusb_work(): Null pointer dereferences
>=20
> Hello!
>=20
> This is an experimental automated report about issues detected by Coverit=
y from a scan of next-20200406 as part of the linux-next weekly scan projec=
t:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>=20
> You're getting this email because you were associated with the identified=
 lines of code (noted below) that were touched by recent commits:
>=20
> baac6276c0a9 ("Bluetooth: btusb: handle mSBC audio over USB=20
> Endpoints")
>=20
> Coverity reported the following:
>=20
> *** CID 1492498:  Null pointer dereferences  (FORWARD_NULL)
> /drivers/bluetooth/btusb.c: 1665 in btusb_work()
> 1659     			}
> 1660     		} else if (data->air_mode =3D=3D HCI_NOTIFY_ENABLE_SCO_TRANSP)=
 {
> 1661
> 1662     			data->usb_alt6_packet_flow =3D true;
> 1663
> 1664     			/* Check if Alt 6 is supported for Transparent audio */
> vvv     CID 1492498:  Null pointer dereferences  (FORWARD_NULL)
> vvv     Passing "data" to "btusb_find_altsetting", which dereferences nul=
l "data->isoc".
> 1665     			if (btusb_find_altsetting(data, 6))
> 1666     				new_alts =3D 6;
> 1667     			else
> 1668     				bt_dev_err(hdev, "Device does not support ALT setting 6");
> 1669     		}
> 1670
>=20
> If this is a false positive, please let us know so we can mark it as such=
, or teach the Coverity rules to be smarter. If not, please make sure fixes=
 get into linux-next. :) For patches fixing this, please include these line=
s (but double-check the "Fixes" first):
>=20
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1492498 ("Null pointer dereferences")
> Fixes: baac6276c0a9 ("Bluetooth: btusb: handle mSBC audio over USB=20
> Endpoints")
>=20
>=20
> Thanks for your attention!
>=20
> --
> Coverity-bot

--
Kees Cook
