Return-Path: <linux-next+bounces-6750-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C41F5AB5B53
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 19:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E46D188EFFE
	for <lists+linux-next@lfdr.de>; Tue, 13 May 2025 17:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8C12BFC65;
	Tue, 13 May 2025 17:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gnc/OKMt"
X-Original-To: linux-next@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B782BFC68
	for <linux-next@vger.kernel.org>; Tue, 13 May 2025 17:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747157408; cv=fail; b=rfHl1c9mm/esjZfO1eBLsJSk6LyDrfp9zaK0PNg0g2QMy/XWqMwcCLKvmQMzFblVbrkHgNfeetFjU11w8Y0lCaHHWhIhLy84I5WbCx/HfiIreKIep4K74oO2TlzPq/xbvHElzqfrY0FUNTOTFQAsqJLCn6zZn01u5U4xCbMFWXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747157408; c=relaxed/simple;
	bh=vEhhnSgLxxoN7liEQMv7sDbk8mo1Ew2xtBCRd8i/jhs=;
	h=From:Date:To:CC:Message-ID:In-Reply-To:References:Subject:
	 Content-Type:MIME-Version; b=vCuO82ud04vUdT5iaFFlib0wAN4QFZwrlj9JInTVEH74Wq4siqZGkNF5nB8j2Ur/2qsqEXd3DR66iPSfVEpolTk85AXqzBQjGYe1+eIETDkbpcGqd0k3L5FuxgooWONRQhTlEDodndU0JlPL93G/9iZMx/HRSUJDikdy4aq0a2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gnc/OKMt; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747157406; x=1778693406;
  h=from:date:to:cc:message-id:in-reply-to:references:
   subject:content-transfer-encoding:mime-version;
  bh=vEhhnSgLxxoN7liEQMv7sDbk8mo1Ew2xtBCRd8i/jhs=;
  b=Gnc/OKMtg7B2XZ5jgyIq6uCIYBPncasconFr7olXDqD500x4iC7jyQNf
   H8bJTxMXCoXbt3n3/dSvqKaRhQYb6i/YI2ureofWgdyG36jUnhMuULSex
   g/6XGc2ii8txwGBDMyDUuJEP5AN7YiLDjDt6q5LYQ4lWey0j3rR5+TmEO
   Ku/GmNWJtdY2Fr+TFklvgqhHF+Wl0/oa3B5BHWi2FQOBmqBcyoA7uhDrG
   1mcX+dgZopUQp3b+J3MKSMoea51rIpi9N+xMicl8HTPLkDRU5ypSHq6N+
   //TzyOpMarIaGnmoki4gtiHLSSVi7kh2FldTwfksu2FlfQP3vpT4Sp0He
   g==;
X-CSE-ConnectionGUID: 3joVS9M4SYGy5VRjZfMZ6w==
X-CSE-MsgGUID: gS8ZVtJmQWOsLkdckPACSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48949758"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="48949758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 10:30:06 -0700
X-CSE-ConnectionGUID: rvDzHq+VRLy3I1m7sqkY7A==
X-CSE-MsgGUID: mlFkOXIESAeJPaltXq3Xkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="141818564"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 10:30:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 10:30:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 10:30:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 10:30:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmP4mzs1xn9gwvoNX3t2rPFMTuVMGZZZZTHxvlcMpQfPylCQ6MrgmG+So2MbDbA3Bf7pfJ/mNdhCqi7FSTTMf94tfziN9B1wkAulXza/PTQ/KDpkuprvY/gUc/QeRrfLs8do8ZWCw075yben9FbVdnQmuvAuvqpuJf7Z2HOC2sY4r/suCN/V6Z+tKqXkqhQHRK5G40VE444BDuFz2yMNCYWykbQvwdfJxyrn+ECeXN9fzjTxC8MV+ghCs1yN5NHx4eiBRxhMlZYAL3oyvjtLaDNFwtBWhPXrpBzMFKd2GCLFLLPlZkPe7TUcn9NlbX8dP+DcGdDqja6SsVioX4lq1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdgChs7nO9Owm4OylFUKivj/O0kOJ2ZoR7Ed3ZgQ+gE=;
 b=g2fcuLyvy8zfy2bZ253kuc0Il+MwbqUM91AoXNQIihMkBLJzLNQww45UpQFBYDkDoTk94HmtmlHye0NYCDVcHB+t4ZPqIoi+nEDrK2K+yAJcAYDtHg2lvER9ZKbHpgrInDqOBeHnZV4eWSQrAVxnSgXAwz01+l/EDdFzYROVrk+J3UHGOU7xH86d9tJZUqYjeeeYn69jP0agNB2+VKhlanP7MPzzQxCopsUlc5nhpAcsvAa10jtqHTfObBKBl/NHwZOA4H5/KIZaG8HCaVgeeC7HIuBnXLus75yMlKlmIZYL1xrHiVvXQ3I/wvZtqO0XhVUgRCOEWMhWVWpT5wIpEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 17:29:47 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 17:29:47 +0000
