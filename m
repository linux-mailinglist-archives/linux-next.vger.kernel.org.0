Return-Path: <linux-next+bounces-7543-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20168B0504F
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 06:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D4D6188862D
	for <lists+linux-next@lfdr.de>; Tue, 15 Jul 2025 04:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774FE25F99B;
	Tue, 15 Jul 2025 04:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b="OqIQYMJI"
X-Original-To: linux-next@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010023.outbound.protection.outlook.com [52.101.69.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE1B2D0C6E;
	Tue, 15 Jul 2025 04:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752554184; cv=fail; b=n4QbJLYRSIHHhKOopkwAe/GsPoqlrG9Z+omm6u4o0OoClt6NMgQosmf9tkjiPPkbKOYmAvMkVHYzmaCtHNe1XBPl2YOFdo/sMtv/593sVLpE0gAijHI/ja4e1ne8YU+HKVO5q4OYMhlgcmzuZuR4WBltKmZdHtEkSzetew+ImKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752554184; c=relaxed/simple;
	bh=Vwoew5PyTCJVcca+F8s4+TB//SbGAUoQcsSSM07HTtA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KGi6XtbkxHNQi5ZjQau4mu1WI2Rz1NFoCXu0d7ViVMC7FmZDTM7leAaKNwc2rc1W1VetcGUXiWIHCA+lR1zDtqqcZ1PeXl51rRHMsOSn4mOok7HVIBEu6N0xPG5YV+woO8TL1XIWaCARvKLNJq1Fwo7aq/c6Gpw1QTffONnuoHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arri.de; spf=pass smtp.mailfrom=arri.de; dkim=pass (1024-bit key) header.d=arri.de header.i=@arri.de header.b=OqIQYMJI; arc=fail smtp.client-ip=52.101.69.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arri.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arri.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7CL4lyLX//8P+tAs+r6VAmPTOhSmsAyvbiU7d0zIcCLiinwRjhAgakejO4KPVgZh8O4agvEgNkC0uZ4lS2tSW6WZ9o4L/EiBJQ3MuN/CXqA+IWdqq1EDrqOcQ8q8rn08DDMSWUZPjn+rombvhApspIDmJssSvzlgJ+MDPoGJSSGuEAfS+mg3ZKYO1KCnSJ/sPD/LiSDZ8EbqIeWLIWvGV4wa+1bZIwFDgH4DpU+GJ1OJj/d5WMKpr3ZD9H4sXspQxOxc/MuK8CcB4kkmQ5EfWhWkluXHMuASMX+2TyqUprye9ihMmafA1ugKsX15FAOi05VPwT05vmeA171PXiXog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlRjEM0pzE11ERXe8Rahvw3ehFcRv73ESvQd5EAY0bI=;
 b=IFiQoOxUBaEPHjDIAxkp5hk4yhgGKAbgKWUc2Z9B8Xe+6xswgEosd2YrP5iAsdGhq/xw2vcUQz247aor8TCWw2FVtXOJ9Z3Lmu8+NNv85wSsI1yMOB6kMXbmCqtjjQ7w450gurvsbxxmV6+VOkY+HTrKAGgfSrCWPQZX7FPdt9CKRcj1S9uwaVABGsZ1mtRAK+7YmRYAlvt25n1XuZfP5WyzD47CUEBbJxXcw4mX4pwWTlg5cFaAlReVFPUvXevlidYTBEbTast8AymrrYSTE7lMpvkpxY/3K+X9BRpAjNv+oAGbrOkheSdEZvbJuiFkawOkIq3NEg5qSeEJ3XATZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=holtmann.org smtp.mailfrom=arri.de;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=arri.de;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arri.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlRjEM0pzE11ERXe8Rahvw3ehFcRv73ESvQd5EAY0bI=;
 b=OqIQYMJIZbqriygLuetRAcciMZhcQFj0XtmNOt0pyaDIsVHIczCpAXsWI4fo3c64ozpW/6lmBjnBllHBG7HRi2kTuLKN3bipVZG88We/8zuGSM0ihjx3lgRLFc+U2xc/WMCGOQvvtzBudtsxaEOsHJGN6rk/W9JEKH3OFaWlkw0=
Received: from DU6P191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::18)
 by PA4PR03MB7440.eurprd03.prod.outlook.com (2603:10a6:102:109::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Tue, 15 Jul
 2025 04:36:13 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::e3) by DU6P191CA0042.outlook.office365.com
 (2603:10a6:10:53f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.33 via Frontend Transport; Tue,
 15 Jul 2025 04:36:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.22 via Frontend Transport; Tue, 15 Jul 2025 04:36:11 +0000
Received: from n9w6sw14.localnet (192.168.54.15) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.38; Tue, 15 Jul
 2025 06:36:10 +0200
From: Christian Eggers <ceggers@arri.de>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
CC: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
	<linux-next@vger.kernel.org>, Kiran K <kiran.k@intel.com>, Ivan Pravdin
	<ipravdin.official@gmail.com>
Subject: Re: linux-next: build failure after merge of the bluetooth tree
Date: Tue, 15 Jul 2025 06:36:09 +0200
Message-ID: <2198253.9o76ZdvQCi@n9w6sw14>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20250715130932.5e13bfb3@canb.auug.org.au>
References: <20250715130932.5e13bfb3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|PA4PR03MB7440:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c29fc3-5714-4b5e-730a-08ddc3591ff1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WYccwXhMRsAWWtuBJxuXJgL3NvjtFe/2iCeeIDj2h2aiqLhcOl3dbWpxOMnO?=
 =?us-ascii?Q?X/C9ycSdBtAy/4evc1HoVFV8GARhUy8H8MegfyNB6+ZNjixPnW2cx9+Sm3g0?=
 =?us-ascii?Q?pW2HKebiZDnPSqUY8tpHVhO2xY2AhfX6qP3URO6CWq6bHmmmUYIaV5Q6xQBG?=
 =?us-ascii?Q?YUnm3FMurm/zC6z83kw4jVTHKrM95K80SP3sxpsUj8twzRbJdwc6ipLl4/kp?=
 =?us-ascii?Q?YcaGWGJ2B5R6+KDvnOltFUolyNvgFaSeycdRPyMIuMvhtitpqLneQzLSDB6o?=
 =?us-ascii?Q?KW/znrIIbHg9PYeUZ3FGt1voqKH0SU7l2Yi1O4QrxNFfw2TsOKSJ1gZx0Vfh?=
 =?us-ascii?Q?0FWzeI+GbB+C0P6vEgQ4VHFFHzCZ9/LzH3wItpYn9EXgRHQwBxSpwV1kuXjt?=
 =?us-ascii?Q?tUiwMlRJeCOnblOi88J/cSOdE2DG/hq5qzCWRUl6rmf1J0E8HNXYveiQQ7FZ?=
 =?us-ascii?Q?wWYwfMtJTIiLL+WktSuXNyAe0aSO9sDrk1n5vtpkNtWeXyTgcR1f924Fmf5p?=
 =?us-ascii?Q?m60Fn/L2FkfN9HE8CJvthuEnW9MAIkRC0J9R5Vtxq2Y2vFAtufQtgq0kYzhO?=
 =?us-ascii?Q?/CL6rTz33RV7HTwzcQv2kg+MeFnUmzHCGi3fqj25nSrQnXRjri8gaSHCHETp?=
 =?us-ascii?Q?K2OVfUyln9h+jW06RjMRAk8QWEdSu5IoefbFpEJx19TwV/BfMUpkT/+OgfL9?=
 =?us-ascii?Q?ufmcOKTkgLGeu0bc90OWHrI4Kzw17g5QMq5kfBX0vhnEaaDv9ip6bL5tKaIS?=
 =?us-ascii?Q?F/GFo9fJIPkT10Lg8DdkQ+/d25dgd+Lq3fx/iuc55iYeXPG+/XBBzjhU9NOO?=
 =?us-ascii?Q?2v6X+9MJkk2lErNlrKoJrhSzKGsAEVz87dk+QkkEc8/Hl6NABQQvxlSs+Vg7?=
 =?us-ascii?Q?waYaFZejFmZRGoPc6IpJBDmUwArMeURe7V3Us4OcRaPeNYTxaeHBGF2vTl1h?=
 =?us-ascii?Q?pokEsFQTLzs/9iEJ4Ex+3lMFEje/5XvJ0Q0kNdUF6QwbSOd5TJnR72Ebzmi6?=
 =?us-ascii?Q?G80dYVCsEILMJIcFhMIxv547lJEsZqagaO5fuBZhWJ8CDp6X7xO5M9sYsv94?=
 =?us-ascii?Q?WP/70q7ZIcdKmO+ZMSa/stkSG2rHEyqV9mff/haLF9PNftti6pWzFnyLki7x?=
 =?us-ascii?Q?aKyaAGjTgYlo36VeP3RP7H+DhoEi2zLvVxOHfu7w7XXjp3BJ1lMnxwci9hUA?=
 =?us-ascii?Q?pEw+HM0n+7x3Vw5sdYOn8UD8fNDlWxuQGAt5h9RjHeQVA1jUzfmJt4RtJV4a?=
 =?us-ascii?Q?jE+mYIig3G+kZC/Wz/E74G1YTp/VzYuHQS3xEvZUq8mD94IjNxi2g/By4ZPE?=
 =?us-ascii?Q?Y9Pk0WGr7knYIopupdsvI/ZNVQglQmMo+ayR9VuFka05/jxhFf68SwzyP90Y?=
 =?us-ascii?Q?LQkAU+oLym2sKvflagb2EMouv7NYG4BP1cvMjQ6TvpAhI6CS9i14kho65UVG?=
 =?us-ascii?Q?E2Hm/Lugbu/crKNEm1YS65pmWOcjwRMLqoPWDBQYlUOGAHiY/Hw0Nw32W44Z?=
 =?us-ascii?Q?vI2P9fL7VuemE3attQMEkCivVW/yYL66UTK1rWvo5MA2hWjzAFysQwdxpQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 04:36:11.1179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c29fc3-5714-4b5e-730a-08ddc3591ff1
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7440

On Tuesday, 15 July 2025, 05:09:32 CEST, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bluetooth tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/bluetooth/hci_ll.c: In function 'll_setup':
> drivers/bluetooth/hci_ll.c:652:60: error: 'struct hci_dev' has no member named 'quirks'
>   652 |                 set_bit(HCI_QUIRK_INVALID_BDADDR, &hu->hdev->quirks);
>       |                                                            ^~
> drivers/bluetooth/hci_ll.c:656:68: error: 'struct hci_dev' has no member named 'quirks'
>   656 |                         set_bit(HCI_QUIRK_INVALID_BDADDR, &hu->hdev->quirks);
>       |                                                                    ^~
> 
> Caused by commit
> 
>   be736f5f89d5 ("Bluetooth: hci_dev: replace 'quirks' integer by 'quirk_flags' bitmap")
> 
> I have used te bluetooth tree from next-20250714 fo today.
> 
> 

Sorry for this, it was already too late yesterday...

Kiran K. already wrote a fix for this:

https://lore.kernel.org/linux-bluetooth/20250715030318.1007009-1-kiran.k@intel.com/

I hope that's all what I missed.

regards,
Christian



