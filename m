Return-Path: <linux-next+bounces-9334-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9963CA3ED0
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 14:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4402331354C2
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 13:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A471D2EA73D;
	Thu,  4 Dec 2025 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzIJCIZp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2E8338598
	for <linux-next@vger.kernel.org>; Thu,  4 Dec 2025 13:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764856191; cv=none; b=dGjvIDYcwN+1/ArmstttQhLbnyo6GuyCcNPDEdnRe5oJ3wVqi255OeAozxHSh9gWMgp4lq/4CuC0KbuYHZiqSG0GXvK/hRiF586S4Od6dIbvsMTrTg04UrXIDjuyxCaemj0ZhsqFGrP4qoMCrq2vhYc+tJvNCBZmAO77f3S9ggU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764856191; c=relaxed/simple;
	bh=WM1JHRfkuYFIsgCP5MeQbsISRu+6siubghR9kPgtZDk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtpz4Fn3RmRIQv+dGrDoGi8rI7zXv4n6WJ4W1rlaaOE+sKhqT84/2GfEMJeKqUayyCbNNGajq7Wn6WnZTN13VhWmcGbTEmLLYTitxX0OSdPva+S7Yy96Ctp6IQROi17YZymvysmi3nkx4ciyEPiSLo1oshIdXZKrWCkHejrtIEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzIJCIZp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29806bd4776so1623505ad.0
        for <linux-next@vger.kernel.org>; Thu, 04 Dec 2025 05:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764856189; x=1765460989; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdWV4Re1SY9QcxnXCLkZ7LWipPGMDurlrb8DG6EXDxY=;
        b=JzIJCIZplR7TUC7gM7tUF2O92sNkANCkyP68Jr6dIZv4OpRKyf3HjAoM+0gQDg8gOy
         yWreBCygwaXE2W+yn1nrTb0/lk+Mpum51VsCrj0Khnpg1ysQybQys2PO5CniXMAftFIH
         /FVCCkYDtF6Uw6kj4h8n5Xl317EUAkNMCCLbC/8jMpsNV2y0pu21UX2GKk2wg2hb8E0m
         H4pmppwhczO4QUjSoT2YRLZYjxWEqyCh4iLQFRFjLXwKbu2hxlBmh+ZRHqWfdL8jwyQH
         Uq7AmU8MPjaJP2c4qZk21o9OcCHh5kCLfyZrzFGl6g1ixhg6agocKngjO4cgTp5xKP+o
         jnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764856189; x=1765460989;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wdWV4Re1SY9QcxnXCLkZ7LWipPGMDurlrb8DG6EXDxY=;
        b=FcAmT3bgMLdPMXlx//xk9hpdC0YvTuehKSSNsXnebFIGkkZNcASjMvTmb3/y2Dj85v
         frdn9LfolohDZhfAdYA085lERQzFFhChK4SZmUG5hKWBJEFm2EepEclFFfKT7D1CM0YI
         om+QxDo/E80eykxHYGDDCOitAvSvqcq13BxfcvJpyk+DbeTQ/MP8R8kE2KQscp1CdET8
         9O5RgkEShbeHVtfQyXNk1h2qsSjeCV2sekC7ob5belVVwjN8buL9S3PFrS0xILQVjaB7
         rm3q2afjPK9NZ1vLqedeDRpTDhBZpNJAVAn502YneXwPSEwzJoaJq6DB0CqNdm/Qcv4G
         2anA==
X-Forwarded-Encrypted: i=1; AJvYcCUgKCY8fws9Z+Wv4BK82TTUXC/lDIxYz1izp5fDWF5QWWfdLXLZe7BkY44pfhF/EWa4rACwtQmDvbnW@vger.kernel.org
X-Gm-Message-State: AOJu0YwOapaBtlnXlcnkZsVTvdz2INqVROIEQ69OBZjVDNdePILyDZjP
	d8/+bJTpb3jFpu+1XsAVDtyeT+olYp9zsS4K2GLMDplMxtSEOK8X0/7SPHYe22dR39SNZPxc7eS
	g/dejchELWXQncPQwusu//ro4Ehjc9to=
