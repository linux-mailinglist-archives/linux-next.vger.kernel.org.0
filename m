Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBFE97CAB41
	for <lists+linux-next@lfdr.de>; Mon, 16 Oct 2023 16:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233704AbjJPOV3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Oct 2023 10:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233723AbjJPOV2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Oct 2023 10:21:28 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC57FD
        for <linux-next@vger.kernel.org>; Mon, 16 Oct 2023 07:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwcFFXrZ9QoBzoTDQ2eNbx/ARBLT33Y300dbCuA1YmdR/ubkMNOxY1s0VtHrTZ5u/Y3CncV8rF1T8tG+0zlSK42bsLEtiSb4CzrdIp/TJLJ3bFCy19u8d+z5LJg3JMPCiWoc/f/1sYZQq6Iy4Ss6v9r8w00MdZkLB/oemGwxJiO8j8vwgoKrLdzKTs4ShVOL8pmNri58X+SqFIJbCroSRn0clRZj+ZfYPRMiIEVoiH4+4vgIQP7STnWJ3j8cmHSpudpxCSg+duUxVMGvYygeMkGMwLbslSRV0Sx+rjxr/WXeT54S6OpzEkUerfIhHItHkCu7xlRYcXhhTJZTv+hnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8r8M+TYZg+nhmKHvahIAX5FVKa5fPEzXX05VndnrIQ=;
 b=fjRF+lP2nKFfQw9nWqqYBnmdwoC+lpcIDcbo+Tq1SFcRY0DUA7amTV1czyjiwXwEe6UK/+RdzfYIiNGcISIzEo25Lhar09zWUKffyG8afp2/QkQD+sSgk8LdzTX55MmR2coNPyOmNo2Sv52dpN0mcdSKpygssX7QK22nsWdZTFeN8AIaYqZ48kaNa++5qwwG07N3phteXVICGHSG/HRF4SiiLHaB/u5J3PI2K9efqAkyhcrTYJWVSCMtZlDt6VYkkO91e/FRkMa/XCKlelqvDb7a8CfAJfKcScFtpVdaCC+8knn/G50RrPEVp4Jzq8xU36PVZA+HW7c+jMdK95osTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8r8M+TYZg+nhmKHvahIAX5FVKa5fPEzXX05VndnrIQ=;
 b=iwK+lM46A/5rU8rInpJdHcryiI3dMGlXZj7vesdgi/WAc/rPLwRlCKzT7oh8S2Uif3ejmlEORfJINB4dpdipk4WwzPMwzQiIdY5kGx6Yq9BS3ac/2WJSJgtHGnf2wqt/cIXygyq7nKz2UssyjTA8JniDV6rxzKSpWzjxO7cAEME=
