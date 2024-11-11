Return-Path: <linux-next+bounces-4740-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8C59C407D
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 15:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEE661C21A21
	for <lists+linux-next@lfdr.de>; Mon, 11 Nov 2024 14:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6215B19CC20;
	Mon, 11 Nov 2024 14:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XkLH6xbk"
X-Original-To: linux-next@vger.kernel.org
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021097.outbound.protection.outlook.com [52.101.95.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79200156F39;
	Mon, 11 Nov 2024 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731334525; cv=fail; b=TSpcLUxvuKbYSASEmQBSyPHiDdMZJKLS0ppaX0l4YPNJMaqu0V5DJ4kqLGIr1RN+h+WQWSTLfRpxdOHmSKCTIOv+HV11x8+azh1lUhvcHCwqy5dPZuysEYdEh1B6kFXFN89MI4wAJGvS6oAqRurzfBR0mrnf1JiN2N/N3dlLG/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731334525; c=relaxed/simple;
	bh=c2vZKN7jo6wr6SGXFCbB8Iq7HbVFcRuZAunJXxOU0F4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XzmpKTGQ2v2SoHtys7Erg4mGOPpXlJdCgXRf7UXojNc12IDKeWWSBm+q++VKr3PCAG1YjcmxQ95vhQBmBRiHrrTIxQ8d9skrdBNT5RHG/O0WorLW9bTCVsRooZyD4WrcZCz92BGaFKYT4u2lvExeduaE6e+kK9rrEQy11fbQEjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XkLH6xbk; arc=fail smtp.client-ip=52.101.95.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3HAm40qmD0+g1bwImtDoxzupbceqWUUGFlHCw1dWOtUOpGP/lkHFxHJtJVyKZ1r6P87C5oBhQBvtNw/ZYZMrUSmxqnFYpd9vWbUxvI8TumLCEzSXKUUCShCNgGIpPIWxP8jghIp7Uw3uOwNhuctf/NN/WbW6OCv5nGRdRp5p0yzukkHwmzDUHbPPbwXYLv/eMdRDr6vFRzUcBYwSCkQLVCKaZESR7DqAPvG+QDS1VHpTPsz0UOpg6VBbzSbOMbZF2i4IEHBnjYv3p6uDXXv7rl+ag/A0EST6dzAe1lgxWsvkKt//6dvY7vL9ce2QrRuP7ZGAuitW5MY62azvxXJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2vZKN7jo6wr6SGXFCbB8Iq7HbVFcRuZAunJXxOU0F4=;
 b=zVKidYuS6sPoKbpDpbAGWnaU9lqpSk5TfzoMNho0zpoUbAcr2vjkRHw8qJtgWOHg48s7o2v6SthaIlgEW5bElf0fJxGuFBbow9rhxy9Xa7BOsFHE/ObdlldYGy3bG4AX4tO6ct6ENTA05qiS5SaGOe8qogLzCZTTR/7/Dg3DOhMz1OF7A49ljCaQjHkrIgjcE47sr8oBjKpk8XO5lkL5KULzG+qJosxdpJXD0BRoE4A01nxQubMXWFjWDx0jgueGfsFVWMI64fvYf40j7XV5nX5V98JfU1AeyQaKAgYu6XsMNz7ghMrerwOdjUaFiWButVVY0OOMwKB+4OySTBnIDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2vZKN7jo6wr6SGXFCbB8Iq7HbVFcRuZAunJXxOU0F4=;
 b=XkLH6xbk2vPSbvSJx+JmHXULs1rQ11+5Y/j6eyiA8PslS0OQQFNGYFrlzuT5emvYcSi3OjdQMIWjPmznzINWAZVN2JPHynjSvAnM6MIOBl17pvXQkXP3F6mxYtVdrRij4FcSx1FEPava8QEzL6FPGZCvdz5h6IxNx0g2Yh0PaRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:253::10)
 by LO0P265MB6946.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 14:15:19 +0000
Received: from LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7]) by LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1818:a2bf:38a7:a1e7%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 14:15:19 +0000
Date: Mon, 11 Nov 2024 14:15:16 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda
 <ojeda@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <20241111141516.1d924b1d@eugeo>
