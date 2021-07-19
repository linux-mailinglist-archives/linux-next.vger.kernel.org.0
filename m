Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F913CCF35
	for <lists+linux-next@lfdr.de>; Mon, 19 Jul 2021 10:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235315AbhGSIKt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 19 Jul 2021 04:10:49 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:31969 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235115AbhGSIKn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 19 Jul 2021 04:10:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1626682064; x=1658218064;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=mpBzDzMTCOAi6sRqH8W5LCY3FutZatsVsyS5emWtGXA=;
  b=nZHjr3kl+hmjOn0GRAwCrb1LIp42cRxlrKNrFpsbbOCZ48VKMkKdza5s
   a2pqUmo12uEpoV65uB9yB48RfwNXGwLN+Nd+ZBnf29UDbuDxPBG2qGU2f
   YSv1oD+DIvWwtEU1grVfCp3vnnWOq+xIXHtydJmMz3ctsSkXnAld0kFCh
   TovJV/INLqmqPMkPHLDNiMf0ICY8optkWVH3Nl7Ef7SmUlNC9OTHE1bmV
   HI6GRnT/J69lKSQTIWJuDwXq57eYIGdhSf575RTDfl0jGl6/vPkco3t/K
   W4FoW+HFRBf3YDVNLeyevYqf6HAjSw9lkD6xKlWA63XF7JpnNr6ciTZgQ
   g==;
IronPort-SDR: k8KwDljsBLqi4Qm4cKlQ9IO4hQm0FapFG4lbZFvfF8yrE3WRWmZnQ6AV/KGhPvhCj68lcha9HA
 Caz+UbmHsaJdD7tXdu2IGkn4q3AgMB1WKlSr38keh6Rb00hdPJFB5vT6bq1GzHZmtL1mlbT8fO
 H1wFXbKRTn4b4MCsrAovmWWmSWKtSVp9xay4SJdjFXL4dyFLZglpH94VXGTM9f2U+HfPwGpM3i
 4BA/gIdmafYZQhKXCIkMYs0bFmt1J3EZdtIFKNdy562OQCRKEyBtd/hll2GeTo5zxQa5/PDeO9
 USi+hqdFitSnmPDqMWWGg3BJ
X-IronPort-AV: E=Sophos;i="5.84,251,1620716400"; 
   d="scan'208";a="136433459"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2021 01:07:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 01:07:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 19 Jul 2021 01:07:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbV/9oHnMRQGmd1mirJO5hEZzmI73JW2u89G9k+RiCgrZXZu7ow1iOF/CQK6mUf9HMLQynFNR1QFAxI/G102nrSgTrAX3R1yMO8ZxCrYYxKusguMUtrwq7+Q0YkDHPfYoD0BDXLcAIOO+a3k6MHYdJGabSiDGUj3nbwP/hUCFBKouVy6TCnBn3ub8IDN7l/IKAKt4s/4e0c4is+kK6tClzCF4ysUG3u1M3oRyZ52wORvgxl2VK25Kthql5JSPf401mWvo1fekaSDvhLYqLsR6QsPVjlinmAcOA2gQCGdZN/tRQaadynPj0cEDgJWLUoAPQ4LdjsncY+M+HyjhwRIFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpBzDzMTCOAi6sRqH8W5LCY3FutZatsVsyS5emWtGXA=;
 b=ShtJ57EBsOaYdPD4/uCR8nNtXEiqMuZ+dN4VRGLqdvFmcj4JY32Pjx5RMGKKhRIlhoa41kflVOwt5G7XRSzdF0LAmYN3ww9BBrBYMICVPGJrpRcDNfo93yvn+P0d8nVNC8YHOYAPo2MRRF/YdS+08JjzcCcC3GqYz1yNXe0P7Y6y9vpqweyG5H1APLaPq/eNxZnE7J49uAOnmToHJlImEpEHh/N6BYZuLw3uKsXOuJ7gfwaxWEgvS2bTOWRtmg6bYuRrpVtIBwOUGO3bVhk+IVZECWViF0sHodkUN69X1NHLrri4scVqTHCTMCF9cybDPmOjNIMI0FT/HyZumBtNkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpBzDzMTCOAi6sRqH8W5LCY3FutZatsVsyS5emWtGXA=;
 b=QICfE0JwVoMv8hIivOj1Co4FXdTSO/BF7VhuRkIwrc0RgELCpZ3FyoJNhGIud0y6OnJ5lkduqOudCVJnRom4qlkNXXpoBxJj6ZUZL43xGYiZvBfU4iQfB39WNl76c5p3bY206PbQM1qOnBfMYGffPmnf3gigiNThLvRHnMdFIKc=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM4PR11MB5471.namprd11.prod.outlook.com (2603:10b6:5:39d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22; Mon, 19 Jul 2021 08:07:37 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::619c:afc6:5264:d3c]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::619c:afc6:5264:d3c%5]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 08:07:37 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <sfr@canb.auug.org.au>, <nicolas.ferre@atmel.com>,
        <alexandre.belloni@bootlin.com>, <Ludovic.Desroches@microchip.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the at91 tree
