Return-Path: <linux-next+bounces-9688-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D565D3204E
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 14:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F7D130021DD
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 13:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D0F238D52;
	Fri, 16 Jan 2026 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ny8HXKCz"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D1913C9C4
	for <linux-next@vger.kernel.org>; Fri, 16 Jan 2026 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768570884; cv=pass; b=lMNyvnekhJyAcz44f5L0azjhYuxtmJA+pl+5o253VJX0FoQi6ToQlsL6f2FDsA0LAHiAwXXUTygAnTmcLR6Prmre3juOm9xn9/CDp5/p8Uxqjq4T06fOa8mO7Z7xptzy6HFJy0HkJH7KCOMn0rQ6gtPy4JpgZZCdbaCxvuxtRg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768570884; c=relaxed/simple;
	bh=1RdzLPVxDayGDddb4UlPg2/LDks/LLTJwBVmXfr7xhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PWgJ+bCHww9+9b3jFwNmfq7QghQnz736F4SfCvgbZS5B6+RwqKFV2loEOSRUpu61cUXvF07khUWi2Dpp4Sp1WH3Ef3buXH1HznIazOzOXbh5drjdI3ADr8xXA5cbrH+V2T2Jo2epOuJtXv7m07/NZNUnYFXq8+JrbJaL/Ex6SH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ny8HXKCz; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b07583340dso252249eec.3
        for <linux-next@vger.kernel.org>; Fri, 16 Jan 2026 05:41:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768570882; cv=none;
        d=google.com; s=arc-20240605;
        b=gASxMVJAza9IelyORY661z1qNyGiXE3xhpKJgyst0ROvH3fNDJ9oHhT9RXtqr2oZLH
         yJHib/pldfM/icrvWp0+yyj9Rywr6sUukNE7GMzG/gCqEn2Ru+R0jysYBi19P922pB66
         661UNpEEcaureC2lV/Yty7qdtaCFYZ3eVg7m/Bw4EkHMMBAqQLElWFAHgAnlfKWMQ5r2
         +3uS3adE5675ZnxCn4U3Orj6Og8iVZ2W04XqntQtrPbSjRUEI1H+qEs7Uc0bXtY8SdVu
         Uo06b1CoWoliOCrXDiwwO+Cclaz0awj8GazrtrM1KX6k4VaF0dZYhlR2NdIszbmBpURt
         4IPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V9y0UWsoVgW4iFoQSPXpGrGQ5oYYFK8IA01Itqi8rDU=;
        fh=W66fjFksbW0Awnz7WTzCypgdFX/Gmjj1boYNMtDQKy0=;
        b=I5268EsXIDkO8Dh1vR7dRRfpj05HjhiOW18U+IUkkUJYZyAXXw6Ksl6ilJqvW7vdRm
         FWxLS2RGGjx9JpyJ0Zq/JlMAJTr/JeeihyuF5a9odbFUkCMxiVu/YQFbTa0TAEVk136A
         4Xrabbt3S6jlUQBFo3oHy4eAYq07/sCF4C0xSb1WqsItM39QF2trxWiv04DdlTFGmcWw
         uBZiPg14EM6vEQv1KvcVopvnos48FQBeklJsxwLPdaBBGrv0JlNlpJp7vnKEh4iN+alk
         l8YCRzk20vr1J1+q42mq4BtEV1AiRT4hMqSnxFd/EOLU4h4X61QcVij35sy5VyE6W0oV
         ZQMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768570882; x=1769175682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9y0UWsoVgW4iFoQSPXpGrGQ5oYYFK8IA01Itqi8rDU=;
        b=Ny8HXKCz2KKWEnMtPSL9eqXD7N6sqJl7xQk7WzTKM9nqwXb7q2XG+qjqPICDgDpgeP
         n1EoK9cBFeyA5NXGjDembwhWKywAYXOj3onaqN7ZqzaS52LKOSW9BkG7Px4RhB5uvY30
         hOdXd1G8pbM1BGubucoISttvGRFBm20EZhDFN8IjDDtllNu1WxLZP6Qv/1RSAYHD+dZE
         Oh8ERtXQl0igyWQE523f8Q3s9hjSylfTBwqxsl8jXvlbR9/DTe8zdsyOiOtv/8S0ZSVS
         4MV8w4U+fBLKFSD2X4U1Qnkg8l6/ZBQKhychazPi++aT8z0k8+fHFpeD7yPfyiYymFNd
         XjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768570882; x=1769175682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V9y0UWsoVgW4iFoQSPXpGrGQ5oYYFK8IA01Itqi8rDU=;
        b=gyvRUESQ5rud1tWmwUTkYY8am+G+/3Rq3VTsSnMN+OzAGLxkHKifB8kz0FwoRUak60
         P9x/AI0AcFo2au9X6d0w56w+WBuP3vckGSYyDsYdTC7uWgcrafd8pqMBBjYv2TnKpF8q
         gJ4uClrgrEQV7C/3Qg4q0s9bgIxSJCkt40CnWS20jmYhkDs6pXwGUVu0+h0+gW3ncndf
         A8ibAYHHnzF9pZRjaic45RB75FDJT3m6l2WZAKS5PDJWSZEPgP2rLnDMQwboOAOWv2nL
         PuvvICTRKnjvsCh87rGeJxpNvUNiEdvnDayyyWyrrFx1PVc4OFZdda4v001FDGowrzJJ
         7knw==
