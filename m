Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF80376FEB
	for <lists+linux-next@lfdr.de>; Sat,  8 May 2021 08:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhEHGCc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 8 May 2021 02:02:32 -0400
Received: from mail-bn7nam10on2079.outbound.protection.outlook.com ([40.107.92.79]:65248
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229473AbhEHGCb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 8 May 2021 02:02:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/y3XEixi2xOY+yt8KqzbqieCmLTv988MgIh0hdXpqtrX6YulEVbw3CrhfKG4+R4TimzqC5p5sAPs7QBQ+5uB+AqD9Wq7HawK1fM8xjEL4LhY83LEvH8fHsTBFUE/QE+LhNkBm2Ie2us979wZnlROm1ayqowMm6DS86sF9v8+Rm1b70EY/8fS0zc2L5osVlZTdRSdpd13A5UWo6GpVMwghXDO6YV0Rl5JRyxrsB3rAcDdN0wBqFci2QTWjG5RN/r7RErQI3nxkrbPofVOz58Oou5I9yg5aYpJSvZlGJQAj4xFAHBSNvHlD8V38g1A1UNr5HewVPMXfxJ4hIqF830iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4T9hHkyZGk3qf2B+9nYV15b5mh8mPRJRF4M2RdtR3o=;
 b=iEqac2fWBcYZEJmwc6rE7MhNK1pOdmn1o1WK2WrXP0Y+my8wraP5eQBwLqa3QeAvxUh9NChNgfQfZzuoEOQG6lxoHsITGsibb4PnGN/y+moR1FkXF8tben1TCtgg//yfbSXWELxpwbyOgSQRTwIr2nkjBfaiNDf5VvudBv/QfMnKJmao75qAYlbCu678aFNL24qiySNAtpBIP1UhWz18VQExF5hh2kAKvifNK0SoSSe/dtLoT1byaKTFJAnMt6X/FKWSShHxpM0UrdgYdMVEygBzOUQI5/MgHDtdehZ8Hl7RejwK5c9DcU+B4A/dK2n7UqahFhpAe2DilhLlih7xbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4T9hHkyZGk3qf2B+9nYV15b5mh8mPRJRF4M2RdtR3o=;
 b=sCDPeypFUwpA7x9TtG0g8Bcc3o1W0ZIHIup7EoNJAv0Sh60NoOCRb0/IbtggJXys2zaZUMciRY3ll0yr+GbRpYUcOeIVOgEfNJFEHuxKTXVRPIQ5AvG23MBLTT4azeX2nBlyMkEZe1dYp8Aw2vCSpYVm0ahXLcQ+p8lbsx1U6M0=
Received: from BN9PR12MB5161.namprd12.prod.outlook.com (2603:10b6:408:11a::15)
 by BN9PR12MB5227.namprd12.prod.outlook.com (2603:10b6:408:100::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Sat, 8 May
 2021 06:01:23 +0000
Received: from BN9PR12MB5161.namprd12.prod.outlook.com
 ([fe80::13:8bca:807:9781]) by BN9PR12MB5161.namprd12.prod.outlook.com
 ([fe80::13:8bca:807:9781%7]) with mapi id 15.20.4108.029; Sat, 8 May 2021
 06:01:23 +0000
From:   "Gu, JiaWei (Will)" <JiaWei.Gu@amd.com>
To:     Kees Cook <keescook@chromium.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
CC:     "StDenis, Tom" <Tom.StDenis@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        =?iso-8859-1?Q?Christian_K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "Nieto, David M" <David.Nieto@amd.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: RE: [PATCH] drm/amdgpu: Add vbios info ioctl interface
Thread-Topic: [PATCH] drm/amdgpu: Add vbios info ioctl interface
Thread-Index: AQHXNyAZxU02AtWA5k2SdU2Ic9ArhqrZFumAgAAY0UA=
Date:   Sat, 8 May 2021 06:01:23 +0000
Message-ID: <BN9PR12MB51616B5E43086FC4CE2B58FFF8569@BN9PR12MB5161.namprd12.prod.outlook.com>
References: <20210422023448.24689-1-Jiawei.Gu@amd.com>
 <202105072117.1480D10A@keescook>
In-Reply-To: <202105072117.1480D10A@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-05-08T06:01:03Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=a000a216-79e4-45e1-be40-b819093ddf6b;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: I confirm the recipients are approved for sharing this
 content
authentication-results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 524ce2e5-1057-4925-2cce-08d911e6b58a
x-ms-traffictypediagnostic: BN9PR12MB5227:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR12MB52274DA0C59F901778A817EEF8569@BN9PR12MB5227.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OZW3BI2XVJ2BEAhWsdEoqz1QYqAj6eBLLwmr+sHsHum4pfm/wDCkBa1pYNNsD5dzQCUC1i4fiqVO4a6MrhmMvnDSWaXJEntVL8S3R1MKY/fIwjPdLpHED/lpqUH9Ty9VwBvbGYGpYWLSMAJ1di+v8RAjPVeCpeQ3Q2bbJu0GkR/R/yss4uOljlnYvE51vjVxOPaQh2bXLgy0zqIfwFAFmAX+Y60yR7aSVTovYAdyTSVufoZ2sKOCgjEgJjqh1Ci5qT1J74yGcyVKf8ZJKLhg77f+eOhnNg/YiSNemGZKcM8YFXB7D1ByHvxSEnJTXlFl7GsDA4tKiFcz+tTUQDJ5eGeJAADVr/8VnJkKL2gl1MFLkqxx/SOueflquIgJtXUWvsErK1wLSZaf4USXGY+13sx8itJ8wwN2DRM2c8Wa/GibUkpjjoqad4tpskAzNXQZxwfBJ2NUpA0pQV80p7suoGfbaGmIW6X3hYOih7uqMTGevntpugzSS9Ja9Sctolw5Q00J7srmD5xEeQaVBbGCrEnPllTEWLPTN0hcCUd6Z+KutHyTbgRCMt5oJJbNaHfjBKc36xADhCjVuILsdPYrzh+9ra9MATIDAv6FByweZYQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39850400004)(346002)(396003)(6636002)(8676002)(38100700002)(2906002)(122000001)(8936002)(4326008)(83380400001)(6506007)(53546011)(55016002)(9686003)(66556008)(64756008)(76116006)(66476007)(66946007)(26005)(7696005)(5660300002)(86362001)(52536014)(186003)(66446008)(478600001)(110136005)(33656002)(316002)(54906003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?qkMPC47ekd5l7efzHPNe9NonaxL70Jumg3vRM12mFFZi9y2SmE7WVUPq8f?=
 =?iso-8859-1?Q?NsJ0mJKVI/HUwOhhGTDS8lHhdOfEd9SQv6zkPt+RFBALnPz/O4qMY5FuFW?=
 =?iso-8859-1?Q?KQ06MhGzenLyxtEZe8hPFYkRdUslB8c7gG3bmSUpeNiX2uPFU+D3wLdYBS?=
 =?iso-8859-1?Q?MBlPwqF3afEGq+ApfadbT6fIPgdGcuEeYW/GJEzMVFJJsxHVxbU+pMnd88?=
 =?iso-8859-1?Q?p4jnSCk9tz08Hfij+as/wfEcjJicfVgDzoqMPUSm0FZViHTFFnDfd6KmnT?=
 =?iso-8859-1?Q?Sc8X27I9M2+wMrQYx7U0GfiW4+gAbfaU7P+r9Ev9yM5n8KjzVG8YzUjASC?=
 =?iso-8859-1?Q?c2t+ojx4WYKVFPe3Orl0Rz78lRvJ8y7NJDdQvxrBjtRLlvJ/ZKoxe8dcu1?=
 =?iso-8859-1?Q?reXZLhe3dFSeMu7/G+tsjilUzqGmsnzApH8QGQorn+c3JGxf13RIVPczmo?=
 =?iso-8859-1?Q?GxdZngY8OpHwCzXeIiR2gidJChdEF63zeoMmLYxj2ux7BVGP7vK/gDxpBX?=
 =?iso-8859-1?Q?xQdpfShTVDU4KAuna/zygLKk++s8NGR5ESioJjAwZc+jbZzw966gMGU2a/?=
 =?iso-8859-1?Q?1gHysu26vczWHO1qfeItgsEiK9eAGaoCFIJWFuntaQsnQIdMP7reTrNu/N?=
 =?iso-8859-1?Q?A7cpKBvK6vLqU50uP6GBrSkJN9LMuVkQlD/N2uaNcrRJC3EHTdIMqR6R8R?=
 =?iso-8859-1?Q?I9DImxgobkOE7tnYdupJBvLR1Jp9Nwoirh4ebc9T3dUzOIUeLz48P+27dr?=
 =?iso-8859-1?Q?OQIQ9v8WK67upN8O8WJcB+2O0VXYqSLvCEEdid5r0mFU5qBpD91bOPCUH7?=
 =?iso-8859-1?Q?qCwH0o7/rzauwbc5F6CNrw7T1v4BHJimJdbLX6lDyH3dr3HRGFMk5lDzdU?=
 =?iso-8859-1?Q?ET2YAuXNJNbNNA4TBEBfHYCpyc9wXolYe95vC/Ebtjup8PvXv/pA4rvNr3?=
 =?iso-8859-1?Q?6fBAydbsdQ4LZPvOl1YolrnMpOJYVxwdn9TviTdkDo2/G62okdASRnd9lh?=
 =?iso-8859-1?Q?oJfAYO4Oj5nwf6XJ2CbjuMAloKMvxnARXYbR/8OzKX3clWjErMuptKcdG2?=
 =?iso-8859-1?Q?/xIrykpqTkwOf8qFUxG9YXqyycfS6Yd1Z1lbbLzYxN9i0iG/Um5u+C8yEU?=
 =?iso-8859-1?Q?mT7sUqKgPerBIV3W57ht9FurhVISUEbxkr6HPYfiyh5H+bwBmIsSd9Y+l+?=
 =?iso-8859-1?Q?1FxcwTuW5jkKp9F7+f5zZLmR/PUg0/yjxPzNNptygYyOBV1B2cZid+LN0g?=
 =?iso-8859-1?Q?WkmCj9QoFR45zrmtiY0J/TuMYmPU6rUVTY9JT9y9Q+guqmNbTzdSJLXv/f?=
 =?iso-8859-1?Q?Td3dFOr0KmIvqEH/qj6LHnVyHPRLUP2B7HWOqFwIKx41F5RAPCGq6E9ndY?=
 =?iso-8859-1?Q?dnqCk5OI+v?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524ce2e5-1057-4925-2cce-08d911e6b58a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2021 06:01:23.3755
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dYgFhI55iriuZCuySMdjefE68Dk80BIgH/34/8imK7e4ai3WGtOyHRfVxQM8SL2CV8C9uzM1pCYEc1UnbDzfeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5227
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[AMD Official Use Only - Internal Distribution Only]

Thanks for this catching Kees.

Yes it should be 20, not 16. I was not aware that serial size had been chan=
ged from 16 to 20 in struct amdgpu_device.
Will submit a fix soon.

Best regards,
Jiawei


-----Original Message-----
From: Kees Cook <keescook@chromium.org>=20
Sent: Saturday, May 8, 2021 12:28 PM
To: Gu, JiaWei (Will) <JiaWei.Gu@amd.com>; Deucher, Alexander <Alexander.De=
ucher@amd.com>
Cc: StDenis, Tom <Tom.StDenis@amd.com>; Deucher, Alexander <Alexander.Deuch=
er@amd.com>; Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>; Gu, JiaW=
ei (Will) <JiaWei.Gu@amd.com>; amd-gfx@lists.freedesktop.org; Nieto, David =
M <David.Nieto@amd.com>; linux-next@vger.kernel.org
Subject: Re: [PATCH] drm/amdgpu: Add vbios info ioctl interface

Hi!

This patch needs some fixing.

On Thu, Apr 22, 2021 at 10:34:48AM +0800, Jiawei Gu wrote:
> +		case AMDGPU_INFO_VBIOS_INFO: {
> +			struct drm_amdgpu_info_vbios vbios_info =3D {};
> +			struct atom_context *atom_context;
> +
> +			atom_context =3D adev->mode_info.atom_context;
> +			memcpy(vbios_info.name, atom_context->name, sizeof(atom_context->name=
));
> +			vbios_info.dbdf =3D PCI_DEVID(adev->pdev->bus->number, adev->pdev->de=
vfn);
> +			memcpy(vbios_info.vbios_pn, atom_context->vbios_pn, sizeof(atom_conte=
xt->vbios_pn));
> +			vbios_info.version =3D atom_context->version;
> +			memcpy(vbios_info.date, atom_context->date, sizeof(atom_context->date=
));
> +			memcpy(vbios_info.serial, adev->serial, sizeof(adev->serial));

This writes beyond the end of vbios_info.serial.

> +			vbios_info.dev_id =3D adev->pdev->device;
> +			vbios_info.rev_id =3D adev->pdev->revision;
> +			vbios_info.sub_dev_id =3D atom_context->sub_dev_id;
> +			vbios_info.sub_ved_id =3D atom_context->sub_ved_id;

Though it gets "repaired" by these writes.

> +
> +			return copy_to_user(out, &vbios_info,
> +						min((size_t)size, sizeof(vbios_info))) ? -EFAULT : 0;
> +		}

sizeof(adev->serial) !=3D sizeof(vbios_info.serial)

adev is struct amdgpu_device:

struct amdgpu_device {
...
        char                            serial[20];


> +struct drm_amdgpu_info_vbios {
> [...]
> +	__u8 serial[16];
> +	__u32 dev_id;
> +	__u32 rev_id;
> +	__u32 sub_dev_id;
> +	__u32 sub_ved_id;
> +};

Is there a truncation issue (20 vs 16) and is this intended to be a NUL-ter=
minated string?

--
Kees Cook
