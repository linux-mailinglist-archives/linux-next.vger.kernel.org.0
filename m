Return-Path: <linux-next+bounces-7329-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F518AF6F11
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 11:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF7EE1C82809
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 09:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0EA226CF8;
	Thu,  3 Jul 2025 09:44:30 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8DA2D9497;
	Thu,  3 Jul 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535870; cv=fail; b=YKrIUAZHVKiNZcfHX/LWCIBGagQ7ShAHy0JPHeCpC8iHMlM8UVokvHXDFhIRbAg8l+Ahw/DJUckGNO17kaB12sA48xIbIMfZGmNJjV1xKcRjqehWlJDoe3n7sFFZ1hQAQE9kRZyYOm26Ia7bc93mgxMVROAykddbRqP7thXRFlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535870; c=relaxed/simple;
	bh=wF/8jYP3RNGfRE0LoKWWl9kRit/Ibd61l4TU5lGRZcM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dCs5vEuLfYBvRq84E5sJYzDnvcsDm+cfoXn3KU0v+Z/6u4IaVil52XkPN1zTvusHKZDmKjGNmlJ5lj+f+fez6MEFMIH/6SbqTIiaba0Uzmkk4Qq/CkU6T8v6uZTfv1f62wa+yFqqU/A5ENS5quYvjf3Bv8Ld1MWlY5IKetRz8TU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5635A9ip022247;
	Thu, 3 Jul 2025 02:44:18 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2085.outbound.protection.outlook.com [40.107.237.85])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp4da0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 02:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/y37gR720VxyOwKeBq8qYDwS6kGTxAJU775Xq33VCPETlcVe1MwOuxDakzwFsMxLaAiWVg+Eo8mdFUwWUO106PPovSVs3iCPhsNmG7ioT6NP4dylmI5Lkr/4xpNf391phPp91Jx5yNQXTCREx13pKFrSnSJpS0qnUkOkbur8QMURvXfh/PpRZShJxVzmhkgmc7Byot7NWS7S+S1d1gW4Z06HlIDsSjmsQZ498lDASS9Bu+82voaH+nzifr6jLrUJTY8WzKUbSzgxKHrWRhrFVHVw+WV8tb2+o9uMopKZJYriaXGRkMj/bjix4qwVWQTaUZ0BSJ9tIhy3UN1Ac2whQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF/8jYP3RNGfRE0LoKWWl9kRit/Ibd61l4TU5lGRZcM=;
 b=O/ZUB3DYC9BRplvof+ittRYhP4c4/7mR0gxGxvF2jJVrhFWH3OZ9x1EwwcrJWxh+acr9VH8Auq9UX+TWtktqHoIU8/jCmwTb38Wqj02x9ignM7ua1kYnGeZys51OSMSTZzj2bUl4E/T6zGPW9sExzXrVVQBae5fdECC8035g7TDgppaEW13KDCAoa4+2Oq2gHeuRYexgJYIjk2KMcx31RlyUcLDEa/0svqYN/IoYIBKLit12d9LclI84gk7VhZ1ZDB/XlSnNEyZC7th4LtXYKJNnLcvjm/CDB1PbWPaWwXZkA5ef/+w+miFwuinuGxygzbz+sfz1s3VfEqCBDaH5kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS4PPF2D9C959A2.namprd11.prod.outlook.com (2603:10b6:f:fc02::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 3 Jul
 2025 09:44:14 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 09:44:14 +0000
From: "Xu, Lizhi" <Lizhi.Xu@windriver.com>
To: Greg KH <greg@kroah.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing
 List <linux-next@vger.kernel.org>
Subject:
 =?gb2312?B?u9i4tDogu9i4tDogbGludXgtbmV4dDogYnVpbGQgZmFpbHVyZSBhZnRlciBt?=
 =?gb2312?Q?erge_of_the_char-misc_tree?=
Thread-Topic:
 =?gb2312?B?u9i4tDogbGludXgtbmV4dDogYnVpbGQgZmFpbHVyZSBhZnRlciBtZXJnZSBv?=
 =?gb2312?Q?f_the_char-misc_tree?=
Thread-Index: AQHb6+mTafKT+g0IIECQmRgykPE6x7QgEYKAgAAF5tqAAAqAAIAABCpi
Date: Thu, 3 Jul 2025 09:44:13 +0000
Message-ID:
 <BL1PR11MB59798DB1C2D7B2B2988BE2DB8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
References: <20250703171021.0aee1482@canb.auug.org.au>
 <2025070335-situated-sloped-bc1c@gregkh>
 <BL1PR11MB5979E06DF496FA3965009DFF8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
 <2025070357-scrambled-exodus-a8a0@gregkh>
In-Reply-To: <2025070357-scrambled-exodus-a8a0@gregkh>
Accept-Language: zh-CN, en-AS, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5979:EE_|DS4PPF2D9C959A2:EE_
x-ms-office365-filtering-correlation-id: d57bdccd-6e8a-498a-43f3-08ddba162b97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?L3lZUzdkOFFlRnIwbVpuTnBheXZsK3owdjVoQWJoZDFjTUtiejBJcHIrVGVX?=
 =?gb2312?B?ZE95ek80MWU5TDE4ekU1RFRUSVFkbjZxSkJPeEprUTgyOGRTTk9rQXZSZmQ0?=
 =?gb2312?B?N2RGV3ptUnhDc2FoMk1qbU9xMmpyWGxxYTB1eDE1eTA5eHh5T0ZEWWIwWDl5?=
 =?gb2312?B?aTBYUndXZktrOEFMRTRNSitwc2lvRExTdGt4UkhhTGZoSTQxaXM4S0dmZUcy?=
 =?gb2312?B?VThDMWxVbHNDRXVYaFp2cGtTaTk4YTZDOXgwL0dKZXV5aG96V3d4d3Z4d25J?=
 =?gb2312?B?N1ZNLzd5d2lBWFRjS3NlSDdDR1VvRUNXQUFpN2JXYTJzbUxGV0IxeVJnR1Y0?=
 =?gb2312?B?ZDY1dnlsZkVFZEh6TytuUVdESllSMi84cWFYUWxxSUh2eDFSdW8yMkwrUnVx?=
 =?gb2312?B?bzRHQW43MCtXTzEwL25MbEM3bU5STXJpOWFEdGsybjFQK1pPMUZJNDFDZHBn?=
 =?gb2312?B?cmlEVnJjdFBTRHdSd0lERzFqVHp0Tlp5MzBJYVU2c1gveGZXS0RwVVVVZHkr?=
 =?gb2312?B?ekJRNWcyWmducjRxeXJqVnFZOVY4MUdWSHRIbk9uUnRjUkVyRWZ3c1NnWmti?=
 =?gb2312?B?cTlxSW83S1g0SG1zQUhBOFRCeVduNElVTUNHeDlLaFpDazRNWjVGaEdMZ0U3?=
 =?gb2312?B?TUlRaDU2S0RmaGJQNXZwUVpkdzdKajQxY25sR0ltMUNWdzE1RXYzVnhJNm1h?=
 =?gb2312?B?T2xJQmRJT2U2dXpQWk5td1JxRERid3lvTDJYOTR2djB5U3UzYkd5RXQ3UTJW?=
 =?gb2312?B?OFlIY0g4YXpwdEsyWjgzUjQ2TWVVdUJ1ZjFac3pDcjh1czRxUW4yY3JvaG5n?=
 =?gb2312?B?dmZtRUNCNVBQdUt2SlIxZkRzWGVPNW9SVGk5QmFFT1lnemsvMkNhODFoMWhy?=
 =?gb2312?B?R2tXOXlEYmJHWFQrbWxLM3VhMWlZYmRSeEFJRTlNRGZRbGJDSW5KZ3BGQUFj?=
 =?gb2312?B?TjBDMmNoS1lLR0tXS3ZWTEZEWTBNa1Y3aWZtSGE5R2hHWXM2eFR4Y1pNRGZt?=
 =?gb2312?B?Qkg1aDU3VU1FZXRLK3hyRkhxaEZxd0VvNzVKY2hPbzl6SXlnVTZmdE5aNThv?=
 =?gb2312?B?MEhZOGlxL0g1UEk2QmNOcVowdjBKeHNhZ3lpakREeFVLUzI2eHFpN1FZOG5Q?=
 =?gb2312?B?bkUwWHcvbnU2SXJJNUplRmhDRlZEY29mbjRqaDdvY2I3RWdxdDJSWUoxN2Uz?=
 =?gb2312?B?QWNiV1FnSFROU3VTa2E5Y2NXZTdSUGEzS0NuRkxCRi90dk4yYlRTWXh0R1U4?=
 =?gb2312?B?ZEtWb05GRFE0T3pqTXBDWXhNMFpKdXZTVUZvNG9OV1NlRWNjYkVIc25PYmFQ?=
 =?gb2312?B?TG91WHhYTGhmQlU4eDRQTHRDYXRHZ3lPdVpLUy9vN0UrcXJHd3FRSDRCanph?=
 =?gb2312?B?NWVGckhDMkVYa2ZWZFdsV3pFbHFwWmw0cWhBQ2lNSlZxWWRHd3UvVkoxemtw?=
 =?gb2312?B?RC9mOFVKNUY1YmhHZzgwSzVKNVpRNkw2OVhZK01FaXA5aDVIODUycWF1c2V0?=
 =?gb2312?B?aFdEZVBSa05VelZ3K1M2SlNjaDdld3FhZ3lQc3dERXZPVjIxRG12ZFFxcW85?=
 =?gb2312?B?VFdHbXZ1NmdjMUx1Sk9BUW5adUowV3grZUNGbDJmbE5UMm9BRmF5TEhINFg4?=
 =?gb2312?B?VnVyOEhtRVNKYU83V3RuZU12K21XdlRmZ1ZZb05EcmI5THI3WHNMQzdkRWJI?=
 =?gb2312?B?QXRPenJjMHhOZG1oL2F6SHQxQVRuRG51d05DQTZ2UnRRRkVkb21wSHBQV051?=
 =?gb2312?B?Y2FmODR0MjY1RGJLeWZTYVVWSWw3d2ZST216UUNsN2gvTU1Zc0R6YnlFQzZo?=
 =?gb2312?B?VHo4dUYyaU1MNVVtYmwvSUxobnplaEkrcFdKZzRvdlU1Z2pWNXNHN0pPUmpB?=
 =?gb2312?B?WmxSNFUxcXNBWGYzeTRUZ0hzSGJ3SFZzVzBvWElMS1RHK3RPSHNPRW95dVVk?=
 =?gb2312?B?Ym5KUlhzMlJPY0ZKNkszcktreEMvZ3UrQVhUTWgySmlkZkRKL210ZnVNa01h?=
 =?gb2312?Q?wltrnApsPQkIFBBKGprGzHsB1yfJcA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5979.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?Z2VoNHNpV213alVqNiszY2lJRkh2ejJiVmFiazBzSTVCMkhQQm42Qzd5Z3hO?=
 =?gb2312?B?ZG5DbUt4eUkvczMrYld1SUNkU3JSZ2pwdnNrZHdnVFZRc2x4Q3RvZXZsL0RG?=
 =?gb2312?B?d0hKNU9IVkQ2d3RkUWVTNGVvRU1qQVVLdHhVakk2WStkTCtLenJFTGQvOEpu?=
 =?gb2312?B?SmJxcFp0MkEweDdzVzlSeExtNCtIcno4ZzBpSGFMVFlWRmZpVWFkWkRkdmd5?=
 =?gb2312?B?ZXJZZWZUbGduRG9QZHFxZnBLSDYxbml0K2VvbUFOYVVTRjIrUjdtMWJ6TFpD?=
 =?gb2312?B?bklGWVZlQTE4Rm1BaFZIcUwvY1JrcXREOTU0aEVXLzUwY1FEVEtxUDcvTTJt?=
 =?gb2312?B?YlI2aEN1Kzg0dysrTWhIV1ROKzF5SnhQaFl4ZGhXYXZCeFJiR3FTbG1Lck56?=
 =?gb2312?B?Qmtldkx3clFNV3NyZWUxQ1RhSHlEVmxoc2Q5a2tSMElVbmcwL1Njdi9yVU1h?=
 =?gb2312?B?QitrQ01iMU40OENDMk8yRDhkTGRPMUV0bkdoUjZaM1dCWFFydEwwbTZ1U1dm?=
 =?gb2312?B?U3FlU2w0S1o4K1c2dmFxWEhJb2JYS1JyTzVtMEg4OWlqUkc0L3VQNVFsdU4v?=
 =?gb2312?B?bVJ2cmhtbmdyd2NlWC9Vb3A5QWQ2cjU2OCtWUHN6L3JmcWNWNXlPaTlaUmVK?=
 =?gb2312?B?OVRlMDhla01CRWt4Z1VCOU4rb29zRTlmaEp0ell0T1ZXNFBZZGphT0tjOWpC?=
 =?gb2312?B?aGtoRDJaWnJ5SkljU1A1SVREbU9SamR6L0JpY25ZemRNVXkwVmNGNU82bS9j?=
 =?gb2312?B?OHhoeHpzOERsYXBUMk9xY0YzN1B1cEF5TWtieUY1SzBuME5STnJlVThiUDMz?=
 =?gb2312?B?UDFTVkhKViswa0NCN3NjdlVjYWJmbkFGMFRNMGE3djNMdFIyQjVuOWdYUFBo?=
 =?gb2312?B?RHA1VTRHZHVnU2hTL2ticWp2OGVJVFRHbURoMGptMW1rMkdJMVMwQTZhTlFy?=
 =?gb2312?B?T2VxSVluTkk4YVRWRjVSSUVCM2JreEpVdlZhaTcrUHNUbFFEZ3M1OGROTFhD?=
 =?gb2312?B?RmU5VHJZNlJHckZIUjZXRFJFMGljS1g4WStpd2pSZGh4VklqdzBoWGx1N3dL?=
 =?gb2312?B?eXhicXJVTkNMckM3VVIvc2tLNytjc0NHeDJVajlDNlpUd2Z6VDlwWHVpM0FY?=
 =?gb2312?B?L0p3TStIK2U3TkdicEE5ZDI4dlBGNjUvbkZNMzBreWFZdFgwbUlrTFR6M2Nm?=
 =?gb2312?B?USthaFl2dWVFb1VvK2hNcTJ6WUhCSlhMcXpNQzdvcjdUMTNDT1BPbWIvN0hv?=
 =?gb2312?B?SndObXM2dXJLWTZwQ2pVWS9BdXNLUXJRQzRxR0R2K1RJZ2FTSGRiWVRaMnlW?=
 =?gb2312?B?ZDB2RkZjcEJyZVpud2NuQjg2VEw0UzQ0a3BnRWw2aGtvalN1alIxalpqMG5V?=
 =?gb2312?B?RUJ2cG1qZytqOFdCWXMvWndZS3JSRVRxQ002RzJQa1BzbEV2aFk3MlZaZjl4?=
 =?gb2312?B?ZGZ1KzlWYk12VkdXZU9jQ1dDRHJZdW5ONWIxRFVLaElPUVl0STBGQlpvN3RP?=
 =?gb2312?B?cm0wMWxWcmlJUkdTSE1JUHREeERJVnhoV2FCaVhOclJSRFJnR1JOT1ZoWUFR?=
 =?gb2312?B?Uit4cnhiUXdsS3hWQ2QwVlIyMis4QTk2SlhmMGFuYklQaVJDcjR0U3J6N3ZJ?=
 =?gb2312?B?Y0QrbSthMHRVVzRhSUd4eGIrVjhDejZIV2hDMjd6eUJpSlZVb3VFd1BSU1Fw?=
 =?gb2312?B?azlkRGtVaENORGNoQlArZDcxSWgybno1RGVJU0dQSXRremRMWGZWZEtrTTkr?=
 =?gb2312?B?NnFhaVVna2pYVkdUelZDSlc1WGhnTnRNeVR5VC9La3VvV1JpVWdkeXlzTGdK?=
 =?gb2312?B?RnV3UUdKVlFPb0JseFdzRzhkbUhBZjE1b0RvU25WMHN6NTU5dXBQc2o4eld2?=
 =?gb2312?B?Zno1QWRmM0xwUm9jVVJ3MWoxWlFNbHp1d3dnT0xMS1lXZEFaWHBEbU90cWRN?=
 =?gb2312?B?VWlEdVZuS1RjYWV2T2FlNVk1R0grZVN3cDRha0dkSnFBL2tKRjNveXNhQnRj?=
 =?gb2312?B?ZisxT3RDZlhyN2RETW5jV2Y0eWtMQWt0a1Z0TitlYjl5MXhHSG02YjVTcSsx?=
 =?gb2312?B?Mlp3L09na0ZTK0lYckN3T1dzaHRHb2F1SmZndHUwL09Hc0RNV1pRWXJabmpH?=
 =?gb2312?Q?S6e9vp+wNHGwrxeZE7GAMsLN4?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d57bdccd-6e8a-498a-43f3-08ddba162b97
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 09:44:13.9720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yo2h/uNIZBVuR4mdFUYH/XdBotFzQwW93/AYvGaDu/iAbnRdxwxudAtUa7zCu/z/rPSgETqr9s9dR0ZCrT0/RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2D9C959A2
X-Proofpoint-GUID: zMZPCaPq4VH2l8o8eUP-dQzJXRnSqyhZ
X-Proofpoint-ORIG-GUID: zMZPCaPq4VH2l8o8eUP-dQzJXRnSqyhZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA3OSBTYWx0ZWRfX+t0We5AwuRw/ ou8qGvnMXU+EoBvsYHcHgF1iz5SqDjqNMQw64zu0ahw4QjLMQ28K3wzGCJLeZsD0iC2RodTOe5b 80DwgRg8ba7za32Y/vo3HuuM/MqlxVQwSst70/plF8aJShGmIX2wyFhGofJETElySk1E92BvIXo
 oVdmzzT1DCDtofG+fes8ytrN8n3OEyU8wR1ooJDPQFRQZUIacIh/hJ5DjHyZEajr7fILN5rvZpo gqLLW5xxCkgkfeAQOuLksNnTq/26RKDi+up3mPI9VQGw0neol/DjT+xZIHr8rDHXN1AMm54jMbb KvunVyS7pMwyTXu5+wMgA3uCyUXkuF81hSQRDRDFFDSw9b8TwnTFGozMIu71v5Kdh0aEO4gTIzA
 dBsfNz4eybUMBU1OUrMvgrvlWeJHfuusC491Y6bE0zi/bSNwH9xZ9xodL1Yq/yAMm8b3PdKW
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=686650f2 cx=c_pps a=XbCLgsAEGm7m6p89S+a4Ww==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=_l4uJm6h9gAA:10
 a=Wb1JkmetP80A:10 a=evnznIMVyloA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=2C6YHBdLAAAA:8 a=wvPkM9v7g1_ikmSEda4A:9 a=mFyHDrcPJccA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=yxGMNg53M24zlVSZdvMH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=849 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030079

DQpQZXJoYXBzIHlvdSBjYW4gZm9jdXMgb24gInN0cnVjdCB2bWNpX2V2ZW50X2N0eCIsIHdob3Nl
IG1lbWJlcnMgaGF2ZSBhbHJlYWR5IGNsZWFybHkgZGVmaW5lZCB3aGljaCBhcmUgdGhlIHBheWxv
YWRzLg0KT24gdGhlIG90aGVyIGhhbmQsIHRoZSBwdXJwb3NlIG9mIHRoZSBwYXRjaCBpcyB0byBw
cmV2ZW50IHRoZSBkYXRhIGluICJzdHJ1Y3Qgdm1jaV9ldmVudF9jdHgiIGZyb20gYmVpbmcgaW5p
dGlhbGl6ZWQgYmVmb3JlIHRoZSBkYXRhZ3JhbSBpcyBzZW50LCB0aHVzIHByZXZlbnRpbmcgdGhl
IHVuaW5pdGlhbGl6ZWQgZGF0YSBmcm9tIGxlYWtpbmcgdG8gdXNlciBzcGFjZS4NCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBHcmVnIEtIIDxncmVn
QGtyb2FoLmNvbT4NCreiy83KsbzkOiAyMDI1xOo31MIzyNUgMTc6MjgNCsrVvP7IyzogWHUsIExp
emhpDQqzrcvNOiBTdGVwaGVuIFJvdGh3ZWxsOyBBcm5kIEJlcmdtYW5uOyBMaW51eCBLZXJuZWwg
TWFpbGluZyBMaXN0OyBMaW51eCBOZXh0IE1haWxpbmcgTGlzdA0K1vfM4jogUmU6ILvYuLQ6IGxp
bnV4LW5leHQ6IGJ1aWxkIGZhaWx1cmUgYWZ0ZXIgbWVyZ2Ugb2YgdGhlIGNoYXItbWlzYyB0cmVl
DQoNCkNBVVRJT046IFRoaXMgZW1haWwgY29tZXMgZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWls
IGFjY291bnQhDQpEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQoN
Ck9uIFRodSwgSnVsIDAzLCAyMDI1IGF0IDA4OjU1OjMxQU0gKzAwMDAsIFh1LCBMaXpoaSB3cm90
ZToNCj4gR3JlZywNCj4NCj4gSW4gY3R4X2ZpcmVfbm90aWZpY2F0aW9uKCksIHRoZSBmb2xsb3dp
bmcgY29kZSBjYW4gZnVsbHkgcHJvdmUgdGhhdCB0aGUgaGVhZGVyIGlzIGZvbGxvd2VkIGJ5IHRo
ZSBwYXlsb2FkLg0KPiBldi5tc2cuaGRyLnBheWxvYWRfc2l6ZSA9IHNpemVvZihldikgLSBzaXpl
b2YoZXYubXNnLmhkcik7DQo+DQo+IEkgc2VudCBhIHNlY29uZCB2ZXJzaW9uIG9mIHRoZSBwYXRj
aCwgZGlkIHlvdSBub3RpY2UgaXQ/IEl0IGNhbiBzb2x2ZSB0aGUgcHJvYmxlbSByZXBvcnRlZCBi
eSBTdGVwaGVuIFJvdGh3ZWxsLg0KPg0KPiBWMiBQYXRjaDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjUwNzAzMDc1MzM0Ljg1NjQ0NS0xLWxpemhpLnh1QHdpbmRyaXZlci5jb20NCg0K
SSBzZWUgdGhhdCBub3csIHRoYW5rIHlvdS4NCg0KQnV0LCBpZiBJIGhhZCBub3QgcmV2ZXJ0ZWQg
eW91ciBwcmV2aW91cyBvbmUsIHRoYXQgcGF0Y2ggd291bGQgbm90IGhhdmUNCmFwcGxpZWQgOigN
Cg0KQWxzbywgaG93IGNhbiB5b3UgImd1YXJhbnRlZSIgdGhhdCB0aGVyZSBpcyBubyBwYWRkaW5n
IGJldHdlZW4gdGhvc2UNCnN0cnVjdHVyZSBmaWVsZHMgc28gdGhhdCB5b3VyICJwb2ludGVyIG1h
dGgiIGlzIGNvcnJlY3QgaGVyZT8gIFdoeSBub3QNCmZpeCB0aGlzIHVwIHByb3Blcmx5IHRvIHVz
ZSB0aGUgY29ycmVjdCB3YXkgdG8gZGVmaW5lIHRoYXQgeW91IGhhdmUgYQ0KInBheWxvYWQiIGF0
IHRoZSBlbmQgb2YgYSBzdHJ1Y3R1cmUsIEFORCBwcm9wZXJseSBkZWZpbmUgaG93IGxhcmdlIHRo
YXQNCnBheWxvYWQgaXMgd2l0aCB0aGUgc3BlY2lmaWMgdmFyaWFibGUgdGhhdCBkZXNjcmliZXMg
dGhhdD8gIEJ5IGRvaW5nDQp0aGF0LCB0aGVuIHRoZSBjb21waWxlciBjYW4gY2hlY2sgd2hlbiB0
aGluZ3MgdmlvbGF0ZSB0aG9zZSBydWxlcyBnb2luZw0KZm9yd2FyZC4NCg0KdGhhbmtzLA0KDQpn
cmVnIGstaA0K

