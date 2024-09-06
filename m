Return-Path: <linux-next+bounces-3636-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA76696E82B
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 05:24:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0666B23377
	for <lists+linux-next@lfdr.de>; Fri,  6 Sep 2024 03:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3B4374F1;
	Fri,  6 Sep 2024 03:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="EpAD/w5B"
X-Original-To: linux-next@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2052.outbound.protection.outlook.com [40.92.102.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C4B17BA0;
	Fri,  6 Sep 2024 03:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725593066; cv=fail; b=EKUoBeczNaNpxNSIPROenGB1bPfZhwQNRsRHqie8pqlVuvxWMeRRWl9upttbmgMsERW/p/aSZWPYxirPJJL+WBXhWb7VIwCr4Ssh2sYCbIYTaCIodlGq6SarXTCK8zlc/ZfA8ayRGysprTf7HdbocX+rwc79qU9/lU51qrWopC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725593066; c=relaxed/simple;
	bh=mA8++2ObAb6fs+lDdrtnKg2TjtvF92vaj4MsH+NWA1c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jwawxwH71lCC2/GLwScoF98cVGkrG3RcoAmjdO7TE5nX000VEr+qdm8x329Wf2kB5eI37dZB1WD4bHEgbqWOdY8wH88FVYy0w6bxlR7PznfM4/PkCidIrCz4CjSGwuhBrNTh+0l2b+fgOcFeUXqGQFV8hnMWCIHMewKLnTyUm4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=EpAD/w5B; arc=fail smtp.client-ip=40.92.102.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvEACOgzlcBlmLiIsawrAG0ERD4K5RkiB1R/MOEqYPcIbamYNvnv0xlb2EO4dEAXN/RAg8lrfHXx/W/DkHf+mjQEsJpAo3NsO2rytYd4ZC08KoeMElAjixElMLHjXC9il4QbT8yccb3F4UTKiHeCXeNrkEd18TujJr2pkV5HKJp3g+NJqae4mnp9NOunMOpXHUlX2Ax/a9JDjZtclSUF5Ulp1zRlwB/UQj0H5kz3Nyycokl4O7KZSBWuZzLTfHWxeeyeJPzCccg0zhurjr+GmWmemRBZEyjK5E3WqA8JWSxE/krKwFnP2XcsTXpoup2UU5SdjresHahFpCeGvopi2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bh197ihKOOrMcgta4T7X7uPO911j6ZQ+IrdahvslpWw=;
 b=SgnELdUZhos8eHX2LJdB1Ko8qz1ITzg1yYb2/2rmCvYuhVzL6aVozES2xKKO46KlsdyfGofxpkVoGn0uw1s4ic4A9CoHQl2q7KxqmNDpaQCdmeTNhhBAOOZky4EE6fApvbHPsTM9U7u0o0MnXBBDfCT4mgRwgdfrm92bBL3Y/EBpB+XLVB/SSAhPVVwVxrpPAb91k2iEopu3Y04LpIZnjShceZ035SWRHjjsiQ20yFTLJclsulUAC28t6+UOqk7WitzYqBnpluE1KwUzp2PCxKP5GhcqmO9u35owJcwI8h/JKjd4oo3XgThw/0WhvHnCxzleiLMHGq3Rdl6nK6cK/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bh197ihKOOrMcgta4T7X7uPO911j6ZQ+IrdahvslpWw=;
 b=EpAD/w5Bu+6USdK7C6uJ4PabQ05CygB8x3PuwrOSCEMUSKfzWj3U7fXM+YH9bYiNc/1FSGYkF6+FQHi3Sc7jc8jdpO2ojqHGD3HeFmPCOhNwEzgniiNKZvffW63I3jHm6wYRCoH0tO7MbETy0EOmku3QjTof/hhBUSr83ubgKGIO6gPyCVPXx5jB7vaz5aPHPAHnX09A48/5TxD4PRB7A9f4aicFJnKGKbdbUnmPHwtuTKDURgsgqVlTk96Y7hboW3PLZEoJnxQpZOpCcrM3hIdO3YHF3v3yEXNGYf/4zANrHyRJD2Jc/P+UJxEpljP5tTuRQSHzUPFTRtGko2d+FQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB0291.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 03:24:20 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%7]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 03:24:19 +0000
Message-ID:
 <MA0P287MB282200D15F3A93CE187FA66FFE9E2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 6 Sep 2024 11:24:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: duplicate patches in the sophgo tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Inochi Amaoto <inochiama@outlook.com>, Olof Johansson <olof@lixom.net>,
 Arnd Bergmann <arnd@arndb.de>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240906120436.74ffdd06@canb.auug.org.au>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20240906120436.74ffdd06@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [9FWivQKDtDjGz4ULbwQbF3eSFsD8UG1t]
