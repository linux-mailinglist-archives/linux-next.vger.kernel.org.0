Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5EE3C77DE
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 22:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235538AbhGMUYP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Jul 2021 16:24:15 -0400
Received: from mail-eopbgr00109.outbound.protection.outlook.com ([40.107.0.109]:44174
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235322AbhGMUYP (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Jul 2021 16:24:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahefmdl6WKCbxCYEFykiCCIjFxrbJtBKtC44o9Xa7t1po9xTXkDiOGQs6tTMvtjhjY60PsQGap4F3FmtxIOa8lNQcJuWx7gxDyyuzGkc9vMIdZ82gD5KvVcAE0J26b8Z2kMufkx/s0VxD2btE4RXzu4TWgjBTmK6kS7U2+YMer5rpwhN1SNzIRZ8AuPgm4gqdKj+rpNXtrzSjgRFykBPswx0/W4ogxbnzMGQxvxV6Z/tHWIhil3DFTqhCVKMKnm1bbhS58yiAbTNnxzFxAMIR9dkQu+OroU2YkTqL9BCsprW95C1YXLc9Jh4obR7wA9fu+/HUfo9sVfo875W0DzOFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7w8FukSqIVjBJ0MIylivcY/uh+ohwRRwH/KMZgPiC3M=;
 b=RbGy1sW6GbB7AvbP5tnUkdCqPSo+mlLHFXTxz6MlVsAZ1RxthK+L1un3C0DujOZGnE3i8mjG6yGUnJy12E7n49JRHFKkUPxCzEJVCcDmk9XSBzOVd5/GhF892NbiVikXXdfocAFzUR4ZfYW38wgISs+KaLWdNN60V1rA2jlIvOLt6rCrfHpYcfo7bJVB4Lm0/uYO5KeU8vSmSicLC903XqJ92jO9Z29XMDcZcoQS2cnl2QH9q+8YpANsxfh12GgKKlYnztokx/gk/98EEIPAX9bbR0RxD2LPRqG15AoitPODmf6quryW5I4ttdEcwKBIPO+VYtRwHMYyh5g4rRoGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7w8FukSqIVjBJ0MIylivcY/uh+ohwRRwH/KMZgPiC3M=;
 b=A/UTOI1Gj4C4Q5hsKNVUeDY0VkIfVFBtZimt2jgqutGqTZ9y6JGayzfZbmCVa8WnaBiXViaSje0zxw4zuBXQJ57FCrqIm8hWGt8Dnljgj+Txj0miwKGllDypzXlDsb3OVTan4CDn9Vxc1kcL5uWGDEXaGO7vAzpEdQgSU67tnS4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=toradex.com;
Received: from PAXPR05MB8285.eurprd05.prod.outlook.com (2603:10a6:102:dd::24)
 by PA4PR05MB7885.eurprd05.prod.outlook.com (2603:10a6:102:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 20:21:20 +0000
Received: from PAXPR05MB8285.eurprd05.prod.outlook.com
 ([fe80::68c9:eb5c:2e08:f814]) by PAXPR05MB8285.eurprd05.prod.outlook.com
 ([fe80::68c9:eb5c:2e08:f814%7]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 20:21:20 +0000
From:   Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To:     linux-next@vger.kernel.org
Cc:     Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz
Date:   Tue, 13 Jul 2021 23:21:07 +0300
Message-Id: <20210713202108.449831-1-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.31.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::13) To PAXPR05MB8285.eurprd05.prod.outlook.com
 (2603:10a6:102:dd::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from cryobook.toradex.int (82.193.109.226) by PR1P264CA0026.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 20:21:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0583060-6179-498d-adad-08d9463bc6d6
X-MS-TrafficTypeDiagnostic: PA4PR05MB7885:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PA4PR05MB7885FD912A83E94922331C0DF9149@PA4PR05MB7885.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b5ABNLcn5HnXOUd0otYAKULkBsb6aiLJJL0b3pI7v52u6KkxyPoNZ8+NQgIxoD3bsLYohasyMhbmb742ecBTphupxFkXY/1edNFnosPWwpzmmBE+R2K2f7OLLQ+OuujnOH4Rnuk3ZILR0tKgEj2jK2LyIk0Y4pk9F4oZBna20uAVlUdW7qToCo7kwZ17rAClaGie8s/62BKr+phpfFynlIBhUuubqWwNDF/yTlDSepA0DzMUnQMV4rrTXmDLsdWNy/TOnXJ3EUdasv5CCe33Q7XOIVuvs5Tis6DCVwffqp/sTUquI+Iz+Y2Z5GI1U2EKazNrB+BWVaCebmseRYcBhQNrPBZCl/n/bl0UDVa1faBay2K2NTmhpp8d7shy9QuxB/zM9anjSjuC0GSyvofONCJmqr++gfIHwsGTRxpQYNJhkkegDjCrehsITKEXQde5PExF0QQRBI9tMqksAMHAzs511I3s79hFRPi48EuoUmTPxmGpeMA7vyJwwoI+NXt319cTq4scCHocnU0ApvhBGuzNoGOpaGAzimf3VLqFZ6wykcncKlmbrYTKieeTfcVrNUWfxVI2vnzWmQH92U8bNZDImk6qXY5fBs6WjragLo7bfvY57BmCkfkoIzNlRA31wAoH4G7JN0Yg+kbizb5gHI3Mscs70qys/G9jnSuXbs8CdZD0ecSEGorrsWCHjQaJ86qdhXtPc99vdlkeu6Rt2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR05MB8285.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39830400003)(396003)(376002)(346002)(86362001)(6666004)(2906002)(38100700002)(38350700002)(478600001)(6506007)(36756003)(186003)(6512007)(8676002)(6916009)(55236004)(6486002)(54906003)(66556008)(956004)(316002)(66946007)(8936002)(44832011)(7416002)(52116002)(1076003)(66476007)(2616005)(83380400001)(4326008)(5660300002)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Dv5JP5hKG8pmFWKcPHpHHA2VutG52Jy0kpxYOMFWYlKuNFdAtOJm54ikJAf?=
 =?us-ascii?Q?cg3cBoAlGSYl/wmqcQWM025Tzk2hSyGssf8N4YLvO2mxI0DmaVmxMscTBO5v?=
 =?us-ascii?Q?yAlRcMX4SsEuPAADIhwxucHg823HC+kdkBNlsjWwVnrosS2xTCi1UNch0lIX?=
 =?us-ascii?Q?6+NyScJWryGlivBrhjsB6U30a/IdOjYf2lcUfeD+94mkHqlx5fD7vFre6xfV?=
 =?us-ascii?Q?6cNDNIF8eMVRlBhWNNOgMTcF1UDIM5fJmDtOfGgUcgi/MDkNaFGwajY+cTFu?=
 =?us-ascii?Q?8yTMPnpty1TAZ57jrsHnm4aSrg9/kso7ELKUDyhF1XQDmrpDCHWvvF6FtToM?=
 =?us-ascii?Q?S47UqsLPsfli0Xc2sfw/6WcmH68dq27qjF5cgm687IRviuhwUksVSXChcXah?=
 =?us-ascii?Q?L+hIN1KQJDByIWk5v+/jFxyAlOzgTrLo1mHtn4ytm/SILmE7qASKZRnIbjWB?=
 =?us-ascii?Q?JngrWwtxF+SGMIFglBAowky6rNd6BQP06Nu0xLyK42vKY1UsvOwaPKC6c7K2?=
 =?us-ascii?Q?79YlKoUiIw5PNL4k2HopZDxOnEmFZum5Q0GYpxvhAJxASEw7xY9WUO5wIkiK?=
 =?us-ascii?Q?27AKJDa96wAdSa+IyGNLCvW5OQ2y2fY9EM/m1hDfwF7VKkGvNfIoeC6DvgAb?=
 =?us-ascii?Q?rdh/eX7bsMxLha5bzJk1cgfBvfMOg3YISa3itH/sXn3o8/CBaPblRB58jMlA?=
 =?us-ascii?Q?T2eywSmgsTQUeS1VZQ5H2U+tQJPZUmlnNHmNikSNGgTGxNGy7Xu9bf1qmK9l?=
 =?us-ascii?Q?mLgTtbQgTflXSEzs7b2p/HfzQalGFJVIs4tC73x1Tgu1Jfc3hvLmNZeLC9gZ?=
 =?us-ascii?Q?z9aRzhh7OOtpSDF3WPYySeJ2dxDDGxSErGFIOgsxODViLdngZ5qpMrI3VwYF?=
 =?us-ascii?Q?7iYjjxQNUwF+weCJdDWUpru8L1RtbT6sJZwCjqbN4XQksGntCQyAj4Mj6l2X?=
 =?us-ascii?Q?HJKJn41XTLu9989IHMVJHwHSNoyHPHp9c5Qg7k3qY8kyDeJN0STTJBRux2uX?=
 =?us-ascii?Q?er3YY8NGOIPvVTIvjbuQXpm/enBvvYuhBcNJaIGbOjyMk1f+aDlgjya6UbR5?=
 =?us-ascii?Q?H/OckbQEnqmDH+03V43Ut1WjQqElvatzlbhoRvbFIBLO2eWR8gGySdm5Wsv2?=
 =?us-ascii?Q?ieRhbUYKOcxk4k/2UhDETtIPJJ6m/oH1Hk63G1ZiAUAETahmkFkVHUg2A0wO?=
 =?us-ascii?Q?5lMmRPHF5hSVyjEcFhy0L8mLR6VQXYCx3hE+68OA6wl+9w9UiY0Unwz0gTKi?=
 =?us-ascii?Q?zhetOZXyNDtn44Z8BaQqf3QOD3J+DPeIPQaR7TwMGzJxKapl1Zr7T5agoAm7?=
 =?us-ascii?Q?MOlwtuTO7Jfg2B/JoO5qIaC3?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0583060-6179-498d-adad-08d9463bc6d6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR05MB8285.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 20:21:20.4131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nm2Ll/AMWQYue68x+K6Hfuj2gYXRADgbkj1OetNT6wWtjs7bGUfHJocULD4w78zHMAUxLv0ydEMdBuj0X4H0Y9jAMNvcemBmDufFJ1pr48Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR05MB7885
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

NXP and AzureWave don't recommend using SDIO bus mode 3.3V@50MHz due
to noise affecting the wireless throughput. Colibri iMX6ULL uses only
3.3V signaling for Wi-Fi module AW-CM276NF.

Limit the SDIO Clock on Colibri iMX6ULL to 25MHz.

Fixes: c2e4987e0e02 ("ARM: dts: imx6ull: add Toradex Colibri iMX6ULL support")
Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---

Changes in v2:
- add Fixes field
- add Reviewed-by taken from Fabio
END

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

