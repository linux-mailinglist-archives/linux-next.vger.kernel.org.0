Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E0D1A0C4C
	for <lists+linux-next@lfdr.de>; Tue,  7 Apr 2020 12:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728213AbgDGKyZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Apr 2020 06:54:25 -0400
Received: from mga09.intel.com ([134.134.136.24]:44241 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgDGKyZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Apr 2020 06:54:25 -0400
IronPort-SDR: kG4KEQ1VD2pKPAHqx6g1Y4ZVmp4c6idVXg8WIBwGXIqLtzQWAJKb0Ge3fS3pIxWliVQgRUmJov
 iESze4GdA/fA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 03:54:24 -0700
IronPort-SDR: K3wp2elAxBh/Wja0kGD3Emf360tqM3neJdrbGhrMfF+ZKhdvo/IXHoSpq3AOMbddlM/hZzHO5B
 xTvQqAFMkOkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,353,1580803200"; 
   d="scan'208";a="243738686"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
  by fmsmga008.fm.intel.com with ESMTP; 07 Apr 2020 03:54:24 -0700
Received: from fmsmsx163.amr.corp.intel.com (10.18.125.72) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 7 Apr 2020 03:54:23 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx163.amr.corp.intel.com (10.18.125.72) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 7 Apr 2020 03:54:23 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.54) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 7 Apr 2020 03:54:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E88VDoTiv41AETZcLFLrIkoT33AS7a2gdgZvoZ+zUgvm+Rf0nItRXfXESehBoPO6i5aCjbSPt+FZN6jOt5HwmAYhVH8Gqh5xW5UnMz0i7/eb3ODR8M6jn+g0nuFiknTHxovuEeauH2Tzys2jd68adkVyn9w0MjETsLRWj17Ezf7zt0Jvc9fbwE8e9oHmfoYMHb0zW/4b/0xXyumcJDefvps5y2Xvf/p3QD5czmdaTn+bEylwj2liQK47tGqMh0QCE3REtEtzelP+zDpHmtrBv3T9yWZ+9JzLOfEge8F8lDwA1h6Akjn5nAvLAK/rTgzwHBnveCtHjm0IMBKCt5JiEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzppWnaYb8QAIdRbcS4qEnxGvipfciZz4EKZ00rVpFQ=;
 b=MSJGrxu1KEsQMnXWNo8ThAMrvT0ILt+dLJPXIBXUhulYVX7y3EvWWyB5n7R02yAHkJc0ehTYu9TptQhTz9vuE500vDlohJsb8GcqXC801n8jcUA0TJwz4xAh6D3YgQOcPLi34mQUdk1bSVPAAhjFdTcGS1++m6RlMWYYwnbdnfZsYt0Vb2/WlmoXSC1DayObG5oTx9plsurdWP4oX9I1ANsbb/wBKdRo+eoQBrGn8hmq/mWcyubif3D89A0189mkqTORKIJ69Nn2PGBYdPQTfIZFcus4nemQNjelRtYqpeduXCg1lA969wETJDJ406+WXKSUM9fyJMXLY+AoQMrLxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzppWnaYb8QAIdRbcS4qEnxGvipfciZz4EKZ00rVpFQ=;
 b=L8PaN11RPMCWak3gmIvvsdh2IMuRqQPDCh2yeq/PGU7ZpdxJCTwCFCjqNG2I2fppk1u75AmtG0ExrJIK1Gyy8xbLFOGhYzLzjrW4JD02t1o1AJFJsYSJmZRsZrRkIvlT4gaZWcJHobq7ERf2TQAHQqmfMqDExzvUYAPnPn87U70=
