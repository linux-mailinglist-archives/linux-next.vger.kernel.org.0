Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE5611586E2
	for <lists+linux-next@lfdr.de>; Tue, 11 Feb 2020 01:48:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727608AbgBKAsh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 Feb 2020 19:48:37 -0500
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:6772 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727538AbgBKAsg (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 10 Feb 2020 19:48:36 -0500
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01B0UVru017895;
        Mon, 10 Feb 2020 16:48:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=QLhrZ6L7Tt6R3+ELTUSO6hJpw8yOInDYqbUpbxvsAqI=;
 b=NFwz3lafiYhuLGUIQSL7vTihPa7kwrRBchAMkUGkWBcpJjNVefTuETknsvjZjA/Epi1G
 rCzO3hXlMProIt50mWhDI9hvdkYTCIVyiuxBVZUZVXJLpU5DfjCmhNR0NhWJRjoVntlM
 zQGt1hjmGVra4j5eMw7FLLbQxlp1zpmic0A= 
Received: from mail.thefacebook.com ([163.114.132.120])
        by mx0a-00082601.pphosted.com with ESMTP id 2y1ucuu0j0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 10 Feb 2020 16:48:25 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Mon, 10 Feb 2020 16:48:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lSQFbVEysPe8JKCRXro4QyNcnzfnNJL640M1PE1y+iL/47lWWjacz4gMQrJJcR16j4J128kHMmdB9cqOgk3sJHAYucctNsN+BWsx+27k48mJlN0/L06x1FVMno0tM2cKZ2uG74WuaaGzixU/sTR1mut8ByM9t/dtxUWdHFqzDGim/FbYqSELCALG7zMqFRsGtMDmSBI99F7Dz8JciJr+h/I2aLbPdfP7a9qzD+Cfga2JfMHQi1vEhp9h4Rzchxh/NBiaVVAMm7I9ShNdsg76CMh+7IGOLxcbvLdq/A6izuOgcXCsI9Dhi1XiOo4ULYWmkGTeHDzTanCaQCB8tNv8Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLhrZ6L7Tt6R3+ELTUSO6hJpw8yOInDYqbUpbxvsAqI=;
 b=kzOuWPJ2rMLbVU2luvLoTwk+pB1sSkwHR2gPi8gQLOldpVWB2+LDw0tcPiuQPbnUElV4W0edGuNfi32fXhP6zfa0UPRTjn06nUXiJG7hX5msq3QuOvROQEYzsbR3zB+PYiZSf9jBuy4wZAO9IZAOk1ru/ORBFRYdcWvWoj8W3Kv0+dnhZqfca65NEF/7lWFtCAC/SgxpKS9OyyP97U88vqwhB/+ES+fqk3flTdd1/UTOegtUm6narkxAnmUvbd+7p+s6ti+B3PgvXlyppGCyerB5kT/TfB75FZ9EtVLsGyxxDQnaA5ZWocFHJZEEiaATx4SX0oijMmb/AJ5JFJ9bUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QLhrZ6L7Tt6R3+ELTUSO6hJpw8yOInDYqbUpbxvsAqI=;
 b=kr6PyWqzdRHYvSleZ3bI54dmPrz/HRrhCijY8sEYTTHlknebVwr5eOxnMg5pNxPlx/HAIO3+cQ/kDRE8s5tK4vjWFMGs7vrseeTJ5xP0b2rnRD/VzO9Me7enbureK2lrTUJXuLorUCixXy1oGRdh5cR+/+45sI5Dw7wNf94Xx6M=
Received: from MWHPR15MB1597.namprd15.prod.outlook.com (10.173.234.137) by
 MWHPR15MB1229.namprd15.prod.outlook.com (10.175.7.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.26; Tue, 11 Feb 2020 00:48:22 +0000
Received: from MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::c863:5ef9:530d:efd2]) by MWHPR15MB1597.namprd15.prod.outlook.com
 ([fe80::c863:5ef9:530d:efd2%11]) with mapi id 15.20.2707.028; Tue, 11 Feb
 2020 00:48:22 +0000
