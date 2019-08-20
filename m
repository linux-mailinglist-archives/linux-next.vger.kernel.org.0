Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB1A965FE
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2019 18:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbfHTQOE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Aug 2019 12:14:04 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:35428 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725971AbfHTQOD (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Aug 2019 12:14:03 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7KG9bAL025524;
        Tue, 20 Aug 2019 09:13:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=R28bI2hn6125RKMOCrKu5wkYFHY6t6Uy47BT1Vcr9ZA=;
 b=Vvvs0gnyTxhm4W0rMnalMVK7RNLFHvwl9neoDf4WbKEs616g68tps+bC1bFiG0l4FVgR
 YzwBq94fR2khlsMf0TxVmh++PVXk0tOPeK6zxzPJdNIVuwNdT68rsHgp+REaRpqtWTlm
 wS/QAUhfrS6YpXkmHs2+psv5mp3VHXBenNc= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
        by mx0a-00082601.pphosted.com with ESMTP id 2ugjxd8dvr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 20 Aug 2019 09:13:47 -0700
Received: from prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) by
 prn-hub06.TheFacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 20 Aug 2019 09:13:46 -0700
Received: from prn-hub03.TheFacebook.com (2620:10d:c081:35::127) by
 prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Tue, 20 Aug 2019 09:13:46 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Tue, 20 Aug 2019 09:13:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpqP8iuMzDivVuN+CIJWPAaJ7H+8k8lnhzJ4OUd3NMm8MhmTlSwUO8mPf/J4xZ7P/r9oX0XxDq5ApGBwPPe/7QlB3g9RbyMrpGAg/epoMDkdHE0Pe/CkKZ+9CeJUQBaxVvg9t29tnmof8Tde4FQiiNpwoh5MyXmZ55Oq6qqnPWMfsOSR6r8VckCpj3fydHYreCcaZtwwGje4BXVrAh+ZW0d1bWlTm38np+csvdT2jy9KinaN51xR3JLyscGBseACRa0RCszXkxGAq6x85c21hh8aOpKmc6KKPkqc0vV2UbSf+txvfYLk00mWjbQ8Xlfu0pWBQ0pE8NidgzYMniCKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R28bI2hn6125RKMOCrKu5wkYFHY6t6Uy47BT1Vcr9ZA=;
 b=YRHxkA0lolVnmK6HoOsFMxoeqEQ8afbjrTjaPq0W67FR5FtawhMB7LPkh5yEFA9x26r6sdXQ3gmp5QxtdIib+Cn7mbjdJMpfBTUzKmVn1OU9i7gNOBxasbQvVYHJR0DxNGn8iCUC4DLtIqRMj+O571BkcRiXuJtMRwe0Fmj5mS8xelnwheNmkADqAz3y1rPREe7tOnatcB5jILgmrfCq2SiVBZrLWi+nXryXWNXx6785mE3XvCDMkncJiQRgNkP585Dx15drsX1IhsYZ+WpafyosSeMtZ6pzqjjUARF3h4l0wpkhFYZz4iZsubowyAuheCxa+aIU89U6kBsmkZQ4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R28bI2hn6125RKMOCrKu5wkYFHY6t6Uy47BT1Vcr9ZA=;
 b=il1Pxp0UesWjcre01xv2PrFlvtOCznRcWv1v1x2OAGjpQifm4eJzWmCAaKA7i1XiP9mmGbwLJqUcf2ARazT1ynBV7DiwRqruYF4Nk/Fj3lC5T+nnmIUwXj6jN0m4nS25XipeijWeUtzHdL86n00wWXlHJO6bw6iLbyVgVGnBj1w=