Received: from DM6PR11MB2715.namprd11.prod.outlook.com (2603:10b6:5:be::18) by
 DM6PR11MB4250.namprd11.prod.outlook.com (2603:10b6:5:1df::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.19; Tue, 7 Apr 2020 10:54:22 +0000
Received: from DM6PR11MB2715.namprd11.prod.outlook.com
 ([fe80::acac:f826:6b48:1a69]) by DM6PR11MB2715.namprd11.prod.outlook.com
 ([fe80::acac:f826:6b48:1a69%4]) with mapi id 15.20.2878.017; Tue, 7 Apr 2020
 10:54:22 +0000
From:   "Narasimman, Sathish" <sathish.narasimman@intel.com>
To:     coverity-bot <keescook@chromium.org>
CC:     Marcel Holtmann <marcel@holtmann.org>,
        "Tumkur Narayan, Chethan" <chethan.tumkur.narayan@intel.com>,
        lkp <lkp@intel.com>, "Bag, Amit K" <amit.k.bag@intel.com>,
        Hsin-Yu Chao <hychao@chromium.org>,
        "Hedberg, Johan" <johan.hedberg@intel.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: Coverity: btusb_work(): Null pointer dereferences
Thread-Topic: Coverity: btusb_work(): Null pointer dereferences
Thread-Index: AQHWDCsSILpBulyMOUiex4FVFfHrVKhte1Fg
Date:   Tue, 7 Apr 2020 10:54:22 +0000
Message-ID: <DM6PR11MB2715D200FA424448E05B64D494C30@DM6PR11MB2715.namprd11.prod.outlook.com>
References: <202004060849.823489FC@keescook>
In-Reply-To: <202004060849.823489FC@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-reaction: no-action
dlp-product: dlpe-windows
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sathish.narasimman@intel.com; 
x-originating-ip: [106.51.110.153]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6056dfd1-a375-4d23-00cf-08d7dae207ac
x-ms-traffictypediagnostic: DM6PR11MB4250:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB425002422FBD2AC408BEC97094C30@DM6PR11MB4250.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 036614DD9C
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2715.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(39860400002)(376002)(136003)(396003)(346002)(366004)(55236004)(53546011)(478600001)(2906002)(7696005)(6506007)(81166006)(81156014)(26005)(8676002)(66446008)(5660300002)(8936002)(76116006)(186003)(66556008)(66946007)(66476007)(71200400001)(52536014)(64756008)(6916009)(9686003)(55016002)(33656002)(4326008)(86362001)(54906003)(966005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ogdMAd3o5TrSqDvkqyntq4vZO7nchbasBdL0e4r+LqDslPlvJB1WRjwTd1Aot9mwGMKhZnCkzbNaqBOy5FhFtoPrX1Jf7MPqzWPDtTi5AV+v5zuaOvvT+v2olsJf0Dr+3IEC4QebHuN1anuOGnQMn/Ayl1rY4Kz2jZuXdy3VT8WvnWkJJgjxv6Rix3Hw/fUWCUNTnmFjgzbEX+Ir7XIQAPtrIjNIBnOPn/WFWn8CaS/4OAKS8JeB++Pt6ce1WaEYjKu1osgeLRq3CWiKcYH7nIPd414P/y7yOU3s9PnluGx9xbIHZljndsrVaSk2zg7wF7m2ePEbYTXXlPLcwYK9AGlA59knddeOwe4Z8o9yFaO0gbu01pSnkJIwaWUf0ZclkizrO7a/VlzTX9TNK5s23MIg70WNVUeIaWuRBvBFiUe8SgbqNt1QVXRepaClmkWUjVb0KLtxasajJenxxfQjTym3DrjmD0MEBSDOPUHNez3fOxPbalkrBwzAhm2uF1Z/nj+YIHrXrdIoc014IwiJyQ==
x-ms-exchange-antispam-messagedata: t6AKnBi7f5FZ+RXkBXf6PD28PA4DQXP8PNFd1TwdCy9oOs05nCGZLgEa8/NOo+8VYFmvP/375OMS471536MdUyvsDvhsQwEI8G6uQySLEHUDzYBR1c7Pd3Gx8gipYq/YidStp+TrEHo4CteYJ6P0Lw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6056dfd1-a375-4d23-00cf-08d7dae207ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2020 10:54:22.1432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9p+EuqAs4YFDPNL5LFdQfkT5S9gQLUvTbh+ABkbqnKOJVPLEhHM+iUDfMIZCtfYGB/1S8U01gosFvxt8DtmFBz13CZ95vJ5HUB9erdK4VQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4250
X-OriginatorOrg: intel.com
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi

I think this is False Positive.

In the function btusb_probe the memory allocation is happened and verified =
for NULL.
I don't this so checking for NULL evey time is required.

Sample code snip

In function "btusb_probe"
{
        data =3D devm_kzalloc(&intf->dev, sizeof(*data), GFP_KERNEL);
        if (!data)
                return -ENOMEM;
....
       INIT_WORK(&data->work, btusb_work);

}


Regards
Sathish N

-----Original Message-----
From: coverity-bot <keescook@chromium.org>=20
Sent: Monday, April 6, 2020 9:20 PM
To: Narasimman, Sathish <sathish.narasimman@intel.com>
Cc: Marcel Holtmann <marcel@holtmann.org>; Tumkur Narayan, Chethan <chethan=
.tumkur.narayan@intel.com>; lkp <lkp@intel.com>; Bag, Amit K <amit.k.bag@in=
tel.com>; Hsin-Yu Chao <hychao@chromium.org>; Hedberg, Johan <johan.hedberg=
@intel.com>; Gustavo A. R. Silva <gustavo@embeddedor.com>; linux-next@vger.=
kernel.org
Subject: Coverity: btusb_work(): Null pointer dereferences

Hello!

This is an experimental automated report about issues detected by Coverity =
from a scan of next-20200406 as part of the linux-next weekly scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified l=
ines of code (noted below) that were touched by recent commits:

baac6276c0a9 ("Bluetooth: btusb: handle mSBC audio over USB Endpoints")

Coverity reported the following:

*** CID 1492498:  Null pointer dereferences  (FORWARD_NULL)
/drivers/bluetooth/btusb.c: 1665 in btusb_work()
1659     			}
1660     		} else if (data->air_mode =3D=3D HCI_NOTIFY_ENABLE_SCO_TRANSP) {
1661
1662     			data->usb_alt6_packet_flow =3D true;
1663
1664     			/* Check if Alt 6 is supported for Transparent audio */
vvv     CID 1492498:  Null pointer dereferences  (FORWARD_NULL)
vvv     Passing "data" to "btusb_find_altsetting", which dereferences null =
"data->isoc".
1665     			if (btusb_find_altsetting(data, 6))
1666     				new_alts =3D 6;
1667     			else
1668     				bt_dev_err(hdev, "Device does not support ALT setting 6");
1669     		}
1670

If this is a false positive, please let us know so we can mark it as such, =
or teach the Coverity rules to be smarter. If not, please make sure fixes g=
et into linux-next. :) For patches fixing this, please include these lines =
(but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492498 ("Null pointer dereferences")
Fixes: baac6276c0a9 ("Bluetooth: btusb: handle mSBC audio over USB Endpoint=
s")


Thanks for your attention!

--
Coverity-bot
