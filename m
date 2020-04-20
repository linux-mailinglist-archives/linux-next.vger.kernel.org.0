Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015B41B0FFD
	for <lists+linux-next@lfdr.de>; Mon, 20 Apr 2020 17:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbgDTP0d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Apr 2020 11:26:33 -0400
Received: from mail-am6eur05on2056.outbound.protection.outlook.com ([40.107.22.56]:6612
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726050AbgDTP0c (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 20 Apr 2020 11:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DIkMi94MgGn49wtSTKmWC+LDOcNegzJc+nWGSho/Jw=;
 b=XSbRnmbiPcVOiBHQUxXx0AAIMkl3eMN5yg8ff5SnFdJ4/NxMzNU2CIaCKPcFy97+bfekomqnUEnISqq9auiN3Z4LbIwS2NBTZoQipH2IKSKhxjTx1yDTogH583MBMLySyWcQ3PWWLE0C0tPz+IXOsuGAxtil9oPyQwmcOo+3aX0=
Received: from DB8PR09CA0033.eurprd09.prod.outlook.com (2603:10a6:10:a0::46)
 by DB7PR08MB3465.eurprd08.prod.outlook.com (2603:10a6:10:50::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 15:26:27 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:a0:cafe::8) by DB8PR09CA0033.outlook.office365.com
 (2603:10a6:10:a0::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend
 Transport; Mon, 20 Apr 2020 15:26:27 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2900.15 via Frontend Transport; Mon, 20 Apr 2020 15:26:27 +0000
Received: ("Tessian outbound 29c24b8a1b7a:v53"); Mon, 20 Apr 2020 15:26:27 +0000
X-CR-MTA-TID: 64aa7808
Received: from 14922a19640c.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id A26F1E5C-4469-46F2-A61F-A05936FFFD31.1;
        Mon, 20 Apr 2020 15:26:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 14922a19640c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Apr 2020 15:26:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DBX//8IkCKkkJw1DRxBlREtB3P7SFDpEuAwkz4F7OCL7zNhv9VgbiBbVafevkq/lsT5xlKNNmfH4Ij6ERyoKQ7V8TxwTpGN8SWs0uqPJwIlcoofvycdWynzXiDvYQi2IN7N5MMEvnCMG8LQRtdQ5kE6vHSOI3wjJ1rlqJsxOZLJnV+JeL1TlxjXWjNQrGvmVYDT34VF+9HqZPtwlcQ4hXQ7ubAq20drmG0kBaifozqbpXM6AEF6opKdXtIyYF4dt+PsHwJRYG+SrqT0qcdn2ksJoB/wR/A/Xp41BxsaMI6covU/EWaT8YI63iZ/Oc3X9z8TGjonypLJtXPxyOww2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DIkMi94MgGn49wtSTKmWC+LDOcNegzJc+nWGSho/Jw=;
 b=BhGy1HH+tqKC6WmjmZdKWvUNhdXj6E7uTH4EVTsLLQKxBWyAFSNL73bXtVas5zaT+UtbKKcPhG7ZVnU2YlynQHRvmFGdi+PKjoG5K76zrTgS8+X+sO0OVaFA397ZjEWvB/K80996XBa8YYSR8COzm+eD9GuPM3kJ7P3T0zZKGd3vqXCwoTJYpa8otLZwwc8zXzdqKtH9Ap2+8bHG1KY35xU4vkEEGXENh6Qf4VO0zhh+tIwFQJbPxubBUdhRWL7Dopv0tOTr5QeekVdEOvqwvTn7gSBcPBwPRhDyl5NaP4gQlWxXy03ocmAFrvd+dBeJXRVanir59dSf7nnm+/mEew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7DIkMi94MgGn49wtSTKmWC+LDOcNegzJc+nWGSho/Jw=;
 b=XSbRnmbiPcVOiBHQUxXx0AAIMkl3eMN5yg8ff5SnFdJ4/NxMzNU2CIaCKPcFy97+bfekomqnUEnISqq9auiN3Z4LbIwS2NBTZoQipH2IKSKhxjTx1yDTogH583MBMLySyWcQ3PWWLE0C0tPz+IXOsuGAxtil9oPyQwmcOo+3aX0=
Received: from DB6PR0802MB2533.eurprd08.prod.outlook.com (2603:10a6:4:a0::12)
 by DB6SPR00MB2501.eurprd08.prod.outlook.com (2603:10a6:4:ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 15:26:21 +0000
Received: from DB6PR0802MB2533.eurprd08.prod.outlook.com
 ([fe80::b959:1879:c050:3117]) by DB6PR0802MB2533.eurprd08.prod.outlook.com
 ([fe80::b959:1879:c050:3117%8]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 15:26:21 +0000
From:   Hadar Gat <Hadar.Gat@arm.com>
To:     Murphy Zhou <jencce.kernel@gmail.com>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
CC:     "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        nd <nd@arm.com>
Subject: RE: [PATCH] [linux-next] hwrng: cctrng - fix missing fips header
Thread-Topic: [PATCH] [linux-next] hwrng: cctrng - fix missing fips header
Thread-Index: AQHWFvP1woErzhU19UylzjRAJ/5ykaiCIZUw
Date:   Mon, 20 Apr 2020 15:26:21 +0000
Message-ID: <DB6PR0802MB2533463AC80716EAAA2BE782E9D40@DB6PR0802MB2533.eurprd08.prod.outlook.com>
References: <20200420091318.bj533ppmetonqygn@xzhoux.usersys.redhat.com>
In-Reply-To: <20200420091318.bj533ppmetonqygn@xzhoux.usersys.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: e64e4c22-c4d7-40c5-96ba-f694bd65ce8e.1
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Hadar.Gat@arm.com; 
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e328f341-cb90-43ab-d8fc-08d7e53f319e
x-ms-traffictypediagnostic: DB6SPR00MB2501:|DB7PR08MB3465:
X-Microsoft-Antispam-PRVS: <DB7PR08MB34659549E6113B932C08E90FE9D40@DB7PR08MB3465.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3276;OLM:3276;
x-forefront-prvs: 03793408BA
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0802MB2533.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(478600001)(76116006)(81156014)(7696005)(55016002)(86362001)(316002)(26005)(33656002)(9686003)(52536014)(6506007)(71200400001)(4326008)(8676002)(2906002)(66946007)(66476007)(5660300002)(66556008)(64756008)(66446008)(54906003)(8936002)(186003)(110136005);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: vvr5ASEtnp0L3/gm+dAgUph6W44Gr9HH3/DWUl9tUXxeI6uYhhKFuQkHj1aNbzFPJ/F137kM2TJalvHTBXz/vXwYyIZg7RPbjHphQSZSzMMPzL+APtIg980BUam+nIuvH33YnPG1f4ioMnaHIWFR0DOajLzCZRLqmmL0gzRdbno9iSptA9GXxboufS7TSCa80gD/U+pjsLRWg/YthZ74n+SlnfremsHEGGWCfDUnEdIRIdFlMaJAbStpSczuAH7G7V0GwzeqbLzR/JuhIg68SNv0TBzxym3BG8RRmqGO0oi1QynCaMcYlVbwIr68P/C2muclrFY4O/d39HQEfrHP2/TnNj6hMsO7dFtC0IZHmUgNZLai/xAapTjC6/ZHOksaGWNF1OMTy7sFm+VY+nTYp8HIAF+lz3wG1/n2MpZbpYiTznuUyKm9WtD+FyHRPwHF
x-ms-exchange-antispam-messagedata: OOAe2gUVUnKYJbnLcGImSCH4xBk1lYxVLa2OVtd8Ml29vK1HPmOBN3S3y2lNcd7RFtlugmjh21vsYhGLhFBj0eXQ64OKnyyk2Aw9i5XncZxh0K21Nut9x97wEHYOapBxit107aaU4FPaYkzFFP93jg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6SPR00MB2501
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Hadar.Gat@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966005)(478600001)(2906002)(82740400003)(86362001)(52536014)(316002)(47076004)(33656002)(5660300002)(336012)(450100002)(81166007)(54906003)(110136005)(26005)(356005)(70586007)(9686003)(70206006)(7696005)(81156014)(55016002)(8676002)(6506007)(8936002)(4326008)(186003);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: c8f659b2-f591-45ef-3230-08d7e53f2ded
X-Forefront-PRVS: 03793408BA
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q9LGnncw7JcPk21y9r7IsrGFQqnGK7ojhasyZYkYf2+4r87+/GQ4PbMrs2t6JizDJusrANDAqCRwLm7v4kD+JuCFh6ezUNdJnItzUr5HVFb2aEMcEN7bCZOE++lm85icBvJgutA8x7isLEtsUc1P20OGTjoJg9yvifkIAIqXZVlZvUZcbC7brtcSKoz4zWyRRc8gbfXLdwu39m7T/LXQ20yM2+LFVZgM31T9AQUYxwc3cjyMP+ZITiJRY2EXNRviRCJ4AgNrgzHykbsBD9fyt/AB0eusHNJ2BrIx90tJQ+NsWgWSMk5+2wmKEIlDyUIFjAbUwlsUGJOB7qM7VAWCYZ8chHPhTox9vujXNtYTygYmpl3/MafCBG8jb1r+8oR9ffVvcoowqdQWkTdNoiPGKZjMNkkx93WqYDFOa3Sq/H9oRBG1J23MjyO5kIUwxOwgQXItc+2ca4QOYhr4T0y2lxkQKBi2HYHcJhOBK72DKl4K+9m8AfA7ftyNY4QVpwqs3KzPmK5ZF7uDuW7f3A3BdQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2020 15:26:27.4178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e328f341-cb90-43ab-d8fc-08d7e53f319e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3465
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE11cnBoeSBaaG91IDxqZW5j
Y2Uua2VybmVsQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCAyMCBBcHJpbCAyMDIwIDEyOjEz
DQo+IA0KPiBJbiBsaW51eC1uZXh0IHRyZWUsIHRoaXMgaXMgY2F1c2luZyBidWlsZCBlcnJvcjoN
Cj4gDQo+IGRyaXZlcnMvY2hhci9od19yYW5kb20vY2N0cm5nLmM6IEluIGZ1bmN0aW9uIOKAmGNj
X3RybmdfY29tcHdvcmtfaGFuZGxlcuKAmToNCj4gZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9jY3Ry
bmcuYzozMzQ6NDk6IGVycm9yOiDigJhmaXBzX2VuYWJsZWTigJkgdW5kZWNsYXJlZA0KPiAoZmly
c3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYbnhfZW5hYmxlZOKAmT8N
Cj4gICBpZiAoQ0NfUkVHX0ZMRF9HRVQoUk5HX0lTUiwgQ1JOR1RfRVJSLCBpc3IpICYmIGZpcHNf
ZW5hYmxlZCkgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBueF9lbmFibGVkDQo+IGRyaXZlcnMvY2hhci9od19yYW5kb20vY2N0cm5n
LmM6MzM0OjQ5OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcw0KPiByZXBvcnRl
ZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbg0KPiBkcml2ZXJzL2No
YXIvaHdfcmFuZG9tL2NjdHJuZy5jOjMzNTozOiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24g
b2YNCj4gZnVuY3Rpb24g4oCYZmlwc19mYWlsX25vdGlmeeKAmTsgZGlkIHlvdSBtZWFuIOKAmHN5
c2ZzX25vdGlmeeKAmT8NCj4gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25d
DQo+ICAgIGZpcHNfZmFpbF9ub3RpZnkoKTsNCj4gICAgXn5+fn5+fn5+fn5+fn5+fg0KPiAgICBz
eXNmc19ub3RpZnkNCj4gY2MxOiBzb21lIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3Jz
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNdXJwaHkgWmhvdSA8amVuY2NlLmtlcm5lbEBnbWFpbC5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9jY3RybmcuYyB8IDEgKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9jaGFyL2h3X3JhbmRvbS9jY3RybmcuYw0KPiBiL2RyaXZlcnMvY2hhci9od19yYW5kb20vY2N0
cm5nLmMgaW5kZXggYmRjZDU2MjQzMTA0Li5lODI3MTZjMTJjM2ENCj4gMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvY2hhci9od19yYW5kb20vY2N0cm5nLmMNCj4gKysrIGIvZHJpdmVycy9jaGFyL2h3
X3JhbmRvbS9jY3RybmcuYw0KPiBAQCAtMTUsNiArMTUsNyBAQA0KPiAgI2luY2x1ZGUgPGxpbnV4
L2NvbXBsZXRpb24uaD4NCj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPg0KPiAgI2luY2x1ZGUgPGxp
bnV4L2JpdGZpZWxkLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvZmlwcy5oPg0KPiANCj4gICNpbmNs
dWRlICJjY3RybmcuaCINCj4gDQo+IC0tDQo+IDIuMTguMQ0KDQpUaGFua3MgTXVycGh5IGZvciBy
ZXBvcnRpbmcuDQpUaGlzIGNvbXBpbGF0aW9uIGlzc3VlIHdhcyBmaXhlZCBmZXcgZGF5cyBhZ28g
YW5kIGFscmVhZHkgYXBwbGllZC4NCkJSLA0KSGFkYXINCg==
