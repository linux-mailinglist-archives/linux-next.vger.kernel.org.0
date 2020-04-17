Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 324011AE698
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 22:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730917AbgDQUOu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 16:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730904AbgDQUOt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Apr 2020 16:14:49 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::609])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D43C061A0C;
        Fri, 17 Apr 2020 13:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQpJukxUlGxsOzor364uQu8LLpzX5sebuaq8/eXix6I=;
 b=uzHhR0agTfFL+WkX96yuV/RfpziTe0qdKH+1w374oOFIRfIb5plFxVJ1HLLarLAWaB49MoWTno6GThaG6sO2u8iyOV20HnHFoIndaOtNojYd0w6+upl2p/YvMWJKChQaGpq5VD79hXMtVYG84X4umUyGT+n3m7ePQ0UDxN/WCJw=
Received: from AM6PR10CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::18)
 by VI1PR08MB3423.eurprd08.prod.outlook.com (2603:10a6:803:7c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Fri, 17 Apr
 2020 20:14:45 +0000
Received: from AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:80:cafe::21) by AM6PR10CA0041.outlook.office365.com
 (2603:10a6:209:80::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Fri, 17 Apr 2020 20:14:45 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT057.mail.protection.outlook.com (10.152.17.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.18 via Frontend Transport; Fri, 17 Apr 2020 20:14:44 +0000
Received: ("Tessian outbound ecb846ece464:v53"); Fri, 17 Apr 2020 20:14:44 +0000
X-CR-MTA-TID: 64aa7808
Received: from 8dbfb74db74b.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 550944C9-F105-468B-8B08-05D7052BF0E9.1;
        Fri, 17 Apr 2020 20:14:39 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8dbfb74db74b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 17 Apr 2020 20:14:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f12QVjoEeJ1/9eN6QX4tHmX3kH/wul2eGcrEa+PSb2kOsaIhYEDKuDdcaX9yYEs+kQEjUyg8B8Vmqy7e1MxdA0yCXtsYu8CjEk+qwMGrnDAoFlpcwTUU4uDIHv5pY+V6XKl9gTq3C5k66c9DaC1F7Wo5VXHQ1UiIoTqnJLc6bDA74rQoZmFt30NpeF4penwggRsY9x1VVmIx+nuHcuca4zjMtx2wifUJOFuxQeqlKgLuk692czmIhkLruVAO2moPfV3WO+1k08xiVApPBJFhqmins4qZn5JN7U7qYsDtMwsYLPAHFRM5k/A9C9KzC2pw6UowIM0ZWcqaEn3o1Jtzxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQpJukxUlGxsOzor364uQu8LLpzX5sebuaq8/eXix6I=;
 b=YadHKeLO3qUWgUfRAvRQbeunV5T5qMIZ3VH+nXs44czVdJWchLilDw483PwNGVS/jXZ2sO33psC8fk7IMwS2tDo9WH7+w66Rs6xiiJ/jxfbsgR0fnXFwl108BLez9d55rRqbBmaYMpx0o54FcdFw+kMuF6RESV4eV6jlhKqJUY90BB8G3vOH8klQ4xzjdjlhTu/Qphdt9lxdFayVC28yf94eOeMG1zFcaSs4plEV0WpkeaL0Jg/OfHCE5PUvh6DAX79zLByoHVu8lg2NRkCbHFJsbaey1yPuaCT80YxaaOH+IgipWppPeP0AMZznVrSkYxFgshIwdigG9wjF/KcrrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQpJukxUlGxsOzor364uQu8LLpzX5sebuaq8/eXix6I=;
 b=uzHhR0agTfFL+WkX96yuV/RfpziTe0qdKH+1w374oOFIRfIb5plFxVJ1HLLarLAWaB49MoWTno6GThaG6sO2u8iyOV20HnHFoIndaOtNojYd0w6+upl2p/YvMWJKChQaGpq5VD79hXMtVYG84X4umUyGT+n3m7ePQ0UDxN/WCJw=
Received: from DB6PR0802MB2533.eurprd08.prod.outlook.com (2603:10a6:4:a0::12)
 by DB6PR0802MB2341.eurprd08.prod.outlook.com (2603:10a6:4:89::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Fri, 17 Apr
 2020 20:14:36 +0000
Received: from DB6PR0802MB2533.eurprd08.prod.outlook.com
 ([fe80::b959:1879:c050:3117]) by DB6PR0802MB2533.eurprd08.prod.outlook.com
 ([fe80::b959:1879:c050:3117%8]) with mapi id 15.20.2921.027; Fri, 17 Apr 2020
 20:14:36 +0000
From:   Hadar Gat <Hadar.Gat@arm.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        nd <nd@arm.com>
Subject: RE: linux-next: Tree for Apr 17 (drivers/char/hw_random/cctrng.c)
Thread-Topic: linux-next: Tree for Apr 17 (drivers/char/hw_random/cctrng.c)
Thread-Index: AQHWFMwlbIZ8WKggn0OnxUK9zvXVDqh9v4ng
Date:   Fri, 17 Apr 2020 20:14:35 +0000
Message-ID: <DB6PR0802MB2533F8342A00C8B9A9CB3547E9D90@DB6PR0802MB2533.eurprd08.prod.outlook.com>
References: <20200417145017.3932443d@canb.auug.org.au>
 <d1786751-48de-e75c-44df-3edad4f21efb@infradead.org>
In-Reply-To: <d1786751-48de-e75c-44df-3edad4f21efb@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 312f4463-b403-4fdf-9a62-9fc9b42cd27d.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Hadar.Gat@arm.com; 
x-originating-ip: [84.109.179.203]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3692f911-7b0a-488a-7aac-08d7e30bf864
x-ms-traffictypediagnostic: DB6PR0802MB2341:|VI1PR08MB3423:
X-Microsoft-Antispam-PRVS: <VI1PR08MB342359C096A007F25464C4C8E9D90@VI1PR08MB3423.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:4125;OLM:4125;
x-forefront-prvs: 0376ECF4DD
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0802MB2533.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(71200400001)(52536014)(86362001)(2906002)(186003)(4326008)(5660300002)(64756008)(66446008)(66946007)(76116006)(66556008)(66476007)(7696005)(53546011)(316002)(110136005)(54906003)(33656002)(55016002)(6506007)(9686003)(8676002)(81156014)(8936002)(478600001)(26005);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: oWV1XOdrhXJ2v3aCU/wAfee351JGARPhFkkcNRJduiAMlETeSojG0fUoEz1v+27z/rJId6rxnO1K5vwKHe8K413vf551jQU7dwld0ogBT1WkgRSfNStMnOoyro/1L8Iii+tUhBhSePCVMaVxTq9iou0zLY1pIFeEsDOpCzDJrS3AC/2X3AqMVCJRgY4SJU1yErZtHhWOeHiveDsnF33ivMcz6rUWtOsSVVH7NaMoXy+P+wA+GH48qB3M6HGFWRkpFd281OoS8kdjKVUt4PeKV7SPDjpGWpzGu/+i6Sl3iEHOzisDPZS4vuahfqbRq614GhI6Zn8irfBYZtTCOnY5IPNAaUSdEVwp9I1dj3zJWZZaGd/KogsFmiiy42nofe9E7TtBWSa/e4g9hhiWdNNitdeayaEFfzhE5UsTgAd/sEZ9E/gCPEf1wz5vTep60zAJ
x-ms-exchange-antispam-messagedata: Xan4X64V4ajQE8HEsoym5zqPd8+wDwn9vquf00Z4Iw+zDQgHSH7bS3w2cSFVNxobi3nMQTsbQGm2rbTymRdwM6a6qCl7agIDj4OAiZX/M3R3rsSYUD6fzzklRYrMdnhkechie6c5kPCRKj0GP4FRXw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2341
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hadar.Gat@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966005)(54906003)(316002)(36906005)(110136005)(7696005)(336012)(2906002)(186003)(26005)(81156014)(82740400003)(8936002)(33656002)(8676002)(6506007)(53546011)(81166007)(55016002)(4326008)(450100002)(26826003)(5660300002)(478600001)(47076004)(356005)(52536014)(9686003)(70586007)(70206006)(86362001);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 481eedc9-1f56-46b3-7380-08d7e30bf349
X-Forefront-PRVS: 0376ECF4DD
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZfvCDkm3odjt/xuQaYUzRhqAX4tUp6YPz8kiNkZpX0fi1Bz8mpMtIy7ucWV1L6DEJ6KVc94EOknzGIoqITib30LKj+oEwEUcex+3/OnE3P0WOzHyoAIsgqF2/ejkPLXe3TY4Y9+I1wPjxYwwI7XSea70xlY942IIUykDNw6vxx6+AObgA6S9W451J3eMNmcOKDQgRKcWEAP5YGm8um0PxjFLaYeHi4RwOdAl8zPzXk0SRUp16tx5i1mPSw5i5LfeIgDFCubepJm76u6D3YFeQjxEJgC9teNCBUxCbWdJ9IWEeVuiZ3gUAlu0gucs1glWlKN255AE+1inPHPBJI+qrW92D0joF65FEQ4Q90O+JsTsTSwxV9+XzIyfakzDYEesvOBGd2yG8xrwZI1tr6T/BD1Ai1nsgg7J9UfldwlGweSrM6amS31B8pPjRMGCS3pX6Xh/kZMFmrRUi+QUJs0GQBh0R1MuMAUw6DCjz1VIr7JJmxqIbhcBS8eNUe+dKU8N4hBPZyAZLhoI43w2AMHBaA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2020 20:14:44.6693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3692f911-7b0a-488a-7aac-08d7e30bf864
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3423
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgUmFuZHksDQpUaGFuayB5b3UgZm9yIHJlcG9ydGluZy4NCkkgd2lsbCBmaXggdGhpcyBpc3N1
ZSBzaG9ydGx5Lg0KSGFkYXINCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9t
OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gU2VudDogRnJpZGF5LCAx
NyBBcHJpbCAyMDIwIDE4OjIzDQo+IFRvOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVn
Lm9yZy5hdT47IExpbnV4IE5leHQgTWFpbGluZyBMaXN0DQo+IDxsaW51eC1uZXh0QHZnZXIua2Vy
bmVsLm9yZz4NCj4gQ2M6IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc+OyBMaW51eCBDcnlwdG8NCj4gTWFpbGluZyBMaXN0IDxsaW51eC1jcnlw
dG9Admdlci5rZXJuZWwub3JnPjsgSGFkYXIgR2F0DQo+IDxIYWRhci5HYXRAYXJtLmNvbT4NCj4g
U3ViamVjdDogUmU6IGxpbnV4LW5leHQ6IFRyZWUgZm9yIEFwciAxNyAoZHJpdmVycy9jaGFyL2h3
X3JhbmRvbS9jY3RybmcuYykNCj4gDQo+IE9uIDQvMTYvMjAgOTo1MCBQTSwgU3RlcGhlbiBSb3Ro
d2VsbCB3cm90ZToNCj4gPiBIaSBhbGwsDQo+ID4NCj4gPiBDaGFuZ2VzIHNpbmNlIDIwMjAwNDE2
Og0KPiA+DQo+IA0KPiANCj4gb24gaTM4NjoNCj4gDQo+IC4uL2RyaXZlcnMvY2hhci9od19yYW5k
b20vY2N0cm5nLmM6IEluIGZ1bmN0aW9uDQo+IOKAmGNjX3RybmdfY29tcHdvcmtfaGFuZGxlcuKA
mToNCj4gLi4vZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9jY3RybmcuYzozMzQ6NDk6IGVycm9yOiDi
gJhmaXBzX2VuYWJsZWTigJkgdW5kZWNsYXJlZA0KPiAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rp
b24pOyBkaWQgeW91IG1lYW4g4oCYbnhfZW5hYmxlZOKAmT8NCj4gICBpZiAoQ0NfUkVHX0ZMRF9H
RVQoUk5HX0lTUiwgQ1JOR1RfRVJSLCBpc3IpICYmIGZpcHNfZW5hYmxlZCkgew0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+DQo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBueF9lbmFi
bGVkDQo+IC4uL2RyaXZlcnMvY2hhci9od19yYW5kb20vY2N0cm5nLmM6MzM0OjQ5OiBub3RlOiBl
YWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllcg0KPiBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVh
Y2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbg0KPiAuLi9kcml2ZXJzL2NoYXIvaHdfcmFuZG9tL2Nj
dHJuZy5jOjMzNTozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YNCj4gZnVuY3Rpb24g
4oCYZmlwc19mYWlsX25vdGlmeeKAmTsgZGlkIHlvdSBtZWFuIOKAmHN5c2ZzX25vdGlmeeKAmT8g
Wy1XZXJyb3I9aW1wbGljaXQtDQo+IGZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiAgICBmaXBzX2Zh
aWxfbm90aWZ5KCk7DQo+ICAgIF5+fn5+fn5+fn5+fn5+fn4NCj4gICAgc3lzZnNfbm90aWZ5DQo+
IA0KPiANCj4gRnVsbCByYW5kY29uZmlnIGZpbGUgaXMgYXR0YWNoZWQuDQo+IA0KPiAtLQ0KPiB+
UmFuZHkNCj4gUmVwb3J0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3Jn
Pg0K
