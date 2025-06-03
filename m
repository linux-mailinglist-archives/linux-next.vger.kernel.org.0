Return-Path: <linux-next+bounces-7026-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAFCACCA8C
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 17:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8651C188D9EF
	for <lists+linux-next@lfdr.de>; Tue,  3 Jun 2025 15:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA0E23BF91;
	Tue,  3 Jun 2025 15:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HlXWWWrX"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2085.outbound.protection.outlook.com [40.107.236.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A7E239E99;
	Tue,  3 Jun 2025 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965820; cv=fail; b=F09JooBGtAvDdqoB/ytltmaOh1wrtIwQ4hA/h8Ct0fyZZAwfLqXNa/muR0yH5BEBQeJtadPR+8uKDwzsE+XAt/Fm5S7Ym0DfRBV4lD01AXwiO9mbHhK8UXLpUtMBhNUk23iE32s2kEVlzVrQC1A1PcR5FPkiya3voAYpNGeIrJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965820; c=relaxed/simple;
	bh=VKO380n8Ej1fcIC30snsIb7nIYOuDXYDTQpKu7RlM+8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AQ81+TtJo/M9cxPZ2wqGnDAtAeLxUJZFq9HfE0v0CSIDnig2CGBUy4sWk2eLX9Ro9D2foxya/CN7vA/Abs4HrfitXqxdBRSeYp1Jk1gf8FDUJ700DjgEox7cMhPzfx1rcAl1p5ZDOfwgFJ6IWEzE+d6+OVUFYTOylRHlZf6Cm3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HlXWWWrX; arc=fail smtp.client-ip=40.107.236.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M97RVo2+trR8cUXgi0mb4wZ/WL2aHQvENnyV2knMLQKPTThRf/mQbYHPHQWJKeMS1tqftfUa0tD98epLrHopqZszQE+SIMlCxpaRuAzP/zODmz69sU3tk1GQ+TDrVWKNNroxz0L4zDZlCP5EXXyF3eCw/x4+8hj1PrbsevVOd+jMFDM0AluQ/N8kCv1BiSjElBPWEpG9JnYfmg1XhTH3+3VzlnUjWimvlhOgXmEzIZjw/+JD2SYWurt1JfON4Y4tMg/ytS034xLRh8lg5h5ChgxFmg7DZrNuuyt6GfjjskIGuRcaSF/VRVNdTklij34bWKV+vc0qBF3gawFYul0XsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ml3PNjHcygH4Pckn5CDshPKOcObvl0LS211h4KxiH8=;
 b=D9t05zNJM0vjb+pvLKUAKRHRxH0cY49lRn2uV7E+hGm8xCEzx8bASFKoJ1mu/WciOdfyWe3zUbgn1GIJw5hg00OVGBR5VcjvW3eZaLuDRJ19R0bWBT9C0Ucw+H5HAQqpdPzU6fMMe58xDU7TF4YTxiaj8HzyOIBECZx2bRjDAyvSYGhtkntujo+Zrhu2WObQ9wGDMivDFZ0V1e8fTmDDBCx/tImaTfmdhI7T/b3L+/tp6orOlqnt/a5EEohSvfgmrHhy8GbY/3xLYIxBUEnTYhrcYcxj+wjbtzgrZAILOPwETMWh+9qLlnmhu7qCDXBa2D9UoVsL0HXYgYcGPhy7rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ml3PNjHcygH4Pckn5CDshPKOcObvl0LS211h4KxiH8=;
 b=HlXWWWrX9i6S77EVhEz0Xqzw1TmBa5eEZDXLw3vrc0OzZDJUfIRweV7H+ZxOEEUAYlqEemUF/qZsBf2rtlLmeA18H6aVMaeqHrMlb0iD5MM/QZFsYRwhj3eqnmJQbGxv11sIPwNs9sz9k6ZslsALd2z255oyTgw5hhDD27LX4iw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) by
 PH7PR12MB6859.namprd12.prod.outlook.com (2603:10b6:510:1b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Tue, 3 Jun
 2025 15:50:15 +0000
Received: from DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620]) by DS0PR12MB6440.namprd12.prod.outlook.com
 ([fe80::6576:7d84:1c66:1620%5]) with mapi id 15.20.8792.033; Tue, 3 Jun 2025
 15:50:14 +0000