X-Gm-Gg: ASbGncs47q5V+07dNGfQGku6v9mnETFvYxtdpmB/1J/EdW2UYK464ULbRrn07oA8Cd+
	aST5ffke6dx7ozd3m4MvimgU2k+ni/jbmtqaSl3/HssBqU5/IwVtxDxnOmHJHR4JCxV69f5flIH
	V1FQfSmPL9ftPPpwCC0q1OVGsqnHvkhxYGD3BAWHTdI2m2GV50GHzaU/SsG9Hu9qtqFdYRmr6CF
	xIPQXNOHoYUgTXFo49JgBFkpEvfS5MvayEKxIQjyMM1cUwSKuFaazMRmO4L3ZiLpQznDsg=
X-Google-Smtp-Source: AGHT+IFxdki9GbCTOvuoSunYUO0o90gpKWKnFKiWPWhGOxLM/khL1a9ZDNJDAF4SDYPXDIwNrLL/4dLfW9fn272wzRU=
X-Received: by 2002:a05:7022:529:b0:11a:2020:ac85 with SMTP id
 a92af1059eb24-11df259c23bmr3838910c88.4.1764856189004; Thu, 04 Dec 2025
 05:49:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204152403.256c135a@canb.auug.org.au>
In-Reply-To: <20251204152403.256c135a@canb.auug.org.au>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Dec 2025 08:49:36 -0500
X-Gm-Features: AWmQ_bn22CF2LvWBRjyDSbLcam9oWzWu7D1le52QCfU-h_TplQ3U2tgHYs2p0qM
Message-ID: <CADnq5_NfkTC0tST=VorQLM0RysNuaW9Hyb8EQS7gYUUecYXvVw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Ivan Lipski <ivan.lipski@amd.com>, DRI <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 11:24=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the drm tree, today's linux-next build (x86_64 allmodconfig=
)
> failed like this:
>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4026:13: erro=
r: redefinition of 'are_sinks_equal'
>  4026 | static bool are_sinks_equal(const struct dc_sink *sink1, const st=
ruct dc_sink *sink2)
>       |             ^~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3935:13: note=
: previous definition of 'are_sinks_equal' with type 'bool(const struct dc_=
sink *, const struct dc_sink *)' {aka '_Bool(const struct dc_sink *, const =
struct dc_sink *)'}
>  3935 | static bool are_sinks_equal(const struct dc_sink *sink1, const st=
ruct dc_sink *sink2)
>       |             ^~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4058:13: erro=
r: redefinition of 'hdmi_hpd_debounce_work'
>  4058 | static void hdmi_hpd_debounce_work(struct work_struct *work)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3967:13: note=
: previous definition of 'hdmi_hpd_debounce_work' with type 'void(struct wo=
rk_struct *)'
>  3967 | static void hdmi_hpd_debounce_work(struct work_struct *work)
>       |             ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:3967:13: erro=
r: 'hdmi_hpd_debounce_work' defined but not used [-Werror=3Dunused-function=
]
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   c918e75e1ed9 ("drm/amd/display: Add an HPD filter for HDMI")
>
> merging badly with commit
>
>   c97da4785b3b ("drm/amd/display: Add an HPD filter for HDMI")
>
> from Linus' tree :-(
>
> I have applied the following merge fix patch for tosay.

The resolution is correct.

Thanks,

Alex

