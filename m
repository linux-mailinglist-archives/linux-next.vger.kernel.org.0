Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 093DD7CAB44
	for <lists+linux-next@lfdr.de>; Mon, 16 Oct 2023 16:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232381AbjJPOVh (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Oct 2023 10:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbjJPOVg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Oct 2023 10:21:36 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7829F
        for <linux-next@vger.kernel.org>; Mon, 16 Oct 2023 07:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAIVzmz4f7za+15IoyjSD5GHDXhKJWVvAwkduhvRrAgLd8+MVAbKeOOf05b75dok1r7YVoqOG7svPdq7vBYnGYVm9gMTn44+y3/7mF/IQ/RsjWfFh5C8FAgliBmIyqSEIBDHh35r2U02yelSGI0KTvMAoUmBdUQTfEBgaAdDpKWekN+aXHpc+yZ5lh4FQB3o2Gu8RRD0akQqqGt8EZERuQXiopA49GH/t8Q0Z82E68UNzwr4bICbcp844syz8esqNxgXV3Ld26lr+ELdYdEmOay8v55Opy5n6lgjkOYn1uiujE5xMim0++n8zBn+CkZ5YBsBCuZDf376wBHF4GWMbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZB+AFZti4iOXwK5Tgi+up9tcvwKX7sbNqGHAtImsK4U=;
 b=PxqCkAYbaxQT7v4TNxHtmdesvnbvGnDIn1bttc4dd+dn1reO6YSCsoTB4LW77yVspHw2DZqUWq/6+1O2Np4na4fYItjjLgf1cQmN8pNYq1FBAjNnUtB5Ij0wHToq1L/lvX6EtayKnDXsMODA9vsiliT/ogv6JeXjg2IkSqJkxut8jt6m7YvbCnTglbA23AKl+jIuDuvkKVBngnX8X7MydckTw8cTMh6OnjO68B/9oxi+6lB/jold8TuYaABm6XDDCw5Znl+pwtE45PnAwjp9WQEQsEtLGKF/HvR+fsOmvDrdCVE7vbQglPKum3ScrqdkLnh+f98CivFs8T6azMawDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=canb.auug.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB+AFZti4iOXwK5Tgi+up9tcvwKX7sbNqGHAtImsK4U=;
 b=iCGP7zmtMNN9huuNp1Z/yqdHqFt/TZKl4qvic/6up+SXcaY58GtuOait1O7r3vE1WhiF2TOQhCsse4eRduw/ClDQbYt50VOOuDxb4sy7QZ0s8gQsQGId93ApZVquPXwKkeaQ8TM8s5jO/e3ySmJdEs3ztrREdKbzYbCCcfjXZWA=
Received: from PH7PR17CA0034.namprd17.prod.outlook.com (2603:10b6:510:323::12)
 by DM4PR12MB6373.namprd12.prod.outlook.com (2603:10b6:8:a4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.35; Mon, 16 Oct 2023 14:21:21 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::4f) by PH7PR17CA0034.outlook.office365.com
 (2603:10b6:510:323::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35 via Frontend
 Transport; Mon, 16 Oct 2023 14:21:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Mon, 16 Oct 2023 14:21:19 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 16 Oct
 2023 09:21:16 -0500
From:   Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexander.deucher@amd.com>,
        Chaitanya Dhere <chaitanya.dhere@amd.com>,
        "Roman Li" <roman.li@amd.com>
CC:     <linux-next@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
        "Rodrigo Siqueira" <Rodrigo.Siqueira@amd.com>
Subject: [PATCH 1/2] drm/amd/display: Reduce stack size by splitting function
Date:   Mon, 16 Oct 2023 08:19:17 -0600
Message-ID: <20231016142031.241912-2-Rodrigo.Siqueira@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DM4PR12MB6373:EE_
X-MS-Office365-Filtering-Correlation-Id: d51a0beb-36ff-460d-d48b-08dbce532ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDMetbc6QDo+eEdE/3OttrhJ0jxnZEO8tbrzKIKWAheW0tHPGj+xgnfNQOXgeKPOElkEKl5RjG8eshFVgSSiiAWLr6p9eTGu3KWMYBbNluSCaIk3A+Co2t8TfJom8mqA6pEZxtMj07jvrBlHy0KEbgzvDDT6/LumdGoYGeqfWwl5Xxa0H694AAL+86b2dLZeTtpHYPDlC0JTlSje9eBBXFncBd+4WJg/zJ6GI1BYMUzUZ1uDJAoQJW0YoXY+Dbhc+Zb4eOBgyieY43PFE9JHDeglb/hINAWbvEMZQgTtHhqWW2Axstjm1144KL/cF8aIZZ7S9Mvyer8JppoBgGf1DT/fSyspYho4KJCo14sltwkMxCuR72MjEnM1VXP7ckpcR4XDNSYAWlhCp6tZ29WP3R0H6XJpxHamUvUT0LLbpoYSquFMg2oF1MieBZ/kcx7PNGwZjOWgnDuvaamm1DeoNMZ5yr7tgsz94FV7XFv6oK0qcw2ycxYMSqZOHMorwdgLFoNhSa1zangTwGNhLGEAj4G3AugWbXkFQ4RrkqGUeqgpsio9q6nwUmj0JWWKMlq6hD7n6y7EAoTxX90GESu8Kn6PILkUOjqh9NIvoYiVTnGXUztua9SI/zhb+qIJHf3IPYEwKUhL66LxgcFulif87bb9PmhmQsaQmXglq1Bp9+Lvw0yl5nnR59VlxpowY8adkKlk3FD7r0Widmn0YEH3cZlDov9X0C+47D8HA1bLhqDtMWo585qjtR+fc25fFQ4xC1hEJx2sup0HWpCZgTp94xMWligqsDtqaCye5hAPbxk=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(16526019)(1076003)(26005)(2616005)(336012)(82740400003)(426003)(8676002)(8936002)(4326008)(66899024)(5660300002)(47076005)(83380400001)(81166007)(40480700001)(41300700001)(356005)(478600001)(86362001)(110136005)(30864003)(2906002)(36860700001)(316002)(6636002)(70206006)(36756003)(54906003)(70586007)(36900700001)(579004)(559001)(44824005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 14:21:19.6639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d51a0beb-36ff-460d-d48b-08dbce532ab8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6373
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

When compiling with allmodconfig, gcc highlights the following error:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In function 'dml_core_mode_support':
drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:8229:1: error: the frame size of 2736 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
 8229 | } // dml_core_mode_support
      | ^
cc1: all warnings being treated as errors

This commit mitigates part of this problem by extracting the prefetch
code to its own function. After applying this commit, the stack size
reduces from 2736 to 2464, however, the stack size issue becomes part of
the new function.

Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Roman Li <roman.li@amd.com>
Cc: Chaitanya Dhere <chaitanya.dhere@amd.com>
Fixes: a2815ada8616 ("drm/amd/display: Introduce DML2")
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../amd/display/dc/dml2/display_mode_core.c   | 3284 +++++++++--------
 1 file changed, 1646 insertions(+), 1638 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
index fddd52f3f601..06358b7fe38b 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
@@ -6208,1822 +6208,1830 @@ static dml_uint_t CalculateMaxVStartup(
 	return max_vstartup_lines;
 }
 
-/// @brief The Mode Support function.
-dml_bool_t dml_core_mode_support(struct display_mode_lib_st *mode_lib)
+static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
 {
 	struct dml_core_mode_support_locals_st *s = &mode_lib->scratch.dml_core_mode_support_locals;
-	struct CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_params_st *CalculateWatermarks_params = &mode_lib->scratch.CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_params;
-	struct CalculateVMRowAndSwath_params_st *CalculateVMRowAndSwath_params = &mode_lib->scratch.CalculateVMRowAndSwath_params;
-	struct UseMinimumDCFCLK_params_st *UseMinimumDCFCLK_params = &mode_lib->scratch.UseMinimumDCFCLK_params;
-	struct CalculateSwathAndDETConfiguration_params_st *CalculateSwathAndDETConfiguration_params = &mode_lib->scratch.CalculateSwathAndDETConfiguration_params;
 	struct CalculatePrefetchSchedule_params_st *CalculatePrefetchSchedule_params = &mode_lib->scratch.CalculatePrefetchSchedule_params;
+	struct CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_params_st *CalculateWatermarks_params = &mode_lib->scratch.CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport_params;
 	struct DmlPipe *myPipe;
+	dml_uint_t j, k;
 
-	dml_uint_t j, k, m;
-
-	mode_lib->ms.num_active_planes = dml_get_num_active_planes(&mode_lib->ms.cache_display_cfg);
-	dml_print("DML::%s: num_active_planes = %u\n", __func__, mode_lib->ms.num_active_planes);
-
-	CalculateMaxDETAndMinCompressedBufferSize(
-								mode_lib->ms.ip.config_return_buffer_size_in_kbytes,
-								mode_lib->ms.ip.config_return_buffer_segment_size_in_kbytes,
-								mode_lib->ms.ip.rob_buffer_size_kbytes,
-								mode_lib->ms.ip.max_num_dpp,
-								mode_lib->ms.policy.NomDETInKByteOverrideEnable,   // VBA_DELTA
-								mode_lib->ms.policy.NomDETInKByteOverrideValue,    // VBA_DELTA
+	for (j = 0; j < 2; ++j) {
+		mode_lib->ms.TimeCalc = 24 / mode_lib->ms.ProjectedDCFCLKDeepSleep[j];
 
-								/* Output */
-								&mode_lib->ms.MaxTotalDETInKByte,
-								&mode_lib->ms.NomDETInKByte,
-								&mode_lib->ms.MinCompressedBufferSizeInKByte);
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			mode_lib->ms.NoOfDPPThisState[k] = mode_lib->ms.NoOfDPP[j][k];
+			mode_lib->ms.swath_width_luma_ub_this_state[k] = mode_lib->ms.swath_width_luma_ub_all_states[j][k];
+			mode_lib->ms.swath_width_chroma_ub_this_state[k] = mode_lib->ms.swath_width_chroma_ub_all_states[j][k];
+			mode_lib->ms.SwathWidthYThisState[k] = mode_lib->ms.SwathWidthYAllStates[j][k];
+			mode_lib->ms.SwathWidthCThisState[k] = mode_lib->ms.SwathWidthCAllStates[j][k];
+			mode_lib->ms.SwathHeightYThisState[k] = mode_lib->ms.SwathHeightYAllStates[j][k];
+			mode_lib->ms.SwathHeightCThisState[k] = mode_lib->ms.SwathHeightCAllStates[j][k];
+			mode_lib->ms.UnboundedRequestEnabledThisState = mode_lib->ms.UnboundedRequestEnabledAllStates[j];
+			mode_lib->ms.CompressedBufferSizeInkByteThisState = mode_lib->ms.CompressedBufferSizeInkByteAllStates[j];
+			mode_lib->ms.DETBufferSizeInKByteThisState[k] = mode_lib->ms.DETBufferSizeInKByteAllStates[j][k];
+			mode_lib->ms.DETBufferSizeYThisState[k] = mode_lib->ms.DETBufferSizeYAllStates[j][k];
+			mode_lib->ms.DETBufferSizeCThisState[k] = mode_lib->ms.DETBufferSizeCAllStates[j][k];
+		}
 
-	PixelClockAdjustmentForProgressiveToInterlaceUnit(&mode_lib->ms.cache_display_cfg, mode_lib->ms.ip.ptoi_supported);
+		mode_lib->ms.support.VActiveBandwithSupport[j] = CalculateVActiveBandwithSupport(
+			mode_lib->ms.num_active_planes,
+			mode_lib->ms.ReturnBWPerState[j],
+			mode_lib->ms.NotUrgentLatencyHiding,
+			mode_lib->ms.ReadBandwidthLuma,
+			mode_lib->ms.ReadBandwidthChroma,
+			mode_lib->ms.cursor_bw,
+			mode_lib->ms.meta_row_bandwidth_this_state,
+			mode_lib->ms.dpte_row_bandwidth_this_state,
+			mode_lib->ms.NoOfDPPThisState,
+			mode_lib->ms.UrgentBurstFactorLuma,
+			mode_lib->ms.UrgentBurstFactorChroma,
+			mode_lib->ms.UrgentBurstFactorCursor);
 
+		s->VMDataOnlyReturnBWPerState = dml_get_return_bw_mbps_vm_only(
+																	&mode_lib->ms.soc,
+																	mode_lib->ms.state.use_ideal_dram_bw_strobe,
+																	mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
+																	mode_lib->ms.DCFCLKState[j],
+																	mode_lib->ms.state.fabricclk_mhz,
+																	mode_lib->ms.state.dram_speed_mts);
 
-	/*MODE SUPPORT, VOLTAGE STATE AND SOC CONFIGURATION*/
+		s->HostVMInefficiencyFactor = 1;
+		if (mode_lib->ms.cache_display_cfg.plane.GPUVMEnable && mode_lib->ms.cache_display_cfg.plane.HostVMEnable)
+			s->HostVMInefficiencyFactor = mode_lib->ms.ReturnBWPerState[j] / s->VMDataOnlyReturnBWPerState;
 
-	/*Scale Ratio, taps Support Check*/
-	mode_lib->ms.support.ScaleRatioAndTapsSupport = true;
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (mode_lib->ms.cache_display_cfg.plane.ScalerEnabled[k] == false
-				&& ((mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_64
-						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_32
-						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_16
-						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_mono_16
-						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_mono_8
-						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_rgbe
-						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_rgbe_alpha)
-						|| mode_lib->ms.cache_display_cfg.plane.HRatio[k] != 1.0
-						|| mode_lib->ms.cache_display_cfg.plane.HTaps[k] != 1.0
-						|| mode_lib->ms.cache_display_cfg.plane.VRatio[k] != 1.0
-						|| mode_lib->ms.cache_display_cfg.plane.VTaps[k] != 1.0)) {
-			mode_lib->ms.support.ScaleRatioAndTapsSupport = false;
-		} else if (mode_lib->ms.cache_display_cfg.plane.VTaps[k] < 1.0 || mode_lib->ms.cache_display_cfg.plane.VTaps[k] > 8.0
-				|| mode_lib->ms.cache_display_cfg.plane.HTaps[k] < 1.0 || mode_lib->ms.cache_display_cfg.plane.HTaps[k] > 8.0
-				|| (mode_lib->ms.cache_display_cfg.plane.HTaps[k] > 1.0 && (mode_lib->ms.cache_display_cfg.plane.HTaps[k] % 2) == 1)
-				|| mode_lib->ms.cache_display_cfg.plane.HRatio[k] > mode_lib->ms.ip.max_hscl_ratio
-				|| mode_lib->ms.cache_display_cfg.plane.VRatio[k] > mode_lib->ms.ip.max_vscl_ratio
-				|| mode_lib->ms.cache_display_cfg.plane.HRatio[k] > mode_lib->ms.cache_display_cfg.plane.HTaps[k]
-				|| mode_lib->ms.cache_display_cfg.plane.VRatio[k] > mode_lib->ms.cache_display_cfg.plane.VTaps[k]
-				|| (mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_64
-					&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_32
-					&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_16
-					&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_mono_16
-					&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_mono_8
-					&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_rgbe
-					&& (mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k] < 1 || mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k] > 8 || mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k] < 1 || mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k] > 8 ||
-						(mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k] > 1 && mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k] % 2 == 1) ||
-					mode_lib->ms.cache_display_cfg.plane.HRatioChroma[k] > mode_lib->ms.ip.max_hscl_ratio ||
-					mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k] > mode_lib->ms.ip.max_vscl_ratio ||
-					mode_lib->ms.cache_display_cfg.plane.HRatioChroma[k] > mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k] ||
-					mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k] > mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k]))) {
-			mode_lib->ms.support.ScaleRatioAndTapsSupport = false;
-		}
-	}
+		mode_lib->ms.ExtraLatency = CalculateExtraLatency(
+				mode_lib->ms.soc.round_trip_ping_latency_dcfclk_cycles,
+				s->ReorderingBytes,
+				mode_lib->ms.DCFCLKState[j],
+				mode_lib->ms.TotalNumberOfActiveDPP[j],
+				mode_lib->ms.ip.pixel_chunk_size_kbytes,
+				mode_lib->ms.TotalNumberOfDCCActiveDPP[j],
+				mode_lib->ms.ip.meta_chunk_size_kbytes,
+				mode_lib->ms.ReturnBWPerState[j],
+				mode_lib->ms.cache_display_cfg.plane.GPUVMEnable,
+				mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
+				mode_lib->ms.num_active_planes,
+				mode_lib->ms.NoOfDPPThisState,
+				mode_lib->ms.dpte_group_bytes,
+				s->HostVMInefficiencyFactor,
+				mode_lib->ms.soc.hostvm_min_page_size_kbytes,
+				mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels);
 
-	/*Source Format, Pixel Format and Scan Support Check*/
-	mode_lib->ms.support.SourceFormatPixelAndScanSupport = true;
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-			if (mode_lib->ms.cache_display_cfg.surface.SurfaceTiling[k] == dml_sw_linear && (!(!dml_is_vertical_rotation(mode_lib->ms.cache_display_cfg.plane.SourceScan[k])) || mode_lib->ms.cache_display_cfg.surface.DCCEnable[k] == true)) {
-			mode_lib->ms.support.SourceFormatPixelAndScanSupport = false;
+		s->NextMaxVStartup = s->MaxVStartupAllPlanes[j];
+		s->MaxVStartup = 0;
+		s->AllPrefetchModeTested = true;
+		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+			CalculatePrefetchMode(mode_lib->ms.policy.AllowForPStateChangeOrStutterInVBlank[k], &s->MinPrefetchMode[k], &s->MaxPrefetchMode[k]);
+			s->NextPrefetchMode[k] = s->MinPrefetchMode[k];
 		}
-	}
-
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		CalculateBytePerPixelAndBlockSizes(
-								mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k],
-								mode_lib->ms.cache_display_cfg.surface.SurfaceTiling[k],
-
-								/* Output */
-								&mode_lib->ms.BytePerPixelY[k],
-								&mode_lib->ms.BytePerPixelC[k],
-								&mode_lib->ms.BytePerPixelInDETY[k],
-								&mode_lib->ms.BytePerPixelInDETC[k],
-								&mode_lib->ms.Read256BlockHeightY[k],
-								&mode_lib->ms.Read256BlockHeightC[k],
-								&mode_lib->ms.Read256BlockWidthY[k],
-								&mode_lib->ms.Read256BlockWidthC[k],
-								&mode_lib->ms.MacroTileHeightY[k],
-								&mode_lib->ms.MacroTileHeightC[k],
-								&mode_lib->ms.MacroTileWidthY[k],
-								&mode_lib->ms.MacroTileWidthC[k]);
-	}
 
-	/*Bandwidth Support Check*/
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (!dml_is_vertical_rotation(mode_lib->ms.cache_display_cfg.plane.SourceScan[k])) {
-			mode_lib->ms.SwathWidthYSingleDPP[k] = mode_lib->ms.cache_display_cfg.plane.ViewportWidth[k];
-			mode_lib->ms.SwathWidthCSingleDPP[k] = mode_lib->ms.cache_display_cfg.plane.ViewportWidthChroma[k];
-		} else {
-			mode_lib->ms.SwathWidthYSingleDPP[k] = mode_lib->ms.cache_display_cfg.plane.ViewportHeight[k];
-			mode_lib->ms.SwathWidthCSingleDPP[k] = mode_lib->ms.cache_display_cfg.plane.ViewportHeightChroma[k];
-		}
-	}
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		mode_lib->ms.ReadBandwidthLuma[k] = mode_lib->ms.SwathWidthYSingleDPP[k] * dml_ceil(mode_lib->ms.BytePerPixelInDETY[k], 1.0) / (mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * mode_lib->ms.cache_display_cfg.plane.VRatio[k];
-		mode_lib->ms.ReadBandwidthChroma[k] = mode_lib->ms.SwathWidthYSingleDPP[k] / 2 * dml_ceil(mode_lib->ms.BytePerPixelInDETC[k], 2.0) / (mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * mode_lib->ms.cache_display_cfg.plane.VRatio[k] / 2.0;
-	}
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true
-				&& mode_lib->ms.cache_display_cfg.writeback.WritebackPixelFormat[k] == dml_444_64) {
-			mode_lib->ms.WriteBandwidth[k] = mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[k]
-					* mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationHeight[k]
-					/ (mode_lib->ms.cache_display_cfg.writeback.WritebackSourceHeight[k]
-							* mode_lib->ms.cache_display_cfg.timing.HTotal[k]
-							/ mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * 8.0;
-		} else if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true) {
-			mode_lib->ms.WriteBandwidth[k] = mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[k]
-					* mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationHeight[k]
-					/ (mode_lib->ms.cache_display_cfg.writeback.WritebackSourceHeight[k]
-							* mode_lib->ms.cache_display_cfg.timing.HTotal[k]
-							/ mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * 4.0;
-		} else {
-			mode_lib->ms.WriteBandwidth[k] = 0.0;
-		}
-	}
+		do {
+			s->MaxVStartup = s->NextMaxVStartup;
+			s->AllPrefetchModeTested = true;
 
-	/*Writeback Latency support check*/
-	mode_lib->ms.support.WritebackLatencySupport = true;
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true &&
-			(mode_lib->ms.WriteBandwidth[k] > mode_lib->ms.ip.writeback_interface_buffer_size_kbytes * 1024 / mode_lib->ms.state.writeback_latency_us)) {
-			mode_lib->ms.support.WritebackLatencySupport = false;
-		}
-	}
+			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+				mode_lib->ms.PrefetchMode[k] = s->NextPrefetchMode[k];
+				mode_lib->ms.TWait = CalculateTWait(
+								mode_lib->ms.PrefetchMode[k],
+								mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k],
+								mode_lib->ms.policy.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
+								mode_lib->ms.cache_display_cfg.timing.DRRDisplay[k],
+								mode_lib->ms.state.dram_clock_change_latency_us,
+								mode_lib->ms.state.fclk_change_latency_us,
+								mode_lib->ms.UrgLatency,
+								mode_lib->ms.state.sr_enter_plus_exit_time_us);
 
-	/*Writeback Mode Support Check*/
-	s->TotalNumberOfActiveWriteback = 0;
-	for (k = 0; k <= (dml_uint_t) mode_lib->ms.num_active_planes - 1; k++) {
-		if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true) {
-			s->TotalNumberOfActiveWriteback = s->TotalNumberOfActiveWriteback + 1;
-		}
-   }
+				myPipe = &s->myPipe;
+				myPipe->Dppclk = mode_lib->ms.RequiredDPPCLKPerSurface[j][k];
+				myPipe->Dispclk = mode_lib->ms.RequiredDISPCLK[j];
+				myPipe->PixelClock = mode_lib->ms.cache_display_cfg.timing.PixelClock[k];
+				myPipe->DCFClkDeepSleep = mode_lib->ms.ProjectedDCFCLKDeepSleep[j];
+				myPipe->DPPPerSurface = mode_lib->ms.NoOfDPP[j][k];
+				myPipe->ScalerEnabled = mode_lib->ms.cache_display_cfg.plane.ScalerEnabled[k];
+				myPipe->SourceScan = mode_lib->ms.cache_display_cfg.plane.SourceScan[k];
+				myPipe->BlockWidth256BytesY = mode_lib->ms.Read256BlockWidthY[k];
+				myPipe->BlockHeight256BytesY = mode_lib->ms.Read256BlockHeightY[k];
+				myPipe->BlockWidth256BytesC = mode_lib->ms.Read256BlockWidthC[k];
+				myPipe->BlockHeight256BytesC = mode_lib->ms.Read256BlockHeightC[k];
+				myPipe->InterlaceEnable = mode_lib->ms.cache_display_cfg.timing.Interlace[k];
+				myPipe->NumberOfCursors = mode_lib->ms.cache_display_cfg.plane.NumberOfCursors[k];
+				myPipe->VBlank = mode_lib->ms.cache_display_cfg.timing.VTotal[k] - mode_lib->ms.cache_display_cfg.timing.VActive[k];
+				myPipe->HTotal = mode_lib->ms.cache_display_cfg.timing.HTotal[k];
+				myPipe->HActive = mode_lib->ms.cache_display_cfg.timing.HActive[k];
+				myPipe->DCCEnable = mode_lib->ms.cache_display_cfg.surface.DCCEnable[k];
+				myPipe->ODMMode = mode_lib->ms.ODMModePerState[k];
+				myPipe->SourcePixelFormat = mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k];
+				myPipe->BytePerPixelY = mode_lib->ms.BytePerPixelY[k];
+				myPipe->BytePerPixelC = mode_lib->ms.BytePerPixelC[k];
+				myPipe->ProgressiveToInterlaceUnitInOPP = mode_lib->ms.ip.ptoi_supported;
 
-	mode_lib->ms.support.EnoughWritebackUnits = 1;
-	if (s->TotalNumberOfActiveWriteback > (dml_uint_t) mode_lib->ms.ip.max_num_wb) {
-		mode_lib->ms.support.EnoughWritebackUnits = false;
-	}
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: Calling CalculatePrefetchSchedule for j=%u, k=%u\n", __func__, j, k);
+				dml_print("DML::%s: MaximumVStartup = %u\n", __func__, s->MaximumVStartup[j][k]);
+				dml_print("DML::%s: MaxVStartup = %u\n", __func__, s->MaxVStartup);
+				dml_print("DML::%s: NextPrefetchMode = %u\n", __func__, s->NextPrefetchMode[k]);
+				dml_print("DML::%s: AllowForPStateChangeOrStutterInVBlank = %u\n", __func__, mode_lib->ms.policy.AllowForPStateChangeOrStutterInVBlank[k]);
+				dml_print("DML::%s: PrefetchMode = %u\n", __func__, mode_lib->ms.PrefetchMode[k]);
+#endif
 
-	/*Writeback Scale Ratio and Taps Support Check*/
-	mode_lib->ms.support.WritebackScaleRatioAndTapsSupport = true;
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true) {
-			if (mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[k] > mode_lib->ms.ip.writeback_max_hscl_ratio
-				|| mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[k] > mode_lib->ms.ip.writeback_max_vscl_ratio
-				|| mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[k] < mode_lib->ms.ip.writeback_min_hscl_ratio
-				|| mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[k] < mode_lib->ms.ip.writeback_min_vscl_ratio
-				|| mode_lib->ms.cache_display_cfg.writeback.WritebackHTaps[k] > (dml_uint_t) mode_lib->ms.ip.writeback_max_hscl_taps
-				|| mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[k] > (dml_uint_t) mode_lib->ms.ip.writeback_max_vscl_taps
-				|| mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[k] > (dml_uint_t) mode_lib->ms.cache_display_cfg.writeback.WritebackHTaps[k]
-				|| mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[k] > (dml_uint_t) mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[k]
-				|| (mode_lib->ms.cache_display_cfg.writeback.WritebackHTaps[k] > 2.0 && ((mode_lib->ms.cache_display_cfg.writeback.WritebackHTaps[k] % 2) == 1))) {
-				mode_lib->ms.support.WritebackScaleRatioAndTapsSupport = false;
-			}
-			if (2.0 * mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[k] * (mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[k] - 1) * 57 > mode_lib->ms.ip.writeback_line_buffer_buffer_size) {
-				mode_lib->ms.support.WritebackScaleRatioAndTapsSupport = false;
-			}
-		}
-	}
-
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		CalculateSinglePipeDPPCLKAndSCLThroughput(
-				mode_lib->ms.cache_display_cfg.plane.HRatio[k],
-				mode_lib->ms.cache_display_cfg.plane.HRatioChroma[k],
-				mode_lib->ms.cache_display_cfg.plane.VRatio[k],
-				mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k],
-				mode_lib->ms.ip.max_dchub_pscl_bw_pix_per_clk,
-				mode_lib->ms.ip.max_pscl_lb_bw_pix_per_clk,
-				mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
-				mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k],
-				mode_lib->ms.cache_display_cfg.plane.HTaps[k],
-				mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k],
-				mode_lib->ms.cache_display_cfg.plane.VTaps[k],
-				mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k],
-				/* Output */
-				&mode_lib->ms.PSCL_FACTOR[k],
-				&mode_lib->ms.PSCL_FACTOR_CHROMA[k],
-				&mode_lib->ms.MinDPPCLKUsingSingleDPP[k]);
-	}
-
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (mode_lib->ms.cache_display_cfg.surface.SurfaceTiling[k] == dml_sw_linear) {
-			s->MaximumSwathWidthSupportLuma = 8192;
-		} else if (!dml_is_vertical_rotation(mode_lib->ms.cache_display_cfg.plane.SourceScan[k]) && mode_lib->ms.BytePerPixelC[k] > 0 && mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_rgbe_alpha) {
-			s->MaximumSwathWidthSupportLuma = 7680;
-		} else if (dml_is_vertical_rotation(mode_lib->ms.cache_display_cfg.plane.SourceScan[k]) && mode_lib->ms.BytePerPixelC[k] > 0 && mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_rgbe_alpha) {
-			s->MaximumSwathWidthSupportLuma = 4320;
-		} else if (mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_rgbe_alpha) {
-			s->MaximumSwathWidthSupportLuma = 3840;
-		} else if (dml_is_vertical_rotation(mode_lib->ms.cache_display_cfg.plane.SourceScan[k]) && mode_lib->ms.BytePerPixelY[k] == 8 && mode_lib->ms.cache_display_cfg.surface.DCCEnable[k] == true) {
-			s->MaximumSwathWidthSupportLuma = 3072;
-		} else {
-			s->MaximumSwathWidthSupportLuma = 6144;
-		}
-
-       if (mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_8 || mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_10 || mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_12) {
-			s->MaximumSwathWidthSupportChroma = (dml_uint_t)(s->MaximumSwathWidthSupportLuma / 2.0);
-		} else {
-			s->MaximumSwathWidthSupportChroma = s->MaximumSwathWidthSupportLuma;
-       }
-		mode_lib->ms.MaximumSwathWidthInLineBufferLuma = mode_lib->ms.ip.line_buffer_size_bits * dml_max(mode_lib->ms.cache_display_cfg.plane.HRatio[k], 1.0) / mode_lib->ms.cache_display_cfg.plane.LBBitPerPixel[k] /
-															(mode_lib->ms.cache_display_cfg.plane.VTaps[k] + dml_max(dml_ceil(mode_lib->ms.cache_display_cfg.plane.VRatio[k], 1.0) - 2, 0.0));
-		if (mode_lib->ms.BytePerPixelC[k] == 0.0) {
-			mode_lib->ms.MaximumSwathWidthInLineBufferChroma = 0;
-		} else {
-			mode_lib->ms.MaximumSwathWidthInLineBufferChroma =
-							mode_lib->ms.ip.line_buffer_size_bits
-									* dml_max(mode_lib->ms.cache_display_cfg.plane.HRatioChroma[k], 1.0)
-									/ mode_lib->ms.cache_display_cfg.plane.LBBitPerPixel[k]
-									/ (mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k]
-									+ dml_max(dml_ceil(mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k], 1.0) - 2, 0.0));
-		}
-		mode_lib->ms.MaximumSwathWidthLuma[k] = dml_min(s->MaximumSwathWidthSupportLuma, mode_lib->ms.MaximumSwathWidthInLineBufferLuma);
-		mode_lib->ms.MaximumSwathWidthChroma[k] = dml_min(s->MaximumSwathWidthSupportChroma, mode_lib->ms.MaximumSwathWidthInLineBufferChroma);
-	}
+				CalculatePrefetchSchedule_params->EnhancedPrefetchScheduleAccelerationFinal = mode_lib->ms.policy.EnhancedPrefetchScheduleAccelerationFinal;
+				CalculatePrefetchSchedule_params->HostVMInefficiencyFactor = s->HostVMInefficiencyFactor;
+				CalculatePrefetchSchedule_params->myPipe = myPipe;
+				CalculatePrefetchSchedule_params->DSCDelay = mode_lib->ms.DSCDelayPerState[k];
+				CalculatePrefetchSchedule_params->DPPCLKDelaySubtotalPlusCNVCFormater = mode_lib->ms.ip.dppclk_delay_subtotal + mode_lib->ms.ip.dppclk_delay_cnvc_formatter;
+				CalculatePrefetchSchedule_params->DPPCLKDelaySCL = mode_lib->ms.ip.dppclk_delay_scl;
+				CalculatePrefetchSchedule_params->DPPCLKDelaySCLLBOnly = mode_lib->ms.ip.dppclk_delay_scl_lb_only;
+				CalculatePrefetchSchedule_params->DPPCLKDelayCNVCCursor = mode_lib->ms.ip.dppclk_delay_cnvc_cursor;
+				CalculatePrefetchSchedule_params->DISPCLKDelaySubtotal = mode_lib->ms.ip.dispclk_delay_subtotal;
+				CalculatePrefetchSchedule_params->DPP_RECOUT_WIDTH = (dml_uint_t)(mode_lib->ms.SwathWidthYThisState[k] / mode_lib->ms.cache_display_cfg.plane.HRatio[k]);
+				CalculatePrefetchSchedule_params->OutputFormat = mode_lib->ms.cache_display_cfg.output.OutputFormat[k];
+				CalculatePrefetchSchedule_params->MaxInterDCNTileRepeaters = mode_lib->ms.ip.max_inter_dcn_tile_repeaters;
+				CalculatePrefetchSchedule_params->VStartup = (dml_uint_t)(dml_min(s->MaxVStartup, s->MaximumVStartup[j][k]));
+				CalculatePrefetchSchedule_params->MaxVStartup = s->MaximumVStartup[j][k];
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
+				CalculatePrefetchSchedule_params->DSTXAfterScaler = &s->DSTXAfterScaler[k];
+				CalculatePrefetchSchedule_params->DSTYAfterScaler = &s->DSTYAfterScaler[k];
+				CalculatePrefetchSchedule_params->DestinationLinesForPrefetch = &mode_lib->ms.LineTimesForPrefetch[k];
+				CalculatePrefetchSchedule_params->DestinationLinesToRequestVMInVBlank = &mode_lib->ms.LinesForMetaPTE[k];
+				CalculatePrefetchSchedule_params->DestinationLinesToRequestRowInVBlank = &mode_lib->ms.LinesForMetaAndDPTERow[k];
+				CalculatePrefetchSchedule_params->VRatioPrefetchY = &mode_lib->ms.VRatioPreY[j][k];
+				CalculatePrefetchSchedule_params->VRatioPrefetchC = &mode_lib->ms.VRatioPreC[j][k];
+				CalculatePrefetchSchedule_params->RequiredPrefetchPixDataBWLuma = &mode_lib->ms.RequiredPrefetchPixelDataBWLuma[k];
+				CalculatePrefetchSchedule_params->RequiredPrefetchPixDataBWChroma = &mode_lib->ms.RequiredPrefetchPixelDataBWChroma[k];
+				CalculatePrefetchSchedule_params->NotEnoughTimeForDynamicMetadata = &mode_lib->ms.support.NoTimeForDynamicMetadata[j][k];
+				CalculatePrefetchSchedule_params->Tno_bw = &mode_lib->ms.Tno_bw[k];
+				CalculatePrefetchSchedule_params->prefetch_vmrow_bw = &mode_lib->ms.prefetch_vmrow_bw[k];
+				CalculatePrefetchSchedule_params->Tdmdl_vm = &s->dummy_single[0];
+				CalculatePrefetchSchedule_params->Tdmdl = &s->dummy_single[1];
+				CalculatePrefetchSchedule_params->TSetup = &s->dummy_single[2];
+				CalculatePrefetchSchedule_params->VUpdateOffsetPix = &s->dummy_integer[0];
+				CalculatePrefetchSchedule_params->VUpdateWidthPix = &s->dummy_integer[1];
+				CalculatePrefetchSchedule_params->VReadyOffsetPix = &s->dummy_integer[2];
 
