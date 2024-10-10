Return-Path: <linux-next+bounces-4207-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0829E997D53
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 08:35:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAD57282261
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 06:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEA21A0AEC;
	Thu, 10 Oct 2024 06:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="V4nLa+53";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="yR7VW+If"
X-Original-To: linux-next@vger.kernel.org
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6611A070D;
	Thu, 10 Oct 2024 06:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=216.71.153.144
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728542144; cv=fail; b=six4AhPTUqzanH//l+Q4HcONVf6qCYfhSlsh6/M7kZ823+2rmbEq7cDBWDGZbTRIqKm1kUvZxJMhs0RGiciuRtnG00ZccEYPz3pAQuXp+W93ey5/s6c8fMWDdXiuUuTh+rGOg11BpuKc15RvxXFb8IoV5rDIUctKwwH77qFURr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728542144; c=relaxed/simple;
	bh=YvNn7h0mM4HbFiOtcgPFf1UECOyRgqWYSiunMXqIAYc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X05YUG8a3rdhJi5UOZWgNwY/Or/4Klf4QAO865+in4pscYUYnlDVA55rvwZ4PV0XbDsVZgLhbBXpNHiH4mOGD0vZ/ErqwgNgZpKW02wD8eL0FnFdDNui2PaXEnNzm3s+Nj+w2/MmeDajmtjyCBBQ+xNbO5c25EjMp813FpBq+uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com; spf=pass smtp.mailfrom=wdc.com; dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b=V4nLa+53; dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b=yR7VW+If; arc=fail smtp.client-ip=216.71.153.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1728542142; x=1760078142;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YvNn7h0mM4HbFiOtcgPFf1UECOyRgqWYSiunMXqIAYc=;
  b=V4nLa+532JIdmmi+GZGp5Tkq9xoh+I13HZxkXHzE0YBdBta5CkUi4q76
   cdiDis/mhGkdtFaf74ROC3eGUW6smEytOt5BW9MuB+c8lZDvyd0ODNQDo
   Zad081d4NR7LotPhYADn3A9gvhQXwu/ZoTIOxZBnWFYUKerLHN/21rrRa
   n5nc/ZHG52vm4NLcq0bb0N989YxCtx3COotdhkJ9yKb6K41547a7hApwB
   XKOx/teoPkeE8nKZBajFCeSNzIQfrfptLj17VOAGuu0tH7xb6uPJuCJzU
   ggOIyiauAUvcFGi/RP9oVGF8qdrpW9vAZtBrUlPMeWMuU1o45fh8aY6ll
   A==;
X-CSE-ConnectionGUID: PPej9BuLTG6IvBTB33LWtg==
X-CSE-MsgGUID: MsgLFhJkSdKgaZp2UX7dCw==
X-IronPort-AV: E=Sophos;i="6.11,192,1725292800"; 
   d="scan'208";a="29745192"
Received: from mail-westcentralusazlp17012035.outbound.protection.outlook.com (HELO CY7PR03CU001.outbound.protection.outlook.com) ([40.93.6.35])
  by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2024 14:34:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKB2IvBSnXsmLYHNBv560731IPoY3HBd7+WUb5ndvw5xy0SgoKbzkSAgcDl0n80W+g79Y1Nw1k3Qrxjj4wp1nLVTs94HDjJ78tz9x3MYsGui+l7y/O1l/Jt1Okgva6Cs+H8KiIAdloBp2Ti3GlkII1IeWSv9+R4/ZckMVHq/U0Pwhg/VxNTDIXMwOwKrNjtYiL0znekBYZsCsOnfZ/nF4lbtPNqYYmkJlSop5hS/Rjd5XAidVx7wCjb0n8h6paAaXla2JTsTPXspdaPfIQ5meqI1uFqpQsMZXQYJ9i9uXg/fEMxySt59BvoKFOZCnE3YHrRq5gBwGqBzLPOuoO7V5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YvNn7h0mM4HbFiOtcgPFf1UECOyRgqWYSiunMXqIAYc=;
 b=saOFDvXGWFoJIw9CHNRI9UdSx7vaMcHkSM4NVbCDYrevqvCfZLkG53dLoWCwS37tuEClj4yfcIISOgL0b/Xth5hv36Urum1XNcd21zrz/dz3/cWdjIP39VA0O68/YDMW5YUtt+PoP0lQLNTPF9XyS2P7YiAgAnF2afjiIs+w4ADuBvnP1s1spSLsxiNSZpo7OXEyE/UcZL1Q7hB/Gr1iw176Ve6t/kYKNBEDdfn+ZTjreLSUXS4BAJU+yRDAiIpMG4K+i3BqszWyfEA9ukpC05biruu9AujnOGEmLCZ6dwlUn/ZGhKGzo0QHCv0t1LGTuf0XtdrC8paayoHxwk5r6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvNn7h0mM4HbFiOtcgPFf1UECOyRgqWYSiunMXqIAYc=;
 b=yR7VW+IfrmRNqeysXOlRpvtbcXPFfLC4g8bEGV9+EiUuORsmlRxElCO9oWBChC91qp8toc2p/gUo+SO1K6b6T2kGDC06fbx9HqBOZQoYnL9sOmZVD/9L9OiuyRtgeIBt2E/ZDVgUdW4slUkR+wEQfltjFgTeNeeQ4Q5rMZ2dj+U=
