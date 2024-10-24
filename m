Return-Path: <linux-next+bounces-4424-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19A9AF4A3
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 23:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF87C1C2171D
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 21:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4701ACDED;
	Thu, 24 Oct 2024 21:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WlHwHhGB"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9357A18784C;
	Thu, 24 Oct 2024 21:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729804894; cv=fail; b=Y0SJmG9REwQ13Ram9hmrQ9KdPM8v48MKDaXfVxqReA5YjcL8i2xvUQD9Ob+ab/Uqv8+R0Kp2MSrnXjQqY6juhMMyGwn0MZPkHvFwSzbbBDyEVrSs9l8784MjnWJqmh8lIYFZoVRm+HgnBwlpsHD0fI2XqyLm6nws3uUsEqESqDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729804894; c=relaxed/simple;
	bh=RaliIpoVxCdpFkq1mGMnlm46KbpNSW7nUMLjcz6QwDg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LpuopAZuQgg8omQC5AE5plKOu+C+1WKi3fzLUSMoYU+pqXygqU0jJ8zKR6P9LwUmBEiWVKEaWtt1h9XCZL8nCa+Ox+XzJrmxt4tNN2STXVWZA7+vxgE5HAJR4t8cnJ2xKzlQKJxg017OppMNSNSC2Ev/GgJFwNClemEGvOC2YX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WlHwHhGB; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QLZCJzTr91F6BAmfIKbd/OKce1QWgoCsY6aUBtsasUX1S4yHIDqGZ3ZmRsQ2fXWVFrKO+n5BRuqnQ3cz3NhK6b4/XuQvXRiIunCt5bUMWjAjN3OA26d1AKI4pMvBpLGiXU4e/LrsiWUmgb1Rqh8P8PzeSb8nGpSWPym1HLsMm8780eI4pW3p8xAwNiFiRVhh3RnbRXTvRSslbZ3LJu2YihJ3S9uhHGRdQL+SSZHScy1Ybgm5orC6zw6Kz2OGBDlJtWYY89lk/OduUH6b/vLHvBmxQ5veSdfHfXGgoKXUOxRfxafe1xxydlij0QucxVn3z3WhyOQZNt9UAMpczvIevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gEnnWmaroKEhIWYp8IDcqzekRj5kvk+LCiuDishQ1A=;
 b=SJmeIrYiMDJ4BE4AJISHpe1qse6/PkaNtLbQUw67fUmuCEbeAPBaoGFn0jTXcLX3cW6sV7p+kpzn7GUxArW3LSpZ/nVKyGudoo/b8AUIohdRYE9ADWHv9JLEUkEmWfNjypAt4InzXGXUNheGImEq8/y3OOGP1K0cVJ2E7LdyHLHe8JwL12p9bPWdXS8i/LgnO0kJuB+Phm5VGKDh4G1JqYxW9xltGAHxQvGxEhfoMPlt591xw3K+qIg7WAsnh8p3tnWDcnIP9rWu9/tt9i29qDK+5NuYfn+v5VUZdHsfZ0OYnvSbR+1B3iyvf9r82TbD6Yb94DomoNhoMOlbHUd4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gEnnWmaroKEhIWYp8IDcqzekRj5kvk+LCiuDishQ1A=;
 b=WlHwHhGBwHxp0Qeru9t8GKNs3RkN5tuuTzOjIGmzOI5BxhU8dJnPV3rhpCN9KG+0zXqlfxExCDTRlTvkTH5UUpnoM1ITL2C2jfWsjiizhwLM4ui3iiq8iw1xduOa2r2rOu1bAfwVXuZ18/XpX0gUYUnRRS5tR0tOybmbhp0vVJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6733.namprd12.prod.outlook.com (2603:10b6:a03:477::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 21:21:30 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 21:21:29 +0000
Message-ID: <bef548ce-edfb-49c5-89f9-b77e8cd8692f@amd.com>
Date: Thu, 24 Oct 2024 16:21:28 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the pci tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241025080800.354b7575@canb.auug.org.au>
 <20241025081022.5af39f10@canb.auug.org.au>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241025081022.5af39f10@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::14) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6733:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7a8990-14bf-4be4-9589-08dcf471d37f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eXcvVDlVeEc2aEtJOUE0akN2RjVDNGsrQXRBSEJZcnFlR1d5SlFteG5oRk54?=
 =?utf-8?B?R3FocG5abFBRSWFieWRxMGJZY1ZZRjdxVllaVHVFRUZQYUV3ems1RWZFV2J6?=
 =?utf-8?B?czZ6Qi9xTnNMdEdwVUI1WER6VTk3VVhDM3ZVdVFuTFoxY1VPMlVmV29FaFE4?=
 =?utf-8?B?MDduTzhKWkFjZ3NsMXlNUVBDUjdIVGF3U1FkMWVWZkNaaW0rbXpld2cwa3BH?=
 =?utf-8?B?TkZZeUdlbjVGMVVxdW16cGdGbUJLWFU4NERuREUxeUJWUWxCUVhad0ptTkJj?=
 =?utf-8?B?bHppTU1LV2xJdVBoMXc1T3NLZFJkUUowaHZPaFQxUzJtSUV5YkxEN1BxMHB6?=
 =?utf-8?B?ZUpKZHhkUEpnTit4UE9EcHZzdTRraUVKMElkRzlKcVJiZVF5RVhKN3N1ZS9X?=
 =?utf-8?B?TDZxdFRIV21vcUhocDl1QllvYjkrVjg5cTJodjQvb1ZJWlBUaGJ6Z0J3dkYr?=
 =?utf-8?B?RVE0VDRHTFVzRG5wTWJIRStaWGU0M2hYaTdIMDFRcmJNRzc5bnQ2MTJITzVZ?=
 =?utf-8?B?b0FuTkE2clAzdnhQdzJaOXVDSS92aGV0UlpTVXFaZ2FMTEFzaUNLdUw3Mkpl?=
 =?utf-8?B?SVpQcUVyYVdjdmlSUzJqV0pqT2JIRGpzRW0wNDJvcEo0a0p3WnBGRFVYRnNa?=
 =?utf-8?B?SFRvQnh1TGpQaFJzZG02YVRCdTZJbGRoZXN6RDhwUUZkTlpCN1daSS9SMm1F?=
 =?utf-8?B?eFhiZjVXK1BtaHVicmY4K3JjRnBUbEl0bzIyR3NKYUVuZXFCZytMc1RHSCtn?=
 =?utf-8?B?ZW5WT3hGU2JzcUxLYTBNbmR1UHkxYTZadWsxN3F1Nnhra09sejJ4VTh5dTVn?=
 =?utf-8?B?MTFrOEY5YVdqRGEyUXlndEVzNmlPdGdzTDVBNDIrUXpWay9VU3AwTkFZdGJU?=
 =?utf-8?B?MGlmT3FNNkYrUHVYSnBGM3hMTVJ1NlRCZTZwTzhKU1FKNXlFc0s4U0lRa1NX?=
 =?utf-8?B?R1QxTWxGaVh3azdEMzRzSUdwTjZ3eEFJWktGbUdXcnMwS1NTall0RnBURUlV?=
 =?utf-8?B?cEszbk1UVzNXS2V4aXNUTEFnTnVQZ0lTeUJ3VUJPVlhySVJpRm1sUGVQT2xK?=
 =?utf-8?B?eVA1M1RzS3FXUXVmQU13OVp1MWFRMHJ6Vy82TitHY2llcm5yem1MRVdjQmlQ?=
 =?utf-8?B?ZmZYcHc2VVJscitlakdzZE90bFJ0b3dGMEV2blcrRXdpajY0R3NGSGFsdVdN?=
 =?utf-8?B?NkZBUDIxVExtUVphdk12M29CNTUzVERtZEdyMk45cllCa1cyZTYwRTlBVnN3?=
 =?utf-8?B?RkRFbWhBWWhnK3ZjVUpFTCt4Q2pzaHA1eEZHbnNDaGtHR01rRUF0RGl0Zlor?=
 =?utf-8?B?bklWbUh1ZG1jeUVlZWwwR1RiM0FWLytITXZ6cnplNFNoS0Q0Y2hidlo0TWlz?=
 =?utf-8?B?N3l0cTczVVUxY1RrWVFrS3lOVmtQdDJhNG9vZUwxVXRCYzM5UGZWSE05YWpO?=
 =?utf-8?B?OFJSaEpjekZTSjFWYmdranBGc05KUjlVcitUcUVaREZOc0UvRzl2dkdxaUVj?=
 =?utf-8?B?TE5qKzlzZ25uVUw3REZKOG5zZTRXZkpvT0pEbXYzQUprR0twN3grZGtGZk1I?=
 =?utf-8?B?UlhXdGFtWVZTb21iSjROdnM4SFFEcnRLbjVKWTZrS3NQMGRSUExCUUNnYVBk?=
 =?utf-8?B?WnpUWlZCT3JvcGIrZlhsQm51RG00STE0cHF6WE0yQisvUS9nbjBlanNodnF1?=
 =?utf-8?B?WXpjKzk3NXU0a1pLMHdGekZGRmZoQlQ4WVBnempGNDd0MUV6M0g1NnphdSsy?=
 =?utf-8?Q?o7fKKvOvNcWDndSKsYrydf5utV9Rvkxuc59OMFo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmRUQ0dJbTllK1l6Ri9nZzZQTVZYeHdiamM0UEg3aWJOTG9YVDhNakIwNTRp?=
 =?utf-8?B?ajkzRHF2L1JyQk5MeWtYVTNmUjljRlM5TkhRdnNRcjMxSkNzcDhoWUlUOGl4?=
 =?utf-8?B?OGpOcjFEc3dWNE9wbStmUGJZTE4wRnQybTBlc2phczBvbGhUTVhUemJqelY5?=
 =?utf-8?B?Z0l3eTZYUExEVjlycEROSGpqakwzbUV0QU5vVHh1TExpdVpHUzZCd09RdzUy?=
 =?utf-8?B?TDBqZGJjQmF5L1pweXdUdXQ5RXZNSzlBYWlueHkxUC9tZ0NqZ2xzeEd5b0JI?=
 =?utf-8?B?Rk5EbktycHdPSlY2YXlQZkordWdGRnNKR1ZiTkhzZ0hFa2J1bGNIWkNRRm5V?=
 =?utf-8?B?OUlsTzZOc2lVeTExNXFjSmhZMCtodUNybk5RSzlmSzRFZ0xjNGFuRVg3YjND?=
 =?utf-8?B?ekViTVJPeks2ZGY2bHA0TGFrZ3pjRlgyZzFYWUk5Qjc5UnNwUzVIWDYrMGw0?=
 =?utf-8?B?d1JmMDQwR3FyTjIySDFZd3RZOE0rdHhRempBSW9ZckZyRWJFUWlGS1JxUVVB?=
 =?utf-8?B?T09GRUJ0YWpFcDl3c0czc3BJTmdRd3JGd0NGSDZzYm1qSzFaRERsa2hLYnNy?=
 =?utf-8?B?Nmw1cVJYMHpQQUc2aWhWWDBSOTlCeVpYVXVWRTNzc1V3WDhlaGtoTXBzWkNX?=
 =?utf-8?B?QXRZMFl0ekg5dTRqSFJwc1VNZTVTVHhqZkx5bm5NMVRweXA1TGpzek9BNCs4?=
 =?utf-8?B?NTV3N21JR29odlpUS3VhSlBQcmRTb2dOQmdRSnN3aFhpckdNd2xOL0kraXkw?=
 =?utf-8?B?YlE0VFU3QmU0ZE5kUGoyT3NuQ0pZQnhPWTFPWG81a0FUYnZUVWI1UmxFbjli?=
 =?utf-8?B?K0VZZ3Q2cjNSRWMyU1BrcXhCcGt2VDRHTVYvZ1htdzNzOCs4RnpzQmYwd3g0?=
 =?utf-8?B?Smw4NFI5d0NVWC92YTk4bUhKdlJHRXdVSHVpU2hoUVBSYldYOHZSek1UdCtI?=
 =?utf-8?B?eis3QUxyYkZzM2NWeVpQdXBOWVZlZGZxejJ6SU1NUU1mc25pQTB6b3RHcHBD?=
 =?utf-8?B?NGpGV3F2b2NqTjA3V2tBQUxxdXg3RTIyeE5KQWVNR2xZSDJaSGhXQitIaGN5?=
 =?utf-8?B?UUZxMXVMaUxOclRJbWpUbHZMelhjRnV0TXFCVDVxeCtPeUhXYndOOGVFU1JP?=
 =?utf-8?B?WFFSRnBmaHZuZEorbXNtQWt1RzdsNlZ1SERQU25nSmQ1dWVMTStia2NvRkRD?=
 =?utf-8?B?NzVydTlKa3NYVGU4TWI3OEhZM1dadDRnVVdpaWVRcDM1WVY5L2JSSVJuemt1?=
 =?utf-8?B?MGdMa2VKUUFmOUJwZmN3QnE4WVQrbXVBbnFreWl3aEk4SFNPdnpicTgvY0xr?=
 =?utf-8?B?d0Y0MDYrWk5mRUZEUStLb2lXcFFGOWRQYVA0dEdaMVdTaWF0bGZLYXIxbEZp?=
 =?utf-8?B?L2VyRHBxZjQ3b3ByZmdZQktxR3JTaXRqMjhXRHIrWVZWT283NlJPRHp1WEdJ?=
 =?utf-8?B?MDlYWGxVTVJXK1dNNEJ2TnV1S09mVXB4NndlUDI2UFo3aFgyZWdCRGVRVEhq?=
 =?utf-8?B?aityb245ZE9DN1hDK1BPVDZNT0FPWFhLb01wNGhkWVY3OHYxendGOXJFL2gx?=
 =?utf-8?B?ZTVMRytVYXdnTUdUYWZrMUs3SzM4TG5JcGt5NXRkb3pScnEwd3pRWUIxenpt?=
 =?utf-8?B?MmJZYnkrZVIrak9YQng0c0UvZjNhRW9NNzc2bElGaENPR0M3ajQrd1pPMkpI?=
 =?utf-8?B?bCtLVG42NHVIQlhuZWM0aXRYNno3RjloZ2VqemZwenhETWxGZytDRTFiTGJY?=
 =?utf-8?B?M2xvT3ZaUWowWUI3SjRUSDM5eUZMMmt0ZE4zV2JaZnlvOHRWUENjVU9zdTg1?=
 =?utf-8?B?TmVnWEZQUmhiY3ViWHNBdTY1d3VxSTRiNkhpTUFTK0pBWDFEWjZDTDhSN2Vz?=
 =?utf-8?B?UmtWQmt0ZytXKzFhUVNDNkNJdXNVRVJka3Z3SEsrYXJ5eUduTVVaWm9VNWU3?=
 =?utf-8?B?SWFDMEVhZnYzOEZMbThBTXRjMHZjbG1mSHVoM3dYYVQ1aE5XendJYUdIeWZE?=
 =?utf-8?B?UmMrZFk2akVRTWhjWUhUaWtreUM0Nzd0M2FkaFJHaFpHQWNCSHdTcFg1M0Z3?=
 =?utf-8?B?azF3QXBpcVRCcmNaK1V1K0Z0cHdDWXJmMGtrdFptbFRRNlBRQ1lqS0k5d0RX?=
 =?utf-8?Q?pZj0sI0cxhDBChQyAwoeCpU39?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7a8990-14bf-4be4-9589-08dcf471d37f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 21:21:29.7842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUJoEWZJtfVf0RE6Tixzsqj4wWw0nHp61/g3Jg8Jhi6LoXYi7STbECRT29zdfVj9g+g/T1nox9QHU7XOrOW6hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6733

On 10/24/2024 16:10, Stephen Rothwell wrote:
> Hi all,
> 
> Sorry, this should have referred to the pm tree not he pci tree.
> 
> On Fri, 25 Oct 2024 08:08:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> In commit
>>
>>    7027b415ff1a ("cpufreq/amd-pstate-ut: Add fix for min freq unit test")
>>
>> Fixes tag
>>
>>    Fixes: 642aff3964b0f ("cpufreq/amd-pstate: Set the initial min_freq to lowest_nonlinear_freq")
>>
>> has these problem(s):
>>
>>    - Target SHA1 does not exist
>>
>> Maybe you meant
>>
>> Fixes: f2542c904294 ("cpufreq/amd-pstate: Set the initial min_freq to lowest_nonlinear_freq")
> 

Ah, this happened because we did a rebase to drop out some patches 
pulled in prematurely the commit IDs changed for stuff on top. Both 
commits are coming in 6.13-rc1 so there is no impact to stable trees, I 
guess it's OK if the commit log has a mistake.

