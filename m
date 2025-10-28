Return-Path: <linux-next+bounces-8736-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF2DC13634
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 08:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 386461A227E3
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 07:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF642BE036;
	Tue, 28 Oct 2025 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="VzcqvN1G"
X-Original-To: linux-next@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023077.outbound.protection.outlook.com [40.107.159.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480BF23A9BD;
	Tue, 28 Oct 2025 07:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761638071; cv=fail; b=ZCDqCXEAA/AguiKqbeqn2YVQ+NHfQy3ldb7czUGeZz38gGdEsuYmKPQ8N7w4kwZ27ErnIaPl0DAo+i0lkvQkpykOi0vX/sgZ3uRgZ27Yqbj4gw3k0H3h/W07nsE5oKa6fOeUFph2cg7z9pMx8ww9nmMN2xuAkr7AlwzYU6cXyjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761638071; c=relaxed/simple;
	bh=ZehNAs+ah/GGpIvBPiDWflYkhsOTkybRwTuWMZ0Wkdw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=h9PcftN6+KKMYvxSE6O5wIKFgQFYLH0AQynxUrKmOfTNk5U7IqPtAXXcDQSHVHBYliCpie5HjWxrLxxUHcO6mZZo+5WbNVAFiDQEctxBYTAExwi+XKuFMoXVqZQCF/QHiuZfP9tvUJy9u8BuW5VZDdPAz40/NB2AZs0IRfuhFUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=VzcqvN1G; arc=fail smtp.client-ip=40.107.159.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkgOeklGkNPoNFu9NZNS015/dOnPLS238964U5r2U1bvWo4YeOMJK+vw3CkxFtaAstXBGu1Wbdejl3PckRQhCaXfBATopTJtM+oM/uF2eaxWFxCEYx0xMSxo5Nkzt6p1zcJ233MTL4JL9TWodTcZTtfj58qZGdCk+8yLi3ZaN8mMN5390xQK7HfX8c8GsDjpdhJYfES0cx49hLVd15rHO22PpLnY7gFVHrqd2LKUu3FFLi9wPdO11P/chXuyP2R2q4v54yXSI0bXJgv1aO41KftkN6VcmCdPZ0dCEMPdasRWZ61NVC2WOhXqbd7ImIX8Bbj3snLlahRc00DG9dTLTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoeW+UZJIMpGDKjVswTBXfxH7oYH335KEn1jNYAlJUo=;
 b=ox5buK1fqoEah7aVrK5VIUikIefPbecxv8HpqlWnKonfvLRnm1I8OCEPD7mDnhaOAwDKW9WzhEztkmLfSUsPNhxv916/8dpNF0RvuulZGhVubkWA/Yieo81KEoOcG483krPkS6ZnaGPJYqY8bm+413uXh7XPmGPX7pL5noano7TjCCEPmmr9q/v9tqemTqChM/zNtlWIcIFf5/Ks8RxvnOHuOUb1l/QClrVoF3QV3l5iIDFOgdALjRlovUOKvoSITANxl+QLyFxHMsJs6q23mBoe4Z+FtguYBVvzfifj4Aquqg+mO9IQJfcAsqkMzN6bzrmIoILnGEThG2lRirxBcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoeW+UZJIMpGDKjVswTBXfxH7oYH335KEn1jNYAlJUo=;
 b=VzcqvN1GRq2Wj2XhoEr+cT8pIcIQ6BhXfSt6rNBQxqAaqZbd7gasiX+ZbyIZ8qNEdGJo5z3U2iOu1PFFPHIsbY3lRP/MnQkw9PGtKmEXaIFggNzp78Efdr5b3saZTPwnSxNZdsL/+yYT0k9MOlUTs/r6Co4hNO0UydvOGAH5SgMabxUsb9JO4bBpvOp0VGyI0VlGFX+PqpIq6/RmOgjJ+4jF0aHNAPIZrUEQkuqJLZ5Fc5WMeCne5QmS8YKTvbxf2Pa3aMIvSRzIWcOLRXj4muYYC9KdG7wwzPHawOkSuLaHoS3ZsU1LMVx7T0SGStDAbeZLI2EGAopRn9iisOSQ8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM7PR10MB3606.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:131::8)
 by GV1PR10MB6193.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 07:54:19 +0000
Received: from AM7PR10MB3606.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::581e:22d:25a6:df09]) by AM7PR10MB3606.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::581e:22d:25a6:df09%5]) with mapi id 15.20.9253.011; Tue, 28 Oct 2025
 07:54:18 +0000
