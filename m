Return-Path: <linux-next+bounces-82-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CA37F9885
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 06:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE51C280CB8
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 05:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12565382;
	Mon, 27 Nov 2023 05:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="h17FrD8c"
X-Original-To: linux-next@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7F812F;
	Sun, 26 Nov 2023 21:10:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=az+CEUGQLGpzxSaD9KPaDK7UPBB02fHQG2qJZYZIaIN4uflqeu7iAnmfjSXbSW714SxoIIlWExYsuiKFU2Im9BCoLSZB7JOBcH0Q6eKITlKC/ie+U9Tu4HMS5GP58Br/mqys89/zVXoiPPj/9svDFE/EWX99t+91IDSYGKUx4DYsltYdoqNGQQ5EImXOJDaS2Pxd02Xl3Zy5yTQW2EmWPYIOFpaUXFS9TTzhCVBhijiOiv4e6/Rl616AnjgXDyxTi01jATwgePlE9YQl9wVWh6mGY2Agr8aZire+ROCeLx7nAX7QDHnfAfhxc+hCiWNd3cZ0iQOpDUxHgT1I2ZuTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qU0v/EtKiNPeRisxWpAsNESo16xQYYjk/zv5pakcvks=;
 b=lAysQtBR4kveFGaU8QoddtVv/6ezqbS468gltfQd27I4e4b4LxbCypucOki5aUIHMALgTvJMXAY1qBreQG/2NSzyDvVVckioIhIwYZVCJRcUBjCsVBFJlE958DqgKmjVT08/SIgPOC/JIRUGewLgq+LKOYyWwotYw5M80UIxjPNho6IWNuNz32P/GLW0aBGbeQBkaquIvR76pfT435t85FQFtHzgqZRhNqKJQsiO6EKbTkBH+TenaPWVGdXzOYXlJQjefsp7AEWExmQrOwBevlbrP4VtO76EF+Kl5C8VHQFrQoHkLsfo//l0S61uy6i6LcWiQFnvVm0EaS/iqIl0Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qU0v/EtKiNPeRisxWpAsNESo16xQYYjk/zv5pakcvks=;
 b=h17FrD8csFzCctlOihLY3g3EtKaUmtV7lyBaIAGRikf56KLuFaADKyKG7f8yHBoyz6pTkAAWsDwRUnbTZRaWdKc4J0gqTNXM37N8u40XWbdP4wjMDCWDge390w+TIEIvFdCShbxIfK7DJ9BAiMhhP8ogJb0cA+4UI3my9pCpUXA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB6961.eurprd04.prod.outlook.com (2603:10a6:208:180::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.21; Mon, 27 Nov
 2023 05:10:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d99:f43f:65a3:9bf%7]) with mapi id 15.20.7046.015; Mon, 27 Nov 2023
 05:10:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org,
	sfr@canb.auug.org.au,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	angelogioacchino.delregno@collabora.com,
	ulf.hansson@linaro.org,
	linus.walleij@linaro.org