-	/*Number Of DSC Slices*/
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k) {
-			if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] > 4800) {
-				mode_lib->ms.support.NumberOfDSCSlices[k] = (dml_uint_t)(dml_ceil(mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] / 600, 4));
-			} else if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] > 2400) {
-				mode_lib->ms.support.NumberOfDSCSlices[k] = 8;
-			} else if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] > 1200) {
-				mode_lib->ms.support.NumberOfDSCSlices[k] = 4;
-			} else if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] > 340) {
-				mode_lib->ms.support.NumberOfDSCSlices[k] = 2;
-			} else {
-				mode_lib->ms.support.NumberOfDSCSlices[k] = 1;
+				mode_lib->ms.support.NoTimeForPrefetch[j][k] =
+								CalculatePrefetchSchedule(&mode_lib->scratch,
+								CalculatePrefetchSchedule_params);
 			}
-		} else {
-			mode_lib->ms.support.NumberOfDSCSlices[k] = 0;
-		}
-	}
-
-	CalculateSwathAndDETConfiguration_params->DETSizeOverride = mode_lib->ms.cache_display_cfg.plane.DETSizeOverride;
-	CalculateSwathAndDETConfiguration_params->UseMALLForPStateChange = mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange;
-	CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSizeInKByte = mode_lib->ms.ip.config_return_buffer_size_in_kbytes;
-	CalculateSwathAndDETConfiguration_params->ROBBufferSizeInKByte = mode_lib->ms.ip.rob_buffer_size_kbytes;
-	CalculateSwathAndDETConfiguration_params->MaxTotalDETInKByte = mode_lib->ms.MaxTotalDETInKByte;
-	CalculateSwathAndDETConfiguration_params->MinCompressedBufferSizeInKByte = mode_lib->ms.MinCompressedBufferSizeInKByte;
-	CalculateSwathAndDETConfiguration_params->PixelChunkSizeInKByte = mode_lib->ms.ip.pixel_chunk_size_kbytes;
-	CalculateSwathAndDETConfiguration_params->ForceSingleDPP = 1;
-	CalculateSwathAndDETConfiguration_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
-	CalculateSwathAndDETConfiguration_params->nomDETInKByte = mode_lib->ms.NomDETInKByte;
-	CalculateSwathAndDETConfiguration_params->UseUnboundedRequestingFinal = mode_lib->ms.policy.UseUnboundedRequesting;
-	CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSegmentSizeInkByte = mode_lib->ms.ip.config_return_buffer_segment_size_in_kbytes;
-	CalculateSwathAndDETConfiguration_params->CompressedBufferSegmentSizeInkByteFinal = mode_lib->ms.ip.compressed_buffer_segment_size_in_kbytes;
-	CalculateSwathAndDETConfiguration_params->Output = mode_lib->ms.cache_display_cfg.output.OutputEncoder;
-	CalculateSwathAndDETConfiguration_params->ReadBandwidthLuma = mode_lib->ms.ReadBandwidthLuma;
-	CalculateSwathAndDETConfiguration_params->ReadBandwidthChroma = mode_lib->ms.ReadBandwidthChroma;
-	CalculateSwathAndDETConfiguration_params->MaximumSwathWidthLuma = mode_lib->ms.MaximumSwathWidthLuma;
-	CalculateSwathAndDETConfiguration_params->MaximumSwathWidthChroma = mode_lib->ms.MaximumSwathWidthChroma;
-	CalculateSwathAndDETConfiguration_params->SourceScan = mode_lib->ms.cache_display_cfg.plane.SourceScan;
-	CalculateSwathAndDETConfiguration_params->ViewportStationary = mode_lib->ms.cache_display_cfg.plane.ViewportStationary;
-	CalculateSwathAndDETConfiguration_params->SourcePixelFormat = mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat;
-	CalculateSwathAndDETConfiguration_params->SurfaceTiling = mode_lib->ms.cache_display_cfg.surface.SurfaceTiling;
-	CalculateSwathAndDETConfiguration_params->ViewportWidth = mode_lib->ms.cache_display_cfg.plane.ViewportWidth;
-	CalculateSwathAndDETConfiguration_params->ViewportHeight = mode_lib->ms.cache_display_cfg.plane.ViewportHeight;
-	CalculateSwathAndDETConfiguration_params->ViewportXStart = mode_lib->ms.cache_display_cfg.plane.ViewportXStart;
-	CalculateSwathAndDETConfiguration_params->ViewportYStart = mode_lib->ms.cache_display_cfg.plane.ViewportYStart;
-	CalculateSwathAndDETConfiguration_params->ViewportXStartC = mode_lib->ms.cache_display_cfg.plane.ViewportXStartC;
-	CalculateSwathAndDETConfiguration_params->ViewportYStartC = mode_lib->ms.cache_display_cfg.plane.ViewportYStartC;
-	CalculateSwathAndDETConfiguration_params->SurfaceWidthY = mode_lib->ms.cache_display_cfg.surface.SurfaceWidthY;
-	CalculateSwathAndDETConfiguration_params->SurfaceWidthC = mode_lib->ms.cache_display_cfg.surface.SurfaceWidthC;
-	CalculateSwathAndDETConfiguration_params->SurfaceHeightY = mode_lib->ms.cache_display_cfg.surface.SurfaceHeightY;
-	CalculateSwathAndDETConfiguration_params->SurfaceHeightC = mode_lib->ms.cache_display_cfg.surface.SurfaceHeightC;
-	CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightY = mode_lib->ms.Read256BlockHeightY;
-	CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightC = mode_lib->ms.Read256BlockHeightC;
-	CalculateSwathAndDETConfiguration_params->Read256BytesBlockWidthY = mode_lib->ms.Read256BlockWidthY;
-	CalculateSwathAndDETConfiguration_params->Read256BytesBlockWidthC = mode_lib->ms.Read256BlockWidthC;
-	CalculateSwathAndDETConfiguration_params->ODMMode = s->dummy_odm_mode;
-	CalculateSwathAndDETConfiguration_params->BlendingAndTiming = mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming;
-	CalculateSwathAndDETConfiguration_params->BytePerPixY = mode_lib->ms.BytePerPixelY;
-	CalculateSwathAndDETConfiguration_params->BytePerPixC = mode_lib->ms.BytePerPixelC;
-	CalculateSwathAndDETConfiguration_params->BytePerPixDETY = mode_lib->ms.BytePerPixelInDETY;
-	CalculateSwathAndDETConfiguration_params->BytePerPixDETC = mode_lib->ms.BytePerPixelInDETC;
-	CalculateSwathAndDETConfiguration_params->HActive = mode_lib->ms.cache_display_cfg.timing.HActive;
-	CalculateSwathAndDETConfiguration_params->HRatio = mode_lib->ms.cache_display_cfg.plane.HRatio;
-	CalculateSwathAndDETConfiguration_params->HRatioChroma = mode_lib->ms.cache_display_cfg.plane.HRatioChroma;
-	CalculateSwathAndDETConfiguration_params->DPPPerSurface = s->dummy_integer_array[0];
-	CalculateSwathAndDETConfiguration_params->swath_width_luma_ub = s->dummy_integer_array[1];
-	CalculateSwathAndDETConfiguration_params->swath_width_chroma_ub = s->dummy_integer_array[2];
-	CalculateSwathAndDETConfiguration_params->SwathWidth = s->dummy_integer_array[3];
-	CalculateSwathAndDETConfiguration_params->SwathWidthChroma = s->dummy_integer_array[4];
-	CalculateSwathAndDETConfiguration_params->SwathHeightY = s->dummy_integer_array[5];
-	CalculateSwathAndDETConfiguration_params->SwathHeightC = s->dummy_integer_array[6];
-	CalculateSwathAndDETConfiguration_params->DETBufferSizeInKByte = s->dummy_integer_array[7];
-	CalculateSwathAndDETConfiguration_params->DETBufferSizeY = mode_lib->ms.DETBufferSizeY;
-	CalculateSwathAndDETConfiguration_params->DETBufferSizeC = mode_lib->ms.DETBufferSizeC;
-	CalculateSwathAndDETConfiguration_params->UnboundedRequestEnabled = &s->dummy_boolean[0];
-	CalculateSwathAndDETConfiguration_params->compbuf_reserved_space_64b = &s->dummy_integer[2];
-	CalculateSwathAndDETConfiguration_params->compbuf_reserved_space_zs = &s->dummy_integer[1];
-	CalculateSwathAndDETConfiguration_params->CompressedBufferSizeInkByte = &s->dummy_integer[0];
-	CalculateSwathAndDETConfiguration_params->ViewportSizeSupportPerSurface = mode_lib->ms.SingleDPPViewportSizeSupportPerSurface;
-	CalculateSwathAndDETConfiguration_params->ViewportSizeSupport = &s->dummy_boolean[1];
-
-	CalculateSwathAndDETConfiguration(&mode_lib->scratch,
-	CalculateSwathAndDETConfiguration_params); /* dml_bool_t *ViewportSizeSupport */
 
-	s->MPCCombineMethodAsNeededForPStateChangeAndVoltage = false;
-	s->MPCCombineMethodAsPossible = false;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.policy.MPCCombineUse[k] == dml_mpc_as_needed_for_pstate_and_voltage)
-			s->MPCCombineMethodAsNeededForPStateChangeAndVoltage = true;
-		if (mode_lib->ms.policy.MPCCombineUse[k] == dml_mpc_as_possible)
-			s->MPCCombineMethodAsPossible = true;
-	}
-	mode_lib->ms.support.MPCCombineMethodIncompatible = s->MPCCombineMethodAsNeededForPStateChangeAndVoltage && s->MPCCombineMethodAsPossible;
-
-	for (j = 0; j < 2; j++) {
-		mode_lib->ms.TotalNumberOfActiveDPP[j] = 0;
-		mode_lib->ms.support.TotalAvailablePipesSupport[j] = true;
-
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			CalculateODMMode(
-					mode_lib->ms.ip.maximum_pixels_per_line_per_dsc_unit,
-					mode_lib->ms.cache_display_cfg.timing.HActive[k],
-					mode_lib->ms.cache_display_cfg.output.OutputEncoder[k],
-					mode_lib->ms.cache_display_cfg.output.OutputFormat[k],
-					mode_lib->ms.policy.ODMUse[k],
-					mode_lib->ms.state.dispclk_mhz,
-					mode_lib->ms.max_state.dispclk_mhz,
-					false, // DSCEnable
-					mode_lib->ms.TotalNumberOfActiveDPP[j],
-					mode_lib->ms.ip.max_num_dpp,
-					mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
-					mode_lib->ms.soc.dcn_downspread_percent,
-					mode_lib->ms.ip.dispclk_ramp_margin_percent,
-					mode_lib->ms.soc.dispclk_dppclk_vco_speed_mhz,
-
-					/* Output */
-					&s->TotalAvailablePipesSupportNoDSC,
-					&s->NumberOfDPPNoDSC,
-					&s->ODMModeNoDSC,
-					&s->RequiredDISPCLKPerSurfaceNoDSC);
+			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+					CalculateUrgentBurstFactor(
+							mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k],
+							mode_lib->ms.swath_width_luma_ub_this_state[k],
+							mode_lib->ms.swath_width_chroma_ub_this_state[k],
+							mode_lib->ms.SwathHeightYThisState[k],
+							mode_lib->ms.SwathHeightCThisState[k],
+							mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
+							mode_lib->ms.UrgLatency,
+							mode_lib->ms.ip.cursor_buffer_size,
+							mode_lib->ms.cache_display_cfg.plane.CursorWidth[k],
+							mode_lib->ms.cache_display_cfg.plane.CursorBPP[k],
+							mode_lib->ms.VRatioPreY[j][k],
+							mode_lib->ms.VRatioPreC[j][k],
+							mode_lib->ms.BytePerPixelInDETY[k],
+							mode_lib->ms.BytePerPixelInDETC[k],
+							mode_lib->ms.DETBufferSizeYThisState[k],
+							mode_lib->ms.DETBufferSizeCThisState[k],
+							/* Output */
+							&mode_lib->ms.UrgentBurstFactorCursorPre[k],
+							&mode_lib->ms.UrgentBurstFactorLumaPre[k],
+							&mode_lib->ms.UrgentBurstFactorChroma[k],
+							&mode_lib->ms.NotUrgentLatencyHidingPre[k]);
 
-			CalculateODMMode(
-					mode_lib->ms.ip.maximum_pixels_per_line_per_dsc_unit,
-					mode_lib->ms.cache_display_cfg.timing.HActive[k],
-					mode_lib->ms.cache_display_cfg.output.OutputEncoder[k],
-					mode_lib->ms.cache_display_cfg.output.OutputFormat[k],
-					mode_lib->ms.policy.ODMUse[k],
-					mode_lib->ms.state.dispclk_mhz,
-					mode_lib->ms.max_state.dispclk_mhz,
-					true, // DSCEnable
-					mode_lib->ms.TotalNumberOfActiveDPP[j],
-					mode_lib->ms.ip.max_num_dpp,
-					mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
-					mode_lib->ms.soc.dcn_downspread_percent,
-					mode_lib->ms.ip.dispclk_ramp_margin_percent,
-					mode_lib->ms.soc.dispclk_dppclk_vco_speed_mhz,
+					mode_lib->ms.cursor_bw_pre[k] = mode_lib->ms.cache_display_cfg.plane.NumberOfCursors[k] * mode_lib->ms.cache_display_cfg.plane.CursorWidth[k] *
+													mode_lib->ms.cache_display_cfg.plane.CursorBPP[k] / 8.0 / (mode_lib->ms.cache_display_cfg.timing.HTotal[k] /
+													mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * mode_lib->ms.VRatioPreY[j][k];
+			}
 
-					/* Output */
-					&s->TotalAvailablePipesSupportDSC,
-					&s->NumberOfDPPDSC,
-					&s->ODMModeDSC,
-					&s->RequiredDISPCLKPerSurfaceDSC);
+			{
+			CalculatePrefetchBandwithSupport(
+				mode_lib->ms.num_active_planes,
+				mode_lib->ms.ReturnBWPerState[j],
+				mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange,
+				mode_lib->ms.NotUrgentLatencyHidingPre,
+				mode_lib->ms.ReadBandwidthLuma,
+				mode_lib->ms.ReadBandwidthChroma,
+				mode_lib->ms.RequiredPrefetchPixelDataBWLuma,
+				mode_lib->ms.RequiredPrefetchPixelDataBWChroma,
+				mode_lib->ms.cursor_bw,
+				mode_lib->ms.meta_row_bandwidth_this_state,
+				mode_lib->ms.dpte_row_bandwidth_this_state,
+				mode_lib->ms.cursor_bw_pre,
+				mode_lib->ms.prefetch_vmrow_bw,
+				mode_lib->ms.NoOfDPPThisState,
+				mode_lib->ms.UrgentBurstFactorLuma,
+				mode_lib->ms.UrgentBurstFactorChroma,
+				mode_lib->ms.UrgentBurstFactorCursor,
+				mode_lib->ms.UrgentBurstFactorLumaPre,
+				mode_lib->ms.UrgentBurstFactorChromaPre,
+				mode_lib->ms.UrgentBurstFactorCursorPre,
 
-			CalculateOutputLink(
-					mode_lib->ms.state.phyclk_mhz,
-					mode_lib->ms.state.phyclk_d18_mhz,
-					mode_lib->ms.state.phyclk_d32_mhz,
-					mode_lib->ms.soc.phy_downspread_percent,
-					(mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k),
-					mode_lib->ms.cache_display_cfg.output.OutputEncoder[k],
-					mode_lib->ms.cache_display_cfg.output.OutputFormat[k],
-					mode_lib->ms.cache_display_cfg.timing.HTotal[k],
-					mode_lib->ms.cache_display_cfg.timing.HActive[k],
-					mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k],
-					mode_lib->ms.cache_display_cfg.output.ForcedOutputLinkBPP[k],
-					mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k],
-					mode_lib->ms.support.NumberOfDSCSlices[k],
-					mode_lib->ms.cache_display_cfg.output.AudioSampleRate[k],
-					mode_lib->ms.cache_display_cfg.output.AudioSampleLayout[k],
-					s->ODMModeNoDSC,
-					s->ODMModeDSC,
-					mode_lib->ms.cache_display_cfg.output.DSCEnable[k],
-					mode_lib->ms.cache_display_cfg.output.OutputLinkDPLanes[k],
-					mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k],
+				/* output */
+				&s->dummy_single[0], // dml_float_t *PrefetchBandwidth
+				&s->dummy_single[1], // dml_float_t *PrefetchBandwidthNotIncludingMALLPrefetch
+				&mode_lib->mp.FractionOfUrgentBandwidth, // dml_float_t *FractionOfUrgentBandwidth
+				&mode_lib->ms.support.PrefetchSupported[j]);
+			}
 
-					/* Output */
-					&mode_lib->ms.RequiresDSC[k],
-					&mode_lib->ms.RequiresFEC[k],
-					&mode_lib->ms.OutputBppPerState[k],
-					&mode_lib->ms.OutputTypePerState[k], // VBA_DELTA, VBA uses a string to represent type and rate, but DML uses enum, don't want to rely on strng
-					&mode_lib->ms.OutputRatePerState[k],
-					&mode_lib->ms.RequiredSlots[k]);
+			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+				if (mode_lib->ms.LineTimesForPrefetch[k] < 2.0
+					|| mode_lib->ms.LinesForMetaPTE[k] >= 32.0
+					|| mode_lib->ms.LinesForMetaAndDPTERow[k] >= 16.0
+					|| mode_lib->ms.support.NoTimeForPrefetch[j][k] == true) {
+						mode_lib->ms.support.PrefetchSupported[j] = false;
+				}
+			}
 
-			if (mode_lib->ms.RequiresDSC[k] == false) {
-				mode_lib->ms.ODMModePerState[k] = s->ODMModeNoDSC;
-				mode_lib->ms.RequiredDISPCLKPerSurface[j][k] = s->RequiredDISPCLKPerSurfaceNoDSC;
-				if (!s->TotalAvailablePipesSupportNoDSC)
-					mode_lib->ms.support.TotalAvailablePipesSupport[j] = false;
-				mode_lib->ms.TotalNumberOfActiveDPP[j] = mode_lib->ms.TotalNumberOfActiveDPP[j] + s->NumberOfDPPNoDSC;
-			} else {
-				mode_lib->ms.ODMModePerState[k] = s->ODMModeDSC;
-				mode_lib->ms.RequiredDISPCLKPerSurface[j][k] = s->RequiredDISPCLKPerSurfaceDSC;
-				if (!s->TotalAvailablePipesSupportDSC)
-					mode_lib->ms.support.TotalAvailablePipesSupport[j] = false;
-				mode_lib->ms.TotalNumberOfActiveDPP[j] = mode_lib->ms.TotalNumberOfActiveDPP[j] + s->NumberOfDPPDSC;
+			mode_lib->ms.support.DynamicMetadataSupported[j] = true;
+			for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+				if (mode_lib->ms.support.NoTimeForDynamicMetadata[j][k] == true) {
+					mode_lib->ms.support.DynamicMetadataSupported[j] = false;
+				}
 			}
-		}
 
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_4to1) {
-				mode_lib->ms.MPCCombine[j][k] = false;
-				mode_lib->ms.NoOfDPP[j][k] = 4;
-			} else if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_2to1) {
-				mode_lib->ms.MPCCombine[j][k] = false;
-				mode_lib->ms.NoOfDPP[j][k] = 2;
-			} else if (mode_lib->ms.policy.MPCCombineUse[k] == dml_mpc_disabled) {
-				mode_lib->ms.MPCCombine[j][k] = false;
-				mode_lib->ms.NoOfDPP[j][k] = 1;
-			} else if (RoundToDFSGranularity(mode_lib->ms.MinDPPCLKUsingSingleDPP[k] * (1 + mode_lib->ms.soc.dcn_downspread_percent / 100),
-											1, mode_lib->ms.soc.dispclk_dppclk_vco_speed_mhz) <= mode_lib->ms.state.dppclk_mhz &&
-											mode_lib->ms.SingleDPPViewportSizeSupportPerSurface[k] == true) {
-				mode_lib->ms.MPCCombine[j][k] = false;
-				mode_lib->ms.NoOfDPP[j][k] = 1;
-			} else if (mode_lib->ms.TotalNumberOfActiveDPP[j] < (dml_uint_t) mode_lib->ms.ip.max_num_dpp) {
-				mode_lib->ms.MPCCombine[j][k] = true;
-				mode_lib->ms.NoOfDPP[j][k] = 2;
-				mode_lib->ms.TotalNumberOfActiveDPP[j] = (dml_uint_t) mode_lib->ms.TotalNumberOfActiveDPP[j] + 1;
-			} else {
-				mode_lib->ms.MPCCombine[j][k] = false;
-				mode_lib->ms.NoOfDPP[j][k] = 1;
-				mode_lib->ms.support.TotalAvailablePipesSupport[j] = false;
+			mode_lib->ms.support.VRatioInPrefetchSupported[j] = true;
+			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+				if (mode_lib->ms.support.NoTimeForPrefetch[j][k] == true ||
+					mode_lib->ms.VRatioPreY[j][k] > __DML_MAX_VRATIO_PRE_ENHANCE_PREFETCH_ACC__ ||
+					mode_lib->ms.VRatioPreC[j][k] > __DML_MAX_VRATIO_PRE_ENHANCE_PREFETCH_ACC__ ||
+					((s->MaxVStartup < s->MaximumVStartup[j][k] || mode_lib->ms.policy.EnhancedPrefetchScheduleAccelerationFinal == 0) &&
+						(mode_lib->ms.VRatioPreY[j][k] > __DML_MAX_VRATIO_PRE__ || mode_lib->ms.VRatioPreC[j][k] > __DML_MAX_VRATIO_PRE__))) {
+							mode_lib->ms.support.VRatioInPrefetchSupported[j] = false;
+				}
 			}
-		}
 
-		mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] = 0;
-		s->NoChromaOrLinear = true;
-		for (k = 0; k < (dml_uint_t) mode_lib->ms.num_active_planes; ++k) {
-			if (mode_lib->ms.NoOfDPP[j][k] == 1)
-				mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] = mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] + 1;
-			if (mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_8
-					|| mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_10
-					|| mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_12
-					|| mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_rgbe_alpha
-					|| mode_lib->ms.cache_display_cfg.surface.SurfaceTiling[k] == dml_sw_linear) {
-				s->NoChromaOrLinear = false;
+			s->AnyLinesForVMOrRowTooLarge = false;
+			for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+				if (mode_lib->ms.LinesForMetaAndDPTERow[k] >= 16 || mode_lib->ms.LinesForMetaPTE[k] >= 32) {
+					s->AnyLinesForVMOrRowTooLarge = true;
+				}
 			}
-		}
 
-		if (j == 1 && !UnboundedRequest(mode_lib->ms.policy.UseUnboundedRequesting,
-				mode_lib->ms.TotalNumberOfActiveDPP[j], s->NoChromaOrLinear,
-				mode_lib->ms.cache_display_cfg.output.OutputEncoder[0])) {
-			while (!(mode_lib->ms.TotalNumberOfActiveDPP[j] >= (dml_uint_t) mode_lib->ms.ip.max_num_dpp || mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] == 0)) {
-				s->BWOfNonCombinedSurfaceOfMaximumBandwidth = 0;
-				s->NumberOfNonCombinedSurfaceOfMaximumBandwidth = 0;
-				for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-					if (mode_lib->ms.policy.MPCCombineUse[k] != dml_mpc_disabled && mode_lib->ms.policy.MPCCombineUse[k] != dml_mpc_as_needed_for_voltage &&
-						mode_lib->ms.ReadBandwidthLuma[k] + mode_lib->ms.ReadBandwidthChroma[k] > s->BWOfNonCombinedSurfaceOfMaximumBandwidth &&
-						(mode_lib->ms.ODMModePerState[k] != dml_odm_mode_combine_2to1 && mode_lib->ms.ODMModePerState[k] != dml_odm_mode_combine_4to1) &&
-						mode_lib->ms.MPCCombine[j][k] == false) {
-						s->BWOfNonCombinedSurfaceOfMaximumBandwidth = mode_lib->ms.ReadBandwidthLuma[k] + mode_lib->ms.ReadBandwidthChroma[k];
-						s->NumberOfNonCombinedSurfaceOfMaximumBandwidth = k;
+			if (mode_lib->ms.support.PrefetchSupported[j] == true && mode_lib->ms.support.VRatioInPrefetchSupported[j] == true) {
+				mode_lib->ms.BandwidthAvailableForImmediateFlip = CalculateBandwidthAvailableForImmediateFlip(
+						mode_lib->ms.num_active_planes,
+						mode_lib->ms.ReturnBWPerState[j],
+						mode_lib->ms.ReadBandwidthLuma,
+						mode_lib->ms.ReadBandwidthChroma,
+						mode_lib->ms.RequiredPrefetchPixelDataBWLuma,
+						mode_lib->ms.RequiredPrefetchPixelDataBWChroma,
+						mode_lib->ms.cursor_bw,
+						mode_lib->ms.cursor_bw_pre,
+						mode_lib->ms.NoOfDPPThisState,
+						mode_lib->ms.UrgentBurstFactorLuma,
+						mode_lib->ms.UrgentBurstFactorChroma,
+						mode_lib->ms.UrgentBurstFactorCursor,
+						mode_lib->ms.UrgentBurstFactorLumaPre,
+						mode_lib->ms.UrgentBurstFactorChromaPre,
+						mode_lib->ms.UrgentBurstFactorCursorPre);
+
+				mode_lib->ms.TotImmediateFlipBytes = 0;
+				for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+					if (!(mode_lib->ms.policy.ImmediateFlipRequirement[k] == dml_immediate_flip_not_required)) {
+						mode_lib->ms.TotImmediateFlipBytes = mode_lib->ms.TotImmediateFlipBytes + mode_lib->ms.NoOfDPP[j][k] * mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k] + mode_lib->ms.MetaRowBytes[j][k];
+						if (mode_lib->ms.use_one_row_for_frame_flip[j][k]) {
+							mode_lib->ms.TotImmediateFlipBytes = mode_lib->ms.TotImmediateFlipBytes + mode_lib->ms.NoOfDPP[j][k] * (2 * mode_lib->ms.DPTEBytesPerRow[j][k]);
+						} else {
+							mode_lib->ms.TotImmediateFlipBytes = mode_lib->ms.TotImmediateFlipBytes + mode_lib->ms.NoOfDPP[j][k] * mode_lib->ms.DPTEBytesPerRow[j][k];
+						}
 					}
 				}
-				mode_lib->ms.MPCCombine[j][s->NumberOfNonCombinedSurfaceOfMaximumBandwidth] = true;
-				mode_lib->ms.NoOfDPP[j][s->NumberOfNonCombinedSurfaceOfMaximumBandwidth] = 2;
-				mode_lib->ms.TotalNumberOfActiveDPP[j] = mode_lib->ms.TotalNumberOfActiveDPP[j] + 1;
-				mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] = mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] - 1;
-			}
-		}
-
-		//DISPCLK/DPPCLK
-		mode_lib->ms.WritebackRequiredDISPCLK = 0;
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k]) {
-				mode_lib->ms.WritebackRequiredDISPCLK = dml_max(mode_lib->ms.WritebackRequiredDISPCLK,
-																	CalculateWriteBackDISPCLK(mode_lib->ms.cache_display_cfg.writeback.WritebackPixelFormat[k],
-																							mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
-																							mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[k],
-																							mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[k],
-																							mode_lib->ms.cache_display_cfg.writeback.WritebackHTaps[k],
-																							mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[k],
-																							mode_lib->ms.cache_display_cfg.writeback.WritebackSourceWidth[k],
-																							mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[k],
-																							mode_lib->ms.cache_display_cfg.timing.HTotal[k],
-																							mode_lib->ms.ip.writeback_line_buffer_buffer_size,
-																							mode_lib->ms.soc.dispclk_dppclk_vco_speed_mhz));
-			}
-		}
 
-		 mode_lib->ms.RequiredDISPCLK[j] = mode_lib->ms.WritebackRequiredDISPCLK;
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.RequiredDISPCLK[j] = dml_max(mode_lib->ms.RequiredDISPCLK[j], mode_lib->ms.RequiredDISPCLKPerSurface[j][k]);
-		}
+				for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+					CalculateFlipSchedule(
+						s->HostVMInefficiencyFactor,
+						mode_lib->ms.ExtraLatency,
+						mode_lib->ms.UrgLatency,
+						mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels,
+						mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
+						mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels,
+						mode_lib->ms.cache_display_cfg.plane.GPUVMEnable,
+						mode_lib->ms.soc.hostvm_min_page_size_kbytes,
+						mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k],
+						mode_lib->ms.MetaRowBytes[j][k],
+						mode_lib->ms.DPTEBytesPerRow[j][k],
+						mode_lib->ms.BandwidthAvailableForImmediateFlip,
+						mode_lib->ms.TotImmediateFlipBytes,
+						mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k],
+						(mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k]),
+						mode_lib->ms.cache_display_cfg.plane.VRatio[k],
+						mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k],
+						mode_lib->ms.Tno_bw[k],
+						mode_lib->ms.cache_display_cfg.surface.DCCEnable[k],
+						mode_lib->ms.dpte_row_height[k],
+						mode_lib->ms.meta_row_height[k],
+						mode_lib->ms.dpte_row_height_chroma[k],
+						mode_lib->ms.meta_row_height_chroma[k],
+						mode_lib->ms.use_one_row_for_frame_flip[j][k], // 24
 
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.NoOfDPPThisState[k] = mode_lib->ms.NoOfDPP[j][k];
-		}
+						/* Output */
+						&mode_lib->ms.DestinationLinesToRequestVMInImmediateFlip[k],
+						&mode_lib->ms.DestinationLinesToRequestRowInImmediateFlip[k],
+						&mode_lib->ms.final_flip_bw[k],
+						&mode_lib->ms.ImmediateFlipSupportedForPipe[k]);
+				}
 
-		CalculateDPPCLK(mode_lib->ms.num_active_planes,
-					mode_lib->ms.soc.dcn_downspread_percent,
-					mode_lib->ms.soc.dispclk_dppclk_vco_speed_mhz,
-					mode_lib->ms.MinDPPCLKUsingSingleDPP,
-					mode_lib->ms.NoOfDPPThisState,
-					/* Output */
-					&mode_lib->ms.GlobalDPPCLK,
-					mode_lib->ms.RequiredDPPCLKThisState);
+				{
+				CalculateImmediateFlipBandwithSupport(mode_lib->ms.num_active_planes,
+													mode_lib->ms.ReturnBWPerState[j],
+													mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange,
+													mode_lib->ms.policy.ImmediateFlipRequirement,
+													mode_lib->ms.final_flip_bw,
+													mode_lib->ms.ReadBandwidthLuma,
+													mode_lib->ms.ReadBandwidthChroma,
+													mode_lib->ms.RequiredPrefetchPixelDataBWLuma,
+													mode_lib->ms.RequiredPrefetchPixelDataBWChroma,
+													mode_lib->ms.cursor_bw,
+													mode_lib->ms.meta_row_bandwidth_this_state,
+													mode_lib->ms.dpte_row_bandwidth_this_state,
+													mode_lib->ms.cursor_bw_pre,
+													mode_lib->ms.prefetch_vmrow_bw,
+													mode_lib->ms.NoOfDPP[j], // VBA_ERROR DPPPerSurface is not assigned at this point, should use NoOfDpp here
+													mode_lib->ms.UrgentBurstFactorLuma,
+													mode_lib->ms.UrgentBurstFactorChroma,
+													mode_lib->ms.UrgentBurstFactorCursor,
+													mode_lib->ms.UrgentBurstFactorLumaPre,
+													mode_lib->ms.UrgentBurstFactorChromaPre,
+													mode_lib->ms.UrgentBurstFactorCursorPre,
 
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.RequiredDPPCLKPerSurface[j][k] = mode_lib->ms.RequiredDPPCLKThisState[k];
-		}
+													/* output */
+													&s->dummy_single[0], // dml_float_t *TotalBandwidth
+													&s->dummy_single[1], // dml_float_t *TotalBandwidthNotIncludingMALLPrefetch
+													&s->dummy_single[2], // dml_float_t *FractionOfUrgentBandwidth
+													&mode_lib->ms.support.ImmediateFlipSupportedForState[j]); // dml_bool_t *ImmediateFlipBandwidthSupport
+				}
 
-		mode_lib->ms.support.DISPCLK_DPPCLK_Support[j] = !((mode_lib->ms.RequiredDISPCLK[j] > mode_lib->ms.state.dispclk_mhz) || (mode_lib->ms.GlobalDPPCLK > mode_lib->ms.state.dppclk_mhz));
+				for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+					if (!(mode_lib->ms.policy.ImmediateFlipRequirement[k] == dml_immediate_flip_not_required) && (mode_lib->ms.ImmediateFlipSupportedForPipe[k] == false))
+						mode_lib->ms.support.ImmediateFlipSupportedForState[j] = false;
+				}
 
-		if (mode_lib->ms.TotalNumberOfActiveDPP[j] > (dml_uint_t) mode_lib->ms.ip.max_num_dpp) {
-			mode_lib->ms.support.TotalAvailablePipesSupport[j] = false;
-		}
-	} // j
+			} else { // if prefetch not support, assume iflip not supported
+				mode_lib->ms.support.ImmediateFlipSupportedForState[j] = false;
+			}
 
