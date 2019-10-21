Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB8EBDEC9E
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 14:45:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728811AbfJUMo7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 08:44:59 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:23418 "EHLO
        mx0a-00082601.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728839AbfJUMo6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 08:44:58 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
        by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9LCgG6n004167;
        Mon, 21 Oct 2019 05:44:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=J5MeVyfVel8cVfh+SfsDfVUsttEEUiSZR5Ukd/USneQ=;
 b=lV+lXHa46jOUA2ShSbbum3a5IoHy7s7ZhREFh+b93AICKv6/QWPyFC70H4tcbzjassau
 Hy8tZ/3YoGzzKASS72Bfg8+hNWAx1dhbAzOHCw+NwL5pWdBhhzDdBy84BBUR+iZwDeOC
 ujlUBDlN74uoCxe4mJl4unNxeHz3FYVzXYg= 
Received: from maileast.thefacebook.com ([163.114.130.16])
        by m0001303.ppops.net with ESMTP id 2vqx5nprvq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Mon, 21 Oct 2019 05:44:43 -0700
Received: from ash-exhub202.TheFacebook.com (2620:10d:c0a8:83::6) by
 ash-exhub101.TheFacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 21 Oct 2019 05:44:42 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 21 Oct 2019 05:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvlO51nJ/ItlKDT0AOmI0pzZJtP3k7Ku/T0cTe6e1Rl/egqhNf2t3FsRIpX04UFMtySyy8SSrmBE4hJuCFVi2RZAExe+f83ZgvgYJVMew4cnYYKsIGVpLBM8wOSZRHY6N9YCQ2jvHc4BT79K+BbEDgTB5R70tSnMs6hVd8Y2erZLzc4GWranbwggwZkcl3qnyVi+aDDV+lIGqBTu0NWYlDY4RV/TiWNb27UggPrtnzOa6h7dNMl4xbtLNDn+u01+/ViIR7EYyAZx3QUUIjQR6MDLJjxlKJgLOIbwzhp9iHJyYMFUvUvDtWmLzQexGSzFY+fvjQgI40R0xtw6gp7NBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5MeVyfVel8cVfh+SfsDfVUsttEEUiSZR5Ukd/USneQ=;
 b=ejedRgtXr/dBRh24Jvm4CS+D5W8IrDeL4guReCQC/wpJeOXrQEuJ+oblSsP2EQ5mprmo9SMvvlApd+3Fx+u9E7F93+XH+ObnVVVxWOADZQu2RwD6QiS5Gb+LnoCosi6RYvgWS4livwum3yus1LXFxssGea7qQQAlGuqE0YBNncM1Lr2oe+IdA5FH8vjf9fsnnJMZZVCv86CAj4r0q9EieM5Xi38FBQmnuvEjRhxBqTPaviDBN9kJpVYByh/QlrvCrooHK4cgX0J9y7ir7/7bbWsqijsDEBhLYHX2rhDsd1gFFdHdB2U+mn1ixDI5pYR5kG0TOmfYcwSHAha8S1MGUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5MeVyfVel8cVfh+SfsDfVUsttEEUiSZR5Ukd/USneQ=;
 b=ATwrGvXlT81OcZ7gvihzMgGMKAlt68Bk9sUJPktUh7B9q616OIRz2i85oN12Og+ZG7df4A4m8hg42f5VgN2fp+1AQrf8GN2r77w017f3oIpiMUIERMEwEQDQTkC0ofSbD9N/5Zvw9HwJvKnfh5pjpxnasmY+PGXKgwmRAifzxb0=
