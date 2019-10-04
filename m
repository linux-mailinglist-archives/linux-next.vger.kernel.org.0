Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCB2CB478
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 08:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730645AbfJDG0g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Oct 2019 02:26:36 -0400
Received: from mail-eopbgr710041.outbound.protection.outlook.com ([40.107.71.41]:5436
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730225AbfJDG0g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 4 Oct 2019 02:26:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJ37UAJp+v0Jmei80rsZiFyixB+dJ1YQRXdQK1eBIOk1CTdfNCkJOkk3e3k5tmKtRthfb4iN2DGdou756MYXWuHhbTlU41YthHasZoYXMVy7FuoX7gUlMtmUjfXsUo1jaydQ6BeLThTMpo3IWiESsjVYsgnSEZHYTE+s0rEzXIgDcmYKq8JFuFyGVomVf1dC9bqMFf4H6sVRzFB6Oum7BnW8LmhaC5XaPNoZmcjZqxkdJh19MQMeW+y2yAlDp4RtfahHDf/KiUL1aE6H+g3aZdEf6PTyBHW7R40gEwNAwryfhcoNRqkDQbrJE5KxmGnzLT/C3G2RGDsV+TNhZIEH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOTYIJfLPBGQgPTpCmdwqlF9IT76ZeIiudszWTsZrdI=;
 b=FZ6qeaJlcTk4uiv44HE3pXqxfryyMs48fVr8G1yG96TvWwwicF+Xr8xKVff+D1pWkR0Cg/N6diXzkSzt7smKb9poDo7oMVRvWjjnczt8F6pEAzioGtkhH8WDtoVRErsohAA4RK9+KlhOURDChThY5xAXwrmqUQEbxl9w898/dE2DZ36pQXA65rBDOxEILcO3BBWJ4ZgfvyYQm8xyqyC0GokwxnsbDj0hnx5VkkiJxSVyxl0KCSjQlNtQTZIEfBvixMJlB8B3h0b/yJ+vu06klVb23JpxwPcfwSK9N7DFxRVXGrj1il72Qdcxj6za7qIFEyPq/sWqGLWMgXF4nK0aBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOTYIJfLPBGQgPTpCmdwqlF9IT76ZeIiudszWTsZrdI=;
 b=sHpMleeMZkeMtFs0+y7XDIEBVfRahsR1wgFagIXsXwyVm+arwfcSMjeWFd10lF3P7psiIi707IwxtBtlFVnopg24H7eKNaoIQ1igu8/7k+UZxFq1WA3FrrEun1gWXRiPkfr3scuEslKyUUeH2S9ieN/bOGFukCVc8XNA4A7zjME=
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB3904.namprd12.prod.outlook.com (10.255.237.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 06:26:33 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::2554:5047:84da:de14]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::2554:5047:84da:de14%6]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 06:26:33 +0000
From:   "S, Shirish" <sshankar@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "S, Shirish" <Shirish.S@amd.com>
Subject: Re: linux-next: Fixes tag needs some work in the amdgpu tree
Thread-Topic: linux-next: Fixes tag needs some work in the amdgpu tree
Thread-Index: AQHVeW5Lm89dlHuy9ECRdAeI1lS1P6dKB5aA
Date:   Fri, 4 Oct 2019 06:26:33 +0000
Message-ID: <a7714c0b-7a57-c885-310f-a79779c5cb38@amd.com>
References: <20191003081101.517d34a5@canb.auug.org.au>
In-Reply-To: <20191003081101.517d34a5@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR0101CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::11) To MN2PR12MB3248.namprd12.prod.outlook.com
 (2603:10b6:208:a9::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.157.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 600a8924-7cf2-44e0-96dd-08d74893ccd5
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3904:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB39046E0BDC227101A27F7E2FF29E0@MN2PR12MB3904.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:65;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(53754006)(189003)(199004)(11346002)(186003)(2906002)(81166006)(36756003)(446003)(4744005)(31686004)(3846002)(6116002)(71200400001)(71190400001)(476003)(229853002)(486006)(66556008)(6512007)(54906003)(478600001)(110136005)(316002)(14454004)(25786009)(6436002)(305945005)(2616005)(6246003)(102836004)(8936002)(8676002)(66066001)(81156014)(6486002)(7736002)(99286004)(4326008)(66946007)(5660300002)(76176011)(256004)(52116002)(6506007)(386003)(53546011)(64756008)(66446008)(66476007)(31696002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB3904;H:MN2PR12MB3248.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d0eY7x0VlBkwLVdREJ6kY6giZe4wpGuIJp0E+D6rqUqNByR9U9KDSgJUsbVP1tiL+3UG7bdfEpslKklC+EpSZPo8bpuD3DvNGQuf2YhqccZgQoH/0wHFCIHXhYccuXCGNSdaoY+QDqAolKEgmsrj1/rNSup3PBmD8hDcW3AUAg7d/WZvWsUIBnEvrW0VC4d2QdvWcg38MOa6IKU2tTrBkNWE2bST+QEe7nAy9Fs6d+NYcYfxKHjermQqKSbOQpap8ma5oP0xRRwVypXnVvwCn4LULkOFzIED4sZbbeV8+1ZExBOFO0Tl/pSemtMdFXhU+S2eocGXp3MKrt4cRXYkluVCXWLdXYPNUXmvusydmxKuksbwN4xJ42qcnw4G1b6uYWzyc7IMW5xTLbsHjTaHnp//oj8iTBz4cFk5zODDR4c=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <2FEF9F7170FA0C4D9F2BA8EF92BEC437@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600a8924-7cf2-44e0-96dd-08d74893ccd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 06:26:33.2245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l4SlFu3o6FIJHZoAdEp4608MdRHwNrVqeyVeoabzAijDgEZta5MNrxoHaS1PTy5RUy0qbG/5UJ+lfjt1Oo+mxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3904
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,


On 10/3/2019 3:41 AM, Stephen Rothwell wrote:
> Hi all,
>
> In commit
>
>    8c9f69bc5cc4 ("drm/amdgpu: fix build error without CONFIG_HSA_AMD")
>
> Fixes tag
>
>    Fixes: 1abb680ad371 ("drm/amdgpu: disable gfxoff while use no H/W sche=
duling policy")
>
> has these problem(s):
>
>    - Target SHA1 does not exist
>
> Did you mean
>
> Fixes: aa978594cf7f ("drm/amdgpu: disable gfxoff while use no H/W schedul=
ing policy")

Yes, I meant "aa978594cf7f".

Regards,

Shirish S

--=20
Regards,
Shirish S

