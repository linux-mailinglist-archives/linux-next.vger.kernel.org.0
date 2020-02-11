Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2E661587FA
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 02:33:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727618AbgBKBdl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 20:33:41 -0500
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:45094 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727599AbgBKBdl (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Feb 2020 20:33:41 -0500
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01B1XWuP030326;
        Mon, 10 Feb 2020 17:33:33 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=Vn8I0wevTwSS9Vr/cGHyGQdvmNTLRnNPXBtZEOrkZTg=;
 b=OEXYnf98AcYtI+SEZNsFqLoMwBrU0ylf2N2j5OJDTOOj3AFUI/Sbj8mFZq+C6TeB6BB9
 RNxdVSdWJngqP9C/oAn7ypcGfAxz7LhU9VOoATYAoSRdW3Kstlr2cqnZ+0c1Now2XIqq
 6BiBWPVvr20gYefC8YroSRqibwDiC3dV9j8= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 2y3htn86xh-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 10 Feb 2020 17:33:32 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 10 Feb 2020 17:33:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJe065ESDm/CJbiYKQDURHm8lP7wQvVw/Chc+VQRc8CuSkTQIiHiDin4z6dfQho3WBNyiZpaTAarpodhArwn1m7TqQiHNhc63ySipgxswmdvHSzgjreHR+vNCUF9Q8M6jYKe8AziPEqEsZBvQradBV7+PEZPzA8vcwmB2MlPl+3C++zL5vzFevxkRL2BT1fOQrZ9vr9I83wyo88Y3OB0K/tL08Ptp5GFVSeKB0SdjVS1oY9o09oUjaSs2xdFqcTKwCRdO9KTL7c04pL3E4VgyK/nzOR0HwlN751nKNzujRa9oXyjId2O9TFBYVf1zD4HlNCeK8uien0mBqjkIpPT1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn8I0wevTwSS9Vr/cGHyGQdvmNTLRnNPXBtZEOrkZTg=;
 b=is1gRGO2hPbYXTH7PCxRvvyuuhNf6EgxraYU7PStlAnmea8v7A/U8HmTW+aIFCy4eG+wU6lX2nI9yx0mXAgQ8Puzm7hek8HoU5Nf1XYHNB/h5BItRTLSqW2Tb24S6Zux9vFXR/0wVHZurep2ZowUlSIG6xppiWc1iKd3312AUVt5ykZe1/sXuv0WLe/QY5+6H2vt+KfiTH7pBBJx31DetIiB5zFzoCcRkO4mu3DFxYZpgXYncdLxKs+gb6qf4vbAzuDQGZv5z1ZC5ypD/aHf9/MYdgwIPFKMLQCSGcVqdPr9U4bcm84N0WpHF4XNranl2XNDVJwd4z9TDoK8tvkflg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn8I0wevTwSS9Vr/cGHyGQdvmNTLRnNPXBtZEOrkZTg=;
 b=GRjrFqZjnFuTjBqIHkIzvLWo89t9fhENlb9j40r/yf/jXZCzvULxtWVUeXYBhFVaZrsc1zMwLMSBnLTR1s9rjXn6sO8MeBscBugJ8lIbUykcNOAEKCf+hkR/MQQzRcevC7noauHeBLRFHLCFDxnlRr3a6s2ZlqJsB1EcmFpuAUk=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1885.namprd15.prod.outlook.com (10.174.254.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Tue, 11 Feb 2020 01:33:07 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::c863:5ef9:530d:efd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::c863:5ef9:530d:efd2%11]) with mapi id 15.20.2707.028; Tue, 11 Feb
 2020 01:33:07 +0000