Message-ID: <bf99824e-5113-47b6-931c-819fd6b1a6df@amd.com>
Date: Tue, 3 Jun 2025 11:50:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: Use i2c adapter name to fix build
 errors
To: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pratap Nirujogi <pratap.nirujogi@amd.com>
Cc: rdunlap@infradead.org, Hans de Goede <hdegoede@redhat.com>,
 sfr@canb.auug.org.au, linux-next@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 benjamin.chan@amd.com, bin.du@amd.com, gjorgji.rosikopulos@amd.com,
 king.li@amd.com, dantony@amd.com
References: <20250530200234.1539571-1-pratap.nirujogi@amd.com>
 <20250530200234.1539571-4-pratap.nirujogi@amd.com>
 <ea615c2e-d306-06b2-10b0-2423ab59a8e9@linux.intel.com>
 <46a1ad3e-3419-4f03-b5ce-a36d2480037c@amd.com>
 <91b4b206-e518-43ab-b6da-ce337f5a348c@amd.com>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <91b4b206-e518-43ab-b6da-ce337f5a348c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CP5P284CA0081.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:93::14) To DS0PR12MB6440.namprd12.prod.outlook.com
 (2603:10b6:8:c8::18)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_|PH7PR12MB6859:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b1ef555-2ccd-409b-2d85-08dda2b65491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjZrY1ZEQ0hYR2lkVzljZnI2Zmo1M1FjS1R5dUZPaHduckx4N2o3RWxZWEVO?=
 =?utf-8?B?aTFITURRZjJxVmlBQVB5NjEwdG00WUdRL0FUOGUxd21vL0V1TEwwNUs4REFJ?=
 =?utf-8?B?NFBnZXRjRWFxZk95UktjZEtuZGZqZmU2QnlOd0hRbVoremlXSWU1SWZyRzZ6?=
 =?utf-8?B?QWRCVmx1VnNtanlQM05yMWFkTlMzNzlvQ1NHaWJrTFVicjlKaFZ5dzRoMTdQ?=
 =?utf-8?B?N25xSVBIb0ZYUllJVUlYSzlmWVhLeThzM3g0eFZqTjR5RGEzOHAxeW5tZUlM?=
 =?utf-8?B?bUpBblJjRkJScUg5MUs4NHMxWDdNUmZ5QTFsc0FhNFkvd2w1Q2s1Z2dTQTVB?=
 =?utf-8?B?VzRoS3k5Y0ZEUGhtMGc3Q3pOdTF4aU1qOXJVUTB3L0hsWTM4cFhUUDhDeTNY?=
 =?utf-8?B?bE1meVo5UG9rZGw2Wm41Qmo2b2RsWi9DR0VHMWp4Yml3bVBobWppRTYzVnlt?=
 =?utf-8?B?cDEwZitMZFpwYWJFalBER0phS3NXRVN1cVY4bzFzaDNCZnA0ZVJBbXFYQTg0?=
 =?utf-8?B?WndNV3dKVks3OVNJdTVpQkNmM1VMaUhKdFVvNkthYmZUeE9NQ243Ryt2MXZm?=
 =?utf-8?B?dlIxSzQ4eERjR3ljZ2NPNFN1dXpPM3RrSTA5UDdwbEhXejNCRzh5UHV1THVm?=
 =?utf-8?B?ZUIxcjk5cDdxU0ZtSE9MSEwzbFk3REZSN1FXbTlhbWdyT3loaTZxRXB3d0Rs?=
 =?utf-8?B?Z01tUVlzemt2bU1DVVI0a2FNaGxZcnRrdlo3ZXB0NWswd0JpTGI2dVNuenlv?=
 =?utf-8?B?RmJKUTVNNzBlNTN1bzExcW9YNUs5ZjVkOENVc3RrcjNNa2N4aXhTQTNvSHpq?=
 =?utf-8?B?b0V2VnFFTmsxSnE1blF0ckl5Rm1wVkxOaEVOQWQ1S3pJdkRVL3ltOS93NEJl?=
 =?utf-8?B?UGx1Mm5YcTBwVzJ6am9FVFAza3NUZjNNOEppaURhWFFmM2srQjltMFk0NXpT?=
 =?utf-8?B?NGZNNmJjRVhJVEFBaEJLc0lWSW9hclFmNjhEaDgrZThMd2hBT0FicTQzMkdv?=
 =?utf-8?B?aFRKN29PanNaTWFoQlAvNk9HRlYvTXp6ejRSYXlkWTE5T0prZXNmWWxyazRk?=
 =?utf-8?B?SzR1bzZMazh4djlmakJ2cFR1eVZlNEw1TE9jcWI2KzdFT0Z6VERhUUJydXFW?=
 =?utf-8?B?d3pxOTEyYkhDbkhBakp0QmZUa0dDNnJJTkQxSGRtUitHdStTNkRoUTRqSWcx?=
 =?utf-8?B?WW1LNCswY0twdTJKRE1xUDVrYllkMzNabHJNOEU3ekNkU3FIb2l3bFZJdEVz?=
 =?utf-8?B?cUF1RXJVL3UxN3NpWWJ0Z2FISjFFVkt4V3dPcHpLZnhSMlZ0VWp3N3I4VUNj?=
 =?utf-8?B?amorVTN5UXNkcTlKVUJQMU81NjVLZytlZUx2TU9KWXJaUVcxQVRYcVh1alhS?=
 =?utf-8?B?enNPZGNDK0ZZQmNNM0RZZ0dSTGwxZ056TXhlQzl6eTRmMzYrd2dSZ1FiTm56?=
 =?utf-8?B?TFFFOU45QkN6dnU4OTkrbStianRlRmF5VjFiODB0VHBOMFlGY1hIZWRjWHlD?=
 =?utf-8?B?ekExV1l0aGM1K3pFNDdzSHdacTZZZ3dhOGtkSUNuaUFPUTViWEpPaktvZk1j?=
 =?utf-8?B?ZmswQ2ROdWlBa00rWkw1N0ZTYmFzSzcvWUtqcHJJQTFTemh0QjZ6SzR1NDBR?=
 =?utf-8?B?eStqQTZyY1NpU1lFVElyNi8wK1RNcXF0V29JN3N0Nmt4ZlhkU3pQTVRvWTJq?=
 =?utf-8?B?RFhhcmk5TU1vb1VnSm40T2JKNUhCazlTeThkeTAwclNGWHFEZ3oyRkZSUXQr?=
 =?utf-8?B?Tkx6MFRPZ1Z6UStEaW4xdWR3V2NGWlRQS0Q5WUt4MEhXUEkydUk0NzRhZVRz?=
 =?utf-8?B?L0tQS010ZHdYeDJRMDljUi9qTlpkUWpVSHYrNXlFK2o5emcydVd3SSsxQm02?=
 =?utf-8?B?ZDZVUW1MNlJhUlNLZ0s0bHovRnRYK0NOQ1JiNUtNQ2dkS3RmNHZHRkV5S3p6?=
 =?utf-8?Q?Vc28lcGpXHo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6440.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tm5WNitUbTR5Z1NPNm1EbXI0UEwvSExQaVk3WUhkNVgvRXZ1OE9WNlQ0d1dB?=
 =?utf-8?B?eHBtWW5mbGtOelpleVlkeUNZcEdTeWtoSGpjMEltRWVXeFN2Y3NkODdVTWFP?=
 =?utf-8?B?bDlKb0RvaHZRN1l5UTQwUWNOTVBMMCsyMHNFRzdSTXVhVDlyQkV1cmNkVFhE?=
 =?utf-8?B?WEdwQ09nYVNlc3pNQnZ1aVZDU1Vld1NDZmlsY1QvY2hidlh4ZEFxWitXa0Ir?=
 =?utf-8?B?MitwdDNTYmppdUpsVjgzcjdYVk9KQVdvWUJBRUcyNlM1UGpuRFo1RW5PT3ZO?=
 =?utf-8?B?MjFrQ200Mzh6bnl3TnNHYXlwcmRycG1PT2E4ZTBWRFBKeUNvWnZ4dTEzdzJP?=
 =?utf-8?B?dHo0QytsdzBsZmF2cWh3ckRTSXhNTWgyWDhUVGpNSHhvWERXZHE3VHZ1b2V5?=
 =?utf-8?B?aHQ1Y0Q5UUhyOEZFcHg3aHJTRG5XS2hGUXpkZGpxZEcxSG5Gd2xvTjlMZ0N2?=
 =?utf-8?B?M05sUHBLL3JlU3lzVVYxcHRhbmtYeEtLMkJFT3ZVNU1TSWlvZXdXMGhTQ2JM?=
 =?utf-8?B?Tk8wNW83TFZnZXkvRUpNdzVYLzJDb096VllNMGxQTC9RYXF4MERqcE1RY3NS?=
 =?utf-8?B?RGhyVU4zcHY3UGRUbWtkVmIzZzkzbFlHY04zUVBuNXVQY3pod1BrWnlJS21k?=
 =?utf-8?B?M29JUTNUMk01eDFtc1Y0SGNzUXFTTkwwT0hxNVAweG9RdWhtdm1QYVF0dWhY?=
 =?utf-8?B?S1k4RjNHd2FWQnVGV3R5cHhqYzd1RGo1ci9iYTdVVGpuemc1clZOWXVuUG1H?=
 =?utf-8?B?bnRtK2ZyOXVBeEdIQTJ2SXJPSkR2WklkN0lpZTJFOVJUVGtZUDRpRmYvckZI?=
 =?utf-8?B?REEreTdDdEZWSGo5Rk4zZitDMm1NTms5eHJOeHdOaTY0Y1luWGpvVGZhdkM0?=
 =?utf-8?B?RURSaHdxRUJhNi9uaVhaRjJrb1pCaUgyaDZaRmdpbWMrV0huNnJMTDFOR0N5?=
 =?utf-8?B?M1Vka1N4L3lZS0N5YmdtSU9Yc0hwdVdLQVhNNDk5M1M1ZGNMcEJ5RmpKSEMy?=
 =?utf-8?B?SkpaSElWZTV5MjMyWWVvbkZDUmZvbFJ1YkFPNHlrQ3NBSnFZMnN0WklnOExw?=
 =?utf-8?B?YjZZRUwyOWVIMk1jMmVFS09SSFpJZHB1TnhLSFcybUo5SUxiU0M0Z1M1SVVi?=
 =?utf-8?B?a1dRTHc0SytXK1Q4MkROK2dVcnhPSFltYkR0UHhqaVkyeHlFZDZTT2xsMjV3?=
 =?utf-8?B?NXRWd25VYkdNNE1TQlQyK05FbHFLUXp3S1VXQ0Y0eWxSMjFVYWhjOS9pYUl6?=
 =?utf-8?B?bG5xQkYwRng1bG1BOVQrL2NnbnBoWmF6cXBGdDVrTjhEVEI1TkRLbnlnb1Zn?=
 =?utf-8?B?MzM0VU1HK0tLckN4aHlMVlVaVkdseWZ6TklKNHhjeGtSeHM1bUhBZkcxYWFK?=
 =?utf-8?B?cTd3RlZaYkprV2xiRXdVcDFCV0cyTXNHWHBjWXBRN081YzB3U1FUVlpWL0s2?=
 =?utf-8?B?cnBrY2xianJ5WVd5N2c5NGpONXBjNlMvQytTTXpYbnhXNzJBb2lJR0l3Z0x3?=
 =?utf-8?B?TVhYc01JQVVvYXZTRDlPZlBCMVZISjN2YXJITW9XWlV1aXVHK3JhUW1CcUYz?=
 =?utf-8?B?bkNtejZ4M3k2eG8zbEdDdHFBSERWa2htTElmT0t4Qm9xUStOaW9Uc29VdmF5?=
 =?utf-8?B?c29ZazlxUEpTWGRZMFdYL2NwaTdGcGpuM1N1ZTk3T2tlbkVYbTQzdzVhM2pi?=
 =?utf-8?B?S0dUSWRXU1B5R3VWREQ4K0dES1JTUTF4Q1p5bXBrWVhrRzdZOFprVmw3N2pQ?=
 =?utf-8?B?TzdPM2U2YkVYN1ROZHZnY1o2c0VYMFlKaFNRSjduSzV5eVhvWHJqRy96L0h2?=
 =?utf-8?B?OCsxSlpncXVBTk5HT1NLUkJabm13NHRhcWpnVWg4YUMrUTdXQ0VsWWlIUmVQ?=
 =?utf-8?B?L2QvdXhESGNJRFdhQ2VZNVlKTkFuM0dqM0pUK09KV1BFWUlyTWxnSWo4amV4?=
 =?utf-8?B?NmNFNXBDRUp4Ry9BUkxzTFZHWEYwYkZwdm9vUmxyMndFSkhWMW9XaGNibDI2?=
 =?utf-8?B?d2hMZmptWkppelhKNy80cUpxYzlWdGd6azV3WXFVT1JiMkFrc2VtLzIxc21o?=
 =?utf-8?B?dTZYdnNuUXVzb2p1R1NBWlp6SlhOdnFnanduSkVrdCtCanhESDNxRDFuLzZ3?=
 =?utf-8?Q?wa4qTL9MPOVtOLO2Ib6HuHGPZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b1ef555-2ccd-409b-2d85-08dda2b65491
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6440.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 15:50:14.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eyGJOyyRsvHC/mSlk66zjG2gV/Uui1Ods1iS8eDH3SZCg9QEHf68tUe+VBXAFX5iKWaRpYaR4Cv0oXhDOnJy9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6859