Subject: [PATCH v2 0/2] drm/bridge: panel: Check device dependency before managing device link
Date: Mon, 27 Nov 2023 13:14:12 +0800
Message-Id: <20231127051414.3783108-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM0PR04MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 7131f90a-acd9-47fc-a03c-08dbef071b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VU/7wRJt21P2ZtQaXvpcMQkPA1Cr2bn0zz0NmW1AMS00z+gPty2/KC2KlSxGxN462iYEf4quErfV+Az4axuPdEve9pnuktz5YmPhwzKpMFV0BIU0PHeQIt3cQ2oJFHv7q2+ha3k5pPo7sdkBcunWbqbxatkMPQE09IQXU/mKCbhUPh5jdJR2eYU7VIQPY6yxffEcBtdE/u26+63LCOEvTag3onvGw0J1eqbfuP+D49ByQFcQUJ+PE2pPpyQS/oaNEJixGc/bK5FtN5g3kRY3YbJdohWI90ThETcQxoMxiouPPnUpVYwrg6ugrtRy/6VHUnh9zivMQ13nUt2Z1LR6NEvXUkzmAGTpn5LHBSnj0KFyXn9LRHw3MvzYF8IIoGmFBnOtWNjif6+JMCGae91lIwUG06YXR0IkUAowWlose4j3kohjd334aXqyobdWf170G3WSGqCaQ5xQjza4U6iRJvEb8H1OmbhlX80cdJlnI/Lsm7EcOLqgskYsYz9hqIqMDnzF/IqxaJhXDBckNxK717y8nA6+fREnHQU9LtHkxFDAJG2l8J4LM82Oojmbog5gCkcCkwmaRUbY5WDy2nDX11Udwuuv1CpoPGma9EarvDe/2PhluBQg+uSgW/yp/9zu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(6512007)(6506007)(1076003)(2616005)(6486002)(478600001)(52116002)(6666004)(83380400001)(7416002)(2906002)(5660300002)(41300700001)(66946007)(66556008)(66476007)(316002)(4326008)(8936002)(8676002)(38100700002)(38350700005)(86362001)(36756003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S1YPmC6rO+kZujkFpkk5iIlS6/onAVQxHAHy+CWbrAD0Pl7m5I6oWKk6I2Sv?=
 =?us-ascii?Q?XIeRWxIM8eCvJ0gBvjsmE9qtgeKO1dV/SdV+EwO64QyUqa4Waw+B/36EoFuq?=
 =?us-ascii?Q?W5bnDnSgJgTZJp1GEtwZ3HLw4b7leNIDUBP+kq72YDGEbuJTYx9gy3RiKTvr?=
 =?us-ascii?Q?MPG/jehQM1aYI8uJEjRau4h2UsY/aCyn4AOlXuQ1PRhxH7rNxhiRZmQuvr3L?=
 =?us-ascii?Q?Y8zFxISvdCOQTh9pt7ciHufMTK9ua5qJfFLnhg0pOcdF6W3/U7xe8hkNjk2O?=
 =?us-ascii?Q?cDxIpKyBKEHSIGsh0yBvx7hLK2llHymRN33sgqis7w7WP5qrh2tNR8ZYLEDS?=
 =?us-ascii?Q?CUJ+xU2S+H2Bi+bf11wflmr37L/6rTc+YwkJtKc1msb7nKU3mCnZGUNmD3wT?=
 =?us-ascii?Q?ffLy16OhuKihLpL2PbEyACMWth94aOwHVh5e+fbQtAxbvF3wpcr71WBYEfhg?=
 =?us-ascii?Q?NUjWcth4+iLhEbvj9V26Hm37zs/5h3y8AIsm2pFjYjPFd63bauVmKzN0GQth?=
 =?us-ascii?Q?v3iiSBPS/BLXwg1D+1MgHr34EF0h9J3WHqIGosxxins9aXKhhbhrEqYkJBTU?=
 =?us-ascii?Q?pHyCfJxBtSO9O+72VPY606ycYq/yXBuyvz01Jvjn80pOFZQIY5SG/v2Glkq5?=
 =?us-ascii?Q?GEZUZCjYQj32Zr6jHcVQ7RT9/8H6PdX5DG5JbVCCHUi1t8ulT2jINaSRyzW/?=
 =?us-ascii?Q?CL8BDx4qtTqCyKkmTuuHuTz+T1F+qu0s7+q39jaFj2U5pZHF9N+bdsH8B3zV?=
 =?us-ascii?Q?VLfkqNfODhLyCG8wMLzInLSbM9G/afeQ5Gm5wmRFzh6+RXhyeAzyVQMq2A84?=
 =?us-ascii?Q?UQdJ3SQBj4n0UFjRSQBdNZZmJzEQoj8ZUS87iGx4m710UmsdT1pNjzsuKSiU?=
 =?us-ascii?Q?A85wD4HwKCb186D86ug4PiJIlUeso/r3q64RHUisou508PCTLmo1pUp6Yb/L?=
 =?us-ascii?Q?RBPh289s4+zzKv8jLwBSmHaxdgkx0kZggkx+fdzksCIH7tuBju1rwnMyEHHA?=
 =?us-ascii?Q?2gwJQkKZHn0JIffuSI5YORfTmSk3tflXruYYxwpOiSe59uBbcrp99ewU5V30?=
 =?us-ascii?Q?CXO4DfS2Yp3aZ9QLleKoUz6eYBK2hDQSxhQSj6Mm+RNycsW385u76L6Lin/f?=
 =?us-ascii?Q?juuEkQ/tnND9S6G//8PuCFgtVZrhpbrw3UH/aQE+2K7UATSn7ZWl1i2OFR0H?=
 =?us-ascii?Q?4fuosSe365BDjAzcpgcChdyG/bUFqMahoRSRAoseAdvE4ePqupgF29BV7ojD?=
 =?us-ascii?Q?l8pV7A7gsZMi5ImmEcYVKPsbt/Tw3tjkzeMPwzXtbWGwjh25PcFUzvCbi6vH?=
 =?us-ascii?Q?+E/zsOX9/qqexPD8/G8n4E9wgLSsSa+lKDPEUa4MxRILg1ewf123i1HWd7TU?=
 =?us-ascii?Q?2SOEGeZ6P1wa1aG59t4u/p1MVzpis9d4YxHnacDTnVBd438ievH2nsYbkUHx?=
 =?us-ascii?Q?G6Pzj7oeDtdbQaSh5M5jHCFoNVjhR1NcNWwiYKEkN1Y/jUXpf66F3z562FF4?=
 =?us-ascii?Q?pl54wfms55THY4KLujj6bvcceaAkavsXnka00Idc9qfvu0t8nAHqp08Nv9lk?=
 =?us-ascii?Q?LDdFW81Ety/fKCLtGEBGtV0NZ1zLAdk/cqj7DA4i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7131f90a-acd9-47fc-a03c-08dbef071b84
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 05:10:01.2251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJtFp+gpMkl/IX4j6jHVZufeQplKwbFtGzKeHX2+jZiIpm+ajFGwGNFCx6RjtCAIdfmmlGQjFGn/FdQiIZINhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6961

Hi,

This series aims to check panel device dependency upon DRM device before
managing device link between them.  It fixes eariler patches in v6.7-rc1
which tried to manage the link.  Without this series, the link fails to
be added for dependent panel devices and hence relevant panel bridges
fail to be attached.  A real broken panel is "novatek,nt35510" defined
in arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dts as reported by
Linus Walleij.

Patch 1 exports device_is_dependent() to modules as needed by patch 2.
Patch 2 checks device dependency before managing the device link.

Note that patch 2 is already in drm-misc/drm-misc-fixes and
drm-misc/for-linux-next-fixes.  Patch 1 needs to be reviewed and picked up.

v2:
* Introduce patch 1 to export device_is_dependent() to modules as needed by
  patch 2.

Liu Ying (2):
  driver core: Export device_is_dependent() to modules
  drm/bridge: panel: Check device dependency before managing device link

 drivers/base/core.c            |  1 +
 drivers/gpu/drm/bridge/panel.c | 27 ++++++++++++++++++---------
 2 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.37.1


