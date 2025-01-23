Return-Path: <linux-next+bounces-5317-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95608A1ACB7
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 23:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2F3716453F
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2025 22:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5223C1CD1E0;
	Thu, 23 Jan 2025 22:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ddn.com header.i=@ddn.com header.b="FTM8xsUc"
X-Original-To: linux-next@vger.kernel.org
Received: from outbound-ip191b.ess.barracuda.com (outbound-ip191b.ess.barracuda.com [209.222.82.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094501B4150;
	Thu, 23 Jan 2025 22:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=209.222.82.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737671775; cv=fail; b=WwABDJ+aTTVzbzNecIkhhqfDOSAeegbq8nnuV0sv0X6e55TPhFrGcTPBq2X0sUtaA8fx5f8eOnz9HzGLvG37Y/N7HK4fWrrORUvx+7d8+qPDNRKjjLBxfBIzTSRY9TaQGdeVvxlvvhyVVcTbpeaVwqfTm5dfgafnLkJ8jbvYOw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737671775; c=relaxed/simple;
	bh=8KHsJzTWJE7D3EQPAgb/u7OKEbPbH9pCFQjEHCdKYfk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ppkNZNmPaohX3+SusLN6Uitv8GZ3VbbrSQOyG7CyUooj/3FPa4fSyOvCbF21s5lnxmU4Q2kOdCT3Tdys2zI390kjTAKlFb1do5ghZIr6ShKmSwaU7mGWVr72DMCeBVuCmOrcI5UthjQmhKNlz1u9BRiKYiQ6+xJD1eaxy/OmLZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ddn.com; spf=pass smtp.mailfrom=ddn.com; dkim=pass (1024-bit key) header.d=ddn.com header.i=@ddn.com header.b=FTM8xsUc; arc=fail smtp.client-ip=209.222.82.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ddn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ddn.com
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2040.outbound.protection.outlook.com [104.47.58.40]) by mx-outbound16-179.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 23 Jan 2025 22:36:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzxKo4lVLSV6ftifqM0KfbfzRDFVqS4bdpWn+Y6qannxdu7rPJxPKL+hxbqZ/Hm/W+/U1hdr3bAvCgYJwOGgY+tc4aHQSUTlBghC4L9NqE0L+IKQ4LonZjEpo7sdtJL6QHvRXJVPia0lGAGIjpJem5OILPWRET8CTdkEcWXkvisuUqgvipHBQvqEg68GUmc5Pq7jTbqaXMiqB3gh66vjjZtU2RhKw8LU4Qt9VyaxpU2etOUziP0dTLghaOOQHTjf6N00E7kYztaMllaVHZu1AMVehR6N1fH57L8jw8dJk8thHYOWT8MrPIOGrnSeudzoiSaj57b0he354pAzDtZa3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYnlSCN5NTSjArQ4vaxgAOgN4kxp81nCQDIHOYNI8LI=;
 b=Swl30nXViCWnDd+dblcp19HeovaGL0ylIFnGbjEpTK53DFHDw5J8LIrrXuYqN+vs20h9kr4zFB13udrppooO2RbEhBGI6BLKll8HUmzV9JKihH/ZtfD7Qc5mzNh9O5MiNxsflUrKSFxxOwntfcIBGrVxqdAr2XwhbrqrvjmYlOMuUeM511qLI6Gntlz1Uyl38LZwTLZLkVyin123Undb7maS2xYVJyNQVFxaigo/bP6/jibhVT4c0/sQzmkaHgMkDKaNOxVz+i3HrCt8K/C2lJhJpF8yWOGky0x1g6oczU9PUmTZGdhIsksHthw9/J5zBBF1Hlb7bnBPS+ZLAM0LGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ddn.com; dmarc=pass action=none header.from=ddn.com; dkim=pass
 header.d=ddn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ddn.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYnlSCN5NTSjArQ4vaxgAOgN4kxp81nCQDIHOYNI8LI=;
 b=FTM8xsUccjRNcWGB7ufZENIyp9Bzyhybz5tkzeayKSmni9z1ruyX2hTlrnYeI6HhAqcL56lfP/5VnBdCiYbsOYpuaXB1psp7tln09RLrIzrrhLaF1uKbIZW2tZ39cARq1vba+wyW/Ql6E1ELhr+nMZ21WxgVOajxcLb2ZhRjeOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ddn.com;
Received: from CH2PR19MB3864.namprd19.prod.outlook.com (2603:10b6:610:93::21)
 by PH8PR19MB6882.namprd19.prod.outlook.com (2603:10b6:510:1be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Thu, 23 Jan
 2025 22:35:58 +0000
Received: from CH2PR19MB3864.namprd19.prod.outlook.com
 ([fe80::abe1:8b29:6aaa:8f03]) by CH2PR19MB3864.namprd19.prod.outlook.com
 ([fe80::abe1:8b29:6aaa:8f03%5]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 22:35:57 +0000
Message-ID: <42938a54-de82-4eee-a338-ce57f3ca4c7d@ddn.com>
Date: Thu, 23 Jan 2025 23:35:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tags need some work in the fuse tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250124071333.6d91cfc2@canb.auug.org.au>
From: Bernd Schubert <bschubert@ddn.com>
Content-Language: en-US, de-DE, fr
In-Reply-To: <20250124071333.6d91cfc2@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0031.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::18) To CH2PR19MB3864.namprd19.prod.outlook.com
 (2603:10b6:610:93::21)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR19MB3864:EE_|PH8PR19MB6882:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c01171-8c4b-48da-eca9-08dd3bfe4dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WS9JSnhqVHNkbzY0bS9EWU84RFhETXc3SDZ4a0x6THNFWVRvNFdvNW1uTjRy?=
 =?utf-8?B?bmlQWmhRalJaVHZKdTFLTXdJUkVBU2pScUJLQ29FaURRNVF4QU5oY3RJTjFY?=
 =?utf-8?B?MkM1cmcrdDJSSnlPanVycDVuRDIyb2RDdjMxdUpuUW1QZlAvcm9iR0dIME5z?=
 =?utf-8?B?ZzkzUk1mWU13SjNLTDV6NXhRaGRNWU94VjZoQXV1MFpDTC9YTy9rb2RiOHJu?=
 =?utf-8?B?MDErQW12eEpzUVdlNk9reXZTMjc3VVYrbFVlWWp3LzY1Z2k1U29XWjNoSHlY?=
 =?utf-8?B?eko0MENEaHB3NTJPRi9oYm1BSElQWktpbmVsTXNUNDI1WDd5MVk3N29YRkp2?=
 =?utf-8?B?UFZxditmRWc4SzV0RWpaZjN6bTJyMFExVDkrRGtKbFZKbTV4c3g0cWFRbTlC?=
 =?utf-8?B?SWtOYmhtYnFXUit2MGRzb0U0c2FQVjRNSXlUaUVUWGgrUWowcXpXRW4xVjlI?=
 =?utf-8?B?R213SzkrekdFQnQxVEVMMnNqN2IxM2NRc0ZJYVdWNmN5ZGNqUmo0dG1FL0NB?=
 =?utf-8?B?azNKVmNJaDJhWFgzU2xJZk1zMzAzcWJTZm1SNnNZcEVIT0Y1NDZjSVpkT200?=
 =?utf-8?B?MHBYa01hR2crMnhGeGp5M0MvQkp1blB6SUFWUk9mMk9STFBwTkZkbk12UTky?=
 =?utf-8?B?ZkRyeTFycVBLT0w4UkhQdlRHYXhkblF0dzR3ZlhJMkd2Smt0amNNZ1NOYUtv?=
 =?utf-8?B?czFPRzZIdWMraXlZSHU4MVhQRzZCM29YQjNncFVURUZnN3BxeTdwTy9SaHhW?=
 =?utf-8?B?aThudTBuMW5KaHovaDRiWHkreTJMS2Iyb2g2MGdvUmFORnB1WGF6aEo4aGtn?=
 =?utf-8?B?NkVzZEUwY1J0VWR5RDIvMFRhY3dvWWE2VHJSYVlXVk03am9JQThFUFAvL0kw?=
 =?utf-8?B?cDVsYUp4cU9zTllVVlRQR1R2ZWc5cHpuS0d1M2ZvSVp2RTR2S0NXeGhpNUhT?=
 =?utf-8?B?ZG8rZ2IrZCt5OWJZTWd3YTlpdFBwZkdVd09jMU9JODNrbjU5eGt0dkpNcmI4?=
 =?utf-8?B?SG8wOHZOUmVlVFN3Qk5xU094cDdRbENhMTMxK0g3em9JZ0RkcUJyR29jMHNX?=
 =?utf-8?B?L21DRWx4Mk1RaldXVFovSTJyUGpZYW1XVmFZb09QNm5DYXI5QWhWZFhHZm5U?=
 =?utf-8?B?NkN1ZFNqUWhZdUFvWXBFOG9uOC90MlpqT254WUlhMnlPZ2YwMFVTMm5nQ3Zi?=
 =?utf-8?B?OEMyT1A2WWRmUTlkMDI5MUdtTVBOQ1YybVQzb3lMRSthclIybFZTZXBmTTdk?=
 =?utf-8?B?eEJrRWFhQkw0RDZkY1dOcWlFcUNIVnM3ZmlnYzZZRzdFQUxWQjdoMUZBSkZI?=
 =?utf-8?B?UVBjZ3VGZE10QmhiWWNGbUt2VC9WbjNLclBvakM1b25keUhQK2VCc0FXdTBp?=
 =?utf-8?B?OXhoSDFEc1RRbFNjOHNycllIRGo3cWphbUJTRjhVNzM4a2VWbTlUbnJPdC9y?=
 =?utf-8?B?MkpRNWxOTWY0TTUxM2QyT05sM01DNTN1TnV5UFRGNmNKU01LNlpDRENubHVU?=
 =?utf-8?B?aEV2OVZwYUV4ZTBMNHBFZ1d2cVRLZmFHYlBIL3pCS1JBT1RUcE1lREJKblVz?=
 =?utf-8?B?dmxFbUFTY2d3UnBYL2p4eUFlLzQ0SCtlNnBJMWk3SmV0Y3hiVU1iNHBlYlpZ?=
 =?utf-8?B?Q2N5R21BMVBBMmREWVNkM2djWkcxT2EzSklQbFp1YndIUkVwNzJGbWFUc2N6?=
 =?utf-8?B?WjcyRjM2SnByRmoydUNJMEYrT3oyeHlvMWl0eFFJWXNvQVF4djRhVGhubVd5?=
 =?utf-8?B?UkpBemdLMTVSR3NTTmJid3FqbkNuTWZTS3p2Z01wRnN0Ni95V0pTZjZ0WUJY?=
 =?utf-8?B?S3Exei9ac3FsSmZ6VmwwKzc1dStxWHZXaGxkS2lma0lwb21RZis1VHNyOHlp?=
 =?utf-8?Q?Sk8QiEbqYh2Sm?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR19MB3864.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHd0enNpSzQ4OG9RenBnZWdCbmtkanJENFVNbDVTcEdheTRWaWZaUFRJM2Vz?=
 =?utf-8?B?djR1NHFNdlVlcTdpaElQZDVvd0JZb1BqQUI0ZC91QnNBbStacnBSbjB1ZVIr?=
 =?utf-8?B?bWQ1K1g4Wks0RkpFN3Y3bWNERXdHVHF3MFdPNDZPZUMvdVNTME1UTVJPdmJy?=
 =?utf-8?B?UWNONDA0djJVM2ovZmttdnllQzhEZWsrcUZEb2txQkVqeXdlRzd6eUpXd3FS?=
 =?utf-8?B?b0pVb1FkTHRCVHpSenVZY3ZSOHRhNVhMVVo0K1k3dlV5NEJxajR6a3RlazFH?=
 =?utf-8?B?Z2p1b1ZZbTg2bm9KN2ViT3oxa2tIenFYMUJiSkw1VWxTR0pQSEwwL1M3QjZQ?=
 =?utf-8?B?MDFtMXpVbmRzRzVKWXRKV3RFd1BMOHJmZjIzZlcyNkh3Z0JOTCs2RkcySHZm?=
 =?utf-8?B?ZlpnTWFzRUViaUY4amw1NlU4ekdCaUpRekhHUEpKWHJoYllTWUJpUzgybXJh?=
 =?utf-8?B?OGl6NnI2WG5yVjlVQUVnTi8vNHhMZTU0RWJaM2tnTkU5U2ZnRERMSGdJZk9i?=
 =?utf-8?B?VWxwc0hIcEZneVV3R1htSnh4UU1VSEF6cE8rUkZMYURjU080emlwUUVTMURs?=
 =?utf-8?B?dEYyU0tqOHVEbjFpVTJUSUVNdEtPaldzK0FDb0VQVCtWeEE0U2o4M0hyem9y?=
 =?utf-8?B?a2UrUUhiRHlXa2s5N2EyS2x2c2hOc01jYXYzTStoK3B0NWpodnMvS3o2dERi?=
 =?utf-8?B?VjN2MnlSd2NodmoxVTFCZmlDV3lrNEUraGxGR3MzYXFIOFVCalRSUVdCV1Ax?=
 =?utf-8?B?OGhjZDQzOExyRG1nL3pTYWgxZjBUZUxpZXVhbkNBNmlZTjRCZjFsWkdZVXZL?=
 =?utf-8?B?RmFGV0lDamNZM01LMGU1amVrYUdCWENCRDlLelA4UFJQR2lRZFkrdXhwcXJC?=
 =?utf-8?B?alRuSTEyMUxtdkE2LzVQYnYwR3NySnF0MnJ2OGZxK25HL1pzTUV1WGxNWUoy?=
 =?utf-8?B?UUpXRk1lTHU3ckxvaGhWUC9kVVJjcDRCakZpSmoycVByWllFelY1eDFLTXh3?=
 =?utf-8?B?eW5vQzc3QUtGTEg1WDdWdzVGRlV1YXk4eDdtRWlPUitMVnA2MU9iSk54Vyts?=
 =?utf-8?B?eExCMFJSUU9PU3FBaSsvaW1nZ2c4ZlZ4NGZqRGdrQnpISWF2MVBxdmtwa2ZI?=
 =?utf-8?B?eUdpQWtNbnJEbytDMmwvbWxRMmJjaGVJdjRYaTZqeVhEaFJhYm5EMkxvMlVF?=
 =?utf-8?B?L3BNM051aUg3K3pWRURFQ2trWS81NWRocmV4VTlrUHRsd1ZDZmw5M0hHRzN1?=
 =?utf-8?B?RVhlRVVDeHRlT3RYZWpwTkRKdVBhMFpXRWhKWjI3L1N0eTYwMDRZdGRkaGhE?=
 =?utf-8?B?OXNqTE94VVNLcGxNMU1Fa3B3akNlMFpPSWtnNFFVVStzV0trSElCeGo0a3lK?=
 =?utf-8?B?QktpTzJwQ0pzaExBNTBPNk01c1VicjJZSVZHSHpYdFlMRDg3cURwMHhFMUE0?=
 =?utf-8?B?SVJlT2U4T2UyRzRuSUMyTkw5eEErdG5iSFgvbmdKMHdPS1cvcWR2dTBJR0lI?=
 =?utf-8?B?ODY2Z2t3WVBVaGJ3UHpsTldYUk1TV1F5RE9QM29seTBIMHhlQnRlY3dtd3RL?=
 =?utf-8?B?cVQrMTdBRG1Od1ZJZTZYaEVKUkF6VFNsclh5djlaV1FLWXcvdVQ2Nm80Y2p1?=
 =?utf-8?B?WElzMUJNSFlYN0xBVy9hbG1yNU1WRjFnN2gvVjB2cXR3Z1FwK2NET2R0bisz?=
 =?utf-8?B?NUtITXVtcGk5S0l0VWFxQWF0QkZhaVE2eGg2UDFpZFVHa0cwa29kTmx1emU2?=
 =?utf-8?B?eU0yVXFPM0crUENlTm93R0h1T29pRWJSMW9PV1RJR2UydHdGdGl5OGVqQVBu?=
 =?utf-8?B?dndUWDNYdmhyR3hDZW9LaExidkYyZGJrT2d2bXlMKzJIdDFnVkFQN2l4YmJ4?=
 =?utf-8?B?a1M5Vkl5cE0zZytLVmR0OHlpaDNUUGt6ZkI5T1l0OG1sRkFIRllxRlA0VzhF?=
 =?utf-8?B?TnI3SzZ1allWNTl1bDJKK09VZFE4Z1hJYjU0bXBYMHo3RTJuN3NzYmJqSFF4?=
 =?utf-8?B?ckZRTmd0eExLYW9McEpseUxaWW1Tb0VwdXAwalRLZFFhd3NTVy9LaVVqSXZ3?=
 =?utf-8?B?VzB2MkNCd3pGdjBYb0J6dFhIRjhEOXVhUzYvWDhVdDN4QzZ3SS9uQ2VESjdu?=
 =?utf-8?B?MTB3U05TYjZVWHlhQThxdmg0ZTJNRnJzbzFiSFVYb0Y2b2RZcVNwbHl5Wmxr?=
 =?utf-8?Q?iHlwTwB2/6hj7XFrsxLh8qjprDHlNWvOuV82ba8Z6mEY?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	n2CaxJTn9wgv2KMQ9uhZzdM40GoISb/qbQMnbADAmW+Y3iVwphENxwpzxNCGbqR8HweA7Ma2cLnrEL5mZEqB3dzvYUNjkPXJBYLNKsjfDfeSTefJy1pCxTDOtCU1xZmJoahYZCn5vEFbSs1ebTtjNZctHMdPfz/FS67xM/mKBIVgn/0jElhBhEJHfLxh/pcPe96J2I3xd21Jro7mj/gyKfADjk/ZB3610NIHdtmQZSdUMpufqyLotTwWIQOxZhgyiWGzVGW6lqWcAyIWx3PsoK79Se2IKWVCBgUZS0OE7SiVr59q1rGHi+vHZaBnHIFfEn6WXHjAT6yO91meDEzfojqq595ny7w+DOSXpHASweoIrIuHr5KEQKXSfdB42Lh57lL7a+kCn0sRAl19krAAIK6+jIFgzFnRbXtkL3RSvxIr0PYlXloUX4aeum266+VSPNPme0TuPK68tWKaxUFjfiTGPkyNMlZyFuv6lHAIr5kY2QyqAk/0sWyQwJulnxlxFFcrmViLcdc1Z6N19iukC3kkH+7crtEHKMw1cQA5fZQGYJ4fI+ADE7Vf0ojNtVGGZ+lFVOq3oWXzKN3o25Q/BM0TmpV+OnsHHslF5+wdT56RzVx4baHKXw31/Yq8aymFf1wffwzYPa+673hYJ0uR8g==
X-OriginatorOrg: ddn.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c01171-8c4b-48da-eca9-08dd3bfe4dc8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR19MB3864.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 22:35:57.3685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 753b6e26-6fd3-43e6-8248-3f1735d59bb4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: USXZS4QOz5fm3kou/mx0c+Z5i3wWcYAXELQuVyvCFV8EhNxE0ptghAd9gsnOfqFaQXDzgxOnYYO2Bp31m4eJ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6882
X-BESS-ID: 1737671761-104275-20252-1390-1
X-BESS-VER: 2019.1_20250123.1616
X-BESS-Apparent-Source-IP: 104.47.58.40
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUioBkjpK+cVKVqaGJkBGBlAsNSnRIMUiydg8MT
	Ux1SjRxDDRyMDYIDExJdEg2dDQwkipNhYAsKtJK0AAAAA=
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.262010 [from 
	cloudscan16-79.us-east-2b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS124931 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status:1

Hi Stephen,

On 1/23/25 21:13, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   d76c8bb7e031 ("fuse: Fix the struct fuse_args->in_args array size")
> 
> Fixes tag
> 
>   Fixes: fuse: make args->in_args[0] to be always the header

yes sorry, as I wrote in the introduction mail, as
linux-next gets rebases (I think) - didn't know what to put in. 
And Miklos might wrap these into the existing patches.

Will do with SHAs from 'current' linux-next next time and also
send a v2 in the morning.


Thanks,
Bernd

