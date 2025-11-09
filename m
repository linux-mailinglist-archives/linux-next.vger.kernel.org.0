Return-Path: <linux-next+bounces-8901-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F45C43A5A
	for <lists+linux-next@lfdr.de>; Sun, 09 Nov 2025 09:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 60945346D53
	for <lists+linux-next@lfdr.de>; Sun,  9 Nov 2025 08:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3749F263F5F;
	Sun,  9 Nov 2025 08:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Wgbp4iJf"
X-Original-To: linux-next@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790451CEADB;
	Sun,  9 Nov 2025 08:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762678748; cv=fail; b=nFnG6HDf8uh0Pfvdq5krh757Rsmo2HBvacZm0Qa5Op5eVyK8ZB/ym2QqlY2sWAAwde/i87PYXgNDqOhZMZ++D0ZUAI4p/3TM7z36//lcj6LLufxGG4sdCYqZkUy8cNAFWqXydLK3GPWebKh2kFirrOR44IR/lU87CFOnXEgvSQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762678748; c=relaxed/simple;
	bh=V3keHRH2NXjXTIMZMNdW3jp7UIZP5pW1wQ4R1Rw63E0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J+bQLTEP7AUA6JAtEcj7Vzt8Bv/qEsmrrqDPPzPpsAuG6ZDq2iJp1kC65l28LOKfz1VI4T2c90e3DEevDjfSmwBMMmziZRrms2PKKn/5YDrB2hFzzFWaxqHb97PJZG3BD5ucNaN9ogaf+b9qQFaacmRvY4525r7ct+A9xZO4hEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Wgbp4iJf; arc=fail smtp.client-ip=52.101.53.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4fb6Xx9eBaow8+E6IHEFa8Fsd92z8/1UsxiGz5Bqo9jYdG6dGXpi93qtsdgCWqDnH3Go+ApVIwobSRF+mS9THj0j97dqsbVzyqAfhysLYpVRM43WXEJI2zEKODKl3ccT2h0tn7rSN9r7ok719+PfAdmp2a0+QXW2BDQk+JgDlXnkO3EXJU8W+51OJ9SgHVsPLIiSkyVaSja6msmrBvRSZMxA33J7lzUGbOnAA1HXQrp4Gz07GDc1qyJ0TsJwb/3wRx0RN8ZDVFrCNkMhLmgEVvfy/udEtonXfcoI+a14p1mM5uwiJ20vc6sSf1S1p0460tVQhfPYh7iWXDhhXbv+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tf4LuiuNiMzBeqn7FnD17nIXv9Pl0BEF+FIpYXqRkUQ=;
 b=LYqZFWAjV9tPiKLKbTB1YrC+4uqTSuEa7eacWEx0AjgcBTcVeFqmXsLURPVJ6C2f+jPwSvd2TcFnK/MgmZBXs9cagcWwBy/JsxD3zpzO3BJnSamSXog+PLebZm7dBSK+wLa+Jzlpla7ZuOSVkT3q7y3t0euVGgdWOB2u1Aboz+JQLWZ74CJkBidK6E8xbou68CUqfp0VpsA29qgOVimieyspXdLt+SPFvugXeR2QVt0nVzaBAOBXdaS+21xCrRdTGrYQ4nBt+PysQCfGq86/vFz+qUpv6SVnhESKhtQr1Pov4ePsDQXIHrgpdaIH40XxWYA9C9FlVCIoof1KDn0Lvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tf4LuiuNiMzBeqn7FnD17nIXv9Pl0BEF+FIpYXqRkUQ=;
 b=Wgbp4iJfYiruEDkJriK13vbdKENoEUCJvdPOPC0PihdhjzPWMblXoORvHiRrM1xGX3iN9VhvfnZLTlwmGOLfN7ymBGaibtO15gz1HYjsArN8S4Gl61S6GqxcAXMBU7YqtYUGBGsVMT4V2OTeA8k60LDvXIyrHaAF19LrEBgEda8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 SN7PR12MB7321.namprd12.prod.outlook.com (2603:10b6:806:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sun, 9 Nov
 2025 08:59:03 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::ab38:296e:413e:1a3c]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::ab38:296e:413e:1a3c%5]) with mapi id 15.20.9298.012; Sun, 9 Nov 2025
 08:59:03 +0000
Message-ID: <1dda44c4-b199-4c41-8c9f-f08247b7f5eb@amd.com>
Date: Sun, 9 Nov 2025 14:28:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Nov 6
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vasant Hegde <vasant.hegde@amd.com>
References: <20251106153215.7fb21343@canb.auug.org.au>
 <e641c955-25ad-4eae-b3fe-4392966cf768@amd.com>
 <b47cc630-b27a-4d62-83c2-c81463b53bee@infradead.org>
 <20251106200541.GG1732817@nvidia.com>
