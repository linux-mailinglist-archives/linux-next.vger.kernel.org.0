Return-Path: <linux-next+bounces-3300-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B75394FD1D
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 07:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B050CB22B49
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2024 05:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA53E219F3;
	Tue, 13 Aug 2024 05:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="XbMc18a0"
X-Original-To: linux-next@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020102.outbound.protection.outlook.com [52.101.69.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A461A21345;
	Tue, 13 Aug 2024 05:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723525999; cv=fail; b=KmYwXPh/jKlDEGNo5atnGVBt17jC+W4XhwTyq2+vrs9VxZmN0qdMVU1ocMJPf1F/eRnLBrvGa+BJMpVAfqg2h/fGM3755U+/6wUOqqdLxuWCN6LXtn8xGQp3b4Lz7CPkvgzG4fBzJRgvkdfl+DZCZpuElRAJUgqVGsJ1+mXh2bA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723525999; c=relaxed/simple;
	bh=1mdH2QIDdr/s/gBV4yauutQcadLAob1PB4rvEHB/cTY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aL/0NRJhd2tcXCzgFGBEoK89yt69ymbP8Vi214Mr39KJi8Ys3ymeyJi/A/50dygQ+pHADGLfjaUFAHY9mvA7iPr7nO85YwppecuKYjIb48nUEORoiTT+JwGqzHkfg1IhYh5owSji4mlSP9rRtd8lmzqyTNQQ6jbVmMleWGs+qG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se; spf=pass smtp.mailfrom=axentia.se; dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b=XbMc18a0; arc=fail smtp.client-ip=52.101.69.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axentia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axentia.se
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2C0RcYTn4xpivFvOKC8dWT9lOB6Y1b0jPzKiYxDuvGtdZgD2yv4LHPlqw+D8AE+e8V7uwbng0SWOB89iQ+y7eFzRrf0HnRa7qbhWJMCw9BKjrkBcXQw84+HybM4bDRA8D6oiDoZRym4sG0lOJs6g3YX8SLUXoLdV3OxVib2Do2M9JsojyTncnJpcwkSA4uVBxhS7jDkJmyr3DUUmGRBwwo2r/5XBz2w9Zs+O8MbX5/laH6O8WMMJCMs8qndHxQXHRBgWDBWAGzNTfjblTp2ETKCEVOIO2Usm36vJpiahHP8eNB1SXMVWp0/0NL69yMTC/9oG2+p+07Q5lM4GqLfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EjwCNEwxINcoeq0xdO0wcqk5jeXIn9jCXz5zEN5hAk=;
 b=B50ma/uaCJYxl5mA1x+NpALCRFaVPosI3qIzqcDF92IRqccoIXlktnvKg6TfhhiXAK/I8zOGuVpWM0xkoIcu1KCFcs5ixbAoi8p+PUNqzsHK3eFNxvfWq/qrai8lcasNTXtJN/ajNoA0x4pgZ9sjOu4IXTEBHJuFl6CG/dvaP6eBWbk3MGlGbqCkca8Qj+9WlVpGDMjIkC+3kVd/BOt7rtk1AbX1pfrMqKUSCUOX75Lq/z0QpdMlmmMiqmparLyEvNq6iUoyHKalnrM/ZZh/ERBhHxa4bdIO4rQtQ8Z+kPnUj3SQRKoK2HBVHJHGEgtfVI2DY4p+mjGyETlsVioMVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EjwCNEwxINcoeq0xdO0wcqk5jeXIn9jCXz5zEN5hAk=;
 b=XbMc18a0s7XDaZulnnWJ4G93iidShXMyHGXoTPq9yw49HsY4kjBTD9ihX6Htxiw4QXNG+GpcqAA8pL90i5wnnnToDFwDrfMtO4aj00iKwrJcgH3zL9FCevZGux43LRmgNb4uDA5mq5KED8l78T2v2BEf/IUyvVNdp+jJJekcFGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axentia.se;
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com (2603:10a6:10:3e3::8)
 by DU2PR02MB7807.eurprd02.prod.outlook.com (2603:10a6:10:2e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Tue, 13 Aug
 2024 05:13:11 +0000
Received: from DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827]) by DU0PR02MB8500.eurprd02.prod.outlook.com
 ([fe80::aff4:cbc7:ff18:b827%2]) with mapi id 15.20.7849.021; Tue, 13 Aug 2024
 05:13:11 +0000
