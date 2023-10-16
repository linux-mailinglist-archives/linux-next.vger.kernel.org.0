Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09AE77CB16D
	for <lists+linux-next@lfdr.de>; Mon, 16 Oct 2023 19:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233737AbjJPRfj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Oct 2023 13:35:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbjJPRfi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Oct 2023 13:35:38 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B7FAB
        for <linux-next@vger.kernel.org>; Mon, 16 Oct 2023 10:35:36 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1ea48ef2cbfso740232fac.2
        for <linux-next@vger.kernel.org>; Mon, 16 Oct 2023 10:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697477734; x=1698082534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1jIafJv9i1BLae80WTVsbAT3OPKlMqjc6aYBuL91Tg=;
        b=FrhZpU9/ytN/l74X0Uq+E+kIvOgDFSbpPFgZRVmjkyHnc8HfoVcof2pCVAMVF+6jfW
         LpG22rllfqR2NQfm011kYrVQlfxGKRbR8Zjoix8vngeEuHIt5HAdPJyBWSQyBtKT4fiB
         d1I6YiW7TbtEteCgxmyjWOtmd033Rdl52RBu8eZnKSdqs9BIqxmbWaUUBOZhHwOVKlTd
         p8MdxiWvIcDUHxopIJ8u055ufLCG+OP4F6nZrEXSvqB6BH0Mwp5NoWUYfppzn2l4FSnd
         w0zGymdnnKe1pNYDssouokl9bGajqjLQCxhaFG83xUQpkcVF5GCf9BCC/tQvjAjoH9/A
         tuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697477734; x=1698082534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1jIafJv9i1BLae80WTVsbAT3OPKlMqjc6aYBuL91Tg=;
        b=gdf8fvXlRcl7Gju82+AfFHYSneACDnfdHR2jrw68JuEEriW48yW/njJslS2lZCnFbN
         EQ+O0bJLQJ2nYRpknoMN2OJNwn/Iez2KSWCJZ9DkYXOyw/cum/v1VOow5JTcAKDfA/EU
         dgVxO0BgLxtrssk+POGPeVTcSoGMBVCBJxNL8u+yXTXR/s+IoEGNfjsQPV0vS1fjLTsH
         1Eh0sC9Pqe8aMfS1l9ZwGWE9/MnWYffpIYCHoAUCZY5pA/VASikxz4Uz0/itPeExd13F
         bwU/NzeP18alacqi2zy7LQIB5cRkwJO10ZalrBI2ITExssxgxgWB/J8Jr062Ohx8lFN3
         tM+g==
X-Gm-Message-State: AOJu0Yw4ThToFnJ3SsFXAOrDwBQB4aLUqZPCyIWWEw/hW/Lcmuw6IH8e
        N6NvAPtj6ZWKlVjvuphJxwq8g14TibZIfiF4cx8=
X-Google-Smtp-Source: AGHT+IFpZXkJa6j7TiibNwJ8C6+bpZOFLy/QG2DMxtXwv7/vinl4zqL7eP23niBFwtR2a/hZgdg+GR6ZJp/PxLZdTvc=
X-Received: by 2002:a05:6870:9a01:b0:1ea:206e:cb10 with SMTP id
 fo1-20020a0568709a0100b001ea206ecb10mr6320457oab.22.1697477734552; Mon, 16
 Oct 2023 10:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com> <20231016142031.241912-3-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20231016142031.241912-3-Rodrigo.Siqueira@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 16 Oct 2023 13:35:23 -0400
Message-ID: <CADnq5_O2XoBCos1wmEkxXgErycvW+N90Wudgmyxow6_-yGiqjQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Fix stack size issue on DML2
To:     Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alex Deucher <alexander.deucher@amd.com>,
        Chaitanya Dhere <chaitanya.dhere@amd.com>,
        Roman Li <roman.li@amd.com>, linux-next@vger.kernel.org,
        amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 16, 2023 at 10:27=E2=80=AFAM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> This commit is the last part of the fix that reduces the stack size in
