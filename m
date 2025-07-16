Return-Path: <linux-next+bounces-7587-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A741B07D5E
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 21:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 577C656184E
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 19:08:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EDA62882CB;
	Wed, 16 Jul 2025 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dpZpjwh3"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3203263C90;
	Wed, 16 Jul 2025 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752692928; cv=none; b=F0G6dBXFwQ4167PAouzT1g32BpWsFqMbesQl/xrirxGMyMSnZZrIyqJcT3CopuhiI1RoA/FF1pCu3Dgr2ZAJoXgvipdMMLrF9Ifdzi0Z3iDfP4oFckm0SY4OaueDLH+MyqciEqXUDn6T4HFfRZviQE++vRsokAwK0IPdKFc0d9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752692928; c=relaxed/simple;
	bh=qtAjB4Plpt3Hf4kcMfFv49abgWUs2ExTbuyP9SyArs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RlGhsX/phpUzKyRuYNEVdpC/Y4ro87z0y1iePZfn4vMmVhlAInHDMR83LZKNl5xNzNJKZVdPqRlv98Edgj8lywy/HR7V/WY1NpTAztyVhQwFkgrBnOF3UC7jog/IL+NzlsUlFY6qh31e5i9iPBpP1m6Yv4enhtotE5Z3Urpzv9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dpZpjwh3; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-31308f52248so49611a91.2;
        Wed, 16 Jul 2025 12:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752692926; x=1753297726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hALiMykJN8PH47gwxG1Vb+As3K3sYoOquABDIk+TYo=;
        b=dpZpjwh3PpP5QpL9APn1I1E82lnpEk0Hwux3HGFWfqa4Qf1Vdt33eKuLsQUQMjfxTw
         r/AiKEtHcVIZUVn/WrTtDkLOj1RK/lBTazZzo/466EnBHbiU34XYJWB0S76jZ5aNUQ4f
         fdt8og5SlXcIHXWTFzQzNBUx8WKkVSPnIUQAxzvgW/mD2GU9xQAyOGeofu2RBqzyqkkI
         L5tPxWVg9fDiuINO9lZAVlOYozXzYz+ecg9JqNOkd9GFWpEe1/EkaRfxK58XCHDhD5cO
         XDsRKoe5aWkY/N4r6gLFkeH3jtRUyp9stGXNcpArxkTVrOVzwOpQGOKAbWmy7EPv7/bx
         fTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752692926; x=1753297726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hALiMykJN8PH47gwxG1Vb+As3K3sYoOquABDIk+TYo=;
        b=rhwVzNqlVw0f2fD0kRNs656pqT8jZVtXdZwUJUENpuXVkvIB/mfMMSDMH6AkMgwhgP
         wcxVAZ6papizRzquv3rnJcONbXw40msUd6i+U/E+D365JTq6JhecsvI9m7e/HXtQfTTh
         Rq/aVs0b+Ti41YZ6zW+KyaOU9Fk6810h1SmxBm9bRsUslj5wEtouG25ZVgLoiQ8Sae60
         7XGwaFiubPlDKEqdJceP9+rfJFUprvhsO6E0TTnmdEUAiO3TJaNObZsDidXOB6R92rcr
         HxP+0d390nghinTvDVIgLLkdZEpuQ6OYV11c+RI3FPzXfA3cniUmjGvDUAW0IgvvDgxp
         ZE7g==
X-Forwarded-Encrypted: i=1; AJvYcCVv57OxsoWK+2IvFA7CYqSlzDU4B51V/sPwaRSI+cwouXEzwRi5SIwg/+f4Pb6jq1LnDNV+NmDxeZ9fDMY=@vger.kernel.org, AJvYcCXdgske4jFBQVwBUk/mh23z2Y99DoPAZJJIyBxYjWPCD+LaRDwhYVYUm+l5r/zF1t6ExXh3r9qn9LAe8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YysHuxhGgmwvGAUth5/jsHvOz2HPyomVWSUzMwDvyApfKVFFCyr
	xj4k+Yg0zCgIn8Nx1O/PIfHyQA6b3zjhchGfxgmU7aqoVQOznuspVxq+J6iHXTayiUEzVfav2X7
	3EaXOE5NC1o1mv0kj9Y+u61GHK8nn3Q0=
X-Gm-Gg: ASbGnctZhXxsK8giQTyD7Rz4cA2BWtAggvo06+KiNPgo130xxw+0BTByY7SZ02UFRWr
	H4Q5QEfO8gqVc7SmAqGahp01oWsJwBK2nK9N7rK2HPpWFKIf4diBhRp5oylB8UrowDnJCBEXDfA
	4rAInnTY0rdjtw3zCx/GwFUzv5PFkP1bG8vwR1XSdQV2iTgrJWaIpFj45uHbcvcbAH0EYvkDO2P
	cHbR0q/
X-Google-Smtp-Source: AGHT+IHgGs4v+ff0vXhp2Y64XJ5oOnu9rkpwrIlffN8NjwsfmZ/ZExAv6LDrRInaDSnrnUqQ14ObCdXFH89OS8wwoIQ=
X-Received: by 2002:a17:90b:5610:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-31c9e6048aamr2779048a91.0.1752692925819; Wed, 16 Jul 2025
 12:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250716202831.68661f12@canb.auug.org.au> <IA1PR12MB6044F52C3C58284B49DD77DCE356A@IA1PR12MB6044.namprd12.prod.outlook.com>
In-Reply-To: <IA1PR12MB6044F52C3C58284B49DD77DCE356A@IA1PR12MB6044.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Jul 2025 15:08:33 -0400
X-Gm-Features: Ac12FXw2TDwWP7X1lvxcVFBe7fjGXPhJRxyVAD1UO8MRk_Auivm2YVKiOHK1ZIA
Message-ID: <CADnq5_MUdC_odm9LM09V31=KW+Td64PkodmvS9VJuFv0e=3w4Q@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
To: "Zhu, Yihan" <Yihan.Zhu@amd.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Hung, Alex" <Alex.Hung@amd.com>, 
	"Deucher, Alexander" <Alexander.Deucher@amd.com>, "LIPSKI, IVAN" <IVAN.LIPSKI@amd.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	"Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 2:45=E2=80=AFPM Zhu, Yihan <Yihan.Zhu@amd.com> wrot=
e:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> Hi,
>
> +Alex Hung +Nick for awareness.
>
> Thanks for the information. I believe Alex helped me to add the descripti=
on in another patch. Please let me know if any further actions from me.

Has the fix been sent out yet?  I don't remember seeing it.

Alex


>
> Regards,
> Yihan Z
>
> -----Original Message-----
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Sent: Wednesday, July 16, 2025 6:29 AM
> To: Alex Deucher <alexdeucher@gmail.com>
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; LIPSKI, IVAN <IVAN.LI=
PSKI@amd.com>; Zhu, Yihan <Yihan.Zhu@amd.com>; Linux Kernel Mailing List <l=
inux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kern=
el.org>
> Subject: linux-next: build warning after merge of the amdgpu tree
>
> Hi all,
>
> After merging the amdgpu tree, today's linux-next build (htmldocs) produc=
ed this warning:
>
> drivers/gpu/drm/amd/display/dc/dc.h:255: warning: Function parameter or s=
truct member 'num_rmcm_3dluts' not described in 'mpc_color_caps'
>
> Introduced by commit
>
>   26ad78fffc66 ("drm/amd/display: MPC basic allocation logic and TMZ")
>
> --
> Cheers,
> Stephen Rothwell

