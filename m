Return-Path: <linux-next+bounces-7658-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C54B0C18F
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 12:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E409817E885
	for <lists+linux-next@lfdr.de>; Mon, 21 Jul 2025 10:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085D728FFE7;
	Mon, 21 Jul 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i/mg1suB"
X-Original-To: linux-next@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4AC28FFCB;
	Mon, 21 Jul 2025 10:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753094543; cv=fail; b=fy6av2iBQpqHStdhciy4HlrJ245m1gccef/Te1P9W+rt1swDTwYmB/shpTwGLi/RwciH1Gy+08hGEIbV9fLOG4actTZLxk0/hJIYqtZydV6SRNV/ANXt3LmVA6RHsRl0Rj/+os839qy8gbg6QT2Z5lcvRsnN+XaS85wIc4IjFgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753094543; c=relaxed/simple;
	bh=FsxZm5EyIyKFVz8YnRm1c1Mvb5VRQ9OvoXqnOEMt9xY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YkcFwehiz04DSxjmKQ0mmQ9EkU3cyKPYLOepOZH5h8gtsaZLpSJHIdFIoUzjefHIvhIhkCNdrdV/8V1/ePAfSlHN/SKe21/8CgabMgAJDzCJuP5MQESSfSYyQ4jUxDI2t/rA+hx8dTjNBWUsTdtzLZQ6C0wJ7sfZ20slGAs4L/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i/mg1suB; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJL/eBrKb2RpsMpjUB0VcTA/dSJs4POvK+jRxuEYIauAN6iow5fBEvSsvGrEQruARmSM0ifKsWVy+PT8Q+5LIHTWlkWsBqYeGVVx6NCXDoATrqJZ3TJaa6boslK4Hu+ENCuOVALfir48T6MCdR9OGXqthOxewvzFWWugkoubwl/eEdaQHZZdOTYGBsfm96il79CXJvpA1e4p+TpId/W37W150ChMcDEmX7BS71N/TCgm00XxM8OC6F0O2bFHWHGzQAAs7xswdgtal+uaf8N6wEnhXv9zcx99K+Hn2C7WaH38H4tHzOzr0Z+zII47/uRvDC/wHuzhOIb7yJiVhPKGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B0wO3G0aVcPdnc3gpcPBqVsDD21qoiONDm/7H+kZFT8=;
 b=TUpDBv7jlLTwbVFXQI4tuOQh1DrYRBQUDvJF6d17PdaH65ekjXTrEIiZvND4rFr/d6DBemRi6CRThzDZ5azerkxMFEJlMq2q0mOWvhYsFAgpJrubB6Db6z57gq6Ii1l2mKknoGymNTR6TWG5SSOOGtoNjpa5MkzSBQrr/Dcki2F0JabrpYTjdFDxwbjVKgvTVJh5HxFA7LMmR/X0S62k9DeJFGhzR7ohTV8Mb/YOZdOxPjbkHuiUjHpCZR9x8WMsY3Pc0C+GPKBkS/P6XVTBaboufhd7ZYa+KaanfLXUqfu3k/D7zKUied7sLGthyjMrCC4oDGkTIrNDijwF63dYhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0wO3G0aVcPdnc3gpcPBqVsDD21qoiONDm/7H+kZFT8=;
 b=i/mg1suB1o7lEXBmvAK3nq81WS6CjaciiMzGCA+YvRUeb/hy+w0W9k1rVjF2pu0zjECyMpVHmX5/nMen6E2kMEvMhvvFBLz5NAO5x33IfRZp0OZe0YqBOm17XUlVIpp7+Ecxqn1IhPU0uFcBnkUotTZ4NQ+bkKBv/B1yLg60HG+gdtyOg2QR3ElDRQSBSqABT3M5uTZOfFFZ+OTZqNZ3C+HwLkOHwLxeUJj9ES9Ep/H2ZPM4zRHxTWDouz45wPGbG6rs4Kp7olQ2z86bkWs53PgGTKJMBFO+8recsXdT7PEjJ3TsjgkHwEBS8nAvWMvNMLdyUaXnNQmpASxLRx/adw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by DB9PR04MB9449.eurprd04.prod.outlook.com (2603:10a6:10:36a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 10:42:18 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 10:42:17 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: gregkh@linuxfoundation.org,
	sfr@canb.auug.org.au
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] usb: core: add urb->sgt parameter description
Date: Mon, 21 Jul 2025 18:44:17 +0800
Message-Id: <20250721104417.3442530-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXP287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::32) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|DB9PR04MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a617c2-0d84-490e-394d-08ddc8434362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ceaLlnhLQ+p55lWQ9GLqnlIgpY94FQn5JtCM6kTROO3vMpTfrPBEcrD76hmg?=
 =?us-ascii?Q?9enU4cAMYwTjgh54lXOpnZTwFOsnAgvTq2rw+H3b65H4uiutBK30fJvW2lSk?=
 =?us-ascii?Q?dn+ZH3PReKAWkqCegW0JmdYAJQmgEE9bMewAh098+MMJmGywOZ5JeZ8CQGHk?=
 =?us-ascii?Q?a1h7rqYZE5mnOkYAIgDonb4toComF45LXUj3fVrsoHAcsBIT/WNGqNrwhRvl?=
 =?us-ascii?Q?K1wcR+gBiLhL3a8yFjOboiRP0RH97uC4aLHtEqVcNltt9aNxhJvMs/aDJjPg?=
 =?us-ascii?Q?0cWfFVJA7DF7rCK4ndpH430MHr5OGchEEyREOtja1J+VsFe6H5HvXMz/0RGP?=
 =?us-ascii?Q?9PFvGUyoTtOewPyC8ce8IpX4aGfONLv09MkFlzqUNVh2bZeQBCpILnxZfn9A?=
 =?us-ascii?Q?UvwehjAmQqIvaxZPMpyqMz64i/0xd/x2JXxHTYtsFbN2DM+n14Iklw6Eo9Bj?=
 =?us-ascii?Q?G9kq4aXXm6W/cHwA7FnYpiIfa2rb0039ysNbcHGJrmIClw8VBhBauIaAgCJR?=
 =?us-ascii?Q?0LK+2NoZTC4Z37y4+loewk6bOVcRPUx+31hncrni4WleRJrgKlW6BxPBQV0F?=
 =?us-ascii?Q?jkPRoUJa0JHuxcCDiqtkN8C8ia2wKfhVst/4Nr+7t0W9KqzqdEqKnWL7deaa?=
 =?us-ascii?Q?deHLiC3TEB24PhUj3WdX3wwvsdff1KbaeuE+L3N0Xq2hgD6Rtm0Mcp4p/bHR?=
 =?us-ascii?Q?XuzvhD9+gw/jQRovZ6ngVEMn8l7Hi8Eyq2niX+XNkZDyqLMRe9z3y2UuVxDX?=
 =?us-ascii?Q?ZxovIE1GWYZrs8FZD5QSfHvF0T2VbPUnmZQfTKNLoUzSUq3OE4XbXTVu+zCN?=
 =?us-ascii?Q?g6EkItiGyowvfczg8w41001zy1CbNUTKogRwX9dKU0fOXTUIx+KLy/0/eDyD?=
 =?us-ascii?Q?FmwVt71Wu13EHksjQepJdMoNURgz0nEwUBScLpnFON1Wh40WUW+K8QtFkOrk?=
 =?us-ascii?Q?ysdJlgfd9IsmGvp+knvDV0A/QSracrgPbVVIX0REikv2QDxGG5j1tgwTkTxF?=
 =?us-ascii?Q?MyaNBZsQVFE3S0Ez7b79Gro+GnThAMsmO0n/tHw+dkPz89gEIK6GTlyjuG74?=
 =?us-ascii?Q?rU8LHTMbEDyq2Kd1g4OzSSWwW1KqU4zBe02b7MAcZIqJhT1VfRuXrrI1gP+Y?=
 =?us-ascii?Q?4bozZD+xFWZBvlBhnIBCaXbuHdkMEsvPfGH6tIIR6TqOdZo4wnlAlq7jDuJY?=
 =?us-ascii?Q?IMhyVF8lSyNocimRwBPOdefknyJgK2v7MLbQzH2Ds/aypr5XIUaNJen8bf9z?=
 =?us-ascii?Q?Yx3/NHl3/U95duOKAhZ9DmOgWvfWWY1LTZmurXd71Az8C3ExFkSVR3Ualzle?=
 =?us-ascii?Q?PKXdvhMukMksnGo1ut6VrqRniVwjZ7aagRjuJhczokoHLFSILOjoG3jk9XLd?=
 =?us-ascii?Q?iXsiNhxDMotinDmpomgGbCtXj981z3QyHFpZUB921z0U5AuNBAKPmsq/3mDJ?=
 =?us-ascii?Q?2pWBAT+MPeZoHNjUURtvN9L0VNJCvyBaOqgcgQFXZmkf7Rh0e0Ho7lScFhrg?=
 =?us-ascii?Q?9R36ubVUUYs1EKg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0zoQ0eYkG6gz+rR8Y7fBzrwPPyu+xkpWb9Lxco1BBiTvp5NtRaEMIzu+h5kx?=
 =?us-ascii?Q?zw1OgplsQU/LmB+UBEonYUQqr9qQEi8UJBIIe0djAos760ALxuUeEnMxXa6o?=
 =?us-ascii?Q?OqchY0o5f+AxBhu2ln+uC1n1pGmLv+JD7gOM41UMNKrBdA9SfSb3RmQUvIpv?=
 =?us-ascii?Q?2pYJeSH7p0/i0rlPXp0O/dWe7hnnjtBhm37DiKZ9EdcWDiSNYjuJ5vJlN/OE?=
 =?us-ascii?Q?oowXAr4hpsRQDE02Srx+M6hoDpCeG1BAsOU5KSKj9GxTmr5PHy896ZdrJVcX?=
 =?us-ascii?Q?3i9AqgHpOfptqcTuiFnjrK5lEJnCarCwWaAUjt69BdF5W/0XESh3Vq5FF+9i?=
 =?us-ascii?Q?heyWprWI2sQzAGRY2rkwI1bFtvCGXwFTA/HcdySns/SSHYMqoWSWAoHaLZXM?=
 =?us-ascii?Q?5/nX6zKX1jGVgKGqzzMlAlxmBqgLQob7Gl0bZ+XAWdY4u5xqzaZqvpDUMytF?=
 =?us-ascii?Q?HXyN7UqTJHRxaMOqis1TX/dIQ7YmMPPr4MtymZm59GQNb7ToIfr5JVzF3mkj?=
 =?us-ascii?Q?6fhETchY/PeuvBiw/tBZB5UEguEPwaQCfrnuUjumHwEJkwEjrulckAXdqnTX?=
 =?us-ascii?Q?Y8j+kzhLlagcwbn0JF64ipslvj76aRBsV0M7jdDgCo7ldlGEqYSjWYbrewbZ?=
 =?us-ascii?Q?A2IBC0V8OSNGp8GSLOfojfpWZLsdXH3KhW5+jW6KrGDgLr3qQ03j5i9TAvET?=
 =?us-ascii?Q?TrRU9gP/yJKvbWRvcpgNG99gC+ITaSHJ+rH/AL5GwCd9oXUZK+6gJDWaOivH?=
 =?us-ascii?Q?2x4tFfNiaXDF7GjGFw3f3CsSdRXtJgUk+nPe+9awcIygeiyV1TumzxKBAqA8?=
 =?us-ascii?Q?u3eZeFfcL2Mje4nDeWpZ97WrbJ9ieb2KNTZ9WeJPXgiZGrVqizgzrJ4mLQyf?=
 =?us-ascii?Q?wGaJ6kegnUrsus515nqi3AHjirtDJWiTRsLhbxj//zsytPPPQA6RMza/Q7wb?=
 =?us-ascii?Q?SlJ34CgqtAY58TkcKUaoIfIA9v9W71x/YqYpzg/VOUF3Ryfl7jP+/1+03Hkk?=
 =?us-ascii?Q?Wtxvq2I1Rx4qePDyGARF/Jb+TLv8Lnv1Sh16ztNQgqCynBe3knwUpMbteirS?=
 =?us-ascii?Q?IGSn+Bad/+JFteR377zmAy4cGlaN9ybhkTUJRFrP7Xs6w0eiX1w3phWAiCrb?=
 =?us-ascii?Q?qiipf2HVoPrQaklJqbjLn1Jblg9b1DIcmiaN+42Hi2dlVU98DFCXdhz5rSpW?=
 =?us-ascii?Q?PTAJlManwgR6MzGeprI9OHRIp47CVwn6wDtluUMGX6iBV43CdJlbz0zqobqs?=
 =?us-ascii?Q?bAF9KbcdNDOwLMkTK5NvuOtvFgoT/tKg/Ot5huytJx6Zw6qbLs/8qPyHsZ8c?=
 =?us-ascii?Q?DG2EPX+7QYRF4eZHnTKfFouMPHGp0o9y9+2JHFeLphLyb6IYv+SOiZ42YR5D?=
 =?us-ascii?Q?6oPNtqMy3Wi1NMn8c28CVDLWHQCOJlXE+gVfHp2ez3UedU91tlhBjzwah7KK?=
 =?us-ascii?Q?yfhq2TxpTsFn0bbZ+rVqzc+FqtMgGFfmQ848JOYKM537SNI6unPV1S+01gv7?=
 =?us-ascii?Q?GiiqrF7w0zzUK+Os+TeKPqKieBJxF8qVIX64Tr6I1jGbmSNd0HjshmitQvpn?=
 =?us-ascii?Q?QoqLEDcxHo7MiY925b1uHL5N+6F86ceChv3aOyUQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a617c2-0d84-490e-394d-08ddc8434362
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 10:42:17.8145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3YtZaF1fMZTa4sFFuy1K7kKwvjIf20j/PVKa3uxgK5H7ZXtKlRXZfCZ/grAMNIL/sC+g8C361ik0fVqVvUHDhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9449

The parameter description of urb->sgt is lost, this will add it for
completeness.

Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20250711182803.1d548467@canb.auug.org.au/
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 include/linux/usb.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/usb.h b/include/linux/usb.h
index 535ac37198a1..9d662c6abb4d 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1455,6 +1455,10 @@ typedef void (*usb_complete_t)(struct urb *);
  * @sg: scatter gather buffer list, the buffer size of each element in
  * 	the list (except the last) must be divisible by the endpoint's
  * 	max packet size if no_sg_constraint isn't set in 'struct usb_bus'
+ * @sgt: used to hold a scatter gather table returned by usb_alloc_noncoherent(),
+ *      which describes the allocated non-coherent and possibly non-contiguous
+ *      memory and is guaranteed to have 1 single DMA mapped segment. The
+ *      allocated memory needs to be freed by usb_free_noncoherent().
  * @num_mapped_sgs: (internal) number of mapped sg entries
  * @num_sgs: number of entries in the sg list
  * @transfer_buffer_length: How big is transfer_buffer.  The transfer may
-- 
2.34.1