In-Reply-To: <CANiq72nyWAhyORsDij6P6U7Ww=eCp6S=LzPWZN4wxGD8JiK+RQ@mail.gmail.com>
References: <20241111175842.550fc29d@canb.auug.org.au>
	<CANiq72=JhmDJJCgcG5ex2A1gvBxCg3wzzutUc3L1HLPrPsHeyA@mail.gmail.com>
	<CANiq72nyWAhyORsDij6P6U7Ww=eCp6S=LzPWZN4wxGD8JiK+RQ@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0337.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::18) To LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:253::10)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LO2P265MB5183:EE_|LO0P265MB6946:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e41b4de-a3ea-4b82-374a-08dd025b45ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZW9QQjBtTGxDdkFMV1o1Yjh2N28yMG1ZYXE4Wlg1SW9tMGQ2blNMRFNIYjdF?=
 =?utf-8?B?eks1M2pCWDNVOW9LVGdwcE5WQmFlVThRS3ZLV04yZk0ydmQ3NGtPbDZIbUNW?=
 =?utf-8?B?Z2RMWStHSUFxWm1UejRXOE9kTWEvYmt2Z053YTU2b0EraHZCNUh2NitMclpW?=
 =?utf-8?B?R05MUTNXWHE3NG1BblZnRzJYc0JpbnRCSlhkNG9XKzcxd3d6VmlyVDBPV1lK?=
 =?utf-8?B?MjdjL28zdDdwc25qejFZQy9yVWVTb3JwN2lENWpVZmM3cFdFa2dWOTh2VzJu?=
 =?utf-8?B?THg4b2cwQVBaTlppYXFnZVkvREVKVnY2MVNNcjI1K2ZvbDBDdmNJaGRadVZH?=
 =?utf-8?B?RUZEVWpzMTYvVXdGblNjUzJXWmhuWHBWYmtiSnRKQUNkbE1obFI0aThNMDFm?=
 =?utf-8?B?VGlJV0tqVjJERDJ1b2lJNEFoNDdGVXMzZmEwb3lqc0ZUYkZwbUJLYkMyaGRv?=
 =?utf-8?B?V2dNWGVxQlpLdGlsdzQxbVA0MDRFWlFueUN4SldJR0plcS80UkY4U3pMVERZ?=
 =?utf-8?B?dWIrVTJMRUl1eHVOUWloZGdwc0g1UEZkK2g5MVlZNHJKNGhsbHJJWEt2YTJI?=
 =?utf-8?B?bEZ0c2NjMVpOcDA4RGhFSUpYMW9iRWZsUFZaUVdiZVJSWWZXTXprYmhrVlVM?=
 =?utf-8?B?UUVZaWJ1bEZ3VFp1V1VjRkhzOFJudGljQndjc0V0THYyeXVCMldIamZWc0Jt?=
 =?utf-8?B?ak9qTG42NVl6TUFla2xxYU9FTFltZjlFSDFtZG44dC9KazZ2QXdDeE45b1Iw?=
 =?utf-8?B?SHU0YXczKzZITVM3Y24yUWVJeHE0QUlUNHBOODBMQUdMclFLMk8zTmsrb0F3?=
 =?utf-8?B?cTJFaFpCd0pkWnVWZXNmNE1qNlZiaVZxSkFrRk05bUdsaUNPdXF5ZUFzb1Na?=
 =?utf-8?B?M3ZPdmtkUHNqc2lzYWF3ek9mQk5sdUY1a3I4bEpUMnNqUDNNdkJoSy9KMklV?=
 =?utf-8?B?Yjd6SXU5Q3RjblEyZm9jSUI0MmlKZE12bktmaVIzendMa2hnbzI1Vlp4dUdH?=
 =?utf-8?B?KzJIZTU5OWJJT05HVjEyS3N2M1FaVS9zYm1TejBjemozTFVyVUxJc1dLaTBI?=
 =?utf-8?B?RzVUK0QvL1pZR3JHS0YrMERJY25LUTV6R001eG1JQjBTQkMyU3RXMHZiSEMv?=
 =?utf-8?B?cHdsTmgwY0pkbHhLUzVSVWtwbjNwc2tZUXV2ZlJ6Vi9UazhyNDdXSy8ybDdE?=
 =?utf-8?B?T1RIMGRsYWxzWnIxWklOV0RaMUsrMVJPbi94RWRkaVVuUWwrQWdRK0J0Nlp5?=
 =?utf-8?B?WE5sN0cvY3ArdVRtZW5tMXFySXpUVTI0MzAyZFhjZ2JDUVI4ekdxU3VSZy9C?=
 =?utf-8?B?aVpIK2RKTTBXN3BONkRIdGV1SHd1Z0d1U1VLaFRyTURKVEs2NDlZb2w3QjBT?=
 =?utf-8?B?OGRBN1ZoWW90YnVqckRvb1hhSGxxcUxiUGVVZ2JsbG9MeTZSWmd4dFREV3FC?=
 =?utf-8?B?aW9HZXdzWXNJTHcwV1hpVHFLaVJhd2FzZ2RUdzhTb1dyYTF0aEtSRTU3OWor?=
 =?utf-8?B?VWhVSzUzQ0IxU1ZMRS9paHVvSGc2WXBEN0Q1QUFCbWdLcmZUV1dzeVZ0WG53?=
 =?utf-8?B?MjB6VStOMHhkcE4vSlJvWmRvY0ZtSjYrc1BmWjZqNVlSRUlLSTZsUi9oOVZJ?=
 =?utf-8?B?MnVwMCt1b3hxUXFGT3RlU1ZvN0VMZ3l0ZlE1WnpxNHYzZWgybmIvTUZyQXNo?=
 =?utf-8?B?RlU3YTBPdzNpUGdTU2lYRGVwWU1qeExLRnMxM29sb0hOR2lkU1VSQ01kMFpa?=
 =?utf-8?Q?BUjNTOa03p6AeESlJL3ImGhhB51EmNuzWmPrrNB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1ZYS2RGVmdVQ0EwbDVrdDF3Unl5S0dndFcxWXYvY3VRaWRWN0R1eEFLZ1NE?=
 =?utf-8?B?NnJaT1ZGSFZuYUJTMlVzNU9DeUIzdXFiK3dGTkh4c2l0TmpZUitoRWQvSkxz?=
 =?utf-8?B?ZVhJWWE4RXZ5WUl6eWRybkd5R3JzQjFzVnh1QWlkanVGeVQrTE9WUTBLVUlE?=
 =?utf-8?B?UFBZZjN4Sm9BV0tMOGZacGV0dmZHem9GQjBHSy9hZXIwbXhEcjVzMk5EeXdQ?=
 =?utf-8?B?UGh4eG83UjM0UmtMM1pOL1pUbHAreFdsMStjOGEwZXZhMXJFNXh5aUlTbXoy?=
 =?utf-8?B?a3FQZXc0WlhZU0tqUThIcTBtemJHRSt2blhzVkhGdXd6Kzc4dlIybUF2TnZs?=
 =?utf-8?B?MGljSzZxR2o1UktHUlRpYnk0OWtIT3VsY1JEZ21SR2VFQ2RTaUhWMjl0UnVj?=
 =?utf-8?B?K0hsS3l0ZGFieHluK0hHS3hrUFJ2NmU3d1RqR3VLSnAwR2FVL2ZDYmFKSkcw?=
 =?utf-8?B?ZDFlNmtNd0FWWDdXQXRWSWFrczlnc25NTG8wcjZqWGV5UW1KelpaK1o1WHBD?=
 =?utf-8?B?QnVvTE9hc2VWNW92KzVKN3QvNXYvaHlqVGhNWXZ2aHlTaDFPVU9NR2pwWlJz?=
 =?utf-8?B?RlZ5TExQRVh5V1RIRktlQkE3Wjc3MDhqQWdYNWZ0elVFMUxLTUh2SDN5NmpH?=
 =?utf-8?B?STBGM3h0T2o2bEpsUnkyQjlFNTZ2dmhPamlmZ1V2UTBkSXBUOFBObjdMMmUv?=
 =?utf-8?B?czhhdDlrYldWdDduZVdNTitaOHhoL2FvM2dCdm5tb01oWU1yeThTU3NpeXAy?=
 =?utf-8?B?cDcyTjZvT1NIUWU3MkhjeDJZMy9yMWdmYm9hdEhOa0hHSWRiN0tZZXdXUFp1?=
 =?utf-8?B?M29yOGNaNnVkcHpMandldlhZQzkvcUVUU093R3EwOU0rYlRVaEFpN0ptRXZD?=
 =?utf-8?B?SExPRXdiSTdxcHlaVXN6SE9maTF4ekQ2TCtKRitLdUJPNFBoOVZtWVJhcWV1?=
 =?utf-8?B?REtkOFUzcTFuUHFqbHN5aHlSQ2s0emk4YVpucVQrK256THlaZ2hBZHp3cGtm?=
 =?utf-8?B?UXhIenRZWXkrd3pQQ0ovSmg3TU9uMkVheGxuSlJrUFhBSHBFK2xDaTMrd3h0?=
 =?utf-8?B?bWdWREpSejc0TkxmWnhpelRoY0o5MXZsYkwyUHB4T1NJK2g1dUlTRmh5R1lX?=
 =?utf-8?B?cmM5WnRyRGZPd0VqQ3JhRjB0VnpJbFJwZ3NycW1jMDJkMk9RRmpRbnN5cXhz?=
 =?utf-8?B?anVKd0Z4WmlhWDNoUWVBblY4Z2Z2MDJJMkYydE8zYmVIUktYY3ltOGU0c1pH?=
 =?utf-8?B?Qy9meVAzenB0K2ozUDB2Rm1GOVZNNWZJZjFjYnhVVjYwbU9FclRPbGsrNUJU?=
 =?utf-8?B?bWxqUG5zWWthTC84TFVZQnQ4Yi9qSTVNMTAzMmtPdklzeTc2bVdOeWgvZmhC?=
 =?utf-8?B?ZlIrdXJtRENYeEdMZ2NOcGdyd3NJdjVrWldKZkMxNnQyYXZiUGtWSk1ETzIw?=
 =?utf-8?B?a2o0eDJnR0dNVGs2Zll6UktERzFyVUVNelJKdDk4RnBrZFFUU0JWY2VuTUYr?=
 =?utf-8?B?K2xlTmpWTXdyWEtldmlrY3dFSmRtdWp3clg4QndPRk5Bam1HYTFHUTY2KzNY?=
 =?utf-8?B?WTJWZ0NsKzhlUXlObWQ3T2ZNY1QvWVBjZzBYSGx2MU42WnBsTW9TY0VnV1Er?=
 =?utf-8?B?RE5mc05MOENRSUV3eTdHTzhTb3lWcWpJZUVybHU1ODdiMHJHdWdxNGFCUTJk?=
 =?utf-8?B?Tzh1dUljVUVvT3dBU1VWZEp0a3J3YU52MFFEc0o2em9lUWU3NjdLQ2swZjh5?=
 =?utf-8?B?UThPcm9WcGdza3VGNy92Z1FFSk15OFRDbi9jQjJRVmtpTElvTksxTHROR1dH?=
 =?utf-8?B?UkkyM1k5ejNjaEZML3dtUEN0dzhhaHp0dnp6cUxIK3VsemhWZG4yNGU0SjBX?=
 =?utf-8?B?RTVYUHJWLytuOTh6STRFcVZmM0U3bjQ4S2Z1aTVpMHVtdUJpdngrcDV2a1hK?=
 =?utf-8?B?VTIzbWpvTTVNTkgySEU4WHRrRzF6ZC9HY2ZEcjlaTi9BNUxkV0tWdU1KdFlZ?=
 =?utf-8?B?OUZXdjB4SWlrMXo2TVRkdEtJdEpsN3drR2NLUk5GNVBjb2RMaWpwc2pHNmZ1?=
 =?utf-8?B?cVZaaVZPaEkyQmRsTHR5YnRGOE1zZ1kyRWJHYmJaOUR4Nlg3Rm9xZGpiTlkw?=
 =?utf-8?Q?WlGJUl5zRnlRUfUqlxzcpBwzR?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e41b4de-a3ea-4b82-374a-08dd025b45ad