On 6/3/2025 12:46 AM, Mario Limonciello wrote:
> On 6/2/2025 10:35 PM, Nirujogi, Pratap wrote:
>> Hi Ilpo,
>>
>> On 5/31/2025 1:11 AM, Ilpo Järvinen wrote:
>>> Caution: This message originated from an External Source. Use proper 
>>> caution when opening attachments, clicking links, or responding.
>>>
>>>
>>> On Fri, 30 May 2025, Pratap Nirujogi wrote:
>>>
>>>> Use 'adapater->name' inplace of 'adapter->owner->name' to fix build 
>>>> issues
>>>> when CONFIG_MODULES is not defined.
>>>>
>>>> Fixes: 90b85567e457 ("platform/x86: Add AMD ISP platform config for 
>>>> OV05C10")
>>>
>>> This is the which should have this Fixes tag, the other commits 
>>> should not
>>> have it as they're not really the fix (but this change just depends on
>>> them, but since stable is not in picture yet for this driver we don't
>>> need to indicate even those deps).
>>>
>> Thank you, I will take care of keeping the Fixes tag only in the x86/ 
>> platform driver patch and will remove in the other two i2c driver 
>> patches.
>>
>> Sorry I think I'm not completely clear on this statement "we don't 
>> need to indicate even those deps" - Am I good if I submit the same 
>> patch series removing the Fixes tag from the two i2c driver patches? 
>> Or Is it about submitting the i2c patches independently from x86/ 
>> platform, instead of keeping all the 3 patches in a single series. Can 
>> you please help to clarify?
> 
> Keep the patches in the series, but the only one that needs a Fixes tag 
> is this one.
> 
>>
>>>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
>>>> Link: https://lore.kernel.org/all/04577a46-9add-420c- 
>>>> b181-29bad582026d@infradead.org
>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>>>   drivers/platform/x86/amd/amd_isp4.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/platform/x86/amd/amd_isp4.c b/drivers/platform/ 
>>>> x86/amd/amd_isp4.c
>>>> index 0cc01441bcbb..80b57b58621a 100644
>>>> --- a/drivers/platform/x86/amd/amd_isp4.c
>>>> +++ b/drivers/platform/x86/amd/amd_isp4.c
>>>> @@ -151,7 +151,7 @@ MODULE_DEVICE_TABLE(acpi, amdisp_sensor_ids);
>>>>
>>>>   static inline bool is_isp_i2c_adapter(struct i2c_adapter *adap)
>>>>   {
>>>> -     return !strcmp(adap->owner->name, "i2c_designware_amdisp");
>>>> +     return !strcmp(adap->name, "AMDISP DesignWare I2C adapter");
>>>
>>> Since both are in-kernel code, share that name through a define in some
>>> header.
>>>
Thanks Mario for clarifying, will take care of it in the next v2 patch 
series.

>> sure, I will find the header file that can be used to add the adap- 
>> >name definition.
>>
>> Thanks,
>> Pratap
>>
>>> -- 
>>>   i.
>>>
>>
>>
> 