X-ClientProxiedBy: SG2PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:3:17::25) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <5e153628-0187-4221-9bbc-62b6031cb4e0@outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB0291:EE_
X-MS-Office365-Filtering-Correlation-Id: a1fbf679-80ba-4511-dd9d-08dcce236489
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|5072599009|19110799003|6090799003|8022599003|461199028|8060799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	9HfTOeWwoZgUWDeUNfmbtdsFd2Unlr/vASm+j3sxwmonVx030y8bCV9DwQZwKCNGFU6QIW+r8ppI5zT/duaQtwDQTJRFXVfX1ociZD/HDdz7DN1PUTgJV/g0ACZzkc77y1froyySKrEUYfctFeO9eFXQsrnmrTUOsrSYbcL19zx7r8/kBY7bhpPody/ZTu9/cB0z90c0OdRSnbC+CvImo2P5zz9+11Wvaxv2rX+4EMX57lq4CKWG3DlS6nzAaJvS/uSS0peJWm4t8igSZuUtx3XCEObpWv7xZu2cpzFrb0meSlP/l/DEov45ljXxokvVXWa1oOvq2+OqSFY7rcaxueB9+B0GWMHADGjX/Jp5D0V6onR9qzdoH52+SJAutJX7U93WGFzMa6MvKYTSgwcU+sr5yCcRoaFqXFoTA5Ot4UOnIBxP89BoVYkZta1JE77X5Pd5EvO/ex7UOyx2YBGYKC6i/xletf3NpRv/c1NfZ7pKYjJ7jvsKUQoiGHWZ9l6tJ6lYcYzkxk0XN67fc2Ia3r9qJBSUS6EyAcI3oPCazThY0Ky+kHTtJ8n5lg2t0GKaITtDhPMCPhqdnpxvZL8G+63e7u9CCwpBhvxi/xnMp0nSSy6gnWv+x6G9emAnpmkJbaCEuBt9ZWOEhS+n7M24Z6m+iyn/vSXT25lw/cbWAxlAu4OtsuSEFVU24aILGBATGFi3sH7FizKiKSiN73Dks2SrrLj9diqOGhTAxAKugEHZ4V4tyJVvugEIqn3bXoV1hnRnVJp2487LodnTAgfNGg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUxPUXRYa2h1MUh1ayt1NW9FZWZLTm5PanFnMG8rK1l5Tk5tVjlsUWJUeWZY?=
 =?utf-8?B?S1Zka2xBY0VmSEpmeEVkT0lmdmRLdW5IR2poZkQrS0xjN2ExYlc0R1laRTlk?=
 =?utf-8?B?OTNUZ1RFU0k4ekFrK2FNRFNIK2w5UmZzRWY0ZENGdzk2SU5ibFhQMng2N0ZF?=
 =?utf-8?B?WHVtVzZWbTl3UUUzMG9abDVNUWZtRXpQOHhjV2hNVjMrMFBuejhSVU0zSEdN?=
 =?utf-8?B?K01PN0t5Y0k0Rmxab0JEeFU5RTd4bEZpdXZsK2phbnFkdjFsbjgxa29IbkVv?=
 =?utf-8?B?dXJ5R3JnUTFaMTM5S3o1ZlR0V1J5NGN6UGVuUE02azd1TkVzeFM1b1FqanZs?=
 =?utf-8?B?TTFqb3U1TW9kbWhBNWJJeGJFYm0xcDg1TFNUTEpFTnNwMmo4ZlYvUFBoTlha?=
 =?utf-8?B?TUFGSVpJNFBidmdpV3QzdzBGM0c3R0h1QWYrUCtWTThVdXJWaVQxRTNQZzVQ?=
 =?utf-8?B?Y1cwWUo1YndnajlzcFJSQ1RTUDRlbGlzRC9XWGRJZ09MRk5VVzh3WHlrVk95?=
 =?utf-8?B?MWZhN3c4QVNJOGZvVmQrK2NQRy9XNmhNZDBsQktzbkNxK1hIek96ajlsM0gx?=
 =?utf-8?B?RjFsV2sxeHI4RG40MnVHeElDQXJMd3RNMk1zRWY4MzM1SUdZUk8vSW4wZDZk?=
 =?utf-8?B?TWxlQTBTazdYaXd3K3FocmYxUnNiUUtEdWVleVF3ZnZzcUpoM3Z2OVFxRW9E?=
 =?utf-8?B?NE1xcmVocDZpdXhKaTBjM1RzTzc4Y2NCN3hwNCtvRFlOYm1vYjJWcVF1K2dy?=
 =?utf-8?B?RitpamRLYWlnWStQSUh4aXFDaVZiSGMvaGNPNHFoYlY2ZFhxNE56K2t4bDdy?=
 =?utf-8?B?emQvNWwzYmVrNklsclNZVVBsc2ZXcWpLaWEzQi9UWmFBdnlOazJHRjYzVTJm?=
 =?utf-8?B?eDdQVC9UaHFmUlhlbnV2alVNZFF3c1gzOUFRWmdRWWFYNElxb2xueUVBcGtK?=
 =?utf-8?B?M1VQMjFlQWNyeXhTNEtwdVU4bHdnZEFKY2VhRzM1cGpkOEM2ZzhCSzdPNk1K?=
 =?utf-8?B?TExnbHM3aXJFS3BtVHEycW9sQWc3T1E2eFFtcGhaOWhDUVZIVGM5d2tSSktx?=
 =?utf-8?B?UEtvSmdOYWJTR2g3aVY4bGp6elVCUmVoSGNjQ2VsTTVsYXlXeUsrTm5KOTlk?=
 =?utf-8?B?NGtweWRVZzd6RG45MzEybllsREpRMU9aZE9Rc2xuem5DOUFHUTZzelM2SkY5?=
 =?utf-8?B?K0xWK2dCeUs4MkRKNTExaTE4MkVqVTlCb2lBRzVXYm81WFBTK3cyM01vWEd5?=
 =?utf-8?B?c2hlbmJhRG12bXpINGtLTElPRnpOem9mSWFKcXlzdldTSmNGd1JMMEpyQS8w?=
 =?utf-8?B?dnZlT2p6Qm5OV3U3MzJLQmdiSW95UVZZYk5hbnVuWUlJNE5RQy9PbDN3UTM0?=
 =?utf-8?B?Wk5TMUR4Z2hSVEVtVVZuZGdsMmxqdWpMQWpzZVdraHVZOWtXTERNYXFFZDFC?=
 =?utf-8?B?OVFpcUNKNWZibWk3YlpnL2EwQzl6V044UXBDdG1Vdkdia1JpbTBEV3plaG5p?=
 =?utf-8?B?aTZvRDdrcGVwSVc2R0RUSHVsVVZZZXVDNlFkTWl0VGZqbkRnOGZNUk5veUtl?=
 =?utf-8?B?bTFlS2NGRzQxTDJVd1BZb2NrZDU4enkzRXJ1d3dlL1IzQVVZWUdaTjJHZzEv?=
 =?utf-8?B?eE1oU2FQaHZsRGZPb2R3MHJZNmJTdEdEc1pWYzFaNk40ZElhYTMzY0ZXa2Uy?=
 =?utf-8?Q?n500iJupzNYGRaFYqmnH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1fbf679-80ba-4511-dd9d-08dcce236489
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 03:24:19.9080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0291