X-MS-Exchange-CrossTenant-AuthSource: LO2P265MB5183.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 14:15:19.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQY9dCaoDRTo6KPmPEQglIrra0qqfjO8QS5C/pkFFvg29lBt6DsmKBKpvTKrI8ScDwssCwRHQ14o3R0cwc3luw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6946

On Mon, 11 Nov 2024 09:28:53 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Mon, Nov 11, 2024 at 9:16=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > moment only the patches up to introducing the new `ffi::` crate (which
> > includes most of the changes), i.e. up to commit d072acda4862 ("rust:
> > use custom FFI integer types") but without doing the big remapping
> > just yet, so that others have it available for their branches, and =20
>=20
> "without doing the big remapping" is ambiguous -- I meant "actual
> remapping", i.e. taking the commit as-is without the next commit,
> since we should be able to do most of the renames already.

That sounds reasonable to me. So for next cycles we have a commit that
fixes up remaining renames, and then apply the other commits?

Best,
Gary

>=20
> But the other interpretation, i.e. skipping most of the
> changes/renames `core` -> `ffi` in that commit and do those later when
> we do the actual remapping (which is most of the changes, in fact), is
> also fine. They are not needed right away.
>=20
> I will check how it would look like on top of next.
>=20
> Cheers,
> Miguel


