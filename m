Return-Path: <linux-next+bounces-7331-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EF2AF71CF
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 13:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A2B3A646A
	for <lists+linux-next@lfdr.de>; Thu,  3 Jul 2025 11:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59DF1EC014;
	Thu,  3 Jul 2025 11:09:30 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC66A72632;
	Thu,  3 Jul 2025 11:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540970; cv=fail; b=muXxN3vbL6pGHaKNvCKRKOBlQfwQUeSSAG8lbNrjwFFrQgMj4PQNrh4x2QS3+v06kJALpZ8Qyvq9NbST3jrRYIimoikEgRCr6nB5Z7W+fdgMN4VNO6ZBmXArVhAUU2ag5Ro8NgxQyGUIWcUryr/QjoTMlmHFRc2mmMr5VQR3PS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540970; c=relaxed/simple;
	bh=HHJVHRSKSLSATh/QTOZgfXWMpaBAP5XuYTwU0OfJmOM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R2pARW9brQg/i2BL6lRmh4quCsp4a1ckalPD/bFCRXBV240Jil//Kn6m4LW8yBuLuFIZGXXFV/MlwZG97Y1n0t8BpBPNCrsQTIzO4lUb/XW8LYfjJbK8MOVNVh2nrgUOBzm50fXIyretNoji3JTKB93jKEpefg4vd/I4Xk3zPOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5637QTvl028899;
	Thu, 3 Jul 2025 11:09:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9de5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 11:09:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDBrlL3uSP6MYW3LjHSPliQim5oHTlAuCJW0aEyElbsIsRdbbwi5GuNSWEXNbWk3HFpoB77zw0jJa1ruVwoE/moIrgjS+8PFwhtEkvmR3ONCC83we1TUU1sqtNaGYe/g2SJCy1Dy/k66sKf+d48OGnC+M07gY6V5hKmO1UhT4Bej3y92PBMY5iT4/uTmsmSVGY9hXivpPmDimVuCpdc1+nMaUq6Jmv2FCQpRm3qAGcrh0vLXBxF15tnh08jLab54C0Ams+AcBQmEX2APOj5Q6/wNzLApD9GQf1Z6nRmD1g1DTYhm6rltUR9r6pArle+hAl+m8XVyEj/lxJ6QvfMftQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHJVHRSKSLSATh/QTOZgfXWMpaBAP5XuYTwU0OfJmOM=;
 b=ZXns5iGjqdQs3TcxiaSmeC9BNkIyO5BEZa1l7Zs1ss/H2p4PaXIrEvCL40vaIR9EFgrgO4fklGK/93PRSnffuHM+82xLCChmX1wCuyaHVYa7wtzGxWDmgoFEy7VpwKlXRLQiMPe9Xsubp1mnm3mi/1lRHU+9yBTyCUa3YXSMbgblWgIPvW12WRhueRLOawdVPdCTlTVOmUX/Z/fz59iFfKb9bPe6anWYU7hLk1UAXiYo5Fdjzpk+haIz5J2kO3GunxfRvzUV9B51gZ5DmHVrRsaHiIHl87JyX52ZYFaqJ3N6DPW0TW0s1UVXE8KuJQBuO487T1UlPiDNio1TvQY/Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 11:09:10 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 11:09:10 +0000
From: "Xu, Lizhi" <Lizhi.Xu@windriver.com>
To: Greg KH <greg@kroah.com>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing
 List <linux-next@vger.kernel.org>
Subject:
 =?gb2312?B?u9i4tDogu9i4tDogu9i4tDogbGludXgtbmV4dDogYnVpbGQgZmFpbHVyZSBh?=
 =?gb2312?Q?fter_merge_of_the_char-misc_tree?=
Thread-Topic:
 =?gb2312?B?u9i4tDogu9i4tDogbGludXgtbmV4dDogYnVpbGQgZmFpbHVyZSBhZnRlciBt?=
 =?gb2312?Q?erge_of_the_char-misc_tree?=
Thread-Index:
 AQHb6+mTafKT+g0IIECQmRgykPE6x7QgEYKAgAAF5tqAAAqAAIAABCpigAAFc4CAABC/2A==
