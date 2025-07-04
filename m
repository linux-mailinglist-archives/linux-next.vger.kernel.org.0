Return-Path: <linux-next+bounces-7348-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBCBAF857A
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 04:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 308673A2A25
	for <lists+linux-next@lfdr.de>; Fri,  4 Jul 2025 02:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BBE262A6;
	Fri,  4 Jul 2025 02:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="RGWzTzTo"
X-Original-To: linux-next@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012060.outbound.protection.outlook.com [52.101.126.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8513828F4;
	Fri,  4 Jul 2025 02:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751595383; cv=fail; b=cavT5QRW6pIHcgGIddqtperhxCv/dXzQhgMI6idB/iSzlEEWv2R/4mU56di1b2yg/+4fpdesyOEntu+2tI5qvCWoTshUrr/JysPQU13Kafh+2s49ypM6QxA6whsaL9WV57hSJ4+VdaN/8eMwgb9h9FYlloO4LBPJs1do/pM5FlQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751595383; c=relaxed/simple;
	bh=OxYTCyW6trWHegwX/XqWPAwH+fxhVNlP6xnJmnZWUYk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UNhwTQR2jc9HLwUQG5nHyd1W+CL7NfNET48dN+PpvJUFEOnf2nnuhZ6XyQN91p3maGDkNWP2cDoi9Za/jCTpk00HzxfiltA/KYJ4rwPCZvbD2yo5chM1sLkA5TaNtZpnZdPFfcyblN8uV6FlJLXCyMvIwQvbENQwOrXGGRyeNE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=RGWzTzTo; arc=fail smtp.client-ip=52.101.126.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7dIZdFM6OAfW9J8t+438Is+oljD9ACx2Lx7tr4lubMlCIdw0wq49rx20majShijLe5NnHf4jxv9Z33Z8NQfwWmn7JipAPlCBdidzhdwzWqGHrGBhvq1YrQq98E5obOLKB0OdOgp4aMSFafGQFk5hdGb96BqOgzc1nrnnV44bBDitEkt5AuyrkqFpXZ2gP8TZuRtVqqAJkzogZiv1MB+pqJltbBPORn1JXJHOBBYd8qjVoji9fsTDoEhtf9CEfqe6VAOuUJA/XiR9WoIoJBdr4gS+qmJJrmzvYypdUnmYHyhFIOukGwe5ot8Ot6k034BUuOScJ2/xZ7jLSd2Qvc4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVdarAR+mWRMftrnhQ2gyOTz1pVganWcpz0VYTPA4fY=;
 b=hnrPuQCdxX1lcfvP+cNxIXISKxQK+F9HWT5ZgILdPUHFGUdJ96p6kt+zSD4AqvSNZr28Jw2kC/FQpfZD+PCLVluc1zDr88szXxDI6rdTx8KRwNF8XUZ6g+DBAsn2cg89pI2XFGcXUT9hs7JWSp0GA5+rQbuV5HVQlDb2KsVwDpPO6I17zWxG1GZJw7lVWDPVMYELBbwqmypPTCorVVxWqjdNSIILcoPAmaUYFAqQ7AyD2B2Oen5cADTNKp6NZuvTAb1KeF2uSal2rZIgTeeCjmNZ9YbQl+WKXQP2hJVcpQaqIkbWR4eC9wrmQerQJ1aAhfF9DmYd72/wOTkmv2DTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVdarAR+mWRMftrnhQ2gyOTz1pVganWcpz0VYTPA4fY=;
 b=RGWzTzToV+Yj3OjvfecnUad7jWF12YktM5vYFVPWeJ9OfhGhwzBExcrytv6yQjaZgM9Rw+VmpwFuxThCNjt1Y321oQA/jIdLuIktL5CzhCJycws0nj6M5+koM6uI75tgnZoj/WSALROcRF1nPph866H6JmWmVNxBvzHicVvUXPLWc3wHwhVQ+glwMdiWCLKQSalYVQ0/vU8AKVuVwFgYLAq05WXZM5WOV2F2B1M1WozuaAV07WohVvcFIP1GqkJT5gdna5GRNJgMepu/5Z2mN+HX9s/wTQKBhwT1cE9lBlgoqTKSS34eh0C6RWhoE5EAAaQSly87Ni69BG6OJ55eQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB6463.apcprd06.prod.outlook.com (2603:1096:400:464::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 02:16:14 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8880.024; Fri, 4 Jul 2025
 02:16:12 +0000
Message-ID: <bd7bf583-5c75-4e73-9672-657749a72b1a@vivo.com>
Date: Fri, 4 Jul 2025 10:16:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the i2c-host tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250704120207.3e7d0d7e@canb.auug.org.au>
Content-Language: en-US
From: Qianfeng Rong <rongqianfeng@vivo.com>
In-Reply-To: <20250704120207.3e7d0d7e@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGAP274CA0021.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::33)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 70427720-8b2d-4905-74b6-08ddbaa0bf02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dHZSNUdHajFSeTZhZnNweStidHNsb1daQ2pMV2dGbE1IU2lqM0pHREZkZnoy?=
 =?utf-8?B?NFF4T1lmSll2ZWRnQm1qSFdWek41dUREQjh2Z0syOVZrMC9OeTYxeHRESHgw?=
 =?utf-8?B?dmxabHdqQnVSVkpadzNYVmVzeEJtY2g3dmdsYityREg0UER2cVJSY28zTWRw?=
 =?utf-8?B?bWRmdWttMUpBYkZoclZHMHZXdERhZkl6UytPUjNvcXlhN0oyYmhuQklNQXNW?=
 =?utf-8?B?NVhUTHZsejNZSy9XL3RsMkFtOG9jNEtJancxczJXdU0ycTN2MDZHaDZzV2pm?=
 =?utf-8?B?R3ZTcjZwTlRYUERPU1FseFZXaWVpdzMyQ3loUHAzN3NxTTAvQUVFd3VrL0Rx?=
 =?utf-8?B?dFVOd01iT0dNQUFUcGFwcWxkeCtUbXlseVZGc08wTWluZ3NKcGxSRGJTT2Fn?=
 =?utf-8?B?M08yaFJ3elJ4dkYwQTVRYnRsSlhicXBJYm1xMHFwaHpJNG1kenJsUmFvaTZq?=
 =?utf-8?B?UDRJcEtvMkpkQzZ6eDJkam52QXU0bE9BTDdpMTVwSlhmWFZscjRKRVVTN3cz?=
 =?utf-8?B?d1pkOEtNZ3IxUXFZM2JNU3VubTlOUmhnbUhSa1M2N2N3MG9IV0NjS3NwckdL?=
 =?utf-8?B?NitWM3VVZ1JTa3BZR0lma1JGbmhBRGNxM202K3FtZDdjcVdsM3RtZ1ViTUlt?=
 =?utf-8?B?aXliMUdsRG9Lc0pvaGpUQU0yQWdGYjBpaVB5bkYxRk1jbTRZTzlaTXdOT05Q?=
 =?utf-8?B?TzNsS2JiajhFSzhUeVR1YmxoRWR3UVVPbGE0U05GVExCR0FLamNkb00zZVhC?=
 =?utf-8?B?SnpqMFU4ME5YMFNUVE1lODcrbGVpZVpjY1hSamdpN0pHZ2o2WGN1eWdRbmsy?=
 =?utf-8?B?TGR6RzBhUFpJK1BVMVovZlBZQUduNVJXNnlnMWJVRXpJcE5SSGlLM244azFV?=
 =?utf-8?B?Vnpjek04Q1cyb09LQ0xuVktyOElCN0NKUFVOVDVtazFkSmFud2RLTlJTbWZp?=
 =?utf-8?B?cWQ2dXBPTDhjeEMxUjgvZ3h1cElMeEFsSXYyTVdSaGJsUVYzaXJMWkVaUTM3?=
 =?utf-8?B?UUlpSjN2Rjd1ZkNNbzlGT01jaGFZOWtvYmxOTnZFODloblJycG5ob3g1YzdS?=
 =?utf-8?B?S3hrbWJ0aFl1b25kZHhiNnkxN2svZWgybjJicUtFYXlXS3JROXd1WkxxUUg3?=
 =?utf-8?B?Rm5uTDQ2Vm5HczZTRFNKcmphcGhYNlVkejBJMEp5Vm4xWHh2cGxHWDdhUW1G?=
 =?utf-8?B?QkpTR1JLZk5pZ0NQY1UyOFJpcjU2QjlyRXVKWFJxa1J5RWVjSjJMVjk1R1RX?=
 =?utf-8?B?NG5qZG9ROXhiQnUzNjkwTnJabEwvcXZJYTAxM0xEZnRNWUdKRFZ2UTlSYmlI?=
 =?utf-8?B?ZHlKdjYxMnd3dFFpamljNStmd0J0NUJ2YXJLMlFzUEFtYzIxRUlaR3pGQjh2?=
 =?utf-8?B?Z3Z6UmRicGZjOGhscENDMGU1TUl3V0srd05Qdm1xOTlLSWh1Z3RVTVFlU2xm?=
 =?utf-8?B?RzN4L2NjK251QkJyMDR5dStFVkk4aHRRcXBjckdvYyszYXBvUjJYRkdicVVm?=
 =?utf-8?B?YnZMTTVST1FzTXJDWktyanh3amdKalh0SlRnYTdIVUpyWE9QYTNaZDhaM1hk?=
 =?utf-8?B?c2ZwcFNRbURBRG03WVBXSGZmQ2QwYnYvOW9mRmpwSTRRZU1hOE9FYUxIVTg3?=
 =?utf-8?B?RFpOekdCVlZicmFGRGZHSUhLMUx2WnNyaFV0OE90d3V6cnlwRTZqZkkrcnNU?=
 =?utf-8?B?dTltTE4zM1pYdGtRUm5EVjBMdHVZMC85bVV6UWtVSE5TSldRbWJNNTdxVWFM?=
 =?utf-8?B?a3JFUUNsUUR1SVMwalh0L2phdkNaYUVWd3N0a1VnNmNHKzlkTVc3b0VhTE45?=
 =?utf-8?B?MzZPeHpuWlNzK1dZL2dIdStnLzF3cGxYZ05la2g3YjR1dW5xS0VYZndUdWJk?=
 =?utf-8?B?OTJnNkJmRzBIUmY3eFVJWDBpWmxNSmtvNTl0Nks1OHdBcE5uUjdpd0hvejBG?=
 =?utf-8?Q?1vY4wExg4Bo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEVWZzMzQjdBVmdqODhJd2phWE8zazlUQmdnYWZJckEwUHA0ZHZtenlMU1lI?=
 =?utf-8?B?c1ZWOEdoMVRUdDYzOTZ3empNMFRUdmV1RThqcmE2b1RWcnZYZEk4U2c4Mkl6?=
 =?utf-8?B?R3V5MEROUjU1dS9sWEZTQUw4UzZJQVMvbXRoNmFVdXVZdVJJdG4zbm1xTW9l?=
 =?utf-8?B?b2YwTFB5NG1sMUpwenQrQVlvRDJKeklPaFBWY05NSWdNRVF4TDNpUlNNRzI3?=
 =?utf-8?B?TUpTOFNsRUJsLzgwZUZSM3BhdW84dTcvTklqU2k5R1FTZXd2aDc0RVNqRkV4?=
 =?utf-8?B?Rkt2bitKMFlLY3NuNFFBZW5VK0JMcDZtc08xVEs0bGxOUE1wbzdyekFvb1B0?=
 =?utf-8?B?RCtnTlZRMDdmT1NmTnh2UFQxZ3NJMWg2NW5DenJCNTllb3AyS0JQTmpNMWtj?=
 =?utf-8?B?MjhsZFJ2RGNnbG1VYUJLei9JZ1BHdUc0L250VjN3QUVVODNsTXBZbkgxOEJL?=
 =?utf-8?B?Ym1sYlB4akpuZW5BUmFLa0xzbHUvNTQ0ZUd3SzZEYnZZenNSSmtiajU2MEFk?=
 =?utf-8?B?UUZRdExqTTlDc2tXMDUwWUNQU3FFaUN1NjhyOGo5aFhhd0t2czY0cXp4eURW?=
 =?utf-8?B?K1dPdHZ2QzIrNktKNWd6Q0hpMmhMVVBlcDJjTlVMeUlONExIT1Y2QzhaYkNI?=
 =?utf-8?B?Yk5sV1VSUmlncWs5VC82K1Y4MExwN1RPUDBZaU40QnEzSmtnUUpFa1NYWSto?=
 =?utf-8?B?WUtHZDBibUtPcERRREs3aWlSd0pTY09mbHhTQjdnRXl6R21tR2lQTVdjT2R2?=
 =?utf-8?B?dGhla1Y3SWEzYWhlVmJIQklMOWF6R0s2Ym9SWDhGRmpBeWxBUzZRZlFpblVT?=
 =?utf-8?B?bHpoYlo5YW5zYVpUdlpJOERUTzFrNjQvZC93MWUxLzJxTjZtTFNnOVFrQ0pi?=
 =?utf-8?B?ZS94M2JsUFJucmtRYzg0SDMzT3BRbHFPNnpUWHM2N1ZtM2d0MER1YVBVM0hS?=
 =?utf-8?B?czl5OGswVkRlYktvMk14b3JvQ0I2NHNMSXdQajFXZDYydmZmNS80SjlHQ0px?=
 =?utf-8?B?Y2NNTzMxaDB1cDNEMWZTZzE4QWhRdXNkK0c0aXJuVWYvUks3OG82d01wSzJT?=
 =?utf-8?B?cUR3dTN4YW1XZ0pCR2FWQ3dpTHk2KzZ6ZytKRVZmMXNsTzMwVDZKM2hPMVdZ?=
 =?utf-8?B?TzBJYlQ4MGl0bkRJNit6R3IzQXlUd2VCZy9VS2h3a0Z5K2RqQnk2MXRBbTBX?=
 =?utf-8?B?S0MyNy9wQlExQ1lXU0toNkhCVE5DQ25CUjhMc0JiejZ4dWR0YTlRc0dEUGtt?=
 =?utf-8?B?bSt4ekx3aGdpT25mVTNzanpvY1RNWW1URGFPeW1PRmVvcXpyZFY3MFhza2Vl?=
 =?utf-8?B?NU0vV1R4cnRJK2hGa3RrMEVWS1IvNzlQZThjaTJib0F5a0JMZ0xCdkRtd3B4?=
 =?utf-8?B?VGhyR05TSHJERVlpMXFodldRUDZXdzZpTHpjQUsxOXk4QUtnM3QwdGJaVm5J?=
 =?utf-8?B?WEFyMnZhMmlJYnRIYzl6c0t4Y0dnRGFiTG00Z2pzaFQxVU5VNzJwK1ZDWDRG?=
 =?utf-8?B?eGJwQTBsSHlIMUxQV05Ma2NMNkxGQjFzNHUyTjZYRXh0K0hZUkx6cXZsaVRz?=
 =?utf-8?B?UUZYcGQrQWc2UEowK3pMWjJ3elNNRU9nRkw2N2lwRTdqUFhQRW1hOEdhUjhr?=
 =?utf-8?B?VCtBWFhEUWxoTElydGQ4MzBENzdpK1ltZU9pSnRyanpMN1cxVmF6ZGZVOGVO?=
 =?utf-8?B?dHNTKzFFTm1EMkgwZGR0UlRnVjRmSVFnbkIwU2phTm9weWpaejRnNTExVnpK?=
 =?utf-8?B?VGVOYklzZFdvOFpNMWpCQmhML2lxRkxWU2svV3AwR081TytEN256NG14S1Aw?=
 =?utf-8?B?TFdvbE9SampMQmNSVTUvL1BQQ1FzTSsraDVRWG92UUZJc2M5aXBBUlJFSE9I?=
 =?utf-8?B?SnZWaWRzWmh1QmNrWms5M3I4UVk0dEdmUjdpOEZ6cUp0b0NBMVZCZ0M0dlZY?=
 =?utf-8?B?RGJ0bU9iM1lPQ1lFR3N2bXVDclRBa3MxclN0Y25UWHQwRXhuKzVJTWlsZjNJ?=
 =?utf-8?B?U3FXN0pTYy9hYUFpSVZCeGdvR2htRnlkOXhsaDdzR2ZjbGFMaUNIR2hqdVJL?=
 =?utf-8?B?YWoxTWZPR2VQd1crV2ptMkxaVHROcFVpQkl5U2xEZHNLS0hTcmNRaUlkbEJ2?=
 =?utf-8?Q?ZnGNnWI+i9Lgkm+9rA3beGk+c?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70427720-8b2d-4905-74b6-08ddbaa0bf02
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 02:16:11.9995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OIGFCDgWtzV0ZqdbIPxhGWswC8DsnOvPnsmcaJJvn+bcXnye0Zf/CRga6+Qt27DuXjc4wS/TOH2gIiW5bPl3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6463

在 2025/7/4 10:02, Stephen Rothwell 写道:
> Hi all,
>
> After merging the i2c-host tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> In file included from <command-line>:
> drivers/i2c/busses/i2c-st.c: In function 'st_i2c_rd_fill_tx_fifo':
> include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_369' declared with attribute error: min(max, 0x8 - tx_fstat) signedness error
>    568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |                                             ^
> include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
>    549 |                         prefix ## suffix();                             \
>        |                         ^~~~~~
> include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
>    568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>        |         ^~~~~~~~~~~~~~~~~~~
> include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>     39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>        |                                     ^~~~~~~~~~~~~~~~~~
> include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>     93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
>        |         ^~~~~~~~~~~~~~~~
> include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
>     98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>        |         ^~~~~~~~~~~~~~~~~~
> include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
>    105 | #define min(x, y)       __careful_cmp(min, x, y)
>        |                         ^~~~~~~~~~~~~
> drivers/i2c/busses/i2c-st.c:453:13: note: in expansion of macro 'min'
>    453 |         i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
>        |             ^~~
>
> Caused by commit
>
>    cbae4d3dd2f7 ("i2c: busses: Use min() to improve code")
>
> I have used the i2c-host tree from next-20250703 for today.

Hi all,

I'm sorry, I made a mistake,  can anyone help to roll back this patch?
But I want to ask if it's because I didn't compile with W=1 and didn't 
find this compilation error locally？
Anyway, I will learn from this lesson and be more careful in subsequent 
submissions.

Best regards,
Qianfeng
>

