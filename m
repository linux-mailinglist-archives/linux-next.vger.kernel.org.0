Return-Path: <linux-next+bounces-6536-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15293AAB9ED
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 09:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92BBA188592F
	for <lists+linux-next@lfdr.de>; Tue,  6 May 2025 07:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE3328688B;
	Tue,  6 May 2025 04:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QQAUEoEg"
X-Original-To: linux-next@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011033.outbound.protection.outlook.com [52.103.68.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940133098B1
	for <linux-next@vger.kernel.org>; Tue,  6 May 2025 03:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746502622; cv=fail; b=PVzXldBDtakOXajFINdqX1+wUpgKG6o+XRm99vFbdmSek2V1LIs0h10Jhb3j6nfgY/2YovoYn5kyYcaciAsJLTYkBlKlzkdKRMFDJh+IEfQOVyL2Xr7JHOe0f6kcJJ69GHgCiXiUzFbXjx24nEpY0K0tRDbx8bu9koYe5/3L7Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746502622; c=relaxed/simple;
	bh=lMyis3HJS/ZLAnmVi0ROqk8UHw4UBnZX2ecm4cUvqA4=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=rGxJUM8LjhY1+hbSrlIsPnvdpTOGVNLokFcl1XEWgTlhJwnHvC+85c5eogcS5XUn5ggqPT0c85oQInJQzZ+8PjitAoGefXvCj5Gw+QDYhGqSsp0YWIS/UfBdB0pAzBnnOjMyi8dsgh+Vym8iA1sarDqgV6Vm+mESU+ujrocGQUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QQAUEoEg; arc=fail smtp.client-ip=52.103.68.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=we4ylSOCLNBPU26pDqQyliKzcBY3Ov6qs2FEM6u1IQ9udYQ8XJpKUJMYi6goxdFTIB84AROLGLMYTkhq3h+HAnaShdTLFHb1Oe44npOrxBYRNKtliBIpDK/plnuNnDGYUh06BmZ0kVh9HfhIvw009GtGrcCjBkU8QDRiPXLIZm9s2sXajjeISauNSGtFIXW/R/bBA5CoD8DEmx16QUcw8oVU+9GYxbNkh/M5x858jVonhNj9XMpCYcgnDIthLVROnklGg59ti7e5BUNxkPjlsM7lQOPIzOknK/l9vR++4ppu+1y86Oxrnzw+vyTs74G2qSIoM5PhOnSI1gK28FUDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bssOURB3wpvDvuVhsve68qXUUj/O5nRRJeVXweWXE98=;
 b=ZXjhliIopPfpAMpVABc21howPAOqA8b3e8krCKhwWE83D7xyLQiScZLYe5iPFWyPO8wjt0IF1oxEXoA648RY1TGK9yJCqOxnXXNHArJuy5zd59lNoBmVNqaJq0SdRM4hvmlVF9mXTDGaPm6WCOYEvPBDifLjTGwW7BrFat2B24DKacxzDvYnQmZ1LON8HdyegdDL7WrP809sVz1XRiKX1+V1z99O22xSY4A2a4rOBkMNH3Bcr4mTPlqCf/x1nS4wVgt//Bkvjhx5HrwqcifErBgYCMoajqNdb0G7SgHAA1g3CR3S3osgP7ZE3yar84ZYVEM+M7uOhCZTYMwG5xOfog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bssOURB3wpvDvuVhsve68qXUUj/O5nRRJeVXweWXE98=;
 b=QQAUEoEgcVwyQU2HvVKjqpOtlIJQgfMj8bioWJo21LIrMK113gfQJWS7bzI3ADm56iceRhrxfuCUeBRzyNmcxbsIu0+LNEMMMw6d2iGtC+pe+80+8WztTPp7FZuUoAZvGiyhnu4d6TgNkPohu2U2otLIMDWAAzmZWuIegvLsDOJF/2yOhkTb4bZfC0JOlftkiDNFs5VEQ666BWIzt1fghFBFzABiwAcZakihyMZkjZBWLS32hZM7fGzHmvCjt9B3U5w5NrgMQp76pnpdqrZ/kf8tn05Oj0mOdKwT6XaJImJ1x7VCiwtPtIDfAdUKgre3tPgrm6PYdvnWa9SlYjUktQ==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN0P287MB1173.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:190::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Tue, 6 May
 2025 03:36:55 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%4]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 03:36:55 +0000
Message-ID:
 <MA0P287MB22625A31223E095B44640B43FE892@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 6 May 2025 11:36:52 +0800