-	/* Total Available OTG, HDMIFRL, DP Support Check */
-	s->TotalNumberOfActiveOTG = 0;
-	s->TotalNumberOfActiveHDMIFRL = 0;
-	s->TotalNumberOfActiveDP2p0 = 0;
-	s->TotalNumberOfActiveDP2p0Outputs = 0;
+			if (s->MaxVStartup <= __DML_VBA_MIN_VSTARTUP__ || s->AnyLinesForVMOrRowTooLarge == false) {
+				s->NextMaxVStartup = s->MaxVStartupAllPlanes[j];
+				for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+					s->NextPrefetchMode[k] = s->NextPrefetchMode[k] + 1;
 
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k) {
-			s->TotalNumberOfActiveOTG = s->TotalNumberOfActiveOTG + 1;
-			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl)
-				s->TotalNumberOfActiveHDMIFRL = s->TotalNumberOfActiveHDMIFRL + 1;
-			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp2p0) {
-				s->TotalNumberOfActiveDP2p0 = s->TotalNumberOfActiveDP2p0 + 1;
-				if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == k || mode_lib->ms.cache_display_cfg.output.OutputMultistreamEn[k] == false) {
-					s->TotalNumberOfActiveDP2p0Outputs = s->TotalNumberOfActiveDP2p0Outputs + 1;
+					if (s->NextPrefetchMode[k] <= s->MaxPrefetchMode[k])
+						s->AllPrefetchModeTested = false;
 				}
+			} else {
+				s->NextMaxVStartup = s->NextMaxVStartup - 1;
 			}
+		} while (!((mode_lib->ms.support.PrefetchSupported[j] == true && mode_lib->ms.support.DynamicMetadataSupported[j] == true &&
+					mode_lib->ms.support.VRatioInPrefetchSupported[j] == true &&
+					// consider flip support is okay if when there is no hostvm and the user does't require a iflip OR the flip bw is ok
+					// If there is hostvm, DCN needs to support iflip for invalidation
+					((s->ImmediateFlipRequiredFinal) || mode_lib->ms.support.ImmediateFlipSupportedForState[j] == true)) ||
+					(s->NextMaxVStartup == s->MaxVStartupAllPlanes[j] && s->AllPrefetchModeTested)));
+
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			mode_lib->ms.use_one_row_for_frame_this_state[k] = mode_lib->ms.use_one_row_for_frame[j][k];
 		}
-	}
 
-	mode_lib->ms.support.NumberOfOTGSupport      = (s->TotalNumberOfActiveOTG <= (dml_uint_t) mode_lib->ms.ip.max_num_otg);
-	mode_lib->ms.support.NumberOfHDMIFRLSupport  = (s->TotalNumberOfActiveHDMIFRL <= (dml_uint_t) mode_lib->ms.ip.max_num_hdmi_frl_outputs);
-	mode_lib->ms.support.NumberOfDP2p0Support    = (s->TotalNumberOfActiveDP2p0 <= (dml_uint_t) mode_lib->ms.ip.max_num_dp2p0_streams && s->TotalNumberOfActiveDP2p0Outputs <= (dml_uint_t) mode_lib->ms.ip.max_num_dp2p0_outputs);
+		s->mSOCParameters.UrgentLatency = mode_lib->ms.UrgLatency;
+		s->mSOCParameters.ExtraLatency = mode_lib->ms.ExtraLatency;
+		s->mSOCParameters.WritebackLatency = mode_lib->ms.state.writeback_latency_us;
+		s->mSOCParameters.DRAMClockChangeLatency = mode_lib->ms.state.dram_clock_change_latency_us;
+		s->mSOCParameters.FCLKChangeLatency = mode_lib->ms.state.fclk_change_latency_us;
+		s->mSOCParameters.SRExitTime = mode_lib->ms.state.sr_exit_time_us;
+		s->mSOCParameters.SREnterPlusExitTime = mode_lib->ms.state.sr_enter_plus_exit_time_us;
+		s->mSOCParameters.SRExitZ8Time = mode_lib->ms.state.sr_exit_z8_time_us;
+		s->mSOCParameters.SREnterPlusExitZ8Time = mode_lib->ms.state.sr_enter_plus_exit_z8_time_us;
+		s->mSOCParameters.USRRetrainingLatency = mode_lib->ms.state.usr_retraining_latency_us;
+		s->mSOCParameters.SMNLatency = mode_lib->ms.soc.smn_latency_us;
 
-	/* Display IO and DSC Support Check */
-	mode_lib->ms.support.NonsupportedDSCInputBPC = false;
-	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (mode_lib->ms.cache_display_cfg.output.OutputDisabled[k] == false &&
-			!(mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k] == 12.0
-				|| mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k] == 10.0
-				|| mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k] == 8.0
-				|| mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k] > (dml_uint_t) mode_lib->ms.ip.maximum_dsc_bits_per_component
-				)) {
-			mode_lib->ms.support.NonsupportedDSCInputBPC = true;
-		}
-	}
+		CalculateWatermarks_params->USRRetrainingRequiredFinal = mode_lib->ms.policy.USRRetrainingRequiredFinal;
+		CalculateWatermarks_params->UseMALLForPStateChange = mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange;
+		CalculateWatermarks_params->PrefetchMode = mode_lib->ms.PrefetchMode;
+		CalculateWatermarks_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
+		CalculateWatermarks_params->MaxLineBufferLines = mode_lib->ms.ip.max_line_buffer_lines;
+		CalculateWatermarks_params->LineBufferSize = mode_lib->ms.ip.line_buffer_size_bits;
+		CalculateWatermarks_params->WritebackInterfaceBufferSize = mode_lib->ms.ip.writeback_interface_buffer_size_kbytes;
+		CalculateWatermarks_params->DCFCLK = mode_lib->ms.DCFCLKState[j];
+		CalculateWatermarks_params->ReturnBW = mode_lib->ms.ReturnBWPerState[j];
+		CalculateWatermarks_params->SynchronizeTimingsFinal = mode_lib->ms.policy.SynchronizeTimingsFinal;
+		CalculateWatermarks_params->SynchronizeDRRDisplaysForUCLKPStateChangeFinal = mode_lib->ms.policy.SynchronizeDRRDisplaysForUCLKPStateChangeFinal;
+		CalculateWatermarks_params->DRRDisplay = mode_lib->ms.cache_display_cfg.timing.DRRDisplay;
+		CalculateWatermarks_params->dpte_group_bytes = mode_lib->ms.dpte_group_bytes;
+		CalculateWatermarks_params->meta_row_height = mode_lib->ms.meta_row_height;
+		CalculateWatermarks_params->meta_row_height_chroma = mode_lib->ms.meta_row_height_chroma;
+		CalculateWatermarks_params->mmSOCParameters = s->mSOCParameters;
+		CalculateWatermarks_params->WritebackChunkSize = mode_lib->ms.ip.writeback_chunk_size_kbytes;
+		CalculateWatermarks_params->SOCCLK = mode_lib->ms.state.socclk_mhz;
+		CalculateWatermarks_params->DCFClkDeepSleep = mode_lib->ms.ProjectedDCFCLKDeepSleep[j];
+		CalculateWatermarks_params->DETBufferSizeY = mode_lib->ms.DETBufferSizeYThisState;
+		CalculateWatermarks_params->DETBufferSizeC = mode_lib->ms.DETBufferSizeCThisState;
+		CalculateWatermarks_params->SwathHeightY = mode_lib->ms.SwathHeightYThisState;
+		CalculateWatermarks_params->SwathHeightC = mode_lib->ms.SwathHeightCThisState;
+		CalculateWatermarks_params->LBBitPerPixel = mode_lib->ms.cache_display_cfg.plane.LBBitPerPixel;
+		CalculateWatermarks_params->SwathWidthY = mode_lib->ms.SwathWidthYThisState;
+		CalculateWatermarks_params->SwathWidthC = mode_lib->ms.SwathWidthCThisState;
+		CalculateWatermarks_params->HRatio = mode_lib->ms.cache_display_cfg.plane.HRatio;
+		CalculateWatermarks_params->HRatioChroma = mode_lib->ms.cache_display_cfg.plane.HRatioChroma;
+		CalculateWatermarks_params->VTaps = mode_lib->ms.cache_display_cfg.plane.VTaps;
+		CalculateWatermarks_params->VTapsChroma = mode_lib->ms.cache_display_cfg.plane.VTapsChroma;
+		CalculateWatermarks_params->VRatio = mode_lib->ms.cache_display_cfg.plane.VRatio;
+		CalculateWatermarks_params->VRatioChroma = mode_lib->ms.cache_display_cfg.plane.VRatioChroma;
+		CalculateWatermarks_params->HTotal = mode_lib->ms.cache_display_cfg.timing.HTotal;
+		CalculateWatermarks_params->VTotal = mode_lib->ms.cache_display_cfg.timing.VTotal;
+		CalculateWatermarks_params->VActive = mode_lib->ms.cache_display_cfg.timing.VActive;
+		CalculateWatermarks_params->PixelClock = mode_lib->ms.cache_display_cfg.timing.PixelClock;
+		CalculateWatermarks_params->BlendingAndTiming = mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming;
+		CalculateWatermarks_params->DPPPerSurface = mode_lib->ms.NoOfDPPThisState;
+		CalculateWatermarks_params->BytePerPixelDETY = mode_lib->ms.BytePerPixelInDETY;
+		CalculateWatermarks_params->BytePerPixelDETC = mode_lib->ms.BytePerPixelInDETC;
+		CalculateWatermarks_params->DSTXAfterScaler = s->DSTXAfterScaler;
+		CalculateWatermarks_params->DSTYAfterScaler = s->DSTYAfterScaler;
+		CalculateWatermarks_params->WritebackEnable = mode_lib->ms.cache_display_cfg.writeback.WritebackEnable;
+		CalculateWatermarks_params->WritebackPixelFormat = mode_lib->ms.cache_display_cfg.writeback.WritebackPixelFormat;
+		CalculateWatermarks_params->WritebackDestinationWidth = mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth;
+		CalculateWatermarks_params->WritebackDestinationHeight = mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationHeight;
+		CalculateWatermarks_params->WritebackSourceHeight = mode_lib->ms.cache_display_cfg.writeback.WritebackSourceHeight;
+		CalculateWatermarks_params->UnboundedRequestEnabled = mode_lib->ms.UnboundedRequestEnabledThisState;
+		CalculateWatermarks_params->CompressedBufferSizeInkByte = mode_lib->ms.CompressedBufferSizeInkByteThisState;
 
-	mode_lib->ms.support.ExceededMultistreamSlots = false;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == k) {
-			s->TotalSlots = mode_lib->ms.RequiredSlots[k];
-			for (j = 0; j < mode_lib->ms.num_active_planes; ++j) {
-				if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[j] == k)
-					s->TotalSlots = s->TotalSlots + mode_lib->ms.RequiredSlots[j];
-			}
-			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp && s->TotalSlots > 63)
-				mode_lib->ms.support.ExceededMultistreamSlots = true;
-			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp2p0 && s->TotalSlots > 64)
-				mode_lib->ms.support.ExceededMultistreamSlots = true;
-		}
-	}
-	mode_lib->ms.support.LinkCapacitySupport = true;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.cache_display_cfg.output.OutputDisabled[k] == false &&
-			mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k && (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp2p0 || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_edp ||
-			mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmi || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl) && mode_lib->ms.OutputBppPerState[k] == 0) {
-			mode_lib->ms.support.LinkCapacitySupport = false;
-		}
-	}
+		// Output
+		CalculateWatermarks_params->Watermark = &s->dummy_watermark; // Watermarks *Watermark
+		CalculateWatermarks_params->DRAMClockChangeSupport = &mode_lib->ms.support.DRAMClockChangeSupport[j];
+		CalculateWatermarks_params->MaxActiveDRAMClockChangeLatencySupported = &s->dummy_single_array[0]; // dml_float_t *MaxActiveDRAMClockChangeLatencySupported[]
+		CalculateWatermarks_params->SubViewportLinesNeededInMALL = &mode_lib->ms.SubViewportLinesNeededInMALL[j]; // dml_uint_t SubViewportLinesNeededInMALL[]
+		CalculateWatermarks_params->FCLKChangeSupport = &mode_lib->ms.support.FCLKChangeSupport[j];
+		CalculateWatermarks_params->MaxActiveFCLKChangeLatencySupported = &s->dummy_single[0]; // dml_float_t *MaxActiveFCLKChangeLatencySupported
+		CalculateWatermarks_params->USRRetrainingSupport = &mode_lib->ms.support.USRRetrainingSupport[j];
+		CalculateWatermarks_params->ActiveDRAMClockChangeLatencyMargin = mode_lib->ms.support.ActiveDRAMClockChangeLatencyMargin;
+
+		CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(&mode_lib->scratch,
+			CalculateWatermarks_params);
 
-	mode_lib->ms.support.P2IWith420 = false;
-	mode_lib->ms.support.DSCOnlyIfNecessaryWithBPP = false;
-	mode_lib->ms.support.DSC422NativeNotSupported = false;
-	mode_lib->ms.support.LinkRateDoesNotMatchDPVersion = false;
-	mode_lib->ms.support.LinkRateForMultistreamNotIndicated = false;
-	mode_lib->ms.support.BPPForMultistreamNotIndicated = false;
-	mode_lib->ms.support.MultistreamWithHDMIOreDP = false;
-	mode_lib->ms.support.MSOOrODMSplitWithNonDPLink = false;
-	mode_lib->ms.support.NotEnoughLanesForMSO = false;
+	} // for j
+}
 
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k && (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp2p0 || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_edp ||
-														mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmi || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl)) {
-			if (mode_lib->ms.cache_display_cfg.output.OutputFormat[k] == dml_420 && mode_lib->ms.cache_display_cfg.timing.Interlace[k] == 1 && mode_lib->ms.ip.ptoi_supported == true)
-				mode_lib->ms.support.P2IWith420 = true;
+/// @brief The Mode Support function.
+dml_bool_t dml_core_mode_support(struct display_mode_lib_st *mode_lib)
+{
+	struct dml_core_mode_support_locals_st *s = &mode_lib->scratch.dml_core_mode_support_locals;
+	struct UseMinimumDCFCLK_params_st *UseMinimumDCFCLK_params = &mode_lib->scratch.UseMinimumDCFCLK_params;
+	struct CalculateSwathAndDETConfiguration_params_st *CalculateSwathAndDETConfiguration_params = &mode_lib->scratch.CalculateSwathAndDETConfiguration_params;
+	struct CalculateVMRowAndSwath_params_st *CalculateVMRowAndSwath_params = &mode_lib->scratch.CalculateVMRowAndSwath_params;
 
-			if (mode_lib->ms.cache_display_cfg.output.DSCEnable[k] == dml_dsc_enable_if_necessary && mode_lib->ms.cache_display_cfg.output.ForcedOutputLinkBPP[k] != 0)
-				mode_lib->ms.support.DSCOnlyIfNecessaryWithBPP = true;
-			if ((mode_lib->ms.cache_display_cfg.output.DSCEnable[k] == dml_dsc_enable || mode_lib->ms.cache_display_cfg.output.DSCEnable[k] == dml_dsc_enable_if_necessary) && mode_lib->ms.cache_display_cfg.output.OutputFormat[k] == dml_n422 && !mode_lib->ms.ip.dsc422_native_support)
-				mode_lib->ms.support.DSC422NativeNotSupported = true;
+	dml_uint_t j, k, m;
 
-			if (((mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_hbr || mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_hbr2 || mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_hbr3) &&
-					mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] != dml_dp && mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] != dml_edp) ||
-					((mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_uhbr10 || mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_uhbr13p5 || mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_uhbr20) &&
-					mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] != dml_dp2p0))
-				mode_lib->ms.support.LinkRateDoesNotMatchDPVersion = true;
+	mode_lib->ms.num_active_planes = dml_get_num_active_planes(&mode_lib->ms.cache_display_cfg);
+	dml_print("DML::%s: num_active_planes = %u\n", __func__, mode_lib->ms.num_active_planes);
 
-			if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamEn[k] == 1) {
-				if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == k && mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_na)
-					mode_lib->ms.support.LinkRateForMultistreamNotIndicated = true;
-				if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == k && mode_lib->ms.cache_display_cfg.output.ForcedOutputLinkBPP[k] == 0)
-					mode_lib->ms.support.BPPForMultistreamNotIndicated = true;
-				for (j = 0; j < mode_lib->ms.num_active_planes; ++j) {
-					if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == j && mode_lib->ms.cache_display_cfg.output.ForcedOutputLinkBPP[k] == 0)
-						mode_lib->ms.support.BPPForMultistreamNotIndicated = true;
-				}
-			}
+	CalculateMaxDETAndMinCompressedBufferSize(
+								mode_lib->ms.ip.config_return_buffer_size_in_kbytes,
+								mode_lib->ms.ip.config_return_buffer_segment_size_in_kbytes,
+								mode_lib->ms.ip.rob_buffer_size_kbytes,
+								mode_lib->ms.ip.max_num_dpp,
+								mode_lib->ms.policy.NomDETInKByteOverrideEnable,   // VBA_DELTA
+								mode_lib->ms.policy.NomDETInKByteOverrideValue,    // VBA_DELTA
 
-			if ((mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_edp || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmi || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl)) {
-				if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamEn[k] == 1 && mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == k)
-					mode_lib->ms.support.MultistreamWithHDMIOreDP = true;
-				for (j = 0; j < mode_lib->ms.num_active_planes; ++j) {
-					if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamEn[k] == 1 && mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == j)
-						mode_lib->ms.support.MultistreamWithHDMIOreDP = true;
-				}
-			}
-			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] != dml_dp && (mode_lib->ms.policy.ODMUse[k] == dml_odm_use_policy_split_1to2 ||
-				mode_lib->ms.policy.ODMUse[k] == dml_odm_use_policy_mso_1to2 || mode_lib->ms.policy.ODMUse[k] == dml_odm_use_policy_mso_1to4))
-				mode_lib->ms.support.MSOOrODMSplitWithNonDPLink = true;
+								/* Output */
+								&mode_lib->ms.MaxTotalDETInKByte,
+								&mode_lib->ms.NomDETInKByte,
+								&mode_lib->ms.MinCompressedBufferSizeInKByte);
 
-			if ((mode_lib->ms.policy.ODMUse[k] == dml_odm_use_policy_mso_1to2 && mode_lib->ms.cache_display_cfg.output.OutputLinkDPLanes[k] < 2) ||
-				(mode_lib->ms.policy.ODMUse[k] == dml_odm_use_policy_mso_1to4 && mode_lib->ms.cache_display_cfg.output.OutputLinkDPLanes[k] < 4))
-				mode_lib->ms.support.NotEnoughLanesForMSO = true;
+	PixelClockAdjustmentForProgressiveToInterlaceUnit(&mode_lib->ms.cache_display_cfg, mode_lib->ms.ip.ptoi_supported);
+
+
+	/*MODE SUPPORT, VOLTAGE STATE AND SOC CONFIGURATION*/
+
+	/*Scale Ratio, taps Support Check*/
+	mode_lib->ms.support.ScaleRatioAndTapsSupport = true;
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+		if (mode_lib->ms.cache_display_cfg.plane.ScalerEnabled[k] == false
+				&& ((mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_64
+						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_32
+						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_16
+						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_mono_16
+						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_mono_8
+						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_rgbe
+						&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_rgbe_alpha)
+						|| mode_lib->ms.cache_display_cfg.plane.HRatio[k] != 1.0
+						|| mode_lib->ms.cache_display_cfg.plane.HTaps[k] != 1.0
+						|| mode_lib->ms.cache_display_cfg.plane.VRatio[k] != 1.0
+						|| mode_lib->ms.cache_display_cfg.plane.VTaps[k] != 1.0)) {
+			mode_lib->ms.support.ScaleRatioAndTapsSupport = false;
+		} else if (mode_lib->ms.cache_display_cfg.plane.VTaps[k] < 1.0 || mode_lib->ms.cache_display_cfg.plane.VTaps[k] > 8.0
+				|| mode_lib->ms.cache_display_cfg.plane.HTaps[k] < 1.0 || mode_lib->ms.cache_display_cfg.plane.HTaps[k] > 8.0
+				|| (mode_lib->ms.cache_display_cfg.plane.HTaps[k] > 1.0 && (mode_lib->ms.cache_display_cfg.plane.HTaps[k] % 2) == 1)
+				|| mode_lib->ms.cache_display_cfg.plane.HRatio[k] > mode_lib->ms.ip.max_hscl_ratio
+				|| mode_lib->ms.cache_display_cfg.plane.VRatio[k] > mode_lib->ms.ip.max_vscl_ratio
+				|| mode_lib->ms.cache_display_cfg.plane.HRatio[k] > mode_lib->ms.cache_display_cfg.plane.HTaps[k]
+				|| mode_lib->ms.cache_display_cfg.plane.VRatio[k] > mode_lib->ms.cache_display_cfg.plane.VTaps[k]
+				|| (mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_64
+					&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_32
+					&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_444_16
+					&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_mono_16
+					&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_mono_8
+					&& mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_rgbe
+					&& (mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k] < 1 || mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k] > 8 || mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k] < 1 || mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k] > 8 ||
+						(mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k] > 1 && mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k] % 2 == 1) ||
+					mode_lib->ms.cache_display_cfg.plane.HRatioChroma[k] > mode_lib->ms.ip.max_hscl_ratio ||
+					mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k] > mode_lib->ms.ip.max_vscl_ratio ||
+					mode_lib->ms.cache_display_cfg.plane.HRatioChroma[k] > mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k] ||
+					mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k] > mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k]))) {
+			mode_lib->ms.support.ScaleRatioAndTapsSupport = false;
 		}
 	}
 
-	mode_lib->ms.support.DTBCLKRequiredMoreThanSupported = false;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k &&
-				mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl &&
-				RequiredDTBCLK(
-							mode_lib->ms.RequiresDSC[k],
-							mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k],
-							mode_lib->ms.cache_display_cfg.output.OutputFormat[k],
-							mode_lib->ms.OutputBppPerState[k],
-							mode_lib->ms.support.NumberOfDSCSlices[k],
-							mode_lib->ms.cache_display_cfg.timing.HTotal[k],
-							mode_lib->ms.cache_display_cfg.timing.HActive[k],
-							mode_lib->ms.cache_display_cfg.output.AudioSampleRate[k],
-							mode_lib->ms.cache_display_cfg.output.AudioSampleLayout[k]) > mode_lib->ms.state.dtbclk_mhz) {
-								mode_lib->ms.support.DTBCLKRequiredMoreThanSupported = true;
-							}
+	/*Source Format, Pixel Format and Scan Support Check*/
+	mode_lib->ms.support.SourceFormatPixelAndScanSupport = true;
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+			if (mode_lib->ms.cache_display_cfg.surface.SurfaceTiling[k] == dml_sw_linear && (!(!dml_is_vertical_rotation(mode_lib->ms.cache_display_cfg.plane.SourceScan[k])) || mode_lib->ms.cache_display_cfg.surface.DCCEnable[k] == true)) {
+			mode_lib->ms.support.SourceFormatPixelAndScanSupport = false;
+		}
 	}
 
-	mode_lib->ms.support.ODMCombineTwoToOneSupportCheckOK = true;
-	mode_lib->ms.support.ODMCombineFourToOneSupportCheckOK = true;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k && mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_2to1 && mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmi) {
-			mode_lib->ms.support.ODMCombineTwoToOneSupportCheckOK = false;
-		}
-		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k && mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_4to1 && (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp ||
-			mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_edp || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmi)) {
-			mode_lib->ms.support.ODMCombineFourToOneSupportCheckOK = false;
-		}
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+		CalculateBytePerPixelAndBlockSizes(
+								mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k],
+								mode_lib->ms.cache_display_cfg.surface.SurfaceTiling[k],
+
+								/* Output */
+								&mode_lib->ms.BytePerPixelY[k],
+								&mode_lib->ms.BytePerPixelC[k],
+								&mode_lib->ms.BytePerPixelInDETY[k],
+								&mode_lib->ms.BytePerPixelInDETC[k],
+								&mode_lib->ms.Read256BlockHeightY[k],
+								&mode_lib->ms.Read256BlockHeightC[k],
+								&mode_lib->ms.Read256BlockWidthY[k],
+								&mode_lib->ms.Read256BlockWidthC[k],
+								&mode_lib->ms.MacroTileHeightY[k],
+								&mode_lib->ms.MacroTileHeightC[k],
+								&mode_lib->ms.MacroTileWidthY[k],
+								&mode_lib->ms.MacroTileWidthC[k]);
 	}
 
-	mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = false;
+	/*Bandwidth Support Check*/
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k) {
-			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp ||
-				mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp2p0 ||
-				mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_edp ||
-				mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl) {
-				if (mode_lib->ms.cache_display_cfg.output.OutputFormat[k] == dml_420) {
-					s->DSCFormatFactor = 2;
-				} else if (mode_lib->ms.cache_display_cfg.output.OutputFormat[k] == dml_444) {
-					s->DSCFormatFactor = 1;
-				} else if (mode_lib->ms.cache_display_cfg.output.OutputFormat[k] == dml_n422 || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl) {
-					s->DSCFormatFactor = 2;
-				} else {
-					s->DSCFormatFactor = 1;
-				}
-#ifdef __DML_VBA_DEBUG__
-				dml_print("DML::%s: k=%u, RequiresDSC = %u\n",  __func__, k, mode_lib->ms.RequiresDSC[k]);
-#endif
-				if (mode_lib->ms.RequiresDSC[k] == true) {
-					if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_4to1) {
-						if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] / 12.0 / (dml_float_t)s->DSCFormatFactor > (1.0 - mode_lib->ms.soc.dcn_downspread_percent / 100.0) * mode_lib->ms.state.dscclk_mhz) {
-#ifdef __DML_VBA_DEBUG__
-							dml_print("DML::%s: k=%u, PixelClockBackEnd     = %f\n",  __func__, k, mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k]);
-							dml_print("DML::%s: k=%u, DSCCLKPerState        = %f\n",  __func__, k, mode_lib->ms.state.dscclk_mhz);
-							dml_print("DML::%s: k=%u, DSCFormatFactor       = %u\n",  __func__, k, s->DSCFormatFactor);
-#endif
-							mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = true;
-						}
-					} else if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_2to1) {
-						if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] / 6.0 / (dml_float_t)s->DSCFormatFactor > (1.0 - mode_lib->ms.soc.dcn_downspread_percent / 100.0) * mode_lib->ms.state.dscclk_mhz) {
-							mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = true;
-						}
-					} else {
-						if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] / 3.0 / (dml_float_t)s->DSCFormatFactor > (1.0 - mode_lib->ms.soc.dcn_downspread_percent / 100.0) * mode_lib->ms.state.dscclk_mhz) {
-							mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = true;
-						}
-					}
-				}
-			}
+		if (!dml_is_vertical_rotation(mode_lib->ms.cache_display_cfg.plane.SourceScan[k])) {
+			mode_lib->ms.SwathWidthYSingleDPP[k] = mode_lib->ms.cache_display_cfg.plane.ViewportWidth[k];
+			mode_lib->ms.SwathWidthCSingleDPP[k] = mode_lib->ms.cache_display_cfg.plane.ViewportWidthChroma[k];
+		} else {
+			mode_lib->ms.SwathWidthYSingleDPP[k] = mode_lib->ms.cache_display_cfg.plane.ViewportHeight[k];
+			mode_lib->ms.SwathWidthCSingleDPP[k] = mode_lib->ms.cache_display_cfg.plane.ViewportHeightChroma[k];
 		}
 	}
-#ifdef __DML_VBA_DEBUG__
-	dml_print("DML::%s: DSCCLKRequiredMoreThanSupported = %u\n",  __func__, mode_lib->ms.support.DSCCLKRequiredMoreThanSupported);
-#endif
-
-	/* Check DSC Unit and Slices Support */
-	mode_lib->ms.support.NotEnoughDSCUnits = false;
-	mode_lib->ms.support.NotEnoughDSCSlices = false;
-	s->TotalDSCUnitsRequired = 0;
-	mode_lib->ms.support.PixelsPerLinePerDSCUnitSupport = true;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.RequiresDSC[k] == true) {
-			if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_4to1) {
-				if (mode_lib->ms.cache_display_cfg.timing.HActive[k] > 4 * (dml_uint_t) mode_lib->ms.ip.maximum_pixels_per_line_per_dsc_unit)
-					mode_lib->ms.support.PixelsPerLinePerDSCUnitSupport = false;
-				s->TotalDSCUnitsRequired = s->TotalDSCUnitsRequired + 4;
-				if (mode_lib->ms.support.NumberOfDSCSlices[k] > 16)
-					mode_lib->ms.support.NotEnoughDSCSlices = true;
-			} else if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_2to1) {
-				if (mode_lib->ms.cache_display_cfg.timing.HActive[k] > 2 * (dml_uint_t) mode_lib->ms.ip.maximum_pixels_per_line_per_dsc_unit)
-					mode_lib->ms.support.PixelsPerLinePerDSCUnitSupport = false;
-				s->TotalDSCUnitsRequired = s->TotalDSCUnitsRequired + 2;
-				if (mode_lib->ms.support.NumberOfDSCSlices[k] > 8)
-					mode_lib->ms.support.NotEnoughDSCSlices = true;
-			} else {
-				if (mode_lib->ms.cache_display_cfg.timing.HActive[k] > (dml_uint_t) mode_lib->ms.ip.maximum_pixels_per_line_per_dsc_unit)
-					mode_lib->ms.support.PixelsPerLinePerDSCUnitSupport = false;
-				s->TotalDSCUnitsRequired = s->TotalDSCUnitsRequired + 1;
-				if (mode_lib->ms.support.NumberOfDSCSlices[k] > 4)
-					mode_lib->ms.support.NotEnoughDSCSlices = true;
-			}
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+		mode_lib->ms.ReadBandwidthLuma[k] = mode_lib->ms.SwathWidthYSingleDPP[k] * dml_ceil(mode_lib->ms.BytePerPixelInDETY[k], 1.0) / (mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * mode_lib->ms.cache_display_cfg.plane.VRatio[k];
+		mode_lib->ms.ReadBandwidthChroma[k] = mode_lib->ms.SwathWidthYSingleDPP[k] / 2 * dml_ceil(mode_lib->ms.BytePerPixelInDETC[k], 2.0) / (mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * mode_lib->ms.cache_display_cfg.plane.VRatio[k] / 2.0;
+	}
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+		if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true
+				&& mode_lib->ms.cache_display_cfg.writeback.WritebackPixelFormat[k] == dml_444_64) {
+			mode_lib->ms.WriteBandwidth[k] = mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[k]
+					* mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationHeight[k]
+					/ (mode_lib->ms.cache_display_cfg.writeback.WritebackSourceHeight[k]
+							* mode_lib->ms.cache_display_cfg.timing.HTotal[k]
+							/ mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * 8.0;
+		} else if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true) {
+			mode_lib->ms.WriteBandwidth[k] = mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[k]
+					* mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationHeight[k]
+					/ (mode_lib->ms.cache_display_cfg.writeback.WritebackSourceHeight[k]
+							* mode_lib->ms.cache_display_cfg.timing.HTotal[k]
+							/ mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * 4.0;
+		} else {
+			mode_lib->ms.WriteBandwidth[k] = 0.0;
 		}
 	}
-   if (s->TotalDSCUnitsRequired > (dml_uint_t) mode_lib->ms.ip.num_dsc) {
-		mode_lib->ms.support.NotEnoughDSCUnits = true;
+
+	/*Writeback Latency support check*/
+	mode_lib->ms.support.WritebackLatencySupport = true;
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+		if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true &&
+			(mode_lib->ms.WriteBandwidth[k] > mode_lib->ms.ip.writeback_interface_buffer_size_kbytes * 1024 / mode_lib->ms.state.writeback_latency_us)) {
+			mode_lib->ms.support.WritebackLatencySupport = false;
+		}
 	}
 
-	/*DSC Delay per state*/
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		mode_lib->ms.DSCDelayPerState[k] = DSCDelayRequirement(mode_lib->ms.RequiresDSC[k],
-													mode_lib->ms.ODMModePerState[k],
-													mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k],
-													mode_lib->ms.OutputBppPerState[k],
-													mode_lib->ms.cache_display_cfg.timing.HActive[k],
-													mode_lib->ms.cache_display_cfg.timing.HTotal[k],
-													mode_lib->ms.support.NumberOfDSCSlices[k],
-													mode_lib->ms.cache_display_cfg.output.OutputFormat[k],
-													mode_lib->ms.cache_display_cfg.output.OutputEncoder[k],
-													mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
-													mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k]);
+	/*Writeback Mode Support Check*/
+	s->TotalNumberOfActiveWriteback = 0;
+	for (k = 0; k <= (dml_uint_t) mode_lib->ms.num_active_planes - 1; k++) {
+		if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true) {
+			s->TotalNumberOfActiveWriteback = s->TotalNumberOfActiveWriteback + 1;
+		}
+   }
+
+	mode_lib->ms.support.EnoughWritebackUnits = 1;
+	if (s->TotalNumberOfActiveWriteback > (dml_uint_t) mode_lib->ms.ip.max_num_wb) {
+		mode_lib->ms.support.EnoughWritebackUnits = false;
 	}
 
+	/*Writeback Scale Ratio and Taps Support Check*/
+	mode_lib->ms.support.WritebackScaleRatioAndTapsSupport = true;
 	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-		for (m = 0; m <= mode_lib->ms.num_active_planes - 1; m++) {
-			for (j = 0; j <= mode_lib->ms.num_active_planes - 1; j++) {
-				if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == m && mode_lib->ms.RequiresDSC[m] == true) {
-					mode_lib->ms.DSCDelayPerState[k] = mode_lib->ms.DSCDelayPerState[m];
-				}
+		if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true) {
+			if (mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[k] > mode_lib->ms.ip.writeback_max_hscl_ratio
+				|| mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[k] > mode_lib->ms.ip.writeback_max_vscl_ratio
+				|| mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[k] < mode_lib->ms.ip.writeback_min_hscl_ratio
+				|| mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[k] < mode_lib->ms.ip.writeback_min_vscl_ratio
+				|| mode_lib->ms.cache_display_cfg.writeback.WritebackHTaps[k] > (dml_uint_t) mode_lib->ms.ip.writeback_max_hscl_taps
+				|| mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[k] > (dml_uint_t) mode_lib->ms.ip.writeback_max_vscl_taps
+				|| mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[k] > (dml_uint_t) mode_lib->ms.cache_display_cfg.writeback.WritebackHTaps[k]
+				|| mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[k] > (dml_uint_t) mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[k]
+				|| (mode_lib->ms.cache_display_cfg.writeback.WritebackHTaps[k] > 2.0 && ((mode_lib->ms.cache_display_cfg.writeback.WritebackHTaps[k] % 2) == 1))) {
+				mode_lib->ms.support.WritebackScaleRatioAndTapsSupport = false;
+			}
+			if (2.0 * mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[k] * (mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[k] - 1) * 57 > mode_lib->ms.ip.writeback_line_buffer_buffer_size) {
+				mode_lib->ms.support.WritebackScaleRatioAndTapsSupport = false;
 			}
 		}
 	}
 