From:   Vijay Khemka <vijaykhemka@fb.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Joel Stanley <joel@jms.id.au>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Eddie James <eajames@linux.ibm.com>
Subject: Re: linux-next: build failure after merge of the aspeed tree
Thread-Topic: linux-next: build failure after merge of the aspeed tree
Thread-Index: AQHV4Fto3qGKenSQ/0+jrIkDB8Ejv6gUoxgA
Date:   Tue, 11 Feb 2020 00:48:22 +0000
Message-ID: <46287780-32D0-46D3-9604-D71BA190821E@fb.com>
References: <20200211084449.05e3b3cb@canb.auug.org.au>
In-Reply-To: <20200211084449.05e3b3cb@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::9581]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9aea5b4c-a2b0-4836-70ad-08d7ae8c1892
x-ms-traffictypediagnostic: MWHPR15MB1229:
x-microsoft-antispam-prvs: <MWHPR15MB12294E2ED81A9ED7F6F7791DDD180@MWHPR15MB1229.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0310C78181
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(346002)(366004)(39860400002)(376002)(189003)(199004)(6512007)(66556008)(64756008)(66476007)(76116006)(66946007)(66446008)(6486002)(33656002)(478600001)(5660300002)(71200400001)(36756003)(2616005)(54906003)(6506007)(316002)(8676002)(81166006)(186003)(110136005)(86362001)(4326008)(2906002)(8936002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR15MB1229;H:MWHPR15MB1597.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZPmQ2nxOpnAvwCwy/X5SUNzbt+yIpLMZ7to+wsm9HfuZB2QlOg31VnIz424JCrnhl28HpCz/6/eUj5ZwM3BDEuE5Gk/RsYJomEhVEj1CVSMgrGSeHT0CabJl6h+x4jllLYfvOHFvGl/oR1kD3ZtHaeXbGjlx0pdiLrBZGEJwuiP1MrO0Pr8dgtQG1gl3a5ISVzkVS27u7NVSrwx9Hx0r0OsZ1bGvcIdoOPWEZVaEXVCNykl4zcmGXSlZdbIhSalONbWAsbuFZacQBAk7mHRC98kBcR4/7bQM/NWagYMxT7vgECUYkhK85UBjRStLaSTIGzFeQ5PbsTX5tAfg2zonOA4nCCbTO5IeZeD85zRv2FNAzHDF0Vd3i2+t8zkw6tsIcaq7ypLtkep+qLsGhUQZ3iT6yXCb9Lm6Z0xzQfz2iJ1Np97N6KECEUyisniqYwU5
x-ms-exchange-antispam-messagedata: i3a9pfAsSgPb3IE9dcZAP3suYoT5WQby3BpVx0G7dOT7jrY6Fj45qIG4OxR9d3c30Bks5xxETbGJl30q3JOEhfHl4Z5l6rQr+i97JvFp4u0xNFFoV5vZc5XAhDlR9eK9/E4EvXtiRu+O3t7DDcTTsd29ybzqadBnhgRRH9bAuXU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9542C36FEB22904086FA66A35DF145A1@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aea5b4c-a2b0-4836-70ad-08d7ae8c1892
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2020 00:48:22.6069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FgaSUB+8hrqryt5aKFlsXxdtW5PEA5HWTMqMTURb0HHbWQTox9iHiriQBq3F7jzFtDH0iA/7g0ygiFD/yDjDiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1229
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-10_08:2020-02-10,2020-02-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 adultscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002110001
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgSm9lbCwNCkkgYW0gbG9va2luZyBpbnRvIGZpeGluZyB3YXJuaW5nIGZvciBteSBwYXRjaC4g
SWYgeW91IGhhdmUgYW55IGlkZWEgb3Igc3VnZ2VzdGlvbnMsIHBsZWFzZSBhZHZpY2UuDQoNClJl
Z2FyZHMNCi1WaWpheQ0KDQrvu79PbiAyLzEwLzIwLCAxOjQ1IFBNLCAiU3RlcGhlbiBSb3Rod2Vs
bCIgPHNmckBjYW5iLmF1dWcub3JnLmF1PiB3cm90ZToNCg0KICAgIEhpIGFsbCwNCiAgICANCiAg
ICBBZnRlciBtZXJnaW5nIHRoZSBhc3BlZWQgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxk
IChhcm0NCiAgICBtdWx0aV92N19kZWZjb25maWcpIGZhaWxlZCBsaWtlIHRoaXM6DQogICAgDQog
ICAgYXJjaC9hcm0vYm9vdC9kdHMvYXNwZWVkLWc2LmR0c2k6MzIyLjM1LTMyNy43OiBFUlJPUiAo
ZHVwbGljYXRlX25vZGVfbmFtZXMpOiAvYWhiL2FwYi9zeXNjb25AMWU2ZTIwMDAvaW50ZXJydXB0
LWNvbnRyb2xsZXI6IER1cGxpY2F0ZSBub2RlIG5hbWUNCiAgICBFUlJPUjogSW5wdXQgdHJlZSBo
YXMgZXJyb3JzLCBhYm9ydGluZyAodXNlIC1mIHRvIGZvcmNlIG91dHB1dCkNCiAgICANCiAgICBD
YXVzZWQgYnkgY29tbWl0DQogICAgDQogICAgICAwOTFmZjUyMDZlZjMgKCJBUk06IGR0czogYXNw
ZWVkOiBhc3QyNjAwOiBGaXggU0NVIElSUSBjb250cm9sbGVyIG5vZGUgYWRkcmVzc2VzIikNCiAg
ICANCiAgICBBbHNvIHRoZXNlIHdhcm5pbmdzOg0KICAgIA0KICAgIGFyY2gvYXJtL2Jvb3QvZHRz
L2FzcGVlZC1ibWMtZmFjZWJvb2stdGlvZ2FwYXNzLmR0czo0MzUuMTEtNDM5LjQ6IFdhcm5pbmcg
KGkyY19idXNfcmVnKTogL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNAMTQwL2lwbWIwQDEw
OiBJMkMgYnVzIHVuaXQgYWRkcmVzcyBmb3JtYXQgZXJyb3IsIGV4cGVjdGVkICI0MDAwMDAxMCIN
CiAgICBhcmNoL2FybS9ib290L2R0cy9hc3BlZWQtYm1jLWZhY2Vib29rLXRpb2dhcGFzcy5kdHM6
NDM3LjMtMzA6IFdhcm5pbmcgKGkyY19idXNfcmVnKTogL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2ky
Yy1idXNAMTQwL2lwbWIwQDEwOnJlZzogSTJDIGFkZHJlc3MgbXVzdCBiZSBsZXNzIHRoYW4gMTAt
Yml0cywgZ290ICIweDQwMDAwMDEwIg0KICAgIGFyY2gvYXJtL2Jvb3QvZHRzL2FzcGVlZC1ibWMt
ZmFjZWJvb2stdGlvZ2FwYXNzLmR0czo1MjEuMTEtNTI1LjQ6IFdhcm5pbmcgKGkyY19idXNfcmVn
KTogL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNAMzgwL2lwbWIwQDEwOiBJMkMgYnVzIHVu
aXQgYWRkcmVzcyBmb3JtYXQgZXJyb3IsIGV4cGVjdGVkICI0MDAwMDAxMCINCiAgICBhcmNoL2Fy
bS9ib290L2R0cy9hc3BlZWQtYm1jLWZhY2Vib29rLXRpb2dhcGFzcy5kdHM6NTIzLjMtMzA6IFdh
cm5pbmcgKGkyY19idXNfcmVnKTogL2FoYi9hcGIvYnVzQDFlNzhhMDAwL2kyYy1idXNAMzgwL2lw
bWIwQDEwOnJlZzogSTJDIGFkZHJlc3MgbXVzdCBiZSBsZXNzIHRoYW4gMTAtYml0cywgZ290ICIw
eDQwMDAwMDEwIg0KICAgIA0KICAgIENhdXNlZCBieSBjb21taXQNCiAgICANCiAgICAgIGE1OWIx
NzkyYWRmMSAoIkFSTTogZHRzOiBhc3BlZWQ6IHRpb2dhcGFzczogQWRkIElQTUIgZGV2aWNlIikN
CiAgICANCiAgICBJIGhhdmUgdXNlZCB0aGUgYXNwZWVkIHRyZWUgZnJvbSBuZXh0LTIwMjAwMjEw
IGZvciB0b2RheS4NCiAgICANCiAgICAtLSANCiAgICBDaGVlcnMsDQogICAgU3RlcGhlbiBSb3Ro
d2VsbA0KICAgIA0KDQo=
