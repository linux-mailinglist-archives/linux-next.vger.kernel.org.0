Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB0E127291
	for <lists+linux-next@lfdr.de>; Fri, 20 Dec 2019 01:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726986AbfLTAwi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 19:52:38 -0500
Received: from mail-mw2nam12on2071.outbound.protection.outlook.com ([40.107.244.71]:6107
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726952AbfLTAwi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Dec 2019 19:52:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3RAA6rJH93YQjz5sK9OYnm+fz7xPd5ZrN5E2imtXzBT9paKSkr3HdMgWMRWfifNBQ+gvfgT34N4GCO6ENNtJjw9aliNxMHuylmm5Tq2UJrfSHHOnDZQuIAxvGR71pSaRK0aaeqZa+yH/O0aszJMM55qpv3nQSwG3eoXiugZXL/Ec2FsGizZbl+wFL0QyiCKqmwXnO7dYCgAL/pNtA9fwIIklmyL26idFthg/ffJ1MIbRJNj/TY+zpQDVMQ4VNkKKn4VqpXqdnH2rSYDtR0BJ1Rp0RwdYuDEYxNUr+ClrLfyTtHNcDoqRZQc2TnPzk2KAV9L5RkDbI79KYjwSTJ09w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5PZYdo8XBquULSzWmV+VywqtlPEXF9y4o31GuZB5SI=;
 b=FkRXqguwsJQ/JbP8AQhyzZOayNCFynRlWWI647ZRILWFrDbrBsM7uE2b+qVkKl0nWgBtRzHPiLGSiOGMe2+M0gPlnJnmqM6EoxYVSr0fl8JCVKWxHXPZJ7GRxO//aZy7k6KPPVCmCUpIahxJcdI4gerDHvJmAC1vdVW164xXGy45g7HH3/wwF00uB8qb0SLAMOrDxYpZf1Mv1XjBwbZ2u+G+zgrt1TTb4e9elfrgtuMBE891gYL7tVYizXY8mlM5oQeKzMyqdcY9OHb+rNEMTexdMmDHPOnEagJYlDEJrm+qPi8dveSCfVRbjEnZM7a30/9MMiDESmy0tJm7GlJhqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X5PZYdo8XBquULSzWmV+VywqtlPEXF9y4o31GuZB5SI=;
 b=rNLyeV0fY0VIOB3mWaN8fc/eX5zrpxVGfffkBOEVR4LbRXZmrUF6yA113c6x5OJqAA85KB958k275h+J2W5N7utVMEIpQJ41ibu4RGsA+/UCrcUEh7yX/sPWaT+5p2Ttdk0JVioYGct35Xzyi2s4VwhU8+us8Rcp+R/6DjuMXOk=
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB3509.namprd12.prod.outlook.com (20.179.94.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.16; Fri, 20 Dec 2019 00:52:35 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::bccf:40ec:3b93:4269]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::bccf:40ec:3b93:4269%6]) with mapi id 15.20.2538.019; Fri, 20 Dec 2019
 00:52:34 +0000
From:   "Chen, Guchun" <Guchun.Chen@amd.com>
To:     Alex Deucher <alexdeucher@gmail.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: linux-next: Fixes tag needs some work in the amdgpu tree
Thread-Topic: linux-next: Fixes tag needs some work in the amdgpu tree
Thread-Index: AQHVtenBDREYp5T5WEStp+oONEi+uKfAqYHQgAA5RACAAVCkMA==
Date:   Fri, 20 Dec 2019 00:52:34 +0000
Message-ID: <BYAPR12MB2806BBCC7DCC63F2AC83297EF12D0@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20191219082557.16092126@canb.auug.org.au>
 <BYAPR12MB2806A8EBBB8B6F9AE29FBC00F1520@BYAPR12MB2806.namprd12.prod.outlook.com>
 <CADnq5_PTLEXHd3U8fkKVcckFjCDN_p3n9PoQWwLkzRODqDd71A@mail.gmail.com>
In-Reply-To: <CADnq5_PTLEXHd3U8fkKVcckFjCDN_p3n9PoQWwLkzRODqDd71A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 714330b4-984d-47a0-4a8a-08d784e6e6e2
x-ms-traffictypediagnostic: BYAPR12MB3509:
x-microsoft-antispam-prvs: <BYAPR12MB35091D585B64F8EB5E7BB767F12D0@BYAPR12MB3509.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 025796F161
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(53754006)(13464003)(199004)(189003)(186003)(6916009)(54906003)(9686003)(316002)(71200400001)(6506007)(81166006)(52536014)(81156014)(7696005)(53546011)(478600001)(4326008)(76116006)(66446008)(64756008)(8936002)(66556008)(66476007)(33656002)(26005)(2906002)(55016002)(8676002)(86362001)(66946007)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB3509;H:BYAPR12MB2806.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r9Vm47ZsSRRVn4YL9RDmiv8Y0h9r0WQQm2GyecHDCxjSb3JQBQOedLloIzIHDYCBozRrJSxMo0i80g2xDpUY7E2I4IXWdJyvrhTA1Py5atM+5X1aR0HxP95UR+qhYFxDXnYPxf8mUsJ16uPrq4b/jcQThBA8uDBtXXydaF3pm29+MVhs7sgLU6AKlqHIrvm8zsOqw0rjdLDDZvISTAe1yavl0yDe7PLrMvSXSkv3xywWZ8ECqQkdYhTBwRIOCOlvYX334JqQOrBL0sqKB8TupKgagSGgEqQIUq8azCtCYeLCVUfwrygIRUMOfeQcZzk2XJt6rO0E+Rrqpk0KvmTHdzpePLa4//GcQH2dGSUm3XhDHI7Dqdbiu5aTMeV2u/iaYz6mrzQWq8JqoHP/w8NhCC4MEYrVY3NLRDwB1eFZnrqQhoc8wiP6MBVzU7cvsPrHWLgO6yOKgakvJ4xTcV6gft5qcTriWcZB4gtmkEBABuH7r7KIOlujzbCgEOuW+hYWNWCLhJLAeDOaq2hG/UMYSw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 714330b4-984d-47a0-4a8a-08d784e6e6e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2019 00:52:34.6509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: snpZnpq9UpXMAI5DdmyfdxvGULBYe9dBBldCnBWOudrevLNDT+kc9yvtR8qqg4nhtBv/YuQNvlwMNKYb02I6PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3509
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

