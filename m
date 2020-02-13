Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45E1215B99E
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2020 07:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729728AbgBMGgB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Feb 2020 01:36:01 -0500
Received: from rcdn-iport-3.cisco.com ([173.37.86.74]:5065 "EHLO
        rcdn-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgBMGgB (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Feb 2020 01:36:01 -0500
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Feb 2020 01:36:01 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=835; q=dns/txt; s=iport;
  t=1581575761; x=1582785361;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=qZwesZdX+WnEoFrmCVXZawlepokl1/u0yOq39WQ/s/c=;
  b=O/z4ueUhvYeKHtZGDYWysxQDvcW9tfQJDAzr3dHzV0kAhMdfYCEEQCsr
   iFsAixPWJlVoS5T5WucDDTutz1kmS5rGcJtF3g/R8YZuw7OP+i5T8aFoa
   eYQrE5AUswIA3fmiAoeCpvQVSlyqE6yGvizVzeeC6SPf+fE9yyK8tqTId
   E=;
IronPort-PHdr: =?us-ascii?q?9a23=3AjICpYRFiGOmB/LbVFg0ITp1GYnJ96bzpIg4Y7I?=
 =?us-ascii?q?YmgLtSc6Oluo7vJ1Hb+e4z1Q3SRYuO7fVChqKWqK3mVWEaqbe5+HEZON0pNV?=
 =?us-ascii?q?cejNkO2QkpAcqLE0r+efzpaDYhGslZfFRk5Hq8d0NSHZW2ag=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AsCADh60Re/49dJa1lHQEBAQkBEQU?=
 =?us-ascii?q?FAYF7gVRQBWxYIAQLKodaA4sDgjolmBGCUgNUCQEBAQwBARsSAgQBAYRAAoJ?=
 =?us-ascii?q?KJDgTAgMNAQEFAQEBAgEFBG2FNwyFZwEBAQMSLgEBNwEPAgEIDgouMiUCBAE?=
 =?us-ascii?q?NJ4MEAYJKAy4BAqIMAoE5iGKCJ4J/AQEFhSIYggwJgTiMJBqBQT+BOAyCMi4?=
 =?us-ascii?q?+hEuFbq96CoI6h02OfgYCGoJIeocakDuOaJstAgQCBAUCDgEBBYFpIoFYcBW?=
 =?us-ascii?q?DJwlHGA2OHQwXg1CFQoURdIEpjXgBAQ?=
X-IronPort-AV: E=Sophos;i="5.70,435,1574121600"; 
   d="scan'208";a="707457776"
Received: from rcdn-core-7.cisco.com ([173.37.93.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 13 Feb 2020 06:28:54 +0000
Received: from XCH-RCD-005.cisco.com (xch-rcd-005.cisco.com [173.37.102.15])
        by rcdn-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 01D6SsrC028977
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Thu, 13 Feb 2020 06:28:54 GMT
Received: from xhs-rcd-001.cisco.com (173.37.227.246) by XCH-RCD-005.cisco.com
 (173.37.102.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 00:28:54 -0600
Received: from xhs-aln-003.cisco.com (173.37.135.120) by xhs-rcd-001.cisco.com
 (173.37.227.246) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Feb
 2020 00:28:53 -0600
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-003.cisco.com (173.37.135.120) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 13 Feb 2020 00:28:53 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cl8BZezOvhI6ulrp6QP2nkWiRENz4Nk4N3WzzRPny9fD7g6Eh6gH7jDzQYGFyfJjA2iiEgYnZRuPC9nkwu9UFOAv+iVsMlucWZM0xs5jJeGMGl6uTDRNIsxjq5bVN7O/kvi52GL5uXkp80ayZKg34LdwSmvnEYhA+pkObe5yElofbkDcNVAAbKAAxWwAQb3HvNCJH9gkd2w7yf85pMqzoIF9AN1043ca64j8MPMn1hTggdn8UJc1lhsHd8CGRxKK+1aSl+Q34sGK2tJEmug9vuHVBkcPPUpn7gvK/MrVGK7udmac9t/uOE9BNiHhFIbO0tEwGRQOrZjyrqXYIcKA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3fJSM1mt6vIk6PDKD72pQGr9Yd5rTmOppDlngayf7E=;
 b=WG2j6sCkcBp1O6yDoC7XPHoILCMKOiyDZDpvCcGUQwHmCwa5jN+PXi+NVLmmNXA1zWNqXtoz15IQ8lvevN2GGOSTZ4dB+iLa7wYitubf4smq2P9zBkYwBthz7bWSix81yinZzs9iQBci6G5wRzZv+BpKSzJJwVcTKL3bcuBNPm7r+irtpDpdne/KXZZWNHTTnrcnsPbnNdtgLs4za0rHCaSgkwiBfkjvbm5G8GWIERDAzrUKdbmDIvimvkwOGEoStplXG35lxbqL6LtAEQyYi7SQa6L4T4FQgNSX1uQVchwQ2843DCk1tQLbnv2aO91yvDDrzZzvBMIGXvOCut4imQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3fJSM1mt6vIk6PDKD72pQGr9Yd5rTmOppDlngayf7E=;
 b=i8tzEg/P/z0w8w4/K4VT6dMWUwykG6Z1A6qDJ6By6c6rcIIt8oxATs/Ur3PNtlYw/GW5VFl+PTt1MT208lH4ZQABoBloqUn4NMCIawVWfTH7g0TGu5TapPWlShYqmtzaBeFKdhCgkJ+r6J/iT9tyj24bcpdHrWkbDWW/83svHGc=
Received: from DM6PR11MB2986.namprd11.prod.outlook.com (20.177.216.79) by
 DM6PR11MB3308.namprd11.prod.outlook.com (20.176.123.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.23; Thu, 13 Feb 2020 06:28:52 +0000
Received: from DM6PR11MB2986.namprd11.prod.outlook.com
 ([fe80::fc45:52bd:7009:221e]) by DM6PR11MB2986.namprd11.prod.outlook.com
 ([fe80::fc45:52bd:7009:221e%6]) with mapi id 15.20.2707.030; Thu, 13 Feb 2020
 06:28:52 +0000
From:   "Johan Korsnes (jkorsnes)" <jkorsnes@cisco.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the hid tree
Thread-Topic: linux-next: Fixes tag needs some work in the hid tree
Thread-Index: AQHV4eYHhAVedZ6rMUSAflkiZqMcuagYqesA
Date:   Thu, 13 Feb 2020 06:28:52 +0000
Message-ID: <05403763-3849-06ec-870e-c7e9c907714d@cisco.com>
References: <20200213074940.4fc25926@canb.auug.org.au>
In-Reply-To: <20200213074940.4fc25926@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jkorsnes@cisco.com; 
x-originating-ip: [2001:420:44c1:2576:5a2f:415d:31e3:2554]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 576f8874-d6c1-4dad-2907-08d7b04dfe97
x-ms-traffictypediagnostic: DM6PR11MB3308:
x-microsoft-antispam-prvs: <DM6PR11MB33083B3DFE7525A3B1D9D757D71A0@DM6PR11MB3308.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 031257FE13
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(189003)(199004)(316002)(6486002)(31686004)(53546011)(86362001)(81166006)(81156014)(5660300002)(2616005)(6506007)(186003)(36756003)(4744005)(2906002)(4326008)(31696002)(71200400001)(66446008)(64756008)(54906003)(66946007)(6512007)(110136005)(478600001)(76116006)(91956017)(66556008)(8676002)(66476007)(8936002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR11MB3308;H:DM6PR11MB2986.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R912hKC3E0rXaHqDnoyAvPS07nSJddkNuClAjDYLYCKGvYL9PyJxf9MJqsPly6eGeWEFVRRqj+nMLE+iGnUYRdhPdn0QP/GYxXND7RWTuOPGQwRxXx0tJZ7sb7t/QlPEKVq8fIFumgcNYI52bwvu0+8dmazILjKy+Gqy5QtpOzUZ4ZppJWpy3C2gP8pu64XQ6vLrj48zUJ5ryoLW1frZgGbNjkc2lpTQWIilAHAgA0me0kxL8Ngoyr3bVQtaj4Iu9yQ1wzrAzlX9Uu7MC8YN9ah10Eo5SkOPMjPIenQoRadrg3Jzd1E+mDUpZKvEeK6aV8s7tYTEx4fl6a0KV7o5UaaTnq21Ysw86B3H8mb3LD+ZSlovDqHaRPXeQXa3vhYavWafUJli0iRsghpJtIvR2e9XgUV+yBbPjwXM5gLDBKceX20kJko4A/6lehFmXoAv
x-ms-exchange-antispam-messagedata: 09RpeO86H1+HMRTJfVw7qt2rNOk48ZYj5/GjUoaelOHGwrqqu4QOxdh+51RN5YlsZcBRQ5+OUTgJzvEF0uHPObJ88SIfOWOrR3ek+fUGoGaegTxkAow//8pds2FzG/3EHy6Zy4q2X0g54b/lCqD0u2Fl56FWvaU0u6JSlIELVs1/8GEeqxuTLjQ76NKF2aNmu3CvDqS4yYoMXobxgyQkOg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <07BE8EECC116E446A0D396F5294B1E10@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 576f8874-d6c1-4dad-2907-08d7b04dfe97
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2020 06:28:52.5444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +QFpppotX4Wc8aYsKDRIRK6eOc9zsglc2FBmZYHxWwisSOIo+QDaZNbha63ux8w44s6JfuYnyb+XD80/XDkyow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3308
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.15, xch-rcd-005.cisco.com
X-Outbound-Node: rcdn-core-7.cisco.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/12/20 9:49 PM, Stephen Rothwell wrote:
> Hi all,
>=20
> In commit
>=20
>   5ebdffd25098 ("HID: core: fix off-by-one memset in hid_report_raw_event=
()")
>=20
> Fixes tag
>=20
>   Fixes: 966922f26c7f ("HID: fix a crash in hid_report_raw_event()
>=20
> has these problem(s):
>=20
>   - Subject has leading but no trailing quotes
>=20
> Please do not split Fixes tags over more than one line.
>

Sorry about this. The checkpatch.pl script initially did complain
about the format of my commit references in v1:

"ERROR: Please use git commit description style"

But it only complained about number of characters in SHA, it did not
mention anything about line break. I will take care not to introduce
these line breaks in future commits, but it would be nice if
checkpatch.pl could check for this.

Johan