Date: Thu, 3 Jul 2025 11:09:10 +0000
Message-ID:
 <BL1PR11MB5979690F05AA49123A47C37E8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
References: <20250703171021.0aee1482@canb.auug.org.au>
 <2025070335-situated-sloped-bc1c@gregkh>
 <BL1PR11MB5979E06DF496FA3965009DFF8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
 <2025070357-scrambled-exodus-a8a0@gregkh>
 <BL1PR11MB59798DB1C2D7B2B2988BE2DB8643A@BL1PR11MB5979.namprd11.prod.outlook.com>
 <2025070301-albatross-angriness-00c1@gregkh>
In-Reply-To: <2025070301-albatross-angriness-00c1@gregkh>
Accept-Language: zh-CN, en-AS, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5979:EE_|SA2PR11MB5129:EE_
x-ms-office365-filtering-correlation-id: 4009d186-2aee-4a96-4601-08ddba22092f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?gb2312?B?VXpnd0ZHWlNWWVp5Q2JzRFo3REVaRFVDTVd5QXFxOFF2cWpzSUVSSDNJUjlJ?=
 =?gb2312?B?d0VuYWlxclo4ZTY3TEVYWXRYUDFLQ2pnZVZIeEZBaGJOS0taWHNrbiswa0I5?=
 =?gb2312?B?YVFPRGNNQWkxc2hFS3k2bEJiYWgzSWk2ZG5SdnA4SWVFMUVNVDJNeUZ6ZXZG?=
 =?gb2312?B?MkdNVlAxbFZqeGpVNmx1SFB3NmhrcGxoVjNadFMxM2k4WVFZa1IyL2xiNnlS?=
 =?gb2312?B?YnBXMkYvU3dFV0QwNjUxdkQwMWNJYWk0ZjErcVRSZzA5SGpHOU9vd2Q4K0NL?=
 =?gb2312?B?YnVKemlubXBoVHhzTm1rdU55Kyt6dXV4ZjFxUWgxUHQxaUdVdlhtc1dKQjQ1?=
 =?gb2312?B?aFJLeGdSWm5VakJJMTVFNXNycDBIaVpVaVRqTlZPcXpXYlp1c3JoK21lTlRO?=
 =?gb2312?B?SEt4OE5WM0ZTYmZaMUVOdEhZOEdxa1BNVlFKcXNpZjZJTUM1cVhVVnYydDY3?=
 =?gb2312?B?MVRuNHROUUw1Zm9FUkM2dWhjTlhNbjZ4aEtta1owbUVGNU9hblJDZEEvYndR?=
 =?gb2312?B?ZjBlVFRvTGM2NWY2YTl3TWpUTXEvMXpZcjR1ZlZPMTdNZUZoejdLbXhLM2h2?=
 =?gb2312?B?dEZ6cEdOTTMwelcvQ240YVh4TVh2NCtDT1N5NkJHdmQwTEM4TjNhTjl2c0Iw?=
 =?gb2312?B?dkRPNnNUalJsSGoxMWZhdUFmbnlHR0NLdFRtSmlpblpUSmo2VHZ6N05PVUlq?=
 =?gb2312?B?RG55V2hVSy9JQWpWKzRvOUdWQjF5eHgzSmd0N0p3R3NMaXo0d0c0VzNzU0VN?=
 =?gb2312?B?Z2ROblBnSk1GMUdjN3hDSzg4LzZzbEw4UU02OXlpMGdyb2ZmVmQvT2VJTnd3?=
 =?gb2312?B?bm5vbnBhSmdWaGJBMFJpSzBkMDJTeWFFbklkUzZRdnV5dTY2SktrY3JGZ253?=
 =?gb2312?B?NFdwbU1iYWNVa0JVL0FrNW8xVnM4Sldzc0dXM0R3SDQ0bGFEeFY2YitNVEk2?=
 =?gb2312?B?cTFpV09YVXZKd0p3VE9ZK3NDdGZxSU0xQUxTMXRuYVBMcFJHNlZEMUZydnRj?=
 =?gb2312?B?SUYzdVE1eGoxVXYwYnkwc3ZOcFc0SGszRzJpQUhIa3RZUHJBSHJueTFYMjYw?=
 =?gb2312?B?TWMyVWgxMGo5RG1WSHM5a0RQQ3pDUEZBMFdZN05EMHRGVlFrRWJYbjA4aENa?=
 =?gb2312?B?VGI4dXRmSjJJNmpvdkNRVDJTY2lTTWRtajk2clNOZVZMemwvMzlza0IyU2dX?=
 =?gb2312?B?UzFPdjVMQkpiZVduUEFVYVpSdTQ0MUQrN2ZnYmxXb0VkeHhRa1MrbVpvQkZO?=
 =?gb2312?B?RCt3bWlsZ3l4VkNRbmUxc1FPdGo3bWVvQVBRUUZXQTRTM1o4VzZYQkRnVkNh?=
 =?gb2312?B?Ymk1QU9qMTlFN2FhLzFBbFd3d2hqenUwdmhPeFRqcGw5ZnlGRlI3Q0hxZndp?=
 =?gb2312?B?NFhCNDZvQ2dIcGpwY2dGaE02RkpXeVRZTGs3R21EZzZOK1l0c0RZbWYvVUIr?=
 =?gb2312?B?Zm5xNnFWODl5bE5CWVJLWitONUR5UzY5THZPa3hSSGVweHExR1BTdTJaRmwz?=
 =?gb2312?B?MkV6M2E5OTFvMG02SWxCaGhpMzE5N0JVamFlcUFHOG8wcU9RTkp2TEVkMSsx?=
 =?gb2312?B?aUZSTmJZS0o2ZHVXaVFtdUczZTlXRDk0aHhCY3JLczlKQzVIY2dVaHVDMUJZ?=
 =?gb2312?B?ZGtXL0hpUEhSK09CdHFTRm9xTHl3U0xXVDFVd1Q1RXM1am1oOXdJYStuVm4r?=
 =?gb2312?B?bGR1ZnJldnNZbUZ2RE5xQ3Z4Tk9xb0NqcXdnLzIvZWE2LzRxN1Q2d3FkQWlk?=
 =?gb2312?B?eVIvaUlFVFRUL2xrRENESEtOdmE1ZTJmSnNRWkVwNWkvaWNWSFU2Tjdpd2Nw?=
 =?gb2312?B?U0ZxMExZMUdwSUNWdTRValBtYlRtYzBzaWdVK1BYVFVBMnVuelI1OEg3VGdY?=
 =?gb2312?B?YzhsWXl3Zm8zTzgvZnhyWHhnUkdBKzYvVER3T2d0SURWZUE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5979.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?ajFUMEVmKzhVNmtVRURHa0ltb3MwUHNYNGF3OTZydnp1ZnlUQlYxMndLN29F?=
 =?gb2312?B?K1dCalkvd2JySkRzMVVaZ3YxaW12eHNIVmhWYkgwV1FkcVhKelIycmRJQjVo?=
 =?gb2312?B?dmdRRzVHVjREV0dkdzdKOFNLZ1ppSTVmd2tqaFROaGlzZEN0bHBKSlhvYzZX?=
 =?gb2312?B?TUNYNDlRMXNIekExRms0YkhDR05JRittdFVRdDArQ3huNTlQeDhkVUE0Zmo2?=
 =?gb2312?B?UzRGYzNMQXEwQTVNcHB2U2dZS1dra2hZMml1OFVLYUk5em12UkplOUg4U0Zy?=
 =?gb2312?B?M3FXQkN6MWRJMStUVnZJdHNNT3k0VjJwS0dZWTJlYUF4MENhakxEakJPQjBM?=
 =?gb2312?B?b21TQnlvMlhTRFRoTFpua1M1UkoxY3Q4OFR0elI1cFNwd3IrQTEyVWs3bXE2?=
 =?gb2312?B?eXlSS0JhN0QwYllNaXhzZ3JFeDd0UEtRUWZIcWlkekRGUmp3bVdJMmFNN1VV?=
 =?gb2312?B?QTdrRmlIN0ZPTnVxL003TVdHRmdnSnozQ2JTOVVUUWZlS2dmSUxick9KMmUy?=
 =?gb2312?B?a1kyZXpoMXJOeWU3NzM3Z29pdDlpNUt1VzFhdU1vM2RmalM3NmdmRG5yeFJs?=
 =?gb2312?B?emZ5azFxUTAva29wcFhTVmh0T2ZNQ0N6bFcrN0hxMGVpZXNSaWx4ME56MzU3?=
 =?gb2312?B?UEtjbktGK1c5ZGUwWnN3WGh3eUNHNUNrbmg1R3crTXo5ZG5adFZvYllPY0NZ?=
 =?gb2312?B?SzMxdXJuK1ZtWnJuc0xxRUxCVjRGcW5VWTdiemZ1ditEVnQwcCtiTTlocDIy?=
 =?gb2312?B?NzN4RWV2QTN2S2tlTS9mL0djb1hnc0hDcU9VZTVGVU9ObzdhYzJjWjk2Z3li?=
 =?gb2312?B?WENrODljTTJ3Q2grcEsydHRaREJGdnpnSDI4T2R6TitvT3IzMDIzVkJJQk51?=
 =?gb2312?B?TCtGaGw4U2g3WjNzczQ0Y2JmM0NFdUN4T3lYTE5tckY5K3pnWW16bXlqVG9J?=
 =?gb2312?B?ZU1zQUM0SjZ1SExTOVljOE9XRWtud1pMUXpMOTYvS1ZyRnhXLzlIell2Y3Yy?=
 =?gb2312?B?WVo3VExDaE55a2M3UUh3Q0xMNFRvM09MOVhtejVtc1lkTmFnOXdsbkhTdVVG?=
 =?gb2312?B?bjVYNTNJejRhRTZxMU8xa0RmWXdVTUVjMzRpdzRrZWlZRzhnZnczdUJmaG9L?=
 =?gb2312?B?aElqOXpReUl4aWdhTGtIWGt4V1dKeTNxaERqdnk2cVp6K1dvWk1TcVhGOUpo?=
 =?gb2312?B?cTFxYnJqb0E4UGhTSmtiTE1USDJJS3R2RjJFVVNDT25CK1JVMStEeGlhTmEw?=
 =?gb2312?B?OFBpWHRIQndnZXlpMHR6OFg1TnA0RW12UFVUdXE3eTIzM1lRQ2YxdTE4eUJV?=
 =?gb2312?B?S24yQ3NRZm03UEkyVFl5S1RHdGw1OW93VHJaMnZDQ2dpck93dHlWdXpJb0Y3?=
 =?gb2312?B?SVBHeTk2UzI5ZDZCbDArV05Oam9aaVNUazk5aFgzRFhBeWxVb0hLdVNIaHF3?=
 =?gb2312?B?ZGJnakhmMmp5YUNNQmxpZndrb0RodnBHOWxsV1o2anpFTXN1QTNuRXYrZGlr?=
 =?gb2312?B?emxuSjFZRnF0djdWbVJ3S0JuWXEySms1TGZuOEErWHJ1aWtPOU1mNklyUFRx?=
 =?gb2312?B?aG9DTXoyVGVibjNubTBobHNXSHZQaEVHVU9zMGlwNDZGQzBvZjkxdlh4aUlG?=
 =?gb2312?B?UW00d1BUdStZRDYrdU13WnoveGJtMHRrL1lrSFQ3aXk5Y1NjVDFaSWxpQ0lD?=
 =?gb2312?B?ZW5NVUJSRzcxTkRnUXk5ckc3SHpaL1lrYXpCcTlOa2R2Y1JxbFRvenE1ZzNj?=
 =?gb2312?B?QVV3UitHaTRaUk1nS2wvN3ZBMFZ1T1BFODhPczlNa1gxQU1zOHQ3dUNFanAx?=
 =?gb2312?B?d1B6SThkOGtWVE03VFFCWmJqTlEwcU1SNnJpbXhlelVxSDBwVjVwNTdhZjgy?=
 =?gb2312?B?QjhTeWpKZWJwOWRKSTFNbzZXcjRaRklEZCt4dCtQRVEwZnl6VUhSV21HeldH?=
 =?gb2312?B?WEcrb2FObnYxVDM2YmdwejVWVXAyQmJ0TnAyalRFYU1ORG5hTTVhNkdnTUt2?=
 =?gb2312?B?anN0ZC96TytueVljQjdUVjJzdGN2RlcrUnREeFlNNGN3U051VlFWMnpvNDNU?=
 =?gb2312?B?WnFMdVBPSXVjdGxYT1JzLzhHT0dscUJUN3lnU05LRWlHV0lUSVNwN0xWR2dM?=
 =?gb2312?Q?7tR2fg9zdCNqFiQ+rr/BIcBtW?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4009d186-2aee-4a96-4601-08ddba22092f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 11:09:10.1836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ouPXOWFQnZynxhUh0oFdpWABvJSOPPnaxlkNVpd2joOgWuQNOn24G19JMjhHhnco1l3i0vTJhFv0Pc/qe3D9lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-Proofpoint-ORIG-GUID: rMiVS9piGYUYPKFcNT80DcKmuFVP7jfi