Message-ID: <1c67886b-730e-4a6d-a846-d5e932b452bc@kontron.de>
Date: Tue, 28 Oct 2025 08:54:17 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the imx-mxs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Shawn Guo <shawnguo@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251028073346.4b8d68ce@canb.auug.org.au>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20251028073346.4b8d68ce@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To AM7PR10MB3606.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:131::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR10MB3606:EE_|GV1PR10MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc67807-9689-4360-e750-08de15f73290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3k3OUE0N09QZXpuK0NMNUk4U3pmZ0FaM09oMWFPY0lqbjlrUHRVdFowTGZp?=
 =?utf-8?B?cVp6bFpPTUtyQm9jUjl4OVk3anRIM0x6TUk3elRRbndhdVZIblRyaUp1VURy?=
 =?utf-8?B?ZWJiUGdaRGpHVnhBT1dieitjSVRqU05ma21mQTVQb3k0VnhheTJ4d2Q5aFQz?=
 =?utf-8?B?VW8wZ1B2a0EyM0krNjFTVEsyblUxWndmYk9JazViVDVXb2UzYzlBYW0xKzhk?=
 =?utf-8?B?YVVadFlYcStNeUhOd1pZM0FDdDI3THNOZDY0cHhpQXpVM010MzNpQ285K2dr?=
 =?utf-8?B?cjk1V0JnRDlydVFZQy9JaW9KQzBZcjhMNHJBUVl3dnNRRHBsYU5Ha2FLSW5z?=
 =?utf-8?B?d2VmVXJYRmZiK1dhTFlPWGl2d0ZDOEFiODVHcUZBV1h6ZGoyUzY1VnFOUW5w?=
 =?utf-8?B?dEp3TmlsYS9iM1ZIbXA5ZE9xSXBDNkhKR2toTzZaeTMwRTFrdVFTc1YzTDcv?=
 =?utf-8?B?Y0NoRkZQcS9ZOTVEZUo4cFpxdnJRVTRzMFdrVUZnZE45V2taeitjcjc2ZTlu?=
 =?utf-8?B?dk92dE9tSlVhaVlLNUszcnFsdGpsMXFJU240clNvVlplRTlGTGpweFFEK2FJ?=
 =?utf-8?B?QndRYTlQUTh5R0I0ZHZ6ZlRNSWpLYlJOSEpLSWV1dVE5R1ZBd0hQeFNIOFls?=
 =?utf-8?B?NWlWQURNemJCV0F1cGtSZ3JSTTBzVHBMVVlPaXUwNXRKUUJ4T2FNQVVBVlFO?=
 =?utf-8?B?azJ0N0JHd0E0ZmVIL3cvUlBPRE12cHhoSzNOL1JGTmNwZklYc2hHYjR2SWVN?=
 =?utf-8?B?VUpOY1phNzVBQVFOZmt3NEp2TjZBdTZycGVMMklwenZtTG5XVWl2WkdibWhF?=
 =?utf-8?B?bnQ5MnBDQjkzUnBVSXRHZ1Myc0xRNHRaZE4rblAyQWlURVc4RW5Yamw2b1hP?=
 =?utf-8?B?Z0IrclRLbW9ZNzRKOHBRU0dOdlFERHpUOVYwcjFQMkNqRnBxSW1UV3ZOT3JK?=
 =?utf-8?B?TTZBQ1BYdkdpSFBFUVplVkN2c0ovNW4wY0V6c25IWTlia052SDNTMzBJQkpO?=
 =?utf-8?B?KzQ3eVEvNFdWOTFzV3NlaG5Fc2t4d1hVVVZXU1FsRWoraHFaTEcyNGhhSzBB?=
 =?utf-8?B?V2NGNUpZWk0rTk1jd3g4cklQRTBEMytUYTV0UlphNmZnSzBKVExoTU44M0Rw?=
 =?utf-8?B?Mjh5Qnpic2xMa3E2TC9LSjVnRE56ZEpqL1FnazdSWnI4ZW1oenFsM3Q5TlIv?=
 =?utf-8?B?bTF1bXI2UUlNN3JoM042U3kwcUl2eld1ZHBzVFgxU1ErMW50VUo3Z3BDMnJu?=
 =?utf-8?B?VlNXTTQ1ZnZ0S3RrTHgrNVN6cDZOUlN0YlM3TU5aNy9LVFdxdUtmL2JLdHNt?=
 =?utf-8?B?a2ZsK2hUT2s2Y0kwTytsRDRLNDlzSzhMU1hQeHA1QTkya0p3dmpWTnFqM2hw?=
 =?utf-8?B?RnlqWElRcGxiOXdiTDZlUnNRVDlqVStJTERQQWlocHJDeExvNEZBTHRXZW5N?=
 =?utf-8?B?cHc2TER6dlZvZkFBR1Y0SkUxTkNpTENTOW9ZSUdGUVplVTVQbTBHQnc2eGJQ?=
 =?utf-8?B?UXBXZ1RhQUZvWXp0OGxnUjErMXZud2hTZ1FiZk1XZDhnejVONTdqVW1taGxM?=
 =?utf-8?B?Um9zbDk4Z1ZzUjdzcVdBWW9EVGtxYVlwUWZwNkczclNMTFUxRU1LdzROdTBV?=
 =?utf-8?B?Y090SGJjczNKa1MyaXBDQmpGajI2VTFYOU8vUXRYMk1BMkQ2OGFwVmlzUnJS?=
 =?utf-8?B?WHdkR1NCaW9RT1h1Nzc0MkpTRWlRbkMyMGVOVGFkVmtUc2kyM05hTTFXTktl?=
 =?utf-8?B?cmE5bHg2M0FSNmVxeVZPRGtLUDVXRVVlZFVKTGN5TFp3dkRTTjVXWWpOaGp0?=
 =?utf-8?B?RVpOTE5nQ2xtaDZMQ25KUG1IRFNSd0l1UnVJV0hkRjd6NE5CZ2o4M0FMbmdL?=
 =?utf-8?B?TUV6a3hIL1dVRHVCeklzUXZJMExLYlB1MklUeFhkUXQzalN5ZkVsa3FuQWxo?=
 =?utf-8?Q?7opvgRtrJhxfHzXFiDkdPKGmdUcvPkXY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3606.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzdPTHRORHBxcytZcUVqbExsRk4xS0V3cGwvVGFHaGN3bEt4c2ZUS0s0ZGVh?=
 =?utf-8?B?YVF5dmd5c2t3SW9LUjBmbC9GcnAzZmk2RFVkOFdzUXE2MHM4MGZiVXhwTFE5?=
 =?utf-8?B?dlI5SWhIQTdQcldPNE5jY25MclhJVmhUaFFKdVdTbWZQNlIrNXllV1pPZWZD?=
 =?utf-8?B?K0FESW1RRnBlbFczZ0pMT21GNU5yRmRBcmZWbFlzamgycjJtTTJKWEMyN3hE?=
 =?utf-8?B?WkdlMEJpcWtpWVRZVk11dHNvVVNwYnZhSThOTEhUd3UwdVM0NndvOWJ4Ullj?=
 =?utf-8?B?NU5sbVNmeW1oVksrbzFiZlB5ZTlZWHhHN09iYlR3dUhqemZ2Ly9KKytINEpO?=
 =?utf-8?B?NTVQVlU1ZHVwWlB5VzJGTVBXbTF3VWZwcVpXcGkzZm53SEIzRENiWFpoSFdk?=
 =?utf-8?B?VUp1V1p0cDZVZHdiTDl0SndodzlFckF0M0tSSE9yN2tJMFNNeW85REFkcFhS?=
 =?utf-8?B?VnBBcDRjTlZCRlo3MitwdjhzaXdJYXhTOHc5OU9MZEJJK2lrQmo2WEovaHBt?=
 =?utf-8?B?dmtzRUd1NWVmQzFIdzVESWlEYm01T1o2dVJ0QU05Y2FSbWtTVXB1VVVtblJ0?=
 =?utf-8?B?dGltNVdrcFBBbTVjeDJ0dkhOUjFkaGtIZjJBUzRXemM2NWtkZHp3QmltaDZ0?=
 =?utf-8?B?VEx2REdpOWZuWDJFOXFpOWJlM2lvRkZnZHd4NElWOUkzazJuRXNYRGlFbmJV?=
 =?utf-8?B?ZlE5d2tYY05nMmsxRkp5alN6R1NUS2puSzluUmJhUXNUUUlIeEVJcXpmTGFK?=
 =?utf-8?B?d2FJNXBYNzhSZUFyNFAwKzNyVkFHN3dxdlRDblMwdjFKOHNTb0pRcE9aTllt?=
 =?utf-8?B?b05ndUhKU2xXb1lRcnFneG5uaXJJOWMrUVVzSFVLc0ExV1lZa010QlI1OHpu?=
 =?utf-8?B?eTBmSFlOaVZKTFdPQXcxaUVycTQ0a2xzVmtmZjRSTXYveVM3YllWcjlzM2xK?=
 =?utf-8?B?YldpZXhoamhDSDVqUkFzbCt0UFlUcUxYRjZBK0YrRlVBT0dDMExUSXFPN3d0?=
 =?utf-8?B?djNOelBwelBMR0Y4ZnVXRy8zQ0YrSStPQnhjbFhFVHVYaU1QUUsvSitYb3pp?=
 =?utf-8?B?S1o4dnVBdWE2MmczK3VmRlpTSDBlM2xUT0VqdmFhdzV6VUFmb0VPWFpJZjFl?=
 =?utf-8?B?MjN5ZkQ5Z1NtUGx4Z2ZjeDQrSkwzL1NUdFVQcjRMYUtnSE1tNHBiQW1RQUlU?=
 =?utf-8?B?dWF5ZTdMVHVkNTVIN1VoRFo0djdnY3NmYy9yNXBUOHRmaURPMkhlTUZmTjRV?=
 =?utf-8?B?Wm13OTcwdGhvOGIrbUM4dDgyWHBDb1RxWHkwaXp0Sk1JdHpMdFErUHdHUXZv?=
 =?utf-8?B?NkxxOW1JQUh4UE1naDhhTFdORkNuNmh5SlJ0T25DWUFOaWJXVzVtM1dPS1Qx?=
 =?utf-8?B?aE9YRGpJQ0Q1dVJPc3UwQm8xaXY4NnZCaW1kZ2ZpRklyQWFWRmVsd3dqZzk3?=
 =?utf-8?B?YTRxaXRlRE1Ta2o3ZFFwaVhFNWVGMWxRSSthbGRDZG9sQ2Q5VUgrVUEyK2h4?=
 =?utf-8?B?QlVISzhsdklwR2dpeFBxWGw4LzkxUkg4RlBaTk1DUUF3NXV6OGJac1VVOUVY?=
 =?utf-8?B?VXBaL3F6WEl4Y1JoMnJZWTBKOXQ3VVFhMXpaVUZURFNyejMzaDFacUY1T3Bu?=
 =?utf-8?B?THhVa3ZFQUNaY1ZRU29lOHh4RXhwbnZZSVRZdmpqOVVaSDVXT2VsODJSb0M2?=
 =?utf-8?B?aDFYbFVoVGVRYlIweU4wVnM1bzQrTURIcEkwS2ZCdmI4KzhIZjVoQ3phTk4v?=
 =?utf-8?B?bEJWNlMyWEYzRnUxKzhOY3hPYnZ0NmxGSmE2SHFEaGg5WmdDZFJSaFdZKzFZ?=
 =?utf-8?B?d0Zyb3puMmZuZVlXdHE3SjJHUi9ZQlk0K1VDcFZEL2xRVnFzVEFaZUprcTFI?=
 =?utf-8?B?d3VwTmZKOEV4cmEycXN2eFEvOEo1SGNJRmZxbzhFT1p3RWlhamN2YWpBalNU?=
 =?utf-8?B?dGYyY0Y2RWhoaW5FVTQwaE4rS1ZXZnkrVkdHTHo1UlZlNGZ1ZGdOMmRBZ3I2?=
 =?utf-8?B?ekVKd0FCSkdIbFNVT2NNcDF3dGpjQ3pGSTZxVUxhUlNEUWlEcGdKVUpmODdT?=
 =?utf-8?B?QTh3dFViVElZZWltdDRPOVE3L0I2ek0ybU8zaVM4OUtaYTZUYlhheU53czNj?=
 =?utf-8?B?QTB2R3VUcXNvSEVvb2xFUXBEdmsyR0RzYmc5OUlQajRxR1QybDVGWENPaWVQ?=
 =?utf-8?B?OUE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc67807-9689-4360-e750-08de15f73290
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3606.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 07:54:18.8800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: js2CLgyjs0ydm5zRsb07OruEMx5Vcw5cAa6+3BrUrilQt2eeQl6mjWLa+3q8TtOUKuwLt2XrGXR/lxJfilejIgu3EbG8DXgsE3J7XMsRGFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6193

Am 27.10.25 um 21:33 schrieb Stephen Rothwell:
> Hi all,
> 
> In commit
> 
>   9bab9019faa5 ("arm64: dts: imx8mp-kontron: Fix USB OTG role switching")
> 
> Fixes tag
> 
>   Fixes: 827c007db5f2 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
> 
> has these problem(s):
> 
> Maybe you meant
> 
> Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
> 

Thanks for the notice. It seems like I accidentally referenced a commit
from our downstream tree instead of mainline. Sorry for that.

946ab10e3f40 is the correct reference. Can this be fixed somehow?

