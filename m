Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2874C1E76B0
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 09:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgE2Hbx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 03:31:53 -0400
Received: from esa1.microchip.iphmx.com ([68.232.147.91]:56223 "EHLO
        esa1.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgE2Hbw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 03:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590737511; x=1622273511;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=yVd1DQEhEl83+u293gCgR94mSvr2eH8v/DKF321Ou1Y=;
  b=BkCDyjTa5Q3ZZWFnX5mDkMJKKwQlxKKitzJHfQfTkKxe+BCuo3oUUICQ
   eDVzHH7o1Uz4WnmB3W4BB/hpaYukWtoiMNoQWT4EJ+jG2hjyXFFjIFSl4
   Aw1TlgfmsuHJ5Uxk0SJddGVg/fWuUDkSOXw1UsyZmlZR1zyXVaOwgQ9pU
   u5MsiX5XCLLRVry1VuAmOY4ZaSKXnT+60eZf7CxsYR9Bho/Kv3B0zPFTl
   Yl3bGNzD+H7/bs32POEfbSxU6xtcD3Du6fmsJYe9hBkxAVFd4wJP2D2Dr
   ITCiRUFpera3ovfKApVEpRDWKizfQOoxed/5SnltQ1xFLS21uHNj6ApQ2
   w==;
IronPort-SDR: Aoyh9ti/UxXbkgmddV/aDf+rv+Vhf7TpCMNIMGrp7a9Rgo6djlVRgQ16Jr8IRiZevFrMePOYHY
 DQqHRyExNRGVagNxqRZiUX4yd7ix1GhStPEtGBlbmdNmIHY/IwPE61wLd/nNmHCAfkuj257W5k
 Mr2Oj3hNnMkluCa+rSVR/LpxhHvlGviK2Xr0wWpd9kxYJK0lQh6pEWb8TaJlh1H0QsxuiuRBvg
 YK6kIJZjXWjd9AS8EvKUQ1cJyalqEcofFgxryiIqvPPGo6tZPESsDZhxFXmobGCWOkuX9rA8G3
 reI=
X-IronPort-AV: E=Sophos;i="5.73,447,1583218800"; 
   d="scan'208";a="81488418"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 May 2020 00:31:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 29 May 2020 00:31:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 29 May 2020 00:31:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=he9nl8Z1Eooj1AzTG7ENUnkX1KpLwWP+/nWZDfIyy/XAN+E5nqjQfuu9tE96AmyXiryFZ+3au70jd88nKoY+LMZJuTPZ2TjoXhrguOWlSdq6bpBL1FyaprP8KbzdWaL+ZXhXLTj++codB56fEx1n8vO3SXrenYe24Z0GQ/n95Y+pbkWL0VEk/fFR5iqILaY2puwKC8B+XwL/oZFvo8/mUnXG2SRFKKKc870dFbFWJ2NEhIdr8U0Ow1FjsCTEBVtBFl3u9W7JVbYzdXH6AdSA+VqitGQLTFdKfFRxcrQg/bPjGM8p+Sc0mW7Vb4/mCLHjSF7JHa9S8EjsYAzyCUS+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgNf+gPDyKxNA2NdFTYGustk54rdM4j5qLTIxIyUIlg=;
 b=Rx3DzTqdCNp8js7fmqv4lYxMhrwAkn8LeUk7oaFgkDhxumTc1oLgdhp/QiECZVFxaFC3Qpl4jjA6e3114WyLHIlj/w+J8KacQ9HB1ax6bX+03ASSQAjKYv5SuDJP86tf0+siNxZVpYgN++7+brelij1vZz9EY6E61EMFhnwUIIMnhFPEfQzlAcKL3hWwjA3E/JwTszDbWzjOtt3/qTrZHM5Ih0ZnCQjaIyBVVYZ2R4KBInMdZ8ZExbLz9uXLhKFakBrtnv0MsjYyTwZwXziUfdVeKbehjF8nmGEVxr0FYTVrXasTt4MmA33C0UJBjT+T7GFcIWT1H6zOLxFd+nPPgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgNf+gPDyKxNA2NdFTYGustk54rdM4j5qLTIxIyUIlg=;
 b=R8miVHo9BlyRqb6bAR6TRThiiUhVHkufRTaiDp0q7v1aBcLj2Ot077BxkHCuV30xznVMqiNZ9AwYIaEawLmYpXoYpUfotvjC4qiH0AofUpLlHL1tR4qr7nzLKx2xlPWLa2H8l5yD+N9pbG+uVp4JReT/b++L0rMFTETRLh+TQ08=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3864.namprd11.prod.outlook.com (2603:10b6:a03:18f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Fri, 29 May
 2020 07:31:47 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.018; Fri, 29 May 2020
 07:31:47 +0000
From:   <Tudor.Ambarus@microchip.com>
To:     <sfr@canb.auug.org.au>
CC:     <vigneshr@ti.com>, <linux-next@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <sergei.shtylyov@cogentembedded.com>
Subject: Re: linux-next: Fixes tag needs some work in the spi-nor tree
Thread-Topic: linux-next: Fixes tag needs some work in the spi-nor tree
Thread-Index: AQHWNTP5e5TVmYHiC0yo5fEL9CSQq6i+rACA
Date:   Fri, 29 May 2020 07:31:47 +0000
Message-ID: <132770930.czcBmXCZeL@192.168.0.120>
References: <20200529070647.5946fe06@canb.auug.org.au>
In-Reply-To: <20200529070647.5946fe06@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa148662-eb73-4baf-1bd3-08d803a2584e
x-ms-traffictypediagnostic: BY5PR11MB3864:
x-microsoft-antispam-prvs: <BY5PR11MB38648BDCA6EB5C3A490C0D6DF08F0@BY5PR11MB3864.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:142;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HbYfKybhhrFOZFIhbId/joEOi7H2rHkaQzMtp/keLShOcc1fTDCla78lu6ZP093XCQAxXgGiumT+dPD20cxg1JiwyoT9th+vcIO2VEiZrduAVbmhjiy74Ex81Zr/UzHn5S7rGQXL7s99tQCkm+vDOd1sRSRV2qyo/29o6njPzQkgcMbVJKtpHEeSWgADxi9TAmlvXQUr/h6H9/qO8ZVG7NiIgeWJsI2WcDBa+81LYpyrHdndBXyGBru/YToupwLKZexs8c2gDIoJlSL6RzACbpvUJs9A3pV0ipEsalW+Qn+6px7wPrC2u/4roDL5pQbAywdK8F7hmNkr9PIcuOVVGg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4419.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(136003)(39860400002)(376002)(396003)(366004)(186003)(478600001)(6916009)(316002)(54906003)(6486002)(5660300002)(2906002)(8936002)(71200400001)(4744005)(6506007)(6512007)(26005)(4326008)(76116006)(66946007)(86362001)(91956017)(53546011)(66556008)(66446008)(64756008)(66476007)(8676002)(14286002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: M4ABwf5oRc8s+8lCKmHbVIZj2Fw5A6/gP93c6ulFKCBY1bIsWagGh7QjVcNZaR9yNZHbBoII4i53yQc3AspNJFZDUpaGeUGC5FTUQicdXx7HCWdiC5M9/MHsLhb6sWlVfDdF8TVXgxvsGq+wGPOU2FLzi1Pq4iFQdELHrl8TPB4KO0hlCXCVmy84/mIjFHiAei2on6eiq3I4CDOykN/EiyslEDEM1JqVURZ+w0a9FgebCYOmZf8cADNBX5c0y/ROh/cofjAEW2TIfk4gRIDqFd21MGodr0p528nmfI9ey+sk6kG4pDWIvAAlMhLkOFUkTWNDYwP7wkrD9/Xlk5A/XdrqnF+RSWKVxurGqQM9sqRvwr/qs4PF8S7cXlwcHdhKlX6CqYZ+VrksU1Z+j6X++IF0G9SqxRH6varGpgnPsR/8Mf21Dr0nxc3GiWf4m63o3lIEnd6Cz/aJwxAVTQQKk4vDsFW9kbJkXiKCiJgJUZ0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BE4C52055FE4E14CBDF796518F3FF384@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: aa148662-eb73-4baf-1bd3-08d803a2584e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 07:31:47.2855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GX35SggXSxMPLbhz+tMu3jH8HLsuJ6vH2M5UexNLXPwZhDhsOFY9aDpRT5HM1ZSQ/Yy9Y42VEJ1Vr82aKSg7857HTdUPee79ui2r71e/rFU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3864
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Friday, May 29, 2020 12:06:47 AM EEST Stephen Rothwell wrote:
> Hi all,

Hi, Stephen,

>=20
> In commit
>=20
>   5587fa489747 ("mtd: spi-nor: spansion: fix writes on S25FS512S")
>=20
> Fixes tag
>=20
>   Fixes: dfd2b74530e ("mtd: spi-nor: add Spansion S25FS512S ID")
>=20
> has these problem(s):
>=20
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Right. Maybe it is worth to add this kind of check in checkpatch.pl. One ca=
n=20
generate the Fixes tag by adding an alias in .gitconfig:

[alias]
        fixes =3D show --format=3D'Fixes: %h (\"%s\")' -s

And generate the Fixes tag with "git fixes sha1"

Cheers,
ta