From: <dan.j.williams@intel.com>
Date: Tue, 13 May 2025 10:29:46 -0700
To: <dan.j.williams@intel.com>, =?UTF-8?B?VGhvbWFzIFdlacOfc2NodWg=?=
	<linux@weissschuh.net>, Cedric Xing <cedric.xing@intel.com>
CC: <dan.j.williams@intel.com>, <sfr@canb.auug.org.au>,
	<sathyanarayanan.kuppuswamy@linux.intel.com>, <yilun.xu@intel.com>,
	<sameo@rivosinc.com>, <aik@amd.com>, <suzuki.poulose@arm.com>,
	<steven.price@arm.com>, <lukas@wunner.de>, <greg@kroah.com>,
	<linux-next@vger.kernel.org>
Message-ID: <6823818a4ccba_49706100aa@dwillia2-mobl4.notmuch>
In-Reply-To: <682381198ad46_49706100fe@dwillia2-mobl4.notmuch>
References: <46e745b2-65b4-46b4-affc-d0fafd8ebdf0@t-8ch.de>
 <20250513164154.10109-1-cedric.xing@intel.com>
 <ee550446-ef6f-4fd1-bffd-cc09f82bd883@t-8ch.de>
 <682381198ad46_49706100fe@dwillia2-mobl4.notmuch>