-	//Calculate Swath, DET Configuration, DCFCLKDeepSleep
-	//
-	for (j = 0; j < 2; ++j) {
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.RequiredDPPCLKThisState[k] = mode_lib->ms.RequiredDPPCLKPerSurface[j][k];
-			mode_lib->ms.NoOfDPPThisState[k] = mode_lib->ms.NoOfDPP[j][k];
-			mode_lib->ms.ODMModeThisState[k] = mode_lib->ms.ODMModePerState[k];
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+		CalculateSinglePipeDPPCLKAndSCLThroughput(
+				mode_lib->ms.cache_display_cfg.plane.HRatio[k],
+				mode_lib->ms.cache_display_cfg.plane.HRatioChroma[k],
+				mode_lib->ms.cache_display_cfg.plane.VRatio[k],
+				mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k],
+				mode_lib->ms.ip.max_dchub_pscl_bw_pix_per_clk,
+				mode_lib->ms.ip.max_pscl_lb_bw_pix_per_clk,
+				mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
+				mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k],
+				mode_lib->ms.cache_display_cfg.plane.HTaps[k],
+				mode_lib->ms.cache_display_cfg.plane.HTapsChroma[k],
+				mode_lib->ms.cache_display_cfg.plane.VTaps[k],
+				mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k],
+				/* Output */
+				&mode_lib->ms.PSCL_FACTOR[k],
+				&mode_lib->ms.PSCL_FACTOR_CHROMA[k],
+				&mode_lib->ms.MinDPPCLKUsingSingleDPP[k]);
+	}
+
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+		if (mode_lib->ms.cache_display_cfg.surface.SurfaceTiling[k] == dml_sw_linear) {
+			s->MaximumSwathWidthSupportLuma = 8192;
+		} else if (!dml_is_vertical_rotation(mode_lib->ms.cache_display_cfg.plane.SourceScan[k]) && mode_lib->ms.BytePerPixelC[k] > 0 && mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_rgbe_alpha) {
+			s->MaximumSwathWidthSupportLuma = 7680;
+		} else if (dml_is_vertical_rotation(mode_lib->ms.cache_display_cfg.plane.SourceScan[k]) && mode_lib->ms.BytePerPixelC[k] > 0 && mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] != dml_rgbe_alpha) {
+			s->MaximumSwathWidthSupportLuma = 4320;
+		} else if (mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_rgbe_alpha) {
+			s->MaximumSwathWidthSupportLuma = 3840;
+		} else if (dml_is_vertical_rotation(mode_lib->ms.cache_display_cfg.plane.SourceScan[k]) && mode_lib->ms.BytePerPixelY[k] == 8 && mode_lib->ms.cache_display_cfg.surface.DCCEnable[k] == true) {
+			s->MaximumSwathWidthSupportLuma = 3072;
+		} else {
+			s->MaximumSwathWidthSupportLuma = 6144;
 		}
 
-		CalculateSwathAndDETConfiguration_params->DETSizeOverride = mode_lib->ms.cache_display_cfg.plane.DETSizeOverride;
-		CalculateSwathAndDETConfiguration_params->UseMALLForPStateChange = mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange;
-		CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSizeInKByte = mode_lib->ms.ip.config_return_buffer_size_in_kbytes;
-		CalculateSwathAndDETConfiguration_params->ROBBufferSizeInKByte = mode_lib->ms.ip.rob_buffer_size_kbytes;
-		CalculateSwathAndDETConfiguration_params->MaxTotalDETInKByte = mode_lib->ms.MaxTotalDETInKByte;
-		CalculateSwathAndDETConfiguration_params->MinCompressedBufferSizeInKByte = mode_lib->ms.MinCompressedBufferSizeInKByte;
-		CalculateSwathAndDETConfiguration_params->PixelChunkSizeInKByte = mode_lib->ms.ip.pixel_chunk_size_kbytes;
-		CalculateSwathAndDETConfiguration_params->ForceSingleDPP = false;
-		CalculateSwathAndDETConfiguration_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
-		CalculateSwathAndDETConfiguration_params->nomDETInKByte = mode_lib->ms.NomDETInKByte;
-		CalculateSwathAndDETConfiguration_params->UseUnboundedRequestingFinal = mode_lib->ms.policy.UseUnboundedRequesting;
-		CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSegmentSizeInkByte = mode_lib->ms.ip.config_return_buffer_segment_size_in_kbytes;
-		CalculateSwathAndDETConfiguration_params->CompressedBufferSegmentSizeInkByteFinal = mode_lib->ms.ip.compressed_buffer_segment_size_in_kbytes;
-		CalculateSwathAndDETConfiguration_params->Output = mode_lib->ms.cache_display_cfg.output.OutputEncoder;
-		CalculateSwathAndDETConfiguration_params->ReadBandwidthLuma = mode_lib->ms.ReadBandwidthLuma;
-		CalculateSwathAndDETConfiguration_params->ReadBandwidthChroma = mode_lib->ms.ReadBandwidthChroma;
-		CalculateSwathAndDETConfiguration_params->MaximumSwathWidthLuma = mode_lib->ms.MaximumSwathWidthLuma;
-		CalculateSwathAndDETConfiguration_params->MaximumSwathWidthChroma = mode_lib->ms.MaximumSwathWidthChroma;
-		CalculateSwathAndDETConfiguration_params->SourceScan = mode_lib->ms.cache_display_cfg.plane.SourceScan;
-		CalculateSwathAndDETConfiguration_params->ViewportStationary = mode_lib->ms.cache_display_cfg.plane.ViewportStationary;
-		CalculateSwathAndDETConfiguration_params->SourcePixelFormat = mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat;
-		CalculateSwathAndDETConfiguration_params->SurfaceTiling = mode_lib->ms.cache_display_cfg.surface.SurfaceTiling;
-		CalculateSwathAndDETConfiguration_params->ViewportWidth = mode_lib->ms.cache_display_cfg.plane.ViewportWidth;
-		CalculateSwathAndDETConfiguration_params->ViewportHeight = mode_lib->ms.cache_display_cfg.plane.ViewportHeight;
-		CalculateSwathAndDETConfiguration_params->ViewportXStart = mode_lib->ms.cache_display_cfg.plane.ViewportXStart;
-		CalculateSwathAndDETConfiguration_params->ViewportYStart = mode_lib->ms.cache_display_cfg.plane.ViewportYStart;
-		CalculateSwathAndDETConfiguration_params->ViewportXStartC = mode_lib->ms.cache_display_cfg.plane.ViewportXStartC;
-		CalculateSwathAndDETConfiguration_params->ViewportYStartC = mode_lib->ms.cache_display_cfg.plane.ViewportYStartC;
-		CalculateSwathAndDETConfiguration_params->SurfaceWidthY = mode_lib->ms.cache_display_cfg.surface.SurfaceWidthY;
-		CalculateSwathAndDETConfiguration_params->SurfaceWidthC = mode_lib->ms.cache_display_cfg.surface.SurfaceWidthC;
-		CalculateSwathAndDETConfiguration_params->SurfaceHeightY = mode_lib->ms.cache_display_cfg.surface.SurfaceHeightY;
-		CalculateSwathAndDETConfiguration_params->SurfaceHeightC = mode_lib->ms.cache_display_cfg.surface.SurfaceHeightC;
-		CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightY = mode_lib->ms.Read256BlockHeightY;
-		CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightC = mode_lib->ms.Read256BlockHeightC;
-		CalculateSwathAndDETConfiguration_params->Read256BytesBlockWidthY = mode_lib->ms.Read256BlockWidthY;
-		CalculateSwathAndDETConfiguration_params->Read256BytesBlockWidthC = mode_lib->ms.Read256BlockWidthC;
-		CalculateSwathAndDETConfiguration_params->ODMMode = mode_lib->ms.ODMModeThisState;
-		CalculateSwathAndDETConfiguration_params->BlendingAndTiming = mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming;
-		CalculateSwathAndDETConfiguration_params->BytePerPixY = mode_lib->ms.BytePerPixelY;
-		CalculateSwathAndDETConfiguration_params->BytePerPixC = mode_lib->ms.BytePerPixelC;
-		CalculateSwathAndDETConfiguration_params->BytePerPixDETY = mode_lib->ms.BytePerPixelInDETY;
-		CalculateSwathAndDETConfiguration_params->BytePerPixDETC = mode_lib->ms.BytePerPixelInDETC;
-		CalculateSwathAndDETConfiguration_params->HActive = mode_lib->ms.cache_display_cfg.timing.HActive;
-		CalculateSwathAndDETConfiguration_params->HRatio = mode_lib->ms.cache_display_cfg.plane.HRatio;
-		CalculateSwathAndDETConfiguration_params->HRatioChroma = mode_lib->ms.cache_display_cfg.plane.HRatioChroma;
-		CalculateSwathAndDETConfiguration_params->DPPPerSurface = mode_lib->ms.NoOfDPPThisState;
-		CalculateSwathAndDETConfiguration_params->swath_width_luma_ub = mode_lib->ms.swath_width_luma_ub_this_state;
-		CalculateSwathAndDETConfiguration_params->swath_width_chroma_ub = mode_lib->ms.swath_width_chroma_ub_this_state;
-		CalculateSwathAndDETConfiguration_params->SwathWidth = mode_lib->ms.SwathWidthYThisState;
-		CalculateSwathAndDETConfiguration_params->SwathWidthChroma = mode_lib->ms.SwathWidthCThisState;
-		CalculateSwathAndDETConfiguration_params->SwathHeightY = mode_lib->ms.SwathHeightYThisState;
-		CalculateSwathAndDETConfiguration_params->SwathHeightC = mode_lib->ms.SwathHeightCThisState;
-		CalculateSwathAndDETConfiguration_params->DETBufferSizeInKByte = mode_lib->ms.DETBufferSizeInKByteThisState;
-		CalculateSwathAndDETConfiguration_params->DETBufferSizeY = mode_lib->ms.DETBufferSizeYThisState;
-		CalculateSwathAndDETConfiguration_params->DETBufferSizeC = mode_lib->ms.DETBufferSizeCThisState;
-		CalculateSwathAndDETConfiguration_params->UnboundedRequestEnabled = &mode_lib->ms.UnboundedRequestEnabledThisState;
-		CalculateSwathAndDETConfiguration_params->compbuf_reserved_space_64b = &s->dummy_integer[2];
-		CalculateSwathAndDETConfiguration_params->compbuf_reserved_space_zs = &s->dummy_integer[1];
-		CalculateSwathAndDETConfiguration_params->CompressedBufferSizeInkByte = &mode_lib->ms.CompressedBufferSizeInkByteThisState;
-		CalculateSwathAndDETConfiguration_params->ViewportSizeSupportPerSurface = s->dummy_boolean_array[0];
-		CalculateSwathAndDETConfiguration_params->ViewportSizeSupport = &mode_lib->ms.support.ViewportSizeSupport[j];
+       if (mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_8 || mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_10 || mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_12) {
+			s->MaximumSwathWidthSupportChroma = (dml_uint_t)(s->MaximumSwathWidthSupportLuma / 2.0);
+		} else {
+			s->MaximumSwathWidthSupportChroma = s->MaximumSwathWidthSupportLuma;
+       }
+		mode_lib->ms.MaximumSwathWidthInLineBufferLuma = mode_lib->ms.ip.line_buffer_size_bits * dml_max(mode_lib->ms.cache_display_cfg.plane.HRatio[k], 1.0) / mode_lib->ms.cache_display_cfg.plane.LBBitPerPixel[k] /
+															(mode_lib->ms.cache_display_cfg.plane.VTaps[k] + dml_max(dml_ceil(mode_lib->ms.cache_display_cfg.plane.VRatio[k], 1.0) - 2, 0.0));
+		if (mode_lib->ms.BytePerPixelC[k] == 0.0) {
+			mode_lib->ms.MaximumSwathWidthInLineBufferChroma = 0;
+		} else {
+			mode_lib->ms.MaximumSwathWidthInLineBufferChroma =
+							mode_lib->ms.ip.line_buffer_size_bits
+									* dml_max(mode_lib->ms.cache_display_cfg.plane.HRatioChroma[k], 1.0)
+									/ mode_lib->ms.cache_display_cfg.plane.LBBitPerPixel[k]
+									/ (mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k]
+									+ dml_max(dml_ceil(mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k], 1.0) - 2, 0.0));
+		}
+		mode_lib->ms.MaximumSwathWidthLuma[k] = dml_min(s->MaximumSwathWidthSupportLuma, mode_lib->ms.MaximumSwathWidthInLineBufferLuma);
+		mode_lib->ms.MaximumSwathWidthChroma[k] = dml_min(s->MaximumSwathWidthSupportChroma, mode_lib->ms.MaximumSwathWidthInLineBufferChroma);
+	}
 
-		CalculateSwathAndDETConfiguration(&mode_lib->scratch,
-		CalculateSwathAndDETConfiguration_params);
+	/*Number Of DSC Slices*/
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k) {
+			if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] > 4800) {
+				mode_lib->ms.support.NumberOfDSCSlices[k] = (dml_uint_t)(dml_ceil(mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] / 600, 4));
+			} else if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] > 2400) {
+				mode_lib->ms.support.NumberOfDSCSlices[k] = 8;
+			} else if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] > 1200) {
+				mode_lib->ms.support.NumberOfDSCSlices[k] = 4;
+			} else if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] > 340) {
+				mode_lib->ms.support.NumberOfDSCSlices[k] = 2;
+			} else {
+				mode_lib->ms.support.NumberOfDSCSlices[k] = 1;
+			}
+		} else {
+			mode_lib->ms.support.NumberOfDSCSlices[k] = 0;
+		}
+	}
+
+	CalculateSwathAndDETConfiguration_params->DETSizeOverride = mode_lib->ms.cache_display_cfg.plane.DETSizeOverride;
+	CalculateSwathAndDETConfiguration_params->UseMALLForPStateChange = mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange;
+	CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSizeInKByte = mode_lib->ms.ip.config_return_buffer_size_in_kbytes;
+	CalculateSwathAndDETConfiguration_params->ROBBufferSizeInKByte = mode_lib->ms.ip.rob_buffer_size_kbytes;
+	CalculateSwathAndDETConfiguration_params->MaxTotalDETInKByte = mode_lib->ms.MaxTotalDETInKByte;
+	CalculateSwathAndDETConfiguration_params->MinCompressedBufferSizeInKByte = mode_lib->ms.MinCompressedBufferSizeInKByte;
+	CalculateSwathAndDETConfiguration_params->PixelChunkSizeInKByte = mode_lib->ms.ip.pixel_chunk_size_kbytes;
+	CalculateSwathAndDETConfiguration_params->ForceSingleDPP = 1;
+	CalculateSwathAndDETConfiguration_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
+	CalculateSwathAndDETConfiguration_params->nomDETInKByte = mode_lib->ms.NomDETInKByte;
+	CalculateSwathAndDETConfiguration_params->UseUnboundedRequestingFinal = mode_lib->ms.policy.UseUnboundedRequesting;
+	CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSegmentSizeInkByte = mode_lib->ms.ip.config_return_buffer_segment_size_in_kbytes;
+	CalculateSwathAndDETConfiguration_params->CompressedBufferSegmentSizeInkByteFinal = mode_lib->ms.ip.compressed_buffer_segment_size_in_kbytes;
+	CalculateSwathAndDETConfiguration_params->Output = mode_lib->ms.cache_display_cfg.output.OutputEncoder;
+	CalculateSwathAndDETConfiguration_params->ReadBandwidthLuma = mode_lib->ms.ReadBandwidthLuma;
+	CalculateSwathAndDETConfiguration_params->ReadBandwidthChroma = mode_lib->ms.ReadBandwidthChroma;
+	CalculateSwathAndDETConfiguration_params->MaximumSwathWidthLuma = mode_lib->ms.MaximumSwathWidthLuma;
+	CalculateSwathAndDETConfiguration_params->MaximumSwathWidthChroma = mode_lib->ms.MaximumSwathWidthChroma;
+	CalculateSwathAndDETConfiguration_params->SourceScan = mode_lib->ms.cache_display_cfg.plane.SourceScan;
+	CalculateSwathAndDETConfiguration_params->ViewportStationary = mode_lib->ms.cache_display_cfg.plane.ViewportStationary;
+	CalculateSwathAndDETConfiguration_params->SourcePixelFormat = mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat;
+	CalculateSwathAndDETConfiguration_params->SurfaceTiling = mode_lib->ms.cache_display_cfg.surface.SurfaceTiling;
+	CalculateSwathAndDETConfiguration_params->ViewportWidth = mode_lib->ms.cache_display_cfg.plane.ViewportWidth;
+	CalculateSwathAndDETConfiguration_params->ViewportHeight = mode_lib->ms.cache_display_cfg.plane.ViewportHeight;
+	CalculateSwathAndDETConfiguration_params->ViewportXStart = mode_lib->ms.cache_display_cfg.plane.ViewportXStart;
+	CalculateSwathAndDETConfiguration_params->ViewportYStart = mode_lib->ms.cache_display_cfg.plane.ViewportYStart;
+	CalculateSwathAndDETConfiguration_params->ViewportXStartC = mode_lib->ms.cache_display_cfg.plane.ViewportXStartC;
+	CalculateSwathAndDETConfiguration_params->ViewportYStartC = mode_lib->ms.cache_display_cfg.plane.ViewportYStartC;
+	CalculateSwathAndDETConfiguration_params->SurfaceWidthY = mode_lib->ms.cache_display_cfg.surface.SurfaceWidthY;
+	CalculateSwathAndDETConfiguration_params->SurfaceWidthC = mode_lib->ms.cache_display_cfg.surface.SurfaceWidthC;
+	CalculateSwathAndDETConfiguration_params->SurfaceHeightY = mode_lib->ms.cache_display_cfg.surface.SurfaceHeightY;
+	CalculateSwathAndDETConfiguration_params->SurfaceHeightC = mode_lib->ms.cache_display_cfg.surface.SurfaceHeightC;
+	CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightY = mode_lib->ms.Read256BlockHeightY;
+	CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightC = mode_lib->ms.Read256BlockHeightC;
+	CalculateSwathAndDETConfiguration_params->Read256BytesBlockWidthY = mode_lib->ms.Read256BlockWidthY;
+	CalculateSwathAndDETConfiguration_params->Read256BytesBlockWidthC = mode_lib->ms.Read256BlockWidthC;
+	CalculateSwathAndDETConfiguration_params->ODMMode = s->dummy_odm_mode;
+	CalculateSwathAndDETConfiguration_params->BlendingAndTiming = mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming;
+	CalculateSwathAndDETConfiguration_params->BytePerPixY = mode_lib->ms.BytePerPixelY;
+	CalculateSwathAndDETConfiguration_params->BytePerPixC = mode_lib->ms.BytePerPixelC;
+	CalculateSwathAndDETConfiguration_params->BytePerPixDETY = mode_lib->ms.BytePerPixelInDETY;
+	CalculateSwathAndDETConfiguration_params->BytePerPixDETC = mode_lib->ms.BytePerPixelInDETC;
+	CalculateSwathAndDETConfiguration_params->HActive = mode_lib->ms.cache_display_cfg.timing.HActive;
+	CalculateSwathAndDETConfiguration_params->HRatio = mode_lib->ms.cache_display_cfg.plane.HRatio;
+	CalculateSwathAndDETConfiguration_params->HRatioChroma = mode_lib->ms.cache_display_cfg.plane.HRatioChroma;
+	CalculateSwathAndDETConfiguration_params->DPPPerSurface = s->dummy_integer_array[0];
+	CalculateSwathAndDETConfiguration_params->swath_width_luma_ub = s->dummy_integer_array[1];
+	CalculateSwathAndDETConfiguration_params->swath_width_chroma_ub = s->dummy_integer_array[2];
+	CalculateSwathAndDETConfiguration_params->SwathWidth = s->dummy_integer_array[3];
+	CalculateSwathAndDETConfiguration_params->SwathWidthChroma = s->dummy_integer_array[4];
+	CalculateSwathAndDETConfiguration_params->SwathHeightY = s->dummy_integer_array[5];
+	CalculateSwathAndDETConfiguration_params->SwathHeightC = s->dummy_integer_array[6];
+	CalculateSwathAndDETConfiguration_params->DETBufferSizeInKByte = s->dummy_integer_array[7];
+	CalculateSwathAndDETConfiguration_params->DETBufferSizeY = mode_lib->ms.DETBufferSizeY;
+	CalculateSwathAndDETConfiguration_params->DETBufferSizeC = mode_lib->ms.DETBufferSizeC;
+	CalculateSwathAndDETConfiguration_params->UnboundedRequestEnabled = &s->dummy_boolean[0];
+	CalculateSwathAndDETConfiguration_params->compbuf_reserved_space_64b = &s->dummy_integer[2];
+	CalculateSwathAndDETConfiguration_params->compbuf_reserved_space_zs = &s->dummy_integer[1];
+	CalculateSwathAndDETConfiguration_params->CompressedBufferSizeInkByte = &s->dummy_integer[0];
+	CalculateSwathAndDETConfiguration_params->ViewportSizeSupportPerSurface = mode_lib->ms.SingleDPPViewportSizeSupportPerSurface;
+	CalculateSwathAndDETConfiguration_params->ViewportSizeSupport = &s->dummy_boolean[1];
 
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.swath_width_luma_ub_all_states[j][k] = mode_lib->ms.swath_width_luma_ub_this_state[k];
-			mode_lib->ms.swath_width_chroma_ub_all_states[j][k] = mode_lib->ms.swath_width_chroma_ub_this_state[k];
-			mode_lib->ms.SwathWidthYAllStates[j][k] = mode_lib->ms.SwathWidthYThisState[k];
-			mode_lib->ms.SwathWidthCAllStates[j][k] = mode_lib->ms.SwathWidthCThisState[k];
-			mode_lib->ms.SwathHeightYAllStates[j][k] = mode_lib->ms.SwathHeightYThisState[k];
-			mode_lib->ms.SwathHeightCAllStates[j][k] = mode_lib->ms.SwathHeightCThisState[k];
-			mode_lib->ms.UnboundedRequestEnabledAllStates[j] = mode_lib->ms.UnboundedRequestEnabledThisState;
-			mode_lib->ms.CompressedBufferSizeInkByteAllStates[j] = mode_lib->ms.CompressedBufferSizeInkByteThisState;
-			mode_lib->ms.DETBufferSizeInKByteAllStates[j][k] = mode_lib->ms.DETBufferSizeInKByteThisState[k];
-			mode_lib->ms.DETBufferSizeYAllStates[j][k] = mode_lib->ms.DETBufferSizeYThisState[k];
-			mode_lib->ms.DETBufferSizeCAllStates[j][k] = mode_lib->ms.DETBufferSizeCThisState[k];
-		}
-	}
+	CalculateSwathAndDETConfiguration(&mode_lib->scratch,
+	CalculateSwathAndDETConfiguration_params); /* dml_bool_t *ViewportSizeSupport */
 
+	s->MPCCombineMethodAsNeededForPStateChangeAndVoltage = false;
+	s->MPCCombineMethodAsPossible = false;
 	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		mode_lib->ms.cursor_bw[k] = mode_lib->ms.cache_display_cfg.plane.NumberOfCursors[k] * mode_lib->ms.cache_display_cfg.plane.CursorWidth[k] * mode_lib->ms.cache_display_cfg.plane.CursorBPP[k] / 8.0 / (mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * mode_lib->ms.cache_display_cfg.plane.VRatio[k];
+		if (mode_lib->ms.policy.MPCCombineUse[k] == dml_mpc_as_needed_for_pstate_and_voltage)
+			s->MPCCombineMethodAsNeededForPStateChangeAndVoltage = true;
+		if (mode_lib->ms.policy.MPCCombineUse[k] == dml_mpc_as_possible)
+			s->MPCCombineMethodAsPossible = true;
 	}
+	mode_lib->ms.support.MPCCombineMethodIncompatible = s->MPCCombineMethodAsNeededForPStateChangeAndVoltage && s->MPCCombineMethodAsPossible;
 
-	CalculateSurfaceSizeInMall(
-			mode_lib->ms.num_active_planes,
-			mode_lib->ms.soc.mall_allocated_for_dcn_mbytes,
-			mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen,
-			mode_lib->ms.cache_display_cfg.surface.DCCEnable,
-			mode_lib->ms.cache_display_cfg.plane.ViewportStationary,
-			mode_lib->ms.cache_display_cfg.plane.ViewportXStart,
-			mode_lib->ms.cache_display_cfg.plane.ViewportYStart,
-			mode_lib->ms.cache_display_cfg.plane.ViewportXStartC,
-			mode_lib->ms.cache_display_cfg.plane.ViewportYStartC,
-			mode_lib->ms.cache_display_cfg.plane.ViewportWidth,
-			mode_lib->ms.cache_display_cfg.plane.ViewportHeight,
-			mode_lib->ms.BytePerPixelY,
-			mode_lib->ms.cache_display_cfg.plane.ViewportWidthChroma,
-			mode_lib->ms.cache_display_cfg.plane.ViewportHeightChroma,
-			mode_lib->ms.BytePerPixelC,
-			mode_lib->ms.cache_display_cfg.surface.SurfaceWidthY,
-			mode_lib->ms.cache_display_cfg.surface.SurfaceWidthC,
-			mode_lib->ms.cache_display_cfg.surface.SurfaceHeightY,
-			mode_lib->ms.cache_display_cfg.surface.SurfaceHeightC,
-			mode_lib->ms.Read256BlockWidthY,
-			mode_lib->ms.Read256BlockWidthC,
-			mode_lib->ms.Read256BlockHeightY,
-			mode_lib->ms.Read256BlockHeightC,
-			mode_lib->ms.MacroTileWidthY,
-			mode_lib->ms.MacroTileWidthC,
-			mode_lib->ms.MacroTileHeightY,
-			mode_lib->ms.MacroTileHeightC,
+	for (j = 0; j < 2; j++) {
+		mode_lib->ms.TotalNumberOfActiveDPP[j] = 0;
+		mode_lib->ms.support.TotalAvailablePipesSupport[j] = true;
 
-			/* Output */
-			mode_lib->ms.SurfaceSizeInMALL,
-			&mode_lib->ms.support.ExceededMALLSize);
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			CalculateODMMode(
+					mode_lib->ms.ip.maximum_pixels_per_line_per_dsc_unit,
+					mode_lib->ms.cache_display_cfg.timing.HActive[k],
+					mode_lib->ms.cache_display_cfg.output.OutputEncoder[k],
+					mode_lib->ms.cache_display_cfg.output.OutputFormat[k],
+					mode_lib->ms.policy.ODMUse[k],
+					mode_lib->ms.state.dispclk_mhz,
+					mode_lib->ms.max_state.dispclk_mhz,
+					false, // DSCEnable
+					mode_lib->ms.TotalNumberOfActiveDPP[j],
+					mode_lib->ms.ip.max_num_dpp,
+					mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
+					mode_lib->ms.soc.dcn_downspread_percent,
+					mode_lib->ms.ip.dispclk_ramp_margin_percent,
+					mode_lib->ms.soc.dispclk_dppclk_vco_speed_mhz,
 
-	for (j = 0; j < 2; j++) {
-		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-			mode_lib->ms.swath_width_luma_ub_this_state[k] = mode_lib->ms.swath_width_luma_ub_all_states[j][k];
-			mode_lib->ms.swath_width_chroma_ub_this_state[k] = mode_lib->ms.swath_width_chroma_ub_all_states[j][k];
-			mode_lib->ms.SwathWidthYThisState[k] = mode_lib->ms.SwathWidthYAllStates[j][k];
-			mode_lib->ms.SwathWidthCThisState[k] = mode_lib->ms.SwathWidthCAllStates[j][k];
-			mode_lib->ms.SwathHeightYThisState[k] = mode_lib->ms.SwathHeightYAllStates[j][k];
-			mode_lib->ms.SwathHeightCThisState[k] = mode_lib->ms.SwathHeightCAllStates[j][k];
-			mode_lib->ms.DETBufferSizeInKByteThisState[k] = mode_lib->ms.DETBufferSizeInKByteAllStates[j][k];
-			mode_lib->ms.DETBufferSizeYThisState[k] = mode_lib->ms.DETBufferSizeYAllStates[j][k];
-			mode_lib->ms.DETBufferSizeCThisState[k] = mode_lib->ms.DETBufferSizeCAllStates[j][k];
-			mode_lib->ms.RequiredDPPCLKThisState[k] = mode_lib->ms.RequiredDPPCLKPerSurface[j][k];
-			mode_lib->ms.NoOfDPPThisState[k] = mode_lib->ms.NoOfDPP[j][k];
+					/* Output */
+					&s->TotalAvailablePipesSupportNoDSC,
+					&s->NumberOfDPPNoDSC,
+					&s->ODMModeNoDSC,
+					&s->RequiredDISPCLKPerSurfaceNoDSC);
+
+			CalculateODMMode(
+					mode_lib->ms.ip.maximum_pixels_per_line_per_dsc_unit,
+					mode_lib->ms.cache_display_cfg.timing.HActive[k],
+					mode_lib->ms.cache_display_cfg.output.OutputEncoder[k],
+					mode_lib->ms.cache_display_cfg.output.OutputFormat[k],
+					mode_lib->ms.policy.ODMUse[k],
+					mode_lib->ms.state.dispclk_mhz,
+					mode_lib->ms.max_state.dispclk_mhz,
+					true, // DSCEnable
+					mode_lib->ms.TotalNumberOfActiveDPP[j],
+					mode_lib->ms.ip.max_num_dpp,
+					mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
+					mode_lib->ms.soc.dcn_downspread_percent,
+					mode_lib->ms.ip.dispclk_ramp_margin_percent,
+					mode_lib->ms.soc.dispclk_dppclk_vco_speed_mhz,
+
+					/* Output */
+					&s->TotalAvailablePipesSupportDSC,
+					&s->NumberOfDPPDSC,
+					&s->ODMModeDSC,
+					&s->RequiredDISPCLKPerSurfaceDSC);
+
+			CalculateOutputLink(
+					mode_lib->ms.state.phyclk_mhz,
+					mode_lib->ms.state.phyclk_d18_mhz,
+					mode_lib->ms.state.phyclk_d32_mhz,
+					mode_lib->ms.soc.phy_downspread_percent,
+					(mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k),
+					mode_lib->ms.cache_display_cfg.output.OutputEncoder[k],
+					mode_lib->ms.cache_display_cfg.output.OutputFormat[k],
+					mode_lib->ms.cache_display_cfg.timing.HTotal[k],
+					mode_lib->ms.cache_display_cfg.timing.HActive[k],
+					mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k],
+					mode_lib->ms.cache_display_cfg.output.ForcedOutputLinkBPP[k],
+					mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k],
+					mode_lib->ms.support.NumberOfDSCSlices[k],
+					mode_lib->ms.cache_display_cfg.output.AudioSampleRate[k],
+					mode_lib->ms.cache_display_cfg.output.AudioSampleLayout[k],
+					s->ODMModeNoDSC,
+					s->ODMModeDSC,
+					mode_lib->ms.cache_display_cfg.output.DSCEnable[k],
+					mode_lib->ms.cache_display_cfg.output.OutputLinkDPLanes[k],
+					mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k],
+
+					/* Output */
+					&mode_lib->ms.RequiresDSC[k],
+					&mode_lib->ms.RequiresFEC[k],
+					&mode_lib->ms.OutputBppPerState[k],
+					&mode_lib->ms.OutputTypePerState[k], // VBA_DELTA, VBA uses a string to represent type and rate, but DML uses enum, don't want to rely on strng
+					&mode_lib->ms.OutputRatePerState[k],
+					&mode_lib->ms.RequiredSlots[k]);
+
+			if (mode_lib->ms.RequiresDSC[k] == false) {
+				mode_lib->ms.ODMModePerState[k] = s->ODMModeNoDSC;
+				mode_lib->ms.RequiredDISPCLKPerSurface[j][k] = s->RequiredDISPCLKPerSurfaceNoDSC;
+				if (!s->TotalAvailablePipesSupportNoDSC)
+					mode_lib->ms.support.TotalAvailablePipesSupport[j] = false;
+				mode_lib->ms.TotalNumberOfActiveDPP[j] = mode_lib->ms.TotalNumberOfActiveDPP[j] + s->NumberOfDPPNoDSC;
+			} else {
+				mode_lib->ms.ODMModePerState[k] = s->ODMModeDSC;
+				mode_lib->ms.RequiredDISPCLKPerSurface[j][k] = s->RequiredDISPCLKPerSurfaceDSC;
+				if (!s->TotalAvailablePipesSupportDSC)
+					mode_lib->ms.support.TotalAvailablePipesSupport[j] = false;
+				mode_lib->ms.TotalNumberOfActiveDPP[j] = mode_lib->ms.TotalNumberOfActiveDPP[j] + s->NumberOfDPPDSC;
+			}
 		}
 