Message-ID: <47cf6a9d-82b5-65b2-0937-d7ee667f5d26@axentia.se>
Date: Tue, 13 Aug 2024 07:13:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-next: trees being removed
Content-Language: sv-SE
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Brauner <brauner@kernel.org>, "Darrick J. Wong"
 <djwong@kernel.org>, Leo Li <leoyang.li@nxp.com>,
 Richard Weinberger <richard@nod.at>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20240813085147.786004fb@canb.auug.org.au>
From: Peter Rosin <peda@axentia.se>
In-Reply-To: <20240813085147.786004fb@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV2PEPF000045B9.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::42a) To DU0PR02MB8500.eurprd02.prod.outlook.com
 (2603:10a6:10:3e3::8)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB8500:EE_|DU2PR02MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bc6d892-754e-48c5-0df9-08dcbb56a01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anF1YUw5MWtjZXV2cnpOL3RObGk1cUNWVlpYRnl1T0tHcUdmMVVrZWZrWDRI?=
 =?utf-8?B?R1NEazl2ODdVOXBZYVo3NTNSN3UyUkV6Nm8vOC93Y0ZIU2hoU0VSMHpPOU0w?=
 =?utf-8?B?SzJNbWRjWE5JS1EvVzJrOWdVOFl0RUx2Q0NlMkhMYUQ0eklzTjFqS1ZOcC84?=
 =?utf-8?B?Mnk2TTB2VnFwcnRHcnhBU1ZxWUplL2RSUzA2M0p0YU5sYUlXUFFDanNTRkFk?=
 =?utf-8?B?WnhOLzZLcUV0NHBoemFrUVp5MEFnb0xPOFVKNzY5c3lPa3l0anlzQ2VVYy9p?=
 =?utf-8?B?ZVBWZHlyVGxRSTBET0dhKyt0TVNrV01rVktGRWhmL3BNeTZqTVg2bjJJTTlD?=
 =?utf-8?B?MUJtV1lYV3ZuZStnQTBkNFg0Y1RKYmxqbFZITlhLcXlxdXBpVExndTNPOVV2?=
 =?utf-8?B?dXhkcFhHMzkxMSt2ci8rbDlnbTNpUVFJRGdlZVlLeDQrV0srdldLczdWVita?=
 =?utf-8?B?bzBua01vMjIrQXJFV0VRREllaWNBa1g0V2dsc3B1V0Npcm5GTGhzZnFjNzY1?=
 =?utf-8?B?VWRRa0tUb29mV0ZUTzlxZkZCdEtra2srSVdlU1NQWVNQSDBVYlBWYXlJQ2NV?=
 =?utf-8?B?ZFBGdjdiTlY5YklWTVpDRDNXaE82cDc2MjVvaDBlbGhMMkpPckFZS2RqeHpk?=
 =?utf-8?B?dDd0S1BRK1Q4QTZkbjgvVDVSdUhvTmhGUUJpNTMzLzJsVHErNDBwTjFFQ3p5?=
 =?utf-8?B?QnVMakpFV1RGMVdETGhzdFlFWjJoMnlPYkt2WkovNnFubmg5MHJSYTRkblBn?=
 =?utf-8?B?ejl3c3l1S1p3TmRTNmFDTDZUQStZVjNPM2FVeEdjcnQyN3k3UnhFZ0RSTFIv?=
 =?utf-8?B?dk00aFhya20yZ3VqZEFSMFQ5Zjl5WVNVSXhkejY1RFRnUHUwYWd5NGhVVnpD?=
 =?utf-8?B?Rkc4Z2I5R2gwaGVVVEM3L2tFdDNudUU0cFg5aE92NFhzcnErdE4zRHZzUjNO?=
 =?utf-8?B?dXdwOHh4cGhBWFBza0RLZXdNME9QRytTeklQNGVxTDRHaWZleWtaVUVDYmo1?=
 =?utf-8?B?RCs1YTVjZkRnSVdwYU9NNUZBZWREZzg1VTN6Z0Q3S3NyYUNvNWJSTlcwOUVR?=
 =?utf-8?B?MndSWHRsZXRRS1RUY1d1R3ZMdGdTemZUNnNlNHlETTJQK3I5eEQ1dDdSRkF3?=
 =?utf-8?B?QXVxOUZheEQ5UGtxN25jRUJ5YXZ5Sy94MXgrU0R6RGJhZElmRmE2UzhSN05Z?=
 =?utf-8?B?cnhhcTJDT2hISmszMVNqWjRyTnFHTjM2V1RzSVlaTEpyckZTMWR3ZU1Mb28v?=
 =?utf-8?B?MzNraFg3Zk9xN0hPNDlLM0tvdCtYQ2hTc0pYZkJDQ0FYQWhBWkZZNm9lZ2ox?=
 =?utf-8?B?VW1qb0lYajBSRFdQendsbVV3QzkrWXZMbDYreWVyNGlmeG0vZGVXVlhvSGNB?=
 =?utf-8?B?cFY4RlpKYyt5QUxpcnUwd3NhdFQwRlRMNjl0UGEzNks2cTRRbmVxdkhBSncz?=
 =?utf-8?B?K2pXMlBaTVRzcjhUS3FMRlJjT1IvZjlnTk1OR1c1MlUxWDJMYkQ0cDdSTExu?=
 =?utf-8?B?TWR0UXRPTnZCS0lSRUVhUHhhY2tzdC9IWkZ4cGw3U0llU3pJQmFMMm9PcDFF?=
 =?utf-8?B?Y3Q3TFJUQm9xMHR5SnpmOFFyYmp1NGJjZ3JhbCsyc0hnTFFSV25lZ2FqZmJW?=
 =?utf-8?B?N0hVNDVRTUI1RmRjWi8zbFNyaTlwaDhSS09XQkRaSWl3UWpSS2hIT29Bd0NY?=
 =?utf-8?Q?fBIeekxrevjd/Lt1q9Uo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB8500.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OG1LUDIxak1pajA0QTE5elNlMjhkSk5nL3Q0OElKeW82S25UOFU0QmpOVVds?=
 =?utf-8?B?KzZpekpqSGE1QmQvcGhrcGozVlRycC9xMm9janRwYktucTU1M0VrdFY5bWxt?=
 =?utf-8?B?bmhSNlJOQnArdk1BbUljQ2ZnQjFNaXg1bllBLzJLbVpUcGZxL05pTHM2YVZo?=
 =?utf-8?B?MU1uazRrbCtpTVpkamhJMjA4QStTbUJLTlRpQUVPdlpJUDNodFJIRk9aSHls?=
 =?utf-8?B?b0kveUg3SDE1YjNLR0dmb1E5a1hOVkZTUFV5dE8xcUFGZU9FWTRlR2xjUW1Q?=
 =?utf-8?B?M1JsOVJ6MG5qdDdGUzBWMERmUFlIeGtzRkU0K3RaYUVmRHhObDdVMVprYVRt?=
 =?utf-8?B?ZDIrQ0ZNNFV0N2Y2aHdYbTEybE9GalN3WnlDWGhSUHR1bHlHd3crUy96TVJJ?=
 =?utf-8?B?REY1MVNOLzNlTEFpalRRbEZzL3phazRzbEFJaXZMUURXdDNCNWh0clRpeDht?=
 =?utf-8?B?NGxoV1lSaUROVzB1SHFLZStZUzM3VDdnZTFYUTF2REV2czZHNmY1SCtDRzIz?=
 =?utf-8?B?bFpQWG0relFjcHYwaHQ5VWI2RGZCdUlWaWtHaGl2R0xKUFdOejlpbGJRYjBB?=
 =?utf-8?B?YVQ2NC9RRkNaRlJhQ0MwL3RhN2Z0Z2tJL0VRNHlZdUhLZFZCTGtqRjl0RExK?=
 =?utf-8?B?MjM3NE9FazZib0Fab3FZU3M2dUpQQ0FmeTUvMzQ0SDVrNnlJRGNqZWo3MnFa?=
 =?utf-8?B?eHpFTXpYSjRWWW4yRGRrMWNMc05CU0gvNTZvbXF0aFNyMG4wRWdlRERXRklK?=
 =?utf-8?B?QXFvNXVpTnBDaCtlZVFJQkVBMjhVQW5sUTFmVTdhMUpSa1hoSDgyUXNzZEd5?=
 =?utf-8?B?OWYrSWJtV1ZYRUtQUGtPalVLR2d2SVZEMUZKSG9mTzRkN1hsd2RhUWtDZUpX?=
 =?utf-8?B?Y1UzK0dRcmNReXpvSzI0VGtENWRnd1RidHBodDlmUzdKVVd3NDFTWkxVV2lZ?=
 =?utf-8?B?SCtPanlkckxRZHBuRkdsUDZUSStzL1RvZW9jNDJIV3VVMVU3aFVNSkJvdm5h?=
 =?utf-8?B?bW9PbHVKY1JJREZwTDhBRmdPR2E3VUI3Y2czZlVrSGxwV0N0N0FFdUcxeGZH?=
 =?utf-8?B?OUdVNXpUQXBLemlHalk4ZU81Tzh0MEVsNGV1dDVFODEzK3VVczZQMThGZGU0?=
 =?utf-8?B?TVdSM1E5eEtTMkc4cEZmZ3VWa2tPTDM3L3VIV0ZqUXV3WUhYM2J0akZ6cDRK?=
 =?utf-8?B?ZnVKMUo5VFFqdGVzNEtzR05VMSszOWFxOGdBSGZPUVpkY0RvUnQ5dUkzUFBY?=
 =?utf-8?B?dysvY29kK1JmVXMxSGI5bGdRTm43Znl6ZEE5aFhFN3prK1hnMVRuQkdyZkhN?=
 =?utf-8?B?enAyalhFYjRHM0swWlJaU0I5ZTdzR2lTcUgwQXVydllMdE5mN0kyWG5JaElU?=
 =?utf-8?B?dmRRYisxU0tmUWtwU1JDM1dXMWprNFYyODFSQy9TdmEzdnYrV3pNVzBsQnRz?=
 =?utf-8?B?UXZHRi9VeDkvVEs5MGxRRGpaT2xYVWNRMGVFMHMxNWZGNm85Njl5WkU4Z1lV?=
 =?utf-8?B?K3dTVEpudS9WcEJxQWJTNmZuclNtakJGb05zMTR1Y2xvY1RVTlQxeDBCcitF?=
 =?utf-8?B?OWthNVFqUGM5Z2dtSjNHLzdGU2s1aVlrYUo0ZmE4NENLbVYrKzVIK2RzOHFJ?=
 =?utf-8?B?UStZRlpJMjNoeWJ2d2d6U0hrdlJIa0UrbkZDRjJ3U3I5aFA4VXhpcEtLemNW?=
 =?utf-8?B?cHFvZ0FoQ3ExNWxxaGYwQnFLWHBYWVVHL1lhM0MvRXVFTGQ2N3JMd1Mvck9F?=
 =?utf-8?B?UUI3NGhOdEcyc05ieThuOHMvbGVzMjJrYjJDMUs2MVBFeW56Q1FndFF2cHJv?=
 =?utf-8?B?QXdNTkNXcWFLaWJKeHpKNWRXdmRxbDNEWllrL1JFbFZkSzlxM0RRaHd2dTQ0?=
 =?utf-8?B?NlRsV201dVRNOGdqUDBLM0lUOFd2ZnJHWFVkM3BLdjNOdkFvY0tCREdVY2tE?=
 =?utf-8?B?ZFZUUmZscnZqYlk0M2RKSGtEa0lybE5oS1c2VENXeVcxOXk1aW5SZndpN1N3?=
 =?utf-8?B?MXVqd09YbnJoSnZxQ1k4YVo4dVVkdlZRaG5xczBDTVEyTEFxa1FPcnRNRk9u?=
 =?utf-8?B?RTRUd1RYK3dJR1hyQ29wa2dNakliU0FGTW92elFHL3NJaEZidWgwMmFDd2Jq?=
 =?utf-8?Q?51SF+P6J9RM4uCqlD46j/9dxl?=
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bc6d892-754e-48c5-0df9-08dcbb56a01e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB8500.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 05:13:10.9796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DK3Xet54ELUwPT6aRpgOrfjLdV1xRBlAtxP6Rj66wAjMmmFJPMrL6X8wgvRt3a3m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR02MB7807