X-Proofpoint-GUID: rMiVS9piGYUYPKFcNT80DcKmuFVP7jfi
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=686664da cx=c_pps a=TRH5P6HyeEnkyzWJPw2o8A==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=_l4uJm6h9gAA:10
 a=Wb1JkmetP80A:10 a=evnznIMVyloA:10 a=8pif782wAAAA:8 a=Q8lodQSNAAAA:8 a=2C6YHBdLAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=mFyHDrcPJccA:10 a=nbKRcsxezPwozGsebJEv:22 a=yxGMNg53M24zlVSZdvMH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA5MSBTYWx0ZWRfX03zSOSUoip2U WGsZkIbcgNNorpia8Q9Jan8iZhdVZwSivHwAeBpB8TNsYwSyETV1gdXggCjdfvGanCV5r6+cCVN nQBgMEHFmQPmuhdYQvcOuev9wegSpv1tEl/2cKssQbvRGSF0DtDvSpw5RWxlYyXDlxkIGo+lpVh
 njRC8+dpj9bnmsKZoa6zlrDdPXcb1zeqnXJ6WPPZ51H2aNLpnTr2wgi/P56uncGn+URlx5HtF2v FzUFSfXvKl+NwybmaEvrNXeF4JLJUAGf2QzktNQAx9yphIjsRKRb6umGSJL3Hh6SxcKskR20Rdi jEZxHHUm2qbkC49PCZr7yQWIqlcaHTpWVokZyrCgWMJ3jm/re8elKDV70pSrMtdUh7djZliK6DC
 oXMHfqtko0jkl5J08cBok2kcC7Y7LJNcS8Q89kTok68ER0c13Ype07lMswg8kAbjqhhC7bY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=850 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030091