-		mode_lib->ms.TotalNumberOfDCCActiveDPP[j] = 0;
 		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			if (mode_lib->ms.cache_display_cfg.surface.DCCEnable[k] == true) {
-				mode_lib->ms.TotalNumberOfDCCActiveDPP[j] = mode_lib->ms.TotalNumberOfDCCActiveDPP[j] + mode_lib->ms.NoOfDPP[j][k];
+			if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_4to1) {
+				mode_lib->ms.MPCCombine[j][k] = false;
+				mode_lib->ms.NoOfDPP[j][k] = 4;
+			} else if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_2to1) {
+				mode_lib->ms.MPCCombine[j][k] = false;
+				mode_lib->ms.NoOfDPP[j][k] = 2;
+			} else if (mode_lib->ms.policy.MPCCombineUse[k] == dml_mpc_disabled) {
+				mode_lib->ms.MPCCombine[j][k] = false;
+				mode_lib->ms.NoOfDPP[j][k] = 1;
+			} else if (RoundToDFSGranularity(mode_lib->ms.MinDPPCLKUsingSingleDPP[k] * (1 + mode_lib->ms.soc.dcn_downspread_percent / 100),
+											1, mode_lib->ms.soc.dispclk_dppclk_vco_speed_mhz) <= mode_lib->ms.state.dppclk_mhz &&
+											mode_lib->ms.SingleDPPViewportSizeSupportPerSurface[k] == true) {
+				mode_lib->ms.MPCCombine[j][k] = false;
+				mode_lib->ms.NoOfDPP[j][k] = 1;
+			} else if (mode_lib->ms.TotalNumberOfActiveDPP[j] < (dml_uint_t) mode_lib->ms.ip.max_num_dpp) {
+				mode_lib->ms.MPCCombine[j][k] = true;
+				mode_lib->ms.NoOfDPP[j][k] = 2;
+				mode_lib->ms.TotalNumberOfActiveDPP[j] = (dml_uint_t) mode_lib->ms.TotalNumberOfActiveDPP[j] + 1;
+			} else {
+				mode_lib->ms.MPCCombine[j][k] = false;
+				mode_lib->ms.NoOfDPP[j][k] = 1;
+				mode_lib->ms.support.TotalAvailablePipesSupport[j] = false;
 			}
 		}
 
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			s->SurfParameters[k].PixelClock = mode_lib->ms.cache_display_cfg.timing.PixelClock[k];
-			s->SurfParameters[k].DPPPerSurface = mode_lib->ms.NoOfDPP[j][k];
-			s->SurfParameters[k].SourceScan = mode_lib->ms.cache_display_cfg.plane.SourceScan[k];
-			s->SurfParameters[k].ViewportHeight = mode_lib->ms.cache_display_cfg.plane.ViewportHeight[k];
-			s->SurfParameters[k].ViewportHeightChroma = mode_lib->ms.cache_display_cfg.plane.ViewportHeightChroma[k];
-			s->SurfParameters[k].BlockWidth256BytesY = mode_lib->ms.Read256BlockWidthY[k];
-			s->SurfParameters[k].BlockHeight256BytesY = mode_lib->ms.Read256BlockHeightY[k];
-			s->SurfParameters[k].BlockWidth256BytesC = mode_lib->ms.Read256BlockWidthC[k];
-			s->SurfParameters[k].BlockHeight256BytesC = mode_lib->ms.Read256BlockHeightC[k];
-			s->SurfParameters[k].BlockWidthY = mode_lib->ms.MacroTileWidthY[k];
-			s->SurfParameters[k].BlockHeightY = mode_lib->ms.MacroTileHeightY[k];
-			s->SurfParameters[k].BlockWidthC = mode_lib->ms.MacroTileWidthC[k];
-			s->SurfParameters[k].BlockHeightC = mode_lib->ms.MacroTileHeightC[k];
-			s->SurfParameters[k].InterlaceEnable = mode_lib->ms.cache_display_cfg.timing.Interlace[k];
-			s->SurfParameters[k].HTotal = mode_lib->ms.cache_display_cfg.timing.HTotal[k];
-			s->SurfParameters[k].DCCEnable = mode_lib->ms.cache_display_cfg.surface.DCCEnable[k];
-			s->SurfParameters[k].SourcePixelFormat = mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k];
-			s->SurfParameters[k].SurfaceTiling = mode_lib->ms.cache_display_cfg.surface.SurfaceTiling[k];
-			s->SurfParameters[k].BytePerPixelY = mode_lib->ms.BytePerPixelY[k];
-			s->SurfParameters[k].BytePerPixelC = mode_lib->ms.BytePerPixelC[k];
-			s->SurfParameters[k].ProgressiveToInterlaceUnitInOPP = mode_lib->ms.ip.ptoi_supported;
-			s->SurfParameters[k].VRatio = mode_lib->ms.cache_display_cfg.plane.VRatio[k];
-			s->SurfParameters[k].VRatioChroma = mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k];
-			s->SurfParameters[k].VTaps = mode_lib->ms.cache_display_cfg.plane.VTaps[k];
-			s->SurfParameters[k].VTapsChroma = mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k];
-			s->SurfParameters[k].PitchY = mode_lib->ms.cache_display_cfg.surface.PitchY[k];
-			s->SurfParameters[k].DCCMetaPitchY = mode_lib->ms.cache_display_cfg.surface.DCCMetaPitchY[k];
-			s->SurfParameters[k].PitchC = mode_lib->ms.cache_display_cfg.surface.PitchC[k];
-			s->SurfParameters[k].DCCMetaPitchC = mode_lib->ms.cache_display_cfg.surface.DCCMetaPitchC[k];
-			s->SurfParameters[k].ViewportStationary = mode_lib->ms.cache_display_cfg.plane.ViewportStationary[k];
-			s->SurfParameters[k].ViewportXStart = mode_lib->ms.cache_display_cfg.plane.ViewportXStart[k];
-			s->SurfParameters[k].ViewportYStart = mode_lib->ms.cache_display_cfg.plane.ViewportYStart[k];
-			s->SurfParameters[k].ViewportXStartC = mode_lib->ms.cache_display_cfg.plane.ViewportXStartC[k];
-			s->SurfParameters[k].ViewportYStartC = mode_lib->ms.cache_display_cfg.plane.ViewportYStartC[k];
-			s->SurfParameters[k].FORCE_ONE_ROW_FOR_FRAME = mode_lib->ms.cache_display_cfg.plane.ForceOneRowForFrame[k];
-			s->SurfParameters[k].SwathHeightY = mode_lib->ms.SwathHeightYThisState[k];
-			s->SurfParameters[k].SwathHeightC = mode_lib->ms.SwathHeightCThisState[k];
+		mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] = 0;
+		s->NoChromaOrLinear = true;
+		for (k = 0; k < (dml_uint_t) mode_lib->ms.num_active_planes; ++k) {
+			if (mode_lib->ms.NoOfDPP[j][k] == 1)
+				mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] = mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] + 1;
+			if (mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_8
+					|| mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_10
+					|| mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_420_12
+					|| mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k] == dml_rgbe_alpha
+					|| mode_lib->ms.cache_display_cfg.surface.SurfaceTiling[k] == dml_sw_linear) {
+				s->NoChromaOrLinear = false;
+			}
+		}
+
+		if (j == 1 && !UnboundedRequest(mode_lib->ms.policy.UseUnboundedRequesting,
+				mode_lib->ms.TotalNumberOfActiveDPP[j], s->NoChromaOrLinear,
+				mode_lib->ms.cache_display_cfg.output.OutputEncoder[0])) {
+			while (!(mode_lib->ms.TotalNumberOfActiveDPP[j] >= (dml_uint_t) mode_lib->ms.ip.max_num_dpp || mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] == 0)) {
+				s->BWOfNonCombinedSurfaceOfMaximumBandwidth = 0;
+				s->NumberOfNonCombinedSurfaceOfMaximumBandwidth = 0;
+				for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+					if (mode_lib->ms.policy.MPCCombineUse[k] != dml_mpc_disabled && mode_lib->ms.policy.MPCCombineUse[k] != dml_mpc_as_needed_for_voltage &&
+						mode_lib->ms.ReadBandwidthLuma[k] + mode_lib->ms.ReadBandwidthChroma[k] > s->BWOfNonCombinedSurfaceOfMaximumBandwidth &&
+						(mode_lib->ms.ODMModePerState[k] != dml_odm_mode_combine_2to1 && mode_lib->ms.ODMModePerState[k] != dml_odm_mode_combine_4to1) &&
+						mode_lib->ms.MPCCombine[j][k] == false) {
+						s->BWOfNonCombinedSurfaceOfMaximumBandwidth = mode_lib->ms.ReadBandwidthLuma[k] + mode_lib->ms.ReadBandwidthChroma[k];
+						s->NumberOfNonCombinedSurfaceOfMaximumBandwidth = k;
+					}
+				}
+				mode_lib->ms.MPCCombine[j][s->NumberOfNonCombinedSurfaceOfMaximumBandwidth] = true;
+				mode_lib->ms.NoOfDPP[j][s->NumberOfNonCombinedSurfaceOfMaximumBandwidth] = 2;
+				mode_lib->ms.TotalNumberOfActiveDPP[j] = mode_lib->ms.TotalNumberOfActiveDPP[j] + 1;
+				mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] = mode_lib->ms.TotalNumberOfSingleDPPSurfaces[j] - 1;
+			}
 		}
 
-		CalculateVMRowAndSwath_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
-		CalculateVMRowAndSwath_params->myPipe = s->SurfParameters;
-		CalculateVMRowAndSwath_params->SurfaceSizeInMALL = mode_lib->ms.SurfaceSizeInMALL;
-		CalculateVMRowAndSwath_params->PTEBufferSizeInRequestsLuma = mode_lib->ms.ip.dpte_buffer_size_in_pte_reqs_luma;
-		CalculateVMRowAndSwath_params->PTEBufferSizeInRequestsChroma = mode_lib->ms.ip.dpte_buffer_size_in_pte_reqs_chroma;
-		CalculateVMRowAndSwath_params->DCCMetaBufferSizeBytes = mode_lib->ms.ip.dcc_meta_buffer_size_bytes;
-		CalculateVMRowAndSwath_params->UseMALLForStaticScreen = mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen;
-		CalculateVMRowAndSwath_params->UseMALLForPStateChange = mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange;
-		CalculateVMRowAndSwath_params->MALLAllocatedForDCN = mode_lib->ms.soc.mall_allocated_for_dcn_mbytes;
-		CalculateVMRowAndSwath_params->SwathWidthY = mode_lib->ms.SwathWidthYThisState;
-		CalculateVMRowAndSwath_params->SwathWidthC = mode_lib->ms.SwathWidthCThisState;
-		CalculateVMRowAndSwath_params->GPUVMEnable = mode_lib->ms.cache_display_cfg.plane.GPUVMEnable;
-		CalculateVMRowAndSwath_params->HostVMEnable = mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
-		CalculateVMRowAndSwath_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
-		CalculateVMRowAndSwath_params->GPUVMMaxPageTableLevels = mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels;
-		CalculateVMRowAndSwath_params->GPUVMMinPageSizeKBytes = mode_lib->ms.cache_display_cfg.plane.GPUVMMinPageSizeKBytes;
-		CalculateVMRowAndSwath_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
-		CalculateVMRowAndSwath_params->PTEBufferModeOverrideEn = mode_lib->ms.cache_display_cfg.plane.PTEBufferModeOverrideEn;
-		CalculateVMRowAndSwath_params->PTEBufferModeOverrideVal = mode_lib->ms.cache_display_cfg.plane.PTEBufferMode;
-		CalculateVMRowAndSwath_params->PTEBufferSizeNotExceeded = mode_lib->ms.PTEBufferSizeNotExceededPerState;
-		CalculateVMRowAndSwath_params->DCCMetaBufferSizeNotExceeded = mode_lib->ms.DCCMetaBufferSizeNotExceededPerState;
-		CalculateVMRowAndSwath_params->dpte_row_width_luma_ub = s->dummy_integer_array[0];
-		CalculateVMRowAndSwath_params->dpte_row_width_chroma_ub = s->dummy_integer_array[1];
-		CalculateVMRowAndSwath_params->dpte_row_height_luma = mode_lib->ms.dpte_row_height;
-		CalculateVMRowAndSwath_params->dpte_row_height_chroma = mode_lib->ms.dpte_row_height_chroma;
-		CalculateVMRowAndSwath_params->dpte_row_height_linear_luma = s->dummy_integer_array[2]; // VBA_DELTA
-		CalculateVMRowAndSwath_params->dpte_row_height_linear_chroma = s->dummy_integer_array[3]; // VBA_DELTA
-		CalculateVMRowAndSwath_params->meta_req_width = s->dummy_integer_array[4];
-		CalculateVMRowAndSwath_params->meta_req_width_chroma = s->dummy_integer_array[5];
-		CalculateVMRowAndSwath_params->meta_req_height = s->dummy_integer_array[6];
-		CalculateVMRowAndSwath_params->meta_req_height_chroma = s->dummy_integer_array[7];
-		CalculateVMRowAndSwath_params->meta_row_width = s->dummy_integer_array[8];
-		CalculateVMRowAndSwath_params->meta_row_width_chroma = s->dummy_integer_array[9];
-		CalculateVMRowAndSwath_params->meta_row_height = mode_lib->ms.meta_row_height;
-		CalculateVMRowAndSwath_params->meta_row_height_chroma = mode_lib->ms.meta_row_height_chroma;
-		CalculateVMRowAndSwath_params->vm_group_bytes = s->dummy_integer_array[10];
-		CalculateVMRowAndSwath_params->dpte_group_bytes = mode_lib->ms.dpte_group_bytes;
-		CalculateVMRowAndSwath_params->PixelPTEReqWidthY = s->dummy_integer_array[11];
-		CalculateVMRowAndSwath_params->PixelPTEReqHeightY = s->dummy_integer_array[12];
-		CalculateVMRowAndSwath_params->PTERequestSizeY = s->dummy_integer_array[13];
-		CalculateVMRowAndSwath_params->PixelPTEReqWidthC = s->dummy_integer_array[14];
-		CalculateVMRowAndSwath_params->PixelPTEReqHeightC = s->dummy_integer_array[15];
-		CalculateVMRowAndSwath_params->PTERequestSizeC = s->dummy_integer_array[16];
-		CalculateVMRowAndSwath_params->dpde0_bytes_per_frame_ub_l = s->dummy_integer_array[17];
-		CalculateVMRowAndSwath_params->meta_pte_bytes_per_frame_ub_l = s->dummy_integer_array[18];
-		CalculateVMRowAndSwath_params->dpde0_bytes_per_frame_ub_c = s->dummy_integer_array[19];
-		CalculateVMRowAndSwath_params->meta_pte_bytes_per_frame_ub_c = s->dummy_integer_array[20];
-		CalculateVMRowAndSwath_params->PrefetchSourceLinesY = mode_lib->ms.PrefetchLinesYThisState;
-		CalculateVMRowAndSwath_params->PrefetchSourceLinesC = mode_lib->ms.PrefetchLinesCThisState;
-		CalculateVMRowAndSwath_params->VInitPreFillY = mode_lib->ms.PrefillY;
-		CalculateVMRowAndSwath_params->VInitPreFillC = mode_lib->ms.PrefillC;
-		CalculateVMRowAndSwath_params->MaxNumSwathY = mode_lib->ms.MaxNumSwY;
-		CalculateVMRowAndSwath_params->MaxNumSwathC = mode_lib->ms.MaxNumSwC;
-		CalculateVMRowAndSwath_params->meta_row_bw = mode_lib->ms.meta_row_bandwidth_this_state;
-		CalculateVMRowAndSwath_params->dpte_row_bw = mode_lib->ms.dpte_row_bandwidth_this_state;
-		CalculateVMRowAndSwath_params->PixelPTEBytesPerRow = mode_lib->ms.DPTEBytesPerRowThisState;
-		CalculateVMRowAndSwath_params->PDEAndMetaPTEBytesFrame = mode_lib->ms.PDEAndMetaPTEBytesPerFrameThisState;
-		CalculateVMRowAndSwath_params->MetaRowByte = mode_lib->ms.MetaRowBytesThisState;
-		CalculateVMRowAndSwath_params->use_one_row_for_frame = mode_lib->ms.use_one_row_for_frame_this_state;
-		CalculateVMRowAndSwath_params->use_one_row_for_frame_flip = mode_lib->ms.use_one_row_for_frame_flip_this_state;
-		CalculateVMRowAndSwath_params->UsesMALLForStaticScreen = s->dummy_boolean_array[0];
-		CalculateVMRowAndSwath_params->PTE_BUFFER_MODE = s->dummy_boolean_array[1];
-		CalculateVMRowAndSwath_params->BIGK_FRAGMENT_SIZE = s->dummy_integer_array[21];
+		//DISPCLK/DPPCLK
+		mode_lib->ms.WritebackRequiredDISPCLK = 0;
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k]) {
+				mode_lib->ms.WritebackRequiredDISPCLK = dml_max(mode_lib->ms.WritebackRequiredDISPCLK,
+																	CalculateWriteBackDISPCLK(mode_lib->ms.cache_display_cfg.writeback.WritebackPixelFormat[k],
+																							mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
+																							mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[k],
+																							mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[k],
+																							mode_lib->ms.cache_display_cfg.writeback.WritebackHTaps[k],
+																							mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[k],
+																							mode_lib->ms.cache_display_cfg.writeback.WritebackSourceWidth[k],
+																							mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[k],
+																							mode_lib->ms.cache_display_cfg.timing.HTotal[k],
+																							mode_lib->ms.ip.writeback_line_buffer_buffer_size,
+																							mode_lib->ms.soc.dispclk_dppclk_vco_speed_mhz));
+			}
+		}
 
-		CalculateVMRowAndSwath(&mode_lib->scratch,
-			CalculateVMRowAndSwath_params);
+		 mode_lib->ms.RequiredDISPCLK[j] = mode_lib->ms.WritebackRequiredDISPCLK;
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			mode_lib->ms.RequiredDISPCLK[j] = dml_max(mode_lib->ms.RequiredDISPCLK[j], mode_lib->ms.RequiredDISPCLKPerSurface[j][k]);
+		}
 
 		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.PrefetchLinesY[j][k] = mode_lib->ms.PrefetchLinesYThisState[k];
-			mode_lib->ms.PrefetchLinesC[j][k] = mode_lib->ms.PrefetchLinesCThisState[k];
-			mode_lib->ms.meta_row_bandwidth[j][k] = mode_lib->ms.meta_row_bandwidth_this_state[k];
-			mode_lib->ms.dpte_row_bandwidth[j][k] = mode_lib->ms.dpte_row_bandwidth_this_state[k];
-			mode_lib->ms.DPTEBytesPerRow[j][k] = mode_lib->ms.DPTEBytesPerRowThisState[k];
-			mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k] = mode_lib->ms.PDEAndMetaPTEBytesPerFrameThisState[k];
-			mode_lib->ms.MetaRowBytes[j][k] = mode_lib->ms.MetaRowBytesThisState[k];
-			mode_lib->ms.use_one_row_for_frame[j][k] = mode_lib->ms.use_one_row_for_frame_this_state[k];
-			mode_lib->ms.use_one_row_for_frame_flip[j][k] = mode_lib->ms.use_one_row_for_frame_flip_this_state[k];
+			mode_lib->ms.NoOfDPPThisState[k] = mode_lib->ms.NoOfDPP[j][k];
 		}
 
-		mode_lib->ms.support.PTEBufferSizeNotExceeded[j] = true;
+		CalculateDPPCLK(mode_lib->ms.num_active_planes,
+					mode_lib->ms.soc.dcn_downspread_percent,
+					mode_lib->ms.soc.dispclk_dppclk_vco_speed_mhz,
+					mode_lib->ms.MinDPPCLKUsingSingleDPP,
+					mode_lib->ms.NoOfDPPThisState,
+					/* Output */
+					&mode_lib->ms.GlobalDPPCLK,
+					mode_lib->ms.RequiredDPPCLKThisState);
 
 		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			if (mode_lib->ms.PTEBufferSizeNotExceededPerState[k] == false)
-				mode_lib->ms.support.PTEBufferSizeNotExceeded[j] = false;
-#ifdef __DML_VBA_DEBUG__
-			dml_print("DML::%s: j=%u k=%u, PTEBufferSizeNotExceededPerState[%u] = %u\n",  __func__, j, k, k, mode_lib->ms.PTEBufferSizeNotExceededPerState[k]);
-#endif
+			mode_lib->ms.RequiredDPPCLKPerSurface[j][k] = mode_lib->ms.RequiredDPPCLKThisState[k];
 		}
-#ifdef __DML_VBA_DEBUG__
-		dml_print("DML::%s: PTEBufferSizeNotExceeded[%u] = %u\n",  __func__, j, mode_lib->ms.support.PTEBufferSizeNotExceeded[j]);
-#endif
 
-		mode_lib->ms.support.DCCMetaBufferSizeNotExceeded[j] = true;
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			if (mode_lib->ms.DCCMetaBufferSizeNotExceededPerState[k] == false)
-				mode_lib->ms.support.DCCMetaBufferSizeNotExceeded[j] = false;
+		mode_lib->ms.support.DISPCLK_DPPCLK_Support[j] = !((mode_lib->ms.RequiredDISPCLK[j] > mode_lib->ms.state.dispclk_mhz) || (mode_lib->ms.GlobalDPPCLK > mode_lib->ms.state.dppclk_mhz));
+
+		if (mode_lib->ms.TotalNumberOfActiveDPP[j] > (dml_uint_t) mode_lib->ms.ip.max_num_dpp) {
+			mode_lib->ms.support.TotalAvailablePipesSupport[j] = false;
 		}
+	} // j
 
-		mode_lib->ms.UrgLatency = CalculateUrgentLatency(mode_lib->ms.state.urgent_latency_pixel_data_only_us,
-													mode_lib->ms.state.urgent_latency_pixel_mixed_with_vm_data_us,
-													mode_lib->ms.state.urgent_latency_vm_data_only_us,
-													mode_lib->ms.soc.do_urgent_latency_adjustment,
-													mode_lib->ms.state.urgent_latency_adjustment_fabric_clock_component_us,
-													mode_lib->ms.state.urgent_latency_adjustment_fabric_clock_reference_mhz,
-													mode_lib->ms.state.fabricclk_mhz);
+	/* Total Available OTG, HDMIFRL, DP Support Check */
+	s->TotalNumberOfActiveOTG = 0;
+	s->TotalNumberOfActiveHDMIFRL = 0;
+	s->TotalNumberOfActiveDP2p0 = 0;
+	s->TotalNumberOfActiveDP2p0Outputs = 0;
 
-		/* Getter functions work at mp interface so copy the urgent latency to mp*/
-		mode_lib->mp.UrgentLatency = mode_lib->ms.UrgLatency;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k) {
+			s->TotalNumberOfActiveOTG = s->TotalNumberOfActiveOTG + 1;
+			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl)
+				s->TotalNumberOfActiveHDMIFRL = s->TotalNumberOfActiveHDMIFRL + 1;
+			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp2p0) {
+				s->TotalNumberOfActiveDP2p0 = s->TotalNumberOfActiveDP2p0 + 1;
+				if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == k || mode_lib->ms.cache_display_cfg.output.OutputMultistreamEn[k] == false) {
+					s->TotalNumberOfActiveDP2p0Outputs = s->TotalNumberOfActiveDP2p0Outputs + 1;
+				}
+			}
+		}
+	}
 
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			CalculateUrgentBurstFactor(
-				mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k],
-				mode_lib->ms.swath_width_luma_ub_this_state[k],
-				mode_lib->ms.swath_width_chroma_ub_this_state[k],
-				mode_lib->ms.SwathHeightYThisState[k],
-				mode_lib->ms.SwathHeightCThisState[k],
-				(dml_float_t) mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
-				mode_lib->ms.UrgLatency,
-				mode_lib->ms.ip.cursor_buffer_size,
-				mode_lib->ms.cache_display_cfg.plane.CursorWidth[k],
-				mode_lib->ms.cache_display_cfg.plane.CursorBPP[k],
-				mode_lib->ms.cache_display_cfg.plane.VRatio[k],
-				mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k],
-				mode_lib->ms.BytePerPixelInDETY[k],
-				mode_lib->ms.BytePerPixelInDETC[k],
-				mode_lib->ms.DETBufferSizeYThisState[k],
-				mode_lib->ms.DETBufferSizeCThisState[k],
-				/* Output */
-				&mode_lib->ms.UrgentBurstFactorCursor[k],
-				&mode_lib->ms.UrgentBurstFactorLuma[k],
-				&mode_lib->ms.UrgentBurstFactorChroma[k],
-				&mode_lib->ms.NotUrgentLatencyHiding[k]);
+	mode_lib->ms.support.NumberOfOTGSupport      = (s->TotalNumberOfActiveOTG <= (dml_uint_t) mode_lib->ms.ip.max_num_otg);
+	mode_lib->ms.support.NumberOfHDMIFRLSupport  = (s->TotalNumberOfActiveHDMIFRL <= (dml_uint_t) mode_lib->ms.ip.max_num_hdmi_frl_outputs);
+	mode_lib->ms.support.NumberOfDP2p0Support    = (s->TotalNumberOfActiveDP2p0 <= (dml_uint_t) mode_lib->ms.ip.max_num_dp2p0_streams && s->TotalNumberOfActiveDP2p0Outputs <= (dml_uint_t) mode_lib->ms.ip.max_num_dp2p0_outputs);
+
+	/* Display IO and DSC Support Check */
+	mode_lib->ms.support.NonsupportedDSCInputBPC = false;
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+		if (mode_lib->ms.cache_display_cfg.output.OutputDisabled[k] == false &&
+			!(mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k] == 12.0
+				|| mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k] == 10.0
+				|| mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k] == 8.0
+				|| mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k] > (dml_uint_t) mode_lib->ms.ip.maximum_dsc_bits_per_component
+				)) {
+			mode_lib->ms.support.NonsupportedDSCInputBPC = true;
+		}
+	}
+
+	mode_lib->ms.support.ExceededMultistreamSlots = false;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == k) {
+			s->TotalSlots = mode_lib->ms.RequiredSlots[k];
+			for (j = 0; j < mode_lib->ms.num_active_planes; ++j) {
+				if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[j] == k)
+					s->TotalSlots = s->TotalSlots + mode_lib->ms.RequiredSlots[j];
+			}
+			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp && s->TotalSlots > 63)
+				mode_lib->ms.support.ExceededMultistreamSlots = true;
+			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp2p0 && s->TotalSlots > 64)
+				mode_lib->ms.support.ExceededMultistreamSlots = true;
+		}
+	}
+	mode_lib->ms.support.LinkCapacitySupport = true;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ms.cache_display_cfg.output.OutputDisabled[k] == false &&
+			mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k && (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp2p0 || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_edp ||
+			mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmi || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl) && mode_lib->ms.OutputBppPerState[k] == 0) {
+			mode_lib->ms.support.LinkCapacitySupport = false;
+		}
+	}
+
+	mode_lib->ms.support.P2IWith420 = false;
+	mode_lib->ms.support.DSCOnlyIfNecessaryWithBPP = false;
+	mode_lib->ms.support.DSC422NativeNotSupported = false;
+	mode_lib->ms.support.LinkRateDoesNotMatchDPVersion = false;
+	mode_lib->ms.support.LinkRateForMultistreamNotIndicated = false;
+	mode_lib->ms.support.BPPForMultistreamNotIndicated = false;
+	mode_lib->ms.support.MultistreamWithHDMIOreDP = false;
+	mode_lib->ms.support.MSOOrODMSplitWithNonDPLink = false;
+	mode_lib->ms.support.NotEnoughLanesForMSO = false;
+
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k && (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp2p0 || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_edp ||
+														mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmi || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl)) {
+			if (mode_lib->ms.cache_display_cfg.output.OutputFormat[k] == dml_420 && mode_lib->ms.cache_display_cfg.timing.Interlace[k] == 1 && mode_lib->ms.ip.ptoi_supported == true)
+				mode_lib->ms.support.P2IWith420 = true;
+
+			if (mode_lib->ms.cache_display_cfg.output.DSCEnable[k] == dml_dsc_enable_if_necessary && mode_lib->ms.cache_display_cfg.output.ForcedOutputLinkBPP[k] != 0)
+				mode_lib->ms.support.DSCOnlyIfNecessaryWithBPP = true;
+			if ((mode_lib->ms.cache_display_cfg.output.DSCEnable[k] == dml_dsc_enable || mode_lib->ms.cache_display_cfg.output.DSCEnable[k] == dml_dsc_enable_if_necessary) && mode_lib->ms.cache_display_cfg.output.OutputFormat[k] == dml_n422 && !mode_lib->ms.ip.dsc422_native_support)
+				mode_lib->ms.support.DSC422NativeNotSupported = true;
+
+			if (((mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_hbr || mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_hbr2 || mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_hbr3) &&
+					mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] != dml_dp && mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] != dml_edp) ||
+					((mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_uhbr10 || mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_uhbr13p5 || mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_uhbr20) &&
+					mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] != dml_dp2p0))
+				mode_lib->ms.support.LinkRateDoesNotMatchDPVersion = true;
+
+			if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamEn[k] == 1) {
+				if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == k && mode_lib->ms.cache_display_cfg.output.OutputLinkDPRate[k] == dml_dp_rate_na)
+					mode_lib->ms.support.LinkRateForMultistreamNotIndicated = true;
+				if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == k && mode_lib->ms.cache_display_cfg.output.ForcedOutputLinkBPP[k] == 0)
+					mode_lib->ms.support.BPPForMultistreamNotIndicated = true;
+				for (j = 0; j < mode_lib->ms.num_active_planes; ++j) {
+					if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == j && mode_lib->ms.cache_display_cfg.output.ForcedOutputLinkBPP[k] == 0)
+						mode_lib->ms.support.BPPForMultistreamNotIndicated = true;
+				}
+			}
+
+			if ((mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_edp || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmi || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl)) {
+				if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamEn[k] == 1 && mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == k)
+					mode_lib->ms.support.MultistreamWithHDMIOreDP = true;
+				for (j = 0; j < mode_lib->ms.num_active_planes; ++j) {
+					if (mode_lib->ms.cache_display_cfg.output.OutputMultistreamEn[k] == 1 && mode_lib->ms.cache_display_cfg.output.OutputMultistreamId[k] == j)
+						mode_lib->ms.support.MultistreamWithHDMIOreDP = true;
+				}
+			}
+			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] != dml_dp && (mode_lib->ms.policy.ODMUse[k] == dml_odm_use_policy_split_1to2 ||
+				mode_lib->ms.policy.ODMUse[k] == dml_odm_use_policy_mso_1to2 || mode_lib->ms.policy.ODMUse[k] == dml_odm_use_policy_mso_1to4))
+				mode_lib->ms.support.MSOOrODMSplitWithNonDPLink = true;
+
+			if ((mode_lib->ms.policy.ODMUse[k] == dml_odm_use_policy_mso_1to2 && mode_lib->ms.cache_display_cfg.output.OutputLinkDPLanes[k] < 2) ||
+				(mode_lib->ms.policy.ODMUse[k] == dml_odm_use_policy_mso_1to4 && mode_lib->ms.cache_display_cfg.output.OutputLinkDPLanes[k] < 4))
+				mode_lib->ms.support.NotEnoughLanesForMSO = true;
 		}
+	}
 
-		CalculateDCFCLKDeepSleep(
-				mode_lib->ms.num_active_planes,
-				mode_lib->ms.BytePerPixelY,
-				mode_lib->ms.BytePerPixelC,
-				mode_lib->ms.cache_display_cfg.plane.VRatio,
-				mode_lib->ms.cache_display_cfg.plane.VRatioChroma,
-				mode_lib->ms.SwathWidthYThisState,
-				mode_lib->ms.SwathWidthCThisState,
-				mode_lib->ms.NoOfDPPThisState,
-				mode_lib->ms.cache_display_cfg.plane.HRatio,
-				mode_lib->ms.cache_display_cfg.plane.HRatioChroma,
-				mode_lib->ms.cache_display_cfg.timing.PixelClock,
-				mode_lib->ms.PSCL_FACTOR,
-				mode_lib->ms.PSCL_FACTOR_CHROMA,
-				mode_lib->ms.RequiredDPPCLKThisState,
-				mode_lib->ms.ReadBandwidthLuma,
-				mode_lib->ms.ReadBandwidthChroma,
-				mode_lib->ms.soc.return_bus_width_bytes,
+	mode_lib->ms.support.DTBCLKRequiredMoreThanSupported = false;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k &&
+				mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl &&
+				RequiredDTBCLK(
+							mode_lib->ms.RequiresDSC[k],
+							mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k],
+							mode_lib->ms.cache_display_cfg.output.OutputFormat[k],
+							mode_lib->ms.OutputBppPerState[k],
+							mode_lib->ms.support.NumberOfDSCSlices[k],
+							mode_lib->ms.cache_display_cfg.timing.HTotal[k],
+							mode_lib->ms.cache_display_cfg.timing.HActive[k],
+							mode_lib->ms.cache_display_cfg.output.AudioSampleRate[k],
+							mode_lib->ms.cache_display_cfg.output.AudioSampleLayout[k]) > mode_lib->ms.state.dtbclk_mhz) {
+								mode_lib->ms.support.DTBCLKRequiredMoreThanSupported = true;
+							}
+	}
 
-				/* Output */
-				&mode_lib->ms.ProjectedDCFCLKDeepSleep[j]);
+	mode_lib->ms.support.ODMCombineTwoToOneSupportCheckOK = true;
+	mode_lib->ms.support.ODMCombineFourToOneSupportCheckOK = true;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k && mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_2to1 && mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmi) {
+			mode_lib->ms.support.ODMCombineTwoToOneSupportCheckOK = false;
+		}
+		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k && mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_4to1 && (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp ||
+			mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_edp || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmi)) {
+			mode_lib->ms.support.ODMCombineFourToOneSupportCheckOK = false;
+		}
 	}
 
-	//Calculate Return BW
-	for (j = 0; j < 2; ++j) {
-		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-			if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k) {
-				if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true) {
-					mode_lib->ms.WritebackDelayTime[k] = mode_lib->ms.state.writeback_latency_us + CalculateWriteBackDelay(
-									mode_lib->ms.cache_display_cfg.writeback.WritebackPixelFormat[k],
-									mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[k],
-									mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[k],
-									mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[k],
-									mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[k],
-									mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationHeight[k],
-									mode_lib->ms.cache_display_cfg.writeback.WritebackSourceHeight[k],
-									mode_lib->ms.cache_display_cfg.timing.HTotal[k]) / mode_lib->ms.RequiredDISPCLK[j];
+	mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = false;
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+		if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k) {
+			if (mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp ||
+				mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_dp2p0 ||
+				mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_edp ||
+				mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl) {
+				if (mode_lib->ms.cache_display_cfg.output.OutputFormat[k] == dml_420) {
+					s->DSCFormatFactor = 2;
+				} else if (mode_lib->ms.cache_display_cfg.output.OutputFormat[k] == dml_444) {
+					s->DSCFormatFactor = 1;
+				} else if (mode_lib->ms.cache_display_cfg.output.OutputFormat[k] == dml_n422 || mode_lib->ms.cache_display_cfg.output.OutputEncoder[k] == dml_hdmifrl) {
+					s->DSCFormatFactor = 2;
 				} else {
-					mode_lib->ms.WritebackDelayTime[k] = 0.0;
+					s->DSCFormatFactor = 1;
 				}
-				for (m = 0; m <= mode_lib->ms.num_active_planes - 1; m++) {
-					if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[m] == k && mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[m] == true) {
-						mode_lib->ms.WritebackDelayTime[k] = dml_max(mode_lib->ms.WritebackDelayTime[k],
-											mode_lib->ms.state.writeback_latency_us + CalculateWriteBackDelay(
-											mode_lib->ms.cache_display_cfg.writeback.WritebackPixelFormat[m],
-											mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[m],
-											mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[m],
-											mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[m],
-											mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[m],
-											mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationHeight[m],
-											mode_lib->ms.cache_display_cfg.writeback.WritebackSourceHeight[m],
-											mode_lib->ms.cache_display_cfg.timing.HTotal[m]) / mode_lib->ms.RequiredDISPCLK[j]);
+#ifdef __DML_VBA_DEBUG__
+				dml_print("DML::%s: k=%u, RequiresDSC = %u\n",  __func__, k, mode_lib->ms.RequiresDSC[k]);
+#endif
+				if (mode_lib->ms.RequiresDSC[k] == true) {
+					if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_4to1) {
+						if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] / 12.0 / (dml_float_t)s->DSCFormatFactor > (1.0 - mode_lib->ms.soc.dcn_downspread_percent / 100.0) * mode_lib->ms.state.dscclk_mhz) {
+#ifdef __DML_VBA_DEBUG__
+							dml_print("DML::%s: k=%u, PixelClockBackEnd     = %f\n",  __func__, k, mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k]);
+							dml_print("DML::%s: k=%u, DSCCLKPerState        = %f\n",  __func__, k, mode_lib->ms.state.dscclk_mhz);
+							dml_print("DML::%s: k=%u, DSCFormatFactor       = %u\n",  __func__, k, s->DSCFormatFactor);
+#endif
+							mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = true;
+						}
+					} else if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_2to1) {
+						if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] / 6.0 / (dml_float_t)s->DSCFormatFactor > (1.0 - mode_lib->ms.soc.dcn_downspread_percent / 100.0) * mode_lib->ms.state.dscclk_mhz) {
+							mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = true;
+						}
+					} else {
+						if (mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k] / 3.0 / (dml_float_t)s->DSCFormatFactor > (1.0 - mode_lib->ms.soc.dcn_downspread_percent / 100.0) * mode_lib->ms.state.dscclk_mhz) {
+							mode_lib->ms.support.DSCCLKRequiredMoreThanSupported = true;
+						}
 					}
 				}
 			}
 		}
