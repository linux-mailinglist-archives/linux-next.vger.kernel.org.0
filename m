Return-Path: <linux-next+bounces-1713-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3B88A642
	for <lists+linux-next@lfdr.de>; Mon, 25 Mar 2024 16:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E79F91C3C8BD
	for <lists+linux-next@lfdr.de>; Mon, 25 Mar 2024 15:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9A66FE20;
	Mon, 25 Mar 2024 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FQ/Aj9Ec"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA5B66B5E
	for <linux-next@vger.kernel.org>; Mon, 25 Mar 2024 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711370426; cv=fail; b=CWlaGnDGQtVFDcMV3yWClpZ8MQZABgD6742evM4V6KhkzrvJuKMCbTpD/9mqTAaJSqWD2wlEh1ImpIa3Kx3cXIWwfYd1PO0Be7mlJFUkDfQ/ZiU0DpG7LADdJcJc18EfsHsK+qkoUWuR/TUgvc19KrK7PmmnpeRm2ra6sIIosqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711370426; c=relaxed/simple;
	bh=zlgLWmorzWNOk0hIcnjOWO5TzDBQdCiTDZPW6rxrPJM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SFDV7f0ScrnCwfMfJ6mRzwcuHkBBHkSX8UtjNRDI+FjDMvbW0v1M3UlHwxcqTbXyFnOLxqAKVyaBR9tU4Oc5zr9KFwwvoBwVoIkAR+UjyPyOo21z7xokg2AZYr1Ge+U+m8njIsVuuKrzRQmKVPQQwD3/ntQKHMa4ZNNcIHcVtd0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FQ/Aj9Ec; arc=fail smtp.client-ip=40.107.223.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnTDDgA3MrEbD86YiBtSCLHrjBbBk5O4//d4D4/INmeZ3wgSNLacgsqxYcWsJP1Gm7UeWLY+GLGzruO6Ah08E2ptPOR9f6Fd6rwrWUpHrCB1Ka0UBI9S8NgShvL7+c4OncnFLrpE/g2WWVD6xZhZ9sPy/DQg8rVNQd3IPDP+TuRawsozMyqqhvBSeKqCtcuY4EXNFJgY+Y+KkL2ClxEWWKBpsAooDeFbT2aEehbaIrNcc0GyI+9g+Fex2+LlkO9kKlEj7Omu23VrrAm8qZg6YuwWMZsuT2nOIuiCgxd9Bfz7sTK2+zPSFBO2RAdyt6xXUMHRzXJNpsoLc33fnairtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IppGx+yowIvPFLKDIHOmNvG9swTxKND90JOL6BLDxxY=;
 b=F3LgRzfl8xxbsB3InrMv1QkcKdrg0x7aTxJY7KCGBXJ4j2/Qpuke3SEr0O20RN45Ia84U4vQDgWIrWh1J2CX9zv3cGLkTSay/MEzJvVMUVOu2jS6M3zCD8UHBFt0W0zA0nAQjXkJZcDrkNb1Ud0DI4S430WpEu/tbsV9K+SbGFsnmBGO5ZxEw01ck3uxiQUfmbnDKC5OdPfFZ3N8FxIVNcdEdFfg5AeOaG0PC/PRTVKhFWgCc5moyJJGK1Z9bLbay2tW/mpQZB0RpLVDbRrh5sTnApaD3Khtc+v3mr0uxJbuYShbDTpi6O5YJsWVrynIVvbcIlG7/UCJPs+Uq9AhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IppGx+yowIvPFLKDIHOmNvG9swTxKND90JOL6BLDxxY=;
 b=FQ/Aj9Ecf6Nkrh4MGj3lyxLQFn//HaLebp+45gxM04cQoJwMI/xmlyx1pUVld3DqnYmTAB8nhkj5jIiTC/wTXJb5pBYzHusIeAze35r6/7+rVpBHGypt5jU9fs7zcJ2LkM2x/vm2IRRBXAx7J3IYoYWh9zkUJ1Of106FL7/iBFQ=