User-Agent: Mozilla Thunderbird
To: "linux-next@vger.kernel.org >> Linux Next Mailing List"
 <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
 Chen Wang <unicorn_wang@outlook.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: Please add two new branches for sophgo/linux.git
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <0d359e3b-a525-4a21-a8f4-fd507bf0e873@outlook.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN0P287MB1173:EE_
X-MS-Office365-Filtering-Correlation-Id: 533c67b4-65c4-407a-6f2d-08dd8c4f3f0b
X-MS-Exchange-SLBlob-MailProps:
	Cq7lScuPrnoSu68Y5FdRDlCPOBk43FEtslcVioRXMekz/8Fd3fdCdhrWcZ1t7TFG5ZboZroPxeCne2lL3E8esyXh7jWXlyRn+iduaZfaJYv6Qvqv6VqbhVLkXl/d9BTjt5EDSXocr1kOWnchEXXbZpfJCgRDThI0qFNQX/Lzr1kXHLWoQNxlEXxaNV8io5Lq85vxDWjArzKiaSnctRDcFuNygLoUOW1KEp1C+xKLUWLxzUQA5sUEXFGZStKiG0Wi35QuYYGAjXONlvxxcUxeybucmsdvDRF86SYwmbgfx7KwY4vOSXbTRffCtk2y5tT6Yt/gmOwK0YmniNK3U71HVw8EDdjs3aFQ+9LR0CjgC25qfZqwTFyRi3CA7uOJcOqyUTw5TIdPtKIn9O5jJeM4TU9/LByoFQAhu1m6CNNo0Q8DMAI4yA4aTvOJWnWSn/WiQ2W/TLwmQpIrDN8PFJYH3Gum1WhR+a8+xY9FcB2sX/wKZIsw4tBOhjvMDbresSQNR+dzAXeZ1tVjoqEmIu0zGith8mb7bEDFe7bSLBe6xAeMsut1AMHzJFSdrnfaMScNMgN534avlSGnyUWZA5wyvLiP2b7DZ918Cu0N0TXLQAqV31QKHmwfNjBl3WWsgl4tBhErxSMfBSwrkSUxO7Y3oZcMtoGFgPErnE568lEgn3f3hlzCc+AVzDUJyjBJDMJnnrEFr2qfMvi9/VJ5aDnO4v7F8TMX1qG8FpzFQLa7VhufrSTKSZBKjEf24nADhdl/z87aoTNbukg=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799006|15080799009|8060799009|7092599006|5072599009|6090799003|5062599005|461199028|10035399007|440099028|3412199025|34005399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2xrYkVqSDkyVVNHQ2xZRytGQWJJdDhabVE2c1N6VXp2aEtYbFk3MDkrTDF1?=
 =?utf-8?B?VXRsWFhIZ0x0U2Z1U3ZtUGFWV0l3SS96QXBkOTJpbXo2bXVCVHhoaXBHajlG?=
 =?utf-8?B?RDlrNnZKT3lxeGZoVWVpVGlIQzNJcVdyOTJTNktzSEtEUDdqYlR2Q0VKOW51?=
 =?utf-8?B?K0hzQUtKNVpIZzNBcE5XMW10ZGdOcUdmWWVLd1N3WjBmUHI1cVA3MG5kU0VB?=
 =?utf-8?B?NUN5eU9NRkZEZ2FIejhSZkhydy9NbXhEL21XZWVac2ZpYTU0dlVsWVFPQms2?=
 =?utf-8?B?S0RDZDNNR0xzUWZWczVZU0xsVEZPeEhNQVJvUW5jZG1FTzdyaUtDT2JNVDgz?=
 =?utf-8?B?ekppM3EzL0JCRjJ4bWU2UzhUcjdtR2lBdVBReURKTDhOcGpRa0RLZGlBMTgr?=
 =?utf-8?B?T2RqdWx5aHBqRzJFQ0JHOEowdDlEL2twdFRrRWlQU2t4ZTdDVy9LNWJBZis3?=
 =?utf-8?B?d3o1QWZvZ2pQVi8xK0gxc2tjTlhueThtcW5RTHlJOWJncnhLS3R1K3FteXhD?=
 =?utf-8?B?akMydFJCMGJWUTFoTUE0NEUyM0x2Rk5CT0VFU2xwVW5hUmY2UUJ4WUxKQjYw?=
 =?utf-8?B?bmM2RkdhaTJkMWhJc2Y2QXRva0JsMVdwa21naTYweEcwT3BLL0lNbUZYU28z?=
 =?utf-8?B?Ti9MNVdndk5aQ3dXbVZDRVJOQmRPU09jc3o4eHFsMzJGbFdzREZvZXdORDdo?=
 =?utf-8?B?cW9NbGJEZHhVdFlBb2FRTXVjSVg4RE90b2I2N2JQZ1h4WUhjNFBIR3FHU3ZI?=
 =?utf-8?B?cXlHY0Y1L0xZNkltVzR5NHU5RU5mOGVwbm9hOENxYmNOQkJmZWlLdmh2RVN3?=
 =?utf-8?B?eU43aHpjRjhkQ0svVC9lQk9RZ1hKTUNhRzdMR2RBUzdQeGZuWW9GTWg2TVB5?=
 =?utf-8?B?S1BhMkp5ZTZCRE1Dbk5HOU4xY1lnQUwvSVlFdkg5ZUZnSlNjaVg3NFVPMEV3?=
 =?utf-8?B?bTVwTFZEbUJ2aWNzUVRBNTczY1Y3QTA5ZW11dENRbUx5eUg5RGo3cExTbjhl?=
 =?utf-8?B?RTdNU2ZOdWhpRkVrcFNuZFhORS8rVlgzWkpJY0lqVDhPT3hGWkdoQlptRmRp?=
 =?utf-8?B?YkJ0UjRzQjJOTnNFb1pMWllnRGVmT0JxM2tzSU9lQmFLQlN5eEdrR0hMTkdw?=
 =?utf-8?B?ditYL3hSdER0aHZtN0J5aFNvV2dUc0t2ZHJsS1ZCenYvQVZ6S3RmNVoxb1Fa?=
 =?utf-8?B?bE8wK2pXVW9aVzMzT1J4ZWkrbmNmVkJYS0wvMC9Hcno0L2lEWnM0QXp3U05q?=
 =?utf-8?B?SERpYUpVeFZnT05KSHYrMlhvUndTTnEweVlpaU8wRDNmR0tJT0Jlcit1eFNJ?=
 =?utf-8?B?ZUdQd3BCa282cmRram1IVXpvVTdKU3dTeGVWWVRXd2NiQm9MLzcvcTRDWW93?=
 =?utf-8?B?UEZmZWFjMGNUSWRUb3pDb0FWWlRIc2VPRWFKcFh6WDJNYngwNDh0OEYvLzEz?=
 =?utf-8?B?UVhjTGNTK2RXeTdwNW45OCsyd2lScmNsbWgzdmQzc3lMcU9jSVN3VHNJKzlI?=
 =?utf-8?B?Q2pjc2FEalZMTGhVUnRwd294QWgyQVRZeGxRWjliTTBqVjd5N01VOGRLSUlo?=
 =?utf-8?B?MVhXRFZTQktBWHZIcTBwUzBIVWl6eDJLNG91STJBSndOQjlubXFvUTJiemxY?=
 =?utf-8?B?S3lWR2xHVEZkSHdpeEhVdGw0NUhZci9MMlo2aWkrTE1GUFhIWUd6ckR0TVVR?=
 =?utf-8?B?WHZkaWdnQjVxdDhpKzFOODM5NXN2QXVacGRHVkNqTjZsWXJpbU1IbGt3PT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWU2bnFmeHQvZFV3amJvSnhXL0d2M2dGbERQQ0syN3pKaEoxQ29lMHJUMHVp?=
 =?utf-8?B?VVl2bUYrNnhjbnBzc1R3ZDdKSm1NWG1hR2F3eXJtUElJTG9tcHRTdDBRa2pL?=
 =?utf-8?B?WjJoVG10VUhWTjhzUUhtNUwzaDlmdm8zRWRiY0tJRXdsK1p3NVdhVVQxMlhL?=
 =?utf-8?B?dkw2NWVUWkJ5SzVIVmVZSWRISTZYbnZQdFRFTENvbXd4OTRLVzlJT0VpZ0U3?=
 =?utf-8?B?WjdMdk16aE5NblNWK0NjUmQ4dHRISGlleUlGOC9NYm9EUWdMN3RRYXdCSU9l?=
 =?utf-8?B?K2hNWDNIdWJnVWd4VUhrK0RCbmFjN1piTVA0cjVQMEFDQlEycXp5eC9VSHVD?=
 =?utf-8?B?elFINS9HQjZoYmlBeU53OTBvbWRHb1BPUkRUMklzTEtxZFc3MHdoTnJBZThK?=
 =?utf-8?B?MzNBekQrUVpCaExRZHlwUkxQMUVtYzk5M1lRQUpxd0ZiNnpMSzBUSXc5Vmhj?=
 =?utf-8?B?US9SZTNCNXNvN1ByMXVNSTRoQ2k0bXcrbTFnMnFUNkg2TnJQVkFabUJxZ2hH?=
 =?utf-8?B?V1dpQ0swTFE4ejFXcTRUTGpJQUppc0pWdzE1VEY4YndnQVlkWWhRRCtyVlFt?=
 =?utf-8?B?ME4zcWYvdHdYUHZwTDg4dktwWThSK0dLeWhuZmFkUjdYV3NmZTJMazVtVHBQ?=
 =?utf-8?B?ZDQ3RGxrM0tKMzFVOUk3NjB1SDEzcXE1WUlwQm1qa0k5Q2R2eER1Z0FPNmFx?=
 =?utf-8?B?elZtSWhta2RVVEkwblRKa3ZvdlNMNTVnblg3anlrQzB6YklKTFl4VEFQVEh4?=
 =?utf-8?B?NG5pTFk5VTBLNFV3NWplUkNtdGI0dUkvblpacEpxZFJHQ1BBbjBMRE14dGNJ?=
 =?utf-8?B?QnlUZ3ZpdHVmT2VYcjNZbmhWcGdpTEtMOEpyMldZVDlVK2IwWGx1Sitxa3BS?=
 =?utf-8?B?cENOU2QxM0lKU0hzTE83L0R4RjY1ZVNPVHhWc0d1amNUUlVRN1pUNUVFcE1Q?=
 =?utf-8?B?Sy96a3dsWlBCeDBqN0ZjaWdKNWlvVEJheWtpdWpSWEN4c2hHNmdLWlFRcGt4?=
 =?utf-8?B?eXlzcUJUeWJHbWtBT3E2Q2hnTFdwL3V2NHcxSnNqdzVidFRKakZpdUQwTkp1?=
 =?utf-8?B?NXVSK1pBYVNiT0taNlI4VTlOTnB6c2gyUXJWcElaRWw0UDZQQXZ3N3dVNGVl?=
 =?utf-8?B?cXRKZzc3Q3dWOE94aHZpdXZNeEd6ZEt1Z1lEQWNGK2JudjY4d21qUi92czNV?=
 =?utf-8?B?bjJMSmJIMDQxeFc4UlNwbWwrMGxnNWR2ZDdsQ09wVmtUZE5aVTNUL013RGdh?=
 =?utf-8?B?Y29PUUN0SmYraTI4dkk5K2Z0enpoSnhWVDNER2s1NWVWY2VvWE53NklBUENM?=
 =?utf-8?B?cTVYaEhtYWVIaGhDNDVpN2M4dXc4dk05Z1JsRHo0VU8xTW5VRzFaK0ZZblZ0?=
 =?utf-8?B?dC9DdEsrTUVNR1lxL3c3UFpqcDRzMEYyTXhCS1JIYjFKa0QxcXNwbitZZ01Y?=
 =?utf-8?B?OUlNSjB2NTdxTzlqbXhnYnk2eXZSN0h6RmRlVHZYZExWNnl2REFrcmFkQnFH?=
 =?utf-8?B?SEJsd3BrL2lVQXlxaHhHSzdQUWZFMC9zT3dNRFk4UWhPRUhJZ3hYUzQrWDJZ?=
 =?utf-8?B?ZTRzelZDc3laTjVCVVdQSWtTVUFjYnNic2F1TE1Vb0p2aWdOZUVaK09ncER0?=
 =?utf-8?B?QWtVZktRZ3pQVHIzbGZ5OVJuUVk2eTlSb2VwTFpwbzA3cllNblRRNVcvaWhY?=
 =?utf-8?B?VEE1VE5CMmxtLzFtbEgyMkpOZmRueW5DeHYxeXJRWlNUWk9LN25zR0ZJRnFJ?=
 =?utf-8?Q?0LsE+AhvryljfnRCqSpOuV0baTzPkmwgn8YVSjD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533c67b4-65c4-407a-6f2d-08dd8c4f3f0b
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 03:36:54.9009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1173

Hi, Stephen,

We already have two branches for-next & fixes included in linux-next for 
collecting DTS related patches for exiting tree: 
https://github.com/sophgo/linux.git.

Now I want to include two new branches in the linux-next to collect 
drivers/soc related patches.

branch for soc master: soc-for-next

branch for soc pending-fixes: soc-fixes

The patches in these braches will be sent to Arnd Bergmann and 
soc@kernel.org.

Thanks,

Chen