-		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-			for (m = 0; m <= mode_lib->ms.num_active_planes - 1; m++) {
-				if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == m) {
-					mode_lib->ms.WritebackDelayTime[k] = mode_lib->ms.WritebackDelayTime[m];
+	}
+#ifdef __DML_VBA_DEBUG__
+	dml_print("DML::%s: DSCCLKRequiredMoreThanSupported = %u\n",  __func__, mode_lib->ms.support.DSCCLKRequiredMoreThanSupported);
+#endif
+
+	/* Check DSC Unit and Slices Support */
+	mode_lib->ms.support.NotEnoughDSCUnits = false;
+	mode_lib->ms.support.NotEnoughDSCSlices = false;
+	s->TotalDSCUnitsRequired = 0;
+	mode_lib->ms.support.PixelsPerLinePerDSCUnitSupport = true;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ms.RequiresDSC[k] == true) {
+			if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_4to1) {
+				if (mode_lib->ms.cache_display_cfg.timing.HActive[k] > 4 * (dml_uint_t) mode_lib->ms.ip.maximum_pixels_per_line_per_dsc_unit)
+					mode_lib->ms.support.PixelsPerLinePerDSCUnitSupport = false;
+				s->TotalDSCUnitsRequired = s->TotalDSCUnitsRequired + 4;
+				if (mode_lib->ms.support.NumberOfDSCSlices[k] > 16)
+					mode_lib->ms.support.NotEnoughDSCSlices = true;
+			} else if (mode_lib->ms.ODMModePerState[k] == dml_odm_mode_combine_2to1) {
+				if (mode_lib->ms.cache_display_cfg.timing.HActive[k] > 2 * (dml_uint_t) mode_lib->ms.ip.maximum_pixels_per_line_per_dsc_unit)
+					mode_lib->ms.support.PixelsPerLinePerDSCUnitSupport = false;
+				s->TotalDSCUnitsRequired = s->TotalDSCUnitsRequired + 2;
+				if (mode_lib->ms.support.NumberOfDSCSlices[k] > 8)
+					mode_lib->ms.support.NotEnoughDSCSlices = true;
+			} else {
+				if (mode_lib->ms.cache_display_cfg.timing.HActive[k] > (dml_uint_t) mode_lib->ms.ip.maximum_pixels_per_line_per_dsc_unit)
+					mode_lib->ms.support.PixelsPerLinePerDSCUnitSupport = false;
+				s->TotalDSCUnitsRequired = s->TotalDSCUnitsRequired + 1;
+				if (mode_lib->ms.support.NumberOfDSCSlices[k] > 4)
+					mode_lib->ms.support.NotEnoughDSCSlices = true;
+			}
+		}
+	}
+   if (s->TotalDSCUnitsRequired > (dml_uint_t) mode_lib->ms.ip.num_dsc) {
+		mode_lib->ms.support.NotEnoughDSCUnits = true;
+	}
+
+	/*DSC Delay per state*/
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		mode_lib->ms.DSCDelayPerState[k] = DSCDelayRequirement(mode_lib->ms.RequiresDSC[k],
+													mode_lib->ms.ODMModePerState[k],
+													mode_lib->ms.cache_display_cfg.output.DSCInputBitPerComponent[k],
+													mode_lib->ms.OutputBppPerState[k],
+													mode_lib->ms.cache_display_cfg.timing.HActive[k],
+													mode_lib->ms.cache_display_cfg.timing.HTotal[k],
+													mode_lib->ms.support.NumberOfDSCSlices[k],
+													mode_lib->ms.cache_display_cfg.output.OutputFormat[k],
+													mode_lib->ms.cache_display_cfg.output.OutputEncoder[k],
+													mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
+													mode_lib->ms.cache_display_cfg.output.PixelClockBackEnd[k]);
+	}
+
+	for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+		for (m = 0; m <= mode_lib->ms.num_active_planes - 1; m++) {
+			for (j = 0; j <= mode_lib->ms.num_active_planes - 1; j++) {
+				if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == m && mode_lib->ms.RequiresDSC[m] == true) {
+					mode_lib->ms.DSCDelayPerState[k] = mode_lib->ms.DSCDelayPerState[m];
 				}
 			}
 		}
-       s->MaxVStartupAllPlanes[j] = 0;  // max vstartup among all planes
+	}
+
+	//Calculate Swath, DET Configuration, DCFCLKDeepSleep
+	//
+	for (j = 0; j < 2; ++j) {
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			mode_lib->ms.RequiredDPPCLKThisState[k] = mode_lib->ms.RequiredDPPCLKPerSurface[j][k];
+			mode_lib->ms.NoOfDPPThisState[k] = mode_lib->ms.NoOfDPP[j][k];
+			mode_lib->ms.ODMModeThisState[k] = mode_lib->ms.ODMModePerState[k];
+		}
+
+		CalculateSwathAndDETConfiguration_params->DETSizeOverride = mode_lib->ms.cache_display_cfg.plane.DETSizeOverride;
+		CalculateSwathAndDETConfiguration_params->UseMALLForPStateChange = mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange;
+		CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSizeInKByte = mode_lib->ms.ip.config_return_buffer_size_in_kbytes;
+		CalculateSwathAndDETConfiguration_params->ROBBufferSizeInKByte = mode_lib->ms.ip.rob_buffer_size_kbytes;
+		CalculateSwathAndDETConfiguration_params->MaxTotalDETInKByte = mode_lib->ms.MaxTotalDETInKByte;
+		CalculateSwathAndDETConfiguration_params->MinCompressedBufferSizeInKByte = mode_lib->ms.MinCompressedBufferSizeInKByte;
+		CalculateSwathAndDETConfiguration_params->PixelChunkSizeInKByte = mode_lib->ms.ip.pixel_chunk_size_kbytes;
+		CalculateSwathAndDETConfiguration_params->ForceSingleDPP = false;
+		CalculateSwathAndDETConfiguration_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
+		CalculateSwathAndDETConfiguration_params->nomDETInKByte = mode_lib->ms.NomDETInKByte;
+		CalculateSwathAndDETConfiguration_params->UseUnboundedRequestingFinal = mode_lib->ms.policy.UseUnboundedRequesting;
+		CalculateSwathAndDETConfiguration_params->ConfigReturnBufferSegmentSizeInkByte = mode_lib->ms.ip.config_return_buffer_segment_size_in_kbytes;
+		CalculateSwathAndDETConfiguration_params->CompressedBufferSegmentSizeInkByteFinal = mode_lib->ms.ip.compressed_buffer_segment_size_in_kbytes;
+		CalculateSwathAndDETConfiguration_params->Output = mode_lib->ms.cache_display_cfg.output.OutputEncoder;
+		CalculateSwathAndDETConfiguration_params->ReadBandwidthLuma = mode_lib->ms.ReadBandwidthLuma;
+		CalculateSwathAndDETConfiguration_params->ReadBandwidthChroma = mode_lib->ms.ReadBandwidthChroma;
+		CalculateSwathAndDETConfiguration_params->MaximumSwathWidthLuma = mode_lib->ms.MaximumSwathWidthLuma;
+		CalculateSwathAndDETConfiguration_params->MaximumSwathWidthChroma = mode_lib->ms.MaximumSwathWidthChroma;
+		CalculateSwathAndDETConfiguration_params->SourceScan = mode_lib->ms.cache_display_cfg.plane.SourceScan;
+		CalculateSwathAndDETConfiguration_params->ViewportStationary = mode_lib->ms.cache_display_cfg.plane.ViewportStationary;
+		CalculateSwathAndDETConfiguration_params->SourcePixelFormat = mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat;
+		CalculateSwathAndDETConfiguration_params->SurfaceTiling = mode_lib->ms.cache_display_cfg.surface.SurfaceTiling;
+		CalculateSwathAndDETConfiguration_params->ViewportWidth = mode_lib->ms.cache_display_cfg.plane.ViewportWidth;
+		CalculateSwathAndDETConfiguration_params->ViewportHeight = mode_lib->ms.cache_display_cfg.plane.ViewportHeight;
+		CalculateSwathAndDETConfiguration_params->ViewportXStart = mode_lib->ms.cache_display_cfg.plane.ViewportXStart;
+		CalculateSwathAndDETConfiguration_params->ViewportYStart = mode_lib->ms.cache_display_cfg.plane.ViewportYStart;
+		CalculateSwathAndDETConfiguration_params->ViewportXStartC = mode_lib->ms.cache_display_cfg.plane.ViewportXStartC;
+		CalculateSwathAndDETConfiguration_params->ViewportYStartC = mode_lib->ms.cache_display_cfg.plane.ViewportYStartC;
+		CalculateSwathAndDETConfiguration_params->SurfaceWidthY = mode_lib->ms.cache_display_cfg.surface.SurfaceWidthY;
+		CalculateSwathAndDETConfiguration_params->SurfaceWidthC = mode_lib->ms.cache_display_cfg.surface.SurfaceWidthC;
+		CalculateSwathAndDETConfiguration_params->SurfaceHeightY = mode_lib->ms.cache_display_cfg.surface.SurfaceHeightY;
+		CalculateSwathAndDETConfiguration_params->SurfaceHeightC = mode_lib->ms.cache_display_cfg.surface.SurfaceHeightC;
+		CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightY = mode_lib->ms.Read256BlockHeightY;
+		CalculateSwathAndDETConfiguration_params->Read256BytesBlockHeightC = mode_lib->ms.Read256BlockHeightC;
+		CalculateSwathAndDETConfiguration_params->Read256BytesBlockWidthY = mode_lib->ms.Read256BlockWidthY;
+		CalculateSwathAndDETConfiguration_params->Read256BytesBlockWidthC = mode_lib->ms.Read256BlockWidthC;
+		CalculateSwathAndDETConfiguration_params->ODMMode = mode_lib->ms.ODMModeThisState;
+		CalculateSwathAndDETConfiguration_params->BlendingAndTiming = mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming;
+		CalculateSwathAndDETConfiguration_params->BytePerPixY = mode_lib->ms.BytePerPixelY;
+		CalculateSwathAndDETConfiguration_params->BytePerPixC = mode_lib->ms.BytePerPixelC;
+		CalculateSwathAndDETConfiguration_params->BytePerPixDETY = mode_lib->ms.BytePerPixelInDETY;
+		CalculateSwathAndDETConfiguration_params->BytePerPixDETC = mode_lib->ms.BytePerPixelInDETC;
+		CalculateSwathAndDETConfiguration_params->HActive = mode_lib->ms.cache_display_cfg.timing.HActive;
+		CalculateSwathAndDETConfiguration_params->HRatio = mode_lib->ms.cache_display_cfg.plane.HRatio;
+		CalculateSwathAndDETConfiguration_params->HRatioChroma = mode_lib->ms.cache_display_cfg.plane.HRatioChroma;
+		CalculateSwathAndDETConfiguration_params->DPPPerSurface = mode_lib->ms.NoOfDPPThisState;
+		CalculateSwathAndDETConfiguration_params->swath_width_luma_ub = mode_lib->ms.swath_width_luma_ub_this_state;
+		CalculateSwathAndDETConfiguration_params->swath_width_chroma_ub = mode_lib->ms.swath_width_chroma_ub_this_state;
+		CalculateSwathAndDETConfiguration_params->SwathWidth = mode_lib->ms.SwathWidthYThisState;
+		CalculateSwathAndDETConfiguration_params->SwathWidthChroma = mode_lib->ms.SwathWidthCThisState;
+		CalculateSwathAndDETConfiguration_params->SwathHeightY = mode_lib->ms.SwathHeightYThisState;
+		CalculateSwathAndDETConfiguration_params->SwathHeightC = mode_lib->ms.SwathHeightCThisState;
+		CalculateSwathAndDETConfiguration_params->DETBufferSizeInKByte = mode_lib->ms.DETBufferSizeInKByteThisState;
+		CalculateSwathAndDETConfiguration_params->DETBufferSizeY = mode_lib->ms.DETBufferSizeYThisState;
+		CalculateSwathAndDETConfiguration_params->DETBufferSizeC = mode_lib->ms.DETBufferSizeCThisState;
+		CalculateSwathAndDETConfiguration_params->UnboundedRequestEnabled = &mode_lib->ms.UnboundedRequestEnabledThisState;
+		CalculateSwathAndDETConfiguration_params->compbuf_reserved_space_64b = &s->dummy_integer[2];
+		CalculateSwathAndDETConfiguration_params->compbuf_reserved_space_zs = &s->dummy_integer[1];
+		CalculateSwathAndDETConfiguration_params->CompressedBufferSizeInkByte = &mode_lib->ms.CompressedBufferSizeInkByteThisState;
+		CalculateSwathAndDETConfiguration_params->ViewportSizeSupportPerSurface = s->dummy_boolean_array[0];
+		CalculateSwathAndDETConfiguration_params->ViewportSizeSupport = &mode_lib->ms.support.ViewportSizeSupport[j];
 
-		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-			s->MaximumVStartup[j][k] = CalculateMaxVStartup(k,
-														mode_lib->ms.ip.ptoi_supported,
-														mode_lib->ms.ip.vblank_nom_default_us,
-														&mode_lib->ms.cache_display_cfg.timing,
-														mode_lib->ms.WritebackDelayTime[k]);
+		CalculateSwathAndDETConfiguration(&mode_lib->scratch,
+		CalculateSwathAndDETConfiguration_params);
 
-			s->MaxVStartupAllPlanes[j] = (dml_uint_t)(dml_max(s->MaxVStartupAllPlanes[j], s->MaximumVStartup[j][k]));
-#ifdef __DML_VBA_DEBUG__
-			dml_print("DML::%s: k=%u, MaxVStartupAllPlanes[%u] = %u\n", __func__, k, j, s->MaxVStartupAllPlanes[j]);
-			dml_print("DML::%s: k=%u, MaximumVStartup[%u][%u] = %u\n", __func__, k, j, k, s->MaximumVStartup[j][k]);
-#endif
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			mode_lib->ms.swath_width_luma_ub_all_states[j][k] = mode_lib->ms.swath_width_luma_ub_this_state[k];
+			mode_lib->ms.swath_width_chroma_ub_all_states[j][k] = mode_lib->ms.swath_width_chroma_ub_this_state[k];
+			mode_lib->ms.SwathWidthYAllStates[j][k] = mode_lib->ms.SwathWidthYThisState[k];
+			mode_lib->ms.SwathWidthCAllStates[j][k] = mode_lib->ms.SwathWidthCThisState[k];
+			mode_lib->ms.SwathHeightYAllStates[j][k] = mode_lib->ms.SwathHeightYThisState[k];
+			mode_lib->ms.SwathHeightCAllStates[j][k] = mode_lib->ms.SwathHeightCThisState[k];
+			mode_lib->ms.UnboundedRequestEnabledAllStates[j] = mode_lib->ms.UnboundedRequestEnabledThisState;
+			mode_lib->ms.CompressedBufferSizeInkByteAllStates[j] = mode_lib->ms.CompressedBufferSizeInkByteThisState;
+			mode_lib->ms.DETBufferSizeInKByteAllStates[j][k] = mode_lib->ms.DETBufferSizeInKByteThisState[k];
+			mode_lib->ms.DETBufferSizeYAllStates[j][k] = mode_lib->ms.DETBufferSizeYThisState[k];
+			mode_lib->ms.DETBufferSizeCAllStates[j][k] = mode_lib->ms.DETBufferSizeCThisState[k];
 		}
 	}
 
-	s->ReorderingBytes = (dml_uint_t)(mode_lib->ms.soc.num_chans * dml_max3(mode_lib->ms.soc.urgent_out_of_order_return_per_channel_pixel_only_bytes,
-																mode_lib->ms.soc.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
-																mode_lib->ms.soc.urgent_out_of_order_return_per_channel_vm_only_bytes));
-
-	for (j = 0; j < 2; ++j) {
-		mode_lib->ms.DCFCLKState[j] = mode_lib->ms.state.dcfclk_mhz;
-	}
-
-	/* Immediate Flip and MALL parameters */
-	s->ImmediateFlipRequiredFinal = false;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		s->ImmediateFlipRequiredFinal = s->ImmediateFlipRequiredFinal || (mode_lib->ms.policy.ImmediateFlipRequirement[k] == dml_immediate_flip_required);
-	}
-
-	mode_lib->ms.support.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified = false;
 	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		mode_lib->ms.support.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified = mode_lib->ms.support.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified ||
-																							((mode_lib->ms.policy.ImmediateFlipRequirement[k] != dml_immediate_flip_required) &&
-																							(mode_lib->ms.policy.ImmediateFlipRequirement[k] != dml_immediate_flip_not_required));
+		mode_lib->ms.cursor_bw[k] = mode_lib->ms.cache_display_cfg.plane.NumberOfCursors[k] * mode_lib->ms.cache_display_cfg.plane.CursorWidth[k] * mode_lib->ms.cache_display_cfg.plane.CursorBPP[k] / 8.0 / (mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * mode_lib->ms.cache_display_cfg.plane.VRatio[k];
 	}
-	mode_lib->ms.support.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified = mode_lib->ms.support.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified && s->ImmediateFlipRequiredFinal;
 
-	mode_lib->ms.support.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = false;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		mode_lib->ms.support.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe =
-										mode_lib->ms.support.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe || ((mode_lib->ms.cache_display_cfg.plane.HostVMEnable == true || mode_lib->ms.policy.ImmediateFlipRequirement[k] != dml_immediate_flip_not_required) &&
-										(mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_full_frame || mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_phantom_pipe));
-	}
+	CalculateSurfaceSizeInMall(
+			mode_lib->ms.num_active_planes,
+			mode_lib->ms.soc.mall_allocated_for_dcn_mbytes,
+			mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen,
+			mode_lib->ms.cache_display_cfg.surface.DCCEnable,
+			mode_lib->ms.cache_display_cfg.plane.ViewportStationary,
+			mode_lib->ms.cache_display_cfg.plane.ViewportXStart,
+			mode_lib->ms.cache_display_cfg.plane.ViewportYStart,
+			mode_lib->ms.cache_display_cfg.plane.ViewportXStartC,
+			mode_lib->ms.cache_display_cfg.plane.ViewportYStartC,
+			mode_lib->ms.cache_display_cfg.plane.ViewportWidth,
+			mode_lib->ms.cache_display_cfg.plane.ViewportHeight,
+			mode_lib->ms.BytePerPixelY,
+			mode_lib->ms.cache_display_cfg.plane.ViewportWidthChroma,
+			mode_lib->ms.cache_display_cfg.plane.ViewportHeightChroma,
+			mode_lib->ms.BytePerPixelC,
+			mode_lib->ms.cache_display_cfg.surface.SurfaceWidthY,
+			mode_lib->ms.cache_display_cfg.surface.SurfaceWidthC,
+			mode_lib->ms.cache_display_cfg.surface.SurfaceHeightY,
+			mode_lib->ms.cache_display_cfg.surface.SurfaceHeightC,
+			mode_lib->ms.Read256BlockWidthY,
+			mode_lib->ms.Read256BlockWidthC,
+			mode_lib->ms.Read256BlockHeightY,
+			mode_lib->ms.Read256BlockHeightC,
+			mode_lib->ms.MacroTileWidthY,
+			mode_lib->ms.MacroTileWidthC,
+			mode_lib->ms.MacroTileHeightY,
+			mode_lib->ms.MacroTileHeightC,
 
-	mode_lib->ms.support.InvalidCombinationOfMALLUseForPStateAndStaticScreen = false;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		mode_lib->ms.support.InvalidCombinationOfMALLUseForPStateAndStaticScreen = mode_lib->ms.support.InvalidCombinationOfMALLUseForPStateAndStaticScreen ||
-																((mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen[k] == dml_use_mall_static_screen_enable || mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen[k] == dml_use_mall_static_screen_optimize) && (mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_phantom_pipe)) ||
-																((mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen[k] == dml_use_mall_static_screen_disable || mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen[k] == dml_use_mall_static_screen_optimize) && (mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_full_frame));
-	}
+			/* Output */
+			mode_lib->ms.SurfaceSizeInMALL,
+			&mode_lib->ms.support.ExceededMALLSize);
 
-	s->FullFrameMALLPStateMethod = false;
-	s->SubViewportMALLPStateMethod = false;
-	s->PhantomPipeMALLPStateMethod = false;
-	s->SubViewportMALLRefreshGreaterThan120Hz = false;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		if (mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_full_frame)
-			s->FullFrameMALLPStateMethod = true;
-		if (mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_sub_viewport) {
-			s->SubViewportMALLPStateMethod = true;
-			if (mode_lib->ms.cache_display_cfg.timing.RefreshRate[k] > 120)
-				s->SubViewportMALLRefreshGreaterThan120Hz = true;
+	for (j = 0; j < 2; j++) {
+		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+			mode_lib->ms.swath_width_luma_ub_this_state[k] = mode_lib->ms.swath_width_luma_ub_all_states[j][k];
+			mode_lib->ms.swath_width_chroma_ub_this_state[k] = mode_lib->ms.swath_width_chroma_ub_all_states[j][k];
+			mode_lib->ms.SwathWidthYThisState[k] = mode_lib->ms.SwathWidthYAllStates[j][k];
+			mode_lib->ms.SwathWidthCThisState[k] = mode_lib->ms.SwathWidthCAllStates[j][k];
+			mode_lib->ms.SwathHeightYThisState[k] = mode_lib->ms.SwathHeightYAllStates[j][k];
+			mode_lib->ms.SwathHeightCThisState[k] = mode_lib->ms.SwathHeightCAllStates[j][k];
+			mode_lib->ms.DETBufferSizeInKByteThisState[k] = mode_lib->ms.DETBufferSizeInKByteAllStates[j][k];
+			mode_lib->ms.DETBufferSizeYThisState[k] = mode_lib->ms.DETBufferSizeYAllStates[j][k];
+			mode_lib->ms.DETBufferSizeCThisState[k] = mode_lib->ms.DETBufferSizeCAllStates[j][k];
+			mode_lib->ms.RequiredDPPCLKThisState[k] = mode_lib->ms.RequiredDPPCLKPerSurface[j][k];
+			mode_lib->ms.NoOfDPPThisState[k] = mode_lib->ms.NoOfDPP[j][k];
 		}
-		if (mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_phantom_pipe)
-			s->PhantomPipeMALLPStateMethod = true;
-	}
-	mode_lib->ms.support.InvalidCombinationOfMALLUseForPState = (s->SubViewportMALLPStateMethod != s->PhantomPipeMALLPStateMethod)
-	|| (s->SubViewportMALLPStateMethod && s->FullFrameMALLPStateMethod) || s->SubViewportMALLRefreshGreaterThan120Hz;
-
-    if (mode_lib->ms.policy.UseMinimumRequiredDCFCLK == true) {
-		UseMinimumDCFCLK_params->UseMALLForPStateChange = mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange;
-		UseMinimumDCFCLK_params->DRRDisplay = mode_lib->ms.cache_display_cfg.timing.DRRDisplay;
-		UseMinimumDCFCLK_params->SynchronizeDRRDisplaysForUCLKPStateChangeFinal = mode_lib->ms.policy.SynchronizeDRRDisplaysForUCLKPStateChangeFinal;
-		UseMinimumDCFCLK_params->MaxInterDCNTileRepeaters = mode_lib->ms.ip.max_inter_dcn_tile_repeaters;
-		UseMinimumDCFCLK_params->MaxPrefetchMode = dml_prefetch_support_stutter;
-		UseMinimumDCFCLK_params->DRAMClockChangeLatencyFinal = mode_lib->ms.state.dram_clock_change_latency_us;
-		UseMinimumDCFCLK_params->FCLKChangeLatency = mode_lib->ms.state.fclk_change_latency_us;
-		UseMinimumDCFCLK_params->SREnterPlusExitTime = mode_lib->ms.state.sr_enter_plus_exit_time_us;
-		UseMinimumDCFCLK_params->ReturnBusWidth = mode_lib->ms.soc.return_bus_width_bytes;
-		UseMinimumDCFCLK_params->RoundTripPingLatencyCycles = mode_lib->ms.soc.round_trip_ping_latency_dcfclk_cycles;
-		UseMinimumDCFCLK_params->ReorderingBytes = s->ReorderingBytes;
-		UseMinimumDCFCLK_params->PixelChunkSizeInKByte = mode_lib->ms.ip.pixel_chunk_size_kbytes;
-		UseMinimumDCFCLK_params->MetaChunkSize = mode_lib->ms.ip.meta_chunk_size_kbytes;
-		UseMinimumDCFCLK_params->GPUVMEnable = mode_lib->ms.cache_display_cfg.plane.GPUVMEnable;
-		UseMinimumDCFCLK_params->GPUVMMaxPageTableLevels = mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels;
-		UseMinimumDCFCLK_params->HostVMEnable = mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
-		UseMinimumDCFCLK_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
-		UseMinimumDCFCLK_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
-		UseMinimumDCFCLK_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
-		UseMinimumDCFCLK_params->DynamicMetadataVMEnabled = mode_lib->ms.ip.dynamic_metadata_vm_enabled;
-		UseMinimumDCFCLK_params->ImmediateFlipRequirement = s->ImmediateFlipRequiredFinal;
-		UseMinimumDCFCLK_params->ProgressiveToInterlaceUnitInOPP = mode_lib->ms.ip.ptoi_supported;
-		UseMinimumDCFCLK_params->MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation = mode_lib->ms.soc.max_avg_sdp_bw_use_normal_percent;
-		UseMinimumDCFCLK_params->PercentOfIdealSDPPortBWReceivedAfterUrgLatency = mode_lib->ms.soc.pct_ideal_sdp_bw_after_urgent;
-		UseMinimumDCFCLK_params->VTotal = mode_lib->ms.cache_display_cfg.timing.VTotal;
-		UseMinimumDCFCLK_params->VActive = mode_lib->ms.cache_display_cfg.timing.VActive;
-		UseMinimumDCFCLK_params->DynamicMetadataTransmittedBytes = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataTransmittedBytes;
-		UseMinimumDCFCLK_params->DynamicMetadataLinesBeforeActiveRequired = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataLinesBeforeActiveRequired;
-		UseMinimumDCFCLK_params->Interlace = mode_lib->ms.cache_display_cfg.timing.Interlace;
-		UseMinimumDCFCLK_params->RequiredDPPCLKPerSurface = mode_lib->ms.RequiredDPPCLKPerSurface;
-		UseMinimumDCFCLK_params->RequiredDISPCLK = mode_lib->ms.RequiredDISPCLK;
-		UseMinimumDCFCLK_params->UrgLatency = mode_lib->ms.UrgLatency;
-		UseMinimumDCFCLK_params->NoOfDPP = mode_lib->ms.NoOfDPP;
-		UseMinimumDCFCLK_params->ProjectedDCFCLKDeepSleep = mode_lib->ms.ProjectedDCFCLKDeepSleep;
-		UseMinimumDCFCLK_params->MaximumVStartup = s->MaximumVStartup;
-		UseMinimumDCFCLK_params->TotalNumberOfActiveDPP = mode_lib->ms.TotalNumberOfActiveDPP;
-		UseMinimumDCFCLK_params->TotalNumberOfDCCActiveDPP = mode_lib->ms.TotalNumberOfDCCActiveDPP;
-		UseMinimumDCFCLK_params->dpte_group_bytes = mode_lib->ms.dpte_group_bytes;
-		UseMinimumDCFCLK_params->PrefetchLinesY = mode_lib->ms.PrefetchLinesY;
-		UseMinimumDCFCLK_params->PrefetchLinesC = mode_lib->ms.PrefetchLinesC;
-		UseMinimumDCFCLK_params->swath_width_luma_ub_all_states = mode_lib->ms.swath_width_luma_ub_all_states;
-		UseMinimumDCFCLK_params->swath_width_chroma_ub_all_states = mode_lib->ms.swath_width_chroma_ub_all_states;
-		UseMinimumDCFCLK_params->BytePerPixelY = mode_lib->ms.BytePerPixelY;
-		UseMinimumDCFCLK_params->BytePerPixelC = mode_lib->ms.BytePerPixelC;
-		UseMinimumDCFCLK_params->HTotal = mode_lib->ms.cache_display_cfg.timing.HTotal;
-		UseMinimumDCFCLK_params->PixelClock = mode_lib->ms.cache_display_cfg.timing.PixelClock;
-		UseMinimumDCFCLK_params->PDEAndMetaPTEBytesPerFrame = mode_lib->ms.PDEAndMetaPTEBytesPerFrame;
-		UseMinimumDCFCLK_params->DPTEBytesPerRow = mode_lib->ms.DPTEBytesPerRow;
-		UseMinimumDCFCLK_params->MetaRowBytes = mode_lib->ms.MetaRowBytes;
-		UseMinimumDCFCLK_params->DynamicMetadataEnable = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataEnable;
-		UseMinimumDCFCLK_params->ReadBandwidthLuma = mode_lib->ms.ReadBandwidthLuma;
-		UseMinimumDCFCLK_params->ReadBandwidthChroma = mode_lib->ms.ReadBandwidthChroma;
-		UseMinimumDCFCLK_params->DCFCLKPerState = mode_lib->ms.state.dcfclk_mhz;
-		UseMinimumDCFCLK_params->DCFCLKState = mode_lib->ms.DCFCLKState;
-
-		UseMinimumDCFCLK(&mode_lib->scratch,
-		UseMinimumDCFCLK_params);
-
-	 } // UseMinimumRequiredDCFCLK == true
-
-	for (j = 0; j < 2; ++j) {
-		mode_lib->ms.ReturnBWPerState[j] = dml_get_return_bw_mbps(&mode_lib->ms.soc, mode_lib->ms.state.use_ideal_dram_bw_strobe,
-																mode_lib->ms.cache_display_cfg.plane.HostVMEnable, mode_lib->ms.DCFCLKState[j], mode_lib->ms.state.fabricclk_mhz,
-																mode_lib->ms.state.dram_speed_mts);
-		mode_lib->ms.ReturnDRAMBWPerState[j] = dml_get_return_dram_bw_mbps(&mode_lib->ms.soc, mode_lib->ms.state.use_ideal_dram_bw_strobe,
-																mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
-																mode_lib->ms.state.dram_speed_mts);
-	}
 
-	//Re-ordering Buffer Support Check
-	for (j = 0; j < 2; ++j) {
-		if ((mode_lib->ms.ip.rob_buffer_size_kbytes - mode_lib->ms.ip.pixel_chunk_size_kbytes) * 1024 / mode_lib->ms.ReturnBWPerState[j] >
-			(mode_lib->ms.soc.round_trip_ping_latency_dcfclk_cycles + 32) / mode_lib->ms.DCFCLKState[j] + s->ReorderingBytes / mode_lib->ms.ReturnBWPerState[j]) {
-			mode_lib->ms.support.ROBSupport[j] = true;
-		} else {
-			mode_lib->ms.support.ROBSupport[j] = false;
+		mode_lib->ms.TotalNumberOfDCCActiveDPP[j] = 0;
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			if (mode_lib->ms.cache_display_cfg.surface.DCCEnable[k] == true) {
+				mode_lib->ms.TotalNumberOfDCCActiveDPP[j] = mode_lib->ms.TotalNumberOfDCCActiveDPP[j] + mode_lib->ms.NoOfDPP[j][k];
+			}
 		}
-		dml_print("DML::%s: DEBUG ROBSupport[%u] = %u (%u)\n",  __func__, j, mode_lib->ms.support.ROBSupport[j], __LINE__);
-	}
-
-	//Vertical Active BW support check
-	s->MaxTotalVActiveRDBandwidth = 0;
-	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-		s->MaxTotalVActiveRDBandwidth = s->MaxTotalVActiveRDBandwidth + mode_lib->ms.ReadBandwidthLuma[k] + mode_lib->ms.ReadBandwidthChroma[k];
-	}
 
