Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B738912592C
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 02:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfLSBWu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 20:22:50 -0500
Received: from mail-mw2nam12on2067.outbound.protection.outlook.com ([40.107.244.67]:6115
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726463AbfLSBWu (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Dec 2019 20:22:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/V+6ZZTkakug3g+4Ih/feJay3hQ8pHnFgP+c1ihsACu07JG32pY1Y1E2cggh7V1NMfISFEP3UN69wAOSrCvM9ugGCbUtDeE6eFdeKc76Yltg+UfZ/1ANLcpKDKTCvArPsa3YQrIGrVeDSntd7X1XvqMrBlbDJB8ISqfqE8fvNTg/qzVeFUeQYzzfeYFb8MQKAVJ1jvxGzn37WoiEzpOb2m86CaZL8JcnyBDIbVMfNY4F5ZsLPSf/5q9MNB6FYxS1FngklNHC5Z+10wInMkTjb94+IrUUA3ruBo2/6iY4HVq3Srjde6441+6RbStdBulKlPkD/rG/Ii6LfH7Y6po2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IER8HJ851fHt3+5zFFkRTD6Aq6A+w1Dnz4/kDayfWHU=;
 b=Y5Cngi3fjjHkwksEkXHvB2Mhb699Wd2O5YF/487v4wH4bZA6GdfcW0I+n35o9SRigxKhuH8HintvKRCfmd4OUn3UmvT+X7Q2Uyqtlban0jvfanyreoMkKFJtmnGDZEsP6DwtJSB/Ks/gcj4vUGnkDGz03qBaklrCs5ywOcSw1YNH9a7/iobdg56EXYS6ksAOV5MYhdHXsn40Pw8bCiircx7F6WlI+y0vvfeUAPucEbsvNcNNISHkPlFAuXNqStCNgg5n4TUzkPJULVgtyktZV8v7HxH3FH0S41cfvfODKloMqRimMFx6XLHMg7eTVzhlf2o5IP1GErA6E/KRKY07FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IER8HJ851fHt3+5zFFkRTD6Aq6A+w1Dnz4/kDayfWHU=;
 b=Dh+r44709O++8Of60K8JHWCVC/nt+yT90VJzr5JCwi2UE/d93LXDKiFD9dppMrnpT6Q7Pu7pc+0zNcUsS+9I3xZoj8NE2zUAhKDx3xvj9QlVp+KcoEqeq82I18UsFQs1Yw/J5nOYwggqea07iRdWvd8b/s6/eJaznu++sUGeh0s=
Received: from BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) by
 BYAPR12MB2806.namprd12.prod.outlook.com (20.176.254.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.20; Thu, 19 Dec 2019 01:22:47 +0000
Received: from BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::bccf:40ec:3b93:4269]) by BYAPR12MB2806.namprd12.prod.outlook.com
 ([fe80::bccf:40ec:3b93:4269%6]) with mapi id 15.20.2538.019; Thu, 19 Dec 2019
 01:22:47 +0000
From:   "Chen, Guchun" <Guchun.Chen@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: RE: linux-next: Fixes tag needs some work in the amdgpu tree
Thread-Topic: linux-next: Fixes tag needs some work in the amdgpu tree
Thread-Index: AQHVtenBDREYp5T5WEStp+oONEi+uKfAqYHQ
Date:   Thu, 19 Dec 2019 01:22:46 +0000
Message-ID: <BYAPR12MB2806A8EBBB8B6F9AE29FBC00F1520@BYAPR12MB2806.namprd12.prod.outlook.com>
References: <20191219082557.16092126@canb.auug.org.au>
In-Reply-To: <20191219082557.16092126@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2019-12-19T01:22:45Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=892b3436-89e9-4cd3-8440-00008a9a1c02;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2019-12-19T01:22:45Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 9e7b7af9-9272-4022-9842-000051f0bbd2
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Guchun.Chen@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 65af6d10-6915-4dc4-f4b0-08d78421f4b8
x-ms-traffictypediagnostic: BYAPR12MB2806:
x-microsoft-antispam-prvs: <BYAPR12MB2806434DA8169200DF05D50DF1520@BYAPR12MB2806.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(189003)(199004)(53754006)(13464003)(478600001)(55016002)(9686003)(4744005)(2906002)(66476007)(71200400001)(33656002)(86362001)(8936002)(6506007)(66556008)(64756008)(66446008)(110136005)(66946007)(7696005)(186003)(53546011)(54906003)(26005)(4326008)(76116006)(5660300002)(52536014)(81166006)(81156014)(8676002)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR12MB2806;H:BYAPR12MB2806.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HCY8gVDhtwQ1NY9ckOlrCJGfc14m6PEgvR6h0h+IiH/tJtCReVnI4mP2z/liaOXf5Gu0D2fcpsb7K7YLx5dHVTZkBAWdE5guFB89jXE/ftI/fniEJpapa/9Pik0pdpEIifUtJ7bnc5sj49pR67IxhG4f1fIDd3HHmUzCh/pBBdgf/H0D5Gz9u0MqZWXRqTHRg2aBIEOe6zzTGE278YSeuhbKBMCYFiGa1R/x4kWAv67LG4P5QAZhXiWdkUvDIjLbIcPoRB8EZxY9lQOXMBRSIqfa3VB5T33p+tPTeewtewvsSacU/rOeOPNvhHfELtl24fd3oMOmcRCHW9aiuVS2Q7oUXDBvkwUpYBRIYLxrpkKImWS5XI0pKSRs9ROf7lcETF7PuiKHvj3L+j6luOh6ba4CqLntxXhjb2/L0w9iU6KPycpbVlDRxVrMqAe0dRcpxhPMMNUyRIM+R97TOY0ixT8h8vgq01yRDd6/BuxF2jKbvKKKI944UmhXpgMJLp9oRzSlEm/FRp42uwAkR7CAuw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65af6d10-6915-4dc4-f4b0-08d78421f4b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 01:22:46.9074
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /4kMGx9lFgZGlF49PulkCX/M7uSaTzHCMrBMFsgkEbO3d6JFhS07E4YqnBl4Zu79DOfnRyiYHhjpN0iioi21Hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2806
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[AMD Official Use Only - Internal Distribution Only]

Hi Stephen,

Sorry for the inconvenience. How I can fix this?

Regards,
Guchun

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>=20
Sent: Thursday, December 19, 2019 5:26 AM
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>; Linux Kernel Mail=
ing List <linux-kernel@vger.kernel.org>; Chen, Guchun <Guchun.Chen@amd.com>
Subject: linux-next: Fixes tag needs some work in the amdgpu tree

Hi all,

In commit

  caa01659028a ("drm/amdgpu: move umc offset to one new header file for Arc=
turus")

Fixes tag

  Fixes: 9686563c4c42 drm/amdgpu: Added RAS UMC error query support for Arc=
turus

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: 4cf781c24c3b ("drm/amdgpu: Added RAS UMC error query support for Arc=
turus")

Also, please keep all the tags together at the end of the commit message.

--=20
Cheers,
Stephen Rothwell