VGhhbmtzIEFsZXggYW5kIFN0ZXBoZW4uDQpJIHdpbGwgYmUgYXdhcmUgb2YgdGhpcyBuZXh0IHRp
bWUuIFNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZSBhZ2Fpbi4NCg0KUmVnYXJkcywNCkd1Y2h1
bg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQWxleCBEZXVjaGVyIDxhbGV4
ZGV1Y2hlckBnbWFpbC5jb20+IA0KU2VudDogVGh1cnNkYXksIERlY2VtYmVyIDE5LCAyMDE5IDEy
OjQ3IFBNDQpUbzogQ2hlbiwgR3VjaHVuIDxHdWNodW4uQ2hlbkBhbWQuY29tPg0KQ2M6IFN0ZXBo
ZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PjsgTGludXggTmV4dCBNYWlsaW5nIExp
c3QgPGxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnPjsgTGludXggS2VybmVsIE1haWxpbmcgTGlz
dCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4NClN1YmplY3Q6IFJlOiBsaW51eC1uZXh0
OiBGaXhlcyB0YWcgbmVlZHMgc29tZSB3b3JrIGluIHRoZSBhbWRncHUgdHJlZQ0KDQpPbiBXZWQs
IERlYyAxOCwgMjAxOSBhdCA4OjIyIFBNIENoZW4sIEd1Y2h1biA8R3VjaHVuLkNoZW5AYW1kLmNv
bT4gd3JvdGU6DQo+DQo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkgLSBJbnRlcm5hbCBEaXN0cmli
dXRpb24gT25seV0NCj4NCj4gSGkgU3RlcGhlbiwNCj4NCj4gU29ycnkgZm9yIHRoZSBpbmNvbnZl
bmllbmNlLiBIb3cgSSBjYW4gZml4IHRoaXM/DQo+DQoNCkFscmVhZHkgZml4ZWQuDQoNCkFsZXgN
Cg0KPiBSZWdhcmRzLA0KPiBHdWNodW4NCj4NCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+DQo+IFNlbnQ6
IFRodXJzZGF5LCBEZWNlbWJlciAxOSwgMjAxOSA1OjI2IEFNDQo+IFRvOiBBbGV4IERldWNoZXIg
PGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4NCj4gQ2M6IExpbnV4IE5leHQgTWFpbGluZyBMaXN0IDxs
aW51eC1uZXh0QHZnZXIua2VybmVsLm9yZz47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3QgPGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBDaGVuLCBHdWNodW4gPEd1Y2h1bi5DaGVuQGFt
ZC5jb20+DQo+IFN1YmplY3Q6IGxpbnV4LW5leHQ6IEZpeGVzIHRhZyBuZWVkcyBzb21lIHdvcmsg
aW4gdGhlIGFtZGdwdSB0cmVlDQo+DQo+IEhpIGFsbCwNCj4NCj4gSW4gY29tbWl0DQo+DQo+ICAg
Y2FhMDE2NTkwMjhhICgiZHJtL2FtZGdwdTogbW92ZSB1bWMgb2Zmc2V0IHRvIG9uZSBuZXcgaGVh
ZGVyIGZpbGUgZm9yIEFyY3R1cnVzIikNCj4NCj4gRml4ZXMgdGFnDQo+DQo+ICAgRml4ZXM6IDk2
ODY1NjNjNGM0MiBkcm0vYW1kZ3B1OiBBZGRlZCBSQVMgVU1DIGVycm9yIHF1ZXJ5IHN1cHBvcnQg
Zm9yIEFyY3R1cnVzDQo+DQo+IGhhcyB0aGVzZSBwcm9ibGVtKHMpOg0KPg0KPiAgIC0gVGFyZ2V0
IFNIQTEgZG9lcyBub3QgZXhpc3QNCj4NCj4gRGlkIHlvdSBtZWFuDQo+DQo+IEZpeGVzOiA0Y2Y3
ODFjMjRjM2IgKCJkcm0vYW1kZ3B1OiBBZGRlZCBSQVMgVU1DIGVycm9yIHF1ZXJ5IHN1cHBvcnQg
Zm9yIEFyY3R1cnVzIikNCj4NCj4gQWxzbywgcGxlYXNlIGtlZXAgYWxsIHRoZSB0YWdzIHRvZ2V0
aGVyIGF0IHRoZSBlbmQgb2YgdGhlIGNvbW1pdCBtZXNzYWdlLg0KPg0KPiAtLQ0KPiBDaGVlcnMs
DQo+IFN0ZXBoZW4gUm90aHdlbGwNCg==
