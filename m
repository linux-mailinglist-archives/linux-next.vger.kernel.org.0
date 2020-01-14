Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBA113A39E
	for <lists+linux-next@lfdr.de>; Tue, 14 Jan 2020 10:18:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728926AbgANJSM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 14 Jan 2020 04:18:12 -0500
Received: from mx0b-0014ca01.pphosted.com ([208.86.201.193]:61680 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725820AbgANJSM (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Jan 2020 04:18:12 -0500
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
        by mx0b-0014ca01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00E9FbTO022578;
        Tue, 14 Jan 2020 01:18:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=5ETMuLUoI4E1q8oaU3MBE+EHgjyAiScJviXawI6jlBM=;
 b=jphHl9lO0E3iD4rZqlikPcGW+NVHx3LDwYXRWaQ2nABAcEFOjw57hrr+/9UhPB5HWBvf
 1itAjpMh9XC+nltD8spq4vQIC8kfclPuOeV7n7mKDfUGfd9l5tOJ7Qk4Qpsckhj/EZHo
 SEKkh05wL27kuyMn7QlozeEadnXtfmrvXPEWvk0KddlfqZ3WZl/6RSTGTPdRlhNWqUqW
 HINWzSSo9ZfdAOl6lPL5Q9CW23KNYo/GrsE4OzJFY6Lb2Xdj8asdyGwCtCoywYQ4QgMA
 T1RI+/bMyrYEInKBzjsCFeU1Hkt+xQeBo940NORzzmXyaNlOSFoVtV6WN2ceUvpfWcF/ OQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
        by mx0b-0014ca01.pphosted.com with ESMTP id 2xfau2gtfn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 14 Jan 2020 01:18:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4gSBX+aoskhp+zZHjKorb01me8KmMQ1iFTZUPJcOm9ZOmKabpwxqVsd4MeWMjR1fFLI79u/CJ+Xz+id76av8vMSVeDQJYdQFBCOGmOMwisnLZru/HAhT7Eg5lVZO5THZeao2DRSwg3mERETYLTZNhRsEbscU5jWTPaqB6oUyCuYoUwIPAkKqdRvJN1Ql1W5jSd/ZCjGydsWChvuv1msDPiHRMJ7BHDNXZe+hQUps8mIJ0ahPebuwEVeYCmbyHG2uvtBdZhz0BHAXLX5wXLauLmE88kUjOmxnubX9+L6I8VSXd7QvyBRuPkg3yUHZvhKrbSydWRgp8EencNcKz+lJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ETMuLUoI4E1q8oaU3MBE+EHgjyAiScJviXawI6jlBM=;
 b=KmtAgeXVaI6rEIrhsZ16GkNCLESnL1L+42qBAzpGg7OLIiHqX6UrsQMTYcsVrSrlcWjMA6LM8O7fKLiVMP5x4wI8ue7XLzzwWvtGR3CBHwOielqttuDSjMhalmVdTyW0Y5PoZZ7olZOS9AJQ004Dm3EAyWwXyKab8mVfZoTt5TaQHqQCgHyG7KcpIvrERt+PjqjuC3luH/FeELPemvVJIpZ7NKJ3whdjl9W8u1rK/KMxEueWBnBAkOem4k59IGn/2wM94WL7ZQXw1vZfSJYMnDctBum/fCxr7YSq11jGHvLQI7zKMk8SaxKlckEK2Fj05p8edTBAuMnVROkiuRlkww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ETMuLUoI4E1q8oaU3MBE+EHgjyAiScJviXawI6jlBM=;
 b=eEZLCitAHOKEO8rmxAIPHSf3stjFYQAAYfVcXig5Vbiu/jxciPtPdZ3WjhH7+1Vsw6XshI6pCxPTTulJYyYX/h1U7ezj3Ru4RlIXNasbJg+qeDNirfns7vR6JKQrU0j6+8MLT0rJZ4C+6P7BE0T1a6WATzT/4cQvkRniG+ZZS/0=
Received: from BYAPR07MB4709.namprd07.prod.outlook.com (52.135.204.159) by
 BYAPR07MB5590.namprd07.prod.outlook.com (20.177.231.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.13; Tue, 14 Jan 2020 09:17:58 +0000
Received: from BYAPR07MB4709.namprd07.prod.outlook.com
 ([fe80::d01d:9089:7310:db3a]) by BYAPR07MB4709.namprd07.prod.outlook.com
 ([fe80::d01d:9089:7310:db3a%6]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 09:17:58 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Felipe Balbi <balbi@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jayshri Dajiram Pawar <jpawar@cadence.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rahul Kumar <kurahul@cadence.com>
Subject: RE: linux-next: manual merge of the usb-gadget tree with Linus' tree
Thread-Topic: linux-next: manual merge of the usb-gadget tree with Linus' tree
Thread-Index: AQHVx27w6M0YTlJq4UO7zJ+7SWkmnqfp3heAgAACbCA=
Date:   Tue, 14 Jan 2020 09:17:57 +0000
Message-ID: <BYAPR07MB4709EC6AE89CFADC3E9B13FCDD340@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <20200110153207.70c888cd@canb.auug.org.au>
 <CAMuHMdVY2W1=9paE+WpJUHprocOdutRMcNUJenn+jz9A-iv90A@mail.gmail.com>
In-Reply-To: <CAMuHMdVY2W1=9paE+WpJUHprocOdutRMcNUJenn+jz9A-iv90A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctYmYwOGNiZTUtMzZhZS0xMWVhLTg3NTItMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XGJmMDhjYmU2LTM2YWUtMTFlYS04NzUyLTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iMjMyOCIgdD0iMTMyMjM0NjcwNzU1ODQ0NDY0IiBoPSJTN3ZPSCtTL2s0cHNuM0VSaHBrRk1VWW1PbjQ9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da501d9f-478e-4070-f993-08d798d2a55c
x-ms-traffictypediagnostic: BYAPR07MB5590:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR07MB5590068F5E821A664F1F6C4FDD340@BYAPR07MB5590.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(189003)(36092001)(199004)(186003)(316002)(86362001)(478600001)(81166006)(8676002)(33656002)(71200400001)(7696005)(66946007)(5660300002)(26005)(66446008)(6506007)(76116006)(66476007)(66556008)(64756008)(4326008)(8936002)(9686003)(55016002)(52536014)(107886003)(81156014)(54906003)(2906002)(110136005);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR07MB5590;H:BYAPR07MB4709.namprd07.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cadence.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pfRVBLyCykj2LxqAibeE4M2dXxn95GNP5WUt8xaZnx+HwLpxwEnHJxFXBHN4irTdt+rRwoHMvVCmud0rQ8W7zryQlgR+FQs9xkU6jzitz2fiOtgptn/ecmdkzC0E7rvrlXqC0VyUJJWBo7AdVDfemDcoJjRBd9nEvsnzcqb1bsZ/CZl1TV/okqC4gIB8rZ+nAvWwMnLIsRB42rM5oQLfLJaZDcXTWDWARl6kAsaIaDHM3G0BIpkW3f4VmMXkttciXE8ZgMVnMkosNdiADRx0kRHC8lItbFBM1HHopY3b2LV4hJAcbYa7ZuIFChXywdi8Tz+HoPYbQ6gC1BThP3oG5R9Hrj+DUt5EHIgrYvsXWmI8abYfsMHmbtJw1Jo84J65lwaHgen8VYp3XiE1ThVlce9DDFtJU09j9VkzmCoiyXb1Dm2DSk0140gP+z6bpkVbNc8ZlWtwFF3dVdsIeRinlFtkWqR0c4evTsB46EQprwk60T1uWpph/i3GZ2StinCEnFUM6QOf0KRlVWqGBBLr2Quzk3atiCti6rL6q6HpZ84=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da501d9f-478e-4070-f993-08d798d2a55c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 09:17:58.0432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v7I7Po5xzDo8+TbiJ9/znURRdNgOTLPRwHYMxql28Wf3dgjTBgOtj5WTOa+g0PDl6eetrE7l7W/TzlvkfXEZu3CZv1emoQMxX00sL4LISsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR07MB5590
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-14_02:2020-01-13,2020-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001140082
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGksDQoNCkl0J3MgbG9va3MgbGlrZSB0aGUgc2FtZSBpc3N1ZSByZXBvcnRlZCBieSBTdGVwaGVu
IFJvdGh3ZWxsIHNvbWUgZGF5cyBhZ28uIA0KDQpBcyBJIGtub3csIHRoZSBmaXJzdCB2ZXJzaW9u
IG9mIHBhdGNoICJ1c2I6IGNkbnMzOiBBZGQgc3RyZWFtcyBzdXBwb3J0IHRvIGNhZGVuY2UgVVNC
MyBEUkQgZHJpdmVyIiANCndhcyBnZW5lcmF0ZWQgYnkgSmF5c2hyaSBiYXNlZCBvbiBGZWxpcGUg
cmVwb3NpdG9yeQ0KKGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2JhbGJpL3VzYi5naXQvbG9nLz9oPW5leHQgLSBicmFuY2ggbmV4dCkuIA0KDQpJIGRvbid0
IGtub3cgd2h5LCBidXQgdGhlcmUgaXMgYSBsYWNrIG9mICAidXNiOiBjZG5zMzogRml4IGRlcXVl
dWUgaW1wbGVtZW50YXRpb24uIi4gIA0KSXQncyBsb29rcyBsaWtlIGZyb20gc29tZSByZWFzb25z
IEZlbGlwZSBtaXNzZWQgdGhpcyBwYXRjaCBpbiBoaXMgbmV4dCByZXBvLg0KDQpUaGUgbGF0ZXN0
IHZlcnNpb24gIltQQVRDSCB2Ml0gdXNiOiBjZG5zMzogQWRkIHN0cmVhbXMgc3VwcG9ydCB0byBj
YWRlbmNlIFVTQjMgRFJEIGRyaXZlciIgDQpoYXMgYmVlbiBjcmVhdGVkIGJhc2VkIG9uIHRvcCBv
ZiBsaW51eC1uZXh0LmdpdCBtYXN0ZXIgYnJhbmNoLiANCg0KSW4gbXkgb3BpbmlvbiBGZWxpcGUg
aGFzIHRvIHJldmVydCB0aGUgNGYxZmE2M2E2ZGMyICgidXNiOiBjZG5zMzogQWRkIHN0cmVhbXMg
c3VwcG9ydCB0byBjYWRlbmNlIFVTQjMgRFJEIGRyaXZlciIpDQpjb21taXQgdGhlbiBzaG91bGQg
YXBwbHkgZjYxNmMzYmRhNDdlICgidXNiOiBjZG5zMzogRml4IGRlcXVldWUgaW1wbGVtZW50YXRp
b24uIikgYW5kIGFnYWluIGFwcGx5IA0KIG5ldyB2ZXJzaW9uIG9mICJ1c2I6IGNkbnMzOiBBZGQg
c3RyZWFtcyBzdXBwb3J0IHRvIGNhZGVuY2UgVVNCMyBEUkQgZHJpdmVyIiBwYXRjaCAuIA0KDQpS
ZWdhcmRzLA0KUGF3ZWxsDQoNCj4NCj5IaSBTdGVwaGVuLA0KPg0KPk9uIEZyaSwgSmFuIDEwLCAy
MDIwIGF0IDU6MzMgQU0gU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+IHdy
b3RlOg0KPj4gVG9kYXkncyBsaW51eC1uZXh0IG1lcmdlIG9mIHRoZSB1c2ItZ2FkZ2V0IHRyZWUg
Z290IGEgY29uZmxpY3QgaW46DQo+Pg0KPj4gICBkcml2ZXJzL3VzYi9jZG5zMy9nYWRnZXQuYw0K
Pj4NCj4+IGJldHdlZW4gY29tbWl0Og0KPj4NCj4+ICAgZjYxNmMzYmRhNDdlICgidXNiOiBjZG5z
MzogRml4IGRlcXVldWUgaW1wbGVtZW50YXRpb24uIikNCj4+DQo+PiBmcm9tIExpbnVzJyB0cmVl
IGFuZCBjb21taXQ6DQo+Pg0KPj4gICA0ZjFmYTYzYTZkYzIgKCJ1c2I6IGNkbnMzOiBBZGQgc3Ry
ZWFtcyBzdXBwb3J0IHRvIGNhZGVuY2UgVVNCMyBEUkQgZHJpdmVyIikNCj4+DQo+PiBmcm9tIHRo
ZSB1c2ItZ2FkZ2V0IHRyZWUuDQo+Pg0KPj4gSSBoYXZlIG5vIGlkZWEgaG93IHRvIGhhbmRsZSB0
aGlzLCBzbyBJIGp1c3QgZHJvcHBlZCB0aGUgdXNiLWdhZGdldCB0cmVlDQo+PiBmb3IgdG9kYXkg
LSBpdCBjbGVhcmx5IG5lZWRzIHRvIGJlIHJlYmFzZWQgb24gTGludXMnIHRyZWUgYW55d2F5IChp
dA0KPj4gaGFzIGEgZmV3IHNoYXJlZCBwYXRjaGVzIHRoYXQgYXJlIGRpZmZlcmVudCBjb21taXRz
IGFuZCB0aGVyZSBhcmUNCj4+IGZ1cnRoZXIgY2hhbmdlcyB0byB0aGlzIGZpbGUgaW4gTGludXMn
IHRyZWUgYXMgd2VsbC4gIHJlYmFzaW5nIG9udG8NCj4+IChvciBtZXJnaW5nIHdpdGgpIHY1LjUt
cmM2IG1heSBiZSB1c2VmdWwuDQo+DQo+Rm9yIHRvZGF5J3MgcmVuZXNhcy1kcml2ZXJzLCBJJ20g
dXNpbmcgdGhlIGF0dGFjaGVkIGNvbmZsaWN0IHJlc29sdXRpb24uDQo+DQo+R3J7b2V0amUsZWV0
aW5nfXMsDQo+DQo+ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4NCj4tLQ0KPkdlZXJ0
IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2Vl
cnRAbGludXgtbTY4ay5vcmcNCj4NCj5JbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+d2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMNCg==
