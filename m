Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8722C6481B1
	for <lists+linux-next@lfdr.de>; Fri,  9 Dec 2022 12:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiLIL3a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Dec 2022 06:29:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiLIL33 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2022 06:29:29 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2041.outbound.protection.outlook.com [40.107.8.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441C2396CA
        for <linux-next@vger.kernel.org>; Fri,  9 Dec 2022 03:29:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XYN5hc145WLvfnmzyNjO73Yoqn2NfSupPVLEGBJ/ievzWJ1UT5oOSsEqTmh9fpU0bSt8l8UPUhyX+5nPRkukuA0ZoKN31FVFuQoQIZhvRh6jvDRECoRNobM9GhFlnqlXf/7wwkP9PUdRc9Fwnv+6TySIuvpDubww7eUMJhKf4pn+aPJ0BdEAY5Hkw5EWKHYhG+z7YBbkaW6joKyG7ZTLUywEfPtyszMpU4nRj5sPiXFWN3Yja4H9HFFWYx8jpC/DefSXe8d9G1g/675b0HPH14jQHFeJRBwC6qgn301+O6Vqgoa2KNqU4i7sULMQZyYIkljG0fqQmdEzz6LsLdH9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7jaFHi0m/L+U7D7vTpKFCe0BHGggnUYstSiKm6UX8E=;
 b=d80iLN16mnbkywk6VPJdkFJ41JaDua2f9KUdye9lsd3KujuWAclLhJBhjmkZufVDDnenut2NjRZsOc8nu0dMOZ3G7ZgCNqYrRO83jM4PnyOcjSGWr+39TMjASZH+2fX0xBjBk6yosJvckEwTySL8gMzU+97WuGB0ERt749gictm/Dak/ccKvW96FDRjVYt8cawDv+n6W+paUn/Xih935iCvUdFSyYhykV1L/E8DBFI9zi0bhRY6pEKD1/ynsdhXY9vuKXsmIIBt5VeWOk/w2yS3F2VreVw0rFvDz1LL0zkzBayna1ml0hQ24aDsCYQgF4cKc7UKuE4174OPuL5VAow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7jaFHi0m/L+U7D7vTpKFCe0BHGggnUYstSiKm6UX8E=;
 b=KVKS144OQrUZuNvJRCVX6aTHjxMM5avbNBAR5vDn5j1zY1vqBy+vB2iV4cKRx6aglbQP4oYrN/K83gUbVkfyA04qH29/tmNVSlI9yQEtx66Wr5kS57FkgXajosLMZKRwb75bnQEGoINkyfbe5CoWD3ouuoRkW+kgwDsNjcBQX0XPq4NrmOUtJGlTGZFNEWP3Js5otFN/hqv/kYlHnDUSfch6+9tRjiw87Gb6YKirTD4LjybtjxeJnP4jRQzi0EaQWt/xE0zHX+/q+iZbhjpF9nYLwYNforkc0dsxKqCHDI4Bvo94yPe6RArb2GE2kOk3Ugi6jcVuV3Rp8C8dLKdc9g==
Received: from GV3P280CA0049.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::32) by
 AS2PR10MB7686.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:645::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Fri, 9 Dec
 2022 11:29:25 +0000
