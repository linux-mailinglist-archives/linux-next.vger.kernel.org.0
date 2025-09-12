Return-Path: <linux-next+bounces-8278-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D030B541CA
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 06:59:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 484E64E02CB
	for <lists+linux-next@lfdr.de>; Fri, 12 Sep 2025 04:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136AE26F297;
	Fri, 12 Sep 2025 04:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gIAl9QbS"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954203FFD;
	Fri, 12 Sep 2025 04:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757653149; cv=fail; b=ZxBFoTeKXbqPPItCISh30Hg5PvQET11c8JRbutSgrbNwkD6KgrlSmm6p19Gb994krmQUOjcZyhMffQ2ZlWlmAplN1SRo0mi9arB6EhDHWbumDS6+O/p1gS+UtVjFNouB7f4kv/vTtMcPuHCSQsGwap3kZc4dO/yEWKPJy1Lq2E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757653149; c=relaxed/simple;
	bh=Hi7P72a7lvBPyerzRB+Az1gW4hCv+lhh88DNS8PgnDc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rgrrnvaZd2H/HbXwumrwCl38TYamy1CBVmWGLo7+jL3AbhdfqeJOz6gVVZGa/Dh+VcXWnncf5R/cHK/NHPHPBJAEbszCTnzSxRuNjOFAb+7Vi9o+9GiXjppzVHUVwMn2QZZ+WXOFltfAYES4I4x7sqHPK/118ro0UM61XBqdLPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gIAl9QbS; arc=fail smtp.client-ip=40.107.92.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMPDY0SvxE+l+cutwpdaZOYVOMU5OiEAcy49TYahu3laDysxwg+18SShi3g3gBxgttTHpvODgKOiRDKjUnLLkjJYWzmheD/26/HzuEh+P3SssR9ZPu1fPOnVSWff72cWWJWgzQFpLlbtyCyltVdjtlPUTtV+b9C2I79suNsGDRaTpI2YKgfQbU9YNhZpzMgTxyFgs7anwbWzCXkp1jd1rnalnuDueixF+aqLsMRtSsferGqhDR+b2G3spmqvLxtRUnXAhwxkFqn2gaD+f6h4qxEpEqchO9kbaeFy05+w7N0vGtm91bN1WvY8aDKJyIAu4+bIIGT43/SeFtOhoSFYBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P97A2lkxaQQAfq/um/Vkpum2CZ9wsjWMBAc9p+5UANQ=;
 b=xlcje5IxPvG0x44APHB8brv9zhh+O9dTD+odjd0TcIZXJcKyRluDZZhIz/0oJAq7cX1uQS5Fep5YwCeuiZj/NpyQBx+xvrGDW8nrICen4DUEDbbWm8KF1/3L+7jY6OWwedmgzC6aRbteK72dC1v+6A+QnkMqMkMgnS+oOONFypJizxM4CNfiEHFkoyCz3E37VDXClf2EG8AQBnHlcQUJTSOpbUiUUKtK71D/pO+nMTHlKV8HJZfHCkCWBgoyxsgpALovwbJDM0WGWWtelcKhqwo/GtsBuOw4+g1Y/ImG/MILF0JHpgZ43cAi+Yne+j78Ct7409qwGA+ID6By6Zkz4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P97A2lkxaQQAfq/um/Vkpum2CZ9wsjWMBAc9p+5UANQ=;
 b=gIAl9QbSD02tImtpSOAPdxKi1OYimsjA6TICdVK0DrmATZJgGLkklIJOhgyjz2XCWOlqPF/JgQxX56jz9AKBdI3BJEDizV+tvh3B1rxmFXM4XIgKnb1ikJ6svTJgp6fvoyVWV4gfsv1725hbeS/kFfgPj0SGpsngcK1nCalLfr5upaf823c0PVI3HAdfYlWhqfpS2s75b7Oz4r/vPbrGMDw2bIrf1bFdj+DoBIH2zF9PWaIpjOo38axpT+scwm8REtj+1NaDH05b1+WoNupqXByuxLykIYLlBiMjWXE+lrc5CLFwI4qEUFDRWDHj1a9zR5dchV9vAfoGkWvkxBY8PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH3PR12MB7595.namprd12.prod.outlook.com (2603:10b6:610:14c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 04:59:02 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 04:59:02 +0000
Message-ID: <2f0f8adf-03ef-49db-9e78-9a565154cb2d@nvidia.com>
Date: Fri, 12 Sep 2025 14:58:58 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the mm-unstable tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250912141232.17bd512f@canb.auug.org.au>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20250912141232.17bd512f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::25) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH3PR12MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: eb4fba00-1629-4d3d-deb4-08ddf1b9176d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1dMZEovRjl3Y1ZOS0pRUGJaSlR3c01UV2FjazVxdHNFdmd0aHhBdHhKeENw?=
 =?utf-8?B?Z3FrL2l5MG5CaWkvZFNKbU5MVWlSZnUrR3VDcGFoQmN3MlpOK1BXTTVHa2xh?=
 =?utf-8?B?eVJBTHZ5WWY3a2VJeENSVkRoYzdEaHRzUmJiajBHckJaV0Z4L2JNME1uMzZZ?=
 =?utf-8?B?WXZ3eUhnQktscXhWVWQ5MWIyR3B3TEwyMUJJZm02MTZyREpTcXNhNnpOY1Ax?=
 =?utf-8?B?eU5XYjZJUkJQSzhWMldYVWlacEJSVzZYUEI4VURkYXJ1cy9hVzNtay9pRUlx?=
 =?utf-8?B?K2ZadUtCTGl4VnNDYXpRQkJBd0tsaXd2RGNnK1BZZGFIL0syS01sNmpqckdS?=
 =?utf-8?B?cWxkSHdtZTNvUlVFNm0xbWVESjR1aFNxMU9EZ0hyS2ZqYTNFMVVNdHc4WHhQ?=
 =?utf-8?B?cTN1WkhWVmJNUUZFOHF5SXNvRzhDVlFBRlhKNWZJeTErMzlVTXFXOEZhUmcv?=
 =?utf-8?B?YWw4d25RSGo4b0VyTjRuMDVKdWpzS2NvQnpyb0kxM1I0N1kxby93WFNobkRV?=
 =?utf-8?B?Y1NxWE9XVUtJdlo3bmtuUzhwbXkzNGtOL0xrVlBzZHRpdkM5ZTZQRlJhd1JT?=
 =?utf-8?B?NHd3ZXVqbnYzT1JGdG9uQTJRQzh3VGV1MVZtZ3pTdWhqNnQ5V3cyOVo2NFlV?=
 =?utf-8?B?bktvZGprYUlxaDZQenNqYkRqZ0hJbElsdkNSTnVxNlFMWTBUOEpWa1VyN2h3?=
 =?utf-8?B?YmczSGxWNHZnN0VBOTNuSmJFdnlyczdMUmhGcGZ2MGNzZWRqSDRwbDJNY0NG?=
 =?utf-8?B?d2xCNXBKMXNoWTkyYmREZTZpQ01qUDF4dXVMa0dFM1NNOTFSNm56aXc0Q1lr?=
 =?utf-8?B?MXA2U2RCV1BEb0c5T21BSVNyRllERll0ZjloOFlGZ090TEhodDBzc2F4Wktm?=
 =?utf-8?B?QjhPdDdUdm5IdlRYeXNzUVpUTk5nc2M1Z1h4eCtvVUdoeitCMW9GalRqOTk0?=
 =?utf-8?B?dlUvQ0h3ZTZJMEpiTWlvcTZwcEtXZ0IyRlQzazFzbUlNQzBVcjJ4L0UwTytM?=
 =?utf-8?B?WHlJUHFQaUFRUXovcGtuTGk4YXlwaWZjd0dOUDBqL1BwUjZSemhpbjgyTGFn?=
 =?utf-8?B?cEtYZVdPUVRZZHJnQzlWdEdCQTZ2Z2xKSmF4b3VYLzErc2ROWXRlTSt1dGJB?=
 =?utf-8?B?SlpYZnllcGtSZ1lxSWNGVzgwSnpDMmhWaHVkQkFGZ0JyTlV0d21JSTFLTXRn?=
 =?utf-8?B?d0Y0L2xhL0JaSU1pYmZidDZJYml6bjNyeGxLMyt5NkJNMU9pWjlpWW5lSk9w?=
 =?utf-8?B?NUlib284dU11RmVPR0oybXJZOFJoYklSeTVJM2dweExhQTdyZk4zbFVQWDYz?=
 =?utf-8?B?ZDZDaTFkaWRPSHdmWE1hYnhjZ1l1VW9jdlk5UFJiRUczR1NkM3FzdVpUaEI5?=
 =?utf-8?B?T1ExaG1lM1JMN0V2VGo0R0pPK0NJVGRsVFdWYlk1ZHNCVVA1SGJUdFV0K0dS?=
 =?utf-8?B?S1FyaEpJRmlTMUQ3c0RCdVhGTVBpWmFkdXVEdy9KbnBsRzRnazJ1UEJIRlZs?=
 =?utf-8?B?aVJUQ0lsSnoyYkcrenVDUURxYlpzaGpyRG9lNTVkdU5HNTU3RStrMnlCWXV6?=
 =?utf-8?B?eTBlcHNQSm9UYUNDeFlFL1lpU0UvZzNzcFJLRTVYMklRYjFncWZ3S1dTWEky?=
 =?utf-8?B?dzNPcmp1d3lvTlRidzBIREhIQWpiZHRDRVd1UEdJV2lhTnBWaVFILzVRZVo4?=
 =?utf-8?B?alpwYjd2YzNzd1paNlUrUHY0R0lFZG5kMGVUWjc5azVTNjJYd05tM0lZeldQ?=
 =?utf-8?B?SVVWMm5UMmFPYXBSUjVXUUg5VkNMY1J1OXNVWERJakErN2xrYzZtWE8wNXVm?=
 =?utf-8?B?MGRtV2pTSHB6ZUJXYjJqYzRuT0pzOHBVRDMxT0VEYnhjUUZvTEIzS0dhY0pr?=
 =?utf-8?B?bjB5dERKcTJlOGZtSit5V3JCdm41UFBneCtRRDRQK2I3QXFWZUY1eG9UL0tY?=
 =?utf-8?Q?YDbOsqnmRSg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVdZcUVxUjJCbDJnSUxjQXlieVJOOE0zc01zUEtTT205czZXQ2RlZ1NZdjBJ?=
 =?utf-8?B?Mm5nSUtNbHVjdnpJUVBUdE1heGthRnBnbTAyNDVDWmN2QmQyS25mMURRbGRs?=
 =?utf-8?B?YVlxaE9zSFlPRjZmeUs0SDFiM2tkSVBTK1BMTzdMb2hXaUVIVkdIbkVLVlZV?=
 =?utf-8?B?bms4SU80WHg3Mm5ZVzNLQ1NCdWVLQThQN2FoOUlUdnhJdWo2U25uWGZkOS9O?=
 =?utf-8?B?Uk5NVEpXTUJteTdFc0pPY29kUkVIbjBZVFVMRVB0SEhZRjVwVzkvZDk1eit5?=
 =?utf-8?B?SzRuMFkrUGpVS2ZJdVlvVm1DY1FBOGVZS3NPczFicFVrV3lYdEZpcVhHTm8r?=
 =?utf-8?B?WXlLejVlc2N1aGtoYWlSQWpPYnpDT1E0SElwV1pWRjNQbG5LR0d6MndSc3Jz?=
 =?utf-8?B?dUcxUCtwdTkzMDRkaVYvYUd2N3Z6RGxlRDFFMUtOMUZKVUVDd0Nyeklkbk1j?=
 =?utf-8?B?VVBrb0RjN0N5T2Y5YzNkcE5xZEFNVHEySTJXeWRxZW83NTlZYWVDNEl0Kzli?=
 =?utf-8?B?Z2wwYXlIanYzeWlVVmdTSTQvYUVuWEJYanc1TkxCZTltQlVJcDB3WFFpVlpR?=
 =?utf-8?B?UVgxUmdKQVVpTWgweTdoUFh4dm9TNlNSV1ppeTVOTWZ0a3V4NlpBS3ViZlpJ?=
 =?utf-8?B?RHZwdVpyRWhGMHdPTkZYRU9jMytOVVBtL2lUSzExZk10cmRjMVNsd0lNakt1?=
 =?utf-8?B?TjhwekI0SmczU014cGFDSFEyWWZDMDh1RUNoVDFsQ1ZGdEZ5cHBwcGU3MitD?=
 =?utf-8?B?MndlTWZpNk44M2FteXlTOVJlSlR6V1VmNGZVSGRISno3YXA1ZENKS0hHN3F1?=
 =?utf-8?B?dXgxQnFoM2Ftczd3QlRjTFlnQkVUU29hNC9NRE1CK29sbDNsekNwTlJIMER4?=
 =?utf-8?B?b3lTTDVsOEV4YlIwT092S0xyb3BxalNOSWFQaWk2STUxUWFvRWY0SDVRK0p1?=
 =?utf-8?B?QUt3T3JjYm1kNGhxbFRnaFFJVlNUYlFpVExrQytiQ1ZvNHNieVFNV3N4bEE5?=
 =?utf-8?B?LzZLS1pZS3lXS0hNby9UcE1walkyZFE5RytlK1Jjd1ZjM2txU3g5b09vUnNB?=
 =?utf-8?B?WnNac1NaTXlwYVR6UENMTEovSlZVbTQyaXgvcFg4UC9hc2dXSXdzQnRleDBz?=
 =?utf-8?B?b3JBVHh4SERoOG5YcnJ3K1UwaFN1QmNKVXZuYVk3cEZnTzEvSUhJSjkvUzB0?=
 =?utf-8?B?SXpsQnYyYlJTM3YzSWJrMnRLUEFMWlU2Tml2eG8xUHBHVzFKRWVWUWVCWm12?=
 =?utf-8?B?eU1tV05jc0VZUndqNXFGVk1JalVXdU4xT05ncS9KcTF1cWJQNTFoczhzc1Nz?=
 =?utf-8?B?c0xydVRHdFhONllERUxiNkY2YmtMZGU5RzJGVnpyWXdxVzZzV21EamxKZGV2?=
 =?utf-8?B?QXRqaE5OQUVXb09DSlN1cVFMNnFHVWFtM2t2ZXJnNTZDZ1UzbGdPSjVzOTVy?=
 =?utf-8?B?K1V5R0pIcWl5QWhhTTZlYTZ0eTV1aWRhMHAxbkNwLzRTRi8wZ2JROHBQdWFY?=
 =?utf-8?B?clJxcU5RMGJ5ZTU5U3U5ZzVkWmcwQXdHcHl6SHRHSnJMUGlwU1o2dlF6WkZY?=
 =?utf-8?B?NEtFUk0yWkl5ZXZyUFZxRU9QOVpTSTd4a2l6bzZvMUlRR2p4QnRpOFhpNWMv?=
 =?utf-8?B?ZEp2eVBNbmxObEZnaG5rRjVmdVJyejlmRW9QcTh5UTZHS1hTaCtXS2xrNGhN?=
 =?utf-8?B?QTlyWWVKcVY2bDdPYXZBeWJ0NGxZa0lZTDhsZGVuWFRBaGs5YlhUMHZESWZx?=
 =?utf-8?B?R0d0YXQwcHhmVjM0OGRsNUhRME1PT2FSODBOeloyRXhyL3BqeVhUbDZHdEw4?=
 =?utf-8?B?ZHdzZlRCdVFtS2ZUNzBGTWxpSHdPTDRkMzZ4RkduWWl0ZEdQWlI3KzRURDRj?=
 =?utf-8?B?Mk5vUWpkbkxva0l6SWt0RHIxQjdIbFdLYUE3amNWSFh2WldjU0lvcE94Ylpt?=
 =?utf-8?B?WTYrczhwYXV6VG50WFQ3NE5odzRoSHBHYjB1cUdHa0dsSStnSjNoYlgxRHo2?=
 =?utf-8?B?ZkQ5c0JPSmVrZEVpRmJ2T0ovblUvVXBMbmE2NTdQS3ZpS2NYalRLdjViR0Fv?=
 =?utf-8?B?aWZjZ1NTT0Y0Y2NOZnVmL3JsWXA2Qlo5VnAzbVhBajBvZ3VNNkpheWluREkx?=
 =?utf-8?B?R1loeEdtS0F4RlZQdU4yUHRrd2YweGc5WlUyNGdUNVJyZENabEkzUjhlYnNt?=
 =?utf-8?Q?YTe+euGyIiiFj70YEjGXke/8Ia85kxTKXx8k/sfuZBCF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb4fba00-1629-4d3d-deb4-08ddf1b9176d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 04:59:02.2262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24G1D6Ce6lESGKIeUtX6sotY+X251jdTtum6QI0rSttEsYvwTbSJIxd0yqeHmjBo+oMiv49R2jYpzDBNcQGk8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7595

On 9/12/25 14:12, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the mm-unstable tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> WARNING: mm/migrate_device.c:792 function parameter 'page' not described in 'migrate_vma_insert_huge_pmd_page'
> 
> Introduced by commit
> 
>   9a5e80c43c9e ("mm/migrate_device: implement THP migration of zone device pages")
> 

Thanks, the parameter is incorrectly described as folio, will fix

Balbir