Thread-Topic: linux-next: build failure after merge of the at91 tree
Thread-Index: AQHXfHUip5ymhMvBOkOpMkVDDQQuVA==
Date:   Mon, 19 Jul 2021 08:07:37 +0000
Message-ID: <9059b3e0-a4bd-a0a6-8876-b52bc914027d@microchip.com>
References: <20210719100147.76fa9ec3@canb.auug.org.au>
In-Reply-To: <20210719100147.76fa9ec3@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa9a385b-aded-4f22-775d-08d94a8c45a6
x-ms-traffictypediagnostic: DM4PR11MB5471:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM4PR11MB54718066AAFFD38782A37E6287E19@DM4PR11MB5471.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2u5y5dk2/ltiKEc4xFYcWcY3MNmdEd20+V9egi6anGY05W3Df+TxyQZycWVvIHwjgUzttARUy2UskkLJFT8hmxzIuJaZkh3baT6UMyltlcqbxWW759fzReJ9R0LsKTXU/0Dh5PKsgKcoZTUIPTyWXzyoUxkLqc3u09yqoaBUhjn2ZWMufvjb5+qRj3HipteG/FeUEzJzGb2cew9o3pzoKBC8rjbPaWamyM179x612hivtAV0bRbBjPvMI9ObLAW72esxbfR55HDbFO+X2p6VRGEpGqtPMBq0lNQh2tpGXh7cIB0BtndJLbJQQe/kguei6RR0DA614lLJ+xyfpQUAgq5p5FsE/O4CPhTMeVrqln4l4+X5ISMoDTTfg5YVTj0mO7AF2S3WSeSgX2CoNr7uhfVtKoanZe/FhpwkN18bsGlOSOW0JT3Grek+LjqOFv9K/d2lkvq1gCUE0AkNpMh570hbg7+RbrYVmEaiAkUor8QaE4zg31mywAXkvq20XnwhKBmsEkt+IqonwGRB/Uo9V2psU3bo+IxUW933J2KwXaYDzoxxczoqqCl9HvicT/V4v3H5ERAlpe5fyxxHz3n/+wY8Ez2KuVXfwBVvRXZ7yRAXS/NbcLROFYbh/hzb/kHmuRInDKOgUHwMAk3TN8PEXXL+GDi1KJMp75govNM1sQVSdR3ZAa7lydT1xrCpX3XCPRitJHIyBbAahPoRDt39wwtYjKununHWJu79TE4MWdKzHlWwunGXmzCH+geA0GUwXLVsEJeO4r9lFZvKDuz5Exty06yOkcNEuwJcXhyjrjezNI5dyB2cB0e7EOiUyKOYRhuCFKbt0PVLORhzM81wmy4wPxoT9MZ91dFZxFUH/0A=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3420.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(346002)(136003)(39860400002)(366004)(31686004)(6512007)(86362001)(71200400001)(36756003)(316002)(66446008)(4326008)(54906003)(66556008)(478600001)(110136005)(966005)(8676002)(64756008)(66476007)(66946007)(2616005)(558084003)(76116006)(31696002)(91956017)(6506007)(186003)(2906002)(6636002)(26005)(122000001)(38100700002)(5660300002)(8936002)(6486002)(38070700004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?nqTZXjOKP6eEDddTb8D8S9qpW9DEdpPnHPZdAlW6lD0zMhYFnYtE85H5?=
 =?Windows-1252?Q?zeOBHLnydoymBIaGs/XtaUx+5iveyMtQVBDjTxp4xr2TLCIbAGxrsCJm?=
 =?Windows-1252?Q?MljpPRHKFt3VLrEwQN7utAtFs9gB+trBKcALOf7j8keM2unSI1Pte2sJ?=
 =?Windows-1252?Q?2kOFH/5/dZoG6mApdS+SlUJ/ZyiJh39el+uLalFHWK7LYdAmyHOczUCb?=
 =?Windows-1252?Q?a189O4oR19PUnXGyD5fL5rxqkkQajWupdrWsz1c2G5rTksXl3McbAMKr?=
 =?Windows-1252?Q?+Afg3INTk8MdHWSiNWdO8sVJT3YhH//WMmKy+J8dBaDCSdU6CHMLxPSw?=
 =?Windows-1252?Q?PER8VDpKlhCqMl4W0RE904fmuidNcd3/GIF7GCAFuK/Ia/D9erAd97WQ?=
 =?Windows-1252?Q?lIxuRIPlUgWljbR6uvK324BKqEew/UV4uP+LYy8TSP/aao+VnJzmlvfl?=
 =?Windows-1252?Q?hTqqCI7XHzjQQKciaa5Y/OJ+VoZYFuPhUbgtcjgZPDVAWIrFc22BmMR7?=
 =?Windows-1252?Q?sXP13ME1eN6oTloFxDpX9d6fmd1+sw4RnR7PXw+yK77OcElgSpSFfCX3?=
 =?Windows-1252?Q?3EnygTHpS/swbvCv0OMZ+5l5quhjHoI2S7PeQMn5Xnp9fWqplOz+smPL?=
 =?Windows-1252?Q?MpBSdpWZPRIgYcYKSAT1hsTHQ82mGWS/QmloaQRPRvG+rPpcsXN9eq6s?=
 =?Windows-1252?Q?ZrQBhbTltegvs7XvygOtbFSsMheK71BmzgBmWPIzMzhcXmbF2ke0umod?=
 =?Windows-1252?Q?IB2iNcPomeeF5/UfJuKAxECpOv2dikuzFafjHik5NKgLnJd09GN1Q1fw?=
 =?Windows-1252?Q?LyWfMea6sciOdfMzyf+Yu242K2ciJRdNDZBrA8UAKm7hzHYWapqYDwXf?=
 =?Windows-1252?Q?QU/tR7Ci+Eg0a108UFLaOSXPP4OLbX4HEmWN+v+/IrFiL2oxvVVI1JWM?=
 =?Windows-1252?Q?54kTEU6E9++KHC23b1eAWaMvKSlb5MSy3ABzWKJt/jQdB9c3zQUVtKmV?=
 =?Windows-1252?Q?Vj4FWZSyYfIllRD1SPrKGHslzuF0GBbFOBGe4b3XZYtxvzhqH64ES5vw?=
 =?Windows-1252?Q?059liDEPgj3gNdNVGn89LoMrDWDJdPuB5Gb3Uu+3dM7ahEXWIs2jPZMq?=
 =?Windows-1252?Q?anVh1+9Gb8ta2pAwfuhSnH3zE688Vs/MPAUoJYSB6L7sS7YiVe0RUjCv?=
 =?Windows-1252?Q?HdOAogo7nwNfkYcnvKsFTn7z3FcetjCLLOYvtA8XbvEuOmxz4x7PvrLA?=
 =?Windows-1252?Q?TLmITIy8V7tEmQuI+ZojN7gaDchzON9+xEpVqP54EugioZ7xeXdfCut6?=
 =?Windows-1252?Q?km7xCQ6GrdsTDczldPT25cFQdt3UC3VHIu7joSH0D9Jt5WFQTvy28B9v?=
 =?Windows-1252?Q?94FdeaXmfnXvxhM+9PH+T4/ix0ZBNfrB+AE=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <70126A050D51934F943E51B8969BB837@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9a385b-aded-4f22-775d-08d94a8c45a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 08:07:37.3650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R457j55mJG5Y+I9Xw4peMxexJ5MRkSUb2bg4NuhNqJXlXfFriHjXD4X+q0YKXc+KmQ6ygWOrKFA/Re9byIL8EFnuHVEbRKjycAbIOEklbdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5471
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Apologize for it. I have submitted proper fixes at [1].

Thank you,
Claudiu Beznea

[1]
https://lore.kernel.org/lkml/20210719080317.1045832-1-claudiu.beznea@microc=
hip.com/
