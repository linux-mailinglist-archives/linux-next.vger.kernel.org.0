Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05DB2E6BAF
	for <lists+linux-next@lfdr.de>; Mon, 28 Oct 2019 05:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfJ1EJm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Oct 2019 00:09:42 -0400
Received: from mail-eopbgr690060.outbound.protection.outlook.com ([40.107.69.60]:51407
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725601AbfJ1EJl (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Oct 2019 00:09:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S5z9zKAxjJLVzXI1RZOpOSxgJ4hGGTfSgqqR/mQeTNS3MY++0vq79Vc6uc5PXO5HOPfw+JoFeKpyi0xAtUlePGZz393f5ygj6ugQHFxgOepzrHV8LoigXLONLnznm1CtB+6hw6OrvrBnkyYn7EzajGRxWpUfUV/274z7V3HfQk/AQYi97keL2dHQTpURcUHt9lthy3VSiDRdcQ0ng9QL143yb97vkJeRUUJfeEiCdV2YhGI7rPei5ZUFRlZrfEBzPJgEjuGECVx5UoWH7IsHdV1AFeluOx8LtdHEXDa2hxycN53R5vNLpCFW8LoOtZQltuKjI0Iw/nxDU68WESjYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8t12eipuxyZ3LkCbGTU1Eun8XaF++waGFUk8tojceI=;
 b=VZ2JjnemqDii2pESSh7UKz56wCcQmdK9tKavyP2NE/Tla6ZMkCouQnc4o8YjvWEN+v1lVWYHsWAy1oP/RwrxVNcsKpYGSOEBwt7v/lU5LX8bRX2s4PuFZ8wmF8h1kazbilR58uy5oCNINIWPizHyFG6QVff2IbCFeoLbOPHYpwMxNT7mHAauJUsiXtzo6UCmxfAZCRuWluJpA3dKGuMF+f43MtzUzlLcLEBD3MRuohTwP6VkGIE6amAupXeKzoU6GzynZyDXp6U2hulHOY4i2jMyivVvHtsAh5LppeRYWwWQF+1sSNF/Bxj9+wyQnpjrSgdthlidCpJZgIySV6cf/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v8t12eipuxyZ3LkCbGTU1Eun8XaF++waGFUk8tojceI=;
 b=UUPn656Y6V60KDVrfS92CokK6e5sOUmEOdfHyHG/7cYN9lvsQOkMpzG4Hj98sN3U/UGxhXlblQdtjy//d98ugt0/oYh+M3mFXHsIkciGYDJSu/UyCUvq8+pWtZ8pUDqwvNBiwzN0vKYVpCbpLEPpD9YAiuB3SPWsFJ9RMpcuVDk=
Received: from MN2PR12MB3248.namprd12.prod.outlook.com (20.179.80.74) by
 MN2PR12MB2958.namprd12.prod.outlook.com (20.179.80.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Mon, 28 Oct 2019 04:09:39 +0000
Received: from MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::dd77:dfe4:1913:9d7e]) by MN2PR12MB3248.namprd12.prod.outlook.com
 ([fe80::dd77:dfe4:1913:9d7e%4]) with mapi id 15.20.2387.021; Mon, 28 Oct 2019
 04:09:39 +0000
From:   "S, Shirish" <Shirish.S@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: linux-next: Fixes tag needs some work in the drm tree
Thread-Topic: linux-next: Fixes tag needs some work in the drm tree
Thread-Index: AQHVjQRo8bljOU3RmEOsY9WZLY63i6dvci5g
Date:   Mon, 28 Oct 2019 04:09:39 +0000
Message-ID: <MN2PR12MB3248EBEECD7ECBE3EB6EC380F2660@MN2PR12MB3248.namprd12.prod.outlook.com>
References: <20191028072324.5b2b2d4b@canb.auug.org.au>
In-Reply-To: <20191028072324.5b2b2d4b@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Shirish.S@amd.com; 
x-originating-ip: [2406:7400:73:69db:e57c:27a3:fbb8:ec7a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 91ac4421-7fce-40b8-8e8a-08d75b5ca749
x-ms-traffictypediagnostic: MN2PR12MB2958:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB2958F3F715C2A68BC65B31F0F2660@MN2PR12MB2958.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:153;
x-forefront-prvs: 0204F0BDE2
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(39860400002)(136003)(346002)(376002)(396003)(199004)(189003)(53754006)(13464003)(25786009)(4326008)(229853002)(54906003)(52536014)(110136005)(6246003)(6506007)(53546011)(14454004)(71200400001)(71190400001)(86362001)(6436002)(8936002)(316002)(74316002)(5660300002)(66556008)(186003)(8676002)(305945005)(55016002)(6116002)(81166006)(81156014)(7736002)(99286004)(256004)(4744005)(478600001)(7696005)(33656002)(76176011)(102836004)(66446008)(64756008)(476003)(66476007)(2906002)(11346002)(486006)(446003)(9686003)(76116006)(66946007)(46003);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB2958;H:MN2PR12MB3248.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AJ0Th7srV5dzSg4x+LvdYCoG33JIBqdReDHb7cQNq5Du3ZI2BkEun4rnta4Oj2049lfGlKVqsuQJbVeDZ9ack/ksg73QBsWDh+hOzBfSz5aA8BUkj0unI8lHMlwdZULhlxMsm4LqYmxooLuIyJhIpXoKftrTX9ZIQl4k9/1NotI8X+bb6acsP3Oy0aDLMqx/Pq46IslYRTOi9dQcFweaDasYsosPPbOopp5gViMMdyzxf/dpzklW0qmjnuVF/7XulAPJRjusRM+fOtj0A47D61At65YY0PnUrs4z6V662B750Ln9yGangf21OgLKt6H4ShFW4zTwicyp9TvepRkExaaDerm68lmPJggSL2PGHVC1zHweVYYLpOFQc70cW5rLPwCphaOa2XtVU9Ds0cxe1sWUaLTDCfgfmUD/07b0KnuCAnwUAAcM0aInX7oVIk40
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ac4421-7fce-40b8-8e8a-08d75b5ca749
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2019 04:09:39.6749
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J0IEGRZ3URLwqToHl1KRswsZlono5nJ2H4DydX/5eF2S7+JmUtWb89MwdW6TSZ/j4bUoyo0/mIz6fYtM+6ZEvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2958
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Yes, that's what it meant.



Regards,
Shirish S

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>=20
Sent: Monday, October 28, 2019 1:53 AM
To: Dave Airlie <airlied@linux.ie>; DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Mail=
ing List <linux-kernel@vger.kernel.org>; S, Shirish <Shirish.S@amd.com>; De=
ucher, Alexander <Alexander.Deucher@amd.com>
Subject: linux-next: Fixes tag needs some work in the drm tree

Hi all,

In commit

  8c9f69bc5cc4 ("drm/amdgpu: fix build error without CONFIG_HSA_AMD")

Fixes tag

  Fixes: 1abb680ad371 ("drm/amdgpu: disable gfxoff while use no H/W schedul=
ing policy")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

Fixes: aa978594cf7f ("drm/amdgpu: disable gfxoff while use no H/W schedulin=
g policy")

--=20
Cheers,
Stephen Rothwell
