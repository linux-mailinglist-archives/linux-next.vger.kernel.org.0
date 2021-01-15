Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5FD02F7489
	for <lists+linux-next@lfdr.de>; Fri, 15 Jan 2021 09:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728828AbhAOIrY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jan 2021 03:47:24 -0500
Received: from mail-bn8nam12on2076.outbound.protection.outlook.com ([40.107.237.76]:4193
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726918AbhAOIrX (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 15 Jan 2021 03:47:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/C6HSTBk3HSrY9BdYRiQqo4vYS5YbboRWMNLnH5qe/V05HUW+4lWuHCW1ZVCkiYfhAtIRS+G/cUF18qlCOsz8b5CptKlkwRZx4q3FK5W19ZKQMJIxwoP9VcuLbjCaw3kVIxPl2zEbtcW4wr5a1cqEg0lz6Ass8Ps5PGoW/lgHwXaquf6N2aIzgjRWzjkTV7hg3m2dQcs3H/ovpdmqCyd7NFCzy36SzAGZRCGH9Z1q0ouxLpuaGN3sFirqcxkE+qXawcBkVuMZbYLfENS68ht8ijouO/IihRyL76tAq9+M9Nt7RPDdpuo2K8UtxUf35rcUmy75fetDNn67WZHOFzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gibltRWGC2Vtzb8rY7wj9IWP493FM8RcHRGVnGNyA5g=;
 b=U4/IgJT7/pDSgKwoGiXLdYMQgeuxVxR+LoB1LB54+qeVQ3emAZA0yE5N24e087U0Rtsejl73FSv/zTeN1QR6gp6mSsdtlKiQYhbl1aaRQy/O6cOIFFnrKkEeOaKBK160rrKEnBLLhoBEhKXyYGQAVWWXEgmuUyt97u5QSR3kPzAWF/CJhcrq4ovhsWEM2YDbFsIYj0Rwoke2rZacFxQvMmW2BA/gz/Q+dbR9QRm96F07e5zcz2V3QmU+RvIPET4xjAf3tnr9x9NG9SsfgeIh6BylkgFksDMYVI/tB5I4WayVkE+qZY2cHUuQjv7ZenIliGOR1FkjxhXM9L0j2HtpCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gibltRWGC2Vtzb8rY7wj9IWP493FM8RcHRGVnGNyA5g=;
 b=mE4dCIejqwIgi4wlxZ3H39bul06V+bdfBKDahN4TQJS0mA2MI8dh3+weyG80OkRRhAECTKpftd95k7NPuY2i/HwobOXO4aGniQg5mh9HcjOL4FpT1hfvwS1s3PtDykac4klgf1HrFFOAPM8K2/zc1sKwd8zNACPkChsxK3H/bDo=
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (10.169.206.21) by
 MWHPR12MB1742.namprd12.prod.outlook.com (10.175.55.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.11; Fri, 15 Jan 2021 08:46:27 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3763.011; Fri, 15 Jan 2021
 08:46:27 +0000
From:   "Huang, Ray" <Ray.Huang@amd.com>
To:     "Huang, Ray" <Ray.Huang@amd.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Alex Deucher <alexdeucher@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the amdgpu tree
Thread-Topic: linux-next: build failure after merge of the amdgpu tree
Thread-Index: AQHW6wAz5jWsEJAWsU+uxd0S/QkEBaooMH2AgAAvJiA=
Date:   Fri, 15 Jan 2021 08:46:27 +0000
Message-ID: <MWHPR12MB12481AE693629C4F60368519ECA70@MWHPR12MB1248.namprd12.prod.outlook.com>
References: <20210115163505.4132a5b3@canb.auug.org.au>
 <20210115055703.GA1258199@hr-amd>
In-Reply-To: <20210115055703.GA1258199@hr-amd>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-01-15T08:45:51Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=f2626587-54a5-4312-90c2-00004060ebdc;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2021-01-15T08:46:24Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: cf73a174-5e64-4a4d-a3ff-0000ac5dc2ea
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
dlp-product: dlpe-windows
dlp-version: 11.6.0.76
dlp-reaction: no-action
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32084c10-c326-436c-5f6e-08d8b9320c12
x-ms-traffictypediagnostic: MWHPR12MB1742:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR12MB1742A32D801C6971F68E3868ECA70@MWHPR12MB1742.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9UOWOp5jGLimMV9f8ZxJIKM4U6ilGhwFEsW6DpKiP2JgzGOSlvHfofWrdmm+JienzynEZCipSQiHNl+bMMGKYA+BY8utWl1q8fK6JA3ptoa8rO162FSi/hi3PaZ0GFOAglbK0GlcAwSKIVm8lfJ3bjtmEnm52kF6IaxHA0G8EfCNtI++K6vE6SemesL4n0ZWsPXggNIGGhNs0mD48JnRxtbsmkCPYOgWOa1VvApL3kMzhyevujIf/pcoDuQbPnJEhEmrdlHeS/hCsoybTHwDR8F6qbYC2lYwenXNL/KRQ4dSty9I0frB9wfpGFn+7kJGbrViu1fGUMt2CUy2RRgnhmCgN4d4EVrAat8sNizpd3hMRQokbDr6Xv8VEnAU1aBSBtoqBpjTiKqbKwuSvudMUA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR12MB1248.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(9686003)(52536014)(66616009)(66476007)(71200400001)(26005)(33656002)(66556008)(7696005)(2906002)(53546011)(8676002)(66946007)(8936002)(6506007)(4326008)(55016002)(66446008)(64756008)(316002)(478600001)(110136005)(86362001)(99936003)(5660300002)(83380400001)(54906003)(186003)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?WjtTxuPr+hhG4jUD7kL/w3h3WnCp99ORO0Li3GiAKL5hxbYjZFDCuw0br62w?=
 =?us-ascii?Q?8UFqHWOG9eRacuyyo0xx01LpBHH+UAs8W5YNAQz7dSvRjisVYC3B7VveMcDq?=
 =?us-ascii?Q?EmMsHC8HHJuveWTnMogNE4N4msWPEGN/xgk/oS1+khcEAgrwxXE7q4X/OMtT?=
 =?us-ascii?Q?F72zkMcsjdd37fczOo/Xn5m/vLP2H6YhjVzY/3H2qZqyZR6x3CURnptJAEpa?=
 =?us-ascii?Q?SK85u4U0GHbqa+ssATtwnIMxlQZR+zWrLj/4uQ2UTirRxgah8HNVv4br9+id?=
 =?us-ascii?Q?GYuKGXTQ0Ycwqqqa1y51GIv2ilc4ygp5AXXWnFkF7paXCaWd9j7TwUxtCCsU?=
 =?us-ascii?Q?pHdkExfTjaq3o9ksQG5yIyUDzTNs9R7LkjJyBzZ6QDmUFjsUIDcQltWbts7R?=
 =?us-ascii?Q?wbK4FUDxV4vdZ7TES2+FMFeqniMZ6HPDCyUsEE8QwPE5ioEuQNTVfxcgnTsX?=
 =?us-ascii?Q?JnqUJWVVu/3GGgIGhWd+j+Nq6tofZ4euH0Cq18fSsaCyUpTU+mAAKQS1wJUC?=
 =?us-ascii?Q?nAUJYj/hbfY3g16GEUmOCdJCRRCe0QXV7WwISgv5Kods+fAijggwOnwuDCj2?=
 =?us-ascii?Q?MjudVOZ8W3hkOTxZXtfmy2AU9gHYOwkAw12oexAM5ORTsGTF8GMUjKEU4tSp?=
 =?us-ascii?Q?mk3X2pLrDVyhXogcEgJDciMh+cVBHTF81ZIR8ZmzaZPHloiRqybdfiY/LZhx?=
 =?us-ascii?Q?HAXE0e0VkuUgDBKFZ72xINPPulxT/eqjxR6KvfCEMD7BblBQ5FgUHp7q/kPc?=
 =?us-ascii?Q?bTsysuGLjwx7jEFj9lbMx0gJaF5dGrS7L3iRXTm4vVGMZEz29zL40h+atZgp?=
 =?us-ascii?Q?je2TBuqKbT94qpu/7fZKj8XHXUlXbogDWg2zG8qXZBjhiWd/Xv4Di9qr2Gw5?=
 =?us-ascii?Q?bQPZs2lwEOoZkHS5Pv4EWkS0VeRgua6E2gyp0EUgyhGSfALUZgaFCf5N7fp/?=
 =?us-ascii?Q?L0g0TwdhcnfucaH6xEiUEp7/Te2+nrWGx4x2J3+Qjcs=3D?=
Content-Type: multipart/mixed;
        boundary="_002_MWHPR12MB12481AE693629C4F60368519ECA70MWHPR12MB1248namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32084c10-c326-436c-5f6e-08d8b9320c12
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2021 08:46:27.3799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1vSe2KoMmSFKSPsTjfZNlme9kWSCkjeu/k0v/NwJ0+PQenFrlaViFAil0BkKpyqrdJiUmtAkbMtAICXdHwGnUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1742
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--_002_MWHPR12MB12481AE693629C4F60368519ECA70MWHPR12MB1248namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

Could you please help to check whether this patch can fix the issue?

Thanks,
Ray

-----Original Message-----
From: Huang, Ray <ray.huang@amd.com>=20
Sent: Friday, January 15, 2021 1:57 PM
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alex Deucher <alexdeucher@gmail.com>; Linux Kernel Mailing List <linux-=
kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.or=
g>
Subject: Re: linux-next: build failure after merge of the amdgpu tree

On Fri, Jan 15, 2021 at 01:35:05PM +0800, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the amdgpu tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function '=
vangogh_get_smu_metrics_data':
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:300:10: error:=
 'boot_cpu_data' undeclared (first use in this function); did you mean 'boo=
t_cpuid'?

Ah, vangogh is an x86 cpu, let me look at this issue.

Could you share me the config file you tested?

Thanks,
Ray

>   300 |          boot_cpu_data.x86_max_cores * sizeof(uint16_t));
>       |          ^~~~~~~~~~~~~
>       |          boot_cpuid
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function '=
vangogh_read_sensor':
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1320:11: error=
: 'boot_cpu_data' undeclared (first use in this function); did you mean 'bo=
ot_cpuid'?
>  1320 |   *size =3D boot_cpu_data.x86_max_cores * sizeof(uint16_t);
>       |           ^~~~~~~~~~~~~
>       |           boot_cpuid
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function '=
vangogh_od_edit_dpm_table':
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1460:19: error=
: 'boot_cpu_data' undeclared (first use in this function); did you mean 'bo=
ot_cpuid'?
>  1460 |   if (input[0] >=3D boot_cpu_data.x86_max_cores) {
>       |                   ^~~~~~~~~~~~~
>       |                   boot_cpuid
>=20
> Caused by commits
>=20
>   517cb957c43b ("drm/amd/pm: implement the processor clocks which read by=
 metric")
>   0d90d0ddd10e ("drm/amd/pm: implement processor fine grain feature for v=
angogh (v3)")
>=20
> The only thing I could do easily is to disable CONFIG_DRM_AMDGPU for toda=
y.
>=20
> --=20
> Cheers,
> Stephen Rothwell


--_002_MWHPR12MB12481AE693629C4F60368519ECA70MWHPR12MB1248namp_
Content-Type: application/octet-stream;
	name="0001-drm-amdgpu-fix-build-error-without-x86-kconfig.patch"
Content-Description: 0001-drm-amdgpu-fix-build-error-without-x86-kconfig.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-fix-build-error-without-x86-kconfig.patch";
	size=5081; creation-date="Fri, 15 Jan 2021 08:46:00 GMT";
	modification-date="Fri, 15 Jan 2021 08:46:00 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzMzI5N2RiZWQ5N2VjZGUyY2M5YjZkNzNiODgyN2UzNzk1OTU0OGZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgpEYXRlOiBG
cmksIDE1IEphbiAyMDIxIDE1OjU5OjA4ICswODAwClN1YmplY3Q6IFtQQVRDSF0gZHJtL2FtZGdw
dTogZml4IGJ1aWxkIGVycm9yIHdpdGhvdXQgeDg2IGtjb25maWcKClRoaXMgcGF0Y2ggaXMgdG8g
Zml4IGJlbG93IGJ1aWxkIGVycm9yIHdoaWxlIHdlIGFyZSB1c2luZyB0aGUga2NvbmZpZwp3aXRo
b3V0IHg4Ni4KCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211L3NtdTExL3Zh
bmdvZ2hfcHB0LmM6IEluIGZ1bmN0aW9uCid2YW5nb2doX2dldF9zbXVfbWV0cmljc19kYXRhJzoK
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQu
YzozMDA6MTA6CmVycm9yOiAnYm9vdF9jcHVfZGF0YScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGlu
IHRoaXMgZnVuY3Rpb24pOyBkaWQgeW91Cm1lYW4gJ2Jvb3RfY3B1aWQnPwogIDMwMCB8ICAgICAg
ICAgIGJvb3RfY3B1X2RhdGEueDg2X21heF9jb3JlcyAqIHNpemVvZih1aW50MTZfdCkpOwogICAg
ICB8ICAgICAgICAgIF5+fn5+fn5+fn5+fn4KICAgICAgfCAgICAgICAgICBib290X2NwdWlkCmRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6
IEluIGZ1bmN0aW9uCid2YW5nb2doX3JlYWRfc2Vuc29yJzoKZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvLi4vcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYzoxMzIwOjExOgplcnJvcjogJ2Jv
b3RfY3B1X2RhdGEnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlk
IHlvdQptZWFuICdib290X2NwdWlkJz8KIDEzMjAgfCAgICpzaXplID0gYm9vdF9jcHVfZGF0YS54
ODZfbWF4X2NvcmVzICogc2l6ZW9mKHVpbnQxNl90KTsKICAgICAgfCAgICAgICAgICAgXn5+fn5+
fn5+fn5+fgogICAgICB8ICAgICAgICAgICBib290X2NwdWlkCmRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1Ly4uL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmM6IEluIGZ1bmN0aW9uCid2YW5n
b2doX29kX2VkaXRfZHBtX3RhYmxlJzoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0v
c3dzbXUvc211MTEvdmFuZ29naF9wcHQuYzoxNDYwOjE5OgplcnJvcjogJ2Jvb3RfY3B1X2RhdGEn
IHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdQptZWFuICdi
b290X2NwdWlkJz8KIDE0NjAgfCAgIGlmIChpbnB1dFswXSA+PSBib290X2NwdV9kYXRhLng4Nl9t
YXhfY29yZXMpIHsKICAgICAgfCAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+CiAgICAg
IHwgICAgICAgICAgICAgICAgICAgYm9vdF9jcHVpZAoKUmVwb3J0ZWQtYnk6IFN0ZXBoZW4gUm90
aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1PgpTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJh
eS5odWFuZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vYW1kZ3B1X3BtLmMg
ICAgICAgICAgICAgICB8ICA0ICsrLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2FtZGdw
dV9zbXUuaCAgICAgICAgICB8ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211
MTEvdmFuZ29naF9wcHQuYyB8IDE2ICsrKysrKysrKysrLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL2FtZGdwdV9wbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVf
cG0uYwppbmRleCA4MGQ2Mjk4OTEyYWEuLmU5YjU2OWI3NjcxNiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bt
L2FtZGdwdV9wbS5jCkBAIC0zNjMzLDEyICszNjMzLDEyIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9k
ZWJ1Z2ZzX3ByaW50c19jcHVfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sCiAJaW50IGk7CiAKIAlp
ZiAoaXNfc3VwcG9ydF9jY2xrX2RwbShhZGV2KSkgewotCQlwX3ZhbCA9IGtjYWxsb2MoYm9vdF9j
cHVfZGF0YS54ODZfbWF4X2NvcmVzLCBzaXplb2YodWludDE2X3QpLAorCQlwX3ZhbCA9IGtjYWxs
b2MoYWRldi0+c211LmNwdV9jb3JlX251bSwgc2l6ZW9mKHVpbnQxNl90KSwKIAkJCQlHRlBfS0VS
TkVMKTsKIAogCQlpZiAoIWFtZGdwdV9kcG1fcmVhZF9zZW5zb3IoYWRldiwgQU1ER1BVX1BQX1NF
TlNPUl9DUFVfQ0xLLAogCQkJCQkgICAgKHZvaWQgKilwX3ZhbCwgJnNpemUpKSB7Ci0JCQlmb3Ig
KGkgPSAwOyBpIDwgYm9vdF9jcHVfZGF0YS54ODZfbWF4X2NvcmVzOyBpKyspCisJCQlmb3IgKGkg
PSAwOyBpIDwgYWRldi0+c211LmNwdV9jb3JlX251bTsgaSsrKQogCQkJCXNlcV9wcmludGYobSwg
Ilx0JXUgTUh6IChDUFUlZClcbiIsCiAJCQkJCSAgICoocF92YWwgKyBpKSwgaSk7CiAJCX0KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2FtZGdwdV9zbXUuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvcG0vaW5jL2FtZGdwdV9zbXUuaAppbmRleCAyNWVlOWY1MTgxM2IuLmZi
Zjg4ZGYxMWExMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9pbmMvYW1kZ3B1
X3NtdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vaW5jL2FtZGdwdV9zbXUuaApAQCAt
NDcxLDYgKzQ3MSw3IEBAIHN0cnVjdCBzbXVfY29udGV4dAogCXVpbnQzMl90IGNwdV9hY3R1YWxf
c29mdF9taW5fZnJlcTsKIAl1aW50MzJfdCBjcHVfYWN0dWFsX3NvZnRfbWF4X2ZyZXE7CiAJdWlu
dDMyX3QgY3B1X2NvcmVfaWRfc2VsZWN0OworCXVpbnQxNl90IGNwdV9jb3JlX251bTsKIH07CiAK
IHN0cnVjdCBpMmNfYWRhcHRlcjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0v
c3dzbXUvc211MTEvdmFuZ29naF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUv
c211MTEvdmFuZ29naF9wcHQuYwppbmRleCAyZjBjYjBlYTI0M2IuLmYxMjdkMDJjNjdkYiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYwpA
QCAtMjk3LDcgKzI5Nyw3IEBAIHN0YXRpYyBpbnQgdmFuZ29naF9nZXRfc211X21ldHJpY3NfZGF0
YShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJYnJlYWs7CiAJY2FzZSBNRVRSSUNTX0FWRVJB
R0VfQ1BVQ0xLOgogCQltZW1jcHkodmFsdWUsICZtZXRyaWNzLT5Db3JlRnJlcXVlbmN5WzBdLAot
CQkgICAgICAgYm9vdF9jcHVfZGF0YS54ODZfbWF4X2NvcmVzICogc2l6ZW9mKHVpbnQxNl90KSk7
CisJCSAgICAgICBzbXUtPmNwdV9jb3JlX251bSAqIHNpemVvZih1aW50MTZfdCkpOwogCQlicmVh
azsKIAlkZWZhdWx0OgogCQkqdmFsdWUgPSBVSU5UX01BWDsKQEAgLTMzNSw2ICszMzUsMTIgQEAg
c3RhdGljIGludCB2YW5nb2doX2luaXRfc21jX3RhYmxlcyhzdHJ1Y3Qgc211X2NvbnRleHQgKnNt
dSkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCisjaWYgQ09ORklHX1g4NgorCXNtdS0+Y3B1
X2NvcmVfbnVtID0gYm9vdF9jcHVfZGF0YS54ODZfbWF4X2NvcmVzOworI2Vsc2UKKwlzbXUtPmNw
dV9jb3JlX251bSA9IDQ7CisjZW5kaWYKKwogCXJldHVybiBzbXVfdjExXzBfaW5pdF9zbWNfdGFi
bGVzKHNtdSk7CiB9CiAKQEAgLTEzMTcsNyArMTMyMyw3IEBAIHN0YXRpYyBpbnQgdmFuZ29naF9y
ZWFkX3NlbnNvcihzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKIAkJcmV0ID0gdmFuZ29naF9nZXRf
c211X21ldHJpY3NfZGF0YShzbXUsCiAJCQkJCQkgICBNRVRSSUNTX0FWRVJBR0VfQ1BVQ0xLLAog
CQkJCQkJICAgKHVpbnQzMl90ICopZGF0YSk7Ci0JCSpzaXplID0gYm9vdF9jcHVfZGF0YS54ODZf
bWF4X2NvcmVzICogc2l6ZW9mKHVpbnQxNl90KTsKKwkJKnNpemUgPSBzbXUtPmNwdV9jb3JlX251
bSAqIHNpemVvZih1aW50MTZfdCk7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCXJldCA9IC1FT1BO
T1RTVVBQOwpAQCAtMTQ1Nyw5ICsxNDYzLDkgQEAgc3RhdGljIGludCB2YW5nb2doX29kX2VkaXRf
ZHBtX3RhYmxlKHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIFBQX09EX0RQTV9UQUIKIAkJ
CWRldl9lcnIoc211LT5hZGV2LT5kZXYsICJJbnB1dCBwYXJhbWV0ZXIgbnVtYmVyIG5vdCBjb3Jy
ZWN0IChzaG91bGQgYmUgNCBmb3IgcHJvY2Vzc29yKVxuIik7CiAJCQlyZXR1cm4gLUVJTlZBTDsK
IAkJfQotCQlpZiAoaW5wdXRbMF0gPj0gYm9vdF9jcHVfZGF0YS54ODZfbWF4X2NvcmVzKSB7CisJ
CWlmIChpbnB1dFswXSA+PSBzbXUtPmNwdV9jb3JlX251bSkgewogCQkJZGV2X2VycihzbXUtPmFk
ZXYtPmRldiwgImNvcmUgaW5kZXggaXMgb3ZlcmZsb3csIHNob3VsZCBiZSBsZXNzIHRoYW4gJWRc
biIsCi0JCQkJYm9vdF9jcHVfZGF0YS54ODZfbWF4X2NvcmVzKTsKKwkJCQlzbXUtPmNwdV9jb3Jl
X251bSk7CiAJCX0KIAkJc211LT5jcHVfY29yZV9pZF9zZWxlY3QgPSBpbnB1dFswXTsKIAkJaWYg
KGlucHV0WzFdID09IDApIHsKQEAgLTE1MzUsNyArMTU0MSw3IEBAIHN0YXRpYyBpbnQgdmFuZ29n
aF9vZF9lZGl0X2RwbV90YWJsZShzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwgZW51bSBQUF9PRF9E
UE1fVEFCCiAJCQkJYnJlYWs7CiAJCQl9CiAKLQkJCWZvciAoaSA9IDA7IGkgPCBib290X2NwdV9k
YXRhLng4Nl9tYXhfY29yZXM7IGkrKykgeworCQkJZm9yIChpID0gMDsgaSA8IHNtdS0+Y3B1X2Nv
cmVfbnVtOyBpKyspIHsKIAkJCQlyZXQgPSBzbXVfY21uX3NlbmRfc21jX21zZ193aXRoX3BhcmFt
KHNtdSwgU01VX01TR19TZXRTb2Z0TWluQ2NsaywKIAkJCQkJCQkJICAgICAgKGkgPDwgMjApIHwg
c211LT5jcHVfYWN0dWFsX3NvZnRfbWluX2ZyZXEsCiAJCQkJCQkJCSAgICAgIE5VTEwpOwotLSAK
Mi4yNS4xCgo=

--_002_MWHPR12MB12481AE693629C4F60368519ECA70MWHPR12MB1248namp_--