From:   Vijay Khemka <vijaykhemka@fb.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Joel Stanley <joel@jms.id.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Eddie James <eajames@linux.ibm.com>
Subject: Re: linux-next: build failure after merge of the aspeed tree
Thread-Topic: linux-next: build failure after merge of the aspeed tree
Thread-Index: AQHV4Fto3qGKenSQ/0+jrIkDB8Ejv6gUr5cA
Date:   Tue, 11 Feb 2020 01:33:07 +0000
Message-ID: <7554ACAF-928B-4832-AF00-D48186A57C52@fb.com>
References: <20200211084449.05e3b3cb@canb.auug.org.au>
In-Reply-To: <20200211084449.05e3b3cb@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::9581]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4601a693-ece8-48da-690e-08d7ae9258df
x-ms-traffictypediagnostic: MWHPR15MB1885:
x-microsoft-antispam-prvs: <MWHPR15MB1885E702AC9CD4F65DA2FDE1DD180@MWHPR15MB1885.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:962;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(39860400002)(396003)(189003)(199004)(6512007)(71200400001)(186003)(86362001)(36756003)(6506007)(5660300002)(2616005)(76116006)(66476007)(33656002)(4326008)(2906002)(66946007)(66556008)(64756008)(66446008)(8936002)(8676002)(110136005)(81166006)(54906003)(81156014)(316002)(6486002)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR15MB1885;H:MWHPR15MB1597.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8LAKHzUlrOAbK0EM/DvDbHst2OKNM/S+eGEZ5I2oSPDp0jSwz7ifKoGLuo1tXR1FVZAkXItUPEJ+2UCBqEY8ihXRgM6WXksVLWWCeFf9LFv4YL/CxEjeOEJ2rGKoj6yH+DkJtv+ddIH3x3RCaY9JsXHj6JZ6LJfum+0nPRjxxY+jETz/TrspuYPRxaAfw8TRedGI+BnCNOglpOeABcamZuN28kxq/09zSC+YMvvoh5yAu0nv0r69snQ65By68cLuP9QYIGNuKl36FuKqeJJ7tco8RNZZUqZLS6Mh1/o3a9+gsFN0g4+kWmED0qlAYvyLyGRdhcyAFyFvI9+0vviqo9Y/dTEdar2/PCG/yAo+mJVdtwI3DeAbXrO3a3CHmDzX3oL+GmokTY86FpisdSuqlYswqCoJbhLAZ+kolvrRDmi2gj58RaIjKawSyxUWi8H8
x-ms-exchange-antispam-messagedata: vaIB7avOPapueFpHDyiU0Jyfk2T9KLnkCTUzOMuW9B+aNYyoudsitIi5V+R4YNtxuucU3pxBWuhf32psuChaRc4BqHJbC5N/GYrxB+eRslhHYQKrvKM0W8td44GtPkso9QsLC6aRQAqJMt4m2Q+3m2e2L4D4o6BJABm7BkMChEk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <615AFCDBE3E26A4EB0E2769007A728F2@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4601a693-ece8-48da-690e-08d7ae9258df
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 01:33:07.4469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51BTYnQTWZZB2aa2WaYXpcHp6pjCg8eSK/beVGV0oCt5UHhX7nTRKCHndSGYnmnmRXDFp9iCrF4DJuyHX6QOPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1885
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-10_08:2020-02-10,2020-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110007
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