Received: from SN6PR15MB2446.namprd15.prod.outlook.com (52.135.65.158) by
 SN6PR15MB2432.namprd15.prod.outlook.com (52.135.65.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Mon, 21 Oct 2019 12:44:41 +0000
Received: from SN6PR15MB2446.namprd15.prod.outlook.com
 ([fe80::e9d6:fc37:61e0:8ce7]) by SN6PR15MB2446.namprd15.prod.outlook.com
 ([fe80::e9d6:fc37:61e0:8ce7%6]) with mapi id 15.20.2367.019; Mon, 21 Oct 2019
 12:44:40 +0000
From:   Chris Mason <clm@fb.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.cz>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: cleanup the btrfs trees
Thread-Topic: linux-next: cleanup the btrfs trees
Thread-Index: AQHVhvki2vG5CW5Pikyn5VxTCuj+nKdlDKQA
Date:   Mon, 21 Oct 2019 12:44:40 +0000
Message-ID: <EF03F1BE-6060-48C3-B6AA-409F9355A52B@fb.com>
References: <20191020144731.20bc0633@canb.auug.org.au>
In-Reply-To: <20191020144731.20bc0633@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: MailMate (1.10r5443)
x-clientproxiedby: MN2PR12CA0005.namprd12.prod.outlook.com
 (2603:10b6:208:a8::18) To SN6PR15MB2446.namprd15.prod.outlook.com
 (2603:10b6:805:24::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2620:10d:c091:480::a8a6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28feb4f8-f9be-4b62-9330-08d756247093
x-ms-traffictypediagnostic: SN6PR15MB2432:
x-microsoft-antispam-prvs: <SN6PR15MB24326EA4FBF8ECC6E9F75FF7D3690@SN6PR15MB2432.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(366004)(376002)(346002)(39860400002)(199004)(189003)(53754006)(229853002)(316002)(54906003)(6116002)(2906002)(86362001)(446003)(6486002)(4744005)(6916009)(5660300002)(11346002)(486006)(476003)(2616005)(66946007)(46003)(305945005)(7736002)(71190400001)(71200400001)(50226002)(81156014)(8676002)(52116002)(256004)(8936002)(81166006)(64756008)(66476007)(66556008)(66446008)(25786009)(33656002)(6246003)(4326008)(14454004)(99286004)(478600001)(6512007)(6506007)(53546011)(6436002)(76176011)(386003)(186003)(102836004)(36756003);DIR:OUT;SFP:1102;SCL:1;SRVR:SN6PR15MB2432;H:SN6PR15MB2446.namprd15.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tsFv10+ebPclp1BzCPCtFhcgzXUP9pZkEQCMEhtSf38wweLD+ct73McS4TdfevvhFhJ88PaleVrvZ5fwPUKzBhIBk/ZfEaCWY28EVMlvuFTl1uVP4JLISqVd4auzYLD+gZunrFwtDBxOh5qCT9iGdmWYHqTFUQVdT8u2v+1f/z+VQGeqv6YLqzCNLYADZGczpi7R9RcO91NSMY6smzLuIvOmG4XcalUqx6s81vpZD2uMJdvZJrwOw4RMgH0i1O0Bi7Ld4X0IlzwSOErqKX3nk4/Z7Sdt/IFePPbH9UyEzXDHa3D5UobCOUQyi3HxakRyqtlNMh5JGrMRn36J4UyEXNE4ww+H2dNj5J/n2873Em/OKMQCVptlCpgaPJ5mwdpki0QJ5WKpwnGgIIoiJf2H179YRxaRpOLAHuwWJGcYSzxYI8+tn+laSbMYVkQ74pk0
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 28feb4f8-f9be-4b62-9330-08d756247093
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 12:44:40.6993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: umQYZ+D9Q7uOpfrWL703RMzYNdu50zdehDUG4lihirSBYFHeax/wA0d1nmVtl8cj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR15MB2432
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-21_04:2019-10-21,2019-10-21 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0 clxscore=1011
 phishscore=0 mlxscore=0 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=905
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1908290000 definitions=main-1910210123
X-FB-Internal: deliver
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 19 Oct 2019, at 23:47, Stephen Rothwell wrote:

> Hi all,
>
> The btrfs tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs.git#next=
)
> has not bee updated in more than a year, so I have removed it and then
> renamed the btrfs-kdave tree to btrfs.  I hope this is OK and if any
> other changes are needed, please let me know.


Thanks Stephen

-chris