Received: from DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) by
 MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 12:40:20 +0000
Received: from DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::225b:b65:a5c8:b069]) by DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::225b:b65:a5c8:b069%7]) with mapi id 15.20.7409.031; Mon, 25 Mar 2024
 12:40:20 +0000
From: "V, Narasimhan" <Narasimhan.V@amd.com>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
CC: "Aithal, Srikanth" <Srikanth.Aithal@amd.com>, "Petkov, Borislav"
	<Borislav.Petkov@amd.com>
Subject: Boot failure with kernel BUG at mm/usercopy.c on next-20240325
Thread-Topic: Boot failure with kernel BUG at mm/usercopy.c on next-20240325
Thread-Index: AQHafrFpTdzIz8FNRkK1oR1yu+crQA==
Date: Mon, 25 Mar 2024 12:40:20 +0000
Message-ID:
 <DM4PR12MB5086E76CF24A39017DA8567189362@DM4PR12MB5086.namprd12.prod.outlook.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-25T12:40:20.295Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5086:EE_|MN2PR12MB4333:EE_
x-ms-office365-filtering-correlation-id: d7e423ef-be11-48ef-5690-08dc4cc8bba9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gJwCIACSHyG6sdibsGZjJDFmLpYVPXRiyGXom4wWpUVEoNw5JUPiy35CRMmv9yBUnoxCbYIboOQM2U4kpWe/kUE6GYcyiQfvlbHmGPN+tqfvIEIJn4hIMnRYRhYBnDvPtG4ta7C2e5tyvYl2dqbRJBjiWXuafeWFxp+pW8Rdi878luRv8P29sLp6T6MCTn+bsoMHwiM8noXxkdbBxdjY8YkCQKDaNousZXr2izj3uz+xQQ6PLuZYEIZlT3LDNnLQ5ZpSs/kh2RBQ63TMAoxQ8/fzNnt/kT360GMNKjS5ncDYV0liBFVwFAqzuN4b8glucmecsqKnh7B6pE9s3R1AyhE0uPNilUW+58v22Za4L88Rm61QmEeMpWd7wmUZEw3Z6Rfuq997semAkAliZjHc4jPnsXzfQPpY+ROH96XvWmsxkDKBQK0WHudaNFzRSn4m+LRcRq9Z5quX0AgSm1jAJ+A2HZp6jVd5balhkd60fOdBVKnz64wf6m42t+CkOFLMlItDV0hirmIvlZBFXT/uxa8C897twqzKgpyTj1YhqFoPaBkI3HsxFIvrJhHncwauW2ptikUsj8Zmmaex9n0fzyBSiRhbk8GF30GKGLnrTs28/imgSaE8gp5vaErhlaoNnnMDiSL291+fs5M3ZuiE2iKBI4JKfTVHdw3vuHO2DWxp4d3p+BEpNA8ieSmpiUIGLETXFhzodwwz0AF2rDuRNxfHdr0cdlVigwBbAaAsGXs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5086.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gd4xkWMRlBX3IS8keDODdExE9hYG0xlvqQ6aLSAg1fykLaplQNynLndrnB?=
 =?iso-8859-1?Q?aI5iFQqZ7QAmbDJNeMFiET0zGLpNzR2jNeD78XD2jxygng+mi/laC5YETa?=
 =?iso-8859-1?Q?FHTgZmgok/k76aZAo9xPRispQeT/y/xj0Dhxd6TKNVuk4J5+yTFgyyhHZJ?=
 =?iso-8859-1?Q?tQiWn8XrRLynPbQIg2QAowUm0aW/aGNJIqDjNsq4KcpHqdU942ZxL51uqP?=
 =?iso-8859-1?Q?a58xHcAuS2YZTUJjdo89f+tNRoSweyi+RGhHgnbsm+iaAyF+2wS0gkT3ZZ?=
 =?iso-8859-1?Q?rGBPOgWd98U2Q3qGzW2tglF8WPWJKe5g5deiX6XVo6pKhyvr6j17OkQtlz?=
 =?iso-8859-1?Q?v2i8P8NdY4HH+ik/We1Tbj6al9pAbb2GvINo1e9yyEL9X5UQIQ2zFSMYZZ?=
 =?iso-8859-1?Q?cxzHh7UTw6dOAuNZMqLjD4eA4j/HA5oG5vdaEj4For5UuFZyS/+YoaefD6?=
 =?iso-8859-1?Q?wSxvm93xDJhZQOUlJK5H4W+NoCn9OBfB++DdoOuxTt6C715UaO3UGa9Gh0?=
 =?iso-8859-1?Q?TTX0+An4pjTbBIlw9VKRBUfrkfOybaV7rcUJd+4ku1U3OITh/SgvaI+5Sy?=
 =?iso-8859-1?Q?8ummaXc+eYQ3rXng8jqAng4b9RjZuRmFCU6dqbfw81Vd+fqd4JZOmBwKIm?=
 =?iso-8859-1?Q?dzbqYhqa/yvxk1oawk7vu0tb0z0oftd9joUVWTr62Hn/YnscoEoxoc3hs9?=
 =?iso-8859-1?Q?NLnmVxeubcU/MSBU7dTn0CVXDQw54lHhQL9OynDxKfalmUXBJGMLAdD6pn?=
 =?iso-8859-1?Q?1h1KD/7LAeO9iwYobdaSvd27OQpaOgd+0BhTRbS6hV4yKDbjyRhIDwLpAs?=
 =?iso-8859-1?Q?Oof4EocWJWWrA4eIJbVhJgwWLHOuf7fm6f62S0mo6J7S+8JI0KjEL6YubW?=
 =?iso-8859-1?Q?YaCFuycLjynF+/XPurf3iuhtCOoi1Yuyyv+24SZZ/gamFctd+2+9uYHoGn?=
 =?iso-8859-1?Q?Iz3Gc/z5sCal30OggmERQ5zksCLFhGZK1pP3McMZAvMmJKkxqijzooyeAq?=
 =?iso-8859-1?Q?bcIckJxAyDYQYsrXWNQX4iTzOp88tnHWFLxB2Jtayi8DWs8fhVn29n0CYB?=
 =?iso-8859-1?Q?qf2PXarMwTf038vt+reqU2dCT+5Hv/4HqKmHKo2GrXXu1bhhkQLp6GeUC3?=
 =?iso-8859-1?Q?8cbna1/6M2wD38QrOQ9YHQ/McGaoHl/b76bDzFMzb91BNfJS3dHBGFQjnw?=
 =?iso-8859-1?Q?Zx+8o41j/whvlIHwz2yOlgS6tthdNRgbaFesirrOodtl7SEG006yT8nh5J?=
 =?iso-8859-1?Q?VjylaTU9t8/b5BI/SEIvD8VU1xTOq1alebz/D/K/i883AiXgMWk40wlhUn?=
 =?iso-8859-1?Q?V7A/jYPMxRkmaqXRS3tOl1LfELEuGHlelhJdzx3KCPYuI243qZmGFcaKPy?=
 =?iso-8859-1?Q?UmWpsdbdVZdUUjnv8sj5aN9jWLu9vQbwJ0h0+SHm9EZ1o556e8WN8OdyfA?=
 =?iso-8859-1?Q?uYcIQ+q+zqUpUGeX+NiiFtPouCzTN7jVYfsUPFqjUQXSkfJCSlMXijKw52?=
 =?iso-8859-1?Q?Xs9RiOKia0BKIWb4Igcxztb8e+gJH8U4lW2QkqAPs5CtZSFdIWFi5DMpLS?=
 =?iso-8859-1?Q?TuIpvvzB7CtL6sh/13iFSNHpkNfnwMMBYejo/jybOH08rl+4YGPwyTENrc?=
 =?iso-8859-1?Q?U8g9pYZlZev/k=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5086.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e423ef-be11-48ef-5690-08dc4cc8bba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2024 12:40:20.4838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4GDJ0mabvPY1CL2x7hXpxVbM6Fuozzlte47kK3NyNbMA6v6PDY9SxpkHmvWglHxD7/hcUnWn0Du8GI8qarGxqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333