DQoNCu+7v09uIDIvMTAvMjAsIDE6NDUgUE0sICJTdGVwaGVuIFJvdGh3ZWxsIiA8c2ZyQGNhbmIu
YXV1Zy5vcmcuYXU+IHdyb3RlOg0KDQogICAgSGkgYWxsLA0KICAgIA0KICAgIEFmdGVyIG1lcmdp
bmcgdGhlIGFzcGVlZCB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKGFybQ0KICAgIG11
bHRpX3Y3X2RlZmNvbmZpZykgZmFpbGVkIGxpa2UgdGhpczoNCiAgICANCiAgICBhcmNoL2FybS9i
b290L2R0cy9hc3BlZWQtZzYuZHRzaTozMjIuMzUtMzI3Ljc6IEVSUk9SIChkdXBsaWNhdGVfbm9k
ZV9uYW1lcyk6IC9haGIvYXBiL3N5c2NvbkAxZTZlMjAwMC9pbnRlcnJ1cHQtY29udHJvbGxlcjog
RHVwbGljYXRlIG5vZGUgbmFtZQ0KICAgIEVSUk9SOiBJbnB1dCB0cmVlIGhhcyBlcnJvcnMsIGFi
b3J0aW5nICh1c2UgLWYgdG8gZm9yY2Ugb3V0cHV0KQ0KICAgIA0KICAgIENhdXNlZCBieSBjb21t
aXQNCiAgICANCiAgICAgIDA5MWZmNTIwNmVmMyAoIkFSTTogZHRzOiBhc3BlZWQ6IGFzdDI2MDA6
IEZpeCBTQ1UgSVJRIGNvbnRyb2xsZXIgbm9kZSBhZGRyZXNzZXMiKQ0KICAgIA0KICAgIEFsc28g
dGhlc2Ugd2FybmluZ3M6DQogICAgDQogICAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1m
YWNlYm9vay10aW9nYXBhc3MuZHRzOjQzNS4xMS00MzkuNDogV2FybmluZyAoaTJjX2J1c19yZWcp
OiAvYWhiL2FwYi9idXNAMWU3OGEwMDAvaTJjLWJ1c0AxNDAvaXBtYjBAMTA6IEkyQyBidXMgdW5p
dCBhZGRyZXNzIGZvcm1hdCBlcnJvciwgZXhwZWN0ZWQgIjQwMDAwMDEwIg0KICAgIGFyY2gvYXJt
L2Jvb3QvZHRzL2FzcGVlZC1ibWMtZmFjZWJvb2stdGlvZ2FwYXNzLmR0czo0MzcuMy0zMDogV2Fy
bmluZyAoaTJjX2J1c19yZWcpOiAvYWhiL2FwYi9idXNAMWU3OGEwMDAvaTJjLWJ1c0AxNDAvaXBt
YjBAMTA6cmVnOiBJMkMgYWRkcmVzcyBtdXN0IGJlIGxlc3MgdGhhbiAxMC1iaXRzLCBnb3QgIjB4
NDAwMDAwMTAiDQogICAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWJtYy1mYWNlYm9vay10aW9n
YXBhc3MuZHRzOjUyMS4xMS01MjUuNDogV2FybmluZyAoaTJjX2J1c19yZWcpOiAvYWhiL2FwYi9i
dXNAMWU3OGEwMDAvaTJjLWJ1c0AzODAvaXBtYjBAMTA6IEkyQyBidXMgdW5pdCBhZGRyZXNzIGZv
cm1hdCBlcnJvciwgZXhwZWN0ZWQgIjQwMDAwMDEwIg0KICAgIGFyY2gvYXJtL2Jvb3QvZHRzL2Fz
cGVlZC1ibWMtZmFjZWJvb2stdGlvZ2FwYXNzLmR0czo1MjMuMy0zMDogV2FybmluZyAoaTJjX2J1
c19yZWcpOiAvYWhiL2FwYi9idXNAMWU3OGEwMDAvaTJjLWJ1c0AzODAvaXBtYjBAMTA6cmVnOiBJ
MkMgYWRkcmVzcyBtdXN0IGJlIGxlc3MgdGhhbiAxMC1iaXRzLCBnb3QgIjB4NDAwMDAwMTAiDQoN
ClRoaXMgaXMgdGhlIGZsYWcgbmVlZGVkIHRvIGJlIGRlZmluZWQgZm9yIGRlY2xhcmluZyBzbGF2
ZSBtb2RlLiBXZSBtYXkgaGF2ZSB0byBmaXggZHRjL2NoZWNrLmMuDQoNCiAgICANCiAgICBDYXVz
ZWQgYnkgY29tbWl0DQogICAgDQogICAgICBhNTliMTc5MmFkZjEgKCJBUk06IGR0czogYXNwZWVk
OiB0aW9nYXBhc3M6IEFkZCBJUE1CIGRldmljZSIpDQogICAgDQogICAgSSBoYXZlIHVzZWQgdGhl
IGFzcGVlZCB0cmVlIGZyb20gbmV4dC0yMDIwMDIxMCBmb3IgdG9kYXkuDQogICAgDQogICAgLS0g
DQogICAgQ2hlZXJzLA0KICAgIFN0ZXBoZW4gUm90aHdlbGwNCiAgICANCg0K
