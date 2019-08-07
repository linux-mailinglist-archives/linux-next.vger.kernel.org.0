Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B026B8518E
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 18:59:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388400AbfHGQ7m (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 12:59:42 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:54658 "EHLO
        mx0b-00082601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729714AbfHGQ7l (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 12:59:41 -0400
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
        by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x77GxCm9022590;
        Wed, 7 Aug 2019 09:59:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=4j5K2HWRx8Bh6Oju13KR7IhFUpgfEB1OrwxwTgXeUU8=;
 b=OjQfnav/+GRyyP9ws0OQfNWyOClMK95fNTr2CHbug2dyBTtZXJ+O8naA7a6fDD60uWRo
 +YgjIpQ+HaTnkG6+sfeBxX0m4zicZYRufYHmrFdzHmnKeeRenB3he2bSZzReS14hLlcE
 6eKrW2Ao8fY59t+MZtsF6Bl8oZhYtN4r+Wg= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by mx0a-00082601.pphosted.com with ESMTP id 2u7vjs9crw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 07 Aug 2019 09:59:16 -0700
Received: from ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) by
 ash-exhub103.TheFacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Aug 2019 09:59:15 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 7 Aug 2019 09:59:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuHJs1VYhXs3L3YTY5/U7xq4Yd/P4glFqNHJ08oAdD9gDQQ1bxf8K/La8I1JUgmepz/w0s3augeTPmnV9KD1KRgp4lxo7XHm2cQIRI+zoAbtnuaz0KbCUzL+SwO3E+VNbALnxOQAXzaXZhFv2T6Sf57h3tTS72lFIbOO8PeKon7liDMRuUU2e8T3BipVLKj9RQbAa0OdBnZv8LAb2thYetpKLYG+zAnzwKho3eea4vo6/AVK8DWj32ju39dZUSwIyfD7zPB5S3jH3BJD0zAKF+H4qTUXHicCiPs30iFrhBo0MxXFKKLv8rGcGrVZRO6K3wai8UzVHBzoDSTo0b6Alw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j5K2HWRx8Bh6Oju13KR7IhFUpgfEB1OrwxwTgXeUU8=;
 b=YasDCOoaCMG1WroKLyAhCq24TXpg+5UmG7S4Ky9Qh3aafgLpNiIHoUua7d+VpLzSG9hpIOzquW00Bx+FGLFKURJXACk+Gm00VJPYMSsikZ/d9m4y+SsbhnN30agL01xYvJu87p5qk+YQCJ+CvKZJK8A4WZwHeKHygO6QeE6D1g7RjNdVET4xBTAYvBeC6pMAKcnUndk3vzcTCq80IUm4oNtfGbAHnKDkW6U0njp04rvh/XbCEH7CgPcLUNLlT4uKgaN2u5GsUmuURDyVYIJ/V3DUGR23GqT0P5anoDKsfZJR9udTapfdqlhz1pYT7CeBvIEJN5i3GzliIxF7UiOx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=fb.com;dmarc=pass action=none header.from=fb.com;dkim=pass
 header.d=fb.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j5K2HWRx8Bh6Oju13KR7IhFUpgfEB1OrwxwTgXeUU8=;
 b=iMZeJU8pvkdV57/BoIbOhMyV1+zafNJmr2wetxXUP1iDU0P+GVD2ZpnOpg0NFC/GHl3GgxtgTNodKqPMExaEN1snlWia+SkkCQzid5wQ4h+LvmHEuJn7D9OhlRa8UUbLZU7Xz+SpK59E1PS7U4wmD+RDA++Tr36BdrbE6EVehEk=
Received: from MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) by
 MWHPR15MB1326.namprd15.prod.outlook.com (10.175.4.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Wed, 7 Aug 2019 16:59:14 +0000
Received: from MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::79c8:442d:b528:802d]) by MWHPR15MB1165.namprd15.prod.outlook.com
 ([fe80::79c8:442d:b528:802d%9]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 16:59:14 +0000
From:   Song Liu <songliubraving@fb.com>
To:     Randy Dunlap <rdunlap@infradead.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: linux-next: Tree for Aug 7 (mm/khugepaged.c)
Thread-Topic: linux-next: Tree for Aug 7 (mm/khugepaged.c)
Thread-Index: AQHVTTJXJMBKk+9UcEyVbeuM3CTH0abv6HuA
Date:   Wed, 7 Aug 2019 16:59:14 +0000
Message-ID: <DCC6982B-17EF-4143-8CE8-9D0EC28FA06B@fb.com>
References: <20190807183606.372ca1a4@canb.auug.org.au>
 <c18b2828-cdf3-5248-609f-d89a24f558d1@infradead.org>
In-Reply-To: <c18b2828-cdf3-5248-609f-d89a24f558d1@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3445.104.11)
x-originating-ip: [2620:10d:c090:200::3:1a00]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3314d6ed-f0b2-43b2-03b1-08d71b5893c8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR15MB1326;
x-ms-traffictypediagnostic: MWHPR15MB1326:
x-microsoft-antispam-prvs: <MWHPR15MB1326B5F8FB2FA5A4468B95D3B3D40@MWHPR15MB1326.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(346002)(39860400002)(136003)(376002)(51914003)(189003)(199004)(53754006)(46003)(53936002)(66946007)(8676002)(102836004)(86362001)(476003)(33656002)(66446008)(57306001)(478600001)(50226002)(8936002)(6436002)(66556008)(66476007)(81156014)(81166006)(53546011)(76116006)(14454004)(256004)(64756008)(76176011)(68736007)(6916009)(6506007)(6116002)(316002)(2906002)(4326008)(7736002)(446003)(486006)(305945005)(25786009)(36756003)(229853002)(6246003)(54906003)(4744005)(71190400001)(71200400001)(6486002)(2616005)(5660300002)(99286004)(11346002)(6512007)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR15MB1326;H:MWHPR15MB1165.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bpSc9KJPogcX4Xp5xpzav9nvkaYAB25bazC5aCIBXBGAf15/cQhBwvJS+ayhbWQH7DacdfeBiorHWkE06yHzZaI3Gpl2z+xveehvLDkZQppT8aJ+9cp9JFYJETdSrhoG/T8fg4ihH4PNU2vj3uZ6+ZLkrS0Jf9h8kdDrRFGeOwW4HuqpA9ONpbdIK7kpd1IDIh2+Y5uDMZI2wrWFKwjXVwlqrT3wNIrY36koyb2exdFonaz9dW+XY1vGhaOi2uQZ6a7vjX7i/0Mo/TRV9IK6KZmUjBMzjPKPEAy6ZHOAAKk7s+xRIthw6g6sVT4Nw1fBOkMnsN+msCTXx6EuntslPeh5mAWqqZ9y2qLNBQ7OiGn9qcMErVCIbBL+MNee1I3VLrkvPdH0SkiFG2d8ZZHo6X0j11ihrD0Zc7lPR5fCdOs=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EF0D9557DC1D95428B318AB2E57338AE@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3314d6ed-f0b2-43b2-03b1-08d71b5893c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 16:59:14.5056
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: songliubraving@fb.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1326
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-07_04:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=870 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070166
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

