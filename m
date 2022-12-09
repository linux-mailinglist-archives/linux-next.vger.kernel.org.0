Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5B6648134
	for <lists+linux-next@lfdr.de>; Fri,  9 Dec 2022 11:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiLIK6s (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Dec 2022 05:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229696AbiLIK6q (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Dec 2022 05:58:46 -0500
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown [40.107.14.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B4D04AF02
        for <linux-next@vger.kernel.org>; Fri,  9 Dec 2022 02:58:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsbYwg1iaZm6WFVQRp2kPe0EJC46ZbRZLbPAYl+r3yNvVUdQg1+LulIMA4wwiT+5aH4oZgu29VLDtACGJpqGwVOVB3v5KiKdBC/7cF0kOaz8YhBDsUAn/HGvBp9jXQiXsPY4dmxxUjNrUk4MNQrZWbZvrJEvmjfF87oGhey6pRBz6zKdabQCBSg4Ba4DcYJAZ3la/hImCpNbslg1TcRqQJR9NzdO71Kls5RB+R7eXsgP0fS9XH3+STWH9HC6dla2I/htf5dfK6N18rzTg3fXeQlwIW8cNDQzUnLLPjDiqeTtdmGteb2rwouq8xKPAkxoiIQUSeKYhSXn5ipxJMrmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4ClazBgLsUz918ZVY/EXaU2lKR6gheDpVZGNUVrBKU=;
 b=cOe/UyEeHYfM23OgBG7oLr+x90xPYM+02VjPXHo95X734m+K2XMGYO1C2wh/S38suVOFNKh1iRrs2opqh9uLuWTkp3o+fTZcW8SLbPNjwVf/M1XIdU5y4SmceljDleXeptvgXsZUhQJFs9aZlGSUz7tTCX+0k85FOs/uhXxyki+6D4sMnmud0ul7AmgPrqKuvGcGOzczt+U0RCiqLjl/4scjvs4Nx3dGeba5wFCVoJZHF0YzhNGiuILqVBfn1qP7uC6he7l7VQzgzUvaupMxxXriFs4+cT1GXX4q1bLuOYUdRg5Ygp+5zvhkDzhynpU68uhY1KZ8WK6//FEbUs1PkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4ClazBgLsUz918ZVY/EXaU2lKR6gheDpVZGNUVrBKU=;
 b=xmKJODJi2PPI/7LOMihkgWNGIrtbZHvUs9WCGVqbwXPGoLji9XocTMGpoS+zcR0YyEm9jpv0cOZYmgKfcSNY1Gp2H4FQh3+WggSEAOQPJb5fmk+KMwa5upVlLJy5RNlYOlXZjDct9u1gBvFOTW2MyqLG3w7oDa9N+UhqxFDS9sYRcFNkxUrOw7zfjoYo+GoR3f745QR9KZCSDNzY8g40iZ/4G0N8iildgRkNQv/TQSULBHvcjH04t1NI4+1qKlG3GsxTX5r2P0KDfqAzs3QdjtWmL9+mNyOKOR/SU0XU9ULxPOqDq1HNWunwrzxKpJopHmRjeNlPLYgQRjVFCD958Q==
Received: from DB8P191CA0021.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::31)
 by AS2PR10MB6712.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:544::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Fri, 9 Dec
 2022 10:58:42 +0000
Received: from DB5EUR01FT085.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::e5) by DB8P191CA0021.outlook.office365.com
 (2603:10a6:10:130::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16 via Frontend
 Transport; Fri, 9 Dec 2022 10:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 DB5EUR01FT085.mail.protection.outlook.com (10.152.5.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.17 via Frontend Transport; Fri, 9 Dec 2022 10:58:42 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 9 Dec 2022 11:58:41 +0100
Received: from bennie-lenovo.fritz.box (139.21.146.184) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.20; Fri, 9 Dec 2022 11:58:41 +0100
From:   "B. Niedermayr" <benedikt.niedermayr@siemens.com>
To:     <linux-next@vger.kernel.org>
CC:     Benedikt Niedermayr <benedikt.niedermayr@siemens.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH] memory: omap-gpmc: fix wait pin validation
Date:   Fri, 9 Dec 2022 11:58:18 +0100
Message-ID: <20221209105817.576532-1-benedikt.niedermayr@siemens.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [139.21.146.184]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT085:EE_|AS2PR10MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e6e4d4d-2799-4eb7-26bc-08dad9d455c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +jRnk9hlUtUVxcSdd6L8tKq6s7USOq8H7oGAysEDC0QmA5VD0SL1fl3tYA7A8wziGhJ1ZQJlclxtPHPgbd+2FtADZISJNTV0DcLCob6E6K/BIHLmriwkLU+gHIMs8XiKsMk3mco6r/bfmpGCxeZnxPhh3BXRjbnAIjVo4G8E20wsRM76/K7ft7H+tRbUBCfuk9N+Zgh7ZmaWdClSQkQn/m/8EgDnCKNrZiug+qEbFQ56aqp6zDR6hP8imCAY32QOEz59PrU9J6veX0DaMzDzC3nx63et4aS0FVim2KHv/d/a5O3VKDEnpD4HZYfW6sAD6Z40xqf7P5OFVNDN2JNYdgiSiLDXVisCY53aR3gsEjlXXPOpDgoQFs2/AV7wxom9xlrFzIiaV2ghXbMNPxtZk5Ideaohh7JWwag7mA1dogtMxQy477/7Nl9j5puW3KmtN46k8OHmyM47f+ia/rB2RaMb58L0xRbcQ50sa970YXegdScMeAqFSii7i7RYlm9aBzn7Zh4CYX9ZvShP/6nDEHZjH3lsoxP11hW25UYR9QcJeRpPxS3H3NWrp3I7BOWvlRG1TwlQHXBPo1FPotj1MZQJjvwQz9GowBxiJ4ZSmhGo5jS99fqEiS9WFUqAzn+Bv/FSyNOr7msx7inZjYF68tU2FOnOr8gHSiJPT8DT+ys0v01q+s/VNMVjjXiINEpyFN7qxLY1+dNBPsh09SSI9sKYIooLWtGCI0qLrn5YCNc=
X-Forefront-Antispam-Report: CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(81166007)(2906002)(16526019)(41300700001)(336012)(8936002)(5660300002)(47076005)(83380400001)(82310400005)(40480700001)(86362001)(36756003)(36860700001)(356005)(40460700003)(82740400003)(54906003)(316002)(186003)(26005)(478600001)(6666004)(6916009)(82960400001)(70586007)(70206006)(4326008)(1076003)(956004)(2616005)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 10:58:42.0646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6e4d4d-2799-4eb7-26bc-08dad9d455c2
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT085.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6712
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RDNS_NONE,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
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
Cc: Tony Lindgren <tony@atomide.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Roger Quadros <rogerq@kernel.org>
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