Received: from PH7PR17CA0047.namprd17.prod.outlook.com (2603:10b6:510:323::29)
 by BN9PR12MB5291.namprd12.prod.outlook.com (2603:10b6:408:104::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 14:21:23 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::7f) by PH7PR17CA0047.outlook.office365.com
 (2603:10b6:510:323::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Mon, 16 Oct 2023 14:21:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Mon, 16 Oct 2023 14:21:22 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 16 Oct
 2023 09:21:19 -0500
From:   Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexander.deucher@amd.com>,
        Chaitanya Dhere <chaitanya.dhere@amd.com>,
        "Roman Li" <roman.li@amd.com>
CC:     <linux-next@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
        "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>
Subject: [PATCH 2/2] drm/amd/display: Fix stack size issue on DML2
Date:   Mon, 16 Oct 2023 08:19:18 -0600
Message-ID: <20231016142031.241912-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com>
References: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|BN9PR12MB5291:EE_
X-MS-Office365-Filtering-Correlation-Id: 1998286c-f665-49fe-ff2c-08dbce532c46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LYNSIAiJwyMM9sri7qwrPLAWK7y8XughV+jAcizWi0Wx4meAiCjcFURO9zj1XB4wbx6fL3B8gUZ2qedI9h1HVkWYV00SOsI8bBolN2saqDfIKvNtSu2Qhzl1DmTV6hc5WXodlKXCU5UvGGNQ6VMcQHwc08lFq6EMbs9GOJL3dFwJgpQfQRLrAF2fHv19Km8lGsgo2A2X7eo5eSc57cEXgNhjhe9VKinTyiDvJfuDoAhpRlllw5K7MfetiOa+Qazq3lMmgoZ7pvZvuTSXTQTOtkCAI8OtMPOk3npSYoCfpkB03FCd68RPmZ6ap1zxstZemff38jXF6Yk48kYlLzf3rcD+XtG9UX7Xg9U5E0zLbEBpdUMlIJsK1JbyGuIlg96A5ImPYFjcm/GQ59dHAQtWYnvoUd6sioPDWoxpBdzzgSItmeX3dwa/cxwxmfVLQA7GlZmYQRKkAtvStT0K1NgILEouBmDZ6xEUvyxYOEzAyDPU7G1R/Mnm9hp2U2/3DV5n62zxX/wFoQRxML/87jexb551/9oFXjExBL6/Gr9ZU6DUfUIRB7LP0hJkqAgiR8mXGLWqNC4aRnH41bBhef51NIP5axxJJNEXajysUxIzEfQ3tpLTyW2OLBBa3qm2bWKDJuRoXd9HSZbWhhdZpuYU4aFAdKG4pDLxA6GzTipwItLA2qcCurU9tZ+wKG84JXwNDmpuDL+xpk/LPA3214apuCyp61alTlJGVY0TamB8yz8m6mNTVkuZsVS3CNHDakGBu1eCt0Kc452Xwm+sU4z9u1KZokK0uk38Byf1Atrz5zU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(451199024)(82310400011)(64100799003)(1800799009)(186009)(46966006)(36840700001)(40470700004)(40460700003)(40480700001)(36860700001)(82740400003)(356005)(47076005)(83380400001)(81166007)(16526019)(26005)(36756003)(70586007)(70206006)(54906003)(316002)(110136005)(478600001)(6636002)(1076003)(426003)(336012)(2616005)(41300700001)(30864003)(86362001)(2906002)(5660300002)(8936002)(8676002)(4326008)(36900700001)(44824005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:21:22.3046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1998286c-f665-49fe-ff2c-08dbce532c46
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5291
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This commit is the last part of the fix that reduces the stack size in
the DML2 code.

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Roman Li <roman.li@amd.com>
Cc: Chaitanya Dhere <chaitanya.dhere@amd.com>
Fixes: a2815ada8616 ("drm/amd/display: Introduce DML2")
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../amd/display/dc/dml2/display_mode_core.c   | 99 ++++++++++---------
 1 file changed, 54 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index 06358b7fe38b..851db026f251 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -6208,6 +6208,58 @@ static dml_uint_t CalculateMaxVStartup(
 	return max_vstartup_lines;
 }
 
+static void set_calculate_prefetch_schedule_params(struct display_mode_lib_st *mode_lib,
+						   struct CalculatePrefetchSchedule_params_st *CalculatePrefetchSchedule_params,
+						   dml_uint_t j,
+						   dml_uint_t k)
+{
+				CalculatePrefetchSchedule_params->DSCDelay = mode_lib->ms.DSCDelayPerState[k];
+				CalculatePrefetchSchedule_params->EnhancedPrefetchScheduleAccelerationFinal = mode_lib->ms.policy.EnhancedPrefetchScheduleAccelerationFinal;
+				CalculatePrefetchSchedule_params->DPPCLKDelaySubtotalPlusCNVCFormater = mode_lib->ms.ip.dppclk_delay_subtotal + mode_lib->ms.ip.dppclk_delay_cnvc_formatter;
+				CalculatePrefetchSchedule_params->DPPCLKDelaySCL = mode_lib->ms.ip.dppclk_delay_scl;
+				CalculatePrefetchSchedule_params->DPPCLKDelaySCLLBOnly = mode_lib->ms.ip.dppclk_delay_scl_lb_only;
+				CalculatePrefetchSchedule_params->DPPCLKDelayCNVCCursor = mode_lib->ms.ip.dppclk_delay_cnvc_cursor;
+				CalculatePrefetchSchedule_params->DISPCLKDelaySubtotal = mode_lib->ms.ip.dispclk_delay_subtotal;
+				CalculatePrefetchSchedule_params->DPP_RECOUT_WIDTH = (dml_uint_t)(mode_lib->ms.SwathWidthYThisState[k] / mode_lib->ms.cache_display_cfg.plane.HRatio[k]);
+				CalculatePrefetchSchedule_params->OutputFormat = mode_lib->ms.cache_display_cfg.output.OutputFormat[k];
+				CalculatePrefetchSchedule_params->MaxInterDCNTileRepeaters = mode_lib->ms.ip.max_inter_dcn_tile_repeaters;
+				CalculatePrefetchSchedule_params->GPUVMPageTableLevels = mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels;
+				CalculatePrefetchSchedule_params->GPUVMEnable = mode_lib->ms.cache_display_cfg.plane.GPUVMEnable;
+				CalculatePrefetchSchedule_params->HostVMEnable = mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
+				CalculatePrefetchSchedule_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
+				CalculatePrefetchSchedule_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
+				CalculatePrefetchSchedule_params->DynamicMetadataEnable = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataEnable[k];
+				CalculatePrefetchSchedule_params->DynamicMetadataVMEnabled = mode_lib->ms.ip.dynamic_metadata_vm_enabled;
+				CalculatePrefetchSchedule_params->DynamicMetadataLinesBeforeActiveRequired = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataLinesBeforeActiveRequired[k];
+				CalculatePrefetchSchedule_params->DynamicMetadataTransmittedBytes = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataTransmittedBytes[k];
+				CalculatePrefetchSchedule_params->UrgentLatency = mode_lib->ms.UrgLatency;
+				CalculatePrefetchSchedule_params->UrgentExtraLatency = mode_lib->ms.ExtraLatency;
+				CalculatePrefetchSchedule_params->TCalc = mode_lib->ms.TimeCalc;
+				CalculatePrefetchSchedule_params->PDEAndMetaPTEBytesFrame = mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k];
+				CalculatePrefetchSchedule_params->MetaRowByte = mode_lib->ms.MetaRowBytes[j][k];
+				CalculatePrefetchSchedule_params->PixelPTEBytesPerRow = mode_lib->ms.DPTEBytesPerRow[j][k];
+				CalculatePrefetchSchedule_params->PrefetchSourceLinesY = mode_lib->ms.PrefetchLinesY[j][k];
+				CalculatePrefetchSchedule_params->VInitPreFillY = mode_lib->ms.PrefillY[k];
+				CalculatePrefetchSchedule_params->MaxNumSwathY = mode_lib->ms.MaxNumSwY[k];
+				CalculatePrefetchSchedule_params->PrefetchSourceLinesC = mode_lib->ms.PrefetchLinesC[j][k];
+				CalculatePrefetchSchedule_params->VInitPreFillC = mode_lib->ms.PrefillC[k];
+				CalculatePrefetchSchedule_params->MaxNumSwathC = mode_lib->ms.MaxNumSwC[k];
+				CalculatePrefetchSchedule_params->swath_width_luma_ub = mode_lib->ms.swath_width_luma_ub_this_state[k];
+				CalculatePrefetchSchedule_params->swath_width_chroma_ub = mode_lib->ms.swath_width_chroma_ub_this_state[k];
+				CalculatePrefetchSchedule_params->SwathHeightY = mode_lib->ms.SwathHeightYThisState[k];
+				CalculatePrefetchSchedule_params->SwathHeightC = mode_lib->ms.SwathHeightCThisState[k];
+				CalculatePrefetchSchedule_params->TWait = mode_lib->ms.TWait;
+				CalculatePrefetchSchedule_params->DestinationLinesForPrefetch = &mode_lib->ms.LineTimesForPrefetch[k];
+				CalculatePrefetchSchedule_params->DestinationLinesToRequestVMInVBlank = &mode_lib->ms.LinesForMetaPTE[k];
+				CalculatePrefetchSchedule_params->DestinationLinesToRequestRowInVBlank = &mode_lib->ms.LinesForMetaAndDPTERow[k];
+				CalculatePrefetchSchedule_params->VRatioPrefetchY = &mode_lib->ms.VRatioPreY[j][k];
+				CalculatePrefetchSchedule_params->VRatioPrefetchC = &mode_lib->ms.VRatioPreC[j][k];
+				CalculatePrefetchSchedule_params->RequiredPrefetchPixDataBWLuma = &mode_lib->ms.RequiredPrefetchPixelDataBWLuma[k];
+				CalculatePrefetchSchedule_params->RequiredPrefetchPixDataBWChroma = &mode_lib->ms.RequiredPrefetchPixelDataBWChroma[k];
+				CalculatePrefetchSchedule_params->NotEnoughTimeForDynamicMetadata = &mode_lib->ms.support.NoTimeForDynamicMetadata[j][k];
+				CalculatePrefetchSchedule_params->Tno_bw = &mode_lib->ms.Tno_bw[k];
+}
+
 static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
 {
 	struct dml_core_mode_support_locals_st *s = &mode_lib->scratch.dml_core_mode_support_locals;
@@ -6335,57 +6387,12 @@ static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
 				dml_print("DML::%s: PrefetchMode = %u\n", __func__, mode_lib->ms.PrefetchMode[k]);
 #endif
 
-				CalculatePrefetchSchedule_params->EnhancedPrefetchScheduleAccelerationFinal = mode_lib->ms.policy.EnhancedPrefetchScheduleAccelerationFinal;
 				CalculatePrefetchSchedule_params->HostVMInefficiencyFactor = s->HostVMInefficiencyFactor;
 				CalculatePrefetchSchedule_params->myPipe = myPipe;
-				CalculatePrefetchSchedule_params->DSCDelay = mode_lib->ms.DSCDelayPerState[k];
-				CalculatePrefetchSchedule_params->DPPCLKDelaySubtotalPlusCNVCFormater = mode_lib->ms.ip.dppclk_delay_subtotal + mode_lib->ms.ip.dppclk_delay_cnvc_formatter;
-				CalculatePrefetchSchedule_params->DPPCLKDelaySCL = mode_lib->ms.ip.dppclk_delay_scl;
-				CalculatePrefetchSchedule_params->DPPCLKDelaySCLLBOnly = mode_lib->ms.ip.dppclk_delay_scl_lb_only;
-				CalculatePrefetchSchedule_params->DPPCLKDelayCNVCCursor = mode_lib->ms.ip.dppclk_delay_cnvc_cursor;
-				CalculatePrefetchSchedule_params->DISPCLKDelaySubtotal = mode_lib->ms.ip.dispclk_delay_subtotal;
-				CalculatePrefetchSchedule_params->DPP_RECOUT_WIDTH = (dml_uint_t)(mode_lib->ms.SwathWidthYThisState[k] / mode_lib->ms.cache_display_cfg.plane.HRatio[k]);
-				CalculatePrefetchSchedule_params->OutputFormat = mode_lib->ms.cache_display_cfg.output.OutputFormat[k];
-				CalculatePrefetchSchedule_params->MaxInterDCNTileRepeaters = mode_lib->ms.ip.max_inter_dcn_tile_repeaters;
 				CalculatePrefetchSchedule_params->VStartup = (dml_uint_t)(dml_min(s->MaxVStartup, s->MaximumVStartup[j][k]));
 				CalculatePrefetchSchedule_params->MaxVStartup = s->MaximumVStartup[j][k];
-				CalculatePrefetchSchedule_params->GPUVMPageTableLevels = mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels;
-				CalculatePrefetchSchedule_params->GPUVMEnable = mode_lib->ms.cache_display_cfg.plane.GPUVMEnable;
-				CalculatePrefetchSchedule_params->HostVMEnable = mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
-				CalculatePrefetchSchedule_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
-				CalculatePrefetchSchedule_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
-				CalculatePrefetchSchedule_params->DynamicMetadataEnable = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataEnable[k];
-				CalculatePrefetchSchedule_params->DynamicMetadataVMEnabled = mode_lib->ms.ip.dynamic_metadata_vm_enabled;
-				CalculatePrefetchSchedule_params->DynamicMetadataLinesBeforeActiveRequired = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataLinesBeforeActiveRequired[k];
-				CalculatePrefetchSchedule_params->DynamicMetadataTransmittedBytes = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataTransmittedBytes[k];
-				CalculatePrefetchSchedule_params->UrgentLatency = mode_lib->ms.UrgLatency;
-				CalculatePrefetchSchedule_params->UrgentExtraLatency = mode_lib->ms.ExtraLatency;
-				CalculatePrefetchSchedule_params->TCalc = mode_lib->ms.TimeCalc;
-				CalculatePrefetchSchedule_params->PDEAndMetaPTEBytesFrame = mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k];
-				CalculatePrefetchSchedule_params->MetaRowByte = mode_lib->ms.MetaRowBytes[j][k];
-				CalculatePrefetchSchedule_params->PixelPTEBytesPerRow = mode_lib->ms.DPTEBytesPerRow[j][k];
-				CalculatePrefetchSchedule_params->PrefetchSourceLinesY = mode_lib->ms.PrefetchLinesY[j][k];
-				CalculatePrefetchSchedule_params->VInitPreFillY = mode_lib->ms.PrefillY[k];
-				CalculatePrefetchSchedule_params->MaxNumSwathY = mode_lib->ms.MaxNumSwY[k];
-				CalculatePrefetchSchedule_params->PrefetchSourceLinesC = mode_lib->ms.PrefetchLinesC[j][k];
-				CalculatePrefetchSchedule_params->VInitPreFillC = mode_lib->ms.PrefillC[k];
-				CalculatePrefetchSchedule_params->MaxNumSwathC = mode_lib->ms.MaxNumSwC[k];
-				CalculatePrefetchSchedule_params->swath_width_luma_ub = mode_lib->ms.swath_width_luma_ub_this_state[k];
-				CalculatePrefetchSchedule_params->swath_width_chroma_ub = mode_lib->ms.swath_width_chroma_ub_this_state[k];
-				CalculatePrefetchSchedule_params->SwathHeightY = mode_lib->ms.SwathHeightYThisState[k];
-				CalculatePrefetchSchedule_params->SwathHeightC = mode_lib->ms.SwathHeightCThisState[k];
-				CalculatePrefetchSchedule_params->TWait = mode_lib->ms.TWait;
 				CalculatePrefetchSchedule_params->DSTXAfterScaler = &s->DSTXAfterScaler[k];
 				CalculatePrefetchSchedule_params->DSTYAfterScaler = &s->DSTYAfterScaler[k];
-				CalculatePrefetchSchedule_params->DestinationLinesForPrefetch = &mode_lib->ms.LineTimesForPrefetch[k];
-				CalculatePrefetchSchedule_params->DestinationLinesToRequestVMInVBlank = &mode_lib->ms.LinesForMetaPTE[k];
-				CalculatePrefetchSchedule_params->DestinationLinesToRequestRowInVBlank = &mode_lib->ms.LinesForMetaAndDPTERow[k];
-				CalculatePrefetchSchedule_params->VRatioPrefetchY = &mode_lib->ms.VRatioPreY[j][k];
-				CalculatePrefetchSchedule_params->VRatioPrefetchC = &mode_lib->ms.VRatioPreC[j][k];
-				CalculatePrefetchSchedule_params->RequiredPrefetchPixDataBWLuma = &mode_lib->ms.RequiredPrefetchPixelDataBWLuma[k];
-				CalculatePrefetchSchedule_params->RequiredPrefetchPixDataBWChroma = &mode_lib->ms.RequiredPrefetchPixelDataBWChroma[k];
-				CalculatePrefetchSchedule_params->NotEnoughTimeForDynamicMetadata = &mode_lib->ms.support.NoTimeForDynamicMetadata[j][k];
-				CalculatePrefetchSchedule_params->Tno_bw = &mode_lib->ms.Tno_bw[k];
 				CalculatePrefetchSchedule_params->prefetch_vmrow_bw = &mode_lib->ms.prefetch_vmrow_bw[k];
 				CalculatePrefetchSchedule_params->Tdmdl_vm = &s->dummy_single[0];
 				CalculatePrefetchSchedule_params->Tdmdl = &s->dummy_single[1];
@@ -6394,6 +6401,8 @@ static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
 				CalculatePrefetchSchedule_params->VUpdateWidthPix = &s->dummy_integer[1];
 				CalculatePrefetchSchedule_params->VReadyOffsetPix = &s->dummy_integer[2];
 
+				set_calculate_prefetch_schedule_params(mode_lib, CalculatePrefetchSchedule_params, j, k);
+
 				mode_lib->ms.support.NoTimeForPrefetch[j][k] =
 								CalculatePrefetchSchedule(&mode_lib->scratch,
 								CalculatePrefetchSchedule_params);
-- 
2.42.0

