Return-Path: <linux-next+bounces-5885-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F1A68B81
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 12:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B2618819C4
	for <lists+linux-next@lfdr.de>; Wed, 19 Mar 2025 11:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6FE25A35E;
	Wed, 19 Mar 2025 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k/9PGIj0"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BAB25A626;
	Wed, 19 Mar 2025 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742382828; cv=fail; b=mENNS8jCs+cqdCTqFvGFvJq02LdKIi8IM3DLgTbTGX03uLRd+Dx+ZbuCVz9mSruS3Yqyk+OxCh5PAo6x76veeqb21jzI/INjPdxzPe7WEEqym22B960M3B4ZyUKuPk/Uasl0AuciAEGf9s23s783wWVJuVaV88Ii1z38QwQR8W8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742382828; c=relaxed/simple;
	bh=CBChQDXpOEA/7svmgkIlaCaggEJy8wBM0VSBogRX0P0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lcGV73gu/y4UioZK1jTR1fLvdAkghii41WOBxyR1xhf+KJRNMijqbEqd8GkXbbi9Cu8P1lEgYpQU+rBRfRuu4ysjFg9GqD1/X9/tTynxVLzQ2FyEeqT+4aw9ln+y30a86h+y2j0CTDAhu+aHUzqV8bm4z/255qXnLEZnYZUx0Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k/9PGIj0; arc=fail smtp.client-ip=40.107.223.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwbvzccY4HTrD2HjZo+kmMtuPchjxOG4SbEfXGbNnBZWeFlPcoWezkq6gGtPNJ1HRZ/KOmnnRmwxAJXPnTd+nzw5D4e0rDP5QhyInII3MIR1oX4huAD5tawJoh6aeJRyUPbHN5TFT6XH9SGQPvCUmy0oSjbrhvnubU6om8h4Z6L59hAz2MTauh5PJMH4HD4yCqLXWKqwuh5pG8gcS2tK8JsaxEqxPgghYZQQ8AKz3GBNf82BLxfNArOTpkZsCZBcFUP+xGZxE26fkdGUksJSlwe0bD49a4QYpPHX2nZlTE1xaDI0fybH63TbPaKo8DJttzp9YsxTJuStbgkJgErmFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBChQDXpOEA/7svmgkIlaCaggEJy8wBM0VSBogRX0P0=;
 b=OKvg2c0vWVx+a+tWFuWqwPrEDPUvh4xX/r3KeYCk2xSvJskqA9V6e8kknT8ucbO8Up9wqgwoMSqL3jkydZpqfiAXvLyV7vmuGUevktr+K65k0i06skCCRz6ki9dnCvLo/nvdv1pZtmXoFUCB99OBkOsg/p9b8m5YH9rMNiMFlEItlLXQcRLQo5BEr1XD6XdygzpZUO58tvOuPHs9HzEe/42DR900D5kgg7GSkusZUHR+hYKKudgG2482jhgLpxjmcxLeR7e+q55uX5Un7eWd3MjjxQFT0FGzeG2MuyLDUt3CIrg2nS+6rrBn8fprXXI7nX/3MjkfLnP50bEiHQWq3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBChQDXpOEA/7svmgkIlaCaggEJy8wBM0VSBogRX0P0=;
 b=k/9PGIj0Z9r+0wZ7DE4Me1WdtHXnO7gBw3ugEQP21OIcc7YSLapAx+W/G5KVkIR2G8XhIlEgRpdbvCM/VHku/rv3RDlI0wYCcM6lJfRlp8As/9VnMD39B2JUy1UI5ZYgCFBrPX1Lp6e3dOJ/51zTa7fyv4SCDqwC9RwWvwmOWEQ=