Received: from BL0PR04MB6564.namprd04.prod.outlook.com (2603:10b6:208:17d::11)
 by BL3PR04MB8106.namprd04.prod.outlook.com (2603:10b6:208:349::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Thu, 10 Oct
 2024 06:34:32 +0000
Received: from BL0PR04MB6564.namprd04.prod.outlook.com
 ([fe80::bd7b:c391:6f87:5a9f]) by BL0PR04MB6564.namprd04.prod.outlook.com
 ([fe80::bd7b:c391:6f87:5a9f%4]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 06:34:31 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Rothwell
	<sfr@canb.auug.org.au>
CC: Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the mmc tree
Thread-Topic: linux-next: build failure after merge of the mmc tree
Thread-Index: AQHbGTKpSY5y/FJWh0Ca9cn0oMDjg7J8+mgAgAKPn+A=
Date: Thu, 10 Oct 2024 06:34:31 +0000
Message-ID:
 <BL0PR04MB6564A046F3F88BE407B1959DFC782@BL0PR04MB6564.namprd04.prod.outlook.com>
References: <20241008143159.35e26d8e@canb.auug.org.au>
 <CAPDyKFqvG+Vcz8eVY6q9tkOnxMpudtQUuc2BBao74inDyOg=xQ@mail.gmail.com>
In-Reply-To:
 <CAPDyKFqvG+Vcz8eVY6q9tkOnxMpudtQUuc2BBao74inDyOg=xQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR04MB6564:EE_|BL3PR04MB8106:EE_
x-ms-office365-filtering-correlation-id: 102a1641-4ba9-438c-a4de-08dce8f59965
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VTlQUVpid3JDYk9ENjFvSm90dm9FUlBKTTZpNnJXdjlOUTVsZytFcjVLNlJQ?=
 =?utf-8?B?YnpmS3h0dG5XOG4zTys0TDYwY3ZLOW95U2QzWTFBd1NzSkljUit0ZUFRWWdm?=
 =?utf-8?B?NWJ0WmtORVl3RW55NlY1bElORDAzV1RwNW9pUm1KT1QwT0FkWmxkTFYxQ2F0?=
 =?utf-8?B?Sk0xSTFwNDN5Z0cyM2QyL0laUE8rZktOZDYxbVZ6QVIrL2s1YzgvYXpTS3Bu?=
 =?utf-8?B?T2RmOUVvUndQczNsbjNxQ2laeUlyVUhlL3c2d3F6dUdxOTU1NEdxd2NrNDdZ?=
 =?utf-8?B?YmpOK1dVay9pYUlZMy80azVveHhsQTdkeTM5cVZiVHlJbUdDRFI1YUFPZ0Ez?=
 =?utf-8?B?SC81UVNNeXZCQmNhVlhkT3Bwdmc0OXVQVlFtZnZHZHo0eXdEWVV3K3pqWUNN?=
 =?utf-8?B?SWJMQUw1VEpORTJpV2N0ZWFTc05hSFA3c2JqREhPVmE5N3VDMGpySExIb0ZS?=
 =?utf-8?B?SEFhQVhSSnRCcm1qYnlUOHZKK0ZTK2xlcWo1UFFuRXlFMXVjY3F5bmlEbGho?=
 =?utf-8?B?Y1FUdTdLR3pEcDdJRUxnSTRPeUJEVmpBRi9KMGppNkV3RWZhUWJpTjVZcHFo?=
 =?utf-8?B?eWlrOTNYWXZMN0g2US9HazRFWUFCN1lFMnBKdDZJOUVNOEJKWXMyNGVxcVhl?=
 =?utf-8?B?cElmTXpZR1dhNVJRWkd0V2FVWVRqYWV4aGx1OVlBTG1EWm1INVlyc0c4Vi9E?=
 =?utf-8?B?VXVGSkdnYlhOSW1SNzNXOVJLcEFSNUliSlYvdkh0REowNUV6dHozNkEyUnFS?=
 =?utf-8?B?SDZkUXJ0YlFTYWxRQ3JYZi9IM1M5dmRMOElLTC9PS2gvTElJemk2UjdaUGly?=
 =?utf-8?B?bldZWXBQeHY3dnJ0S2NSRXhNVU1LZ0Z6NTUrN2V6aFRMRUdkSU50eVNOMjVn?=
 =?utf-8?B?ZXBKb0tzSm84b2xZZGx1VTV4MUQrdEhVbTI2VDA2ZW1BMjlQc29xT3pQSzVX?=
 =?utf-8?B?YmVEOThuWElPZnV0a0V2b1MrU2MrMVAvTlBuTXphOVBQeEhxL2lxbzVNWUVp?=
 =?utf-8?B?THkyeVg1Q20vem9wREpsbW5sM1ByTnQwWFVyUFlUTmdMTDQrQ0R5OEFHc3I4?=
 =?utf-8?B?WXk2a3dFYUxzWmdYZkxFa3ZoTHBzUjFoUE5KQzlJa2x0UDg4SVA0QnRXNDdp?=
 =?utf-8?B?M0N6RXRENkp3RXNibUlKRWpJczJNaEVESUVqWlZyckExV1ZIM2pERXUwZEdU?=
 =?utf-8?B?Nk1GMlZkU2lwZ0NWYjhxSHZ0ckowZWFHVkFKR0hJQ3hjK2lTOXcvYjJad01z?=
 =?utf-8?B?bEZEMnluYTI4U0pXOGdaY3FBejFmbm93QUJaeXY5MDZwZm9vQk82TnpzcmtJ?=
 =?utf-8?B?VGNkemszTlJ5U2lCdTVTRlBZWUV6b2Y5K1JldVVVV0VLbEN4V2JWbWJWeThC?=
 =?utf-8?B?MThPZWxWMjF4eDNyTHlnckJ3aUVpVUdNc0srWmxNa2FONG1EanQwM2dtZ3c0?=
 =?utf-8?B?RkpKQnlXZUpzZ25FUnNzWnhTUDhYdDhORCs1SDAxZWhkQjQyd3RGSUR3N1VH?=
 =?utf-8?B?NU12NkgwTjdQR3RDZHpLckkvaGR4dExick9nQ3g4N25nZGR5UEVaeVkxQVY2?=
 =?utf-8?B?V1NrU21jdGxEaWZxK21Eb0tWUDFTa2E1MlA2a0xYQTczZEloRkI5SU1WNzI3?=
 =?utf-8?B?ZnFrMDY2MHpHMFR2SE04K2lRemp5MkJ5akhNRzVSTjFHQzhNMEppZmFlRnVn?=
 =?utf-8?B?Y3RoREJtSEs0TEJsTlhySXBrRFVxQkxiQkRIb3lWankxRkczMWx3MUVYOGNz?=
 =?utf-8?B?dTlRZld6dkYyUjVGaFYyaGl2TTFXOVRnYlIzVjZXcWkrTVRLdEFtL2UwcHYy?=
 =?utf-8?B?bWZkSjh5eFYydnl4YjFFUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6564.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MmdiVlBJT2VKN1NrNlN1MkNMSnRXNXJUWUZNcjhrSnJveEswWC9QelRud0Nh?=
 =?utf-8?B?Z3I3Wkg5aEVhWkhzL0g5R2ZkN2FWdExQV2FBazhSZEEybGp1djRhZWVPMith?=
 =?utf-8?B?VG9TWGlQVC9sdGR1SzR6WGFpNDE0YmRUSTZTMzhKNVl1UnR0aDB6RFpDcG1j?=
 =?utf-8?B?cDdDRHc0UmFDVGpqRGJ3SXdhWTBOTnNKTmNrU0Q1UzBvRnNuWXRDeTBhY1l4?=
 =?utf-8?B?QVhaY0hWRnU5S3lLYjBUUmlEYWRJa3RQaGhhK0lhZjhMR0x1RVM4RHpGTnlO?=
 =?utf-8?B?ZEN5cFpWbVRBM3cxaElPMWt1RWJ6MkZXREhZazFrWVZaaFMvMHp5NkZycWJy?=
 =?utf-8?B?V2QvRC9USVYvazdMQkhZS1IzbUtMSmJZNThvWEdNVTBOTWc1RHhWQ1pTdmdB?=
 =?utf-8?B?M2E4TVVDM2FUb2NISm9hQ2wzU3Nka21WMWMwZEJDUnA4TmxrOU1mN2JWL2E0?=
 =?utf-8?B?NHZNZWhaeTJidVZ1d0dza3RnMUpLRzB4bnBmaFRMSGkvUHI0MTNLdXJBUEMx?=
 =?utf-8?B?Z3AzMkxzbnNsZjZ4N0htU3RyU1NEYzhtTmlvaUluRW9tUk1HbmZjSHNqTU9x?=
 =?utf-8?B?K2U5MTg5OWVjTVN2R2Y5WTd5UW9mZmRzejRXQkJOZndHclFoeEhKK0sybjhR?=
 =?utf-8?B?WTQ1YmxveUVLOUVubEFlU1M4b0NNeSs3ZDBHRGxMSmVGcWJTU0kvcld0Wkh2?=
 =?utf-8?B?c1pLRk0zbnR3bEhWUkt5MU5lMi90ZFRpNVFWYnJBU3ZkVjhRVm9xZmxXSlgw?=
 =?utf-8?B?R3Rka1VUL3AwbytIaE4xZS9BRVg4WGF4NEE4K3ZCQnowVm9pSTBkakFWTHQ1?=
 =?utf-8?B?Q3JNRW9Ra3p1NGNXSGR3MU9UMDNoVC9hdDlwSVE2MGVnMlE3ZjBGMHNIeCt0?=
 =?utf-8?B?M1BWcnI5TlVUWUxIQUpXS05EMHFkQ1lTVndNZDVoQlpKMXBMeXFXOENxeElX?=
 =?utf-8?B?ODV5NzFBWGZXME5lWlM5VFRpaXloekhnK01TZnVTSXlHaG5FdGlhR2ZwVysy?=
 =?utf-8?B?QW1yU0FneFJCSFhFVFN6YUkzZG0zd3MvQ1k4VVNhYlBkRGhaVXJ4d3FOSjlC?=
 =?utf-8?B?eVQzZ2ZVckE0MVZZaU1aVFhGUlhsU1c4N0QyUnN0OWphZGNzd0NNZWE4Sy9D?=
 =?utf-8?B?alM0SGNuQys2S1hYTExOODFhVlgxZzFVK1BqRTdkcmRJY2lEazRhNlc3UTh2?=
 =?utf-8?B?N2N4aFdvYkFKdzQrclJYU2FLTG9aeG9QaU1Ob3gydlhicHJ1VzQ5VUNrbkRB?=
 =?utf-8?B?UlprblZHTm43UWZraEs0clIwVjA1d2hGU25sV1dMcUxIT3kwMTRLYmZXaWdJ?=
 =?utf-8?B?Q1JLK1J0VjlTMW1XSHdQejZaTUFISTdCSU9FcUJXQy9JT1VZTkRoOXA0a2pr?=
 =?utf-8?B?S3AwbzhRSlNNYVJqZnM2Uk4wbitJL2FJUUNoVFpaeSt5NkhPajhud2E0KzBM?=
 =?utf-8?B?dm9FWjBvUnBPeVlQazl1TVBpMzBITG9PTkNrcDNWdWRMUDlPb05CUXJKVCs2?=
 =?utf-8?B?QWlmWnB2RGdXZUhFVENlaUZ6K2pzalhhSkwwa3J2bU1KYURvNTlERWxKM1lX?=
 =?utf-8?B?SjBaRTdhelk1Y0pjVVhuUzJjb28vZEdGM0lsU3hEb0h3V3N1Z3ZTOS9UYUFv?=
 =?utf-8?B?VXJBZytvVWdZN0hxUnp0RjVPemlvQzR1UmdBSTBUREo5MER1eUpUQnMxa0cr?=
 =?utf-8?B?eU4wSVRpakZYVmVEbE5QajlDS0ZUNjUzYTdVR2k2dG9ISTVqQmxWeEVscnRC?=
 =?utf-8?B?a3JPZlpReDJSU1RXeGZ3ZWwzbVRidHk2cmlFVzJiQS9XRGNoSDVTeHJ0NDRE?=
 =?utf-8?B?SCtYeXBrNi95bWpRbFhENVJFaENrVmxRZkFOdDIvM1l2c1gxcEgxTXBFd2Jj?=
 =?utf-8?B?azR2eEtCbVNaemJGOU42MHpudWZiSllGc1FRS3ZkRk13bm5Fa1h0NzhrajNi?=
 =?utf-8?B?ZERGa21XblNnVlY2a2dsZGc2b2VPakw0ajRnd0tabVJESm5vUmliUklQL05G?=
 =?utf-8?B?TWpTdlQ5M0RPVXNweFpweGdMeERuc0hDZ2tHcEwvOVM4YU9SNUswaktRZFB2?=
 =?utf-8?B?NkFWbDcvUDM1WVF1L3VocU45SUtKd3M4RjhmVjlZSEhrUTVDelArWExFWTZi?=
 =?utf-8?Q?IcuKHzN7CeoDRcJAXVvhovmaP?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+ZZcLfzQW9kvx/lGRl9V+0Nvz5lUC2nvZefAIxSBU+Rae/cysN6Rfnbu85YfkZ2fifFJxf/s0jBJn6P//1bOEL5uAAdy2Zmq38WZdvth9cdtvuf0Agd8Qr68e+1NHHsMngNzVuC4mqtbf8V3MOlFgMxgFtrvaMesQQ/AAzU2r0N/eSVyqm8yoI0UhgkBW+aBcv4E+LWpecF3uxXpWsTX3EjhbvFP02XI5uhJIbK4I+daMjn2XE+9Ihw0O1kqIOQGvOw+4a08ofZ7NElieCBPBG5KM50hWvQZ6VV1v/WYMlFzaorHXP/cltfwJZwxAg4W7SEPVtBrxE4DFurETwFNeMVR3BcYT3Z0y9RIjtR0rv98QcEtGHDxYIXQIjGbQU4YjLQ9fM0XzkFvcB1J6I85WBjFvRJvBsww950eP3b37zHMayaOrJaLKXiGLiCAIePrlCh61Fetn7mSP+0H4TafKFjj0lLB8NAqu5ye0MhYHko5gJHRA0ewhgC0Db/rJ4iLRHJJK2lfnhZlE/gED2UQhgdztLZqqQWAyhNlogF/PDGYM7BW19UWCtTAJStb09nmcD5pxBSlN72Aztxf0AdIpHPkykPU/Q3xvWgxmtaJVrEUv9kmfmyKzvkvzirT/ZD2
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6564.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102a1641-4ba9-438c-a4de-08dce8f59965
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2024 06:34:31.7444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9EPz+O7yitpXnwDNTRR3DasREJPTvrSz4260Fq/QdExceg7Dmwn0T3ey/ELPJgCObsQiTy8b4GOhodoqEBFEQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR04MB8106

PiA+DQo+IA0KPiBTdGVwaGVuLCB0aGFua3MgZm9yIHJlcG9ydGluZyENCj4gDQo+IEF2cmksIG5v
IGFjdGlvbiBuZWVkZWQuIEkgd2lsbCByZWJhc2UgbXkgdHJlZSBvbiBNb25kYXkgb24gdGhlIGxh
dGVzdCByYyBhbmQNCj4gYW1lbmQgdGhlIG9mZmVuZGluZyBwYXRjaCBhY2NvcmRpbmcgdG8gU3Rl
cGhlbidzIGNoYW5nZS4NCk9LLiAgVGhhbmtzLA0KQXZyaQ0KDQo+IA0KPiBLaW5kIHJlZ2FyZHMN
Cj4gVWZmZQ0K

