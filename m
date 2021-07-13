Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D7D3C778B
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 21:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhGMT5j (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 15:57:39 -0400
Received: from mail-eopbgr70113.outbound.protection.outlook.com ([40.107.7.113]:14227
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234411AbhGMT5i (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jul 2021 15:57:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJHy1rZMucR8uBPZxuMDU8/RHrkYFBYkZ1tArxeUN5EZIj0bONrokhOSpC0GWZLqYYZ71yMUvHQywq20EoTcosfEX8xFysqoGt5NtXzUFms8OBhgl03cdefUO90eVMcXMqeJUivnK5LI1N6K/vg/Zuzr3vvWFTDPqCBotiLe9y7785UjemrDoQkHIA43rJoVYCOnzQb82nTvonj6taknKw4N7J0nyk+qTYTPnUalAYqa7mstCpe8JOSZ1Qw8CIdWibfGjCkO6I9zUVwKoM+GP/NVVuBbbjt4TgxLBOYIupf7DPArTISBdzLMrkQp4OrFkxXFUqFTvb9RHFCZXYSLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=darPVLEsHD3398SrFEIX6NcY9ZvtI4RtvIYMUGUn0pA=;
 b=TQLkrdzKAvWspT2Ik3Ht8quCjXKbRxV8j+XDZSImXENla6pRb/Mo4vJ2xPU5AcOQIdvCslIhif+hqsfcc9jWtHFICu4tfuNQPeECSee4n76Nb3CCWubtqU5jWuZ62otOaVNrjmZh8833q2GUKSOw2Mh8OJK39MIR/D7QxYM9U7su8GicsUPBN2MuYnC09V8lYHKEG9PDyjQfqEaPF+EX4Z4yL5mX/k12MY8oNl6xwYqHVHJMDnz+9rjeJNKr+KSdWpxb/F8OO+0ajTBk8EYaHGoLI9H43AUG0nl9cdQd9V1mHPTpq7Tp7vJN6JHZN7N+Xr5xRY/tLIJBbk971J5J2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=darPVLEsHD3398SrFEIX6NcY9ZvtI4RtvIYMUGUn0pA=;
 b=POgjxvBEFrNuu3jmhphVWi1uBAlaY1VxOHyglIpgik946n6PieFQC2bcKigpcwsZyz7hK0IwBC+3t4FXMyqKJqutl20ng3e56FRWdLi8vRu25pHhnZLyHuKvdykfQCw5E300ogMGxequN2N0oVFwMiqL/1eZpi3M1Wn0DPAlV1Y=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=toradex.com;
Received: from PAXPR05MB8285.eurprd05.prod.outlook.com (2603:10a6:102:dd::24)
 by PA4PR05MB7584.eurprd05.prod.outlook.com (2603:10a6:102:ff::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Tue, 13 Jul
 2021 19:54:45 +0000
Received: from PAXPR05MB8285.eurprd05.prod.outlook.com
 ([fe80::68c9:eb5c:2e08:f814]) by PAXPR05MB8285.eurprd05.prod.outlook.com
 ([fe80::68c9:eb5c:2e08:f814%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 19:54:45 +0000
From:   Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To:     linux-next@vger.kernel.org
Cc:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz
Date:   Tue, 13 Jul 2021 22:54:16 +0300
Message-Id: <20210713195416.277153-1-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::7) To PAXPR05MB8285.eurprd05.prod.outlook.com
 (2603:10a6:102:dd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from cryobook.toradex.int (82.193.109.226) by FR3P281CA0044.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.12 via Frontend Transport; Tue, 13 Jul 2021 19:54:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37239451-f89f-42cd-c3e1-08d94638100a
X-MS-TrafficTypeDiagnostic: PA4PR05MB7584:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PA4PR05MB7584BBFD1698A5CD52FABE4DF9149@PA4PR05MB7584.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hLlfCBNtrHHhWh8xn+RW9v5wkkzCXB7OyN+51erhIXccUmwZtJ2nUhlAv3mDkpfmyhreekJ38q4b8azra2p3Y39aTmj/aX9jkJ9YW9F0o0RTshi9Bh2OALwl3//fb+Qy+m7BEVgn+jZHr8aAxdLge03mRsnI6N1PG89k3foppSm3xcOlCbdKx7E5lrfF/D9gxBsbiLBEZEX1uifwBXPnOCbPrbBmYQGPdxTcYrPu+GujIor4anUZAvzWu5ifyHJxv3HvCzN0uMGeZVW5OfBCe3zlnE7vcUbnGmR6I69xhJEbf/vlxkHFf8kDrjksb2QzrX0P2s/4WcXRqec+gTN9ezedUIoGKnqWoONtJSmR8AB/rdG83McmpC/h3nKj7q1oJyHe53U10je3vptxBGY7eAV5PnB/ZrCJ+9YcScz6tlqTUZ1BbcozoqjFdyYIaf88KRavtmJFcbpgvNflG19T8ZFin9s8pOtmEy/jI5emdLUraZoJZxh+bfDNvVMJruPQPJxRcsWlSmWC5diK3MX3427YI3NdZMjy/WBw0J1liudbLTy5o+2vq8WMkKZaqeycCUI+HvoGS2CCFN+9QmJ646Ziu2TgSbTp+p5TzMaqfQ/hwHnqyVykNnFbCrQxa8R9pzDML/k6UC3hr7QJ62MZa3yuX1iPviqMg+LUOMefuOAlRUUnZOFsqHL89z2WycHUzbU12d6qEpjzLhKkhZeL1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR05MB8285.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(136003)(346002)(39830400003)(8676002)(6512007)(52116002)(7416002)(1076003)(478600001)(186003)(2906002)(38100700002)(6486002)(83380400001)(4744005)(38350700002)(54906003)(44832011)(86362001)(66476007)(6666004)(2616005)(8936002)(5660300002)(26005)(4326008)(956004)(316002)(66946007)(55236004)(6916009)(6506007)(36756003)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WwXHjVPyp7tPgEWk3xOR3S0Lk11qVAmKkiPUh01EBKM7rYLH/IjeRiOf0a5C?=
 =?us-ascii?Q?yEAxORNAvjt+pQwPHDUjnf8x5JpWrStOCTHqhE8S0kdzWv0tzkwGNdU2bMqy?=
 =?us-ascii?Q?XM4Yvag0TEeSO9IXsctkEwueZnEZARrn8wSZn21MXQ/vMruoMRPO3Sj9HdF4?=
 =?us-ascii?Q?o3RyJFOEAwMELt9L27GpPzz2Ax8qNU+ZjSUmxn4hj/OHm2f/lRBUrxzd/xc/?=
 =?us-ascii?Q?ZyAeAe43MZzJVq9F9Y3LBZsqxD7WlCoj00BaSb/ymXwqOW9LgoJrBfTzwk7f?=
 =?us-ascii?Q?zOw8F+tU8+BoNNZzuyFA+8RMW+DrMamdefsKyysmVnUPlXMbAdKXjmKH5oTE?=
 =?us-ascii?Q?YbxHAQSTuY2J9izOdtWU7G6Jzlq/VKzutklpWOMkueg6gK2BAU/+T0D9bMeW?=
 =?us-ascii?Q?wjtxwOCGwkYGLuynlkezpbunQlvwx4ww4A9GK+SRbw8OMUrK65242wlmKrho?=
 =?us-ascii?Q?DWDo4sjqyY+QaQwGsmuBswIqJa/rST77XG+kv8VwPgL/4dTJ8z0/4FLwyRSO?=
 =?us-ascii?Q?RJ1gdl3OrmdIB+jZdBRsUNhHdODot+ANRaR4/pKnRTAFsIbEDNky49pCsX0u?=
 =?us-ascii?Q?D6fOJjYErIB2tUXAkepWa1WelyYtNDedFnRpgv7NsyziaNX925Krm6b4QM50?=
 =?us-ascii?Q?Hy6svrDHp3aovoXdoGZaP3XIeI4a50oCh9Kvn0Z7d1T5U8ctpIk6l8d0WkG9?=
 =?us-ascii?Q?ZB5hbwclx9UrDfOXI023tpifNlvivToUcZA9Ko/6ahf6bKEv4knwvd8w/RfL?=
 =?us-ascii?Q?1ZAjeOh5NrG5FdkXcG/fiHlHReI1qnqSftAesS1pmU8XOkhXv7mCegwU1W9Z?=
 =?us-ascii?Q?Mmh/DZyJvgijethOdD6chykf2MC2+jklIsFPrcBlbJb1BGxvMkO4bzANKvqd?=
 =?us-ascii?Q?tIOrEuJqhmNX8n+Mq7iHEJIuaG4RCVxch1YSXMubNTveJJEWo4Ibe63UBL4t?=
 =?us-ascii?Q?6I87a7y2IvX9Xp4yjk+tRaLchEud5bGDYieS/3yUxWxo0GPC7DjSxViA79QN?=
 =?us-ascii?Q?CHAJdfInGnaHMqLbT7iMlnb+fkoLx80rlUyqMUn/LldczQo+C7xtpPFMBGej?=
 =?us-ascii?Q?TstvKKpn7+7U0obxZvSIRDdZiRrxdmcHMZnx+AahBwksY8Pv5qcQztshGVJi?=
 =?us-ascii?Q?qRQi+t9UBWQM5P+LsMCcBvp27Va18rjnzu45aPiqKLmbKmrI3t2mjqA2FwuK?=
 =?us-ascii?Q?6XKoX7NL2M0s721esfIkKvGLEarLGELgl/RXf38JVNiGI1acyz6JxLpqcb4P?=
 =?us-ascii?Q?qP4UfVd2MGG7vEss1QRHZ++gFh2S+TcG362GkOBDERmZ/nwW01++mIPu7NOs?=
 =?us-ascii?Q?ujy1mmMUujABRdMabb8KUsY0?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37239451-f89f-42cd-c3e1-08d94638100a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR05MB8285.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 19:54:45.2213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+TkZ6P7KIeIvQhLOQ+k9C7rwf1+D3ZazUv+sXU9xKUgLi+RojFVNa/C2VNUy42q1KZPyEUG6X/33soBbJHLomG8Fu44pALfLgujdLmbmic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR05MB7584
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

NXP and AzureWave don't recommend using SDIO bus mode 3.3V@50MHz due
to noise affecting the wireless throughput. Colibri iMX6ULL uses only
3.3V signaling for Wi-Fi module AW-CM276NF.

Limit the SDIO Clock on Colibri iMX6ULL to 25MHz.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

 arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi b/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
index a0545431b3dc..9f1e38282bee 100644
--- a/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
+++ b/arch/arm/boot/dts/imx6ull-colibri-wifi.dtsi
@@ -43,6 +43,7 @@ &usdhc2 {
 	assigned-clock-rates = <0>, <198000000>;
 	cap-power-off-card;
 	keep-power-in-suspend;
+	max-frequency = <25000000>;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	no-1-8-v;
 	non-removable;
-- 
2.31.1