X-Forwarded-Encrypted: i=1; AJvYcCXTjQE94SjWxGYOPRymupBOo5MokTWWchBguk+2kkaXiwKVlwVDXgbR8kA2YQe2ivxqwrdXpc7kWOzu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8omVdlsEzCV98ou2v6UmdTqB6DlRbZS+qze7udCUDoyCuFZP+
	T84+9P7MVJ3W4LeicHnWwnGp+m43eZKeR/XI6MPX7zqdT6uqlmiYhL4BD2SOuj8AtRpV1d0142v
	IF0AdwJE445czwLVjfJ0vVnj7ic1/MBUrUA==
X-Gm-Gg: AY/fxX7vC5gurtPJ/09kCDDh2pDM7ifl7xlU7Zi6iO7Q2hN2AZVDJwqOgR4tAP/bjJf
	DYHeXUsQWfRNqPEmXH8lsTpSpD7XypBQV2FwnlVGkqWdPU0LwFt7U9mLE9Jb2d4cvSoXq8D49Ej
	8hxNc/+rylKbvEezfEoRHohO+0q/c/8LdAC7kWJRsPPgQKio68QiFJBvMXzeeAqJ9tsZMQD+RBr
	iOTnbhnDtd9n8EiEpxJo2Dk11qN99pYRg4L4/OeGsPC2FBvrwVQ+9ld9dQhW8YpOBCcXpbs
X-Received: by 2002:a05:7022:e11:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-1244a7108e6mr1630698c88.1.1768570880647; Fri, 16 Jan 2026
 05:41:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d681a658-cc84-48f5-beb6-2a327a355079@sirena.org.uk>
In-Reply-To: <d681a658-cc84-48f5-beb6-2a327a355079@sirena.org.uk>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Jan 2026 08:41:09 -0500
X-Gm-Features: AZwV_QggKEgzMJm66Yn9mIem55VKSHck6pdk1h1L735LzyyC23YF3DYEnzr4BVc
Message-ID: <CADnq5_Msqi0Gno2Rph9PC+FRA40zDmiqL-T9MmFHaVe1yLMm8g@mail.gmail.com>
Subject: Re: Many Fixes tags need work in the drm tree
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>, 
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 7:37=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> Hi,
>
>   0288a345f19b2 ("drm/amd/amdgpu: Fix SMU warning during isp suspend-resu=
me")
>   155a748f14bc0 ("drm/amdgpu: always backup and reemit fences")
>   16b5ad3195247 ("drm/pagemap, drm/xe: Ensure that the devmem allocation =
is idle before use")
>   179176134b535 ("drm/amd/display: Check NULL before calling dac_load_det=
ection")
>   25314b453cf81 ("drm/amd/display: Apply e4479aecf658 to dml")
>   563dfbefdf633 ("drm/amd/display: Reduce number of arguments of dcn30's =
CalculateWatermarksAndDRAMSpeedChangeSupport()")
>   5c5189cf4b0cc ("drm/amd/pm: fix wrong pcie parameter on navi1x")
>   72aee5f70ba47 ("drm/xe/svm: Fix a debug printout")
>   7edb503fe4b6d ("drm/amd/pm: Disable MMIO access during SMU Mode 1 reset=
")
>   a6ea0a430aca5 ("drm/amdgpu: Fix query for VPE block_type and ip_count")
>   b20b3fc4210f8 ("drm/amd/display: Reduce number of arguments of dcn30's =
CalculatePrefetchSchedule()")
>   b5179dbd1c147 ("drm/xe/guc: READ/WRITE_ONCE g2h_fence->done")
>   bb5dfe2f5630c ("drm/amd/display: Add missing encoder setup to DACnEncod=
erControl")
>   cdf6e4c0cdab1 ("drm/amd/display: Correct color depth for SelectCRTC_Sou=
rce")
>   dc135aa73561b ("drm/radeon: Remove __counted_by from ClockInfoArray.clo=
ckInfo[]")
>   fb62a2067ca45 ("drm/amdgpu: don't reemit ring contents more than once")
> In commit
>
>   6ef93f62533e4 ("drm/amd/ras: Reduce stack usage in amdgpu_virt_ras_get_=
cper_records()")
>
> Fixes tag
>
>   Fixes:
>
> has these problem(s):
>
>   - No SHA1 recognised

These are cherry-picks from -next to -fixes so they refer to the
original patches in -next.

Alex

>
> Thanks,
> Mark

