Return-Path: <linux-next+bounces-95-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF82E7FAD82
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 23:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6DD41C20BBF
	for <lists+linux-next@lfdr.de>; Mon, 27 Nov 2023 22:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2998F48CEE;
	Mon, 27 Nov 2023 22:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tup13n66"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18EA2194
	for <linux-next@vger.kernel.org>; Mon, 27 Nov 2023 14:34:16 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5cc69df1b9aso44911347b3.3
        for <linux-next@vger.kernel.org>; Mon, 27 Nov 2023 14:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701124455; x=1701729255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vGzcsQmOQggKxvH47Tmuwqz8+t2HhA4WbAiv2DPY8Y=;
        b=Tup13n66O9ybNB8tN3x5gGXIu7nvBtq3nAYgj9xR8bjjQJCxmG9Q38Tr5xqhaAZHQZ
         nVtCsPOVRd7TzceyX80w/H+riMTnXMk/PcE5Mgvvw8AXV1j6rwOvMjchP6sNvbc/OlaX
         lRdxu+KEYgg/EAqUwezXN7lk9QyxnEobDdGVzlYpAJhcpOvM3BtxwdPcDI5Oua7EPnkf
         j0GQWA7tXyLMfQKPukALS/6A9lUaRXfNHOPtt7fINpBBiGbX56XJvSzqCGuNler8pkzU
         OlEZAEM6IxP3th9koqTkifCoG0bh/Jc+cjqonm+k2Mu8vCSl7wyx1DCtMqdhMeZklh6b
         y5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701124455; x=1701729255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vGzcsQmOQggKxvH47Tmuwqz8+t2HhA4WbAiv2DPY8Y=;
        b=aFCmdzOeq/+DVIz/+XAzZaokBRaJJJWzVHB7Y5Fj7BXzeBROca8b8/dheDvmzEo2oi
         jvflOvpKfiBxeJkixk6r3PVVHckJCs3GKKpAW6PhBof/lan+HAsZRqxvm47G1eLyR7uI
         ok9Sq8ZeuBqw60G3bSkdy5Z/RIiAjCrVFADeiGLjx/jpIug3gXLbAnr862nCmK2osALh
         8LwgR9RQkk0fb+cDTiA377f9Lz2mTekF7KTb7XGNsnHLZeY/mYW2RT9/kjEhcHS0kshg
         5mnfEuog3ydZo7Oht7Rhe3HSOE2Wh+UlZywNwpM4itdsl1laHT9kWpTYeCcfgPRoUagj
         ngYA==
X-Gm-Message-State: AOJu0Yx+6H0r4t3DooOaVCHX/eTeWbXUGQjLX708RMq7Y67OIHLvHXCH
	ddXZYH2ga8cCQD+8VQNjsn+Lr3J7adzVFKVlINLyLA==
X-Google-Smtp-Source: AGHT+IEYWPEuZyZ69QjYMb0/vc3v6nEVmOOn24SzLtwWBbFeT4Ij5VfP4VJMQXY3IVaHPqBsT/A9Cy+DjHMdZR5nfa4=
X-Received: by 2002:a81:ac5b:0:b0:5d0:b0e7:929e with SMTP id
 z27-20020a81ac5b000000b005d0b0e7929emr3605101ywj.42.1701124455238; Mon, 27
 Nov 2023 14:34:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231127051414.3783108-1-victor.liu@nxp.com> <20231127051414.3783108-2-victor.liu@nxp.com>
 <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod> <2023112739-willing-sighing-6bdd@gregkh>
In-Reply-To: <2023112739-willing-sighing-6bdd@gregkh>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Nov 2023 23:34:00 +0100
Message-ID: <CACRpkdbZvUMy7PzqnPSsM+SmMv5Z0mnVq_GU9_9HbBWXkg21zA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to modules
To: Greg KH <gregkh@linuxfoundation.org>, Liu Ying <victor.liu@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>, rafael@kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, 
	sfr@canb.auug.org.au, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	angelogioacchino.delregno@collabora.com, ulf.hansson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2023 at 7:20=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:

[Maxime]
> > So, a committer just applied this to drm-misc-fixes without your
> > approval.

That was me, mea culpa.
I learned a lesson. Or two.

> Wait, why exactly is this needed?  Nothing outside of the driver core
> should be needing this function, it shouldn't be public at all (I missed
> that before.)
>
> So please, revert it for now, let's figure out why DRM thinks this is
> needed for it's devices, and yet no other bus/subsystem does.

I'm preparing a revert series back to the original patch causing
the issue so we can clear the original bug out of the way, take
a step back and fix this properly.

Yours,
Linus Walleij