Subject: Re: [PATCH v2] tsm-mr: Fix init breakage after bin_attrs
 constification by scoping non-const pointers to init phase
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR11CA0096.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::37) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH0PR11MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e4fa4d-e29c-47b4-04bb-08dd9243c250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZHZNTENPblp4bGJvVWcvc1psQWVqNFZsOHNvVmVMbGQxbklzakx5a2VHZlF5?=
 =?utf-8?B?M1poTWtJQUpNcEtJcE9lYzdpcnRiZzB6K0s3UVhYZlAyUW0xNlovdml1QXJ3?=
 =?utf-8?B?c09CQnc5UTJZMHJuS0RjL09xQVdQUUc3VUZXT0VIMnM1V2FmL3RKaVlZNFVB?=
 =?utf-8?B?b1VyUTVoU0JXQm1TVVpTc0k4SlNkOEFnRERvWmsyakRZSkV6NU5hRjdGQjh0?=
 =?utf-8?B?alltazUvMEdEbk1BVGVyZHJZWTdMNTdmSGR1aVhYNEZ3K2xiYTJHcWcvV2k1?=
 =?utf-8?B?TEVzVnpRdVgxelhVR01tRmpsL0ZuQ3k5Y0lGWDFwaG8zMlZxN3Z0c1VDc3Zj?=
 =?utf-8?B?bWZNL0UzMlBIdkhhcFZrZWczcnplUlRoVVZ6UU96ZTJxeklzWlVheXFCQUNM?=
 =?utf-8?B?c0N0VWMrc3E3TXlQVjFWcHNFYmoxZmFScnNYSTVQcFU0QkVtNFBrdHFEOThi?=
 =?utf-8?B?NVRTWW8zWk5XNGRvcEpjbzVlME5DVFBzZjZkdE5sMGJEUUlTL2FhalltZVR5?=
 =?utf-8?B?OTRvRGplajVoakVQL3FIOXBHWjI4TWxmMEd5eVYrTUNmMjFRNGdzcTB0Q1JT?=
 =?utf-8?B?RStsKytjQjBRNzRkOWxXakZFeThrRFdSc2cxbjZvaDc0NUxSeW5PVGNOZUZa?=
 =?utf-8?B?K3BUT216WEVBbjl5ODF2NXpaL0pUZDBOUTZ3djBHczJIYTlURTBxVWtJM00v?=
 =?utf-8?B?Ty84K01Qa2daeXhLaHpieVFydW8raU5PUXk5dXRjaFFkK1c3NnhNb0VraExz?=
 =?utf-8?B?OERJRWJXbXJmczZGbUMvdXVTaURyU05oSHd4QXhFcGttcEpYZFMzVkhHc2N3?=
 =?utf-8?B?QjFJUkFYMlRtQ2lkOXRqWUpsMWhLSVJUeFZEWUh0MHlmRGl4NjZZbmJTMEdY?=
 =?utf-8?B?ejFvdHdsQktmRG5XblNLVXJReGRCNTc0SzJrNkpOUXBSYnpBQklVelJNaU9I?=
 =?utf-8?B?SDlzRm5pMkxEYXRCWGVnR2QrcUxvemhMekF1MmlIWStxUUlKZ2VrQVhaYjBi?=
 =?utf-8?B?N3orZFRvbzZER1Jsdm40cFg4VnZHRlExUmpwaHJUd2ZFcGRDc1JRcDNQYVQw?=
 =?utf-8?B?UkNVRWlwVUF5UTF1Wmtib2FwU0ZJNHNyUEdDUXp0MGZNaERFSW5vRzVBSWJv?=
 =?utf-8?B?K3VjVSt1dUI0UTdmdENqV3pzNnduenJDdzZyU1BmbG9Cb0pzRG51WG5pSkVS?=
 =?utf-8?B?MzFEdElIL1N1TTN0N1liN0JOSldJYjRlbFBGMnI5MnJYb3Z4OHFBREJYYXdF?=
 =?utf-8?B?VEtXckFWUGEvSnVSOW8raFl1K25VU2M3Q0wyeitqbE5LRGs0QUFCcHI0b2d1?=
 =?utf-8?B?blh1b1NPT21paXJNODRnRmIvOHZyYzN4TGhuMnF0UGNjNlgxclNET0VyMVRO?=
 =?utf-8?B?WUlSck4rMkJQcjNYUGcvTC9IRmJBbFcvQlNXMFhaWGhuaWljRGw3VDZkQnlu?=
 =?utf-8?B?c2hsM3dPM2NkZ0VqTGgvUzlsRHV0YjRqWklrdktOWEJwa2ZncnRsb3pHN3VR?=
 =?utf-8?B?UVJhbXQyL0FNb2kyK05McldhT3Jwa2s2OGw0YXNXdmZGSE5JcVlieG9SeFNX?=
 =?utf-8?B?OG9zbkRHVjdXYmpWVVQ4Ty9kUTV0d2JlTmxDTHlmcU9SZ01nbW9RVXVrVnlz?=
 =?utf-8?B?L2RoWlR0bC9wQWxmRkhCRnhoZStYdkxaV0liRGQ2QmNUR21OVHZtUERYUFcy?=
 =?utf-8?B?TXB6Yi9iTFlDZ1lzM1djME5ON0VxUlN4ckkyQWxzbXRSREhpa0xxVysxODBV?=
 =?utf-8?B?cnl1N2k5UmVRdS90RytCbXJVdldCeDd3MHZpN09rUzh4V09RYWkrMFdic0sr?=
 =?utf-8?B?cVk4Yk9BandXbTQyUFNkRDhTcmJwaUVkamlCcXNTSjVtSEZFeFYzblVXcUox?=
 =?utf-8?B?RjVYcHg1UUFsOHdkNTY5RlhhVlJsNWpHVExTd2hHc013enhJdFRHWG5WeFJo?=
 =?utf-8?Q?ui9gffjDYlg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGpSQnFCelFtRko2S2pUM29nbEkrMlFReDVDM0krcVU0c3Z0VktpVEhpMXN6?=
 =?utf-8?B?Vzh6QUtRUUpZNmJER3hqTk9JT1lPZ1NoSlJvZW5RTTdSOXBucVZvK3Ird1NQ?=
 =?utf-8?B?SkRrRTVwTmxwTGhSVmNrNEhNZnNaOTBRM2V4cWt0WWpxNWxibGROUjFLcEFy?=
 =?utf-8?B?OEhqK21oN0VNN3VhYzUvTVVUWTVYV2NUOUFzWDgwY2NSS0dHLzJYZGZrQzl0?=
 =?utf-8?B?bzRpZHRCZVBsOVI3alc2dmcyMVNIc3hROHEwSlNOK09oWFl1ZXZtUjNPQ2xT?=
 =?utf-8?B?QUc1cjUyVDJ3YlVnRjZBN3QvWWhGaDVmUDdaRE9ybVhVMVZXWVM1enhqMitG?=
 =?utf-8?B?NjVwekMzdEh1YVFiUGNadjhQWkFTcDFXYkhCTmQ0Yk9zUUR1Y2xEL2JDMHc2?=
 =?utf-8?B?MkJNTm41WHJLbGV0c2FVZHdRVHNLeGg1Um5LanYwZXpVK2h4ZGNjakVZbEEx?=
 =?utf-8?B?OVVVWDJacXpqZFFCU0l5UHYveS9KZno3VG1vUXJlWUxGSHUrM2ZUb25LTU1N?=
 =?utf-8?B?WkhlOHUrbWpNbUJzUXFSOG9DaC9UaHN1N3VwQmtFWXZuQ0dSajV6T2hYSWVX?=
 =?utf-8?B?Zkh3QmRkcC95K1ptcnBkcVhaZWJFa3hVWmpiUDdPS3RPa3lRQ0k0KzVxeEdP?=
 =?utf-8?B?RFhHNU9kUnJmL3R5Z1M0Y1IvcHpJa2FqQm1oRXVza1kza2VjQlF3S1FQbVpF?=
 =?utf-8?B?bkN2Q1hEdE9OR0VUZUdxZVE2eGFjMHFJK05halY4RTJyb1F5SzNTVFpQZG03?=
 =?utf-8?B?ZkN5OWhUU3N2TDNPWmtnOFQ0Q01ORGFWWTlRcmhnQ1NRcGNDTHI3aTV0OTdh?=
 =?utf-8?B?b1JnQURTaW1IRTdqZXY2akFyMDdIakdBRTM5R1BqYW4yU2N1a0RKVWoyaFhi?=
 =?utf-8?B?WVh2NTdzc0pCUmw3WnNnTXBPSXhxamRYcXllRmFVakRIdnJqdHJERHZydVZQ?=
 =?utf-8?B?dVg0WDd6MisyZlp6NUFINitrd2VLa0E5WlFXancyOXUzV1RKbWJIZHZOYmNS?=
 =?utf-8?B?RjI0WFhPMExaTkhnMlU3cnc0b29STmhRN0hrQ3E5MGxZb2JOc01FYlpkWktZ?=
 =?utf-8?B?MGxLRW40YmFMZjNzTmtrRTZKWnF4TjZ1clJYN0R2eE0xdUNoQm5DZGwvWE4v?=
 =?utf-8?B?YkxycURLd3YvSzhlbEtpUUp6WnNtTWpZdnZYTk95akJaUWRJelJsVjZwa2tO?=
 =?utf-8?B?eW8vMy9SOVQxSkJzdU9reUwzdkk5eGRmQis3Rm9oemRqNVdRSkxZYVBRV29u?=
 =?utf-8?B?TDlEUzYrYTJWVDNVQ0l0b29BWDkvRHFUamtncHlZL1VNcTc1OW0xOE9nVDgy?=
 =?utf-8?B?Q3I1UHFQNHl5NU9vWVA5dkJFRjVLUExRdmJaQWx6Vmx1RHNVOHBJZzBKS3FW?=
 =?utf-8?B?d0VuZ2ZhOVZxMmtpd2ZpUmVSK0VRU3gxRGh3ZXNCN0ZscGl5VGJKZG44NnhT?=
 =?utf-8?B?VWRSTWIvcS9WNkhkYUNqSWNlM1krTWdUMDgrdll5Q2dSY2VNZnFwTlVpUmhy?=
 =?utf-8?B?MzlxU0cvKzdaeXVobmxCNE91KzByL09BUGhmM2VURms0ZmdlMmJvL0VvWmh4?=
 =?utf-8?B?Y21Vb014eHVUdHRJTnEvM1UyK1pMQ09xYnluVFlvZmpMZVVVWTRUdWdnQlBT?=
 =?utf-8?B?Y0t1RVM5UE5yWXJCV3ZRdGxSL2g3UG5Jekd5cEJaWFluSGpuZUNvUUtFNkxk?=
 =?utf-8?B?WmtTa1U3UFQ1UnhDSXdSdXRQR25vV2VZQWkreEY1MTRCclpDS2tKUFlDS0lP?=
 =?utf-8?B?dm1rNzcrL1FHT050UjdTdjRDR1EwQUUwQVhINENtUkU3ZjRoa3pkT2hKL0kz?=
 =?utf-8?B?ZFFtNmloZWJxcUhxMEpIR3BZa3IzOXpVQ0haanFISmhQZjMzN2hnOERpVDRP?=
 =?utf-8?B?aHFoOVZhZkxNdElNWGpzNnVMS21MNklJQkVFSWQ2SDF2bFhjM3gvam9OSDJQ?=
 =?utf-8?B?NDVLOXNvSTFlbmJCeS9jazNIZjlJbVRBS2NJR0VONzkxWXN2WVV4OENsSlZX?=
 =?utf-8?B?UzJiUUhicVhZTzJ2SkNTc3RvQjUyQVBmKzFLR3YyQ0ViTUsyZVdUcHZMNmlZ?=
 =?utf-8?B?aHVGNkRtQURlRUVlNHQ5VHZQYW5LR2YreE02TVl0V3hpQnNJbzFwdHhVQ0hq?=
 =?utf-8?B?QWVDdzhwSktyUFR1WnRZTk9SclpsRnptQXBlc1NhZDJROUpEekhJeW9rS0gr?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e4fa4d-e29c-47b4-04bb-08dd9243c250
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:29:47.8515
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 334q51YkJRp5rwtoNSEmT6KHSBKAaKEyk2eAfiPKNB9Z/mRuNjGrrTfX6paCQfY3p7etKFWrr/+4DmT6GIfMlokwwDpTohNyAw3/YnrSSLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
X-OriginatorOrg: intel.com