[AMD Official Use Only - General]

Hi,
There is a boot failure as below.
On bisecting, the bad commit is found to be 328c801335d5f7edf2a3c9c331ddf89=
78f21e2a7.
Boots fine if we revert the above bad commit.


kernel BUG at mm/usercopy.c:102!
invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
CPU: 15 PID: 567 Comm: systemd-udevd Not tainted 6.9.0-rc1-next-20240325-17=
11333827684 #1
Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 12/11/2023
RIP: 0010:usercopy_abort+0x72/0x90
Code: 4f f7 b8 50 48 c7 c2 31 a6 f4 b8 57 48 c7 c7 50 10 fe b8 48 0f 44 d6 =
48 c7 c6 32 30 f5 b8 4c 89 d1 49 0f 44 f3 e8 5e 2b d1 ff <0f> 0b 49 c7 c1 1=
c 60 f4 b8 4c 89 cf 4d 89 c8 eb a9 66 66 2e 0f 1f
RSP: 0018:ff855d5641947e08 EFLAGS: 00010246
RAX: 0000000000000060 RBX: 0000000000000000 RCX: ff44c5dccd9ff8a8
RDX: 0000000000000000 RSI: 0000000000000003 RDI: 0000000000000001
RBP: ff855d5641947e20 R08: 0000000000000060 R09: 6c656e72654b203a
R10: ffffffffba1edd60 R11: 657275736f707865 R12: 0000000000000008
R13: ff44c5cd80037800 R14: 0000000000000001 R15: 0000000000000000
FS:  00007fbc2be258c0(0000) GS:ff44c5dc86f80000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbc2c459230 CR3: 0000000103f54004 CR4: 0000000000771ef0
PKRU: 55555554
Call Trace:
 <TASK>
 ? show_regs+0x6d/0x80
 ? die+0x3c/0xa0
 ? do_trap+0xcf/0xf0
 ? do_error_trap+0x75/0xa0
 ? usercopy_abort+0x72/0x90
 ? exc_invalid_op+0x57/0x80
 ? usercopy_abort+0x72/0x90
 ? asm_exc_invalid_op+0x1f/0x30
 ? usercopy_abort+0x72/0x90
 ? usercopy_abort+0x72/0x90
 __check_heap_object+0xd6/0x110
 __check_object_size+0x28a/0x2f0
 ? srso_alias_return_thunk+0x5/0xfbef5
 __x64_sys_sched_getaffinity+0xda/0x120
 do_syscall_64+0x76/0x120
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? do_syscall_64+0x85/0x120
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? syscall_exit_to_user_mode+0x75/0x190
 ? srso_alias_return_thunk+0x5/0xfbef5
 ? do_syscall_64+0x85/0x120
 entry_SYSCALL_64_after_hwframe+0x6c/0x74
RIP: 0033:0x7fbc2c507d6a
Code: d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa 49 89 f0 =
be ff ff ff 7f b8 cc 00 00 00 49 39 f0 49 0f 46 f0 0f 05 <48> 3d 00 f0 ff f=
f 77 2e 41 89 c1 83 f8 ff 74 38 48 98 48 83 ec 08
RSP: 002b:00007ffceab058d8 EFLAGS: 00000297 ORIG_RAX: 00000000000000cc
RAX: ffffffffffffffda RBX: 0000000000000010 RCX: 00007fbc2c507d6a
RDX: 000055b26dfa3040 RSI: 0000000000000008 RDI: 0000000000000000
RBP: 000055b26dfa3040 R08: 0000000000000008 R09: 00000000ffffffff
R10: 000055b26dfa3030 R11: 0000000000000297 R12: 0000000000000008
R13: 000000000000003c R14: 00007ffceab05ac8 R15: 000055b258445078
 </TASK>
Modules linked in: aesni_intel crypto_simd cryptd
---[ end trace 0000000000000000 ]---


--
Regards
Narasimhan V