UGxlYXNlIHJlYWQgdGhlIGNvbnRleHQgY2FyZWZ1bGx5LCBhbmQgeW91IHdpbGwgdW5kZXJzdGFu
ZCB0aGF0IHRoaXMgaXMNCndoZXJlIGV2ZXJ5dGhpbmcgc3RhcnRzLiBJbiB0aGUgY29kZSBiZWZv
cmUgbWVtc2V0LCB0aGUgZXYgdmFyaWFibGUgb25seQ0KaW5pdGlhbGl6ZXMgdGhlIG1lbWJlcnMg
b2YgaXRzIG1lbWJlciBoZHIuDQpPcmlnaW5hbGx5LCAic3RydWN0IHZtY2lfZXZlbnRfY3R4IGV2
ID0gezB9OyIgY291bGQgYmUgdXNlZCB0byBzb2x2ZSB0aGlzDQpwcm9ibGVtLiBBZnRlciBjYXJl
ZnVsIGFuYWx5c2lzLCBJIGNhbiBjbGVhcmx5IHNlZSB0aGF0IHRoZSBkYXRhIGFmdGVyIHRoZQ0K
ZXYgbWVtYmVyIGhkciBpcyBub3QgZnVsbHkgaW5pdGlhbGl6ZWQsIHNvIG1lbXNldCgpIGlzIHVz
ZWQgdG8gc2V0IHRoZQ0KdW5pbml0aWFsaXplZCBkYXRhIGFmdGVyIHRoZSBoZHIgbWVtYmVyIGlu
IGV2IHRvIDAuDQoNCmNvbnRleHQ6ICBkcml2ZXJzL21pc2Mvdm13X3ZtY2kvdm1jaV9jb250ZXh0
LmMNCiAgIDIgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgYXJyYXlfc2l6ZTsgaSsrKSB7DQogICAx
ICAgICAgICAgICAgICAgICBpbnQgcmVzdWx0Ow0KMjQ4ICAgICAgICAgICAgICAgICAgc3RydWN0
IHZtY2lfZXZlbnRfY3R4IGV2Ow0KICAgMQ0KICAgMiAgICAgICAgICAgICAgICAgZXYubXNnLmhk
ci5kc3QgPSB2bWNpX2hhbmRsZV9hcnJfZ2V0X2VudHJ5KHN1YnNjcmliZXJfYXJyYXksIGkpOw0K
ICAgMyAgICAgICAgICAgICAgICAgZXYubXNnLmhkci5zcmMgPSB2bWNpX21ha2VfaGFuZGxlKFZN
Q0lfSFlQRVJWSVNPUl9DT05URVhUX0lELA0KICAgNCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFZNQ0lfQ09OVEVYVF9SRVNPVVJDRV9JRCk7DQogICA1
ICAgICAgICAgICAgICAgICBldi5tc2cuaGRyLnBheWxvYWRfc2l6ZSA9IHNpemVvZihldikgLSBz
aXplb2YoZXYubXNnLmhkcik7DQogICArICAgICAgICAgICAgICAgICBtZW1zZXQoKGNoYXIqKSZl
diArIHNpemVvZihldi5tc2cuaGRyKSwgMCwgZXYubXNnLmhkci5wYXlsb2FkX3NpemUpOw0KICAg
NiAgICAgICAgICAgICAgICAgZXYubXNnLmV2ZW50X2RhdGEuZXZlbnQgPSBWTUNJX0VWRU5UX0NU
WF9SRU1PVkVEOw0KICAgNyAgICAgICAgICAgICAgICAgZXYucGF5bG9hZC5jb250ZXh0X2lkID0g
Y29udGV4dF9pZDsNCiAgIDgNCiAgIDkgICAgICAgICAgICAgICAgIHJlc3VsdCA9IHZtY2lfZGF0
YWdyYW1fZGlzcGF0Y2goVk1DSV9IWVBFUlZJU09SX0NPTlRFWFRfSUQsDQogIDEwICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZldi5tc2cuaGRyLCBmYWxz
ZSk7DQogIDExICAgICAgICAgICAgICAgICBpZiAocmVzdWx0IDwgVk1DSV9TVUNDRVNTKSB7DQog
IDEyICAgICAgICAgICAgICAgICAgICAgICAgIHByX2RldmVsKCJGYWlsZWQgdG8gZW5xdWV1ZSBl
dmVudCBkYXRhZ3JhbSAodHlwZT0lZCkgZm9yIGNvbnRleHQgKElEPTB4JXgpXG4iLA0KICAxMyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBldi5tc2cuZXZlbnRfZGF0YS5ldmVudCwN
CiAgMTQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXYubXNnLmhkci5kc3QuY29u
dGV4dCk7DQogIDE1ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIFdlIGNvbnRpbnVlIHRvIGVu
cXVldWUgb24gbmV4dCBzdWJzY3JpYmVyLiAqLw0KICAxNiAgICAgICAgICAgICAgICAgfQ0KICAx
NyAgICAgICAgIH0NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
t6K8/sjLOiBHcmVnIEtIIDxncmVnQGtyb2FoLmNvbT4NCreiy83KsbzkOiAyMDI1xOo31MIzyNUg
MTg6MDMNCsrVvP7IyzogWHUsIExpemhpDQqzrcvNOiBTdGVwaGVuIFJvdGh3ZWxsOyBBcm5kIEJl
cmdtYW5uOyBMaW51eCBLZXJuZWwgTWFpbGluZyBMaXN0OyBMaW51eCBOZXh0IE1haWxpbmcgTGlz
dA0K1vfM4jogUmU6ILvYuLQ6ILvYuLQ6IGxpbnV4LW5leHQ6IGJ1aWxkIGZhaWx1cmUgYWZ0ZXIg
bWVyZ2Ugb2YgdGhlIGNoYXItbWlzYyB0cmVlDQoNCkNBVVRJT046IFRoaXMgZW1haWwgY29tZXMg
ZnJvbSBhIG5vbiBXaW5kIFJpdmVyIGVtYWlsIGFjY291bnQhDQpEbyBub3QgY2xpY2sgbGlua3Mg
b3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29nbml6ZSB0aGUgc2VuZGVyIGFuZCBr
bm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQoNCkE6IGh0dHA6Ly9lbi53aWtpcGVkaWEub3JnL3dp
a2kvVG9wX3Bvc3QNClE6IFdlcmUgZG8gSSBmaW5kIGluZm8gYWJvdXQgdGhpcyB0aGluZyBjYWxs
ZWQgdG9wLXBvc3Rpbmc/DQpBOiBCZWNhdXNlIGl0IG1lc3NlcyB1cCB0aGUgb3JkZXIgaW4gd2hp
Y2ggcGVvcGxlIG5vcm1hbGx5IHJlYWQgdGV4dC4NClE6IFdoeSBpcyB0b3AtcG9zdGluZyBzdWNo
IGEgYmFkIHRoaW5nPw0KQTogVG9wLXBvc3RpbmcuDQpROiBXaGF0IGlzIHRoZSBtb3N0IGFubm95
aW5nIHRoaW5nIGluIGUtbWFpbD8NCg0KQTogTm8uDQpROiBTaG91bGQgSSBpbmNsdWRlIHF1b3Rh
dGlvbnMgYWZ0ZXIgbXkgcmVwbHk/DQoNCg0KaHR0cDovL2RhcmluZ2ZpcmViYWxsLm5ldC8yMDA3
LzA3L29uX3RvcA0KDQpPbiBUaHUsIEp1bCAwMywgMjAyNSBhdCAwOTo0NDoxM0FNICswMDAwLCBY
dSwgTGl6aGkgd3JvdGU6DQo+DQo+IFBlcmhhcHMgeW91IGNhbiBmb2N1cyBvbiAic3RydWN0IHZt
Y2lfZXZlbnRfY3R4Iiwgd2hvc2UgbWVtYmVycyBoYXZlIGFscmVhZHkgY2xlYXJseSBkZWZpbmVk
IHdoaWNoIGFyZSB0aGUgcGF5bG9hZHMuDQoNCkkgZG8gbm90IHVuZGVyc3RhbmQgdGhpcyBzdGF0
ZW1lbnQgYXQgYWxsLCBzb3JyeS4NCg0KPiBPbiB0aGUgb3RoZXIgaGFuZCwgdGhlIHB1cnBvc2Ug
b2YgdGhlIHBhdGNoIGlzIHRvIHByZXZlbnQgdGhlIGRhdGEgaW4gInN0cnVjdCB2bWNpX2V2ZW50
X2N0eCIgZnJvbSBiZWluZyBpbml0aWFsaXplZCBiZWZvcmUgdGhlIGRhdGFncmFtIGlzIHNlbnQs
IHRodXMgcHJldmVudGluZyB0aGUgdW5pbml0aWFsaXplZCBkYXRhIGZyb20gbGVha2luZyB0byB1
c2VyIHNwYWNlLg0KDQpHcmVhdCwgdGhlbiBkbyB0aGlzIHByb3Blcmx5LCBhZ2FpbiwgeW91IGFy
ZSBqdXN0ICJndWVzc2luZyIgdGhhdCB0aGVyZQ0KaXMgbm90IGdvaW5nIHRvIGJlIGFueSBwYWRk
aW5nIGJldHdlZW4gdGhlIHN0cnVjdHVyZXMuICBBcmUgeW91IHN1cmUNCnRoZXJlIGlzbid0PyAg
SG93PyAgV2hlcmUgaXMgdGhhdCBlbmZvcmNlZCBpbiB5b3VyIHBhdGNoPw0KDQp0aGFua3MsDQoN
CmdyZWcgay1oDQo=

