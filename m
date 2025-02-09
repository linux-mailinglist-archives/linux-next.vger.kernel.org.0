Return-Path: <linux-next+bounces-5394-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFFEA2E0C7
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 22:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FC7A3A3B7F
	for <lists+linux-next@lfdr.de>; Sun,  9 Feb 2025 21:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 815EE24113B;
	Sun,  9 Feb 2025 21:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="YCVJv0Xz"
X-Original-To: linux-next@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2121.outbound.protection.outlook.com [40.107.20.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB608220693;
	Sun,  9 Feb 2025 21:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739135618; cv=fail; b=gaA5Ybq2RZGTezEMuh9l+8uK2StsoMQiy47ZJayNjm9DEEysZF9CIKGsYZZbFisHYOxFhIn7gwpxuzl8svLf7tTHlN7x1oL7OZ7Jj35oZedHSKWy+OjZxUZqynJTsUMdamsHb5sNHtDmersv2nVQhVQRFRGA5TwLviVIDKHoIKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739135618; c=relaxed/simple;
	bh=dyhGDie9/1g7+lYtNGRLblHRLcE7gTo9iCXR5nLhBTQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KMJdIyzYPGLvtPHstPw4F45kkXjCW2bXAhQcBSbdIMml/zKik2ap9rlgo9keNVTPIkqeO/6pH/ZiyusOUKXqjn7kVcY51MOxgZ4WVJgCCCw4bJHIHXIfpHTzwL7HsHec4Vx4PUe0JJy1nqzE2PjRIg01GiZ8CSbt1uRIkYtFCbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (1024-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=YCVJv0Xz; arc=fail smtp.client-ip=40.107.20.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SI/QvEjnX6uCaN0WAXmAshUg6fbX2ao0AHRG5yl7Y5gNsBtjxZwcuqBrc07ney9hYDG69t3zTP6qC24o2ko+r9D/l83aqoyY1ILb8F1w49moVI3USZ9ChRy5xy0/Kj0XJZHXsQfkBQ7EInAFOTEtO86HyZPqeF3lOIYcxh449C2rl5m260cwmTvokFbbBXnPmD15eRBNSMczBENthyfX6WYg5QfUGvo4LzWByIxMY1xW99MurLt1gQRlPcnpFD5rjEK5n11P9UfLJ2NRAvqA4EuDY9DwA9Vf7mTfj94ZwsYoNJg4pedyClJSq3gSZgkGxKxRz+cVQvwCw+TpaRmWXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWVCsXLqy33NPm/m+1MiAYqktfO3Zwepd9S52Na+nn0=;
 b=Ph4W9wrMa/Tjqr9gGmgpZIqVOysMlKIlrEJKYbGtk5X6EUFaMvr8yuoyVtGKoHnOFLOWs/lItwnfwPxPLIL/LS2YdeFDyzD+aQMLP1ns5QzervR3NIGSnJ3gJxPYvqHYvYHejaCXFi4xrs0ioVaaumpRERNzVCkVuU6Fir/OlmsqoHnr9MiDhe/4j7uZwyvTbNoqpx+5mfHOSfIAy63csOps3NyCZ+KsvcC+Mrv98o/exy6IZCmC3JfwxUCixA3G9gAHdQXYsbJwjeLFtgPndexvClfPz8YNWv/sDMb4JGsrZvMGQFEhZmdjDoescHpTgTqys+VHxxa+bmedIAOf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWVCsXLqy33NPm/m+1MiAYqktfO3Zwepd9S52Na+nn0=;
 b=YCVJv0XzjbpOxa4DQzgXdzWzLFhnn25FQRj2uumxbA5/OPAFIrunqTfxO0mtihcrvaQtP7AghgzzEaBoMos/TIcXbjl1d99HFY1N2u5pjzeUbrYErn7ENSO355M7lhYVVs15Jv9DT5f0Gs+sMsAedLyGiEA176tz8JF4mzOC19Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from AM6PR08MB4215.eurprd08.prod.outlook.com (2603:10a6:20b:90::16)
 by PA4PR08MB7548.eurprd08.prod.outlook.com (2603:10a6:102:26e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Sun, 9 Feb
 2025 21:13:31 +0000
Received: from AM6PR08MB4215.eurprd08.prod.outlook.com
 ([fe80::f8bd:a866:322f:7b42]) by AM6PR08MB4215.eurprd08.prod.outlook.com
 ([fe80::f8bd:a866:322f:7b42%4]) with mapi id 15.20.8422.015; Sun, 9 Feb 2025
 21:13:31 +0000
Message-ID: <b6c4703f-7cea-4253-bfe0-3451b3f6671e@genexis.eu>
Date: Sun, 9 Feb 2025 22:13:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the tty tree
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250206135328.4bad1401@canb.auug.org.au>
 <647d4d6b-615d-4c0c-b001-fab43fb7ab4d@genexis.eu>
 <2025020621-feeble-attire-0611@gregkh>
Content-Language: en-US
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
In-Reply-To: <2025020621-feeble-attire-0611@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3PEPF0000366E.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::38e) To AM6PR08MB4215.eurprd08.prod.outlook.com
 (2603:10a6:20b:90::16)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR08MB4215:EE_|PA4PR08MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b6ca53-0773-4281-54de-08dd494e9af9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzVyemkwUElmNE5wZ3ZYdVdCcTRITHJMZTB3VTVTSElUQ2cyazRHcGJqS0U2?=
 =?utf-8?B?Z1U2SDhOdHNCM0xMRnl6dkN0S0V4MDR2WDVUenFRQjVaY2NTeHVOVmM2ZmlD?=
 =?utf-8?B?N0ZZcW1DeE1XVTRQTWRDSkJsckNPdk12TVpodWY5bnBZOVJKNDVVYTZKei81?=
 =?utf-8?B?L0tkYW81SCtQQ3FnTFdibXkveWV1d3pwckppb1hsYlp5QzhaMy95dUdNWC9W?=
 =?utf-8?B?T3RDWHA2WFZ5YS9vUmxrUnNPN2Q0ZnhjUDhScHdhay9BT3NxcVBWWDZwTElh?=
 =?utf-8?B?MGFMUTNHdVNubHgxUmpoa0djZnRXZU45K1ZmQmZlNFVqdm94Rm9uaTdvNDJy?=
 =?utf-8?B?U0d5T3R2b0R1RkR0VDhpNk83bTlObVJpL1JNNFo0bjdHSklVQysydmhlRys1?=
 =?utf-8?B?Mk03bzloZzREWWRTL1ErMjJ4UHVlZWVCZ0dXMThCRnVZYVl6ZW9zMkRxZGNp?=
 =?utf-8?B?aFl0eXloZncxdXQ3b0ZuelZ6VlNxb0syTTFIRUlrdXVRNysrUnNUS3k1WDVB?=
 =?utf-8?B?YWFydWFxbjBnNXBmdkJNOFZTT21wK2ZCV0Z0WSsrM3RTZkd2emRxWXFJVDdm?=
 =?utf-8?B?KzlVYWU0OE95TVJhVFNBaHVhY0phWlR5VlNBTnlzREs1OXVrYnVIbXhaNlpp?=
 =?utf-8?B?UHNSLzErazJRclJMOUcyTkZ6N3lvdmhUTDNpZWFxZ3Jlb0FzSFpEVGhLOWZl?=
 =?utf-8?B?MHg1WHZTbVYrVCsxK2h3QytPejFmMXVzVVNFL1A4TFdFb1NPTzZMbTVyRVFU?=
 =?utf-8?B?S2pSbVJQdXNuMkNKc1dEemlpWEVwZ2o5UzRCVGRveXM4RDE4YVIyVEpKUzVX?=
 =?utf-8?B?U1NxR2pEeUNCbitCU096YmZyUlNuTkd2MlRnbk51VUZ6QUM1NmFHUG9OTE5i?=
 =?utf-8?B?czJDVWRtUzVUUVA2NWhUczRIeEIxWCsweWpoMDNxNHhPck53Tko1RzdGNWYx?=
 =?utf-8?B?SkkvT2Q5dUpMbjgrZndHd2dHR2l5T1RnMjl1Z2dacFJFQ2dEa1RQMmFldkRN?=
 =?utf-8?B?aVJJbG1mT1haTkFnRkY3Y2MyeDJFMHU3ZkJQcUVyMkNDUjlUdWJvd1RiNWdk?=
 =?utf-8?B?Mm8yTW5MZ3FtVjc3K240RG82WlpSTHZMZFJhb0dHYjBkU1hsdklsTHJHa09S?=
 =?utf-8?B?bnZoQ1RydElnRmR2cVpaMEVnODBnckk4ZkJoUCtLNnNMQWJuNlRxNHFLck4x?=
 =?utf-8?B?ZGdQQjltcTFBK3ZRaER2eFZDOTdONWJBaFREcTdoTmJnQ1QrYWV5QVdCQm8z?=
 =?utf-8?B?Q0RhL3VoK1pPVnhzZitwUSswaTNyTVdIK0krMnZuYzZrMWkrcjBtOGF0VUI0?=
 =?utf-8?B?RmJYRkQwM0wzaGtXQzlhMFhiZ2xXMWowVmlUMEJCZmI4bks3RkFRMEVQYkxw?=
 =?utf-8?B?RG01ODFXUExlMkZoQ05GYnFtZGFDUjkzSFprMzR5eUE4Q3dDS1p2QWNla0hZ?=
 =?utf-8?B?OHdMbkE4TjFkL2wvcTVWUlRnSU5XUW5UbTFYN2kvbktYMm9DdW0valR3R1FM?=
 =?utf-8?B?bVV4WlFVbHZwVzVUTDk4VVdtTGk5clB1VVlIYUxRaktuRHJ2VUhzR3RGVXNF?=
 =?utf-8?B?YXlPc2dvNkcyZUE5R3RiN20vZERJME5uNEFSTHk1YXN1SXlTRGZ5b1dmbzNQ?=
 =?utf-8?B?OXJKbEJzcFRLb2xEV1o3Smx6aFpiSjUvWWRwT1I2UnFKWFdxTW1wdUYxZnQ4?=
 =?utf-8?B?eDUwUWhqQmNndnpTOEpwYWFOK2dRRmtCaGs1L3ZUUCtwSHpyYXB4bStYZFh5?=
 =?utf-8?B?SWVMT0lVQkkwWkZWaGNkaEIzUXJhVmp0emtDS1Q0eU1MWmNPbS9SRTFVR09n?=
 =?utf-8?B?OGlQb3ZKSTdKVlcxeDlLTk9sV1NKNE5GTVM1cVlWeTNaS1d4U3NJbHdkelJ0?=
 =?utf-8?Q?KouXQOy1jG9El?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB4215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3RJY2g2VHVFMlp0WGpiMzV3UXp4T1pNVXF3Lzd2dEdtREYvRW12by9rSFNv?=
 =?utf-8?B?dzI5cno0L05kSExIRUpZT21KREZEMU4yQWJSRUtIalRJMHpiMldtc1pMSGFu?=
 =?utf-8?B?dVYxeFFvMDl4Z2tEU0VNVG9TUzZPZWZEUEZ3MlpROElnbkI3UU1SWmgwS3pq?=
 =?utf-8?B?a0tVM0wzdmNqTmVxY0pOYXhjWWZyM0NaUXphRVVYdVMwSmRMdVEzMnlab1Yv?=
 =?utf-8?B?MlhucndsTG5PU29BWVc5VnhYbndRZ1hZTk5mSWl5Zjh0aDZYSm5iM2l1K2dD?=
 =?utf-8?B?ZFl3bEZnb096S3VwVXhPeXlvdXdpWHQxN3VLYU1tMzNZdjUzZU5QMXYraEhC?=
 =?utf-8?B?aWs4MjJLb0hmUjFWeEtmdGxZRkF4b2ZmUWZYcC8yc3V6dlJIV043VmlwRG1W?=
 =?utf-8?B?dEluTjEwWTVQVGIvbmprNW1PaVBDeXdwWngyYlkydmRFQldMd1QzbWZFSC9F?=
 =?utf-8?B?ZjlwNUY0Q1dhUlBCYzJzWktJSWNrTk5XejJuWW5JbWY1UFo4UXlHZEVIM2sx?=
 =?utf-8?B?ZW1SdlQzWndOOXJxd0VGUGlsVVFQT1JhQlkzTlhSL1lYRTJ5THRXRnM0Tzcr?=
 =?utf-8?B?dE9WNXV2K00zR2dUYm1mMHZiQ0toU0dmYW0rQ3diV2g2TU9rSWt2RHo4WHIw?=
 =?utf-8?B?WHhld1hDOHZkVXFVWXBaajY1SVhXRHF2cXJ3b21IMXpsK0M4WU1XWkFyOFpT?=
 =?utf-8?B?bHRLZ2g1M1YrU2VSQ3RnU3VNQ2dQVVlWMm8zMlAva3llRXd0YnkvK3hZWjVm?=
 =?utf-8?B?TVg5aHhKOXZxQkhCQTlBck9wa2lXNzVDenArbjNvU3E1bitlb0haOXF2cUtX?=
 =?utf-8?B?KzZEWHg4bmpGTWZ6eEd4Uk5yMTE5a3hWazYyYmlWdlN6cExETERBY3BjVjVB?=
 =?utf-8?B?T082WWJtQm55R1hkRXRQNFZjdFpnenRiZ0lyRGM5SW9xbWw3Z2RrTi9OaVJC?=
 =?utf-8?B?dXM0Z3ZLUnNiU2drekFPaklXZXV0LzhNdUdpVjZqeVdhWk1kdHkyK096OWpO?=
 =?utf-8?B?eXRveUJEa2F5WElncHZ1OHNIQ0F2YWV3bXpuU09GWnhCUy8rQmxUSTMveXBt?=
 =?utf-8?B?NlM4WjYyZkkvNys2dXUwM1VOWjFTMG81eTlMR3JmZTFHSDh2QWZnbWhzWEdO?=
 =?utf-8?B?NmlFeHFJb0p6MUFKYTBhMDg4SUtuVXIzanZtZktQS082YmtaSlZ2NXM2RGJ4?=
 =?utf-8?B?dGQ3RTByUTRPTnk1SEZkTVhaYXRLS0JIcnV3ZlJWMlhrRHh5RUFqZVhOL1ZS?=
 =?utf-8?B?MmM0VTNsdnNTOTZ5amRycGljRk9mQlhORmI1Vmk4RVlCMVNiT3krclkvamFJ?=
 =?utf-8?B?aEJQS0ExdmlVMFhuMlBLY21hdzkxV2JxTnVtaElTckIyZlFHK0grQUZXQjB5?=
 =?utf-8?B?cEhBaTNNeGR2VHJFYlhOTGJHMkJQakQza3BmUHVxVXd5a0dDN1ZMVFpLQndH?=
 =?utf-8?B?NUhZbkVvVTc4ZDh5Sm52MW1uT0UrUlgybXh6ckNqOFI2aUlwcG9Td0MzRWFv?=
 =?utf-8?B?dFZuUFZtZUpmTjgwTWl3ck13YkJ2MGV3bUJjUGVwbE9yZmY1c2RhMDJjaEVw?=
 =?utf-8?B?UkEwZ2RoeTQxQUMyclhvVHFKK3RzKzV6dUdvb0ZwTCs0MnJhTzBHZWYvM3Z2?=
 =?utf-8?B?aGtQNjlPLzY1UHZYRW5vK2ttTk1jUnM2eWF3QmhSUEF5Uk5aVHVhbStWNWZz?=
 =?utf-8?B?aUpyRlNIRnEvelo2SnovaUFlK3ZnWnAwNTcwUHNVS1JvUHgwYW42SllIMGZt?=
 =?utf-8?B?aFNDcnhkVGZ3MThDOEx1RE4xTVdlQXcwcHRFQTA3UWl3eXlvNHJLNFluS3ha?=
 =?utf-8?B?c2YrNnFKQ01zYUFETjJUQjhBUzN5akJuUWNkU1VJNWlqU3piU3pGUHZRbTIw?=
 =?utf-8?B?ZnhoV3ZqTk90dUYvbDcxMldnSU0yMUhCc1RqUU85L3hGNTdWME11TFJxeEh1?=
 =?utf-8?B?Mk9xODZlT05aWnl3RzZ0R2FPOWFZUVA0WkszZjE3eHlkbW1FODlQSk1LS2Rx?=
 =?utf-8?B?cWoyWEx6VlovNStDc0ZtdDlLNlRBY3N0MmdZc0w4SlFoaFY2eWYycENPSDhw?=
 =?utf-8?B?cUJnREtUeDZOVlp2YVpFVnA1UW5ROHhLdWFqdGtiVnhIdUorOGswL3JmSW5a?=
 =?utf-8?B?UTZKUTlGRmsrRWVJQWlxNHZOY2FJUXAwcFJBcWNORnpQTnpSZ1dtTTZkN2dR?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b6ca53-0773-4281-54de-08dd494e9af9
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB4215.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 21:13:31.4535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBc32IToHfFqQe/f2Cxh7Jo9DVKGJbCkCq1vB2GxMBWCLU+IutjchDjuycXpMb37CwyOWbdHUiS71R1EN9HBtfINo6PKqWOshfQ9oTg9OQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7548

On 06/02/2025 09:14, Greg KH wrote:

[...]

>>>
>> COMPILE_TEST seems to be the cause for this.
>>
>> +config SERIAL_8250_AIROHA
>> +     tristate "Airoha UART support"
>> +     depends on (ARCH_AIROHA || COMPILE_TEST) && OF && SERIAL_8250
>>
>>
>> Should I send a patch removing this?
> 
> No, you should allow COMPILE_TEST to build the code, right?  Odd that I
> can't build it here for some reason, I guess I need to enable OF on my
> test builds...
> 
> thanks,
> 
> greg k-h

Hi, I confirm the build error and I tried to properly add support for 
COMPILE_TEST to the code. I did not succeed with that and only got into 
kernel configurations that broke the compilation in non trivial ways.

While it obviously is not impossible to add support I did not like the 
path it was going. Thus I opted for the solution of least complexity and 
removed the COMPILE_TEST option.

A v4 of the patch has been posted.

MvH
Benjamin Larsson

