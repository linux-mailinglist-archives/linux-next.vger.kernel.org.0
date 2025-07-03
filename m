Return-Path: <linux-next+bounces-7326-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C84C8AF6DC5
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 10:55:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E6353B5F9E
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 08:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075D22D3740;
	Thu,  3 Jul 2025 08:55:50 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8259C2AD25;
	Thu,  3 Jul 2025 08:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532949; cv=fail; b=SY8O7SzJTGSGkLQAbZv2CClVCmC6o1Uz0c6mCI5LMdAMfyPJNuBgECp8edlCMoZuVhbuctjR5nBNMor5Cf6uwu9ytzBSGw+llgTgs38YXL4nmKY2RKf6gVkCDs8QQVhOTgsRT3VtNP3mOb/JDlNASanSrizJ4pEPD/FveqtQ9ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532949; c=relaxed/simple;
	bh=W2rO6aosn8orZG0eyAGFWbyUpl03oW7IdGKsDJoDqR4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oFMZ9sFu2du6qDvQzlnyAmNNLTs5lNDHWSx5+nFQp47XW02sCVWIJ8hAw3leGgJ69CuzR1Tr2iExplxywKQzsWQQr8EzZorKVr/XCK1slFiwVUVgb4kpjhFhPfSy36BqVJbM23wtac29Wa1tpeRVrsftBBTlyxhamQFMEj+v6Ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5638d4Bs010621;
	Thu, 3 Jul 2025 01:55:35 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jbp4d8mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 01:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPYztfmfQ8YaiHq+23dPcQB4voAfSXAAGH1grYBWeimcAv51ZPNZOrrSDVXvA74zoE1hDIe+VXxHNLTIer7BzqAf/8gTjHP+CnEA10F3emaggfq7374TucElLUYrdkd18RS4tZ09CTCGOI638MtTq9hau1aT/xMNttvwcSUggeFpLS9yXqB0bDcuZDxywy2knis7Vf/Kp8ro+z+40j8fc/hQEtbTQF9q+v+l31rUFak7qfNhJ0F8EZ3TUxD9cTmUb8f18Si3TXioy/eDE9hZmGBWnD1GxmPSJcgibZhszHyKP4PZ2tim9RCEapRhKDnAuwM5OqXTz3TtCvoCcfKAtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2rO6aosn8orZG0eyAGFWbyUpl03oW7IdGKsDJoDqR4=;
 b=N2lPQVdQkJTYRz7NoR9quQTeyQYlx6OaEukAZJPRIvdHfhYj2cQTHBfVImvbb43tvfx6TC/UOvIwkVKCXmuw7nXw+KWWU4qWCJPJA3+xCxRYDmxKERaIxF+Q6JQiAhIXBIz619CFZfmJYOUJuHBNoU71/GbPsC/mNXCE96dUtI6dU0GtelOoPwAZ9NWhDelQCUlBIVePi95Kr7ixdOlFtYkfbQJQ15aNcouD0LGJJAHUszETcHtvtL5PiwuIi+QwcgzHzH4zDCelfNBUi+8FD3qcpvG+FTWZDUVbbkOw0Aif7MYsTiPKSDMVGUMbRF6WFX7UgLUwbPk1UjkdQrpFow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MW4PR11MB7162.namprd11.prod.outlook.com (2603:10b6:303:212::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 08:55:31 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 08:55:31 +0000
From: "Xu, Lizhi" <Lizhi.Xu@windriver.com>
To: Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
CC: Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>,
        Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject:
 =?gb2312?B?u9i4tDogbGludXgtbmV4dDogYnVpbGQgZmFpbHVyZSBhZnRlciBtZXJnZSBv?=
 =?gb2312?Q?f_the_char-misc_tree?=
Thread-Topic: linux-next: build failure after merge of the char-misc tree
Thread-Index: AQHb6+mTafKT+g0IIECQmRgykPE6x7QgEYKAgAAF5to=
Date: Thu, 3 Jul 2025 08:55:31 +0000
Message-ID:
 <BL1PR11MB5979E06DF496FA3965009DFF8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
References: <20250703171021.0aee1482@canb.auug.org.au>
 <2025070335-situated-sloped-bc1c@gregkh>
In-Reply-To: <2025070335-situated-sloped-bc1c@gregkh>
Accept-Language: zh-CN, en-AS, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5979:EE_|MW4PR11MB7162:EE_
x-ms-office365-filtering-correlation-id: 41154045-3639-40bf-fc92-08ddba0f5d74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?eGJMZHkrbTc3eVZROGpFOWYxcmROTHBtSUJncHExaFZGVWhJdFozamgyeE5r?=
 =?gb2312?B?bE9HVE4xdXNOMitoWi8waFN0NDl4Y1o0SFc1V21NZlRyNG1mTnVGc3RENUhi?=
 =?gb2312?B?Mm1ZWkt5b2VXMnFZdDhEdnJKZ25ScU5OYUdUcmxhb2s4dldHdkc1eTZHUzV2?=
 =?gb2312?B?dnRPYkJRLzg1MGMrbUxwWUowSVNUK2o3MW9VQjlJbmQ1Ukk5NTdWSjdIdDBz?=
 =?gb2312?B?S3llU3ZCczFIZGZ0aGNVUGN5L2VETlZKMW1TTHN3RFA2SVZYSlFXWXd2Snph?=
 =?gb2312?B?NW4wQmszcXNMOGszVnVWL2FUdlhCSEtDcmwyWkVGUlhUSUprN01WSFdCZWxz?=
 =?gb2312?B?NXFBV2dWNGhxSWY2UFFkZnJaRnhPVE0yYjMxQzdvL1pqOWFURk5mczI4YWln?=
 =?gb2312?B?am1JWWlTZzBwMkprZjlDdkNqcVFrcnYzT1hRR292T21TSG5oY1Z3WHRkYUdi?=
 =?gb2312?B?Nkw2NWwrelVnQUNqWUc4WXBQT0pDZy9TTmp4NXZ0dWl1RVhGUC9FUUFFVjA1?=
 =?gb2312?B?S3QyK21GclBRQ3ltUmZOTXJjSmhrQW1vM1E1Q0d0elk0SXZKcWxkbEVSWTdz?=
 =?gb2312?B?R011QXpYRVR1V0JyVVZxdnM0R0duaEduTlF0MkJHemw2cXVRaldldHFqT0JG?=
 =?gb2312?B?Q2tEQnVIZDlzd0Y5cnpEWTRLSlVoOUxlMmpkUlRWL0MyaU1SMmZRQ1M3N09i?=
 =?gb2312?B?bXFKUlFwYnptdjFYeFk0N3I0T2plRVFzWmZNK1orK1RTb1BteUxIVWo2VVRy?=
 =?gb2312?B?UTBPNHVYam10Mm5wa01DYnN4UkZZQ0wyeW9zQ0xPUEtxSm1jRHpDenhFOTVU?=
 =?gb2312?B?SndWMklPNzlkVmtQVlRJbjlHUXYwNncycm5xUXVuQzVCalIxS0UvNnd1N3Y5?=
 =?gb2312?B?WHlIaTlSWUFDUUs1RldQVFFLRHFIdFdaaHUrdDROVTltOUJRckxPd3dxbllj?=
 =?gb2312?B?UW9xZ0d4a20rZHRDNi81N0R2WnNCYWJyR2g1NXRGY3FOL1Q4ZGk4Z1E1REc1?=
 =?gb2312?B?ZlNLZ2JmWUtUUG1qQzcycjhLUnFiODlvM1RiYllkSDB6RW9YVEk4QzFybFlI?=
 =?gb2312?B?Qkg0bzNLT3RGWityaFpSVjlUOW1IdmpSVlV4bEdSQXZPbVRrbmlYOXF2NGlS?=
 =?gb2312?B?RFAxTWhpTmN6MUpWejhUQktBZWFDaEs1YnBBSkV0NU9mbUlFTE9NRXFTV3NH?=
 =?gb2312?B?Z3FpeUNjOEZyZTJvOTBtUlFWc2JUWDlaMU5DR0xMMFVRR0loVldtOGpIZzdK?=
 =?gb2312?B?VXgzZlB3VU9WODNSc1I0ZmZwd3g3RVpLd1BCYWN1U2xNbDd4QXQvQ0ttSmVD?=
 =?gb2312?B?TUpPc3h3cGJMS2hLZTIrUTlIczRxQ0NMbG15aERFRlc5Yy9RWG1XMlIyS1E3?=
 =?gb2312?B?dHdSTDczT3VlUFcvb3FueVFWcThudENyV0ZCTWdJVGYybUZ0Q0hMUGpaUE85?=
 =?gb2312?B?a0Z3UG5RSnB6UnhJM3VMUXpoWEszTDdMNWlOQTlIRHQ3MS9pWVhPNG5SQVow?=
 =?gb2312?B?WVBQWHZmTXNRQWpwcWpIeFZwNFkvQTg2L21EaUxiVzFMQXBGTEZkVUx5Q2NG?=
 =?gb2312?B?KzdiSlQ5dmF0YUxvQllicWpNek1lcm05cjJOZjRvcmQ4OGlkZmpOdEtoelhY?=
 =?gb2312?B?UFVtRUNNdHFwWVRxOFN6aE9mMkZTMFBEdjlQcDhmd24zWnNDbkhSMVd4amp0?=
 =?gb2312?B?S21DellOUWVLU09sbmlzSXVMQTJ3dXJ0WUZBN3FreUVCeHpvdTl0YzdHVktS?=
 =?gb2312?B?aE9LUGl3TnV1ZEo1emlabTI4QmpmdmdEbnAyQTNOTW9aM2FTWTkxV1dxYXgz?=
 =?gb2312?B?RDVUU0FwWFU0QXM0aktJRGlqbnBYbHdsOWtaNXh6cmwzOXpLSEc2T01DL1Ur?=
 =?gb2312?B?N3l3VmRkY09qUzVIK0E1ZlBHNjhkMGFSUDBQZ0d3MWEwRy9tbUNBMU5CMjJK?=
 =?gb2312?B?TXk3OWprcUdMUjEyZVNqWnluV1FoRUhJWk10MStXeFFoMkROeHZ0dTJ0V3Va?=
 =?gb2312?B?YkhkYzJvZ3JnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5979.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?UFFFSTQ5QkZZTlB0MzlwS00yVTE4WVR6NzJIOWJBanFwbHJQRFFKZjR5ZjA4?=
 =?gb2312?B?QkprVStvQWIrUCtlMXYvaXNGVTUyemUycUxZc25sZVcwNHdvOCtRS0lUZmFt?=
 =?gb2312?B?d0x0ekIzR3dpOW1oTlV1ME1HTjc2REFsZGx2OEhWVUdBenBMdlYzeFFBamlt?=
 =?gb2312?B?Mk5CbHpkWEdTNjVESmZEOVFIUk9mQUhyS1dVcUZkYzBCSU1wRmxqMk9yV2Ja?=
 =?gb2312?B?cnNvbk1wVm5TRWswZGhVMDdXeE5aRjFWOEp2QXFjZVJoT2JYa09UUGp5RUxP?=
 =?gb2312?B?ek9RQTF3QzRGRVJnYUk2VG1OajZxb2FOTVYrTmpWeFJmTTBVd3pDNTMwM2xM?=
 =?gb2312?B?V1Y3cFptMkFwcFJQd2k5OVFMWXhiRmQzVEM1TUZqUDJoMFBGWG5MN2xuR1VP?=
 =?gb2312?B?TWkvUlJva0N1MEdPOUJrMVNhbnFEUmNuT3Z6ZS9KVW9QL05wVnROamJWS1RT?=
 =?gb2312?B?cWhLK3FOcmdHRjRDNStrYkVBK0NWc2JlQnJiS3FsSG0zSkVhQXNzR3kwVTVM?=
 =?gb2312?B?Zk84Q3V4YVgxanNLUE5oSnU1OXBVSHU5eEhsdXFhZmdyUUZpOTBoenBvRFh1?=
 =?gb2312?B?Mk1ZZWlaM1h0ak5lMS9LY0RteXZrV3F3NWhOZENUdE45WnZaaW9WVnJwd3pk?=
 =?gb2312?B?NkV3c1FISVB5MWVXTkl0bnpQSlRma0FEMmQvTm5CblltaXhGWDRwcFFIT1Np?=
 =?gb2312?B?NUg3ZkR6OUtQa042elI4QUhHTU5ENFdjRVFJYlcvdVF3bXBIb0JhaVZucFly?=
 =?gb2312?B?TWRaLytVU1B2cVUxd2FQQjNkYVU2K1NKTDVFRUNwbml3bXNyWnc5SGlTc1Jy?=
 =?gb2312?B?bThGZFJNdUlwM0FheGhJQURBNldFM1hKb0JBU1A2WmtMN0JvZUR1SzlCWk5w?=
 =?gb2312?B?UldvTEh5ZlFTL00zb3lWTFZ1K2NOYU5PbGp3dzhWbHhiWloydFhlVTA1N3Fz?=
 =?gb2312?B?eDhPWVc2aVluK0hZbGFqVU5SbmpOSXlrMWQ2Ky9hRGFwTEFmT0hFOXBvNVU4?=
 =?gb2312?B?NWFCdkVLNy9Qd2hvRzlBQnJBb2g3Mk1hOENZemIwYkhBUUE5cnBxNkhvdVVD?=
 =?gb2312?B?dk5yc2V3dU02VW9ndjhrWUhqUFdqOHdvMjlLUllnMlVmYm1pbmhneEl4NUNr?=
 =?gb2312?B?eEpsQjhrcDZDaG1DSDdySTRWdCtDY2UyZ3JjRlNTZXhVMG45c2d6UldJdGdz?=
 =?gb2312?B?a1dadExONXl2b2lRTFpmZTllbEF1N2RJQnl1dC9zOXM3NnY5YS9uUW0wYytm?=
 =?gb2312?B?dTYyYVVuOE1FVjhFM0JkeUZuWXNUZlhFaHIxdjBPVXM3NU45c2JvVUFoOE9F?=
 =?gb2312?B?UFArQ1IrQWdoZUQ1UE9NZmtlQlM5NHBjb2FGRzQ0WDkvbU5yaXhOZXVuNW5l?=
 =?gb2312?B?azNBSE1DNkxqcUNYVnJaRXRoSUlmT1ZmRzd1Qm1DZHd5dDNhdmJEK3hjaGhS?=
 =?gb2312?B?U3FUS29ZSkdjWkc5YmRpZnhZRGZQODYwNHBOaFNIazIzVHhEMUpIV0F2VkRr?=
 =?gb2312?B?enJTdjk3Sm5HZ0VBRzlOajI1Z2FxYmxVL05Hc3QvSTQvQkxiQk0rR2IxQUVu?=
 =?gb2312?B?WHhkYUZrelhVNjRZR0x6K0M3TlVCSWRITjVQaVpTTlYwK1FoQnNYcFBPK25k?=
 =?gb2312?B?UFJuR3YrSWE2cVRtdVZLTG9qem9pUXVwTWxEVUkwL1ZHaXlkQno2a2QyTXdO?=
 =?gb2312?B?UU1DR2E2TE4vdXA4WUkyV3FFSm9tdmVlRjRqVC9UTVYxdjZrNGlJNDhmWHYx?=
 =?gb2312?B?Y0JEWFpFcGdVS3B4b2JYS2k3aDVwMUNPOTRrK2RMRlMvZ3JjRkxCVlMva21M?=
 =?gb2312?B?cklhdEJjdWNWMWJZTDRkLzhDbnpXUmhtWUd3Z3RKM2Fadm1wdzRHRkRONzlo?=
 =?gb2312?B?MDBBUGVETGhlTk9SZnRjck55VG9sMkQ0VHovUkRQTm5VWnR6THd4aUtPTHNP?=
 =?gb2312?B?ZW9qaVhJNFoyeXJqSkJINjcrZ2FZWnk5UGg3enZSL05rTU0zbmsrdmMrYVZU?=
 =?gb2312?B?SFdmVUhpeWZtbzYxcVhNRG1HcFdqOHE2ejdpYW5aQWlVR1RhN1FzeElUTlBm?=
 =?gb2312?B?aWM4TzhVSmVPbERoM1MzeTJQVkxiaFU5WGFKZWlJS0ZzTVk3bkM2QlFXSnRn?=
 =?gb2312?Q?9sjaSuDq3JvfWLuVzKQ+dwvsn?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 41154045-3639-40bf-fc92-08ddba0f5d74
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 08:55:31.1520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nWEYs+kXIPqi2jDtM2bzE6p8jpshiFcJP/adkxyqXm9YzzB0UE1c65Hxez3MmDmpeHvc3tZ3FCSjCxsqwuHxBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
X-Proofpoint-GUID: A9TTqL-7mP8VwS1X5d36M5Jipbrngbrh
X-Proofpoint-ORIG-GUID: A9TTqL-7mP8VwS1X5d36M5Jipbrngbrh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA3MiBTYWx0ZWRfX/BRaCeduwRdE RrTTgxAB4x48pZBnENzKfBJO6+K3BHukehWtI5Ygy9uv8QaThQ0df2s1YfodDr6Ll2Wxcl93/ng Cp8rJCZlIEa+Cuf6lxJLDLC/ktSlJZhRABv8EjqprCeavsgstr3ae9pR1/zasJ4Yg5/pX3Beo2M
 UJ7UlPzileGGXsV2GJhcasNP3mxvFXztdntAaR+0YLKLYNxqvNDFc3Iu5Yzf9RIBgUjhZxzD4Ga YiMu5DQs5czLZeZLtMmVIjMuRjonxAM/nsv7YBzWvHHhfSyvU3txeOH94KkP7awiZgfc2oPruZv gOnO9m57wF4Sv+eYhmxfdj4tVw1dOejNSLn24hZGsNok0EuAGgd9pr7j+tgcIU0sOII6Xv2JeEY
 RbQwfRnadJmyIpgvzLREgVODzpfkLCKtAIJqfXME0xy9Sw0aUZIatawgjk7ay3tdi9B7jzHk
X-Authority-Analysis: v=2.4 cv=JMg7s9Kb c=1 sm=1 tr=0 ts=68664587 cx=c_pps a=lYSdIa1zXDUQQN2vrTcVBQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=_l4uJm6h9gAA:10
 a=Wb1JkmetP80A:10 a=evnznIMVyloA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=2C6YHBdLAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=mFyHDrcPJccA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=yxGMNg53M24zlVSZdvMH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 mlxscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030072

R3JlZywgCgpJbiBjdHhfZmlyZV9ub3RpZmljYXRpb24oKSwgdGhlIGZvbGxvd2luZyBjb2RlIGNh
biBmdWxseSBwcm92ZSB0aGF0IHRoZSBoZWFkZXIgaXMgZm9sbG93ZWQgYnkgdGhlIHBheWxvYWQu
CmV2Lm1zZy5oZHIucGF5bG9hZF9zaXplID0gc2l6ZW9mKGV2KSAtIHNpemVvZihldi5tc2cuaGRy
KTsKCkkgc2VudCBhIHNlY29uZCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCwgZGlkIHlvdSBub3RpY2Ug
aXQ/IEl0IGNhbiBzb2x2ZSB0aGUgcHJvYmxlbSByZXBvcnRlZCBieSBTdGVwaGVuIFJvdGh3ZWxs
LgoKVjIgUGF0Y2g6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDcwMzA3NTMzNC44
NTY0NDUtMS1saXpoaS54dUB3aW5kcml2ZXIuY29tCgpCUiwKTGl6aGkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwq3orz+yMs6IEdyZWcgS0ggPGdyZWdAa3JvYWguY29t
Pgq3osvNyrG85DogMjAyNcTqN9TCM8jVIDE2OjMwCsrVvP7IyzogU3RlcGhlbiBSb3Rod2VsbDsg
WHUsIExpemhpCrOty806IEFybmQgQmVyZ21hbm47IExpbnV4IEtlcm5lbCBNYWlsaW5nIExpc3Q7
IExpbnV4IE5leHQgTWFpbGluZyBMaXN0Ctb3zOI6IFJlOiBsaW51eC1uZXh0OiBidWlsZCBmYWls
dXJlIGFmdGVyIG1lcmdlIG9mIHRoZSBjaGFyLW1pc2MgdHJlZQoKQ0FVVElPTjogVGhpcyBlbWFp
bCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCEKRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRl
ciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgoKT24gVGh1LCBKdWwgMDMsIDIwMjUgYXQg
MDU6MTA6MjFQTSArMTAwMCwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToKPiBIaSBhbGwsCj4KPiBB
ZnRlciBtZXJnaW5nIHRoZSBjaGFyLW1pc2MgdHJlZSwgdG9kYXkncyBsaW51eC1uZXh0IGJ1aWxk
ICh4ODZfNjQKPiBhbGxtb2Rjb25maWcpIGZhaWxlZCBsaWtlIHRoaXM6Cj4KPiBJbiBmaWxlIGlu
Y2x1ZGVkIGZyb20gaW5jbHVkZS9saW51eC9zdHJpbmcuaDozOTIsCj4gICAgICAgICAgICAgICAg
ICBmcm9tIGluY2x1ZGUvbGludXgvYml0bWFwLmg6MTMsCj4gICAgICAgICAgICAgICAgICBmcm9t
IGluY2x1ZGUvbGludXgvY3B1bWFzay5oOjEyLAo+ICAgICAgICAgICAgICAgICAgZnJvbSBhcmNo
L3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydC5oOjIxLAo+ICAgICAgICAgICAgICAgICAgZnJvbSBh
cmNoL3g4Ni9pbmNsdWRlL2FzbS9pcnFmbGFncy5oOjEwMiwKPiAgICAgICAgICAgICAgICAgIGZy
b20gaW5jbHVkZS9saW51eC9pcnFmbGFncy5oOjE4LAo+ICAgICAgICAgICAgICAgICAgZnJvbSBp
bmNsdWRlL2xpbnV4L3NwaW5sb2NrLmg6NTksCj4gICAgICAgICAgICAgICAgICBmcm9tIGluY2x1
ZGUvbGludXgvd2FpdC5oOjksCj4gICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgv
d2FpdF9iaXQuaDo4LAo+ICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2ZzLmg6
NywKPiAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9oaWdobWVtLmg6NSwKPiAg
ICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9taXNjL3Ztd192bWNpL3ZtY2lfY29udGV4dC5j
OjEwOgo+IEluIGZ1bmN0aW9uICdmb3J0aWZ5X21lbXNldF9jaGsnLAo+ICAgICBpbmxpbmVkIGZy
b20gJ2N0eF9maXJlX25vdGlmaWNhdGlvbi5pc3JhJyBhdCBkcml2ZXJzL21pc2Mvdm13X3ZtY2kv
dm1jaV9jb250ZXh0LmM6MjU0OjM6Cj4gaW5jbHVkZS9saW51eC9mb3J0aWZ5LXN0cmluZy5oOjQ4
MDoyNTogZXJyb3I6IGNhbGwgdG8gJ19fd3JpdGVfb3ZlcmZsb3dfZmllbGQnIGRlY2xhcmVkIHdp
dGggYXR0cmlidXRlIHdhcm5pbmc6IGRldGVjdGVkIHdyaXRlIGJleW9uZCBzaXplIG9mIGZpZWxk
ICgxc3QgcGFyYW1ldGVyKTsgbWF5YmUgdXNlIHN0cnVjdF9ncm91cCgpPyBbLVdlcnJvcj1hdHRy
aWJ1dGUtd2FybmluZ10KPiAgIDQ4MCB8ICAgICAgICAgICAgICAgICAgICAgICAgIF9fd3JpdGVf
b3ZlcmZsb3dfZmllbGQocF9zaXplX2ZpZWxkLCBzaXplKTsKPiAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+
IGNjMTogYWxsIHdhcm5pbmdzIGJlaW5nIHRyZWF0ZWQgYXMgZXJyb3JzCj4KPiBDYXVzZWQgYnkg
Y29tbWl0Cj4KPiAgIGJmYjRjZjlmYjk3ZSAoInZtY2k6IFByZXZlbnQgdGhlIGRpc3BhdGNoaW5n
IG9mIHVuaW5pdGlhbGl6ZWQgcGF5bG9hZHMiKQoKQWgsIG5pY2UgY2F0Y2ghICBTb3JyeSB0aGlz
IGRpZG4ndCB0cmlnZ2VyIGluIG15IHRlc3RpbmcuCgpZZXMsIGl0IGxvb2tzIGxpa2UgYm90aCB0
aGUgY29kZSBpcyBjb3JyZWN0LCBBTkQgdGhlIHdhcm5pbmcgaXMgY29ycmVjdAphcyB0aGUgY29t
cGlsZXIgaGFzIG5vIGlkZWEgdGhhdCB5b3UgY2FuIGp1c3Qgc2NyaWJibGUgb2ZmIHRoZSBlbmQg
b2YKdGhlIHN0cnVjdHVyZSBsaWtlIHRoaXMuICBJbiBmYWN0IEkgd291bGQgc2F5IHRoZSBjb2Rl
IGlzIHdyb25nIGFzIHRoZXJlCmNvdWxkIGJlIHBhZGRpbmcgYmV0d2VlbiB0aGUgdHdvIGZpZWxk
cyB0aGF0IHRoZSBjaGFuZ2UgZG9lc24ndCBoYW5kbGUKcHJvcGVybHkgKHdoaWNoIGluIHJlYWxp
dHkgcHJvYmFibHkgaXNuJ3QgaGFwcGVuaW5nKS4KCkxpemhpLCBJJ20gZ29pbmcgdG8gcmV2ZXJ0
IHRoaXMgY2hhbmdlIG5vdywgcGxlYXNlIGZpeCBpdCB1cCAicHJvcGVybHkiCmVpdGhlciBieSBj
b3JyZWN0bHkgY2hhbmdpbmcgdGhlIHN0cnVjdHVyZSBkZWZpbml0aW9uIHRvIHNob3cgdGhhdCB0
aGUKcGF5bG9hZCBpcyBoYW5naW5nIG91dCBhZnRlciB0aGUgaGVhZGVyIChhbmQgYWxzbyB5b3Ug
Y2FuIHVzZSB0aGUKX19jb3VudGVkX2J5IG1hcmspLCBvciBqdXN0IHByb3Blcmx5IHphcHBpbmcg
b3V0IHRoZSBwYXlsb2FkIGxlbmd0aCBpbgp0aGUgcHJvcGVyIHdheSBpbnN0ZWFkIG9mIGRvaW5n
ICJmdW4iIHBvaW50ZXIgbWF0aCBsaWtlIHlvdXIgY2hhbmdlIGRpZC4KCnRoYW5rcywKCmdyZWcg
ay1oCg==

