Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCDE2E2EA5
	for <lists+linux-next@lfdr.de>; Sat, 26 Dec 2020 17:31:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgLZQ3k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 26 Dec 2020 11:29:40 -0500
Received: from mail-vi1eur05on2104.outbound.protection.outlook.com ([40.107.21.104]:12423
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725995AbgLZQ3k (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 26 Dec 2020 11:29:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKWqbVwDEzEyq9kwb+jqXWtwlQ+hrezTUM35bSiz8qJUdW3KiLIm4ClkTAfNZKBQdTyYnq81ew4rSY+XtQ87fEPmiimS4bqpk7DU5u4R9bh3hDXk45k/v+HdUwirm+TTtCbnmPtd3/37yXghokE1d5MoYHS0JT73wwfwwY5xwjMq3cITMmOwBbcwJeCOeCIucDvbPTu0Hw9vz67OozkMWLL/bRBXi0pG0JSRyztVN36loOJi4+c4diNjFvaMelvb+BmuwmvLMj2S2lfMGPjGIzjT0igCrYPeq1TtV5n4KHBOIagpo6SACAUhUGPMo9R9L8C8Zj1ynoEl/LGy0fJSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7aDFdy3a0ptxxDM9/efFmxo1bnwv9w463b7E8YDPHA=;
 b=SQqllPOiMghvdn8EXvBwYdzg09l50rkCIt3IInnM+GeL66QQQC8CFcFRpACJQjwoC0/fOWHfjopqIxahJGwTZ+MLX7hHp9UX9W/2xG7gdTCLh+ilIX9uHWFDW2+e6wmQ3JHuD5gAb4brMmSHxkTF+LaB/ES5TOOIK8wF6fYNxRAB6txaHFKuRAWnB9DcjrEWSyjFT1CvJpbD/avfFgBYjzELBMO6i1CIqcb4cNWf+K8QX7X6DXfLYYAJYtAm++EEBRMggqbAHZV6eyPRDUknpgFY+RSdzHJMqTEkZ4QOhc2AqNZIyGlyc8legqViLYPWEFlcTJhUSHuYm0uINUK6sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7aDFdy3a0ptxxDM9/efFmxo1bnwv9w463b7E8YDPHA=;
 b=c4wsiCjTa6dcLARi7cWZVt4C23v8uZCrgqzZghkZ/2tWdjxJRZVeG900qqTzfpwkJhWAESX7dzcAQ493t/tOZwJFwnlylA8BvIZax9ngSzBmotWmhSX5FIe7EvOGAZE7u/76lL3nBYCEsIwYVAOq278pS2uc6BRfBbEhc+DpwjA=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=toradex.com;
Received: from AM0PR05MB6002.eurprd05.prod.outlook.com (2603:10a6:208:129::19)
 by AM0PR05MB6001.eurprd05.prod.outlook.com (2603:10a6:208:124::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Sat, 26 Dec
 2020 16:28:50 +0000
Received: from AM0PR05MB6002.eurprd05.prod.outlook.com
 ([fe80::802f:1250:dd1c:9357]) by AM0PR05MB6002.eurprd05.prod.outlook.com
 ([fe80::802f:1250:dd1c:9357%3]) with mapi id 15.20.3700.031; Sat, 26 Dec 2020
 16:28:50 +0000
From:   Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To:     linux-next@vger.kernel.org
Cc:     Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Igor Opaniuk <igor.opaniuk@toradex.com>,
        Philippe Schenker <philippe.schenker@toradex.com>,
        Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Lee Jones <lee.jones@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2] mfd: stmpe: Support disabling sub-functions
Date:   Sat, 26 Dec 2020 18:28:18 +0200
Message-Id: <20201226162818.73782-1-oleksandr.suvorov@toradex.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <bf750784-eb4a-675a-2ec4-bc52283dcc9a@pengutronix.de>
References: <bf750784-eb4a-675a-2ec4-bc52283dcc9a@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [82.193.109.226]
X-ClientProxiedBy: AM4PR0101CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:200:41::50) To AM0PR05MB6002.eurprd05.prod.outlook.com
 (2603:10a6:208:129::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from cryobook.toradex.int (82.193.109.226) by AM4PR0101CA0082.eurprd01.prod.exchangelabs.com (2603:10a6:200:41::50) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Sat, 26 Dec 2020 16:28:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6baebf9d-77bf-4be3-fcac-08d8a9bb5419
X-MS-TrafficTypeDiagnostic: AM0PR05MB6001:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR05MB60010215719029B67EF2A373F9DB0@AM0PR05MB6001.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUwraUWr8ost+bPuyiEnUBIXJmpuJm+fQiF7nE3Emi4BRXc0lrR+3i7cnKYO2/LaZJ2K93T6/AGYiV6ZHFPG7wjNHhaV+baRrDVUk1nWgMGTXtveJmPZrcNOajo3gkUW/Vj1sqdLBuGuXthwiiI3zchXZUfqVD/spV1GCfHVAs+vxkVXIypymhntSSs7PdSYb/HiIHOa68w483IoXhMrya6gW27fN1lS7tMBUiqWeqMAjP6s0VTzAA8wVuEBx8SsyAn/MSxfzke/Mdx54K4DeTZErfYQyuSXK1jCBdd+l3WaMhM9F0licJN3Zwfv1X9x2fiJNLlEyOZ0m565RohDfCS5AGo5+a9n1KqUibjoTQcv2nEfwVzomhcwx/UnLUz4DfcPZeFwoIFilhWPe0LixA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR05MB6002.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(136003)(396003)(366004)(346002)(2616005)(956004)(44832011)(478600001)(36756003)(1076003)(52116002)(6666004)(6916009)(8936002)(4744005)(66476007)(66556008)(66946007)(26005)(55236004)(2906002)(54906003)(5660300002)(86362001)(6512007)(6506007)(83380400001)(4326008)(186003)(16526019)(316002)(8676002)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?xkAke/vY4++xQpzvoES7Z3QwYnTYdYpBdIfxIIPpfdg+LYgflNUaAJUagAYV?=
 =?us-ascii?Q?1DFNMmhfdDasoPjXA9mJ700j+cCe3j9ZKbyln81Q1UOVC8GYrSSZafpHGmqe?=
 =?us-ascii?Q?uGYeMhlTRJiXo7Q570Bcdhmsi4uflZdSl6ifdQeOSDqtnyb/Km3LyDkCzbCb?=
 =?us-ascii?Q?+IelrNI9kXRepJ4hoUPB+a3b9z0ujmOFNb/g6bQoC4OHLf4srr8Kfi6LgwP3?=
 =?us-ascii?Q?sNOiOdLkxlQH0LDB/bjue/DPkbd7OQKtHaWnuqu6uKSVSU9K83KlPFx3cMTa?=
 =?us-ascii?Q?ceDntMci8ftsGCr0IAdNBSQ3J7P6COccyua/Qjy2NrAks2jRNWQyJGH99lw/?=
 =?us-ascii?Q?GssjSmWB5vdpvIK/s3Zs1q7h2wZzoIT5I9sJTwjGjReofyphV03cXHxb+KpJ?=
 =?us-ascii?Q?BdqXbNRao6qadO6YbjThAIuormZvU6+JPQ21atfWjcWBNyMSeD57/+hUsM+T?=
 =?us-ascii?Q?vu3BQjgpavDEz2omYMJROgER0r+hY2H8fHx0aIyRdd+b7KNMtmixmiCq3cO/?=
 =?us-ascii?Q?+kt+x9Bs/wi6kZilNn7z+5iytgQLevGHITcdlsvUQxaqLxtgOvqRzPUZMBf4?=
 =?us-ascii?Q?Ef3EiHImn5KqLsI3sLkxZcQd7sLDvGN1YqrfilLDqvm3GANdK50HoTL0jx2e?=
 =?us-ascii?Q?FlKkpFAe6BFVidBHIuxVtlnjcbWXn8OCDDpIRXM7iTsZ7nv0mnLnOM/JAmKV?=
 =?us-ascii?Q?By45PWlXrgJ+41b6Oqn9ZMQ6rOUOGd3Retni2e/+6EkKZWfvV4hxP9u/VxZm?=
 =?us-ascii?Q?W21MN7hXwN4wpPci+1ZwOmW0WHXO5SbVDPh/Ch7k3DlumL3EWcNrqmh97wct?=
 =?us-ascii?Q?FNOxVMhg6UJgynZ1vl27TfeCvRJq6BM3Pwc47Wsq6CQaJND45oTOMtrsN2KW?=
 =?us-ascii?Q?IcU0GGKrchpSPKZbTMlo1/F7WDN1ewRAiSmsk82g4mSobzXNDScvhHGaRanH?=
 =?us-ascii?Q?V56bc8g6JtSJjwQA0ix/ht6ihf4jkICTD/jC2a4OsjI31FCNwVg8LvJ8V4z6?=
 =?us-ascii?Q?g1nF?=
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthSource: AM0PR05MB6002.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2020 16:28:50.6613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-Network-Message-Id: 6baebf9d-77bf-4be3-fcac-08d8a9bb5419
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRd1b5n9aNazkBN2McVhcBC143bGk5N6ANli/qomvGisp53MGMsooONBin37LwQ5CISnY4OnY7gbcqoYrbZH27L+KDmK4r25ue5JTxCpgIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB6001
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Add support of sub-functions disabling. It allows one to define
an stmpe sub-function device in devicetree, but keep it disabled.

Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
---

Changes in v2:
Use for_each_available_child_of_node() instead of checking
of_device_is_available() for each node.
Thanks for Ahmad Fatoum a.fatoum@pengutronix.de for and idea

 drivers/mfd/stmpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
index 90f3292230c9..3e4f32673db3 100644
--- a/drivers/mfd/stmpe.c
+++ b/drivers/mfd/stmpe.c
@@ -1357,7 +1357,7 @@ static void stmpe_of_probe(struct stmpe_platform_data *pdata,
 
 	pdata->autosleep = (pdata->autosleep_timeout) ? true : false;
 
-	for_each_child_of_node(np, child) {
+	for_each_available_child_of_node(np, child) {
 		if (of_node_name_eq(child, "stmpe_gpio")) {
 			pdata->blocks |= STMPE_BLOCK_GPIO;
 		} else if (of_node_name_eq(child, "stmpe_keypad")) {
-- 
2.29.2

