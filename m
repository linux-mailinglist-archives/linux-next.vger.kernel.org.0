Return-Path: <linux-next+bounces-2775-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD3991E741
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 20:15:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFA2EB22826
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 18:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB768383A3;
	Mon,  1 Jul 2024 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="s4qfRxw6"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2133.outbound.protection.outlook.com [40.107.237.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A947529CEC;
	Mon,  1 Jul 2024 18:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719857726; cv=fail; b=myKyhWyZmJdWMjub4OgmrPKrW1a1yW+iFnSfru4M7N3bV0K7ItND6nL+ULd0XM8SO99zTlMWgm7CWSCekaUEVk3wH5PehJeglVzFsqnakzqr4gUdMitHhBVgKFkYmwNn+P8fvixsmzLtUq9r6+nyEC7LqcpdM+Xlc3cy3LJ3sD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719857726; c=relaxed/simple;
	bh=sWGGnBANvPmsEqY7YKXZ1kG+cdJqWmNCd3IIdb/LJxQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g+fgF+GaBnW3gjPr+WsZBId4XExk6AEV29hSjuU1j7d4tIQIufCxWuuxM7fx5ScN1S6VVALLJU5Mbta6PAdRlpz0fxKpqCbjiLw+lGt9WNqOHrc7zb0TzEIVlqswRLMnpFV8h3rJQ1UqcY9PZGoJdq5Pwhr3INQKG4PUdVvCunI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=s4qfRxw6; arc=fail smtp.client-ip=40.107.237.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcvoYf2sL/QVnahH8IyYK2zLxua3DkJdTT8x4PCvSyzpSPZVSLssvyDR8ikKmqjZyyrbefGwM5dVTvepLQTgZcYkqye+wUX4R3WiUCAgpHLmeZ+CdmK79YioLOc5gfrjTGy0MvQ19J72Zo2g+tnjpc4LHHrKD7lF/QhL6j+lz5B90EF0kcJEZKcDF7mDX5fh9NQdFJqKu1kmfMgicKyP72Cfjnvq37TPdDDOrga1dY+Cg4l4DE1Lu9FgTyaldbBTJbIQKnGMGqb6hq/4MTHXZLIqACSTspBfhyW8yNZ9Ub+xnVCoHjsf2vOs/108nJPza/iQkVmSJcupv2qAu9RvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0L9qOjjOOgJObccrWY58wMFk5h0J0MoFYabguvfQ72E=;
 b=Osd/Buy52O4NkzfREQOCRR0zzxd90zp2XGumbeWn5m5t7bpL+CfHaqwO+B+b4ZTvJmxIHqKT3P3x1S8Wv8Rrtx5N1W6polk0+Ks/iaF2D/0AyAvLV5RrVoBBIrOFP4JDwi0hVMt0c82thDmLmyU0ancUTvHl0qpk3NQhuzzCb7NnVj0cnh1MtGKwW3HYh0cDoT5FkpU/egIjQDIhMixd8CMBoIK6bTzK5q5QtW0l+k/Rtr94nT5t0UNjbyz+VzHcDbgSynd6DTclOX9vAt1eF+Ty8yjwmM6mmmx2bvovfvE81KmufcVrzGX26kmlzgfQ/Iux92Dwmh32HCDlJRbmdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0L9qOjjOOgJObccrWY58wMFk5h0J0MoFYabguvfQ72E=;
 b=s4qfRxw6C5dTnOn9N0nufgrxsTl24PH7F0yxz5iaXAmlermwoUsSHEaK975clHAue4zo5xOI1wN9uE0GQDUDpFtMHDjqFGLB1wWXjiPXGFNZnaJ576ENp57zgsuIMhDnI63cZloM0xoiQWCiTrdRWWorY3BqnJTut4fDOoAtFGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from BYAPR01MB5463.prod.exchangelabs.com (2603:10b6:a03:11b::20) by
 SN7PR01MB8115.prod.exchangelabs.com (2603:10b6:806:354::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.29; Mon, 1 Jul 2024 18:15:21 +0000
Received: from BYAPR01MB5463.prod.exchangelabs.com
 ([fe80::4984:7039:100:6955]) by BYAPR01MB5463.prod.exchangelabs.com
 ([fe80::4984:7039:100:6955%4]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 18:15:20 +0000
Message-ID: <37b70d3f-c46c-4df4-b52a-3c6ba5feb692@os.amperecomputing.com>
Date: Mon, 1 Jul 2024 11:15:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mm-hotfixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240701101641.4fea0ac2@canb.auug.org.au>
 <20240701110159.216a8d1f@canb.auug.org.au>
Content-Language: en-US
From: Yang Shi <yang@os.amperecomputing.com>
In-Reply-To: <20240701110159.216a8d1f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0073.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::14) To BYAPR01MB5463.prod.exchangelabs.com
 (2603:10b6:a03:11b::20)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR01MB5463:EE_|SN7PR01MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 180fbe5e-18ef-4715-ac33-08dc99f9c45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHNpSWcwK25JM1dvV3dhUjJMSG93WGltRWVWdnluMUVMeHcwYjdsS09xNXQz?=
 =?utf-8?B?SFpNR1kxbkNWR1F6QXYzUmIvdnViRFpwMzFremJIQWlUbUkrRGxPdUZqS3JG?=
 =?utf-8?B?K3FjY0wrb0tUQzNTU2Zxcm1ZNE5KUTlMZWRhdGVnU1ZNTkRvQ2NCZ0tKeXhI?=
 =?utf-8?B?N1hPS0FrL3hnUjdieHBCWUpVcmRaZVpSWG1HNXBHR25QcklVMmxscVFIaXo1?=
 =?utf-8?B?cVl4ZWFkNHZPMU1TbnByS0hPd2U5T3pzQ25qc0NUWFVSeWdwZi9Zb3dMcDF2?=
 =?utf-8?B?YWtNYUVubmpySXJrRnh1UjlqdW1WN04xbDJGcUxwMHhMMm1qSkZJVGJ6SXpR?=
 =?utf-8?B?R3l6UTh5QWplYlphVmNYZjg0b1ZWRGRXNFhYM25KaXhsc2M2WVZxbjFWUitL?=
 =?utf-8?B?NzBrRzFrYTVNd2VLMmQxQnVaa0ZvZ1FsZzJyU1FnaUFDeDcrdzRpOGtYWWtv?=
 =?utf-8?B?WTR4dWRDNy9oVTZhWC9vTVBJSCt4UDg2bkkraGRNR2sxeXpPb2Q2dElGSXBa?=
 =?utf-8?B?VE9mbVVLd3FBWE1Da1NGVU9zRTJWeDR5UXEvTXpCVnNxRnc1TUY1MzN2bS9Q?=
 =?utf-8?B?UXpRYmpZNElaMkdRZEFjMXhNbm4vZDh5Syt1NFh2ajFCeVpmeDFuMTdmRjkw?=
 =?utf-8?B?WnQwSXZiSUlLNXhsTlkwenRQOXhRUmZqT2syU1huMXdQWkdNd3JHN1FXTDBi?=
 =?utf-8?B?UzA2UjRmNmxJdEs4ckl6SW9idWJqMjRsc2RHMGZFcytpdmVWV0Z3RUxTL0NE?=
 =?utf-8?B?NFZiUGFkem44RzRoZkZEeEZ0bzRMajZSZUoxaDIrOGhDS1ovY3hYNUJjc0tu?=
 =?utf-8?B?bkVaU292aWJPY0syMXVXRTQ5UE1vWEw3VEUyQktvcHBkZk5UZTN6ZU0vbUxP?=
 =?utf-8?B?bS9hZ2dDMWlxandwd1c3OWFFWitUMVJxd09ZbVZmMG1wMHZhcFhFSHFLc1Bu?=
 =?utf-8?B?eWl4NnZUV0hhVUZCUWF1UVVleE41UG1kZEJFdUhncTJ1NmZnenpNdEZBN2Z6?=
 =?utf-8?B?VU1rS2JEc3pRZmIzS3hlWWxUbGlZbDJON2RzRGlodkZNQ0ZnUWZqMXBWTzl0?=
 =?utf-8?B?QVFtT1A3SXlRcWJ1bXpuS2hRekhuZUpwaXJOWEVUZitGdnVBKzlzYWRIUTlD?=
 =?utf-8?B?MzFyclprNnJ6TnNTaFBoSlZhbmNhVkFPTEY4aVZXaEVYRG1VeEtMRTA1QWk3?=
 =?utf-8?B?aDB2ZWk1Z01OTHNaOGpzNmFSZXRkYmZMTHZheTNYamgrYmVxTlJwYzdteXJs?=
 =?utf-8?B?YVhrWFFWeDdNcVFTT1IySWY3bnprYndDOFN2L3ZHQmltK0phZnJIdzIxRDVa?=
 =?utf-8?B?S0FQdE9LQWhZTU1sbFFZTUprSmUyRStjOW9ESDRYc2h2d01VS1UremlVKytw?=
 =?utf-8?B?aVpFZ1FFdlBVZGorUWZWRS9TOU1lY3k5clU4dVJmQ1FXOVJENUFnZWV3bGpS?=
 =?utf-8?B?b0lNdnI0NmlMZHVmdjZRMWM2emZTUXJwWDRPek8rbGRrVFdmR0NKWTV2eDVQ?=
 =?utf-8?B?T2UrY1ZWU1pncUNaRmNHaWNmM29ZeWFMZDJ1U1hJanF2WHJtTDlXK01JVUZL?=
 =?utf-8?B?NHpiTkErcXYyd3BqZ1ZNVUtBRXI4WDhpeXRSYUc2TnpRbk5GUlBsY25xVEFJ?=
 =?utf-8?B?SjB0Y2NkYXIwR2JQdlpWN09tdDlJdy92b2xQN01rMXNFUkM2dGtpaWRyNnEr?=
 =?utf-8?B?UU1xTHBiNDd6WTVoV2JhS0tLTFE5Z0duWFRlWXlMdFJ5dGdSd0RkZ1QxL2pR?=
 =?utf-8?Q?gQ/gfeJqtUXa4cabwo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR01MB5463.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1oyTVpJNWpDT3BrQ2pXbC9hSFBheWIvUjVBL1pEK3RxNkNaaEViZDIyT2ZR?=
 =?utf-8?B?U3VZM2l0TFlrRi94Y3lXdG9vUitBRzl1VmcwbmVFQXZEZzJWNjR2Y0t4bXh5?=
 =?utf-8?B?dG5UdmdCUDQwN2EyUmVyOVBCd0dTazdZQi9PZTFuQy8zellkdjdzNlNuRnpn?=
 =?utf-8?B?dnhIUlZJVEhqOXp4Q3pYNXhJQUFub044WkwwWU5WaDN4M0Zmd1VPcXFOeEV3?=
 =?utf-8?B?Qllld3ZRV1phRnZWZ29hTzFtNkMzWFVrODNrWFpVdUdVanhpN0g4aHhFQnF6?=
 =?utf-8?B?WGZlTWxFRzBrMDZXZWl0aTFGRWJ2SXROYldDQnlKTzdweEQ0WGsxWEFmRFJs?=
 =?utf-8?B?NlRGQ1Urb1ZpYk9COFR0T21ibW9kem13Ny93OGl6bWlMUWpOTWxSaUhCZGVG?=
 =?utf-8?B?SDFJVmJudVlzRDJnei9nV3hGRlZpNXJmQjgvSjdvb1pRaTVkZW9ia1g1N2dZ?=
 =?utf-8?B?WXdnaEtvWDZrejZiZEtPS3VkREJldXFLU1l6V1FsVEg3RUl2MHBCVDVjb2pW?=
 =?utf-8?B?c0dubk1zZVhQcXhFYjZkSm9odGRrU2wwWXBUUy96bEVHN3czSng4eGNSK29k?=
 =?utf-8?B?d2JVTmozYXJmWlJ4QkM3aHQzdnJIWENIbTNZNW5WTm5xNWJtQlV1S0Z6M04x?=
 =?utf-8?B?N25jaW16d3BBampEbkc3SWQ3eEZVbW1mcEhxQ2RLalRYSXhjQVB5WmhFNWhi?=
 =?utf-8?B?ZzV4UytoYXFGVWhpM2ZvWlJMNWZ1U1hlWnh6eUlvc3pBaFpqSFZ0ZW5tME9u?=
 =?utf-8?B?N0REaXJDaGR2K1JrOTJ5R01zZnJSRG1FYUhrT1RXdGxOMVZadXRiQnJta0dy?=
 =?utf-8?B?NkhBUmF1dUZ5Q2YzUlh5R1VUMHlYNnF0MzJQTmpGZXB0T0NyRDA0cEhrVGRY?=
 =?utf-8?B?WnI5SWtpVmF0TUJGNFVEQWRoeUdGSGgzV0w0OVpXVk9IZjZLSkZxNFV3ZXVR?=
 =?utf-8?B?SFBrb0ZBZ0kvZVNhWG5kWXNITUhVb3AyYk1WTXUxRTR1ZCs3YTRWTDRFMlN1?=
 =?utf-8?B?MXVhUXRxZEllOHpwN21PMTVoWkxwdlVRZlV3N3dzR2lOQ0VzOFdXQVVXdU1F?=
 =?utf-8?B?MW1xREdmMi9zSVppaUFwdHgvM0t6TTN1MzJmcDlDWU9GdEV3L0NYSEliZ0dn?=
 =?utf-8?B?ZGdRcWpKbzdod2g5ZURJNjg1NFF5ZElLL3Z1dis3QVhMaUxSY3FhR0xSK2Er?=
 =?utf-8?B?WUJtRkFVdUxCWTRxNlZHWU5mbG0zYjVsWm1nWFJHeDdVU3hEY29HK0QzZHdW?=
 =?utf-8?B?ZFgwRWhXSEpMek9zbmUwSGY4QmJlR1MrUlREOENXN2Q5TzUxak9CY0QvSDd5?=
 =?utf-8?B?bE5vRkNncDExbFVyRTdNRGVGVDZ4a0t5a252dm1QTk4yS1JhUXQ0WEpHVU5B?=
 =?utf-8?B?NlYvYVVLVHB3Uk8xOW1zZjVJeWk1c05GUGNRckM1OHlJeFNBQUVacUxNZlFJ?=
 =?utf-8?B?Wmg4WE5GZitTYlpOQlgzS0FJL1hxZ2tya1BIM01Oc2Y4Z1lJU3pKQjUxZ2x4?=
 =?utf-8?B?eXZFSjRiRzdjQkE4ejZiOTNEdE5uamZMR003cDR5SDh1a2RSZGJtVmhjSEtn?=
 =?utf-8?B?RXg4UWV1eW5kdWJrUUtxV0lBNXhUTjlGbGdHM0JlZ3J2UHRLKzVBbldCRFhx?=
 =?utf-8?B?bUNPWDFiZzBpck40d2NYSEh3UVQ3WktuRTcwTU56VmhaQzhZamdBZDZZcnJr?=
 =?utf-8?B?c2lIeGRPSE5QQ05VQ1dzZi90TjN4ZDFmS1R0MHlUL0JlWHRCTHhFMVRPcWJF?=
 =?utf-8?B?aHorNUcyYWZKS0xsaURjajBCQkpmWVByc3g3YmtlajhsUm1mWWJTWjJHRjdk?=
 =?utf-8?B?bFpjampneThQYkFFTnNITHdlcGhVT3VINDZTT0VHdU9rV2dBOS9ac29vaytp?=
 =?utf-8?B?NkR5enRNS25nNkZ0Q2tEZDdMR0ppU3hzR0x2ajBpbDBkaXdKZU93OFQvMU16?=
 =?utf-8?B?M3JvMEl6MWtBcTQyaDBjQTVKRC9mamxXcGdscmEzZjR1ZzBuK1g5RzNmVFZ1?=
 =?utf-8?B?OVBhUDFrakhQQUV4ZTBHalQ5VTJwZnpmdEtnbHVwNURGWHV5Ni9yRDhubzdn?=
 =?utf-8?B?ZEFrVlZHZm1RQWFxNWQzdDMwcGRZb3lQZUFTRDJ2cEN5SHBtNitGUnlaRnBX?=
 =?utf-8?B?RGJmMUFiOEp3MXRLUlV3ejVjYzA0bnllSXZKTkRxSmZpUmk5T0lNUzRRQ1d6?=
 =?utf-8?Q?XJsF5HcgiEoEd8o4zxyVmNQ=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180fbe5e-18ef-4715-ac33-08dc99f9c45a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB5463.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 18:15:20.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gCS2r5nEWi3qcq5bLZiIWuxJtUxEbEUv9epstTcR92JNQezYETUbcnO2i5/Stiwgt0CZvQxN2gGGeDmVEteo10vbSH4Euh1wuIMCoF7arvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR01MB8115



On 6/30/24 6:01 PM, Stephen Rothwell wrote:
> Hi all,
>
> On Mon, 1 Jul 2024 10:16:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> After merging the mm-hotfixes tree, today's linux-next build (powerpc
>> ppc64_defconfig) failed like this:
>>
>> mm/gup.c: In function 'gup_hugepte':
>> mm/gup.c:474:25: error: implicit declaration of function 'try_grab_folio_fast'; did you mean 'try_grab_folio'? [-Werror=implicit-function-declaration]
>>    474 |                 folio = try_grab_folio_fast(page, refs, flags);
>>        |                         ^~~~~~~~~~~~~~~~~~~
>>        |                         try_grab_folio
>> mm/gup.c:474:23: warning: assignment to 'struct folio *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>>    474 |                 folio = try_grab_folio_fast(page, refs, flags);
>>        |                       ^
>> mm/gup.c: At top level:
>> mm/gup.c:2747:22: error: conflicting types for 'try_grab_folio_fast'; have 'struct folio *(struct page *, int,  unsigned int)'
>>   2747 | static struct folio *try_grab_folio_fast(struct page *page, int refs,
>>        |                      ^~~~~~~~~~~~~~~~~~~
>> mm/gup.c:474:25: note: previous implicit declaration of 'try_grab_folio_fast' with type 'int()'
>>    474 |                 folio = try_grab_folio_fast(page, refs, flags);
>>        |                         ^~~~~~~~~~~~~~~~~~~
>> cc1: some warnings being treated as errors
>>
>> Caused by commit
>>
>>    5f408bfe0d13 ("mm: gup: stop abusing try_grab_folio")
>>
>> I have reverted that commit for today.
> And I also had to revert commit
>
>    52cca85b0ebf ("mm-gup-introduce-memfd_pin_folios-for-pinning-memfd-folios-fix")
>
> from the mm-unstable branch of the mm tree.

The patch attached in this mail should fix the compile error.

https://lore.kernel.org/linux-mm/CAHbLzkowMSso-4Nufc9hcMehQsK9PNz3OSu-+eniU-2Mm-xjhA@mail.gmail.com/

>


