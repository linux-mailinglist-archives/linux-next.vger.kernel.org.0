Return-Path: <linux-next+bounces-7013-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0612CACBEE5
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 05:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FDCC7A8625
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 03:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B594516F265;
	Tue,  3 Jun 2025 03:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mVOve3qy"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD507374F1;
	Tue,  3 Jun 2025 03:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748921768; cv=fail; b=K2VtCG6i7WHRzg2PU+0O9Bz8EzzapELSaTzCl6dyij3zw9sMXEPCfDpboMZVB7i92NJUjMvIIpow0IgRYaTCtz3uztmig4PU1+Im2RQeVMyvDceCkCAQO/Qb3d7gWsAZqGhu9tm639HFG2gx9d9SjNdaa5yeRff71U5XxpdIpHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748921768; c=relaxed/simple;
	bh=lvaU1P4DGXf8b+Pd5moj8UheXwe+kL8tBuCwlsLAiqU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CGTS/edmfopGJas7EYlkcsMOa99rK4W3V1eDPS7NLFdbOqr7p6gt8BT6GeQDZA8lZTuZNE2gUwNKivxH7Wh1j0kiQjT5NPD7Zer9T+wgfBJzm+IKjPGcAGunsHrruKQDysH4QBhFoSlUzfZmL7gvgY44HTcHh+fcZAq24Q160b4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mVOve3qy; arc=fail smtp.client-ip=40.107.220.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EEXGXI/sp/QocTTwbYi3wysjtkvxDNTMk/4R6KvYzzywkvTNSrHg9T2eTZSvDijBu35P1v9xRCQYn1oS0P7xFHoDaoAVFDZbCUdNGIbt+/CGF7AWQROOiscfexlLE9+LChNzK7QDXFIdIcyArzd6QlfWsH6uJy+De6ZnZuX8ldccDbsyXkOdTpBE6yXgBX0XI+eWt8CO5HnrmfppVsfsAt3e8s74x91lDz5KHGLDxWyqO9JFLoPMK+jEQtbmq1R9Mzdzun7U91yy5ffMMXyQYVgnCLJrl/RLqBFJA5NJMZDLmDdwubGB1No2XgHUgUGerFXpyg00IRzqMPyf1pPLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAENdllspli96dUE5ui0se1cEjsK6gSbo4yxRZ6rXVc=;
 b=Ho2s66cty/pc2/WtlczXvDIBqAPT4v6bsXpdJVQxl8tqPy0I1Pg+nDdX10bf4N1603kcpMNXlcPVdx7Vqrhqdpyt+oyQSJaTwyu6AK464DTg2p4ak8gO0QWl4hkd/Go73JwS2fflfOxyThlYkvJlP6a8oyW6PXYV2PsmKD2gNJaaPtbFOrgR402OPCMDYRwI0ySnrgzGn4uhYuuC13Zg/RhWYYD5hMoQivFU1B3c0iI2oxDsEoowLAx5erdXfBvrwkhQ8q0eE6KC4lx4XsnXRjN59H25sLQrvEhYdgchOLsvk9IXZ5hkaHDIKY0H3NEFXRnhCODafqurDKfw7TTijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAENdllspli96dUE5ui0se1cEjsK6gSbo4yxRZ6rXVc=;
 b=mVOve3qy8b9WugAwUIs0viay8SxKYFguId8AVQ2NiidkDowADR5ZU6e+oTSqp5vQh2AXk9g1OUQait93FttmNizgfkw3Zv1YOA1l7AfJykd2DoD0cmwWw/YrBk7omRmX3d62s2eVpV/t+6i6Hk5iJC2dB+iW17R0O/YD5+N5vPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 LV8PR12MB9359.namprd12.prod.outlook.com (2603:10b6:408:1fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 03:36:01 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8722.031; Tue, 3 Jun 2025
 03:36:01 +0000
Message-ID: <46a1ad3e-3419-4f03-b5ce-a36d2480037c@amd.com>
Date: Mon, 2 Jun 2025 23:35:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: Use i2c adapter name to fix build
 errors
Content-Language: en-GB
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: rdunlap@infradead.org, Hans de Goede <hdegoede@redhat.com>,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com>
 <20250530200234.1539571-4-pratap.nirujogi@amd.com>
 <ea615c2e-d306-06b2-10b0-2423ab59a8e9@linux.intel.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <ea615c2e-d306-06b2-10b0-2423ab59a8e9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::26) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|LV8PR12MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1ac876-77e8-443b-1225-08dda24fc2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnFPTFF3YlRsWXlrUkd6b1NNRDVMMStrRVFYRTZEb3JSUXJUeUE1ZXErbThz?=
 =?utf-8?B?T014ajBwNGIwcm1UZlhtY2h0RFUwUkEzeklTclN5RFZxekZUTitFODFreXlj?=
 =?utf-8?B?TTBkZEdnQjg3VW9uNnVNaEJFRHJ2azVTVjMxRUlHRFNPZ2ZVazU3VlBiMXdH?=
 =?utf-8?B?NlhjdWFGY3BtaTlRLzBDUkE0T1I0MVZpdEhyOFQwZW9yUEVzRGU3bkNlc0lU?=
 =?utf-8?B?WnEyUElzbDJyS0tLVDY2WFZaY0FGeHlUVWpjWkJkRzUxTFFRNkZjUXByWkZV?=
 =?utf-8?B?akxPUHpyNi9TdHpGMnE1RDJ2THA4M3pmUTkyNkRVWVNwOEl6WkRocU82NktR?=
 =?utf-8?B?Q1hIU2NSV1ZveHpJcnRhc3VWemF0TDN1QkxZOGNnaDIzc0VYeHF1NjQ4aWFp?=
 =?utf-8?B?Sk5WTnNqQTRyQ2FBMzcvMzFTWE53VzRaYTNYMTR6S0U0K1c3YXczVkZzRmFz?=
 =?utf-8?B?SFJhZXNZdit4Y3h1alFJZXFlaEk1TE43ZWZlU3dJZ2pFeDdDRVRlZE83d2ZK?=
 =?utf-8?B?NzZrOXlJenF6NWtLNFdERStMTlptQzFVTXBoY01UaWJGU212VG9jcEl1QlNi?=
 =?utf-8?B?OWZkNGpRb3Z5TGlXMGI0U05sNDlVcWtDdUJucnN5ZDBCMlFRb0pIbHZuaFVl?=
 =?utf-8?B?MUsvd00zdGJES3BTMTUrc1hORC9VQ0Z1UTRYUVJjVVlLdEdJcVBadk9tSHNB?=
 =?utf-8?B?NzJrRDhDcWJGMDRpZ1FXNm9zdmdPa29pTjd1ZWgwOWFacW9hZGNRQ2lEYkhj?=
 =?utf-8?B?N011cTFOSVhyRjRJQ2ZDenlHMlNBT1F4NEFya2xUUjU4KzRBNHM5UC9oMXIv?=
 =?utf-8?B?NEk5WTJhK2xFT29xYmpoSXFlTTlsN29GRmNUZkNuQ2hveHpNL3B3Skx1Smhy?=
 =?utf-8?B?R1FnUGszWkJFOFIzRkgyU3B1MVFNQlV2UXo5VURhOVpqWitYeDhmaCt5K09F?=
 =?utf-8?B?MzV4Q0xRd0NxbHpTcHAxMFFxTk9STmNBclFGODhIMk1TZWIvSFpoVEJ4a1Zz?=
 =?utf-8?B?clZoN0N1eFoyKzVNQkVWbGtaZis4U01tc1lZUjZ1V0piRG9meGROVlFrZGdo?=
 =?utf-8?B?QVFSdWFQYklaY1k2bFlrMDdWMWgwdVZZSitUaUYxQ2RJSjF0eE1vcmFpbHhK?=
 =?utf-8?B?Z1RKZk5FbHZRamxPall5RGs0RmF1T1huV1Y2Nk9PS1pRNDBHN2wvZHo4SnRY?=
 =?utf-8?B?d0ZXN1lQOHpYSGRoUG4vOE9ndndDV1pUcnJOWWNkWFBrbnhmWHI3REY1cXE2?=
 =?utf-8?B?aThXMzZCRWt0OFk4bnFuYmUxYmhLMGRlUFVhZ2lubWFvaEJVdzZyTFRZNXJD?=
 =?utf-8?B?Y1NWT0ZoTWJETllhV1FsTzRsNkFmRmhCaU1sWklKRzBIdzhmZ2RvQUs5SXJh?=
 =?utf-8?B?cEJUMXh6K09vZElDRmZzMmJUYjdOd21aQXNZWGw2WVpjQmJYMDRvQWd3elU2?=
 =?utf-8?B?KzJVa2ZsL05IbGRQeU9qQXY0QWpzVjdCdmZLcDlIUXFjMnA4UkQ1OS9kY0hj?=
 =?utf-8?B?UnV1UU11QTdPQWFIWDFvL2g2Y2VPZC9lN2ZiYUdrbDd4dmtJSmVoRTQ0TnUw?=
 =?utf-8?B?S3BBK0FzNytXenNiUXRyb2NMd1ZpVDd3T3MwbzJVemFkU2NEOENNRUpvR0dq?=
 =?utf-8?B?UzNPR1JhMWdMVlArTGNtVHFnMXUzWWdMS0FPaWUrVnc2MEN5Qkt1cHlJNmxl?=
 =?utf-8?B?Y2dVN1NQZjVmTTBzaG11SDIzZXdCcDdWMGlLc2F2cGRGTmJDZWZCMzgyVGlE?=
 =?utf-8?B?RnpBaWtMc2psWVNZR0o4TEJuanRMNzd6czRwWURudTc5WHk5ZWc1OVdqRFBV?=
 =?utf-8?B?dEsyYTR6QjN4SW1wUmhSbjlXS29ORGQ1Tkg1WHFtaXhZTWsxb3lrQXNncVJx?=
 =?utf-8?B?QUtYbkVMVDRpTHgycEE5Vm9pbElXOXdNTjlyMGpTeVYwUDErbGVWUm1yMGtL?=
 =?utf-8?Q?rwT5aV178GQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlkwZmZyM1lXdm5JM3BTbTFsaHRRVVZkbkpKUUZHWWtSV0ZyUkJWSFRoSUNX?=
 =?utf-8?B?WWNTZldLQmU3R01pSEd0MmUwYkhIc1NPK1dNK0Z6QldLKzFqeEowR0syeTA1?=
 =?utf-8?B?cDFGT0YzblhFU0lreXpHSmRleWdQQkdGOWlSaXhJQTJpUlV5andYR0l4V3Bh?=
 =?utf-8?B?UjdranhYVDYxYXVaL2MrUERVUjAvM3l4VzM0dklIeklPLzZROTNvUDh1NGlE?=
 =?utf-8?B?Y3ZzUEU5Z0hxcjViOUhRUzBmTTQwRW9xTVJML2FKWEFWMlpPaUw0QUZ6cVJY?=
 =?utf-8?B?eVBvbjFKTmxyMWdWUGF1dVRJWFhIbzhmSnIwTFA5dzBlUnZDME9qWHNYRzd3?=
 =?utf-8?B?dkR4VVZTTGJlZjAxQ2RTdGJQOVh5VnJGTEJBNnQvcTNWRkp1ME9IVjRpa09P?=
 =?utf-8?B?UlpRZ2pTbk1nZFZLN2hQM1NjR3VSYUFSZ0Z6U3djTVU0TC9uNG1SOWdGSzJk?=
 =?utf-8?B?ZVdURjZ0RHVzcTJHcnZPZFMrOWl6Z2duU01xaWtRMWkrVkFlR2duODEyMVU5?=
 =?utf-8?B?V0w1bWR4TkF3cHFxYkNlSkpOcG5IcEtwNDRNZzhVZFVjdnIrOUpPOXhtUzVX?=
 =?utf-8?B?V1RIb1B4QTV0K0g2SFFnTk5YWGZEME9GejhQbDd2N2piblVIdHZsUUd5emY2?=
 =?utf-8?B?Ry91SkxIdnRhbmlEV0dJcnRuUDFRUEdhUEJzR2FXRXFlQnhsZWNZNFNWaTli?=
 =?utf-8?B?c2tIbFdjZUZONWxpUkJPVmZ5a3Nrb0UwVFRtcWtBQmdIUW5HS2x6ZWNpNDAv?=
 =?utf-8?B?OHU2TnJZS3AzVk9STTJIZG5mWHhCOXBoamNZdlErcDFXZHRDSi9JeGkxbWxF?=
 =?utf-8?B?cS9FUGo2U3dIYXc5RUtsWnBYZ3JrYnQvWmwwdTBrTldnc24xdWUwMFFzWlRQ?=
 =?utf-8?B?UnFnN2JWVkk3SFlrU1ZWM3NseTRqYkFjeHVDblVjNnpsblgyS2pVa2h0eWZF?=
 =?utf-8?B?RE9BU29uVmt4MG11SHVWYzUvaU55RXhTdFZocE0ybitxdjJncVlGV2EySGt2?=
 =?utf-8?B?MWhPQUlXVG9vdFJqbFJxaktVbm5KVVRQTEwrRWVPNjdyNkNoeUhJUzN3NWpS?=
 =?utf-8?B?YVdNdUxibUZBdktDM2MzaFdreWJBaEpFZkJWY256eUpOOUw3M0ViV2tNUk4w?=
 =?utf-8?B?SVI1czBZVEpwVDNoVUlKSFN1alR6b2F4ajlmcXZ5a0t2SE4wVGlMb1hqOGhz?=
 =?utf-8?B?TE1sTzIzRkIweWRBdjNtb2tiUzUrSkNrZWFZV3JUWWlQbm9nOSs1UXNRNEZq?=
 =?utf-8?B?N1ZsSy9od2lDaEtMVld1d3c1VnZoSnpBV1NPd0xzdnlVa0JXSHAwYW90bHdU?=
 =?utf-8?B?YWppUDg4V096djU5OUJzOVBwaXZIcUNrU1JMOHZmY1RDWkpzVGZ4VVZSSDRV?=
 =?utf-8?B?WlNvdklQZDNxNXhidVZ5aFZPKytqTWlNL2RWMDEzNEhwaU9GKzk5c0FpTkdv?=
 =?utf-8?B?TWtvSGhtNUswN3gyRUxWLzlKV1dETlZHV0FRNnQ3TmhlaG1XVmZ6T2JjVU5L?=
 =?utf-8?B?RmhRaFFTZGFnS0ovLzBVSWQ5c2VFZlY2WHFidk0vNDY1Qlp0SWp6OEhlNkww?=
 =?utf-8?B?cGc4bGM4Yi9jRmdIQ1RWVzlUMmNmQ1p4ZE9uYm1IeGc3ZU5DcjF4LzRzNDJv?=
 =?utf-8?B?TlVzdkhSdTIzaldGcVlRdG9WNVFKU0xHREl3dXBKSThkOHpHaStibS8vMXVZ?=
 =?utf-8?B?ZFkyQ0JWNkdnY3RPL09Nemw1MkVoZ1gvSGVreThPUGVGZ2NCZHRNY041UG1W?=
 =?utf-8?B?b2tvNDNGazBTOUZSZVVJaGhRUWhEMVR5bG13bWIyZmoxbDZOM1Z6OVFOdlYx?=
 =?utf-8?B?UDZ5Wkl4L2JRWnhoNzM1RlNzMThPV0tnZVFZakl5UE5CMmQrOHZUSEpMcjFX?=
 =?utf-8?B?RkRrajhWSHVMQWZYQ1JtVHBKc2M0bWV4VjJTN2hoM2JFVGJUUjR3N21FWlA3?=
 =?utf-8?B?R255Y1ZsVGlZU2NTTmpxMlA1SzMraXQzd0dtUlN5eGtkOGs2Tm5QUmxGWFdP?=
 =?utf-8?B?cVFxbmtnSXZ2ZHptL2Z1NjEzc216dXhFVlVVTTg1c2hnSG9aMFRnajI1OXor?=
 =?utf-8?B?Q2hOMGZLc25tUHZkK2lLcDZyQUxqQUJUVDlSRTVVUldWbTA0aWJxamZycmlH?=
 =?utf-8?Q?xe76M/3PfNNV9o6mnyUZnL/MP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1ac876-77e8-443b-1225-08dda24fc2de
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 03:36:01.4685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wt+gztG0w/1Kyuo04FrN+gOZ4mBSrFYs83r2MWyOENWPU+cymby2eMe8puOwQJoIZu3eTT5LnVwpGkq4XYaNsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9359

