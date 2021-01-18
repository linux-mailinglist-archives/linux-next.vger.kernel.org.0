Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 609F62F9997
	for <lists+linux-next@lfdr.de>; Mon, 18 Jan 2021 06:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731893AbhARF53 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Jan 2021 00:57:29 -0500
Received: from mail-dm6nam12on2042.outbound.protection.outlook.com ([40.107.243.42]:37281
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731743AbhARF5P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 18 Jan 2021 00:57:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wl9MyyeuWHy5BXs0IUH7454bKAiryOOoWrgRPHvMkfYBjUzg/9ljghO7HxBnMhSOw8bsSRaR2BQP1QgzX7Y3e099u36HlljUeeVzBHfX2YsBp1VEhyuKv4SIPw/cIUvzyWUIpUrl+xv5HaHYJHgvLXrnfxw+PFFcw5MsKopWYvrHCyhOlM8dxezVn7zqfDROsnmRJGZ7j5RGl5+K1eLzV5XNqpF6P8/YpyL4qNGwKQlUqhYgKcx2JBly5eg543SPczyac+Iteh3gB+/ZwcZo+t/gpDZwh7GUmb7Jn0DgChI5DRyk6h6eMgB9wMUI0bbAlQBsdMlvZDXdwOfv4KcOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3WAY7+3AQjvngDisGroLW/rq55QjuD2EUR9ESsnPiU=;
 b=Xo0si9jikPqPFbIaXg/2A8UiO+ntYOcmtaKZYEChnQyb2wVWjYmECNowo8X/jevJ9D8WCKqKLRPX25yg/AadkBF8ajmHWigbZeAVqjhasxzvh9jtp7CZtYe9hXbDIc1mM9URkapDcFDues+rED4mwlvkwFJAK50fXAuDQqNeOO9XAEB8YKeVnKCV9HUg75vkxVI/ctvlVnHOSzo4n5U4tzOu9tqKrs+p5LZ+QOsRguDprXQq0mFZSSI84DwwPEHWwDAOyG9e3dtSiGkqm4Bwd2eeagnelleZImd+4xltu+AYReLcEvW+gv5wRCSUy6yh0JLHFygT9cejLfohiHKySA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A3WAY7+3AQjvngDisGroLW/rq55QjuD2EUR9ESsnPiU=;
 b=3AVISX2ClRMtPf+syo/th+QW35PPF7tq3ZB6VoCauSb1HKxd7pqewHYTmRqUWf8ZT3KsDyLnLmDvlw+Z924MlfBCl9bq3WAgEwYxbrLwy3LIQscNtNgRv/ABGdoq/XZi2sW+xs/JDo5QO1j9baAEV7KDXUO8M/CFZwXQMdAau0c=
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR12MB1184.namprd12.prod.outlook.com (2603:10b6:300:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 05:56:21 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 05:56:20 +0000
From:   "Huang, Ray" <Ray.Huang@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexdeucher@gmail.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHW7Vrjx5RD0EnisECY1uRE13ZD9qos4bwA
Date:   Mon, 18 Jan 2021 05:56:20 +0000
Message-ID: <MWHPR12MB12481D121098DD37D4CB10F4ECA40@MWHPR12MB1248.namprd12.prod.outlook.com>
References: <20210118162919.51f2dd3a@canb.auug.org.au>
In-Reply-To: <20210118162919.51f2dd3a@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-01-18T05:56:14Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=88c0d5e8-3c76-4ee0-8899-00007c7c0222;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2021-01-18T05:56:18Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: a7daf908-0c49-4ec8-8b33-000023ef9a3b
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 333f2461-9429-4744-1ee7-08d8bb75c7b2
x-ms-traffictypediagnostic: MWHPR12MB1184:
x-microsoft-antispam-prvs: <MWHPR12MB118422BC9365D60D73B10109ECA40@MWHPR12MB1184.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:45;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jtbUHU+f0Ic8UncKFyDMqLyw6Xmfa+95BJTcyUIpSNqRnaM3m5wZ+BRCGenU9AQW6HaZ+T+bkLRcMb/JcvepebJQt7gpEKDwLyssG13YoEtOB39j3harqlbVXp+lEMZC8Y520JbuRKGGslgEfRso7xK1nDqNNb61guql0gzKXOszaGRBzJG9HLfTnWXyZUpJZPo6mp78fVRs/N4F7FgYlBOxvKCFZS8kHkiKkWdc+0Ku8NwrdGVXOsQWD20zOAl+MnkMZg6dUnGdF6hUS+ArV61ZL0fU/AqtRCgMP77ITWLcItwy8CHjtIKC967ouAmNtAkQC4rbLoAdV0sJwbMF9ZVTtP+Ibsusay7Icq0NWDiaTT8CarABGzfc+Qb0PiXoeEcov0SkyhwThWeussB7iw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR12MB1248.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(26005)(9686003)(4744005)(64756008)(66446008)(4326008)(66476007)(99936003)(66556008)(2906002)(33656002)(66946007)(55016002)(76116006)(478600001)(186003)(66616009)(52536014)(83380400001)(7696005)(6506007)(54906003)(86362001)(5660300002)(53546011)(71200400001)(8936002)(316002)(110136005)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?l3I5O54Y4So5d4LG/6KF231C34m+U0qlEvshKYhm4D4AtkAYZmqoGDrgBYd9?=
 =?us-ascii?Q?Jr3G3aF9soVg50+08/HjehXfHHKlCnZmGMvgdyAqTe/eIhBeg3JvhbYHRhgq?=
 =?us-ascii?Q?b/UDG7Fko6iZT2FOC1SRQtMCHJ/ExGSeBwWjbtfKgWvv1qHmfUiwYJDfkVoM?=
 =?us-ascii?Q?jtK8VY4vo7AGS1qOcr3DaxCmRPT4VwqlAflc4QssIrPd5pVN3UzAYz0bmQXU?=
 =?us-ascii?Q?CNb9brd77dd8R3pclGHa2WNrv2C8Na5N7wErGQbXPzTg/RZptUcstZL196IZ?=
 =?us-ascii?Q?Dy9DofqwBl7hVCr7kF+N/Sj9PgNj/aP+S7PmTz0ScVa5otFnfHvTcMuiidWR?=
 =?us-ascii?Q?rvBB6nJLXiV4lRTkX19oiXeJhn6VNgP55sjtG3zGZ2dhOeJnnf4+b1nRxljg?=
 =?us-ascii?Q?4vpjgCHY5sKfh9a8MoTOHYz/qdNXTVzC6Y/+z2qRm1vuJTsHjdsw5ehG4+PJ?=
 =?us-ascii?Q?BG4nUgzEemsbxImRkFOypmAIogxtwMiz6+HUuD0t9+3vyg0A3E5gxOwg0k4J?=
 =?us-ascii?Q?jt648JYG4eePb2wp+ERX1rpzUgdIhyJDdI4At8WeYO3f62PW5wzz7fDGgHOX?=
 =?us-ascii?Q?nfC4awo6UbP1OCCGmX6hSELwxw7Yt4eUIeD22NH6xhCkL3fw8toiGufNIFpR?=
 =?us-ascii?Q?dCtD+7gFIoox+uqk2OcMjaSL8kEYThXInpn10WNCih4GBDW3xIjz80yczccp?=
 =?us-ascii?Q?O5J+on33S3odS1oPHQ7750T7YFGpk3MwFb2fFYqZN9e+aD3vbHeauWBdTk7G?=
 =?us-ascii?Q?Pfn7tUCWLLWYPtFS5gVevVvaFFYJ9jqyZ6UMFELOjgP4JMAbc1HB73foI1cA?=
 =?us-ascii?Q?kqN1T9Ld1YnbRckz03opOYMBG7XtBDdXsoT6EOrsTCFYUe6aeH2o/Pvw9TXZ?=
 =?us-ascii?Q?NxcDNFFJvdEkFMCwCFfMCFKmUlt5YCbuhGG0TEf46UjaMlY6mUsi6YTGZpjd?=
 =?us-ascii?Q?cSFPiLetRIQk+OtnuAz6IWhL8H9cnFT9wpre88sW9cg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
        boundary="_002_MWHPR12MB12481D121098DD37D4CB10F4ECA40MWHPR12MB1248namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 333f2461-9429-4744-1ee7-08d8bb75c7b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2021 05:56:20.7652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SMApgL7/dgAGpk2QPxhDe+LSzvgRIYWHFwU6s4YuUYcxdl3Hil/VoDcIPZAVoi2OaxdmYd+rXESxd+zGiXLBow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1184
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--_002_MWHPR12MB12481D121098DD37D4CB10F4ECA40MWHPR12MB1248namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

Thanks Setphen. Please check attached V2 patch.
(If you can share the config file to me, I can do the test in my side)

Best Regards,
Ray

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>=20
Sent: Monday, January 18, 2021 1:29 PM
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Huang, Ray <Ray.Huang@amd.com>; Linux Kernel Mailing List <linux-kernel=
@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the amdgpu tree

Hi all,

After merging the amdgpu tree, today's linux-next build (powerpc
allyesconfig) gave this warning:

drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'va=
ngogh_init_smc_tables':
drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:338:5: warning: =
"CONFIG_X86" is not defined, evaluates to 0 [-Wundef]
  338 | #if CONFIG_X86
      |     ^~~~~~~~~~

Caused by commit

  9dd19d5232a6 ("drm/amdgpu: fix build error without x86 kconfig")

--=20
Cheers,
Stephen Rothwell

--_002_MWHPR12MB12481D121098DD37D4CB10F4ECA40MWHPR12MB1248namp_
Content-Type: application/octet-stream;
	name="0001-drm-amdgpu-fix-build-error-without-x86-kconfig-v2.patch"
Content-Description:
 0001-drm-amdgpu-fix-build-error-without-x86-kconfig-v2.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-fix-build-error-without-x86-kconfig-v2.patch";
	size=5386; creation-date="Mon, 18 Jan 2021 05:55:00 GMT";
	modification-date="Mon, 18 Jan 2021 05:55:00 GMT"
Content-Transfer-Encoding: base64

RnJvbSAyOTYzMmRmODQ1OGI1NDliMzJlYjY1NWQ2ZTc1YzQ3ZDY2Y2VkODVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpEYXRlOiBG
cmksIDE1IEphbiAyMDIxIDE1OjU5OjA4ICswODAwClN1YmplY3Q6IFtQQVRDSCB2Ml0gZHJtL2Ft
ZGdwdTogZml4IGJ1aWxkIGVycm9yIHdpdGhvdXQgeDg2IGtjb25maWcgKHYyKQoKVGhpcyBwYXRj
aCBpcyB0byBmaXggYmVsb3cgYnVpbGQgZXJyb3Igd2hpbGUgd2UgYXJlIHVzaW5nIHRoZSBrY29u
ZmlnCndpdGhvdXQgeDg2LgoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUv
c211MTEvdmFuZ29naF9wcHQuYzogSW4gZnVuY3Rpb24KJ3ZhbmdvZ2hfZ2V0X3NtdV9tZXRyaWNz
X2RhdGEnOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9wbS9zd3NtdS9zbXUxMS92YW5n
b2doX3BwdC5jOjMwMDoxMDoKZXJyb3I6ICdib290X2NwdV9kYXRhJyB1bmRlY2xhcmVkIChmaXJz
dCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZCB5b3UKbWVhbiAnYm9vdF9jcHVpZCc/CiAgMzAw
IHwgICAgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfbWF4X2NvcmVzICogc2l6ZW9mKHVpbnQxNl90
KSk7CiAgICAgIHwgICAgICAgICAgXn5+fn5+fn5+fn5+fgogICAgICB8ICAgICAgICAgIGJvb3Rf
Y3B1aWQKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211MTEvdmFuZ29n
aF9wcHQuYzogSW4gZnVuY3Rpb24KJ3ZhbmdvZ2hfcmVhZF9zZW5zb3InOgpkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jOjEzMjA6MTE6CmVy
cm9yOiAnYm9vdF9jcHVfZGF0YScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rp
b24pOyBkaWQgeW91Cm1lYW4gJ2Jvb3RfY3B1aWQnPwogMTMyMCB8ICAgKnNpemUgPSBib290X2Nw
dV9kYXRhLng4Nl9tYXhfY29yZXMgKiBzaXplb2YodWludDE2X3QpOwogICAgICB8ICAgICAgICAg
ICBefn5+fn5+fn5+fn5+CiAgICAgIHwgICAgICAgICAgIGJvb3RfY3B1aWQKZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYzogSW4gZnVuY3Rp
b24KJ3ZhbmdvZ2hfb2RfZWRpdF9kcG1fdGFibGUnOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8uLi9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jOjE0NjA6MTk6CmVycm9yOiAnYm9vdF9j
cHVfZGF0YScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91
Cm1lYW4gJ2Jvb3RfY3B1aWQnPwogMTQ2MCB8ICAgaWYgKGlucHV0WzBdID49IGJvb3RfY3B1X2Rh
dGEueDg2X21heF9jb3JlcykgewogICAgICB8ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn4KICAgICAgfCAgICAgICAgICAgICAgICAgICBib290X2NwdWlkCgp2MjogZml4ICNpZmRlZiBh
bmQgYWRkIGNvbW1lbnQgZm9yIEFQVSBvbmx5CgpSZXBvcnRlZC1ieTogU3RlcGhlbiBSb3Rod2Vs
bCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+ClNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1
YW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfcG0uYyAgICAgICAg
ICAgICAgfCAgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9hbWRncHVfc211Lmgg
ICAgICAgICB8ICAyICsrCiAuLi4vZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTEvdmFuZ29naF9w
cHQuYyAgICB8IDE3ICsrKysrKysrKysrKy0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE2IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9hbWRncHVfcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X3BtLmMKaW5k
ZXggODBkNjI5ODkxMmFhLi5lOWI1NjliNzY3MTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvcG0vYW1kZ3B1X3BtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVf
cG0uYwpAQCAtMzYzMywxMiArMzYzMywxMiBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZGVidWdmc19w
cmludHNfY3B1X2luZm8oc3RydWN0IHNlcV9maWxlICptLAogCWludCBpOwogCiAJaWYgKGlzX3N1
cHBvcnRfY2Nsa19kcG0oYWRldikpIHsKLQkJcF92YWwgPSBrY2FsbG9jKGJvb3RfY3B1X2RhdGEu
eDg2X21heF9jb3Jlcywgc2l6ZW9mKHVpbnQxNl90KSwKKwkJcF92YWwgPSBrY2FsbG9jKGFkZXYt
PnNtdS5jcHVfY29yZV9udW0sIHNpemVvZih1aW50MTZfdCksCiAJCQkJR0ZQX0tFUk5FTCk7CiAK
IAkJaWYgKCFhbWRncHVfZHBtX3JlYWRfc2Vuc29yKGFkZXYsIEFNREdQVV9QUF9TRU5TT1JfQ1BV
X0NMSywKIAkJCQkJICAgICh2b2lkICopcF92YWwsICZzaXplKSkgewotCQkJZm9yIChpID0gMDsg
aSA8IGJvb3RfY3B1X2RhdGEueDg2X21heF9jb3JlczsgaSsrKQorCQkJZm9yIChpID0gMDsgaSA8
IGFkZXYtPnNtdS5jcHVfY29yZV9udW07IGkrKykKIAkJCQlzZXFfcHJpbnRmKG0sICJcdCV1IE1I
eiAoQ1BVJWQpXG4iLAogCQkJCQkgICAqKHBfdmFsICsgaSksIGkpOwogCQl9CmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9hbWRncHVfc211LmggYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3BtL2luYy9hbWRncHVfc211LmgKaW5kZXggMjVlZTlmNTE4MTNiLi5hMDg3ZTAwMzgy
ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2FtZGdwdV9zbXUuaAor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL2luYy9hbWRncHVfc211LmgKQEAgLTQ2NiwxMSAr
NDY2LDEzIEBAIHN0cnVjdCBzbXVfY29udGV4dAogCXVpbnQzMl90IGdmeF9hY3R1YWxfaGFyZF9t
aW5fZnJlcTsKIAl1aW50MzJfdCBnZnhfYWN0dWFsX3NvZnRfbWF4X2ZyZXE7CiAKKwkvKiBBUFUg
b25seSAqLwogCXVpbnQzMl90IGNwdV9kZWZhdWx0X3NvZnRfbWluX2ZyZXE7CiAJdWludDMyX3Qg
Y3B1X2RlZmF1bHRfc29mdF9tYXhfZnJlcTsKIAl1aW50MzJfdCBjcHVfYWN0dWFsX3NvZnRfbWlu
X2ZyZXE7CiAJdWludDMyX3QgY3B1X2FjdHVhbF9zb2Z0X21heF9mcmVxOwogCXVpbnQzMl90IGNw
dV9jb3JlX2lkX3NlbGVjdDsKKwl1aW50MTZfdCBjcHVfY29yZV9udW07CiB9OwogCiBzdHJ1Y3Qg
aTJjX2FkYXB0ZXI7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3Nt
dTExL3ZhbmdvZ2hfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3Zh
bmdvZ2hfcHB0LmMKaW5kZXggMmYwY2IwZWEyNDNiLi5kYzQxYWJlN2IxZDMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMKQEAgLTI5Nyw3
ICsyOTcsNyBAQCBzdGF0aWMgaW50IHZhbmdvZ2hfZ2V0X3NtdV9tZXRyaWNzX2RhdGEoc3RydWN0
IHNtdV9jb250ZXh0ICpzbXUsCiAJCWJyZWFrOwogCWNhc2UgTUVUUklDU19BVkVSQUdFX0NQVUNM
SzoKIAkJbWVtY3B5KHZhbHVlLCAmbWV0cmljcy0+Q29yZUZyZXF1ZW5jeVswXSwKLQkJICAgICAg
IGJvb3RfY3B1X2RhdGEueDg2X21heF9jb3JlcyAqIHNpemVvZih1aW50MTZfdCkpOworCQkgICAg
ICAgc211LT5jcHVfY29yZV9udW0gKiBzaXplb2YodWludDE2X3QpKTsKIAkJYnJlYWs7CiAJZGVm
YXVsdDoKIAkJKnZhbHVlID0gVUlOVF9NQVg7CkBAIC0zMzUsNiArMzM1LDEzIEBAIHN0YXRpYyBp
bnQgdmFuZ29naF9pbml0X3NtY190YWJsZXMoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUpCiAJaWYg
KHJldCkKIAkJcmV0dXJuIHJldDsKIAorI2lmZGVmIENPTkZJR19YODYKKwkvKiBBTUQgeDg2IEFQ
VSBvbmx5ICovCisJc211LT5jcHVfY29yZV9udW0gPSBib290X2NwdV9kYXRhLng4Nl9tYXhfY29y
ZXM7CisjZWxzZQorCXNtdS0+Y3B1X2NvcmVfbnVtID0gNDsKKyNlbmRpZgorCiAJcmV0dXJuIHNt
dV92MTFfMF9pbml0X3NtY190YWJsZXMoc211KTsKIH0KIApAQCAtMTMxNyw3ICsxMzI0LDcgQEAg
c3RhdGljIGludCB2YW5nb2doX3JlYWRfc2Vuc29yKHN0cnVjdCBzbXVfY29udGV4dCAqc211LAog
CQlyZXQgPSB2YW5nb2doX2dldF9zbXVfbWV0cmljc19kYXRhKHNtdSwKIAkJCQkJCSAgIE1FVFJJ
Q1NfQVZFUkFHRV9DUFVDTEssCiAJCQkJCQkgICAodWludDMyX3QgKilkYXRhKTsKLQkJKnNpemUg
PSBib290X2NwdV9kYXRhLng4Nl9tYXhfY29yZXMgKiBzaXplb2YodWludDE2X3QpOworCQkqc2l6
ZSA9IHNtdS0+Y3B1X2NvcmVfbnVtICogc2l6ZW9mKHVpbnQxNl90KTsKIAkJYnJlYWs7CiAJZGVm
YXVsdDoKIAkJcmV0ID0gLUVPUE5PVFNVUFA7CkBAIC0xNDU3LDkgKzE0NjQsOSBAQCBzdGF0aWMg
aW50IHZhbmdvZ2hfb2RfZWRpdF9kcG1fdGFibGUoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsIGVu
dW0gUFBfT0RfRFBNX1RBQgogCQkJZGV2X2VycihzbXUtPmFkZXYtPmRldiwgIklucHV0IHBhcmFt
ZXRlciBudW1iZXIgbm90IGNvcnJlY3QgKHNob3VsZCBiZSA0IGZvciBwcm9jZXNzb3IpXG4iKTsK
IAkJCXJldHVybiAtRUlOVkFMOwogCQl9Ci0JCWlmIChpbnB1dFswXSA+PSBib290X2NwdV9kYXRh
Lng4Nl9tYXhfY29yZXMpIHsKKwkJaWYgKGlucHV0WzBdID49IHNtdS0+Y3B1X2NvcmVfbnVtKSB7
CiAJCQlkZXZfZXJyKHNtdS0+YWRldi0+ZGV2LCAiY29yZSBpbmRleCBpcyBvdmVyZmxvdywgc2hv
dWxkIGJlIGxlc3MgdGhhbiAlZFxuIiwKLQkJCQlib290X2NwdV9kYXRhLng4Nl9tYXhfY29yZXMp
OworCQkJCXNtdS0+Y3B1X2NvcmVfbnVtKTsKIAkJfQogCQlzbXUtPmNwdV9jb3JlX2lkX3NlbGVj
dCA9IGlucHV0WzBdOwogCQlpZiAoaW5wdXRbMV0gPT0gMCkgewpAQCAtMTUzNSw3ICsxNTQyLDcg
QEAgc3RhdGljIGludCB2YW5nb2doX29kX2VkaXRfZHBtX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4
dCAqc211LCBlbnVtIFBQX09EX0RQTV9UQUIKIAkJCQlicmVhazsKIAkJCX0KIAotCQkJZm9yIChp
ID0gMDsgaSA8IGJvb3RfY3B1X2RhdGEueDg2X21heF9jb3JlczsgaSsrKSB7CisJCQlmb3IgKGkg
PSAwOyBpIDwgc211LT5jcHVfY29yZV9udW07IGkrKykgewogCQkJCXJldCA9IHNtdV9jbW5fc2Vu
ZF9zbWNfbXNnX3dpdGhfcGFyYW0oc211LCBTTVVfTVNHX1NldFNvZnRNaW5DY2xrLAogCQkJCQkJ
CQkgICAgICAoaSA8PCAyMCkgfCBzbXUtPmNwdV9hY3R1YWxfc29mdF9taW5fZnJlcSwKIAkJCQkJ
CQkJICAgICAgTlVMTCk7Ci0tIAoyLjI1LjEKCg==

--_002_MWHPR12MB12481D121098DD37D4CB10F4ECA40MWHPR12MB1248namp_--