-	for (j = 0; j < 2; ++j) {
-		mode_lib->ms.support.MaxTotalVerticalActiveAvailableBandwidth[j] = dml_min3(mode_lib->ms.soc.return_bus_width_bytes * mode_lib->ms.DCFCLKState[j] * mode_lib->ms.soc.max_avg_sdp_bw_use_normal_percent / 100.0,
-																	mode_lib->ms.state.fabricclk_mhz * mode_lib->ms.soc.fabric_datapath_to_dcn_data_return_bytes * mode_lib->ms.soc.max_avg_fabric_bw_use_normal_percent / 100.0,
-																	mode_lib->ms.state.dram_speed_mts * mode_lib->ms.soc.num_chans * mode_lib->ms.soc.dram_channel_width_bytes *
-																	((mode_lib->ms.state.use_ideal_dram_bw_strobe && !mode_lib->ms.cache_display_cfg.plane.HostVMEnable) ?
-																	mode_lib->ms.soc.max_avg_dram_bw_use_normal_strobe_percent : mode_lib->ms.soc.max_avg_dram_bw_use_normal_percent) / 100.0);
-
-		if (s->MaxTotalVActiveRDBandwidth <= mode_lib->ms.support.MaxTotalVerticalActiveAvailableBandwidth[j]) {
-			mode_lib->ms.support.TotalVerticalActiveBandwidthSupport[j] = true;
-		} else {
-			mode_lib->ms.support.TotalVerticalActiveBandwidthSupport[j] = false;
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			s->SurfParameters[k].PixelClock = mode_lib->ms.cache_display_cfg.timing.PixelClock[k];
+			s->SurfParameters[k].DPPPerSurface = mode_lib->ms.NoOfDPP[j][k];
+			s->SurfParameters[k].SourceScan = mode_lib->ms.cache_display_cfg.plane.SourceScan[k];
+			s->SurfParameters[k].ViewportHeight = mode_lib->ms.cache_display_cfg.plane.ViewportHeight[k];
+			s->SurfParameters[k].ViewportHeightChroma = mode_lib->ms.cache_display_cfg.plane.ViewportHeightChroma[k];
+			s->SurfParameters[k].BlockWidth256BytesY = mode_lib->ms.Read256BlockWidthY[k];
+			s->SurfParameters[k].BlockHeight256BytesY = mode_lib->ms.Read256BlockHeightY[k];
+			s->SurfParameters[k].BlockWidth256BytesC = mode_lib->ms.Read256BlockWidthC[k];
+			s->SurfParameters[k].BlockHeight256BytesC = mode_lib->ms.Read256BlockHeightC[k];
+			s->SurfParameters[k].BlockWidthY = mode_lib->ms.MacroTileWidthY[k];
+			s->SurfParameters[k].BlockHeightY = mode_lib->ms.MacroTileHeightY[k];
+			s->SurfParameters[k].BlockWidthC = mode_lib->ms.MacroTileWidthC[k];
+			s->SurfParameters[k].BlockHeightC = mode_lib->ms.MacroTileHeightC[k];
+			s->SurfParameters[k].InterlaceEnable = mode_lib->ms.cache_display_cfg.timing.Interlace[k];
+			s->SurfParameters[k].HTotal = mode_lib->ms.cache_display_cfg.timing.HTotal[k];
+			s->SurfParameters[k].DCCEnable = mode_lib->ms.cache_display_cfg.surface.DCCEnable[k];
+			s->SurfParameters[k].SourcePixelFormat = mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k];
+			s->SurfParameters[k].SurfaceTiling = mode_lib->ms.cache_display_cfg.surface.SurfaceTiling[k];
+			s->SurfParameters[k].BytePerPixelY = mode_lib->ms.BytePerPixelY[k];
+			s->SurfParameters[k].BytePerPixelC = mode_lib->ms.BytePerPixelC[k];
+			s->SurfParameters[k].ProgressiveToInterlaceUnitInOPP = mode_lib->ms.ip.ptoi_supported;
+			s->SurfParameters[k].VRatio = mode_lib->ms.cache_display_cfg.plane.VRatio[k];
+			s->SurfParameters[k].VRatioChroma = mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k];
+			s->SurfParameters[k].VTaps = mode_lib->ms.cache_display_cfg.plane.VTaps[k];
+			s->SurfParameters[k].VTapsChroma = mode_lib->ms.cache_display_cfg.plane.VTapsChroma[k];
+			s->SurfParameters[k].PitchY = mode_lib->ms.cache_display_cfg.surface.PitchY[k];
+			s->SurfParameters[k].DCCMetaPitchY = mode_lib->ms.cache_display_cfg.surface.DCCMetaPitchY[k];
+			s->SurfParameters[k].PitchC = mode_lib->ms.cache_display_cfg.surface.PitchC[k];
+			s->SurfParameters[k].DCCMetaPitchC = mode_lib->ms.cache_display_cfg.surface.DCCMetaPitchC[k];
+			s->SurfParameters[k].ViewportStationary = mode_lib->ms.cache_display_cfg.plane.ViewportStationary[k];
+			s->SurfParameters[k].ViewportXStart = mode_lib->ms.cache_display_cfg.plane.ViewportXStart[k];
+			s->SurfParameters[k].ViewportYStart = mode_lib->ms.cache_display_cfg.plane.ViewportYStart[k];
+			s->SurfParameters[k].ViewportXStartC = mode_lib->ms.cache_display_cfg.plane.ViewportXStartC[k];
+			s->SurfParameters[k].ViewportYStartC = mode_lib->ms.cache_display_cfg.plane.ViewportYStartC[k];
+			s->SurfParameters[k].FORCE_ONE_ROW_FOR_FRAME = mode_lib->ms.cache_display_cfg.plane.ForceOneRowForFrame[k];
+			s->SurfParameters[k].SwathHeightY = mode_lib->ms.SwathHeightYThisState[k];
+			s->SurfParameters[k].SwathHeightC = mode_lib->ms.SwathHeightCThisState[k];
 		}
-	}
 
-	/* Prefetch Check */
+		CalculateVMRowAndSwath_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
+		CalculateVMRowAndSwath_params->myPipe = s->SurfParameters;
+		CalculateVMRowAndSwath_params->SurfaceSizeInMALL = mode_lib->ms.SurfaceSizeInMALL;
+		CalculateVMRowAndSwath_params->PTEBufferSizeInRequestsLuma = mode_lib->ms.ip.dpte_buffer_size_in_pte_reqs_luma;
+		CalculateVMRowAndSwath_params->PTEBufferSizeInRequestsChroma = mode_lib->ms.ip.dpte_buffer_size_in_pte_reqs_chroma;
+		CalculateVMRowAndSwath_params->DCCMetaBufferSizeBytes = mode_lib->ms.ip.dcc_meta_buffer_size_bytes;
+		CalculateVMRowAndSwath_params->UseMALLForStaticScreen = mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen;
+		CalculateVMRowAndSwath_params->UseMALLForPStateChange = mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange;
+		CalculateVMRowAndSwath_params->MALLAllocatedForDCN = mode_lib->ms.soc.mall_allocated_for_dcn_mbytes;
+		CalculateVMRowAndSwath_params->SwathWidthY = mode_lib->ms.SwathWidthYThisState;
+		CalculateVMRowAndSwath_params->SwathWidthC = mode_lib->ms.SwathWidthCThisState;
+		CalculateVMRowAndSwath_params->GPUVMEnable = mode_lib->ms.cache_display_cfg.plane.GPUVMEnable;
+		CalculateVMRowAndSwath_params->HostVMEnable = mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
+		CalculateVMRowAndSwath_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
+		CalculateVMRowAndSwath_params->GPUVMMaxPageTableLevels = mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels;
+		CalculateVMRowAndSwath_params->GPUVMMinPageSizeKBytes = mode_lib->ms.cache_display_cfg.plane.GPUVMMinPageSizeKBytes;
+		CalculateVMRowAndSwath_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
+		CalculateVMRowAndSwath_params->PTEBufferModeOverrideEn = mode_lib->ms.cache_display_cfg.plane.PTEBufferModeOverrideEn;
+		CalculateVMRowAndSwath_params->PTEBufferModeOverrideVal = mode_lib->ms.cache_display_cfg.plane.PTEBufferMode;
+		CalculateVMRowAndSwath_params->PTEBufferSizeNotExceeded = mode_lib->ms.PTEBufferSizeNotExceededPerState;
+		CalculateVMRowAndSwath_params->DCCMetaBufferSizeNotExceeded = mode_lib->ms.DCCMetaBufferSizeNotExceededPerState;
+		CalculateVMRowAndSwath_params->dpte_row_width_luma_ub = s->dummy_integer_array[0];
+		CalculateVMRowAndSwath_params->dpte_row_width_chroma_ub = s->dummy_integer_array[1];
+		CalculateVMRowAndSwath_params->dpte_row_height_luma = mode_lib->ms.dpte_row_height;
+		CalculateVMRowAndSwath_params->dpte_row_height_chroma = mode_lib->ms.dpte_row_height_chroma;
+		CalculateVMRowAndSwath_params->dpte_row_height_linear_luma = s->dummy_integer_array[2]; // VBA_DELTA
+		CalculateVMRowAndSwath_params->dpte_row_height_linear_chroma = s->dummy_integer_array[3]; // VBA_DELTA
+		CalculateVMRowAndSwath_params->meta_req_width = s->dummy_integer_array[4];
+		CalculateVMRowAndSwath_params->meta_req_width_chroma = s->dummy_integer_array[5];
+		CalculateVMRowAndSwath_params->meta_req_height = s->dummy_integer_array[6];
+		CalculateVMRowAndSwath_params->meta_req_height_chroma = s->dummy_integer_array[7];
+		CalculateVMRowAndSwath_params->meta_row_width = s->dummy_integer_array[8];
+		CalculateVMRowAndSwath_params->meta_row_width_chroma = s->dummy_integer_array[9];
+		CalculateVMRowAndSwath_params->meta_row_height = mode_lib->ms.meta_row_height;
+		CalculateVMRowAndSwath_params->meta_row_height_chroma = mode_lib->ms.meta_row_height_chroma;
+		CalculateVMRowAndSwath_params->vm_group_bytes = s->dummy_integer_array[10];
+		CalculateVMRowAndSwath_params->dpte_group_bytes = mode_lib->ms.dpte_group_bytes;
+		CalculateVMRowAndSwath_params->PixelPTEReqWidthY = s->dummy_integer_array[11];
+		CalculateVMRowAndSwath_params->PixelPTEReqHeightY = s->dummy_integer_array[12];
+		CalculateVMRowAndSwath_params->PTERequestSizeY = s->dummy_integer_array[13];
+		CalculateVMRowAndSwath_params->PixelPTEReqWidthC = s->dummy_integer_array[14];
+		CalculateVMRowAndSwath_params->PixelPTEReqHeightC = s->dummy_integer_array[15];
+		CalculateVMRowAndSwath_params->PTERequestSizeC = s->dummy_integer_array[16];
+		CalculateVMRowAndSwath_params->dpde0_bytes_per_frame_ub_l = s->dummy_integer_array[17];
+		CalculateVMRowAndSwath_params->meta_pte_bytes_per_frame_ub_l = s->dummy_integer_array[18];
+		CalculateVMRowAndSwath_params->dpde0_bytes_per_frame_ub_c = s->dummy_integer_array[19];
+		CalculateVMRowAndSwath_params->meta_pte_bytes_per_frame_ub_c = s->dummy_integer_array[20];
+		CalculateVMRowAndSwath_params->PrefetchSourceLinesY = mode_lib->ms.PrefetchLinesYThisState;
+		CalculateVMRowAndSwath_params->PrefetchSourceLinesC = mode_lib->ms.PrefetchLinesCThisState;
+		CalculateVMRowAndSwath_params->VInitPreFillY = mode_lib->ms.PrefillY;
+		CalculateVMRowAndSwath_params->VInitPreFillC = mode_lib->ms.PrefillC;
+		CalculateVMRowAndSwath_params->MaxNumSwathY = mode_lib->ms.MaxNumSwY;
+		CalculateVMRowAndSwath_params->MaxNumSwathC = mode_lib->ms.MaxNumSwC;
+		CalculateVMRowAndSwath_params->meta_row_bw = mode_lib->ms.meta_row_bandwidth_this_state;
+		CalculateVMRowAndSwath_params->dpte_row_bw = mode_lib->ms.dpte_row_bandwidth_this_state;
+		CalculateVMRowAndSwath_params->PixelPTEBytesPerRow = mode_lib->ms.DPTEBytesPerRowThisState;
+		CalculateVMRowAndSwath_params->PDEAndMetaPTEBytesFrame = mode_lib->ms.PDEAndMetaPTEBytesPerFrameThisState;
+		CalculateVMRowAndSwath_params->MetaRowByte = mode_lib->ms.MetaRowBytesThisState;
+		CalculateVMRowAndSwath_params->use_one_row_for_frame = mode_lib->ms.use_one_row_for_frame_this_state;
+		CalculateVMRowAndSwath_params->use_one_row_for_frame_flip = mode_lib->ms.use_one_row_for_frame_flip_this_state;
+		CalculateVMRowAndSwath_params->UsesMALLForStaticScreen = s->dummy_boolean_array[0];
+		CalculateVMRowAndSwath_params->PTE_BUFFER_MODE = s->dummy_boolean_array[1];
+		CalculateVMRowAndSwath_params->BIGK_FRAGMENT_SIZE = s->dummy_integer_array[21];
 
-	for (j = 0; j < 2; ++j) {
-		mode_lib->ms.TimeCalc = 24 / mode_lib->ms.ProjectedDCFCLKDeepSleep[j];
+		CalculateVMRowAndSwath(&mode_lib->scratch,
+			CalculateVMRowAndSwath_params);
 
 		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.NoOfDPPThisState[k] = mode_lib->ms.NoOfDPP[j][k];
-			mode_lib->ms.swath_width_luma_ub_this_state[k] = mode_lib->ms.swath_width_luma_ub_all_states[j][k];
-			mode_lib->ms.swath_width_chroma_ub_this_state[k] = mode_lib->ms.swath_width_chroma_ub_all_states[j][k];
-			mode_lib->ms.SwathWidthYThisState[k] = mode_lib->ms.SwathWidthYAllStates[j][k];
-			mode_lib->ms.SwathWidthCThisState[k] = mode_lib->ms.SwathWidthCAllStates[j][k];
-			mode_lib->ms.SwathHeightYThisState[k] = mode_lib->ms.SwathHeightYAllStates[j][k];
-			mode_lib->ms.SwathHeightCThisState[k] = mode_lib->ms.SwathHeightCAllStates[j][k];
-			mode_lib->ms.UnboundedRequestEnabledThisState = mode_lib->ms.UnboundedRequestEnabledAllStates[j];
-			mode_lib->ms.CompressedBufferSizeInkByteThisState = mode_lib->ms.CompressedBufferSizeInkByteAllStates[j];
-			mode_lib->ms.DETBufferSizeInKByteThisState[k] = mode_lib->ms.DETBufferSizeInKByteAllStates[j][k];
-			mode_lib->ms.DETBufferSizeYThisState[k] = mode_lib->ms.DETBufferSizeYAllStates[j][k];
-			mode_lib->ms.DETBufferSizeCThisState[k] = mode_lib->ms.DETBufferSizeCAllStates[j][k];
+			mode_lib->ms.PrefetchLinesY[j][k] = mode_lib->ms.PrefetchLinesYThisState[k];
+			mode_lib->ms.PrefetchLinesC[j][k] = mode_lib->ms.PrefetchLinesCThisState[k];
+			mode_lib->ms.meta_row_bandwidth[j][k] = mode_lib->ms.meta_row_bandwidth_this_state[k];
+			mode_lib->ms.dpte_row_bandwidth[j][k] = mode_lib->ms.dpte_row_bandwidth_this_state[k];
+			mode_lib->ms.DPTEBytesPerRow[j][k] = mode_lib->ms.DPTEBytesPerRowThisState[k];
+			mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k] = mode_lib->ms.PDEAndMetaPTEBytesPerFrameThisState[k];
+			mode_lib->ms.MetaRowBytes[j][k] = mode_lib->ms.MetaRowBytesThisState[k];
+			mode_lib->ms.use_one_row_for_frame[j][k] = mode_lib->ms.use_one_row_for_frame_this_state[k];
+			mode_lib->ms.use_one_row_for_frame_flip[j][k] = mode_lib->ms.use_one_row_for_frame_flip_this_state[k];
 		}
 
-		mode_lib->ms.support.VActiveBandwithSupport[j] = CalculateVActiveBandwithSupport(
-			mode_lib->ms.num_active_planes,
-			mode_lib->ms.ReturnBWPerState[j],
-			mode_lib->ms.NotUrgentLatencyHiding,
-			mode_lib->ms.ReadBandwidthLuma,
-			mode_lib->ms.ReadBandwidthChroma,
-			mode_lib->ms.cursor_bw,
-			mode_lib->ms.meta_row_bandwidth_this_state,
-			mode_lib->ms.dpte_row_bandwidth_this_state,
-			mode_lib->ms.NoOfDPPThisState,
-			mode_lib->ms.UrgentBurstFactorLuma,
-			mode_lib->ms.UrgentBurstFactorChroma,
-			mode_lib->ms.UrgentBurstFactorCursor);
-
-		s->VMDataOnlyReturnBWPerState = dml_get_return_bw_mbps_vm_only(
-																	&mode_lib->ms.soc,
-																	mode_lib->ms.state.use_ideal_dram_bw_strobe,
-																	mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
-																	mode_lib->ms.DCFCLKState[j],
-																	mode_lib->ms.state.fabricclk_mhz,
-																	mode_lib->ms.state.dram_speed_mts);
-
-		s->HostVMInefficiencyFactor = 1;
-		if (mode_lib->ms.cache_display_cfg.plane.GPUVMEnable && mode_lib->ms.cache_display_cfg.plane.HostVMEnable)
-			s->HostVMInefficiencyFactor = mode_lib->ms.ReturnBWPerState[j] / s->VMDataOnlyReturnBWPerState;
-
-		mode_lib->ms.ExtraLatency = CalculateExtraLatency(
-				mode_lib->ms.soc.round_trip_ping_latency_dcfclk_cycles,
-				s->ReorderingBytes,
-				mode_lib->ms.DCFCLKState[j],
-				mode_lib->ms.TotalNumberOfActiveDPP[j],
-				mode_lib->ms.ip.pixel_chunk_size_kbytes,
-				mode_lib->ms.TotalNumberOfDCCActiveDPP[j],
-				mode_lib->ms.ip.meta_chunk_size_kbytes,
-				mode_lib->ms.ReturnBWPerState[j],
-				mode_lib->ms.cache_display_cfg.plane.GPUVMEnable,
-				mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
-				mode_lib->ms.num_active_planes,
-				mode_lib->ms.NoOfDPPThisState,
-				mode_lib->ms.dpte_group_bytes,
-				s->HostVMInefficiencyFactor,
-				mode_lib->ms.soc.hostvm_min_page_size_kbytes,
-				mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels);
+		mode_lib->ms.support.PTEBufferSizeNotExceeded[j] = true;
 
-		s->NextMaxVStartup = s->MaxVStartupAllPlanes[j];
-		s->MaxVStartup = 0;
-		s->AllPrefetchModeTested = true;
-		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-			CalculatePrefetchMode(mode_lib->ms.policy.AllowForPStateChangeOrStutterInVBlank[k], &s->MinPrefetchMode[k], &s->MaxPrefetchMode[k]);
-			s->NextPrefetchMode[k] = s->MinPrefetchMode[k];
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			if (mode_lib->ms.PTEBufferSizeNotExceededPerState[k] == false)
+				mode_lib->ms.support.PTEBufferSizeNotExceeded[j] = false;
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: j=%u k=%u, PTEBufferSizeNotExceededPerState[%u] = %u\n",  __func__, j, k, k, mode_lib->ms.PTEBufferSizeNotExceededPerState[k]);
+#endif
 		}
-
-		do {
-			s->MaxVStartup = s->NextMaxVStartup;
-			s->AllPrefetchModeTested = true;
-
-			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-				mode_lib->ms.PrefetchMode[k] = s->NextPrefetchMode[k];
-				mode_lib->ms.TWait = CalculateTWait(
-								mode_lib->ms.PrefetchMode[k],
-								mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k],
-								mode_lib->ms.policy.SynchronizeDRRDisplaysForUCLKPStateChangeFinal,
-								mode_lib->ms.cache_display_cfg.timing.DRRDisplay[k],
-								mode_lib->ms.state.dram_clock_change_latency_us,
-								mode_lib->ms.state.fclk_change_latency_us,
-								mode_lib->ms.UrgLatency,
-								mode_lib->ms.state.sr_enter_plus_exit_time_us);
-
-				myPipe = &s->myPipe;
-				myPipe->Dppclk = mode_lib->ms.RequiredDPPCLKPerSurface[j][k];
-				myPipe->Dispclk = mode_lib->ms.RequiredDISPCLK[j];
-				myPipe->PixelClock = mode_lib->ms.cache_display_cfg.timing.PixelClock[k];
-				myPipe->DCFClkDeepSleep = mode_lib->ms.ProjectedDCFCLKDeepSleep[j];
-				myPipe->DPPPerSurface = mode_lib->ms.NoOfDPP[j][k];
-				myPipe->ScalerEnabled = mode_lib->ms.cache_display_cfg.plane.ScalerEnabled[k];
-				myPipe->SourceScan = mode_lib->ms.cache_display_cfg.plane.SourceScan[k];
-				myPipe->BlockWidth256BytesY = mode_lib->ms.Read256BlockWidthY[k];
-				myPipe->BlockHeight256BytesY = mode_lib->ms.Read256BlockHeightY[k];
-				myPipe->BlockWidth256BytesC = mode_lib->ms.Read256BlockWidthC[k];
-				myPipe->BlockHeight256BytesC = mode_lib->ms.Read256BlockHeightC[k];
-				myPipe->InterlaceEnable = mode_lib->ms.cache_display_cfg.timing.Interlace[k];
-				myPipe->NumberOfCursors = mode_lib->ms.cache_display_cfg.plane.NumberOfCursors[k];
-				myPipe->VBlank = mode_lib->ms.cache_display_cfg.timing.VTotal[k] - mode_lib->ms.cache_display_cfg.timing.VActive[k];
-				myPipe->HTotal = mode_lib->ms.cache_display_cfg.timing.HTotal[k];
-				myPipe->HActive = mode_lib->ms.cache_display_cfg.timing.HActive[k];
-				myPipe->DCCEnable = mode_lib->ms.cache_display_cfg.surface.DCCEnable[k];
-				myPipe->ODMMode = mode_lib->ms.ODMModePerState[k];
-				myPipe->SourcePixelFormat = mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k];
-				myPipe->BytePerPixelY = mode_lib->ms.BytePerPixelY[k];
-				myPipe->BytePerPixelC = mode_lib->ms.BytePerPixelC[k];
-				myPipe->ProgressiveToInterlaceUnitInOPP = mode_lib->ms.ip.ptoi_supported;
-
 #ifdef __DML_VBA_DEBUG__
-				dml_print("DML::%s: Calling CalculatePrefetchSchedule for j=%u, k=%u\n", __func__, j, k);
-				dml_print("DML::%s: MaximumVStartup = %u\n", __func__, s->MaximumVStartup[j][k]);
-				dml_print("DML::%s: MaxVStartup = %u\n", __func__, s->MaxVStartup);
-				dml_print("DML::%s: NextPrefetchMode = %u\n", __func__, s->NextPrefetchMode[k]);
-				dml_print("DML::%s: AllowForPStateChangeOrStutterInVBlank = %u\n", __func__, mode_lib->ms.policy.AllowForPStateChangeOrStutterInVBlank[k]);
-				dml_print("DML::%s: PrefetchMode = %u\n", __func__, mode_lib->ms.PrefetchMode[k]);
+		dml_print("DML::%s: PTEBufferSizeNotExceeded[%u] = %u\n",  __func__, j, mode_lib->ms.support.PTEBufferSizeNotExceeded[j]);
 #endif
 
-				CalculatePrefetchSchedule_params->EnhancedPrefetchScheduleAccelerationFinal = mode_lib->ms.policy.EnhancedPrefetchScheduleAccelerationFinal;
-				CalculatePrefetchSchedule_params->HostVMInefficiencyFactor = s->HostVMInefficiencyFactor;
-				CalculatePrefetchSchedule_params->myPipe = myPipe;
-				CalculatePrefetchSchedule_params->DSCDelay = mode_lib->ms.DSCDelayPerState[k];
-				CalculatePrefetchSchedule_params->DPPCLKDelaySubtotalPlusCNVCFormater = mode_lib->ms.ip.dppclk_delay_subtotal + mode_lib->ms.ip.dppclk_delay_cnvc_formatter;
-				CalculatePrefetchSchedule_params->DPPCLKDelaySCL = mode_lib->ms.ip.dppclk_delay_scl;
-				CalculatePrefetchSchedule_params->DPPCLKDelaySCLLBOnly = mode_lib->ms.ip.dppclk_delay_scl_lb_only;
-				CalculatePrefetchSchedule_params->DPPCLKDelayCNVCCursor = mode_lib->ms.ip.dppclk_delay_cnvc_cursor;
-				CalculatePrefetchSchedule_params->DISPCLKDelaySubtotal = mode_lib->ms.ip.dispclk_delay_subtotal;
-				CalculatePrefetchSchedule_params->DPP_RECOUT_WIDTH = (dml_uint_t)(mode_lib->ms.SwathWidthYThisState[k] / mode_lib->ms.cache_display_cfg.plane.HRatio[k]);
-				CalculatePrefetchSchedule_params->OutputFormat = mode_lib->ms.cache_display_cfg.output.OutputFormat[k];
-				CalculatePrefetchSchedule_params->MaxInterDCNTileRepeaters = mode_lib->ms.ip.max_inter_dcn_tile_repeaters;
-				CalculatePrefetchSchedule_params->VStartup = (dml_uint_t)(dml_min(s->MaxVStartup, s->MaximumVStartup[j][k]));
-				CalculatePrefetchSchedule_params->MaxVStartup = s->MaximumVStartup[j][k];
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
-				CalculatePrefetchSchedule_params->DSTXAfterScaler = &s->DSTXAfterScaler[k];
-				CalculatePrefetchSchedule_params->DSTYAfterScaler = &s->DSTYAfterScaler[k];
-				CalculatePrefetchSchedule_params->DestinationLinesForPrefetch = &mode_lib->ms.LineTimesForPrefetch[k];
-				CalculatePrefetchSchedule_params->DestinationLinesToRequestVMInVBlank = &mode_lib->ms.LinesForMetaPTE[k];
-				CalculatePrefetchSchedule_params->DestinationLinesToRequestRowInVBlank = &mode_lib->ms.LinesForMetaAndDPTERow[k];
-				CalculatePrefetchSchedule_params->VRatioPrefetchY = &mode_lib->ms.VRatioPreY[j][k];
-				CalculatePrefetchSchedule_params->VRatioPrefetchC = &mode_lib->ms.VRatioPreC[j][k];
-				CalculatePrefetchSchedule_params->RequiredPrefetchPixDataBWLuma = &mode_lib->ms.RequiredPrefetchPixelDataBWLuma[k];
-				CalculatePrefetchSchedule_params->RequiredPrefetchPixDataBWChroma = &mode_lib->ms.RequiredPrefetchPixelDataBWChroma[k];
-				CalculatePrefetchSchedule_params->NotEnoughTimeForDynamicMetadata = &mode_lib->ms.support.NoTimeForDynamicMetadata[j][k];
-				CalculatePrefetchSchedule_params->Tno_bw = &mode_lib->ms.Tno_bw[k];
-				CalculatePrefetchSchedule_params->prefetch_vmrow_bw = &mode_lib->ms.prefetch_vmrow_bw[k];
-				CalculatePrefetchSchedule_params->Tdmdl_vm = &s->dummy_single[0];
-				CalculatePrefetchSchedule_params->Tdmdl = &s->dummy_single[1];
-				CalculatePrefetchSchedule_params->TSetup = &s->dummy_single[2];
-				CalculatePrefetchSchedule_params->VUpdateOffsetPix = &s->dummy_integer[0];
-				CalculatePrefetchSchedule_params->VUpdateWidthPix = &s->dummy_integer[1];
-				CalculatePrefetchSchedule_params->VReadyOffsetPix = &s->dummy_integer[2];
+		mode_lib->ms.support.DCCMetaBufferSizeNotExceeded[j] = true;
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			if (mode_lib->ms.DCCMetaBufferSizeNotExceededPerState[k] == false)
+				mode_lib->ms.support.DCCMetaBufferSizeNotExceeded[j] = false;
+		}
 
-				mode_lib->ms.support.NoTimeForPrefetch[j][k] =
-								CalculatePrefetchSchedule(&mode_lib->scratch,
-								CalculatePrefetchSchedule_params);
-			}
+		mode_lib->ms.UrgLatency = CalculateUrgentLatency(mode_lib->ms.state.urgent_latency_pixel_data_only_us,
+													mode_lib->ms.state.urgent_latency_pixel_mixed_with_vm_data_us,
+													mode_lib->ms.state.urgent_latency_vm_data_only_us,
+													mode_lib->ms.soc.do_urgent_latency_adjustment,
+													mode_lib->ms.state.urgent_latency_adjustment_fabric_clock_component_us,
+													mode_lib->ms.state.urgent_latency_adjustment_fabric_clock_reference_mhz,
+													mode_lib->ms.state.fabricclk_mhz);
 
-			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-					CalculateUrgentBurstFactor(
-							mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k],
-							mode_lib->ms.swath_width_luma_ub_this_state[k],
-							mode_lib->ms.swath_width_chroma_ub_this_state[k],
-							mode_lib->ms.SwathHeightYThisState[k],
-							mode_lib->ms.SwathHeightCThisState[k],
-							mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
-							mode_lib->ms.UrgLatency,
-							mode_lib->ms.ip.cursor_buffer_size,
-							mode_lib->ms.cache_display_cfg.plane.CursorWidth[k],
-							mode_lib->ms.cache_display_cfg.plane.CursorBPP[k],
-							mode_lib->ms.VRatioPreY[j][k],
-							mode_lib->ms.VRatioPreC[j][k],
-							mode_lib->ms.BytePerPixelInDETY[k],
-							mode_lib->ms.BytePerPixelInDETC[k],
-							mode_lib->ms.DETBufferSizeYThisState[k],
-							mode_lib->ms.DETBufferSizeCThisState[k],
-							/* Output */
-							&mode_lib->ms.UrgentBurstFactorCursorPre[k],
-							&mode_lib->ms.UrgentBurstFactorLumaPre[k],
-							&mode_lib->ms.UrgentBurstFactorChroma[k],
-							&mode_lib->ms.NotUrgentLatencyHidingPre[k]);
+		/* Getter functions work at mp interface so copy the urgent latency to mp*/
+		mode_lib->mp.UrgentLatency = mode_lib->ms.UrgLatency;
 
-					mode_lib->ms.cursor_bw_pre[k] = mode_lib->ms.cache_display_cfg.plane.NumberOfCursors[k] * mode_lib->ms.cache_display_cfg.plane.CursorWidth[k] *
-													mode_lib->ms.cache_display_cfg.plane.CursorBPP[k] / 8.0 / (mode_lib->ms.cache_display_cfg.timing.HTotal[k] /
-													mode_lib->ms.cache_display_cfg.timing.PixelClock[k]) * mode_lib->ms.VRatioPreY[j][k];
-			}
+		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+			CalculateUrgentBurstFactor(
+				mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k],
+				mode_lib->ms.swath_width_luma_ub_this_state[k],
+				mode_lib->ms.swath_width_chroma_ub_this_state[k],
+				mode_lib->ms.SwathHeightYThisState[k],
+				mode_lib->ms.SwathHeightCThisState[k],
+				(dml_float_t) mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k],
+				mode_lib->ms.UrgLatency,
+				mode_lib->ms.ip.cursor_buffer_size,
+				mode_lib->ms.cache_display_cfg.plane.CursorWidth[k],
+				mode_lib->ms.cache_display_cfg.plane.CursorBPP[k],
+				mode_lib->ms.cache_display_cfg.plane.VRatio[k],
+				mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k],
+				mode_lib->ms.BytePerPixelInDETY[k],
+				mode_lib->ms.BytePerPixelInDETC[k],
+				mode_lib->ms.DETBufferSizeYThisState[k],
+				mode_lib->ms.DETBufferSizeCThisState[k],
+				/* Output */
+				&mode_lib->ms.UrgentBurstFactorCursor[k],
+				&mode_lib->ms.UrgentBurstFactorLuma[k],
+				&mode_lib->ms.UrgentBurstFactorChroma[k],
+				&mode_lib->ms.NotUrgentLatencyHiding[k]);
+		}
 
-			{
-			CalculatePrefetchBandwithSupport(
+		CalculateDCFCLKDeepSleep(
 				mode_lib->ms.num_active_planes,
-				mode_lib->ms.ReturnBWPerState[j],
-				mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange,
-				mode_lib->ms.NotUrgentLatencyHidingPre,
+				mode_lib->ms.BytePerPixelY,
+				mode_lib->ms.BytePerPixelC,
+				mode_lib->ms.cache_display_cfg.plane.VRatio,
+				mode_lib->ms.cache_display_cfg.plane.VRatioChroma,
+				mode_lib->ms.SwathWidthYThisState,
+				mode_lib->ms.SwathWidthCThisState,
+				mode_lib->ms.NoOfDPPThisState,
+				mode_lib->ms.cache_display_cfg.plane.HRatio,
+				mode_lib->ms.cache_display_cfg.plane.HRatioChroma,
+				mode_lib->ms.cache_display_cfg.timing.PixelClock,
+				mode_lib->ms.PSCL_FACTOR,
+				mode_lib->ms.PSCL_FACTOR_CHROMA,
+				mode_lib->ms.RequiredDPPCLKThisState,
 				mode_lib->ms.ReadBandwidthLuma,
 				mode_lib->ms.ReadBandwidthChroma,
-				mode_lib->ms.RequiredPrefetchPixelDataBWLuma,
-				mode_lib->ms.RequiredPrefetchPixelDataBWChroma,
-				mode_lib->ms.cursor_bw,
-				mode_lib->ms.meta_row_bandwidth_this_state,
-				mode_lib->ms.dpte_row_bandwidth_this_state,
-				mode_lib->ms.cursor_bw_pre,
-				mode_lib->ms.prefetch_vmrow_bw,
-				mode_lib->ms.NoOfDPPThisState,
-				mode_lib->ms.UrgentBurstFactorLuma,
-				mode_lib->ms.UrgentBurstFactorChroma,
-				mode_lib->ms.UrgentBurstFactorCursor,
-				mode_lib->ms.UrgentBurstFactorLumaPre,
-				mode_lib->ms.UrgentBurstFactorChromaPre,
-				mode_lib->ms.UrgentBurstFactorCursorPre,
+				mode_lib->ms.soc.return_bus_width_bytes,
 
-				/* output */
-				&s->dummy_single[0], // dml_float_t *PrefetchBandwidth
-				&s->dummy_single[1], // dml_float_t *PrefetchBandwidthNotIncludingMALLPrefetch
-				&mode_lib->mp.FractionOfUrgentBandwidth, // dml_float_t *FractionOfUrgentBandwidth
-				&mode_lib->ms.support.PrefetchSupported[j]);
-			}
+				/* Output */
+				&mode_lib->ms.ProjectedDCFCLKDeepSleep[j]);
+	}
 
