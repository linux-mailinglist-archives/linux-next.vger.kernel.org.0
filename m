Return-Path: <linux-next+bounces-9046-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 045E4C63C93
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 12:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40A303AE22D
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 11:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3593594F;
	Mon, 17 Nov 2025 11:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jt94rISB"
X-Original-To: linux-next@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E922E11CBA;
	Mon, 17 Nov 2025 11:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763378392; cv=fail; b=n/6eL+QmBlbPH9lAfualXATSzyhV3AGWrNeNhOy63Mxs3LUCtdtu/BmGu38wpEv8c6QBWfEUgHZyVd2hAnHej06OPsn41lOLaXSz6OrdJzikmLSRZM0Z6GUXFGDTbP4eqNWuxPu2lboobxdEiltdsUR9xcAhJUzv9IIr1WZvNKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763378392; c=relaxed/simple;
	bh=gjSlIsy2NgUWu/0EKE2gEs2KsAXMJUHhovVpdm0D2FY=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=DKA6voT82t9GvfbxecFW7+Rf+VJzzd/b8badXGU+9TETkT1h8UNbh80gjqTmU5k+286pfZ8Finh0z6F5y/t8Fqa72F7qP/uSTF7JuX+iP+JMYIzt5G9PcKpDbb/7RMyJCeo3T0+22sKQWj1xWCB7/MxrQiusgjpPs/UgagqYp9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jt94rISB; arc=fail smtp.client-ip=52.101.62.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MT9P00xscyX6apKauZdO2Qlyf6dRyDeicRfhBCgsCcoYfE/db2P4xaUVu+d9mOz+V/alMdO4bf7qrGWaz+Y1UndxddBl68FTuHJJozpZ4xPMg+y/5glJhBIp9quBe9/pkWeCzqZA4V9vnW6wXoW6Ss4/AtwxgRZtdd6obns/HAEzeSzS9OF92DhAsbLGzUFJ84GcgXXwKg/u3WFvo+5HgVjEz1o1MxTWjO51d0g9eqMq+2OG3JoPO5ptskxyr68x8WffhjxCNhy1vAuWK7F5khbIDUHi12nxa6tpXSaApzaNPyd82gaQF157IQGXx0LDTvexjZqDrJOA9jRQqUdKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufKmI2mQuaGsgesWzhaYx8rWkLINNIq9iZYh7O+YJeI=;
 b=Hj+EvQkdMMEmZzxff+Q4Hj8aBrLyIZWuWn3d2u46dlGlicjJKXt73LUrOvWMQTF/RGkE27tJ25hN5AmFcNl2o+bL4wbnz1K0NDJazvOcgtsa+3qcMRkgQqKtHeb3mmT3MK50//qexyh3HozOoFGeMCjEdt9FbuVFVJ1Rc38wsRXjytpDNXmVnyznrOdJn4cMKzSjYUcZN6Id3d52FTavVgbN4CcdDd/9eSOxyPLZ6DIHXe6YHnWoadWYQclL3x8GLqVOigfUnGuu8AAYL4MW3pxwNHY7tjlJAG23rCumQ0HduGSA3lMlyACTcQl4kISVE+DXeaQ6Sd1Lhug18FJIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufKmI2mQuaGsgesWzhaYx8rWkLINNIq9iZYh7O+YJeI=;
 b=jt94rISBlSopTKOVUnpYnOodFFyVAvoUAMvzKjD/mhqzVvAGZLE54Bc84vJ5L4yORzeWbPNPp0vW95yIkDZjC4CurHY2lEkW8ZQRxPCOH0uxuo9WaKMXc3kfxmnh7CK68nzt390MfLz3S1ev6AjSdLnYZPJAYh4F8OFjHepBjk/Dn8qhJpImkMUCcXvJHK/5Zz/OkJvD9IK70lxYN8AHVBxo2EyGUOHOsEZEzAGspPDRkYPXvjzQftrOVM2AjCW13kuLxHjMvs5HEO231cXn06M7dSElDh18ZUtg0VjmifNffIBO9HUVpnZgy0vR0/kUNV+BPavHaYpo7/xiY9laAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7344.namprd12.prod.outlook.com (2603:10b6:806:2b7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 11:19:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 11:19:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Nov 2025 20:19:38 +0900
Message-Id: <DEAXGRP1LIJR.1NMQCHL8P24MB@nvidia.com>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Tamir Duberstein" <tamird@gmail.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Tamir
 Duberstein" <tamird@gmail.com>, "Linux Kernel Mailing List"
 <linux-kernel@vger.kernel.org>, "Linux Next Mailing List"
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251117190417.44f20ddd@canb.auug.org.au>
In-Reply-To: <20251117190417.44f20ddd@canb.auug.org.au>
X-ClientProxiedBy: TYCP286CA0162.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7344:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c6c8c2-ee19-4626-a53d-08de25cb3484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2x4T1FzK2lMKzVxWjZFTWtCalpGOWJVVnQwT2VSRjVXR2l0OFdYbS9VK2N3?=
 =?utf-8?B?by92RE5PTWpxQ25VMVREa1RyQ1FqL0IwaG04c0Nyc0hRTFhLeVJPWGl2b1J6?=
 =?utf-8?B?Mk9zWlErZ081WmMzZHVZb2w3UEYzTE1SclNtbUlCbkJXeGJIQkp1RGowRDE2?=
 =?utf-8?B?MXVEVkJlbFNYTjRCRWM5NjVxU2RCZy9JUGVUa09TWXMzNis1anZXZFhkdzRP?=
 =?utf-8?B?aHNMNVRVVGtRWmVGejhtMzFRYVUweXpOVnhSS2FaUVBuNmgxdzdta0ZTQlZj?=
 =?utf-8?B?ZkxiTm16VFVEOEVIRGF3aHNXcFk3em1sNWovbTRhL1JaNzQycER4c2daYVpQ?=
 =?utf-8?B?SWsyYWpmRVFFa3huRThXOTZ0UzlMS1dmREt5d2tyNnVWZlo4cUxUdHFNYUdt?=
 =?utf-8?B?bWo4M2p6ZVpHbDEzWllRaWo5SVo5NFpLbUFUSWxiZEVheG9XMVJadVBKUUNW?=
 =?utf-8?B?bDdoSVg3d1dnLzdlQWRmOWlybSsweW1yY1lxRjl4TEFTSG5ndFZpaUs2UFp2?=
 =?utf-8?B?MDBSTEpta2NaalFPbUZOZllqYXdVMGh0b2prdktPbFJmWFkwOVd6VFFIaFNL?=
 =?utf-8?B?UGJ5YnM0ZHZYaGE4MnZTN1dXWnR5RTBXeHRoazhmS2gyNDlnTlQ3RVZQbTJ5?=
 =?utf-8?B?T2pEZTJudUt3YVhHd05wdllqUDRka1YzWG1JUldHSGU3NVE4ZnhJcHU1VVE4?=
 =?utf-8?B?ZnlvaSt0RDdWdm8yRGFza3RnR2thTVU5WlFsYmJ4Y2lnSVZ2ZUJYZlZSNzJV?=
 =?utf-8?B?QmlOR2VMYTZ3UFhBWDlVNStseEg5QTBSbU9HbnhFK3V1L3BZY25KTzl5a0Ro?=
 =?utf-8?B?Wi94QVNWZGtXSU0ycEVGTWZDR2xrVkM3d1ZENnptd0VRNGpmQ1hCeXp3RHM5?=
 =?utf-8?B?ZFNSKzRDakw3NDg3ekowK0tpQXluaDVRT25lVE5zOWNudTJ3eHo2QVVYa2lS?=
 =?utf-8?B?UkxrYlhBbU1TTkNLLy9zaU9tVzdUb2hQMy9mTExLM203RnFFYnQ5cEVveUhV?=
 =?utf-8?B?R2I4MkYxamNmcmNDa3p5RDRMSnZpam9BeVNKVEdxUlBKL1BFVks4QVlhV1Fy?=
 =?utf-8?B?SnZaeWhOWWFFa3Fkb2RmS0hDeHExRDQ2TGFVcXJNbHE2bFY0NTRjNGVWVVVv?=
 =?utf-8?B?VEthWmlleGZRZk5NTlR4MkxhdWsrM2lSNkNvTjBkbGdrUmJoMEtZbWJQNk9i?=
 =?utf-8?B?cExMdnF5UHVGajhlQ1lTVEJqcU0xd2g5bFRhenBmeUhWSGZGWXBKdlA0eVhk?=
 =?utf-8?B?ZHl1OStjMW12bWxDVjNPa0RsV0ZKQmFJc3JlNGk0bU5ndnJCRHNiKzRacU5R?=
 =?utf-8?B?aEpOY2xCMW0zNGk4YXl2Nk5OZDZmNDZLRVhHbWJoaWx0REFzN3puVnZYNUJu?=
 =?utf-8?B?U0s4cGRPU1dNZ1RkOThCdVRzRHJGL3R6SFJQK1lZcWlsdUI3UTBaU3AvVXVY?=
 =?utf-8?B?Z0tsbVUrQzFoWm5CREQ2UVo0SmVTWEpHQ21LWjlkRENKdU9pcWxYTG42TTZw?=
 =?utf-8?B?NUZ6bUlLNFF0U1ROR2RZaTVnZnd4Y0RqYmlsMDBMVU4zUk9DTTYvbGtNSGNZ?=
 =?utf-8?B?ckNsVStyUzJxbCsrK1FMc1dSU09oS0NFQzBqN0dwVHhGU2hNZ01JS25mOGJx?=
 =?utf-8?B?Q1VqMlN3dVNTVEZldlJzMW9RVEZybmZoVHpmbVhlQnhwMXFhdkNDNHRlZjR3?=
 =?utf-8?B?elVIWS92NVdTRzFLd3EvWG4vWHdnYjZBWjU0SGlMbzAxaW1xWElGczhFaWFm?=
 =?utf-8?B?RlhxMmxPY2FzSFJybldoV3c3TG81QitoSTU1ZVpTT3hCMFAxczlnd2RzQ2Ev?=
 =?utf-8?B?QjRGL3doc1dyelgxTy81TjdtcEwxZUpOVFZQK0YxMm5uTkhIVFVYOEpVNVZh?=
 =?utf-8?B?Ry84bEIxU2ZUMUY3RW5oYUNYVTI3Q25hYk4wbzBaS0J5OHNtSHNmMHAxeFdy?=
 =?utf-8?Q?SeuZfO22iN3XzY8DEYph9GjPSm7BJlbJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTBqeWtGNkhndFdQbmxJQVBjdWJEc092aFFRRmZzVzlWSm9ZNlc2UDJKV2xZ?=
 =?utf-8?B?Y2pyK1pLRXRrTkdXelAwdWpaY2VkNHlMT2xNZWVLNmVmeldNSjNXUDVjRXla?=
 =?utf-8?B?VE8rZksxN0MwMC95WFJaWWhBWnBWWUhCLytUUHpSb0M5d0ZLMkxFWGdnQXBE?=
 =?utf-8?B?eFlYQ1FPbmU0OWt4Z2Jienp5d2wxakxnT3Q3Z0JSWTNEdjIzaGIvRmRjMzBL?=
 =?utf-8?B?bnIxaW40YXUwNFQyVDFQNUxCRjNuN09QSHROdEgzSlBoaEtRNFI5S3RaRlkw?=
 =?utf-8?B?cCtsdXdMV3k0Y1BxY3FkYkh3T3lFQ2xZRlgxdVdJVzdkQ0JjMEFnR3I0R2JW?=
 =?utf-8?B?dGZVYmNwK213RjNwZ1R3elJtWXJjUlZWdUp5NlEydTJma096UkNudE85QkxX?=
 =?utf-8?B?ZUg3SWhhWTlmaTV4SEVIWEJvemRKRythMHl6R1NxV2EvSXo3NnYyc3ZTZVhy?=
 =?utf-8?B?K0hIUENnOGRwa24rZzFodnpzNnc2WnVJMHNWY3BPaHYxZlBJd0M0Y1ZkZE1I?=
 =?utf-8?B?eGJKNTJtNVpaMWxKd21rY05KL0hYUEg0OGFtc2lVckVTUGJ3VlU5SU5vOGY4?=
 =?utf-8?B?dVdDNWJ2MGpUVzd3Tm5jME1yWWtNeDlGMjgwa3VNdDloMHJFSFdaazZiTXZh?=
 =?utf-8?B?WGVWMnNKNWF5dUFLcUx5WTVqaTNVdHQ1VHFPN1U0Z1dPNmkvVUthRFJFVGdX?=
 =?utf-8?B?V1Zac3ZWZTE0UUx6UFlGYUpXQ2Izb2trbG14MllTVjRTVENOSFlOb2NrY2RX?=
 =?utf-8?B?cHdWU1c0QkFJaTBRaGViek82dzBCWXU0MUZac3BaNzUyMUNNd2k3czJiaS9Y?=
 =?utf-8?B?VytZamVhaSszdGZXb0lvRW9seW44ZFRKTlkwcWc1T1MycVF3UUJUVWhtRDZw?=
 =?utf-8?B?L2Y2Qy9iL0sxbDFJeE5tbEkwNzJaT0k2RzZMQjRobWE3UWZYQUNrOUs2cEI1?=
 =?utf-8?B?d3I1bkRlSGJjUG56dUUyTkxnSUtFa0tmLzhPakdhdnlVTjNrdnFIR2lEVFNR?=
 =?utf-8?B?TU9WVlo5QkdMb21XTlVpZnFEbytWdmtTclN2STFSN0VKVmpYSXBhaUUyQkp5?=
 =?utf-8?B?NGxxT1VldURWVHJabmlPNllqLytHVGFMQTRMb3dDVkp5U2xXczhSN1BxV2p6?=
 =?utf-8?B?bDNMQ2pFeVdWcjMrakUzWTJRM0xUNnR6SDhvNEdrQXBwblVwdjhvTDNvTkVo?=
 =?utf-8?B?L2p1NWdpaXQ4akt6czhQRXdZaUNJcW12ZE4zZDRueCtOTnJZMDdIajhydGVY?=
 =?utf-8?B?eFk3V1ZESmI5YVdzbEQwWXZNd1JtaTJMTjVwSUxWcGFBWWFFOCs2cE9wMGlV?=
 =?utf-8?B?Nkk4cHkrY2NkUU5LYTBYN05pcDRvb2FlTXZodEFqQ1JxeVVocTdhODJ3VElt?=
 =?utf-8?B?WEorNG1vKys0VFN6VWQxNHN1dTJpR05XM3pWSWN4V1ZHdEJDcnVTVDh5TDBS?=
 =?utf-8?B?dWkzWGJRdnpzNWpJOEF0WlFackswK29acE5jY2cvZ0lNdzlRbk53NktVVklB?=
 =?utf-8?B?cCsvN1k4NzdVL3dkQjZqV2txOGh6cEl6Q3pHcFNzdW5yOVpRU3VkTGVBSVBl?=
 =?utf-8?B?alluNzg2QWwyOXRySzlwdnY2ZGlYem9HYitJdlduUk5zREp6cjc3VU5uTlZu?=
 =?utf-8?B?Y1ZYbEYxbG40ajMrenlZOFhRaGlPdW9kc3o1Nm1ma0orYW5PZmlYTElZVHZu?=
 =?utf-8?B?QkZORXJsTU1jdzZTbUhOUUJ0SlRldHFIYXBUUHFKc1JHY1RxZElPaU45T1Jp?=
 =?utf-8?B?MWpiNE5qV1pPZnNjWml6VmkzejFuSkw2enF2OVZkdUpxTUdWVDJVbEtzbk94?=
 =?utf-8?B?Z0ZRNnh0TE9MY2Jxc25jMmR0Tzd4TXFxOFNVQXJxUWt1NGJsVXR4SU9peW1H?=
 =?utf-8?B?Y2NFUmhtNnFBTmQ4MVUvYXMvRnZVSlZIMjNMd01jNkVpY2hkUFh5RGlLUmMv?=
 =?utf-8?B?ZWg1TGNtVXkwSUViZGZSdkV0d1JIMSs3eFNPTjFiU3h0RmI5ZDFiU2JOMmZJ?=
 =?utf-8?B?cVZ5eFhoelJiSkFtc0M5ckFqRE43N0lCMkZLbkY2VVZuWlVQWFFSRDNSSEZ4?=
 =?utf-8?B?Ui9wWDFINE1JTGdSb0hWN2RPWGgxb1k0ZDdKT0dwMnZvazYwQ0cwSTIwcW9Z?=
 =?utf-8?B?amFkRGVmVkpGUjlLdHFxQUJycC9ZcTB1RlU5MUI1WVRkUUJ3a1NUS0xQaEVj?=
 =?utf-8?Q?75wBCkgHaLX72iGclaFRAY4ATBOmdP4UF+pCexdxDPvW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c6c8c2-ee19-4626-a53d-08de25cb3484
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 11:19:42.6210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OV9mxrnSacZtyrZqwU2VOmFn4WkgVSSmOUjyWgpe4VMyye8zpDhnfjetWrgwNNqqN9ybcELNYSNpLFjLL7Xyzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7344

Hi Stephen,
On Mon Nov 17, 2025 at 5:04 PM JST, Stephen Rothwell wrote:
> Hi all,
>
> After merging the rust tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> error[E0277]: `Chipset` doesn't implement `core::fmt::Display`
>    --> drivers/gpu/nova-core/gpu.rs:233:13
>     |
> 233 |             self.chipset,
>     |             ^^^^^^^^^^^^ `Chipset` cannot be formatted with the def=
ault formatter
>     |
>     =3D help: the trait `core::fmt::Display` is not implemented for `Chip=
set`
>     =3D note: in format strings you may be able to use `{:?}` (or {:#?} f=
or pretty-print) instead
>     =3D note: this error originates in the macro `$crate::format_args` wh=
ich comes from the expansion of the macro `write` (in Nightly builds, run w=
ith -Z macro-backtrace for more info)
>
> error[E0277]: `Revision` doesn't implement `core::fmt::Display`
>    --> drivers/gpu/nova-core/gpu.rs:235:13
>     |
> 235 |             self.revision
>     |             ^^^^^^^^^^^^^ `Revision` cannot be formatted with the d=
efault formatter
>     |
>     =3D help: the trait `core::fmt::Display` is not implemented for `Revi=
sion`
>     =3D note: in format strings you may be able to use `{:?}` (or {:#?} f=
or pretty-print) instead
>     =3D note: this error originates in the macro `$crate::format_args` wh=
ich comes from the expansion of the macro `write` (in Nightly builds, run w=
ith -Z macro-backtrace for more info)
>
> error[E0277]: the trait bound `MsgFunction: kernel::fmt::Display` is not =
satisfied
>    --> drivers/gpu/nova-core/gsp/cmdq.rs:532:9
>     |
> 532 | /         dev_dbg!(
> 533 | |             &self.dev,
> 534 | |             "GSP RPC: send: seq# {}, function=3D{}, length=3D0x{:=
x}\n",
>     | |                                               -- required by a bo=
und introduced by this call
> 535 | |             self.seq,
> 536 | |             M::FUNCTION,
> 537 | |             dst.header.length(),
> 538 | |         );
>     | |_________^ the trait `kernel::fmt::Display` is not implemented for=
 `MsgFunction`
>     |
>     =3D help: the following other types implement trait `kernel::fmt::Dis=
play`:
>               &T
>               Arc<T>
>               Arguments<'_>
>               BStr
>               Box<T, A>
>               CStr
>               Chipset
>               Class
>             and 22 others
>     =3D note: required for `kernel::fmt::Adapter<&MsgFunction>` to implem=
ent `core::fmt::Display`
> note: required by a bound in `core::fmt::rt::Argument::<'_>::new_display`
>    --> /usr/lib/rustlib/src/rust/library/core/src/fmt/rt.rs:113:27
>     |
> 113 |     pub fn new_display<T: Display>(x: &T) -> Argument<'_> {
>     |                           ^^^^^^^ required by this bound in `Argume=
nt::<'_>::new_display`
>     =3D note: this error originates in the macro `::core::format_args` wh=
ich comes from the expansion of the macro `dev_dbg` (in Nightly builds, run=
 with -Z macro-backtrace for more info)
>
> error: aborting due to 3 previous errors

I could work around this with the following patch, but it looks terribly
wrong. In gpu.rs we need to implement core::fmt::Display (because of the
use of `write!`), but in fw.rs we need to implement
kernel::fmt::Display. It is not clear to me how the two interfaces are
supposed to interact.

Tamir, could you advise on the correct thing to do here?

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 19755af6ad04..de924ffc0823 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -115,7 +115,7 @@ pub(crate) fn arch(&self) -> Architecture {
 // Hence, replace with something like strum_macros derive(Display).
 //
 // For now, redirect to fmt::Debug for convenience.
-impl fmt::Display for Chipset {
+impl core::fmt::Display for Chipset {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "{self:?}")
     }
@@ -169,7 +169,7 @@ fn from(boot0: regs::NV_PMC_BOOT_42) -> Self {
     }
 }

-impl fmt::Display for Revision {
+impl core::fmt::Display for Revision {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "{:x}.{:x}", self.major, self.minor)
     }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw=
.rs
index 8deec5e0a1d4..53afdbfa9554 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -7,12 +7,12 @@
 use r570_144 as bindings;

 use core::{
-    fmt,
     ops::Range, //
 };

 use kernel::{
     dma::CoherentAllocation,
+    fmt,
     prelude::*,
     ptr::{
         Alignable,