From: "Longia, Amandeep Kaur" <AmandeepKaur.Longia@amd.com>
In-Reply-To: <20251106200541.GG1732817@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0018.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::22) To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|SN7PR12MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ecfc764-487d-4d98-0987-08de1f6e3ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWlDbUo4a091NGJnSXJaclBpUk9PRitRN0RrRmFrMVE4bTRtY1lZVFdSWEFk?=
 =?utf-8?B?bEd3bzJYWVVXcXZqdXRmckc2eTNLWHQraW1xSFl6czcweHQrNDdCa3NzemxW?=
 =?utf-8?B?QnM1eHJSc2FTMnlTelBFN2o3a2tKRzZVeXJEVzFFM2hKQWdKaDliU09rbGpu?=
 =?utf-8?B?N1FQZDNkMmlQbDhsNkdHc3ZwZEo5bE9zRHVpdElmU1pSOWlvV1l4WjdGSi9B?=
 =?utf-8?B?L2MzS3QwQityLzA5VVU1TXNMWURRTkwxVElKTTRuQmQwcnlvblJZTnNEYkhy?=
 =?utf-8?B?WStrSFdWenhyRHFUZGh3dFh5U1BEaCtyeVh2OU5maDlxY1RYbkJkd1R4MGha?=
 =?utf-8?B?NWlFV1NaMDU2QlVFcFB3cnZiQ1h1OWlkVlVITWVIUm82dS9jK1hHTHBrSlhC?=
 =?utf-8?B?T0I4MTRQN1d5VWFsL0RBcEdzbk01cmlEeFVCc3I1QSt5b3Voamg4V3h4bzRz?=
 =?utf-8?B?N0NPYU9aT2lnK1NBSVgwUk9jeVRETFhJYmlvTlNmRDR6T3Z5YkpTSWFzbW5P?=
 =?utf-8?B?VTg3N0lrSWVEc2h5WjRHVk5EQlloUlJoVGZJV0p0eVNZbmJTZVFmb2J4RXZS?=
 =?utf-8?B?dFloZklKMnJNYWJacC8yVEpxRHY2aUNSaGtKWG1sMDQxdHY0ald1aFpFUHp5?=
 =?utf-8?B?dVk2YUxwUjljVTFheUh5K0lsbFZaaXhBbHhPNnVtQlUyTFhEWFY1Vnd3OFBm?=
 =?utf-8?B?ZU5PbFFFK3B6L2I5ZkZyRjFXSkhKOVgwRFl2QWU4ZHQwMzgvcHRzSnc5cFhj?=
 =?utf-8?B?S3JDZkhxQ3E2dUVyYmZ3QSt4eWpBRXJZMXB4UjdQUUwvMFFSdFBDODQwMzN6?=
 =?utf-8?B?SFV4ZElqSVo2WGx2ckkxS1VVbnpEckRWRTJ5MHgwYlFZM1pHVytyZGlVZ0dV?=
 =?utf-8?B?dGlKWHAzZmVUN3pZK21YVVNpcTJnTlRRZE9RNTMzNVZweVhCY2I2cWI3V3N5?=
 =?utf-8?B?TkdUTmg3bHlTSUp4UERSMFluZ2ZtckZsQlUyNmkvdE5qZ0s2ME80bVpPbjJY?=
 =?utf-8?B?SDBNN0lWcUNnSXJ6T3RyQmhPd3hHMjdQZVdnSUdzU0tkbDR5emNCakVUeUNS?=
 =?utf-8?B?NmtZMEZEM2RvQWdpOUVYRzVWWHRFK24zdGRxaUJyUWs5d1Z1SGh0UFBBZ0J5?=
 =?utf-8?B?WkFPeFA3Ry9SQmhrVWdkRXIxZVY2blRWQWJzYkZOZlBncTV6bmt2WnlaRW90?=
 =?utf-8?B?NGlabDMreVNibUJ2czdsZVpVMjkzcXVJTlVQOE91WUZXT3hHckYwTiswT1JW?=
 =?utf-8?B?TnZhQXRtNTU3TmttTzd0VjJlenBER214b2hqNjVtNloyYzRuZFBRemZlQ29Y?=
 =?utf-8?B?eE0vS2dlaFI2bnZoZzhiRnY3NmxLbTlNTVg0M1BtYnkxSnhjMDhuckljM1ZF?=
 =?utf-8?B?dEZ5aUwvYnJjNVBIQ3hTOEh1SkJHY0JRWHQ0MFdMUGx4Q05uTzdWL2t3N1E3?=
 =?utf-8?B?ZVh4RjFpbFNUalR1cXZTYWdHQUlPdk5pZWRhSkdMcXMreFFDVDdIOGRjWEtl?=
 =?utf-8?B?VGpHWmlQdE9iVGVDQW1MeXlPQ3J0ZjdBR3NCN2dxN0NvL2g4aHVISGRQTU45?=
 =?utf-8?B?TXFUeXg5N1NKelVzbzd0aTRYSFRTV2NMbTNUZkxZUlBBOTkxTHZkbGlLcGJL?=
 =?utf-8?B?TkxjSkRWalhEbEFVUm9rc2tEZitabGt2VGNLUnNOQWhEKzluNTNTK2dXY05V?=
 =?utf-8?B?b0JSelA4NHNqci9MYi9TY3BiR2NDZFMyMEg1MUl4MXhjaUo3WUFFYk16c2pM?=
 =?utf-8?B?R01JNWFIQzlJS01KY0twTlVGVGtVbnBwOXNrN2txYW5RaUxtNThKNVRJNVBr?=
 =?utf-8?B?MzFlaExkb2hCQVIzR3h1ZkpWbTl4Wm84U2RGSkpaY0pINDloakRkS3IxS0dp?=
 =?utf-8?B?MURXSUJqaFBBcld1WWExcGFRREZldEVPRTQwUTdBc0tXWlhmd0FyMWx4Si84?=
 =?utf-8?B?WEJWaG9Zb3lzWEpyRTZHL1NrMkR5d1FRMGRWcjFDQ1I1M0pSWFdmQUY4ZjJV?=
 =?utf-8?B?Mm5vTU1OOGF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6351.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3ZlT3VtalMveVdVeU9BNEQrb3ZNeEhuR1UwT05rR1VPVER4Ri9jTlVWRnJX?=
 =?utf-8?B?ZGdUdnJjdFA0bGg3WTBZcHVZZ2pZdmtLZ0NmTXRHdVlISEtJU2xQQ0FqOWJS?=
 =?utf-8?B?QW1FY2Y5VWVoRDRjY2JGdHhva0UxRG5mYWJrOG1sU04vd1NjKzY1NlBMN2dR?=
 =?utf-8?B?WDM5N1MxbWZuOGFKRGtjandnVHRPSnAwTTZHSDVTdnZvUG5oZ1FlcDhncnpv?=
 =?utf-8?B?VzRNTlJYTy9VK0NmdDQ2YmdPa2VHVnNMZHN6c2tJUW1wcXlrTmxTMkExZ0xD?=
 =?utf-8?B?cTdpYmhFTVR4b1lMMk80MHdnUDNIUkZMK1VFZWs3VWhOaEtlcEp0L3U2RkY4?=
 =?utf-8?B?dHJLakJKb3lWWWZNdjZlTlQvUlE2V0YvOGhOdzhiN2MvMTVvUERaNHhSNWVm?=
 =?utf-8?B?NGxtV2xoZExXMjB3N1NJcksrSWVDL3Z3Mm9PRURJSTRvTWxHNkwzLzZpT0dH?=
 =?utf-8?B?b29WOU4vSHUya21xeGk2VGYyMUJmeThTeGxsQVBGNWhqcE85L2F6bDdwTGdO?=
 =?utf-8?B?N0tFVHR4TEF0WWl0QlBEZUUwNnp2a1FjR3BvNEJHYjlPclE2dlhHazhIaWxK?=
 =?utf-8?B?Zmk4azdxZG8zUTc1cU9LVGNKK1ZzT2pBWWc4WmFHeVJORHg0Vjg2MUZJM0hF?=
 =?utf-8?B?S2QzV0JMTTNhYWRKcU1DRzZYVm9tVzdKVklXNmNQOVpDcU1GT004SE5FckFT?=
 =?utf-8?B?YlNxNmg0SVgvZjdoRE45VFQ5MUNFTzFkQUQ3aWd1VTUyR3J6TEJJalhNTkJH?=
 =?utf-8?B?d0RxTlhJSVhYVFdxT0FWSGpFeHRkY3hGWkwzS1pVTHprTGQrRjdtL20zZDlT?=
 =?utf-8?B?NVJraGhDSm1lOGZFL25FaTFvaWxWREt2aDFZNzNJNGdpZktiWmhsak9GK2Qx?=
 =?utf-8?B?RTQwRFI1c3F3cU1OZUFmYlNGRUJyZms0Y09aT1F1Y2g4OUE0RDBDT1ZneW9v?=
 =?utf-8?B?Wi9ZS3JzVkRRWWVORlErQUIrZ25qcUlDdnJib1UxQVo4VVM1VSs0UEJYV0Fz?=
 =?utf-8?B?RlVLYVdHT2xrZ3g4OUl1dDBLSjFiUFR0T2haV0paTXhHNGlXbXAycnU0cjVi?=
 =?utf-8?B?d0RsaEk4ViszZlk1cS9KVU96djdyTHZhMjNnb3FjTnI5WUZveUNCRURkdWd3?=
 =?utf-8?B?OFUzZXRZTzZycDFzUGNoaXYwT2JKenRha280UFhuU3RRc0c3K0FXM21PUW53?=
 =?utf-8?B?eDV1bW5qL0pWYU9vaEFUeFp4SkwvajhWSVRYcis4R2R0S2w4cmtqb0svMWNo?=
 =?utf-8?B?bnQ0aVFXSFU5a3pVdG9sZ3E3SnlmcTVQSEdIcHRYODNnODgzMlhEUGk4T1hi?=
 =?utf-8?B?cFNCY3NlQjJUUXYwSzdpazArVzdjNWRjdU5HVjQ2MktwVklJeDBQVWlaS29z?=
 =?utf-8?B?LzJlK1pNM09xeGNqWFd5dG1sTUltbjFlM3RHOVRULzhCc05GcHVDSWI1ajBs?=
 =?utf-8?B?YmNvZzdnRFptR1E4bVZlcFNzKzRiVlh6dGtxN1NiTG85SmlBemlRWVM4Vm5Q?=
 =?utf-8?B?cGdEc2ppWjl0eWU0Z0o2ek5zbnBOc3grV0Y2SjdPNHlCdmlPaVd4MElqbzhG?=
 =?utf-8?B?VEQwUmtCb1hWb2RmRUR3bUdicWhLWmErcGRzS2xabk9TbjVxYTEwOHNsZUow?=
 =?utf-8?B?Vk9aeUltQ3ZYQkg2cC9jRlIvU3dsZEhMOEJ3Z2ZsZnJEOHBMbWVMSXZYMGdx?=
 =?utf-8?B?Y296MWhBWkdzVStRMlM3ZnduWmpzNzBNYTd5blEyV2M3WFljcm5KRUQyY1VV?=
 =?utf-8?B?R0pPK1V2RkRDUm95NndESTJEeFk3amlUWUNJYUQvMFByU1ZCbVB6UFl1WWZr?=
 =?utf-8?B?MU5pYTNpYjR5dDFtNHlxWlptOExCbnMzSXNsZDRYOG9tMU5XK3NqSTFMMjJX?=
 =?utf-8?B?ajc4eHhnc1M5dW5rN0FnY1p0b2o5dzJKc0tPTC9ndk5iQmdLMVN3bWdjc1Fy?=
 =?utf-8?B?c3RuRXNyWGZjSmJqWDZNM3FHVVpXelZPVklRYXZEajg4bFh6NjlLa2hUditJ?=
 =?utf-8?B?SGxKNVBQYVVnbzF1SG9RZ2tRM1M4K0VNa0p4UzNWcHNIcnVhTkhaNXVhM1h0?=
 =?utf-8?B?OTZnaXRlaktYVUpkQXY0UjZlUkIvczRYeFA1MXZZUDlRRGZINVN2OGlwa1Fv?=
 =?utf-8?Q?NIj5Ri3rv4oqf21KhHHlOfacC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecfc764-487d-4d98-0987-08de1f6e3ad8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 08:59:03.2331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pa116Rqig+kURk6YoAUsGN+CmfVdZNzNUz82U6yDJiTED1fRMNrolGS70PFhKGdVeIfkGgKvbesOZBpe9cq83A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7321

On 11/7/2025 1:35 AM, Jason Gunthorpe wrote:
> On Thu, Nov 06, 2025 at 11:42:36AM -0800, Randy Dunlap wrote:
>>> Currently, I am bisecting between kernel tags 'next-20251106' and 'next-20251105' to identify the culprit commit causing this issue.
>>
>> Pretty sure that your beginning "good" should be Linux v6.18-rc4 and
>> not linux-next. "bad" should be next-20251106.
> 
> Thorsten pointed this out in the morning:
> 
> https://lore.kernel.org/r/20251106185814.GA1708009@nvidia.com
> 
> Alot of bots and people have used this series before it was merged so
> I'm not sure what the special condition is to trigger this.. Does the
> above fix it?
> 
> Jason

Applying the patch available at 
https://lore.kernel.org/all/20251107104701.237041-1-joro@8bytes.org 
resolves the build issue.

Thanks,
Amandeep Kaur