-			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-				if (mode_lib->ms.LineTimesForPrefetch[k] < 2.0
-					|| mode_lib->ms.LinesForMetaPTE[k] >= 32.0
-					|| mode_lib->ms.LinesForMetaAndDPTERow[k] >= 16.0
-					|| mode_lib->ms.support.NoTimeForPrefetch[j][k] == true) {
-						mode_lib->ms.support.PrefetchSupported[j] = false;
+	//Calculate Return BW
+	for (j = 0; j < 2; ++j) {
+		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+			if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == k) {
+				if (mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[k] == true) {
+					mode_lib->ms.WritebackDelayTime[k] = mode_lib->ms.state.writeback_latency_us + CalculateWriteBackDelay(
+									mode_lib->ms.cache_display_cfg.writeback.WritebackPixelFormat[k],
+									mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[k],
+									mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[k],
+									mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[k],
+									mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[k],
+									mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationHeight[k],
+									mode_lib->ms.cache_display_cfg.writeback.WritebackSourceHeight[k],
+									mode_lib->ms.cache_display_cfg.timing.HTotal[k]) / mode_lib->ms.RequiredDISPCLK[j];
+				} else {
+					mode_lib->ms.WritebackDelayTime[k] = 0.0;
 				}
-			}
-
-			mode_lib->ms.support.DynamicMetadataSupported[j] = true;
-			for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-				if (mode_lib->ms.support.NoTimeForDynamicMetadata[j][k] == true) {
-					mode_lib->ms.support.DynamicMetadataSupported[j] = false;
+				for (m = 0; m <= mode_lib->ms.num_active_planes - 1; m++) {
+					if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[m] == k && mode_lib->ms.cache_display_cfg.writeback.WritebackEnable[m] == true) {
+						mode_lib->ms.WritebackDelayTime[k] = dml_max(mode_lib->ms.WritebackDelayTime[k],
+											mode_lib->ms.state.writeback_latency_us + CalculateWriteBackDelay(
+											mode_lib->ms.cache_display_cfg.writeback.WritebackPixelFormat[m],
+											mode_lib->ms.cache_display_cfg.writeback.WritebackHRatio[m],
+											mode_lib->ms.cache_display_cfg.writeback.WritebackVRatio[m],
+											mode_lib->ms.cache_display_cfg.writeback.WritebackVTaps[m],
+											mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth[m],
+											mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationHeight[m],
+											mode_lib->ms.cache_display_cfg.writeback.WritebackSourceHeight[m],
+											mode_lib->ms.cache_display_cfg.timing.HTotal[m]) / mode_lib->ms.RequiredDISPCLK[j]);
+					}
 				}
 			}
-
-			mode_lib->ms.support.VRatioInPrefetchSupported[j] = true;
-			for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-				if (mode_lib->ms.support.NoTimeForPrefetch[j][k] == true ||
-					mode_lib->ms.VRatioPreY[j][k] > __DML_MAX_VRATIO_PRE_ENHANCE_PREFETCH_ACC__ ||
-					mode_lib->ms.VRatioPreC[j][k] > __DML_MAX_VRATIO_PRE_ENHANCE_PREFETCH_ACC__ ||
-					((s->MaxVStartup < s->MaximumVStartup[j][k] || mode_lib->ms.policy.EnhancedPrefetchScheduleAccelerationFinal == 0) &&
-						(mode_lib->ms.VRatioPreY[j][k] > __DML_MAX_VRATIO_PRE__ || mode_lib->ms.VRatioPreC[j][k] > __DML_MAX_VRATIO_PRE__))) {
-							mode_lib->ms.support.VRatioInPrefetchSupported[j] = false;
+		}
+		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+			for (m = 0; m <= mode_lib->ms.num_active_planes - 1; m++) {
+				if (mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming[k] == m) {
+					mode_lib->ms.WritebackDelayTime[k] = mode_lib->ms.WritebackDelayTime[m];
 				}
 			}
+		}
+       s->MaxVStartupAllPlanes[j] = 0;  // max vstartup among all planes
 
-			s->AnyLinesForVMOrRowTooLarge = false;
-			for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-				if (mode_lib->ms.LinesForMetaAndDPTERow[k] >= 16 || mode_lib->ms.LinesForMetaPTE[k] >= 32) {
-					s->AnyLinesForVMOrRowTooLarge = true;
-				}
-			}
+		for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
+			s->MaximumVStartup[j][k] = CalculateMaxVStartup(k,
+														mode_lib->ms.ip.ptoi_supported,
+														mode_lib->ms.ip.vblank_nom_default_us,
+														&mode_lib->ms.cache_display_cfg.timing,
+														mode_lib->ms.WritebackDelayTime[k]);
 
-			if (mode_lib->ms.support.PrefetchSupported[j] == true && mode_lib->ms.support.VRatioInPrefetchSupported[j] == true) {
-				mode_lib->ms.BandwidthAvailableForImmediateFlip = CalculateBandwidthAvailableForImmediateFlip(
-						mode_lib->ms.num_active_planes,
-						mode_lib->ms.ReturnBWPerState[j],
-						mode_lib->ms.ReadBandwidthLuma,
-						mode_lib->ms.ReadBandwidthChroma,
-						mode_lib->ms.RequiredPrefetchPixelDataBWLuma,
-						mode_lib->ms.RequiredPrefetchPixelDataBWChroma,
-						mode_lib->ms.cursor_bw,
-						mode_lib->ms.cursor_bw_pre,
-						mode_lib->ms.NoOfDPPThisState,
-						mode_lib->ms.UrgentBurstFactorLuma,
-						mode_lib->ms.UrgentBurstFactorChroma,
-						mode_lib->ms.UrgentBurstFactorCursor,
-						mode_lib->ms.UrgentBurstFactorLumaPre,
-						mode_lib->ms.UrgentBurstFactorChromaPre,
-						mode_lib->ms.UrgentBurstFactorCursorPre);
+			s->MaxVStartupAllPlanes[j] = (dml_uint_t)(dml_max(s->MaxVStartupAllPlanes[j], s->MaximumVStartup[j][k]));
+#ifdef __DML_VBA_DEBUG__
+			dml_print("DML::%s: k=%u, MaxVStartupAllPlanes[%u] = %u\n", __func__, k, j, s->MaxVStartupAllPlanes[j]);
+			dml_print("DML::%s: k=%u, MaximumVStartup[%u][%u] = %u\n", __func__, k, j, k, s->MaximumVStartup[j][k]);
+#endif
+		}
+	}
 
-				mode_lib->ms.TotImmediateFlipBytes = 0;
-				for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-					if (!(mode_lib->ms.policy.ImmediateFlipRequirement[k] == dml_immediate_flip_not_required)) {
-						mode_lib->ms.TotImmediateFlipBytes = mode_lib->ms.TotImmediateFlipBytes + mode_lib->ms.NoOfDPP[j][k] * mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k] + mode_lib->ms.MetaRowBytes[j][k];
-						if (mode_lib->ms.use_one_row_for_frame_flip[j][k]) {
-							mode_lib->ms.TotImmediateFlipBytes = mode_lib->ms.TotImmediateFlipBytes + mode_lib->ms.NoOfDPP[j][k] * (2 * mode_lib->ms.DPTEBytesPerRow[j][k]);
-						} else {
-							mode_lib->ms.TotImmediateFlipBytes = mode_lib->ms.TotImmediateFlipBytes + mode_lib->ms.NoOfDPP[j][k] * mode_lib->ms.DPTEBytesPerRow[j][k];
-						}
-					}
-				}
+	s->ReorderingBytes = (dml_uint_t)(mode_lib->ms.soc.num_chans * dml_max3(mode_lib->ms.soc.urgent_out_of_order_return_per_channel_pixel_only_bytes,
+																mode_lib->ms.soc.urgent_out_of_order_return_per_channel_pixel_and_vm_bytes,
+																mode_lib->ms.soc.urgent_out_of_order_return_per_channel_vm_only_bytes));
 
-				for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-					CalculateFlipSchedule(
-						s->HostVMInefficiencyFactor,
-						mode_lib->ms.ExtraLatency,
-						mode_lib->ms.UrgLatency,
-						mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels,
-						mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
-						mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels,
-						mode_lib->ms.cache_display_cfg.plane.GPUVMEnable,
-						mode_lib->ms.soc.hostvm_min_page_size_kbytes,
-						mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k],
-						mode_lib->ms.MetaRowBytes[j][k],
-						mode_lib->ms.DPTEBytesPerRow[j][k],
-						mode_lib->ms.BandwidthAvailableForImmediateFlip,
-						mode_lib->ms.TotImmediateFlipBytes,
-						mode_lib->ms.cache_display_cfg.surface.SourcePixelFormat[k],
-						(mode_lib->ms.cache_display_cfg.timing.HTotal[k] / mode_lib->ms.cache_display_cfg.timing.PixelClock[k]),
-						mode_lib->ms.cache_display_cfg.plane.VRatio[k],
-						mode_lib->ms.cache_display_cfg.plane.VRatioChroma[k],
-						mode_lib->ms.Tno_bw[k],
-						mode_lib->ms.cache_display_cfg.surface.DCCEnable[k],
-						mode_lib->ms.dpte_row_height[k],
-						mode_lib->ms.meta_row_height[k],
-						mode_lib->ms.dpte_row_height_chroma[k],
-						mode_lib->ms.meta_row_height_chroma[k],
-						mode_lib->ms.use_one_row_for_frame_flip[j][k], // 24
+	for (j = 0; j < 2; ++j) {
+		mode_lib->ms.DCFCLKState[j] = mode_lib->ms.state.dcfclk_mhz;
+	}
+
+	/* Immediate Flip and MALL parameters */
+	s->ImmediateFlipRequiredFinal = false;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		s->ImmediateFlipRequiredFinal = s->ImmediateFlipRequiredFinal || (mode_lib->ms.policy.ImmediateFlipRequirement[k] == dml_immediate_flip_required);
+	}
+
+	mode_lib->ms.support.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified = false;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		mode_lib->ms.support.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified = mode_lib->ms.support.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified ||
+																							((mode_lib->ms.policy.ImmediateFlipRequirement[k] != dml_immediate_flip_required) &&
+																							(mode_lib->ms.policy.ImmediateFlipRequirement[k] != dml_immediate_flip_not_required));
+	}
+	mode_lib->ms.support.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified = mode_lib->ms.support.ImmediateFlipRequiredButTheRequirementForEachSurfaceIsNotSpecified && s->ImmediateFlipRequiredFinal;
 
-						/* Output */
-						&mode_lib->ms.DestinationLinesToRequestVMInImmediateFlip[k],
-						&mode_lib->ms.DestinationLinesToRequestRowInImmediateFlip[k],
-						&mode_lib->ms.final_flip_bw[k],
-						&mode_lib->ms.ImmediateFlipSupportedForPipe[k]);
-				}
+	mode_lib->ms.support.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe = false;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		mode_lib->ms.support.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe =
+										mode_lib->ms.support.ImmediateFlipOrHostVMAndPStateWithMALLFullFrameOrPhantomPipe || ((mode_lib->ms.cache_display_cfg.plane.HostVMEnable == true || mode_lib->ms.policy.ImmediateFlipRequirement[k] != dml_immediate_flip_not_required) &&
+										(mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_full_frame || mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_phantom_pipe));
+	}
 
-				{
-				CalculateImmediateFlipBandwithSupport(mode_lib->ms.num_active_planes,
-													mode_lib->ms.ReturnBWPerState[j],
-													mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange,
-													mode_lib->ms.policy.ImmediateFlipRequirement,
-													mode_lib->ms.final_flip_bw,
-													mode_lib->ms.ReadBandwidthLuma,
-													mode_lib->ms.ReadBandwidthChroma,
-													mode_lib->ms.RequiredPrefetchPixelDataBWLuma,
-													mode_lib->ms.RequiredPrefetchPixelDataBWChroma,
-													mode_lib->ms.cursor_bw,
-													mode_lib->ms.meta_row_bandwidth_this_state,
-													mode_lib->ms.dpte_row_bandwidth_this_state,
-													mode_lib->ms.cursor_bw_pre,
-													mode_lib->ms.prefetch_vmrow_bw,
-													mode_lib->ms.NoOfDPP[j], // VBA_ERROR DPPPerSurface is not assigned at this point, should use NoOfDpp here
-													mode_lib->ms.UrgentBurstFactorLuma,
-													mode_lib->ms.UrgentBurstFactorChroma,
-													mode_lib->ms.UrgentBurstFactorCursor,
-													mode_lib->ms.UrgentBurstFactorLumaPre,
-													mode_lib->ms.UrgentBurstFactorChromaPre,
-													mode_lib->ms.UrgentBurstFactorCursorPre,
+	mode_lib->ms.support.InvalidCombinationOfMALLUseForPStateAndStaticScreen = false;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		mode_lib->ms.support.InvalidCombinationOfMALLUseForPStateAndStaticScreen = mode_lib->ms.support.InvalidCombinationOfMALLUseForPStateAndStaticScreen ||
+																((mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen[k] == dml_use_mall_static_screen_enable || mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen[k] == dml_use_mall_static_screen_optimize) && (mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_phantom_pipe)) ||
+																((mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen[k] == dml_use_mall_static_screen_disable || mode_lib->ms.cache_display_cfg.plane.UseMALLForStaticScreen[k] == dml_use_mall_static_screen_optimize) && (mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_full_frame));
+	}
 
-													/* output */
-													&s->dummy_single[0], // dml_float_t *TotalBandwidth
-													&s->dummy_single[1], // dml_float_t *TotalBandwidthNotIncludingMALLPrefetch
-													&s->dummy_single[2], // dml_float_t *FractionOfUrgentBandwidth
-													&mode_lib->ms.support.ImmediateFlipSupportedForState[j]); // dml_bool_t *ImmediateFlipBandwidthSupport
-				}
+	s->FullFrameMALLPStateMethod = false;
+	s->SubViewportMALLPStateMethod = false;
+	s->PhantomPipeMALLPStateMethod = false;
+	s->SubViewportMALLRefreshGreaterThan120Hz = false;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		if (mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_full_frame)
+			s->FullFrameMALLPStateMethod = true;
+		if (mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_sub_viewport) {
+			s->SubViewportMALLPStateMethod = true;
+			if (mode_lib->ms.cache_display_cfg.timing.RefreshRate[k] > 120)
+				s->SubViewportMALLRefreshGreaterThan120Hz = true;
+		}
+		if (mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange[k] == dml_use_mall_pstate_change_phantom_pipe)
+			s->PhantomPipeMALLPStateMethod = true;
+	}
+	mode_lib->ms.support.InvalidCombinationOfMALLUseForPState = (s->SubViewportMALLPStateMethod != s->PhantomPipeMALLPStateMethod)
+	|| (s->SubViewportMALLPStateMethod && s->FullFrameMALLPStateMethod) || s->SubViewportMALLRefreshGreaterThan120Hz;
 
-				for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-					if (!(mode_lib->ms.policy.ImmediateFlipRequirement[k] == dml_immediate_flip_not_required) && (mode_lib->ms.ImmediateFlipSupportedForPipe[k] == false))
-						mode_lib->ms.support.ImmediateFlipSupportedForState[j] = false;
-				}
+    if (mode_lib->ms.policy.UseMinimumRequiredDCFCLK == true) {
+		UseMinimumDCFCLK_params->UseMALLForPStateChange = mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange;
+		UseMinimumDCFCLK_params->DRRDisplay = mode_lib->ms.cache_display_cfg.timing.DRRDisplay;
+		UseMinimumDCFCLK_params->SynchronizeDRRDisplaysForUCLKPStateChangeFinal = mode_lib->ms.policy.SynchronizeDRRDisplaysForUCLKPStateChangeFinal;
+		UseMinimumDCFCLK_params->MaxInterDCNTileRepeaters = mode_lib->ms.ip.max_inter_dcn_tile_repeaters;
+		UseMinimumDCFCLK_params->MaxPrefetchMode = dml_prefetch_support_stutter;
+		UseMinimumDCFCLK_params->DRAMClockChangeLatencyFinal = mode_lib->ms.state.dram_clock_change_latency_us;
+		UseMinimumDCFCLK_params->FCLKChangeLatency = mode_lib->ms.state.fclk_change_latency_us;
+		UseMinimumDCFCLK_params->SREnterPlusExitTime = mode_lib->ms.state.sr_enter_plus_exit_time_us;
+		UseMinimumDCFCLK_params->ReturnBusWidth = mode_lib->ms.soc.return_bus_width_bytes;
+		UseMinimumDCFCLK_params->RoundTripPingLatencyCycles = mode_lib->ms.soc.round_trip_ping_latency_dcfclk_cycles;
+		UseMinimumDCFCLK_params->ReorderingBytes = s->ReorderingBytes;
+		UseMinimumDCFCLK_params->PixelChunkSizeInKByte = mode_lib->ms.ip.pixel_chunk_size_kbytes;
+		UseMinimumDCFCLK_params->MetaChunkSize = mode_lib->ms.ip.meta_chunk_size_kbytes;
+		UseMinimumDCFCLK_params->GPUVMEnable = mode_lib->ms.cache_display_cfg.plane.GPUVMEnable;
+		UseMinimumDCFCLK_params->GPUVMMaxPageTableLevels = mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLevels;
+		UseMinimumDCFCLK_params->HostVMEnable = mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
+		UseMinimumDCFCLK_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
+		UseMinimumDCFCLK_params->HostVMMinPageSize = mode_lib->ms.soc.hostvm_min_page_size_kbytes;
+		UseMinimumDCFCLK_params->HostVMMaxNonCachedPageTableLevels = mode_lib->ms.cache_display_cfg.plane.HostVMMaxPageTableLevels;
+		UseMinimumDCFCLK_params->DynamicMetadataVMEnabled = mode_lib->ms.ip.dynamic_metadata_vm_enabled;
+		UseMinimumDCFCLK_params->ImmediateFlipRequirement = s->ImmediateFlipRequiredFinal;
+		UseMinimumDCFCLK_params->ProgressiveToInterlaceUnitInOPP = mode_lib->ms.ip.ptoi_supported;
+		UseMinimumDCFCLK_params->MaxAveragePercentOfIdealSDPPortBWDisplayCanUseInNormalSystemOperation = mode_lib->ms.soc.max_avg_sdp_bw_use_normal_percent;
+		UseMinimumDCFCLK_params->PercentOfIdealSDPPortBWReceivedAfterUrgLatency = mode_lib->ms.soc.pct_ideal_sdp_bw_after_urgent;
+		UseMinimumDCFCLK_params->VTotal = mode_lib->ms.cache_display_cfg.timing.VTotal;
+		UseMinimumDCFCLK_params->VActive = mode_lib->ms.cache_display_cfg.timing.VActive;
+		UseMinimumDCFCLK_params->DynamicMetadataTransmittedBytes = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataTransmittedBytes;
+		UseMinimumDCFCLK_params->DynamicMetadataLinesBeforeActiveRequired = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataLinesBeforeActiveRequired;
+		UseMinimumDCFCLK_params->Interlace = mode_lib->ms.cache_display_cfg.timing.Interlace;
+		UseMinimumDCFCLK_params->RequiredDPPCLKPerSurface = mode_lib->ms.RequiredDPPCLKPerSurface;
+		UseMinimumDCFCLK_params->RequiredDISPCLK = mode_lib->ms.RequiredDISPCLK;
+		UseMinimumDCFCLK_params->UrgLatency = mode_lib->ms.UrgLatency;
+		UseMinimumDCFCLK_params->NoOfDPP = mode_lib->ms.NoOfDPP;
+		UseMinimumDCFCLK_params->ProjectedDCFCLKDeepSleep = mode_lib->ms.ProjectedDCFCLKDeepSleep;
+		UseMinimumDCFCLK_params->MaximumVStartup = s->MaximumVStartup;
+		UseMinimumDCFCLK_params->TotalNumberOfActiveDPP = mode_lib->ms.TotalNumberOfActiveDPP;
+		UseMinimumDCFCLK_params->TotalNumberOfDCCActiveDPP = mode_lib->ms.TotalNumberOfDCCActiveDPP;
+		UseMinimumDCFCLK_params->dpte_group_bytes = mode_lib->ms.dpte_group_bytes;
+		UseMinimumDCFCLK_params->PrefetchLinesY = mode_lib->ms.PrefetchLinesY;
+		UseMinimumDCFCLK_params->PrefetchLinesC = mode_lib->ms.PrefetchLinesC;
+		UseMinimumDCFCLK_params->swath_width_luma_ub_all_states = mode_lib->ms.swath_width_luma_ub_all_states;
+		UseMinimumDCFCLK_params->swath_width_chroma_ub_all_states = mode_lib->ms.swath_width_chroma_ub_all_states;
+		UseMinimumDCFCLK_params->BytePerPixelY = mode_lib->ms.BytePerPixelY;
+		UseMinimumDCFCLK_params->BytePerPixelC = mode_lib->ms.BytePerPixelC;
+		UseMinimumDCFCLK_params->HTotal = mode_lib->ms.cache_display_cfg.timing.HTotal;
+		UseMinimumDCFCLK_params->PixelClock = mode_lib->ms.cache_display_cfg.timing.PixelClock;
+		UseMinimumDCFCLK_params->PDEAndMetaPTEBytesPerFrame = mode_lib->ms.PDEAndMetaPTEBytesPerFrame;
+		UseMinimumDCFCLK_params->DPTEBytesPerRow = mode_lib->ms.DPTEBytesPerRow;
+		UseMinimumDCFCLK_params->MetaRowBytes = mode_lib->ms.MetaRowBytes;
+		UseMinimumDCFCLK_params->DynamicMetadataEnable = mode_lib->ms.cache_display_cfg.plane.DynamicMetadataEnable;
+		UseMinimumDCFCLK_params->ReadBandwidthLuma = mode_lib->ms.ReadBandwidthLuma;
+		UseMinimumDCFCLK_params->ReadBandwidthChroma = mode_lib->ms.ReadBandwidthChroma;
+		UseMinimumDCFCLK_params->DCFCLKPerState = mode_lib->ms.state.dcfclk_mhz;
+		UseMinimumDCFCLK_params->DCFCLKState = mode_lib->ms.DCFCLKState;
 
-			} else { // if prefetch not support, assume iflip not supported
-				mode_lib->ms.support.ImmediateFlipSupportedForState[j] = false;
-			}
+		UseMinimumDCFCLK(&mode_lib->scratch,
+		UseMinimumDCFCLK_params);
 
-			if (s->MaxVStartup <= __DML_VBA_MIN_VSTARTUP__ || s->AnyLinesForVMOrRowTooLarge == false) {
-				s->NextMaxVStartup = s->MaxVStartupAllPlanes[j];
-				for (k = 0; k <= mode_lib->ms.num_active_planes - 1; k++) {
-					s->NextPrefetchMode[k] = s->NextPrefetchMode[k] + 1;
+	 } // UseMinimumRequiredDCFCLK == true
 
-					if (s->NextPrefetchMode[k] <= s->MaxPrefetchMode[k])
-						s->AllPrefetchModeTested = false;
-				}
-			} else {
-				s->NextMaxVStartup = s->NextMaxVStartup - 1;
-			}
-		} while (!((mode_lib->ms.support.PrefetchSupported[j] == true && mode_lib->ms.support.DynamicMetadataSupported[j] == true &&
-					mode_lib->ms.support.VRatioInPrefetchSupported[j] == true &&
-					// consider flip support is okay if when there is no hostvm and the user does't require a iflip OR the flip bw is ok
-					// If there is hostvm, DCN needs to support iflip for invalidation
-					((s->ImmediateFlipRequiredFinal) || mode_lib->ms.support.ImmediateFlipSupportedForState[j] == true)) ||
-					(s->NextMaxVStartup == s->MaxVStartupAllPlanes[j] && s->AllPrefetchModeTested)));
+	for (j = 0; j < 2; ++j) {
+		mode_lib->ms.ReturnBWPerState[j] = dml_get_return_bw_mbps(&mode_lib->ms.soc, mode_lib->ms.state.use_ideal_dram_bw_strobe,
+																mode_lib->ms.cache_display_cfg.plane.HostVMEnable, mode_lib->ms.DCFCLKState[j], mode_lib->ms.state.fabricclk_mhz,
+																mode_lib->ms.state.dram_speed_mts);
+		mode_lib->ms.ReturnDRAMBWPerState[j] = dml_get_return_dram_bw_mbps(&mode_lib->ms.soc, mode_lib->ms.state.use_ideal_dram_bw_strobe,
+																mode_lib->ms.cache_display_cfg.plane.HostVMEnable,
+																mode_lib->ms.state.dram_speed_mts);
+	}
 
-		for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
-			mode_lib->ms.use_one_row_for_frame_this_state[k] = mode_lib->ms.use_one_row_for_frame[j][k];
+	//Re-ordering Buffer Support Check
+	for (j = 0; j < 2; ++j) {
+		if ((mode_lib->ms.ip.rob_buffer_size_kbytes - mode_lib->ms.ip.pixel_chunk_size_kbytes) * 1024 / mode_lib->ms.ReturnBWPerState[j] >
+			(mode_lib->ms.soc.round_trip_ping_latency_dcfclk_cycles + 32) / mode_lib->ms.DCFCLKState[j] + s->ReorderingBytes / mode_lib->ms.ReturnBWPerState[j]) {
+			mode_lib->ms.support.ROBSupport[j] = true;
+		} else {
+			mode_lib->ms.support.ROBSupport[j] = false;
 		}
+		dml_print("DML::%s: DEBUG ROBSupport[%u] = %u (%u)\n",  __func__, j, mode_lib->ms.support.ROBSupport[j], __LINE__);
+	}
 
-		s->mSOCParameters.UrgentLatency = mode_lib->ms.UrgLatency;
-		s->mSOCParameters.ExtraLatency = mode_lib->ms.ExtraLatency;
-		s->mSOCParameters.WritebackLatency = mode_lib->ms.state.writeback_latency_us;
-		s->mSOCParameters.DRAMClockChangeLatency = mode_lib->ms.state.dram_clock_change_latency_us;
-		s->mSOCParameters.FCLKChangeLatency = mode_lib->ms.state.fclk_change_latency_us;
-		s->mSOCParameters.SRExitTime = mode_lib->ms.state.sr_exit_time_us;
-		s->mSOCParameters.SREnterPlusExitTime = mode_lib->ms.state.sr_enter_plus_exit_time_us;
-		s->mSOCParameters.SRExitZ8Time = mode_lib->ms.state.sr_exit_z8_time_us;
-		s->mSOCParameters.SREnterPlusExitZ8Time = mode_lib->ms.state.sr_enter_plus_exit_z8_time_us;
-		s->mSOCParameters.USRRetrainingLatency = mode_lib->ms.state.usr_retraining_latency_us;
-		s->mSOCParameters.SMNLatency = mode_lib->ms.soc.smn_latency_us;
+	//Vertical Active BW support check
+	s->MaxTotalVActiveRDBandwidth = 0;
+	for (k = 0; k < mode_lib->ms.num_active_planes; ++k) {
+		s->MaxTotalVActiveRDBandwidth = s->MaxTotalVActiveRDBandwidth + mode_lib->ms.ReadBandwidthLuma[k] + mode_lib->ms.ReadBandwidthChroma[k];
+	}
 
-		CalculateWatermarks_params->USRRetrainingRequiredFinal = mode_lib->ms.policy.USRRetrainingRequiredFinal;
-		CalculateWatermarks_params->UseMALLForPStateChange = mode_lib->ms.cache_display_cfg.plane.UseMALLForPStateChange;
-		CalculateWatermarks_params->PrefetchMode = mode_lib->ms.PrefetchMode;
-		CalculateWatermarks_params->NumberOfActiveSurfaces = mode_lib->ms.num_active_planes;
-		CalculateWatermarks_params->MaxLineBufferLines = mode_lib->ms.ip.max_line_buffer_lines;
-		CalculateWatermarks_params->LineBufferSize = mode_lib->ms.ip.line_buffer_size_bits;
-		CalculateWatermarks_params->WritebackInterfaceBufferSize = mode_lib->ms.ip.writeback_interface_buffer_size_kbytes;
-		CalculateWatermarks_params->DCFCLK = mode_lib->ms.DCFCLKState[j];
-		CalculateWatermarks_params->ReturnBW = mode_lib->ms.ReturnBWPerState[j];
-		CalculateWatermarks_params->SynchronizeTimingsFinal = mode_lib->ms.policy.SynchronizeTimingsFinal;
-		CalculateWatermarks_params->SynchronizeDRRDisplaysForUCLKPStateChangeFinal = mode_lib->ms.policy.SynchronizeDRRDisplaysForUCLKPStateChangeFinal;
-		CalculateWatermarks_params->DRRDisplay = mode_lib->ms.cache_display_cfg.timing.DRRDisplay;
-		CalculateWatermarks_params->dpte_group_bytes = mode_lib->ms.dpte_group_bytes;
-		CalculateWatermarks_params->meta_row_height = mode_lib->ms.meta_row_height;
-		CalculateWatermarks_params->meta_row_height_chroma = mode_lib->ms.meta_row_height_chroma;
-		CalculateWatermarks_params->mmSOCParameters = s->mSOCParameters;
-		CalculateWatermarks_params->WritebackChunkSize = mode_lib->ms.ip.writeback_chunk_size_kbytes;
-		CalculateWatermarks_params->SOCCLK = mode_lib->ms.state.socclk_mhz;
-		CalculateWatermarks_params->DCFClkDeepSleep = mode_lib->ms.ProjectedDCFCLKDeepSleep[j];
-		CalculateWatermarks_params->DETBufferSizeY = mode_lib->ms.DETBufferSizeYThisState;
-		CalculateWatermarks_params->DETBufferSizeC = mode_lib->ms.DETBufferSizeCThisState;
-		CalculateWatermarks_params->SwathHeightY = mode_lib->ms.SwathHeightYThisState;
-		CalculateWatermarks_params->SwathHeightC = mode_lib->ms.SwathHeightCThisState;
-		CalculateWatermarks_params->LBBitPerPixel = mode_lib->ms.cache_display_cfg.plane.LBBitPerPixel;
-		CalculateWatermarks_params->SwathWidthY = mode_lib->ms.SwathWidthYThisState;
-		CalculateWatermarks_params->SwathWidthC = mode_lib->ms.SwathWidthCThisState;
-		CalculateWatermarks_params->HRatio = mode_lib->ms.cache_display_cfg.plane.HRatio;
-		CalculateWatermarks_params->HRatioChroma = mode_lib->ms.cache_display_cfg.plane.HRatioChroma;
-		CalculateWatermarks_params->VTaps = mode_lib->ms.cache_display_cfg.plane.VTaps;
-		CalculateWatermarks_params->VTapsChroma = mode_lib->ms.cache_display_cfg.plane.VTapsChroma;
-		CalculateWatermarks_params->VRatio = mode_lib->ms.cache_display_cfg.plane.VRatio;
-		CalculateWatermarks_params->VRatioChroma = mode_lib->ms.cache_display_cfg.plane.VRatioChroma;
-		CalculateWatermarks_params->HTotal = mode_lib->ms.cache_display_cfg.timing.HTotal;
-		CalculateWatermarks_params->VTotal = mode_lib->ms.cache_display_cfg.timing.VTotal;
-		CalculateWatermarks_params->VActive = mode_lib->ms.cache_display_cfg.timing.VActive;
-		CalculateWatermarks_params->PixelClock = mode_lib->ms.cache_display_cfg.timing.PixelClock;
-		CalculateWatermarks_params->BlendingAndTiming = mode_lib->ms.cache_display_cfg.plane.BlendingAndTiming;
-		CalculateWatermarks_params->DPPPerSurface = mode_lib->ms.NoOfDPPThisState;
-		CalculateWatermarks_params->BytePerPixelDETY = mode_lib->ms.BytePerPixelInDETY;
-		CalculateWatermarks_params->BytePerPixelDETC = mode_lib->ms.BytePerPixelInDETC;
-		CalculateWatermarks_params->DSTXAfterScaler = s->DSTXAfterScaler;
-		CalculateWatermarks_params->DSTYAfterScaler = s->DSTYAfterScaler;
-		CalculateWatermarks_params->WritebackEnable = mode_lib->ms.cache_display_cfg.writeback.WritebackEnable;
-		CalculateWatermarks_params->WritebackPixelFormat = mode_lib->ms.cache_display_cfg.writeback.WritebackPixelFormat;
-		CalculateWatermarks_params->WritebackDestinationWidth = mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationWidth;
-		CalculateWatermarks_params->WritebackDestinationHeight = mode_lib->ms.cache_display_cfg.writeback.WritebackDestinationHeight;
-		CalculateWatermarks_params->WritebackSourceHeight = mode_lib->ms.cache_display_cfg.writeback.WritebackSourceHeight;
-		CalculateWatermarks_params->UnboundedRequestEnabled = mode_lib->ms.UnboundedRequestEnabledThisState;
-		CalculateWatermarks_params->CompressedBufferSizeInkByte = mode_lib->ms.CompressedBufferSizeInkByteThisState;
+	for (j = 0; j < 2; ++j) {
+		mode_lib->ms.support.MaxTotalVerticalActiveAvailableBandwidth[j] = dml_min3(mode_lib->ms.soc.return_bus_width_bytes * mode_lib->ms.DCFCLKState[j] * mode_lib->ms.soc.max_avg_sdp_bw_use_normal_percent / 100.0,
+																	mode_lib->ms.state.fabricclk_mhz * mode_lib->ms.soc.fabric_datapath_to_dcn_data_return_bytes * mode_lib->ms.soc.max_avg_fabric_bw_use_normal_percent / 100.0,
+																	mode_lib->ms.state.dram_speed_mts * mode_lib->ms.soc.num_chans * mode_lib->ms.soc.dram_channel_width_bytes *
+																	((mode_lib->ms.state.use_ideal_dram_bw_strobe && !mode_lib->ms.cache_display_cfg.plane.HostVMEnable) ?
+																	mode_lib->ms.soc.max_avg_dram_bw_use_normal_strobe_percent : mode_lib->ms.soc.max_avg_dram_bw_use_normal_percent) / 100.0);
 
-		// Output
-		CalculateWatermarks_params->Watermark = &s->dummy_watermark; // Watermarks *Watermark
-		CalculateWatermarks_params->DRAMClockChangeSupport = &mode_lib->ms.support.DRAMClockChangeSupport[j];
-		CalculateWatermarks_params->MaxActiveDRAMClockChangeLatencySupported = &s->dummy_single_array[0]; // dml_float_t *MaxActiveDRAMClockChangeLatencySupported[]
-		CalculateWatermarks_params->SubViewportLinesNeededInMALL = &mode_lib->ms.SubViewportLinesNeededInMALL[j]; // dml_uint_t SubViewportLinesNeededInMALL[]
-		CalculateWatermarks_params->FCLKChangeSupport = &mode_lib->ms.support.FCLKChangeSupport[j];
-		CalculateWatermarks_params->MaxActiveFCLKChangeLatencySupported = &s->dummy_single[0]; // dml_float_t *MaxActiveFCLKChangeLatencySupported
-		CalculateWatermarks_params->USRRetrainingSupport = &mode_lib->ms.support.USRRetrainingSupport[j];
-		CalculateWatermarks_params->ActiveDRAMClockChangeLatencyMargin = mode_lib->ms.support.ActiveDRAMClockChangeLatencyMargin;
+		if (s->MaxTotalVActiveRDBandwidth <= mode_lib->ms.support.MaxTotalVerticalActiveAvailableBandwidth[j]) {
+			mode_lib->ms.support.TotalVerticalActiveBandwidthSupport[j] = true;
+		} else {
+			mode_lib->ms.support.TotalVerticalActiveBandwidthSupport[j] = false;
+		}
+	}
 
-		CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport(&mode_lib->scratch,
-			CalculateWatermarks_params);
+	/* Prefetch Check */
+	dml_prefetch_check(mode_lib);
 
-	} // for j
 	// End of Prefetch Check
 	dml_print("DML::%s: Done prefetch calculation\n", __func__);
 
-- 
2.42.0