Hi，Stephen,

The arm-soc tree contains these patches is due to I submited a PR to 
Arnd and he merged this today.

And for the sophgo/for-next branch, it does contains these patches. I 
created the PR branch(sophgo/riscv-sophgo-dt-for-next) and cherry-picked 
these patches from sophgo/for-next and submited the PR. I see the 
commits in arm-soc are the same as that from 
sophgo/riscv-sophgo-dt-for-next, but they are different against the 
commit ids from sophgo/for-next due to cherry-pick operation.

So my question is, do we need to make sure commit id the same between PR 
branch and sophgo/for-next branch?

Thanks,

Chen

On 2024/9/6 10:04, Stephen Rothwell wrote:
> Hi all,
>
> The following commits are also in the arm-soc tree as different commits
> (but the same patches):
>
>    0014d11186f5 ("riscv: dts: sophgo: Add sdhci0 configuration for Huashan Pi")
>    161477baee0f ("riscv: dts: sophgo: Add i2c device support for sg2042")
>    33ae4c56cacf ("riscv: sophgo: dts: add mmc controllers for SG2042 SoC")
>    47e5a8daf0b9 ("dt-bindings: riscv: Add Sipeed LicheeRV Nano board compatibles
> ")
>    4f8fb973389d ("riscv: sophgo: dts: add gpio controllers for SG2042 SoC")
>    7f3cf53e4c65 ("riscv: dts: sophgo: Use common "interrupt-parent" for all peri
> pherals for sg2042")
>    c0a4490b120f ("riscv: dts: sophgo: cv18xx: add DMA controller")
>    e8b4716e68ba ("riscv: dts: sophgo: Add mcu device for Milk-V Pioneer")
>    f9cc479ddc8c ("dt-bindings: interrupt-controller: Add SOPHGO SG2002 plic")
>

