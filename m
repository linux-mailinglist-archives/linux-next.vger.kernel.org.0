Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746637CAB40
	for <lists+linux-next@lfdr.de>; Mon, 16 Oct 2023 16:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232509AbjJPOVY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Oct 2023 10:21:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232381AbjJPOVX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Oct 2023 10:21:23 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9D9B4
        for <linux-next@vger.kernel.org>; Mon, 16 Oct 2023 07:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YvLMaY5sJ304D/NfP03y6ZVStK0YNU2SwQslFU4YXkPOkPnSj1cDSUy97EGtZtLjXDQgu0FV3Lx8tnPvu+rL/YdGlv1K4fZ0q/mkgYHouMXFFiGE7h8AIZjdmebBRo+qI6sTIHahRL4OtSBzeHPkjPY7JZPWf52ZJHzFiO1AylicSA2+BS/6vz1RPFQxtiF1fp0mSOyQuCRQe2ndZRPjYvLENKL2GJFCnz7lt9rmzda05H6GJvbahKIc9ezLRJJp1nSJjY4br+f8b52aZrV/sxu3o+rgVzpVmyVcsugss4kCvetrUEX6JumbGmzJ8G4fKRftNsQGUKNsqTgKZPutaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyCQryT1gRV6tqtrIeKKXRLR5E2VGO60iIE78e8Q8bc=;
 b=Xy6J0GuDwIWdL1oDBSJajp2dwh4LwXMSfG99cIMeRdLjZ15zM0gCF5KLN36BrvryTIJT5ph6iGoGTmuvnQsCl/0Y0LS3ML0uQUpGheIuqYWvERc3w/3gEzuH147RmMP0T3Uzo8sAnRizyt9F+CsEeXm6qy7P4uLx9iA+aTrrjqA3o9ebiaoJ0pxJbSl0kUClMpgrOAlBkre8BDbbwuwFjJTKjq87UajIacdlI70W4rgkCs0SihST/JkaBkRwQLOMK3l/AHgubx+Lf0OLeOD4obC/BNE1EHG77bcgByEVp8qBRAY1OkMYDKhJ3HqZg+RfDypWrlo7RHSecnYHFCUeuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyCQryT1gRV6tqtrIeKKXRLR5E2VGO60iIE78e8Q8bc=;
 b=X5pA67eidwk1eESoB95AUF9UhXFfcGtCCqtGB3gYyAf1/8QlwpPuHxFSl4Eyksy3I/hqBOb6hZb7eyOUEAtiwc/xYDINo3bX/nv2VBJdN40gK28mIe7+TatNHzXhkpAkA7ww+MZ5o22sNOTOWtpKDt48RiSWwGcFSb1TPu2B1c0=
Received: from PH8PR22CA0016.namprd22.prod.outlook.com (2603:10b6:510:2d1::9)
 by PH7PR12MB6933.namprd12.prod.outlook.com (2603:10b6:510:1b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Mon, 16 Oct
 2023 14:21:17 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::3a) by PH8PR22CA0016.outlook.office365.com
 (2603:10b6:510:2d1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Mon, 16 Oct 2023 14:21:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Mon, 16 Oct 2023 14:21:16 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 16 Oct
 2023 09:21:14 -0500
From:   Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexander.deucher@amd.com>,
        Chaitanya Dhere <chaitanya.dhere@amd.com>,
        "Roman Li" <roman.li@amd.com>
CC:     <linux-next@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
        "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>
Subject: [PATCH 0/2] Reduce stack size for DML2
Date:   Mon, 16 Oct 2023 08:19:16 -0600
Message-ID: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|PH7PR12MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cffbe1c-a8a1-45f5-1573-08dbce5328f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mXEq8YBbFBj2KRO7zmZBgxrpoxxrI47+TW+WouRvEa3lcyfK2Ltf64bwkO4xoKEMIEcdOSkQdOsoBbvKmyyNszzXiYCeK2YvR/ubNd8q0Ymjm2Y4ppZ5uv0S6Tk6GaHTeVQDfzVaR70/1kUmvA0R+ykqfcffnlBpKSfcIWGa+JetiUD9tiRnovUKEewJ8OprBUjcBw//MZk71NLwEY7TbmKR40tDFYvAQxozNjLUg80RV2TNW/9a1765dprkYdkF7OM/qXZm8lOt9HHVId2ZSRr2o3Ggmdagj8U7VQ3rR4boYPlGMAkeaoWqjJexfuPgVHzPTnQz3fRCwuu7XBN+EApj2zMuvDY2bAopddIULjru7b69bfpUCXRUzVMV9wDIX6CpGxi4xwRWIQtVVG2LA8uFzZ+9l6hNmrkORZXpTS+ZY2cdhKFXunfIDE6G16d2d8nbeBOUhEAaWqDRDxVD2Xa8zdOWClBHSDG4EQrpWh/E8tjSV2+S3t4gtBMDSgkFyHwBp2g/fiaJCNcr8o7DpFo3bucuPeycDLFVEXoywmNcsW2FnxPknZE5lhzB262mZA+udoDxXmeqMOR//2uio38xkoyhy/akymNo2hoqyIPscvOxMk5IR0NWqMV5uRvyX7LagN81uFJpcM2e/j5tCOUaWloRfSz12f5hW6atc4tGDJjgko90pAB5LTDm3fHuqJL45LrMayJNXv/SO2NTk3mKneor2KcQuZDe44MhsM89h2T68a0kGEeckv8FaCejGG32VvcAHbpQC3ssbxQ8Ng==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799009)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(478600001)(70586007)(70206006)(110136005)(54906003)(6636002)(2616005)(47076005)(83380400001)(36860700001)(86362001)(356005)(82740400003)(426003)(316002)(16526019)(26005)(1076003)(336012)(41300700001)(36756003)(4744005)(4326008)(8936002)(8676002)(5660300002)(2906002)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:21:16.7386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cffbe1c-a8a1-45f5-1573-08dbce5328f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6933
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen discovers a stack size issue when compiling the latest amdgpu
code with allmodconfig. This patchset addresses that issue by splitting
a large function into two smaller parts.

Thanks
Siqueira

Rodrigo Siqueira (2):
  drm/amd/display: Reduce stack size by splitting function
  drm/amd/display: Fix stack size issue on DML2

 .../amd/display/dc/dml2/display_mode_core.c   | 3289 +++++++++--------
 1 file changed, 1653 insertions(+), 1636 deletions(-)

-- 
2.42.0

