Return-Path: <linux-next+bounces-7231-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D2DAE648B
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 14:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8ABED1927142
	for <lists+linux-next@lfdr.de>; Tue, 24 Jun 2025 12:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFA72BE7AD;
	Tue, 24 Jun 2025 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yb8WhvEC"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0988C2BE7B2;
	Tue, 24 Jun 2025 12:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767281; cv=fail; b=X8DmZ8c6h0zCQ51jzEPD3aNZVymVQvp3xxgHGilxbfigCe3YRZCKM3/ak0vTuuzS733TVQ+cKmdQVHOF1Qkf3shGnXnET19UF+Bz2TU6ha3DG674wRJ55X1EsHO2qozs02BW5PxdA3ya1/1wqE0FVqMYwGxAJZ48GmATxHDFR1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767281; c=relaxed/simple;
	bh=TKBqZnutsAlPCJP1GYggU3Enrrk0S+Tk56XHKPMqgeI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=JrFlSGr9M5EG8BcD0Rc9pYKXOuuoVXtCJjwSVm0P1VjjwI130JbJW0UztYL+/FowfeBulphCocwi6BgpsdEbu/5fTszkeQtP6eu1fyNivwK3h7n4ySQqUSOS8/b+8DmdYQUK3r8UwDiSl5a8PgX3hKbnraD4cBfcrxvRhnzaU7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yb8WhvEC; arc=fail smtp.client-ip=40.107.220.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYWUsknAJ+dFS1vqu122BocojvICU+TNA5NesA4+WHlIQqE89/8nc2cFSnR0yqWyY1rxNzVUN6kNaysrZYoTDknub0/9gZdV4fmEcVToPwu14sHRj2Q2jv4QW0jxhSkqm9f3hGev0OOBS1UFfYrKZPags6NfQRurHfKYa4lt/RYBxgTahh4hENL0DpWSxClEZ0kCKxJ5UanKUsHtcvAm/Y0yECMGjVaWjfoCoFJu7T+sB179gPJtoSx+JRCyMJk7QT4/ieO+xs83JOWS0eTXei/q19juuQSju4NWIXesHHDXjgB1Q4SFXU3p8XuYtpUWaqOACuZyfQksBRLhs5JqdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4E2Se4WMKSiaSFWZQREoGCbvAMW9wc30bD6rDkL7Gzg=;
 b=nOCoVHbZjXg4cnmzuwHhW1G9gy3bVUTOgl6eCoSph7VLxPlgNk/cochgeD+FXTyL+PrHtM9hZZn+xc0za9l2VnIETo74zqtOYhhdvX5jqp40rcRdjCzEXwumKDNVUvJJl4K9639nnYPAxhmVcGB3IRrPBsG24T0SgoC15H4sl/jZbUUbf6pBRIVb/VmKSD9/+KGtHWZOwyNj2WUxiJy4mbHbvDLIG4RmaqdIOeenXIRm1MjKtEZcDvmz1pFU7uzM0VMRsyhlP5sD2ABtPydJ+qmc4rzh/f2Kz33kbqBnZ7YTC18P/+lbeCvtJJAOS5jHSp42s7Hr77k+TZyJQ6qZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4E2Se4WMKSiaSFWZQREoGCbvAMW9wc30bD6rDkL7Gzg=;
 b=Yb8WhvEC2AOCI9r6MmGocFLwtMjQ+GqC/Y+Fl7H0ri2ovcIcCPnLhFSOJsABtPOlMFMaEAcLkD59YFRi227UYCHEAiz3vWArFG/PPFPD30mk0fkLHHo/MjNUjM0humTvabNP/BybRlqDXCJJra+FzwrIQTo8fPwHbrN/Nn3PiSdRuBo5bzGXRxJyeS6a8F/9sWpCnXSnFDV0vQZIiEkd8f+4zH5C1z5i+Q4Ww8Z0jn+F2iXxaRELXY4wpM8lKmmf8qMKSnZ/F2E+a022pSaFUjmRYMfJF0ehsECg7Ez+2aYgE6I/lhYdueKzS589/EiiSId21OSvhRL7jFARcsRCgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6037.namprd12.prod.outlook.com (2603:10b6:8:b0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 12:14:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 12:14:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 21:14:24 +0900
Message-Id: <DAUR75ROUY1Y.1GX6ALNM4FUAX@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda"
 <miguel.ojeda.sandonis@gmail.com>
Cc: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Lyude Paul"
 <lyude@redhat.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "FUJITA
 Tomonori" <fujita.tomonori@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Tamir Duberstein" <tamird@gmail.com>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250624173114.3be38990@canb.auug.org.au>
 <CANiq72=nLeuw030T16-vDZT4A_gNyPm7WuXoK_3nFo0h0-eKJQ@mail.gmail.com>
 <aFqTX2oDzacpDpif@pollux>
In-Reply-To: <aFqTX2oDzacpDpif@pollux>
X-ClientProxiedBy: TYWP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 83e8c436-b840-430c-dc8f-08ddb318ab30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUlraFNXVW95dDBsVHJzSGlXOXRzdnlHM3JjNFZydDBpS3JsaSsxeGVPV04x?=
 =?utf-8?B?Z1RJQXZBeXI1VTJpTjB4YzBWd0VLa1ptTUl4eFRDUkRqQWhxSFltL1ZWT0U3?=
 =?utf-8?B?TDE1d28xUHdKQ3VTV0lTejBjUU5WQnNtVzVETGxMRm50SVhYaFROYU9LOE1W?=
 =?utf-8?B?TnRCMDg1TkZobkhrbnhpdnFvWENrWHdpUFozZ0dOdFFMVERJSE5odE9LMkdy?=
 =?utf-8?B?RzB0dVFyQkpxNlhtbWZyVnFoMi9GaTdkdjRUNnZaR1V3d2phR2JPUVJzYk55?=
 =?utf-8?B?b2hISlJXQmRhKzZzb1lMblU4Y3A3ZytGbHFZbjZ5cjk2eXYxZmpmNTF2cGFN?=
 =?utf-8?B?eUdjNW1SZHdUa1kwN2dUM0Vhb2xHOEpidEU4L0llQTF4YlBUSXhsYTJxNmxV?=
 =?utf-8?B?TTFwTjBTeUExS1NKMTAyZVBCNStQNDAxY05ib25ibXg3K1ZnVUdDYzhBM2Rx?=
 =?utf-8?B?RjVSbktnT25jMGlzLzJEV1BSamNlNnF3aHE2WjdIVWNyMmdSZ1I4Snd1bFBW?=
 =?utf-8?B?RGVVV0EzTUdHaFZ5WXlEdkllaHlZSHcrYUp2TzVuMmRvWTVxUmRvdFE0SDcx?=
 =?utf-8?B?RnBqWkUvWGY1TnVOWjlzeU9SaEJMNUxCUjg1QVlNU0RhQksrUGROSk5HTTNn?=
 =?utf-8?B?VUNVaXN0SmdneXRkM3dBcmQ2ODY4OVluck1QWGY5SUhaMk82S1hzdWVsaEQw?=
 =?utf-8?B?cm42YVNacTB1VWpheUlMMStNaFlnYWJjRTZ0MHVBTzY0ekxWRXIyN0pTbWVv?=
 =?utf-8?B?RFc4WVBlUEdCUDhoSFdSL0NrM3RRTVhxcGhwYTBKUTdJNEw1ZUFVLzlFZE92?=
 =?utf-8?B?cDdGbHVXWXJ1V2F2aDlEbE5NRUJudTNJRVVxQ3hyMm9UOFJETVdhWVBCaEtl?=
 =?utf-8?B?YjBZVlBUMnhtNVRYdTd5cEpUczBGZXp5d1d2ZUtsc05zUXFJVGp6ckM3dUpE?=
 =?utf-8?B?QnNyeXcyVzFudzg5enIvUzZNdWMwalVjemx4c2hHSFVYcnhhOTlQdSsxcStX?=
 =?utf-8?B?Z0FlSzdRWmFhaWVFdUdoUlZpWlpUV3Npa2FqZm0vcEo0QzRITmVmdU5yN09Q?=
 =?utf-8?B?L0VuK3REa1pxU0lkckJ2TGNMOUJnM3VHcGZjSlY0emtzaGMzdmRjNTlISHQ3?=
 =?utf-8?B?R29Qaml1T3NBa05oQnVDK0JGazhVa0Q4Zi9BQ1JFT3JtQklhWlhzR3VBTjFP?=
 =?utf-8?B?MUpCUnhiY3M0TFBha0lKbmJaVjRTTEZ2OHFHRHM3ZC93V1RPWW5uRTlqMnJN?=
 =?utf-8?B?YkMybHphdU41NkRPbnNxZ0Z2VlRYdHFSdEtnT2J1M1VNNnhWVkNabm5DeTQx?=
 =?utf-8?B?N2t2cUZjS3h4T3RKaXgxeVp3OGhqQnYwWVNtNlRtdlBwZFBjRG5LQi8rOW5F?=
 =?utf-8?B?TWVpcy9DbEZBY3BTOXJ4WkliVytyQXRiUGttUGk4ZUJIY1Arc0dmZ3VVdTV1?=
 =?utf-8?B?UmYrWmd3ckNacGhwS2xlUWVMQXo0ekxOM1dnaFNUWkxnNzBQL25BL0JrYWFj?=
 =?utf-8?B?c3Rtc3U1bU5WSTIrdWFpaWt1ZVZtYlhYSmh0M25ic3oxOXB1aWZBb0Z4MHVN?=
 =?utf-8?B?b0ZadWw3ZVRiWGUyaVVCWVhmQlFlVEtDVk5UWkNTdTdnak1UU3J2dEwwd0Nw?=
 =?utf-8?B?Wi9keFNvWTErVFJ1bVJhaUcweFhtM1YzRUl6K1h5T1pkVEd3b1I1THBzQ3hY?=
 =?utf-8?B?dXBHa0EyQTBBMkVOcmRiOFlXOEEwUldUa0dodVRsWCtKWmtiakxWRTA0bWpG?=
 =?utf-8?B?QWw0YmFGWVEzc0M0WitzUjl2ZTJCSE8wbkVlSWxPb3dkeE50TVJlcGsrWTJR?=
 =?utf-8?B?YUF0Rnhja2ZscXhLWnJ0YVpJZVc5WjkzSmhqWmErdkdoWmgyVW9KbE16VWNy?=
 =?utf-8?B?c3ZxMnhNdTBQdm9yY0E5QkNNNWdFaWZ2VGNXYUEzdEJtZWxkQ09wSDNHTjl2?=
 =?utf-8?Q?NEhh/W+XnyU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFpiNElJYjIvNmU0S3F1L2EyaGZXd1ZrRThaQUowYTV4R1VBK3RsRGR4N3BV?=
 =?utf-8?B?a3pjRVRGOUFzbThQZnAxemIzWHdHN0lJK0Z1Nm1RQ2l2L25kTmlINzJHS1Bu?=
 =?utf-8?B?ZGpiS2wvU0kxaGZQMjlhQ3Z2c0Z3TG9RNVlBNmJUMXFidHE1MzhaRUF6SmE4?=
 =?utf-8?B?elAzTCtKcFpkV0RkWk45a0NZKzBHNjFVM3Z0dzNHc2JOL01palNncXU4U3Jr?=
 =?utf-8?B?V1pKOU1Vdllvb21wUTEwUXRKZERsZk1GcWRBVmppVG8rRktPdWc0TVBmNTJO?=
 =?utf-8?B?aGl3TGIxNis3c2lTbGFMMndmMTRLeitkTmM2RzV4Y2pPeXFscUhwRVZoWUhZ?=
 =?utf-8?B?YVAzVXpUTmIwcjFjOFh6UzJ2cWV6eFgveWdoY3MzeDlCdTBmK1cxR3YvMUFP?=
 =?utf-8?B?bTQ2SGErNVpkdFkwWGZqN1NxVUR5SmFqL0VKc2V4VFhEVmQyc0g3cEczZ29E?=
 =?utf-8?B?VWdqTVlBeno3L2dOQUFwcDBQaVRrY0FGSU8wWSsxQWhzMDlwQlpzMEo5QVpB?=
 =?utf-8?B?cGFPYjBJMUs2Qzc2bkk3ZTlPaW55bFpUZjVsQ0dLUTRBUk9FblZaNmJjcEhT?=
 =?utf-8?B?c0hpcVJFM1dmejRZblBhOGZPOXp0dTY0OUprUXQ4VTFrdlo3VUpyYzROS3Zw?=
 =?utf-8?B?YnpKSGFGOERCYTF1MWE2N2hkNzhvRGZiRzFXU2wyeVFLNXREVk9NTEZSMGdt?=
 =?utf-8?B?THdJUjU3eERySGJYdDZXUlNqUVVoMzlUMFNYRmp5aHNzeHpiY1dwU0RxN0o2?=
 =?utf-8?B?NFpCS1Q3anRldVZXdndVTXdoWnB5MXJhZlh3WkZISGhqUzZSa2N3UHJHZnlK?=
 =?utf-8?B?Y01UZG5KTGdKdStoNjdtMnk4eUdXWStLSVlza09SMTh1NnY3S2ZzTjg3c1J1?=
 =?utf-8?B?K3BUSnlVNHl0VGoxMnJOOUJodmY5dmhaK2dra3ZNeFduRU4xYktHUHdXWmNL?=
 =?utf-8?B?QUl5SGUvb0JMeVE4dXhOQjNwQW5YRkRLYWJhTU1ZRmFhZWVDbkhYaHI0WjJ4?=
 =?utf-8?B?UGNXa2VDMEdjM3NSZWw4dDRsZnZERTMvSitVblhiMVlIVDlzTzA5NGtNVlFa?=
 =?utf-8?B?WVNBeXk1TU5LUW5WaGlabWl3MjF4SnpFenh4WVNXWjFadWhtYjFTd3lRVE5U?=
 =?utf-8?B?ZmNtNksxN2YyQWhiTnJLVVdxdk5aYmtDbXpEeWIzQkpoall3UVBxOGtYY1Ji?=
 =?utf-8?B?ZlluTjBRM2kxcFFET05PWkxRaEpBbEhqRTNwWHVvdEp4NkJEc2t0Si9acUhq?=
 =?utf-8?B?VmVLanVTUHoyMDNEbzF4bUwxUWd4aDF2WVY0MTN4NHJuOFFEWFZjb2kycUF2?=
 =?utf-8?B?NnJPcGVlc2kySHZUdGZxWWxHYVY1SnVCNEdQZzdqbHdOdlBnd2xxalZYNFdz?=
 =?utf-8?B?NHFSL2Z0cHVUb2gyR3pBWEFFdVdPZG4xdkJJNmFYM3J1WTN6L0d0WEVSNlQ1?=
 =?utf-8?B?MU1VNHo0N3ZxRm1RbzNrYWpnTmUvTXJNR3BlMkV4OXBhd1ZMK25tSUdrcE1H?=
 =?utf-8?B?SkZML09iRW9DUyt5RzN5ci9oMGQ5WUg5ODdOZW1LaTExVzV2SGxzd2Rzd1Uy?=
 =?utf-8?B?cmhCbmd1RUZsVTlweEFJVks1eFFEUEJIM0dtblpGb3pJWTFUZnZ0UkZSVnM2?=
 =?utf-8?B?RGRDWkZQQ3dqMDRtOTkxbnFPSFlQeDczUVJHc0RxMWRka2FabDYyWkw0bzR0?=
 =?utf-8?B?RHZCQXBCekd1dkJzbGN1T1JZQy9iQmZXK1RpNDNUY3NtQkF1RHR2VnVGdGFX?=
 =?utf-8?B?RSs3WXNIWHgrZkswK1QvNkU5ZjBqWVhWRjVMNnhTNmxJeDNXMEsvSXRheTNE?=
 =?utf-8?B?RTIzSnFpZnQyR0lWSFhVSmx4Y3RmVTcvb2dZNUdCVzNUazhpNGd3b2M5aWo1?=
 =?utf-8?B?MU5HdGgyU3Q5b2lta2xEeENGUXliVTdya3FPNWhlMHBSSTF6N0svL0xtb2dL?=
 =?utf-8?B?TzhuSEZlR1V4OU5tTEZCUElUdjBnczFxVG94S1JGbDd4ejNubTI5ekpJbnBQ?=
 =?utf-8?B?bitZT1Ara0xjVWxmalRBNG9xZFVMaFArbGFEcWgwc25MMHRZem5WZ2wyOXk2?=
 =?utf-8?B?eFhkdGNsRFZ2OTJ3QmN0YU5TN0hyM0kxYlpsK25MMW5rdTRJb2pxL1Ezdk91?=
 =?utf-8?B?US9JYkxOQ01ZUEc5Uy9wSXJkR3JCMENVOGw4WkRFTHRENyt6SmR5S2I0dzQv?=
 =?utf-8?Q?GgjLdjpIrLk9Gz4BWabqEl5n/o00NhFvhMs6xs86Hi3o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e8c436-b840-430c-dc8f-08ddb318ab30
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:14:29.0824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BcTBgPl/+3Zr96XtVIDcGzzzeJdDXmW28fXswBJu/xgLH1JiS8aNTDDWqrG0Up3ogxyHabFcWktGvCeLurT6aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6037

On Tue Jun 24, 2025 at 9:00 PM JST, Danilo Krummrich wrote:
> On Tue, Jun 24, 2025 at 12:31:52PM +0200, Miguel Ojeda wrote:
>> On Tue, Jun 24, 2025 at 9:31=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.=
org.au> wrote:
>> >
>> > error[E0277]: the trait bound `u32: From<DmaTrfCmdSize>` is not satisf=
ied
>>=20
>> > error[E0599]: no method named `as_nanos` found for struct `Delta` in t=
he current scope
>>=20
>> > Presumably caused by commit
>> >
>> >   b7c8d7a8d251 ("rust: enable `clippy::cast_lossless` lint")
>>=20
>> The first error, yes -- the `register!` macro was changed to use
>> `u32::from()` to avoid an `as` cast in that commit, and while the cast
>> is OK converting the new `enum`s like `FalconCoreRev`, `from()`
>> isn't`, so we would need to implement `From` explicitly -- Cc'ing
>> Danilo, Alexandre, Lyude.
>
> It's a bit annoying to implement From explicitly for all of them, but it =
seems
> to be the correct thing to do.

This might be something `FromPrimitive` will help with eventually, but
in the meantime I agree having explicit implementations is a bit
cumbersome.

What I don't understand is why these `as` are problematic - a type like
`FalconCoreRev` is `repr(u8)`, so the cast cannot be lossy. I think this
is the case for all such instances using the register!() macro.

>
> nova-next also contains a couple of cases where the introduction of
> `cast_lossless` causes warnings.
>
> I can implement the From traits and fix up the warnings caused by enablin=
g
> `cast_lossless` in my tree with subsequent patches, such that we do not h=
ave to
> carry all this as merge resolution.

Let me know if you want me to take care of that.