Received: from LV2PR12MB5798.namprd12.prod.outlook.com (2603:10b6:408:17a::6)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 11:13:44 +0000
Received: from LV2PR12MB5798.namprd12.prod.outlook.com
 ([fe80::6f3e:b003:209b:9c9f]) by LV2PR12MB5798.namprd12.prod.outlook.com
 ([fe80::6f3e:b003:209b:9c9f%3]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 11:13:43 +0000
From: "Kaszewski, Dominik" <Dominik.Kaszewski@amd.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: Alex Deucher <alexdeucher@gmail.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build warning after merge of the amdgpu tree
Thread-Topic: linux-next: build warning after merge of the amdgpu tree
Thread-Index: AQHbmLItYB1lWj/+TkuBSnfih77gVbN6M4jQgAAXWgCAAAOU8A==
Date: Wed, 19 Mar 2025 11:13:43 +0000
Message-ID:
 <LV2PR12MB5798E75FDC5C9AFFCB6758EAF0D92@LV2PR12MB5798.namprd12.prod.outlook.com>
References: <20250319203449.386f9e00@canb.auug.org.au>
	<LV2PR12MB579836A210FC20C79513D268F0D92@LV2PR12MB5798.namprd12.prod.outlook.com>
 <20250319220034.424ce383@canb.auug.org.au>
In-Reply-To: <20250319220034.424ce383@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=4eb45602-b328-4a02-9e93-f8d2775bdfb4;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-03-19T11:13:23Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB5798:EE_|CY8PR12MB8340:EE_
x-ms-office365-filtering-correlation-id: 1714f9ce-1678-4b56-e041-08dd66d71c7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ZxVUZr0ZDyuefQFUM3/ZLXEWuhdXTzflf+T5hde1qeCLxD8FcVwYzRvW4zX1?=
 =?us-ascii?Q?IgIIPXPmTGgcgx4tbC2oeG5CmQQQYYUB8AAeMU8E8IxcxejNNziMrinRvH70?=
 =?us-ascii?Q?BkquI5aNM5ypwVKadrL0h0mNNYRQg/i1+fCBJXYhSptqnTBmCp9ekDcdWfg6?=
 =?us-ascii?Q?ki/jfDJgDm2bFICUrW6wVuO+jv2wm95VqKeQjvSBYsiaKSJvkF/JgMxacLDS?=
 =?us-ascii?Q?xJkyP6Y+t0Mzk7tNsyRVAidSsnKVuRNYlaZV/m17jJRsmw5p2zThwPp+BpDL?=
 =?us-ascii?Q?eT6oBTZ+kw+2FlqDbFPymqtVVqgv012HOTuksc/Cm0RkVwUQPKOyNYsU6rRa?=
 =?us-ascii?Q?hQ0vjN1ic/o5xqan63hUUlvKmmUWxuoXPaRBuOPc0zBEWwsxY5/t80zrsCAR?=
 =?us-ascii?Q?keZKhQAuq2B8Km7nQt/YecEDhw5fCboGGgln6s6wutQfIGqYCHutm1hp9KMw?=
 =?us-ascii?Q?of0Lv4JzWUHpu2+sWsSBEQ9VZwKVW6LtA73N68pCT0V12rVCWEbFccbzhv1P?=
 =?us-ascii?Q?xhBCbFso5LhkWBOeC8elFoWOnTQTX7aI/eL2Qyfm0b5CZ/JAur/7jgct9ziG?=
 =?us-ascii?Q?nLbtYyUsiIqTImM9SjPYPkOM0iKO/UsjGH3m/VEy3Gqv4xx8J0K09Z9XXqqy?=
 =?us-ascii?Q?d+vj9tVMB5YLJzfhXeWQbQADyjYGasupmNtAVi0iBcYXFUtkvRwYoXK+b6rX?=
 =?us-ascii?Q?+m9zk35XPQqxUDxuBM30pX1Qo7yhP/qdTpEXC6PY1kX1EQFQsbXtwRnsaTBL?=
 =?us-ascii?Q?eDWpyqGuwDnb0VUOdOYdF7swB5suxsDxHvkW4KQQP8i1D/bkSJeETACBQcvK?=
 =?us-ascii?Q?paLRR96D60So2VuyzUQrW+Ffw49DsRHTtNnobASFd9V1BVO9x2NZZ5gdkezv?=
 =?us-ascii?Q?AySdaLWfOFzSPSgVY1kPinZ93BRsUsfqeVjxTeWo+GTRi2pCnrsrCwx4ddGb?=
 =?us-ascii?Q?CyR4wdhsaOVNzcGPIl7UxKItdlki8HjtW41yRptmYbNa455nd35/D+xpujrn?=
 =?us-ascii?Q?8fxA2rdPJZrL5kYayvWLB/UX6Ra3OwEPTKzcasHohR9wXrU5pZB6+eF7C79P?=
 =?us-ascii?Q?+jB+Fqna0kSP3CNJXmUgn30q1AkjTxe8Zhk3lEGOntx39wc5xUA/hEGOaa4p?=
 =?us-ascii?Q?qb2GuCprjTueXUWqOTX1vxEqxIjVpH/h5sV1zOpLnk8hIhyvHbcKZuGnF60G?=
 =?us-ascii?Q?/6Qc8BFMtnIkUtXz15tMEv8P2ODaQ+ar51nJOTzq4yx7iVbU1amao/AtPOiG?=
 =?us-ascii?Q?aN1Eu1MOUtJs3Teoh/CmLqoQ+azHnh9fHMxun0Q7TCcCsfHd/9J4VvskW1xA?=
 =?us-ascii?Q?GGP8T9/QERfI19zOBKj54HYmgplk0X0VBuDKgIohbxNZuqnl6/nGmdVSvD63?=
 =?us-ascii?Q?CHi/SEW9DCfPnqgC81LASHhpWLV554HnhTqolUr4yaszSOAuAxngwNpj3rEX?=
 =?us-ascii?Q?u+uWFM+VLOWwuxsc5co9xUOOOPvGevum?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7IIMcs5A3NucofuHpuapZ6lxFlG35VYfz2n6UrHGVtHfThkjjcx0F5M6HO/u?=
 =?us-ascii?Q?cMu8RvbqygNDpotOHs62gotnPiJL4iFAtWEse0m5UxdrcXwBmxYsC1Zo7X+2?=
 =?us-ascii?Q?KZ/gkOZjd7VyFciZFpKPKZGbQ2XXX6jBXt+eIjED/T8UdGaahEHx48eLRYRB?=
 =?us-ascii?Q?q/cvu35lvdGo86Wsqk6Vg2m01JoD11CZBW4KL9pohiy0lSJnwTEgeK5Ke3eS?=
 =?us-ascii?Q?T8vttQdOLJnMC5fUYQbfF3KCi3yE3NQu8QtVIMB4NYJ4ZY8cuBAdKoh0ihof?=
 =?us-ascii?Q?zo4utXl4PgtgHu04+FAEyfREFd6V9G0nb0eIOTtBQGJMCYBJf3U+Ehm+trYW?=
 =?us-ascii?Q?wZTu6BlqN2JUygjXeKUEKVCgAbRgBckP1YAAKVWzAdTa98lsctReZsXxkQNd?=
 =?us-ascii?Q?2T+2joepKvKmZ4p/iREHnU97MuAzLRIY2IhGiRJ32lGkw2jRUrAfcnJJtGeB?=
 =?us-ascii?Q?83nO31nilxN4lC1l6vQuxJAxsH2Wa7fNdNUX/g2C2GH9zUJuArUN6gNvqW9v?=
 =?us-ascii?Q?1uukq3uOPMto5O62e+FlGsGY1bcZYSV4DZHACn9OmpY4f19F9XCITMPKqMVt?=
 =?us-ascii?Q?6KiIHszMvOxDNCnllZVFMh7jaozObSC3TpkUjKzbVkvSlArKD22d/0wpofE4?=
 =?us-ascii?Q?aE2LOF+ccKy5p04KWKhnYbKc1ZwygqivOaLW2UE1q3zAzY1ZkG17RBxDei5O?=
 =?us-ascii?Q?kOGrD3el1UoTcDI8LCMB3WOuZNEvEmIzOvE6UXMwZ3cPwqycZTbWG84tlYNC?=
 =?us-ascii?Q?6CeCsoMSZ8w7a2jFPbpg5QWOKyuDWSMFhWKUMOIYCuyVr4gkpwzJHmARSBko?=
 =?us-ascii?Q?ol8J/w1hXuB61HXBz5hZ2+stoTiUEX6J+eR+nM/pSoutFqX1CRsvwKmnzLFx?=
 =?us-ascii?Q?xP2VPu+oHlWIxuovZSWQUT+Ic4znxQwS0HoTN2zHnqww8+LEdko0DAzavjpi?=
 =?us-ascii?Q?s11nHXE55DmpA3p+HPNLPT1VeZPoXs20QsddlL0J9JCQb67nfA+FrXcaC2yv?=
 =?us-ascii?Q?l63UtUVvHi4L6UAbdfJmG9PnxHQO6nyYXpjd7ZG7fe+kfOroFAOsJSfxdO2N?=
 =?us-ascii?Q?+3eaBGkh6b+BuhMlmW8PVJss8pHWl79zsqKx0RQ5IwljqutaAznzp4/TnTbo?=
 =?us-ascii?Q?2tWzssqqxzHtjaCNoinZr9YWH/hH88dMOChJ778lPxrv4hXlW7+q1tu19u5k?=
 =?us-ascii?Q?Sj/nOmDLBwhhpVbc2bRC/d7GjLzQDBpCvVmWoBSzriQf0bu6/uJd2bt/HbOY?=
 =?us-ascii?Q?qzswGZRhm7OtBBe6s2rBkxDPV8O+kMhFCffEEWCdMOgNaCHg8dBzatFlcfpZ?=
 =?us-ascii?Q?/OqT7nre0E52LjztI/DQbFRbNVgr4ZGBdUnzIWAE7P46Lm9a+8zd/yJJVATZ?=
 =?us-ascii?Q?0jbO0COkVPIaDk4kynSbQ+pxDJtjWGI6xhnpgyVhgf19KhdapBvRKevafKuy?=
 =?us-ascii?Q?+TRtXh4F/5IF2xAUlvGUPUHbmtAT8yhLemNP4myJ3ijQkvggslbv6zZYmcQR?=
 =?us-ascii?Q?FvTpiOtmMZkDLCDZj2MkOW15ghGkHZ6DPShggIqwPoOvHNr8rtMwj2HMmDiM?=
 =?us-ascii?Q?J7JPlQY1GK0YzYhx3Jo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1714f9ce-1678-4b56-e041-08dd66d71c7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 11:13:43.8155
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P4ooVOneMlTwFmJIFlR7JttRnpKUKBtX1CRZXwlI2815N7+A+z5tT8kYLdKGuf71B6XO2N3ezTS+QGGx+vJNvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

I have sent out a patch adding the missing colon.

Best regards,
Dominik Kaszewski
Senior Software Engineer
SW - Display NPI

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au>
Sent: Wednesday, March 19, 2025 12:01 PM
To: Kaszewski, Dominik <Dominik.Kaszewski@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>; Deucher, Alexander <Alexander.Deu=
cher@amd.com>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Li=
nux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree

Hi Dominik,

On Wed, 19 Mar 2025 09:38:50 +0000 "Kaszewski, Dominik" <Dominik.Kaszewski@=
amd.com> wrote:
>
> Could it perhaps be about the missing colon before "If set"?

That would be my guess.

--
Cheers,
Stephen Rothwell