SGkgUmFuZHksDQoNCj4gT24gQXVnIDcsIDIwMTksIGF0IDg6MTEgQU0sIFJhbmR5IER1bmxhcCA8
cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToNCj4gDQo+IE9uIDgvNy8xOSAxOjM2IEFNLCBT
dGVwaGVuIFJvdGh3ZWxsIHdyb3RlOg0KPj4gSGkgYWxsLA0KPj4gDQo+PiBDaGFuZ2VzIHNpbmNl
IDIwMTkwODA2Og0KPj4gDQo+IA0KPiBvbiBpMzg2Og0KPiANCj4gd2hlbiBDT05GSUdfU0hNRU0g
aXMgbm90IHNldC9lbmFibGVkOg0KPiANCj4gLi4vbW0va2h1Z2VwYWdlZC5jOiBJbiBmdW5jdGlv
biDigJhraHVnZXBhZ2VkX3NjYW5fbW1fc2xvdOKAmToNCj4gLi4vbW0va2h1Z2VwYWdlZC5jOjE4
NzQ6MjogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmGtodWdlcGFn
ZWRfY29sbGFwc2VfcHRlX21hcHBlZF90aHBz4oCZOyBkaWQgeW91IG1lYW4g4oCYY29sbGFwc2Vf
cHRlX21hcHBlZF90aHDigJk/IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9u
XQ0KPiAga2h1Z2VwYWdlZF9jb2xsYXBzZV9wdGVfbWFwcGVkX3RocHMobW1fc2xvdCk7DQo+ICBe
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KDQpUaGFua3MgZm9yIHRoZSByZXBv
cnQuIA0KDQpTaGFsbCBJIHJlc2VuZCB0aGUgcGF0Y2gsIG9yIHNoYWxsIEkgc2VuZCBmaXggb24g
dG9wIG9mIGN1cnJlbnQgcGF0Y2g/DQoNCkJlc3QsDQpTb25n