>
> From 1be223e7e9978a416cbdb835ea283da95abf7b58 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 4 Dec 2025 14:43:35 +1100
> Subject: [PATCH] fix up for duplicate commit "drm/amd/display: Add an HPD
>  filter for HDMI"
>
> merging badly
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 91 -------------------
>  1 file changed, 91 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8b43d49dffcd..740711ac1037 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3949,97 +3949,6 @@ static bool are_sinks_equal(const struct dc_sink *=
sink1, const struct dc_sink *s
>  }
>
>
> -/**
> - * DOC: hdmi_hpd_debounce_work
> - *
> - * HDMI HPD debounce delay in milliseconds. When an HDMI display toggles=
 HPD
> - * (such as during power save transitions), this delay determines how lo=
ng to
> - * wait before processing the HPD event. This allows distinguishing betw=
een a
> - * physical unplug (>hdmi_hpd_debounce_delay)
> - * and a spontaneous RX HPD toggle (<hdmi_hpd_debounce_delay).
> - *
> - * If the toggle is less than this delay, the driver compares sink capab=
ilities
> - * and permits a hotplug event if they changed.
> - *
> - * The default value of 1500ms was chosen based on experimental testing =
with
> - * various monitors that exhibit spontaneous HPD toggling behavior.
> - */
> -static void hdmi_hpd_debounce_work(struct work_struct *work)
> -{
> -       struct amdgpu_dm_connector *aconnector =3D
> -               container_of(to_delayed_work(work), struct amdgpu_dm_conn=
ector,
> -                            hdmi_hpd_debounce_work);
> -       struct drm_connector *connector =3D &aconnector->base;
> -       struct drm_device *dev =3D connector->dev;
> -       struct amdgpu_device *adev =3D drm_to_adev(dev);
> -       struct dc *dc =3D aconnector->dc_link->ctx->dc;
> -       bool fake_reconnect =3D false;
> -       bool reallow_idle =3D false;
> -       bool ret =3D false;
> -       guard(mutex)(&aconnector->hpd_lock);
> -
> -       /* Re-detect the display */
> -       scoped_guard(mutex, &adev->dm.dc_lock) {
> -               if (dc->caps.ips_support && dc->ctx->dmub_srv->idle_allow=
ed) {
> -                       dc_allow_idle_optimizations(dc, false);
> -                       reallow_idle =3D true;
> -               }
> -               ret =3D dc_link_detect(aconnector->dc_link, DETECT_REASON=
_HPD);
> -       }
> -
> -       if (ret) {
> -               /* Apply workaround delay for certain panels */
> -               apply_delay_after_dpcd_poweroff(adev, aconnector->dc_sink=
);
> -               /* Compare sinks to determine if this was a spontaneous H=
PD toggle */
> -               if (are_sinks_equal(aconnector->dc_link->local_sink, acon=
nector->hdmi_prev_sink)) {
> -                       /*
> -                       * Sinks match - this was a spontaneous HDMI HPD t=
oggle.
> -                       */
> -                       drm_dbg_kms(dev, "HDMI HPD: Sink unchanged after =
debounce, internal re-enable\n");
> -                       fake_reconnect =3D true;
> -               }
> -
> -               /* Update connector state */
> -               amdgpu_dm_update_connector_after_detect(aconnector);
> -
> -               drm_modeset_lock_all(dev);
> -               dm_restore_drm_connector_state(dev, connector);
> -               drm_modeset_unlock_all(dev);
> -
> -               /* Only notify OS if sink actually changed */
> -               if (!fake_reconnect && aconnector->base.force =3D=3D DRM_=
FORCE_UNSPECIFIED)
> -                       drm_kms_helper_hotplug_event(dev);
> -       }
> -
> -       /* Release the cached sink reference */
> -       if (aconnector->hdmi_prev_sink) {
> -               dc_sink_release(aconnector->hdmi_prev_sink);
> -               aconnector->hdmi_prev_sink =3D NULL;
> -       }
> -
> -       scoped_guard(mutex, &adev->dm.dc_lock) {
> -               if (reallow_idle && dc->caps.ips_support)
> -                       dc_allow_idle_optimizations(dc, true);
> -       }
> -}
> -
> -static bool are_sinks_equal(const struct dc_sink *sink1, const struct dc=
_sink *sink2)
> -{
> -       if (!sink1 || !sink2)
> -               return false;
> -       if (sink1->sink_signal !=3D sink2->sink_signal)
> -               return false;
> -
> -       if (sink1->dc_edid.length !=3D sink2->dc_edid.length)
> -               return false;
> -
> -       if (memcmp(sink1->dc_edid.raw_edid, sink2->dc_edid.raw_edid,
> -                  sink1->dc_edid.length) !=3D 0)
> -               return false;
> -       return true;
> -}
> -
> -
>  /**
>   * DOC: hdmi_hpd_debounce_work
>   *
> --
> 2.52.0
>
> --
> Cheers,
> Stephen Rothwell