Received: from HE1EUR01FT004.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:9:cafe::d7) by GV3P280CA0049.outlook.office365.com
 (2603:10a6:150:9::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18 via Frontend
 Transport; Fri, 9 Dec 2022 11:29:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 HE1EUR01FT004.mail.protection.outlook.com (10.152.1.233) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.10 via Frontend Transport; Fri, 9 Dec 2022 11:29:25 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 9 Dec 2022 12:29:25 +0100
Received: from bennie-lenovo.fritz.box (139.21.146.182) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 9 Dec 2022 12:29:24 +0100
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-next@vger.kernel.org>
CC:     <krzysztof.kozlowski@linaro.org>, <tony@atomide.com>,
        <robh+dt@kernel.org>,
        Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Subject: [PATCH v2] memory: omap-gpmc: fix wait pin validation
Date:   Fri, 9 Dec 2022 12:28:28 +0100
Message-ID: <20221209112828.581491-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.182]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT004:EE_|AS2PR10MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: 66fa082a-da71-4b18-7edf-08dad9d8a071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D3nOzQCRJuxNY3N9HanH3kiR7qv1+JCNUNb4RNU948IG8M9HJDNCS7bpRK4s1dIFWv0zHSTDq+hqxn8FtZnqcjMWKAAJ0ngGx0Ii5v7wVO7Uue+5dGHca9QEujBv0p0yryfSIP31FeBV04LLMmZkB1HF/p9ibhieqDf2mOWuL/tsK9y/5lWcL+BoAoLMi9I+nR6yGC33yYmMGQIqGKuOsAPPE24JJELOAi/fRCxrXbpTwNXyRiIG/QBKiwZHxJzmmFjFkplvlPQmBYH7Pgp4V1c4zt0jjQ17PbPg04A7Lle8T2wSsj5yfrFdBXE/nJk+2kaEgSYjTZV+J6LTYmoeHlCobH1EMbxbNU3DbUX5+hYLHVOChcTSnKXFXkVdQGZBuYBAHxT9N3hgJpYIzwgp6/EsPYZxHJgxtvba6Lsc8CIeLh5WJ7QMpL0BoUq882jeGc4Oah0vACDjQ7jEoqg+Y63jdWP0Pu9SXg8dXee+aJLSbPFYmKjBJ5qbY9JQ+iIwVNydcv7gAA8Fr9Eggfs3joD2sZuNvGoGN4jLRFh23u539eIF0zQfqMAU8cu4wNxqZJhqZ3MFAG7gC0CLt/Co3SGdMjnZD6GKBmCbpsCZrSlJ1Jd4BHsd2r4s5j3cYWk1w7mMrdRVXdl1iXFvE+9+gU4QzZjHzZbUGTI7zxycbWgHtlALZ/rEe+N7G62JAPK/Y4KkpSj9rod0m0ENeoWKIUHh+cK4LZA2Xi6BX0OTkx0=
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(36860700001)(2906002)(82740400003)(82960400001)(2616005)(40460700003)(5660300002)(8936002)(47076005)(186003)(956004)(336012)(83380400001)(16526019)(86362001)(82310400005)(40480700001)(1076003)(356005)(81166007)(316002)(6916009)(26005)(4326008)(54906003)(478600001)(41300700001)(8676002)(70586007)(107886003)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 11:29:25.3208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fa082a-da71-4b18-7edf-08dad9d8a071
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT004.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7686
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>

This bug has been introduced after switching from -1 to UINT_MAX
for GPMC_WAITPIN_INVALID.

The bug leads to an error when the optional gpmc,wait-pin
dt-property is not used:

...
gpmc_cs_program_settings: invalid wait-pin (-1)
...

Signed-off-by: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Fixes: 8dd7e4af5853 ("memory: omap-gpmc: fix coverity issue "Control flow issues"")
Cc: Rob Herring <robh+dt@kernel.org>
---
 drivers/memory/omap-gpmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
index 57d9f91fe89b..d78f73db37c8 100644
--- a/drivers/memory/omap-gpmc.c
+++ b/drivers/memory/omap-gpmc.c
@@ -1918,7 +1918,8 @@ int gpmc_cs_program_settings(int cs, struct gpmc_settings *p)
 		}
 	}
 
-	if (p->wait_pin > gpmc_nr_waitpins) {
+	if (p->wait_pin != GPMC_WAITPIN_INVALID &&
+	    p->wait_pin > gpmc_nr_waitpins) {
 		pr_err("%s: invalid wait-pin (%d)\n", __func__, p->wait_pin);
 		return -EINVAL;
 	}
-- 
2.25.1

