Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B000B5A7158
	for <lists+linux-next@lfdr.de>; Wed, 31 Aug 2022 01:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiH3XEd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Aug 2022 19:04:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbiH3XEc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Aug 2022 19:04:32 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA6C6979CF;
        Tue, 30 Aug 2022 16:04:30 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHNDC4l94z4xG6;
        Wed, 31 Aug 2022 09:04:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1661900667;
        bh=iGW9OgqoLuOaYgnhcq8IGStXQrf5Rr/ByQvRFsd1/1c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cyDQvba6kQ48U779tD6qUKwA+WtL0UR8LH+YHJCJowxO31CYu1ARY8J0NxWk3cdWq
         a/K6LC0AN17IkZYaQKYi7O/LrqVyneN2te7j1N0ZiV7G8q7wpsqRxRMq8ddH5N0qoo
         BalZwWlegRyyAkNq1D1536YnpJGsUqoK7y3m7PwJOvxAKVa9IZgBMQ518hr1R8VmQz
         oTXLE06vxN8u1RJ3YnUgYp+WG2Gu/VJSDkXZJsrhCUXG46+t/vCRsqrsXeOGZFmKUl
         126eyDUtjl9OQjANRolYddmZtiJ2LSBb0SUply+v04vOUI1HlItGQ79+mlbR5CA8pn
         fDq7jsC9jhRyA==
Date:   Wed, 31 Aug 2022 09:04:26 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20220831090426.0c426d7b@canb.auug.org.au>
In-Reply-To: <20220812081245.380c375f@canb.auug.org.au>
References: <20220812081245.380c375f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LB12XgcjPDP+4Q/yfb81aED";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/LB12XgcjPDP+4Q/yfb81aED
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 12 Aug 2022 08:13:47 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'always_scale' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'always_use_regamma' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'aux_wake_wa' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'avoid_vbios_exec_table' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'az_endpoint_mute_only' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'bandwidth_calcs_trace' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'bw_val_profile' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'clock_trace' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'cm_in_bypass' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'crb_alloc_policy' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'crb_alloc_policy_min_disp_count' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_48mhz_pwrdwn' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_clock_gate' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_dcc' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_dfs_bypass' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_dmcu' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_dpp_power_gate' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_dram_clock_change_vactive_support' not described in 'dc_debu=
g_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_dsc' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_dsc_edp' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_dsc_power_gate' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_dtb_ref_clk_switch' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_fams' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_fec' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_fixed_vs_aux_timeout_wa' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_hubp_power_gate' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_idle_power_optimizations' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_mem_low_power' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_min_fclk' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_pplib_clock_request' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_pplib_wm_range' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_psr' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_stereo_support' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_stutter' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_timing_sync' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_uhbr' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_z10' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'disable_z9_mpc' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'dmcub_emulation' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'dml_disallow_alternate_prefetch_modes' not described in 'dc_debug_op=
tions'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'dml_hostvm_override' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'dmub_command_table' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'dmub_offload_enabled' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'dpia_debug' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'dram_clock_change_latency_ns' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'dsc_bpp_increment_div' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'dsc_min_slice_height_override' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'dwb_fi_phase' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'edid_read_retry_times' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'enable_dmcub_surface_flip' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'enable_dmub_aux_for_legacy_ddc' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'enable_dp_dig_pixel_rate_div_policy' not described in 'dc_debug_opti=
ons'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'enable_dram_clock_change_one_display_vactive' not described in 'dc_d=
ebug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'enable_driver_sequence_debug' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'enable_mem_low_power' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'enable_single_display_2to1_odm_policy' not described in 'dc_debug_op=
tions'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'enable_sw_cntl_psr' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'enable_tri_buf' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'enable_z9_disable_interface' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'exit_idle_opt_for_cursor_updates' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'extended_blank_optimization' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'fec_enable_delay_in100us' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'fixed_vs_aux_delay_config_wa' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_abm_enable' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_clock_mode' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_disable_subvp' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_dp2_lt_fallback_method' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_dsc_edp_policy' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_fclk_khz' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_min_dcfclk_mhz' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_odm_combine' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_odm_combine_4to1' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_single_disp_pipe_split' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_subvp_mclk_switch' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_usr_allow' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'force_vblank_alignment' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'hdmi20_disable' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'hpo_optimization' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'ignore_cable_id' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'legacy_dp2_lt' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'mall_additional_timer_percent' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'mall_error_as_fatal' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'mall_size_override' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'max_disp_clk' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'max_downscale_src_width' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'min_disp_clk_khz' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'min_dpp_clk_khz' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'min_dram_clk_khz' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'mst_start_top_delay' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'native422_support' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'optimize_edp_link_rate' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'optimized_watermark' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'percent_of_ideal_drambw' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'performance_trace' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'pplib_wm_report_mode' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'psr_power_use_phy_fsm' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'pstate_enabled' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'recovery_enabled' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'root_clock_optimization' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'sanity_checks' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'scl_reset_length10' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'seamless_boot_odm_combine' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'set_mst_en_for_sst' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'skip_detection_link_training' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'sr_enter_plus_exit_time_dpm0_ns' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'sr_enter_plus_exit_time_ns' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'sr_exit_time_dpm0_ns' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'sr_exit_time_ns' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'surface_trace' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'timing_trace' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'underflow_assert_delay_us' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'urgent_latency_ns' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'usbc_combo_phy_reset_wa' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'use_legacy_soc_bb_mechanism' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'use_max_lb' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'validate_dml_output' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'validation_trace' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'visual_confirm' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'visual_confirm_rect_height' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'voltage_align_fclk' not described in 'dc_debug_options'
> drivers/gpu/drm/amd/display/dc/dc.h:847: warning: Function parameter or m=
ember 'vsr_support' not described in 'dc_debug_options'
>=20
> Introduced by commit
>=20
>   a2b3b9d57bdb ("drm/amd/display: Document pipe split policy")

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/LB12XgcjPDP+4Q/yfb81aED
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmMOl3oACgkQAVBC80lX
0Gzh9Af+P76CnBJxLzuRoYWlkM7DD3xyiwsfMpr5YWgF45QltJ1X4eutIYHRGcPC
TPJiQCjUKIaVRS2z5lKfGnklmDGh/ixvEVcGMwcf4P5q9YAsPaeuRff+m7T45OxL
n9sEbRxnilKUt+wnuYxUuOsckM/GKjK2VsabqhlzcFBXQX1jKm3Nzth6QMWpPTH/
QFZykBFLz8Ao3Lq7VX9uy+QzRr4/QWIxkEEaA205/5180vvjzMEp7OWMTTxulWpR
B2sAWGmRyePMIeSVV10pJG30uVzFwoxaO6uET/nhlIITYRO56qsgxZ9YhmHjcuzi
5b7oHW/VI1IhHWiGuZCPbPjZ9QT+Kw==
=K/O2
-----END PGP SIGNATURE-----

--Sig_/LB12XgcjPDP+4Q/yfb81aED--