dan.j.williams@ wrote:
> Thomas Wei=C3=9Fschuh wrote:
> > On 2025-05-13 11:41:54-0500, Cedric Xing wrote:
> > > Commit 9bec944506fa ("sysfs: constify attribute_group::bin_attrs") en=
forced
> > > the ro-after-init principle by making elements of bin_attrs_new point=
ing to
> > > const.
> > >=20
> > > To align with this change, introduce a temporary variable `bap` withi=
n the
> > > initialization loop. This improves code clarity by explicitly marking=
 the
> > > initialization scope and eliminates the need for type casts when assi=
gning
> > > to bin_attrs_new.
> > >=20
> > > Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> > > ---
> > >  drivers/virt/coco/tsm-mr.c | 30 +++++++++++++++---------------
> > >  1 file changed, 15 insertions(+), 15 deletions(-)
> >=20
> > <snip>
> >=20
> > > @@ -244,7 +244,7 @@ EXPORT_SYMBOL_GPL(tsm_mr_create_attribute_group);
> > >  void tsm_mr_free_attribute_group(const struct attribute_group *attr_=
grp)
> > >  {
> > >  	if (!IS_ERR_OR_NULL(attr_grp)) {
> > > -		kfree(attr_grp->bin_attrs);
> > > +		kfree(attr_grp->bin_attrs_new);
> >=20
> > This is good, but the assignment also needs to be done to .bin_attrs_ne=
w.
> > That is the code I can find on LKML:
> > https://lore.kernel.org/lkml/20250506-tdx-rtmr-v6-1-ac6ff5e9d58a@intel.=
com/
>=20
> Oh, the latest fixup that preceded this only went to linux-coco:
>=20
> http://lore.kernel.org/20250509010104.669669-1-dan.j.williams@intel.com

Sorry, this one:

http://lore.kernel.org/20250509020739.882913-1-dan.j.williams@intel.com