Hi Ilpo,

On 5/31/2025 1:11 AM, Ilpo Järvinen wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Fri, 30 May 2025, Pratap Nirujogi wrote:
> 
>> Use 'adapater->name' inplace of 'adapter->owner->name' to fix build issues
>> when CONFIG_MODULES is not defined.
>>
>> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for OV05C10")
> 
> This is the which should have this Fixes tag, the other commits should not
> have it as they're not really the fix (but this change just depends on
> them, but since stable is not in picture yet for this driver we don't
> need to indicate even those deps).
> 
Thank you, I will take care of keeping the Fixes tag only in the 
x86/platform driver patch and will remove in the other two i2c driver 
patches.

Sorry I think I'm not completely clear on this statement "we don't need 
to indicate even those deps" - Am I good if I submit the same patch 
series removing the Fixes tag from the two i2c driver patches? Or Is it 
about submitting the i2c patches independently from x86/platform, 
instead of keeping all the 3 patches in a single series. Can you please 
help to clarify?

>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> Link: https://lore.kernel.org/all/04577a46-9add-420c-b181-29bad582026d@infradead.org
>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>> ---
>>   drivers/platform/x86/amd/amd_isp4.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/x86/amd/amd_isp4.c
>> index 0cc01441bcbb..80b57b58621a 100644
>> --- a/drivers/platform/x86/amd/amd_isp4.c
>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>> @@ -151,7 +151,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>>
>>   static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>>   {
>> -     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>> +     return !strcmp(adap->name, "AMDISP DesignWare I2C adapter");
> 
> Since both are in-kernel code, share that name through a define in some
> header.
>
sure, I will find the header file that can be used to add the adap->name 
definition.

Thanks,
Pratap

> --
>   i.
> 


