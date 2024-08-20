Return-Path: <linux-next+bounces-3366-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DA6958223
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 11:26:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97CCBB211DB
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 09:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E311D18B46D;
	Tue, 20 Aug 2024 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rW4+kl8P"
X-Original-To: linux-next@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2076.outbound.protection.outlook.com [40.107.101.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D07D18C03B;
	Tue, 20 Aug 2024 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724145951; cv=fail; b=BhrFfV6pcemkzZYeMvO8JCfprmlX4F7PAkaU4B4mwlWAY8UE11Hy/8Sto9n+jEFr8ItnqdYV28sz3maCTiYcu0MMRR6nBIPFC4gp2ZRxGrgNomazQdGufs8nV9/7hAfT7heLlw5x7721O/AsLh9Dr/3wGzNujfxel4JkO05c+SA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724145951; c=relaxed/simple;
	bh=7b7s4HyPEOqcxc74tdLD+9f0ZSLQUxU5B9xFeaCYqZI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=BNGMlZ2vBtk9hIbWttNySGUvc1KmrzOJfPXlUZ1VxCO/ggR5qVmkiG0Jf10hnnbm5Zsg0xzwmyLR+vHqvUVBpTfkI0pHsCEN5JGTU6FCOGXow7bpxBZG8wnC43OuFCDLnQ4vQIL0id+YWlrWs7zm/0aCqozS+QxyXso0+ClhSAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rW4+kl8P; arc=fail smtp.client-ip=40.107.101.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvzKsa2sCXP4Hlu2GdDB2co79EqrKskkkO+Q8ItzccpGQl0fwbLVxwWYz2+RWbog5v+Q+UlYmIAP/Y1GmuJOzQ7NAujE8OwsrmF/U97h12923xtgkCK+Vrmt8DXTKPsL7h5JyyfJLMMlDKkvDASYBfBNe5nXVND5VkbknSA+YGVPB+8JzwoeVXhxT53dV3KOsZnidhR5mRZ39rFg1f17JuMj7sh4fjw3uhVROinxTUDByTZOdx82xcD7dzRPMJG52Fu2kBAUOJb1yy/Enbp6eaS/E6Z0M4+KPL2ZCVFhABxl2jy9Ct2pHoJctkzSnQIeqoQ4HIVOszaG4n02F2JxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7b7s4HyPEOqcxc74tdLD+9f0ZSLQUxU5B9xFeaCYqZI=;
 b=u7Um4pn0P+/56Z4X2sWwygBHPmSsNx/IYm6KgEvlQnL8KxD250dVgyoPL+o3NhNCCdVs17a/kSXJqSUSB6j+8b04AYEWqcyzZP0yVYMMTGWrN9LPGsYl3NjFdZsQm3Mi1YIzNBnerU/HAFj1tjYjOXy98PiFMF280uzey7WoakzvE3qha0jl1A6J81am6o+2tCYZRm0EsBjsrR8g2OkGxeWJYPxTuTmTKsO5FkFZvoUka9MFT7LlOVapIGIJfs2AhDUXUnjO0vzRxe6ailcZBDC6xeDcm7bT/wLE4J9pSp1E06DmSqyEbB0wQBtJroardwj0TlalYMueLjN2kuAj6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7b7s4HyPEOqcxc74tdLD+9f0ZSLQUxU5B9xFeaCYqZI=;
 b=rW4+kl8Pu10xGHp0qsV8EcEsRZJes5h35HXGnjsJmssPquDdJHOs4z+kwAWpi9E+Ebwb+ue/yggk8lAnQ5WED+fem1bQkro6vYuHiRkWM+i68CT1XbgBOHDQxGNqj+/2ae1Sr4Tu70Jhqb8ilwkm2zwWWlepfTrVlJLNOMPafAo=
Received: from DM4PR12MB5086.namprd12.prod.outlook.com (2603:10b6:5:389::9) by
 DM6PR12MB4266.namprd12.prod.outlook.com (2603:10b6:5:21a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7875.21; Tue, 20 Aug 2024 09:25:48 +0000
Received: from DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::70cd:b5c2:596c:5744]) by DM4PR12MB5086.namprd12.prod.outlook.com
 ([fe80::70cd:b5c2:596c:5744%7]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 09:25:47 +0000
From: "V, Narasimhan" <Narasimhan.V@amd.com>
To: Linux Next Mailing List <linux-next@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
CC: "Petkov, Borislav" <Borislav.Petkov@amd.com>
Subject: sysfs: cannot create duplicate filename
 \'/devices/virtual/workqueue/scsi_tmf_-1072727056\''
Thread-Topic: sysfs: cannot create duplicate filename
 \'/devices/virtual/workqueue/scsi_tmf_-1072727056\''
Thread-Index: AQHa8uFUQKyrhC0Mu0qs33kwdkAJDQ==
Date: Tue, 20 Aug 2024 09:25:47 +0000
Message-ID:
 <DM4PR12MB5086B69C0A7E2D51BA312D01898D2@DM4PR12MB5086.namprd12.prod.outlook.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-08-20T09:25:47.568Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB5086:EE_|DM6PR12MB4266:EE_
x-ms-office365-filtering-correlation-id: 63e912ba-d966-4985-41b9-08dcc0fa1324
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?K8G4JFnDnpR8iJx8B24n7VmAR5VEaG8A/4et48dgnqFNVHlKM1g3XOhFIk?=
 =?iso-8859-1?Q?tPa5QMCHET7YzOq7GmBCpGIkqSSSmV8HHsZ4XsVFxu/aZiLkzTv8SzJgtZ?=
 =?iso-8859-1?Q?bV1W4wikntI5mZ7zn1byeKDNUwZCuEjtcrZ/SKDzH751yCQ1E+3Q1YStay?=
 =?iso-8859-1?Q?YSaXZufMmA/hnmg76gmLLqNqNtC2i/b17ZdMCNQ2ODil1W9x9sYQqgljvW?=
 =?iso-8859-1?Q?qeBZ7fWCV7U7sAAPBYJe8KD3TYwtalcTuYZ6CZP7X4Szzd8jrRQWk80ZPr?=
 =?iso-8859-1?Q?WvqWtutkDhN5SiBkRhwsLiNdYI3f5pPGSStLvVvu9fVE8Z+T8qieXbsK6y?=
 =?iso-8859-1?Q?++J0YCiK2F8DgWb3GotkuN3dUFFUQECrPJkjTaGuwIJTQcc52n51HiaWJJ?=
 =?iso-8859-1?Q?EMI0tfONevTc4WWZzKnZn+1CP4GUprGd2ADfRQM46jgtRXvGAFi31qtAq1?=
 =?iso-8859-1?Q?r8OAq5wgS2NkV1IyIW5d7d1WesM/jZIJ3q2SFLT6Z0fMIV7fry9dnBE4Mg?=
 =?iso-8859-1?Q?Hn/24r8sTJGB73uMNRmMM+cdzT4hnMym4oBm5ehrE865ryopXsVph58DST?=
 =?iso-8859-1?Q?EhzJSJvZ+us9pC8B/+CTP4bnHrM/9fLt69cvPSsTy1qa828MrZ7YCAf9HM?=
 =?iso-8859-1?Q?iYty2gee0b04vH9iP4j2HoOEj9yK9Uqwg5JklZLBwzZTQNFZ9LPdTLSgas?=
 =?iso-8859-1?Q?OkLPLs9dACXsTeeEJ2434jIGwc7rCEOEfVJWeEE9FcWF/xzOqFUAF3/J4y?=
 =?iso-8859-1?Q?51O1CYM4AQM3gqmXUoUYnOybWtgRDSCP8e3Psyc4g64Ox+3TaCZ5efggHt?=
 =?iso-8859-1?Q?TbHZDHhwezy0uoesZBMnhkdqvhWVO2DdvQHPoFv4Q24u0dN+LFmJq2pbgJ?=
 =?iso-8859-1?Q?OznAYO77HzGusEDkgiSfHzk8t8ZRG2Mj5MO/fbvihPyPnp+lHvnBZ4K5ce?=
 =?iso-8859-1?Q?3T2Ys/EhKi8nbTB5qx9xyJSChgsgFI797qeN8MKWu57c2ouZcKlKMC2xTf?=
 =?iso-8859-1?Q?kFrYzxz8/jqXSKnC5ezzSZkJmHRtnyDaK1U0cVydRIHr1ofYOvP2WRv1VJ?=
 =?iso-8859-1?Q?NxR+E1EjcmsqnTke3ihuyVS/z6fOVlD9CiqnsI0X1UHO+Kr9pMk3XqxoHE?=
 =?iso-8859-1?Q?FRrV8fC6IZoYAUAzflucaqwX1x7ZPzz7yANpPgUvI8Qjp2xbhM31cZrPRP?=
 =?iso-8859-1?Q?kKRc5p3ZQiUBrZfdbChq6+QsPwqu9rLhvXCMhT4Grvw9AgF6IHYipHL91l?=
 =?iso-8859-1?Q?6F3zlZjVts3IZDU5S467+5vHrfMwOcyF90Sb1mkMADYeHQOY55mcn9+PBV?=
 =?iso-8859-1?Q?CAmrh5HB7+dOpZbWa5PiIC1ejJHcaolRXB4yV+q21QQB43TKVvPJB3yCs+?=
 =?iso-8859-1?Q?okgWofJ9Io0dJwjh+BOCTuTQUcRFRBlxQ0uM22hSXBPyHHjoRgA2JGB1tz?=
 =?iso-8859-1?Q?4Pir3RQciP9NpRAaF4G6ergG/VOjpu86TfxUSw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5086.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?o3OjN/hWzKFj6XXKN4tK8FNJt9z8VXWXO8rXkPSl2vzcyqbQNK7mRvoUlQ?=
 =?iso-8859-1?Q?FzZmmPCVB7+l73ttH+3ddu0b3ZVDCub4A+6ERMgORYaDhOFyblo/7JWjxN?=
 =?iso-8859-1?Q?R/FA/FUBOEF+m/Fu0mLJ6p44N8dD4VmXEljscSIGKnanECdq/kSIDXiqdl?=
 =?iso-8859-1?Q?9DLRFzE4mcwzuW5WTeLo+Rl4WWttD6j+bVZuzIZmx4UX+dbiO/U2x+wOuZ?=
 =?iso-8859-1?Q?cQ18k31SuKeW1QtWgWy73xG7hOxC3MBgUz+c5YNiWBJNj9YpiW6Rq/AVRs?=
 =?iso-8859-1?Q?zK9dQMSlRLsbrUrwLXNAaCq+9cypo0vqusSwiqO8JfTQM2VbsY0TqLZbgo?=
 =?iso-8859-1?Q?HDkjQvNGnVIINxi058cp4hupv49t46n/XOxC+aAJJiKsrohKmPi3z1voqn?=
 =?iso-8859-1?Q?uUxSJvOfLoFvE/Ftf5W7mTR/Ml4HDL9J2iNL08FYhB3wRAihOx9K7z/VS7?=
 =?iso-8859-1?Q?iodD5WG2g+yFqGkpziyohPnzx0OBrtSUb5MmQyQcr6SLRfUNX5BLzEYU9X?=
 =?iso-8859-1?Q?Se1qmiuQnSDYi9zzzILD1gE+WnozlqM09PfkFIiaELnxG+xtQswEJ9Ql7m?=
 =?iso-8859-1?Q?FYHZPpaNQ6dmo4jPleqHLAfyM5wfA22aq7rHvy9lKy57jo6S57MOh4UeGt?=
 =?iso-8859-1?Q?e2LZjRr5EotTdLhzS+zYm8YyCV0YFuqyDZ1G9NTb5lzwq9UI/gmxNCi8aM?=
 =?iso-8859-1?Q?49CQjHKR3aC9uq3VH14U2a49aoPwNCe+zYewqDuxrw9s+YpauLehXChuco?=
 =?iso-8859-1?Q?iSE2DrNRS789cvFYuOskXewGAUQ2ifSYDMEEfp/wX/AVolf35K0jZO6pxK?=
 =?iso-8859-1?Q?Lq+yk2GiAolbjgIyEBcGeoqwNasBEdawVztbHCRqY+UE3mVZNIfqKopK6/?=
 =?iso-8859-1?Q?ZcliZb4+hsuMZUavDvR9c875maqBOAoV6fTi7kwQRqNIr5qm8pa8TMp6Ks?=
 =?iso-8859-1?Q?965MngHbx+cvhB3WZVg1tSJ/dhXL8hY4oBOiCOtdLgy5vTnSjKVwX3pVjh?=
 =?iso-8859-1?Q?Nmz07UaNkx6RU+Xf6irGKmuK59lY7ST6fw0D0DELLQXPCohBC5e/fNBk+V?=
 =?iso-8859-1?Q?KvwbyqNP88ZamemtVn7n2WpRuXgFugkbWDSMkRf9efLT1yK0JNQIL5rIre?=
 =?iso-8859-1?Q?xU4gXikhKSGMY8CSp8NFX4lq2hxz7Pf5hp2AW1DNEBNcH+XeW+1o8tU5/X?=
 =?iso-8859-1?Q?/RQhmZw6yU2XTqusi3smzzkGJoxgqM+q3XCYfgyT+JozcnZJxAmcTuoTqX?=
 =?iso-8859-1?Q?HSyZsTSCdRjR3hS4oW5927Ri1Q6f64hy/+L8ILJIgHuMmzNJMBcw2QEaKO?=
 =?iso-8859-1?Q?7rFzxSGj7CZIN0Ukh1xk8sdmE60GytKvcqci4jq6T++SZ5y+KiIGepiA1A?=
 =?iso-8859-1?Q?ZZSy4EiYoOv49K2UzgAT50Ju3HT/RUmq8z6bcr6UwQ1ntccTVDtCWVLFBl?=
 =?iso-8859-1?Q?FEojLyf0rMEAGj4Ehs9h0HiwCW7Qf0XmBb77wOZNMKBcc4nip25c9PbyZm?=
 =?iso-8859-1?Q?E/DHDxW82aHZrq2ol9jaev3mTOYEpF8a3IPwHaQSWWap+t8T9V6KVccJHh?=
 =?iso-8859-1?Q?9S103MfwHygagBP1FQ2HC1g4gHIGqylk3FLWDIAnK0GGy87IY+TkStjU7k?=
 =?iso-8859-1?Q?2gyH6YU7p4ehI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e912ba-d966-4985-41b9-08dcc0fa1324
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 09:25:47.5175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qxRjP9iTBPpe4vp6efBP4wzplSFccZJsEf/M+k7HaqrD2mEJA9y+0GhX0DiQAflOKkgi1HDD0E6gGJD8yk1DIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4266

[AMD Official Use Only - AMD Internal Distribution Only]

Hi,

There is a boot warning with next-20240814, and reproduced till today's bui=
ld.


[ 8.436312] scsi host0: ahci'
[ 8.439760] sysfs: cannot create duplicate filename \'/devices/virtual/work=
queue/scsi_tmf_-1072727056\''
[ 8.450058] CPU: 0 UID: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.11.0-rc3-n=
ext-20240814-1723624235760 #1'
[ 8.460637] Hardware name: AMD Corporation Shale96/Shale96, BIOS RSH100BD 1=
2/11/2023'
[ 8.469275] Workqueue: events work_for_cpu_fn'
[ 8.474137] Call Trace:'
[ 8.476862] <TASK>'
[ 8.479199] dump_stack_lvl+0x70/0x90'
[ 8.483284] dump_stack+0x14/0x20'
[ 8.486978] sysfs_warn_dup+0x60/0x80'
[ 8.491061] sysfs_create_dir_ns+0xc0/0xe0'
[ 8.495626] kobject_add_internal+0xb1/0x2f0'
[ 8.500387] kobject_add+0x7e/0xf0'
[ 8.504177] ? srso_alias_return_thunk+0x5/0xfbef5'
[ 8.509519] ? get_device_parent+0x10e/0x1e0'
[ 8.514283] device_add+0x125/0x870'
[ 8.518171] ? srso_alias_return_thunk+0x5/0xfbef5'
[ 8.523513] ? hrtimer_init+0x2c/0x80'
[ 8.527597] device_register+0x1f/0x30'
[ 8.531776] workqueue_sysfs_register+0x91/0x140'
[ 8.536924] __alloc_workqueue+0x61b/0x7c0'
[ 8.541491] ? srso_alias_return_thunk+0x5/0xfbef5'
[ 8.546835] alloc_workqueue+0x52/0x70'
[ 8.551014] scsi_host_alloc+0x398/0x490'
[ 8.555391] ata_scsi_add_hosts+0xc2/0x140'
[ 8.559961] ata_host_register.part.0+0x93/0x250'
[ 8.565110] ata_host_register+0x35/0x60'
[ 8.569482] ahci_host_activate+0x145/0x190 [libahci]'
[ 8.575118] ahci_init_one+0xdcc/0x1050 [ahci]'
[ 8.580077] local_pci_probe+0x4c/0xb0'
[ 8.584256] work_for_cpu_fn+0x1b/0x30'
[ 8.588434] process_one_work+0x17a/0x3b0'
[ 8.592904] ? __pfx_worker_thread+0x10/0x10'
[ 8.597666] worker_thread+0x2a0/0x3a0'
[ 8.601848] ? __pfx_worker_thread+0x10/0x10'
[ 8.606608] kthread+0xe5/0x120'
[ 8.610107] ? __pfx_kthread+0x10/0x10'
[ 8.614286] ret_from_fork+0x3d/0x60'
[ 8.618271] ? __pfx_kthread+0x10/0x10'
[ 8.622449] ret_from_fork_asm+0x1a/0x30'
[ 8.626826] </TASK>'


--

Regards

Narasimhan V