> the DML2 code.
>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Roman Li <roman.li@amd.com>
> Cc: Chaitanya Dhere <chaitanya.dhere@amd.com>
> Fixes: a2815ada8616 ("drm/amd/display: Introduce DML2")
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  .../amd/display/dc/dml2/display_mode_core.c   | 99 ++++++++++---------
>  1 file changed, 54 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/dr=
ivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> index 06358b7fe38b..851db026f251 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> @@ -6208,6 +6208,58 @@ static dml_uint_t CalculateMaxVStartup(
>         return max_vstartup_lines;
>  }
>
> +static void set_calculate_prefetch_schedule_params(struct display_mode_l=
ib_st *mode_lib,
> +                                                  struct CalculatePrefet=
chSchedule_params_st *CalculatePrefetchSchedule_params,
> +                                                  dml_uint_t j,
> +                                                  dml_uint_t k)
> +{
> +                               CalculatePrefetchSchedule_params->DSCDela=
y =3D mode_lib->ms.DSCDelayPerState[k];
> +                               CalculatePrefetchSchedule_params->Enhance=
dPrefetchScheduleAccelerationFinal =3D mode_lib->ms.policy.EnhancedPrefetch=
ScheduleAccelerationFinal;
> +                               CalculatePrefetchSchedule_params->DPPCLKD=
elaySubtotalPlusCNVCFormater =3D mode_lib->ms.ip.dppclk_delay_subtotal + mo=
de_lib->ms.ip.dppclk_delay_cnvc_formatter;
> +                               CalculatePrefetchSchedule_params->DPPCLKD=
elaySCL =3D mode_lib->ms.ip.dppclk_delay_scl;
> +                               CalculatePrefetchSchedule_params->DPPCLKD=
elaySCLLBOnly =3D mode_lib->ms.ip.dppclk_delay_scl_lb_only;
> +                               CalculatePrefetchSchedule_params->DPPCLKD=
elayCNVCCursor =3D mode_lib->ms.ip.dppclk_delay_cnvc_cursor;
> +                               CalculatePrefetchSchedule_params->DISPCLK=
DelaySubtotal =3D mode_lib->ms.ip.dispclk_delay_subtotal;
> +                               CalculatePrefetchSchedule_params->DPP_REC=
OUT_WIDTH =3D (dml_uint_t)(mode_lib->ms.SwathWidthYThisState[k] / mode_lib-=
>ms.cache_display_cfg.plane.HRatio[k]);
> +                               CalculatePrefetchSchedule_params->OutputF=
ormat =3D mode_lib->ms.cache_display_cfg.output.OutputFormat[k];
> +                               CalculatePrefetchSchedule_params->MaxInte=
rDCNTileRepeaters =3D mode_lib->ms.ip.max_inter_dcn_tile_repeaters;
> +                               CalculatePrefetchSchedule_params->GPUVMPa=
geTableLevels =3D mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLev=
els;
> +                               CalculatePrefetchSchedule_params->GPUVMEn=
able =3D mode_lib->ms.cache_display_cfg.plane.GPUVMEnable;
> +                               CalculatePrefetchSchedule_params->HostVME=
nable =3D mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
> +                               CalculatePrefetchSchedule_params->HostVMM=
axNonCachedPageTableLevels =3D mode_lib->ms.cache_display_cfg.plane.HostVMM=
axPageTableLevels;
> +                               CalculatePrefetchSchedule_params->HostVMM=
inPageSize =3D mode_lib->ms.soc.hostvm_min_page_size_kbytes;
> +                               CalculatePrefetchSchedule_params->Dynamic=
MetadataEnable =3D mode_lib->ms.cache_display_cfg.plane.DynamicMetadataEnab=
le[k];
> +                               CalculatePrefetchSchedule_params->Dynamic=
MetadataVMEnabled =3D mode_lib->ms.ip.dynamic_metadata_vm_enabled;
> +                               CalculatePrefetchSchedule_params->Dynamic=
MetadataLinesBeforeActiveRequired =3D mode_lib->ms.cache_display_cfg.plane.=
DynamicMetadataLinesBeforeActiveRequired[k];
> +                               CalculatePrefetchSchedule_params->Dynamic=
MetadataTransmittedBytes =3D mode_lib->ms.cache_display_cfg.plane.DynamicMe=
tadataTransmittedBytes[k];
> +                               CalculatePrefetchSchedule_params->UrgentL=
atency =3D mode_lib->ms.UrgLatency;
> +                               CalculatePrefetchSchedule_params->UrgentE=
xtraLatency =3D mode_lib->ms.ExtraLatency;
> +                               CalculatePrefetchSchedule_params->TCalc =
=3D mode_lib->ms.TimeCalc;
> +                               CalculatePrefetchSchedule_params->PDEAndM=
etaPTEBytesFrame =3D mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k];
> +                               CalculatePrefetchSchedule_params->MetaRow=
Byte =3D mode_lib->ms.MetaRowBytes[j][k];
> +                               CalculatePrefetchSchedule_params->PixelPT=
EBytesPerRow =3D mode_lib->ms.DPTEBytesPerRow[j][k];
> +                               CalculatePrefetchSchedule_params->Prefetc=
hSourceLinesY =3D mode_lib->ms.PrefetchLinesY[j][k];
> +                               CalculatePrefetchSchedule_params->VInitPr=
eFillY =3D mode_lib->ms.PrefillY[k];
> +                               CalculatePrefetchSchedule_params->MaxNumS=
wathY =3D mode_lib->ms.MaxNumSwY[k];
> +                               CalculatePrefetchSchedule_params->Prefetc=
hSourceLinesC =3D mode_lib->ms.PrefetchLinesC[j][k];
> +                               CalculatePrefetchSchedule_params->VInitPr=
eFillC =3D mode_lib->ms.PrefillC[k];
> +                               CalculatePrefetchSchedule_params->MaxNumS=
wathC =3D mode_lib->ms.MaxNumSwC[k];
> +                               CalculatePrefetchSchedule_params->swath_w=
idth_luma_ub =3D mode_lib->ms.swath_width_luma_ub_this_state[k];
> +                               CalculatePrefetchSchedule_params->swath_w=
idth_chroma_ub =3D mode_lib->ms.swath_width_chroma_ub_this_state[k];
> +                               CalculatePrefetchSchedule_params->SwathHe=
ightY =3D mode_lib->ms.SwathHeightYThisState[k];
> +                               CalculatePrefetchSchedule_params->SwathHe=
ightC =3D mode_lib->ms.SwathHeightCThisState[k];
> +                               CalculatePrefetchSchedule_params->TWait =
=3D mode_lib->ms.TWait;
> +                               CalculatePrefetchSchedule_params->Destina=
tionLinesForPrefetch =3D &mode_lib->ms.LineTimesForPrefetch[k];
> +                               CalculatePrefetchSchedule_params->Destina=
tionLinesToRequestVMInVBlank =3D &mode_lib->ms.LinesForMetaPTE[k];
> +                               CalculatePrefetchSchedule_params->Destina=
tionLinesToRequestRowInVBlank =3D &mode_lib->ms.LinesForMetaAndDPTERow[k];
> +                               CalculatePrefetchSchedule_params->VRatioP=
refetchY =3D &mode_lib->ms.VRatioPreY[j][k];
> +                               CalculatePrefetchSchedule_params->VRatioP=
refetchC =3D &mode_lib->ms.VRatioPreC[j][k];
> +                               CalculatePrefetchSchedule_params->Require=
dPrefetchPixDataBWLuma =3D &mode_lib->ms.RequiredPrefetchPixelDataBWLuma[k]=
;
> +                               CalculatePrefetchSchedule_params->Require=
dPrefetchPixDataBWChroma =3D &mode_lib->ms.RequiredPrefetchPixelDataBWChrom=
a[k];
> +                               CalculatePrefetchSchedule_params->NotEnou=
ghTimeForDynamicMetadata =3D &mode_lib->ms.support.NoTimeForDynamicMetadata=
[j][k];
> +                               CalculatePrefetchSchedule_params->Tno_bw =
=3D &mode_lib->ms.Tno_bw[k];
> +}
> +
>  static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
>  {
>         struct dml_core_mode_support_locals_st *s =3D &mode_lib->scratch.=
dml_core_mode_support_locals;
> @@ -6335,57 +6387,12 @@ static void dml_prefetch_check(struct display_mod=
e_lib_st *mode_lib)
>                                 dml_print("DML::%s: PrefetchMode =3D %u\n=
", __func__, mode_lib->ms.PrefetchMode[k]);
>  #endif
>
> -                               CalculatePrefetchSchedule_params->Enhance=
dPrefetchScheduleAccelerationFinal =3D mode_lib->ms.policy.EnhancedPrefetch=
ScheduleAccelerationFinal;
>                                 CalculatePrefetchSchedule_params->HostVMI=
nefficiencyFactor =3D s->HostVMInefficiencyFactor;
>                                 CalculatePrefetchSchedule_params->myPipe =
=3D myPipe;
> -                               CalculatePrefetchSchedule_params->DSCDela=
y =3D mode_lib->ms.DSCDelayPerState[k];
> -                               CalculatePrefetchSchedule_params->DPPCLKD=
elaySubtotalPlusCNVCFormater =3D mode_lib->ms.ip.dppclk_delay_subtotal + mo=
de_lib->ms.ip.dppclk_delay_cnvc_formatter;
> -                               CalculatePrefetchSchedule_params->DPPCLKD=
elaySCL =3D mode_lib->ms.ip.dppclk_delay_scl;
> -                               CalculatePrefetchSchedule_params->DPPCLKD=
elaySCLLBOnly =3D mode_lib->ms.ip.dppclk_delay_scl_lb_only;
> -                               CalculatePrefetchSchedule_params->DPPCLKD=
elayCNVCCursor =3D mode_lib->ms.ip.dppclk_delay_cnvc_cursor;
> -                               CalculatePrefetchSchedule_params->DISPCLK=
DelaySubtotal =3D mode_lib->ms.ip.dispclk_delay_subtotal;
> -                               CalculatePrefetchSchedule_params->DPP_REC=
OUT_WIDTH =3D (dml_uint_t)(mode_lib->ms.SwathWidthYThisState[k] / mode_lib-=
>ms.cache_display_cfg.plane.HRatio[k]);
> -                               CalculatePrefetchSchedule_params->OutputF=
ormat =3D mode_lib->ms.cache_display_cfg.output.OutputFormat[k];
> -                               CalculatePrefetchSchedule_params->MaxInte=
rDCNTileRepeaters =3D mode_lib->ms.ip.max_inter_dcn_tile_repeaters;
>                                 CalculatePrefetchSchedule_params->VStartu=
p =3D (dml_uint_t)(dml_min(s->MaxVStartup, s->MaximumVStartup[j][k]));
>                                 CalculatePrefetchSchedule_params->MaxVSta=
rtup =3D s->MaximumVStartup[j][k];
> -                               CalculatePrefetchSchedule_params->GPUVMPa=
geTableLevels =3D mode_lib->ms.cache_display_cfg.plane.GPUVMMaxPageTableLev=
els;
> -                               CalculatePrefetchSchedule_params->GPUVMEn=
able =3D mode_lib->ms.cache_display_cfg.plane.GPUVMEnable;
> -                               CalculatePrefetchSchedule_params->HostVME=
nable =3D mode_lib->ms.cache_display_cfg.plane.HostVMEnable;
> -                               CalculatePrefetchSchedule_params->HostVMM=
axNonCachedPageTableLevels =3D mode_lib->ms.cache_display_cfg.plane.HostVMM=
axPageTableLevels;
> -                               CalculatePrefetchSchedule_params->HostVMM=
inPageSize =3D mode_lib->ms.soc.hostvm_min_page_size_kbytes;
> -                               CalculatePrefetchSchedule_params->Dynamic=
MetadataEnable =3D mode_lib->ms.cache_display_cfg.plane.DynamicMetadataEnab=
le[k];
> -                               CalculatePrefetchSchedule_params->Dynamic=
MetadataVMEnabled =3D mode_lib->ms.ip.dynamic_metadata_vm_enabled;
> -                               CalculatePrefetchSchedule_params->Dynamic=
MetadataLinesBeforeActiveRequired =3D mode_lib->ms.cache_display_cfg.plane.=
DynamicMetadataLinesBeforeActiveRequired[k];
> -                               CalculatePrefetchSchedule_params->Dynamic=
MetadataTransmittedBytes =3D mode_lib->ms.cache_display_cfg.plane.DynamicMe=
tadataTransmittedBytes[k];
> -                               CalculatePrefetchSchedule_params->UrgentL=
atency =3D mode_lib->ms.UrgLatency;
> -                               CalculatePrefetchSchedule_params->UrgentE=
xtraLatency =3D mode_lib->ms.ExtraLatency;
> -                               CalculatePrefetchSchedule_params->TCalc =
=3D mode_lib->ms.TimeCalc;
> -                               CalculatePrefetchSchedule_params->PDEAndM=
etaPTEBytesFrame =3D mode_lib->ms.PDEAndMetaPTEBytesPerFrame[j][k];
> -                               CalculatePrefetchSchedule_params->MetaRow=
Byte =3D mode_lib->ms.MetaRowBytes[j][k];
> -                               CalculatePrefetchSchedule_params->PixelPT=
EBytesPerRow =3D mode_lib->ms.DPTEBytesPerRow[j][k];
> -                               CalculatePrefetchSchedule_params->Prefetc=
hSourceLinesY =3D mode_lib->ms.PrefetchLinesY[j][k];
> -                               CalculatePrefetchSchedule_params->VInitPr=
eFillY =3D mode_lib->ms.PrefillY[k];
> -                               CalculatePrefetchSchedule_params->MaxNumS=
wathY =3D mode_lib->ms.MaxNumSwY[k];
> -                               CalculatePrefetchSchedule_params->Prefetc=
hSourceLinesC =3D mode_lib->ms.PrefetchLinesC[j][k];
> -                               CalculatePrefetchSchedule_params->VInitPr=
eFillC =3D mode_lib->ms.PrefillC[k];
> -                               CalculatePrefetchSchedule_params->MaxNumS=
wathC =3D mode_lib->ms.MaxNumSwC[k];
> -                               CalculatePrefetchSchedule_params->swath_w=
idth_luma_ub =3D mode_lib->ms.swath_width_luma_ub_this_state[k];
> -                               CalculatePrefetchSchedule_params->swath_w=
idth_chroma_ub =3D mode_lib->ms.swath_width_chroma_ub_this_state[k];
> -                               CalculatePrefetchSchedule_params->SwathHe=
ightY =3D mode_lib->ms.SwathHeightYThisState[k];
> -                               CalculatePrefetchSchedule_params->SwathHe=
ightC =3D mode_lib->ms.SwathHeightCThisState[k];
> -                               CalculatePrefetchSchedule_params->TWait =
=3D mode_lib->ms.TWait;
>                                 CalculatePrefetchSchedule_params->DSTXAft=
erScaler =3D &s->DSTXAfterScaler[k];
>                                 CalculatePrefetchSchedule_params->DSTYAft=
erScaler =3D &s->DSTYAfterScaler[k];
> -                               CalculatePrefetchSchedule_params->Destina=
tionLinesForPrefetch =3D &mode_lib->ms.LineTimesForPrefetch[k];
> -                               CalculatePrefetchSchedule_params->Destina=
tionLinesToRequestVMInVBlank =3D &mode_lib->ms.LinesForMetaPTE[k];
> -                               CalculatePrefetchSchedule_params->Destina=
tionLinesToRequestRowInVBlank =3D &mode_lib->ms.LinesForMetaAndDPTERow[k];
> -                               CalculatePrefetchSchedule_params->VRatioP=
refetchY =3D &mode_lib->ms.VRatioPreY[j][k];
> -                               CalculatePrefetchSchedule_params->VRatioP=
refetchC =3D &mode_lib->ms.VRatioPreC[j][k];
> -                               CalculatePrefetchSchedule_params->Require=
dPrefetchPixDataBWLuma =3D &mode_lib->ms.RequiredPrefetchPixelDataBWLuma[k]=
;
> -                               CalculatePrefetchSchedule_params->Require=
dPrefetchPixDataBWChroma =3D &mode_lib->ms.RequiredPrefetchPixelDataBWChrom=
a[k];
> -                               CalculatePrefetchSchedule_params->NotEnou=
ghTimeForDynamicMetadata =3D &mode_lib->ms.support.NoTimeForDynamicMetadata=
[j][k];
> -                               CalculatePrefetchSchedule_params->Tno_bw =
=3D &mode_lib->ms.Tno_bw[k];
>                                 CalculatePrefetchSchedule_params->prefetc=
h_vmrow_bw =3D &mode_lib->ms.prefetch_vmrow_bw[k];
>                                 CalculatePrefetchSchedule_params->Tdmdl_v=
m =3D &s->dummy_single[0];
>                                 CalculatePrefetchSchedule_params->Tdmdl =
=3D &s->dummy_single[1];
> @@ -6394,6 +6401,8 @@ static void dml_prefetch_check(struct display_mode_=
lib_st *mode_lib)
>                                 CalculatePrefetchSchedule_params->VUpdate=
WidthPix =3D &s->dummy_integer[1];
>                                 CalculatePrefetchSchedule_params->VReadyO=
ffsetPix =3D &s->dummy_integer[2];
>
> +                               set_calculate_prefetch_schedule_params(mo=
de_lib, CalculatePrefetchSchedule_params, j, k);
> +
>                                 mode_lib->ms.support.NoTimeForPrefetch[j]=
[k] =3D
>                                                                 Calculate=
PrefetchSchedule(&mode_lib->scratch,
>                                                                 Calculate=
PrefetchSchedule_params);
> --
> 2.42.0
>