Hi!

2024-08-13 at 00:51, Stephen Rothwell wrote:
> Hi all,
> 
> The following trees are going to be removed from linux-next because they
> have not been updated in more than a year.  If you want a tree kept (or
> later restored), just let me know (and update its branch).
> 
> Tree			Last commit date
>   URL
>   comits (if any)
> ----			----------------
> cfi			2023-07-09 13:53:13 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git#cfi/next
> djw-vfs			2023-08-04 08:20:57 -0700
>   git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git#vfs-for-next
> drm-tegra		2023-04-06 14:02:33 +0200
>   https://gitlab.freedesktop.org/drm/tegra.git#for-next
> mux			2023-05-21 14:05:48 -0700
>   https://gitlab.com/peda-linux/mux.git#for-next
> pidfd			2023-07-02 11:14:54 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git#for-next
> soc-fsl			2023-06-08 17:56:26 -0500
>   git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git#next
> soc-fsl-fixes		2023-07-09 13:53:13 -0700
>   git://git.kernel.org/pub/scm/linux/kernel/git/leo/linux.git#fix
> uml-fixes		2023-05-10 00:21:30 +0200
>   git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git#fixes
> 

Could you please keep the mux tree for a while? I have been very busy
lately and not much is going on, but I would still like to be able to
get things into -next. I guess I could just ask to include it again
when I need it, but...

Cheers,
Peter