Received: from DM6PR15MB2635.namprd15.prod.outlook.com (20.179.161.152) by
 DM6PR15MB3004.namprd15.prod.outlook.com (20.178.231.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.19; Tue, 20 Aug 2019 16:13:44 +0000
Received: from DM6PR15MB2635.namprd15.prod.outlook.com
 ([fe80::d1fc:b5c5:59a1:bd7e]) by DM6PR15MB2635.namprd15.prod.outlook.com
 ([fe80::d1fc:b5c5:59a1:bd7e%3]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 16:13:44 +0000
From:   Roman Gushchin <guro@fb.com>
To:     Randy Dunlap <rdunlap@infradead.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>
Subject: Re: linux-next: Tree for Aug 20 (mm/memcontrol)
Thread-Topic: linux-next: Tree for Aug 20 (mm/memcontrol)
Thread-Index: AQHVV26f26lafgLMP0GMzAOM9ymHeqcENZmA
Date:   Tue, 20 Aug 2019 16:13:44 +0000
Message-ID: <20190820161341.GA20702@tower.dhcp.thefacebook.com>
References: <20190820170955.3ca79270@canb.auug.org.au>
 <bcce34db-47ea-cf02-057d-c63c2bf7eeeb@infradead.org>
In-Reply-To: <bcce34db-47ea-cf02-057d-c63c2bf7eeeb@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0035.prod.exchangelabs.com (2603:10b6:a02:80::48)
 To DM6PR15MB2635.namprd15.prod.outlook.com (2603:10b6:5:1a6::24)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c090:200::2:4a49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fe06d38-c3e6-42b1-4029-08d725895ff4
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:DM6PR15MB3004;
x-ms-traffictypediagnostic: DM6PR15MB3004:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR15MB3004935761FA96B71916FC6EBEAB0@DM6PR15MB3004.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(136003)(39860400002)(366004)(53754006)(189003)(199004)(305945005)(7736002)(966005)(99286004)(478600001)(256004)(71200400001)(5024004)(52116002)(14454004)(6916009)(76176011)(81166006)(5660300002)(6306002)(6436002)(81156014)(8676002)(6512007)(9686003)(25786009)(4326008)(8936002)(4744005)(66476007)(186003)(66556008)(66446008)(46003)(64756008)(53936002)(66946007)(6246003)(102836004)(446003)(11346002)(6486002)(486006)(1076003)(476003)(229853002)(54906003)(71190400001)(386003)(316002)(2906002)(33656002)(53546011)(6116002)(6506007)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:DM6PR15MB3004;H:DM6PR15MB2635.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7dGzpzqJfSQQtj9qEazO1UtqpRs78rdil8zV2i7WsqQgbEQxIVkU5CFBMEfhpagIC5eZ7sRlWx4yhDL4WsSQCXvkG0eCaT9wa78m1Yw26wDz4nDyga1jVUYSILDv9Su3xSU0CvyrUrRYkO/ZlKcFfyp8aRh9CXuDUFlQ4fk+xdLFYb9pnKAnxKF/YCvJ7GAlTl2YLzWB5O1sRAh7ls/M3X9vCqmIPSrnSmamS4h3058L69zdu1c6KO/3kDN5oB2zvpa9p8hjrX4ng0hLBa5a6ak8YRAymHNzdNdOAQDzRDlXU21DwCPOgl49Pu7dCUYkqp0y4T+WtHUEbccXXagAkRl7iqowF1XhSrKfICxmYhfOCh8JQ+XERHLO0vyFyCaULFzexEaWrq64m8LT6Z45ijpGtyF8lgxOgwISqPatBxU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB89B56D2A80E841B3DC7C03A2E00B17@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe06d38-c3e6-42b1-4029-08d725895ff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 16:13:44.8143
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V09mA4I1RoBjdz5tI0FZ3wYu5wPDvssNXQixfrLegu+jN/mi71Z6PvewozHbXpQJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB3004
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-20_06:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200150
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

T24gVHVlLCBBdWcgMjAsIDIwMTkgYXQgMDc6NTk6NTRBTSAtMDcwMCwgUmFuZHkgRHVubGFwIHdy
b3RlOg0KPiBPbiA4LzIwLzE5IDEyOjA5IEFNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOg0KPiA+
IEhpIGFsbCwNCj4gPiANCj4gPiBDaGFuZ2VzIHNpbmNlIDIwMTkwODE5Og0KPiA+IA0KPiANCj4g
b24gaTM4NiBvciB4ODZfNjQ6DQo+IA0KPiAuLi9tbS9tZW1jb250cm9sLmM6IEluIGZ1bmN0aW9u
IOKAmF9fbWVtX2Nncm91cF9mcmVl4oCZOg0KPiAuLi9tbS9tZW1jb250cm9sLmM6NDg4NToyOiBl
cnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYbWVtY2dfZmx1c2hfcGVy
Y3B1X3Ztc3RhdHPigJk7IGRpZCB5b3UgbWVhbiDigJhxZGlzY19pc19wZXJjcHVfc3RhdHPigJk/
IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQ0KPiAgIG1lbWNnX2ZsdXNo
X3BlcmNwdV92bXN0YXRzKG1lbWNnLCBmYWxzZSk7DQo+ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4NCj4gICBxZGlzY19pc19wZXJjcHVfc3RhdHMNCj4gLi4vbW0vbWVtY29udHJvbC5jOjQ4
ODY6MjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmG1lbWNnX2Zs
dXNoX3BlcmNwdV92bWV2ZW50c+KAmTsgZGlkIHlvdSBtZWFuIOKAmG1lbWNnX2NoZWNrX2V2ZW50
c+KAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dDQo+ICAgbWVtY2df
Zmx1c2hfcGVyY3B1X3ZtZXZlbnRzKG1lbWNnKTsNCj4gICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn4NCj4gICBtZW1jZ19jaGVja19ldmVudHMNCj4gDQo+IA0KPiANCj4gRnVsbCBpMzg2IHJh
bmRjb25maWcgZmlsZSBpcyBhdHRhY2hlZC4NCg0KSGkgUmFuZHkhDQoNClRoZSBpc3N1ZSBoYXMg
YWxyZWFkeSBiZWVuIGZpeGVkICggaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvOC8xOS8xMDA3
ICksDQphbmQgQW5kcmV3IGhhcyBwaWNrZWQgYW4gdXBkYXRlZCB2ZXJzaW9uIHRvIHRoZSBtbSB0
cmVlLg0KU28gaXQgd2lsbCBiZSByZXNvbHZlZCBzb29uLg0KDQpUaGFua3MhDQo=
